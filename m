Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EABED75BB6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 04:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gq+ad7sZfGrLxQrmLaPQvEe+2stpRD0g+Leamoq1YOQ=; b=WnMcGbK5CQaCV0
	Okvfvoh0gBRTyRpjXKI3MKC2r5KVTfaQgzfWutSe+VRwQ/S2SqdtoRUC5sfRCGbMNC0nHsr8PlpMX
	kmIh1Na9CMO63FtTW43fAbX7NoEza2L4whQHdvFBlibnsjxSNQbwHI2isX0P5tNQfeL1v/dg30Pl/
	NC8Nyz7VTAuwj5nfUJ7aF8Dczuy8jkpd/Y16AJQZZ4aq6JJze4lCcWaHxLGSnm3W/SXS/Wmsu1hh1
	XtmHj/8XHlPHe9HFIzM6y/RTO2RmwdNBqipW5YTAp9+VBdlNXh+zxBzHGCnwYRhJutf/gxqLTeTjS
	inl7BtP6B3JbX7b9nyaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDyx7-0000000GoKU-2WST;
	Thu, 21 Nov 2024 04:38:01 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDyvZ-0000000Go6c-2N60
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 04:36:26 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e387afcb162so495448276.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 20:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732163784; x=1732768584; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gq+ad7sZfGrLxQrmLaPQvEe+2stpRD0g+Leamoq1YOQ=;
        b=eSgcWFsgp4NbOqZfrhVRZlS2DrrqRl7rZhAq8g43vg2BNI8oYEaDn89iZfbu8kr9j+
         b4N2n5/4GI03COwBtjxsZ2m2lYAWFu4x6cFBC49hACmrMvPo1ohhOg//6/ypOvmlOKlN
         rev5BwyiBoenqrpjUmN9aRNchlUFJJ8bmz1oczdySoWxJWZmj9fFXzwH2dBLE3N6eerA
         7TiLnYI00DE6K09Hvsai3MJz093HWpVEvEevgCYLPo+m/cQI38xHoPnR3j7uwWZ81cU2
         b6Y1msWRyiTDEkRv4rutXt74cvqTnvr8kvBFeBH6QexIPMrzJUBfMjeyK1lrfy74zrNv
         QxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732163784; x=1732768584;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gq+ad7sZfGrLxQrmLaPQvEe+2stpRD0g+Leamoq1YOQ=;
        b=oFPr7L81SZLT4ot6ZKYN0WLlfBFYtwYO5XT4aRQVUxKh34cwNDFux18KBgIKg3tX5f
         6SxS5TLMlbO0BIiitN2VGE4d5j42kUPHEF7dKA15+4KL2YyCDiNMi7z+6HFo7GhflFzj
         UbwS/KgNgIQcrXwiHkWtEG+n72bwRIxLftY2lwarj3mkYLtvp6/8bmIPJm++HZiWofsm
         9YHpyll4mn1m1ALPsko3UUUGAZE4/SHoArpDGbIfpxKi3s8FC/X5vzZhx6iAEnhkwbpc
         iOtHfb5pSg5xX1qo7ujglrvWPqSxeD0h2i6g9PbV/1XQ4JhCotUghERwMZXPtzQJmDt5
         SE0A==
X-Forwarded-Encrypted: i=1; AJvYcCU40omsmswJO9QPA7pPm1LjI/Whz9usPR3tMhJGFoelG3x2goE3nqQsSUURig3k+R7Z5eYa/h9u6fsrHt6aMCPf@lists.infradead.org
X-Gm-Message-State: AOJu0Yyu1ClzvWZSCkwedM89/p43d5c+YJn3eNy8xszeobY1nuySMy2C
	qfMjOWgQLPZbfqomPhgkPvM2PYdmc+7Hv9ZL5jhJIqLuUbNlg4pK9vBnwQ==
X-Gm-Gg: ASbGnctFMDJ63Y0Frpx9JuOzaJcY0waamZM/U2e9RjHwOmgRwz7bYnvaisPBc9S5TWS
	kxHINlOlytBulj/Y2uQk1yzJ0IBBr2RN2Xsr+8zE89+HqFodb2e3VKzpP8zNl1J4ZlOX3Eju8Jm
	5CIz1Z1V9kVQLFuOwFMDqEa+zQRSHFgiHDigt9RFQRejm4/DqDa0Cmlm/xXoxEtaWLDjhlUOhSN
	SQMR49F0hnLGLJgzK7ssAdgALQPoiP1aP5gQwxC+leTOGTByvMrJGCDJLh0TWN/uMyZartNZ8c7
	GLVIqY5bC8k5t51lO/sFgVjMlzY=
X-Google-Smtp-Source: AGHT+IG6v9ry8rNPMTv18xrWoIOcEji23ZUnLH/q33uEBsqANBSy4agWkDZk0KmSDWfSx0CnygepHw==
X-Received: by 2002:a05:6902:18c2:b0:e30:e1f3:2a9c with SMTP id 3f1490d57ef6-e38cb3cfc5fmr6450392276.0.1732163784062;
        Wed, 20 Nov 2024 20:36:24 -0800 (PST)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbb64e11fcsm402013a12.15.2024.11.20.20.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 20:36:23 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH 0/2] ARM: dts: aspeed: catalina: revise catalina dts file
Date: Thu, 21 Nov 2024 12:34:03 +0800
Message-Id: <20241121-catalina-dts-20241120-v1-0-e4212502624b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADu4PmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQyMD3eTEksSczLxE3ZSSYl24aKqxiWGSpYG5oYVJqhJQb0FRalpmBdj
 c6NjaWgB6tcObZwAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732163781; l=647;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=381WngC8iKFV1PSpDa07H1nZ9xgbAG9Xckkdyqb9St8=;
 b=h1qEWQAugQzZbGZaOABW6eYNn/tU2euJILA3NbFag8tPDo0xTstUA80jjiwz3tvv9IZAxBccc
 fZl41CP7LWnDOZrzSz1yCjzHIZR9KIn9VwTnPzNBZU2Lrk9f8nXcu9h
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_203625_604900_636249B4 
X-CRM114-Status: UNSURE (   8.41  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add following patches to fix issues.
- revise ltc4287 shunt-resistor value 
- remove interrupt of GPIOB4 form all IOEXP

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
Potin Lai (2):
      ARM: dts: aspeed: catalina: revise ltc4287 shunt-resistor value
      ARM: dts: aspeed: catalina: remove interrupt of GPIOB4 form all IOEXP

 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)
---
base-commit: 59b723cd2adbac2a34fc8e12c74ae26ae45bf230
change-id: 20241120-catalina-dts-20241120-e341b907184e

Best regards,
-- 
Potin Lai <potin.lai.pt@gmail.com>


