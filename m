Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850C4D172D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 06:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7cFeh0F4AhLzGOrxCS14dOc5yv3VBPRg4l3srErLLzk=; b=vS2E710Z1q7UVh
	rEmszjhrVbFRXBwjWVZAllO1YsnZlPJCBcxf6Jt0tetc23e+cWbZtPKp/WsceKU1S8NyCGwmr4Cab
	wmcmPT8LEJa7ZjDWGCLaVEO3WPpynxNWxgw5hGKlks2W1xmaK/dKo6nVUuyQRcxo882vehRaaT2yU
	j83Bn1JfnNuzPqRnfiTHoMQyQS8mrPSNFdxkCk1VKqQDZ33afH4k3ZtkBeD5N/W+edceO0Vmv69Wp
	GZsImX7+PjeklEpRtp2/caPEAvPOxFF0f9HheESeq+v/P/jXhKZBab8k5sZC8htU/wIsz+csQbeji
	l97yGRrbXSn17Id1LrPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmn4J-00000004UQt-2Ia7;
	Mon, 02 Feb 2026 06:05:51 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmn4H-00000004UQ7-09ZL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 06:05:50 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2a8fba3f769so5800595ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Feb 2026 22:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770012347; x=1770617147; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7cFeh0F4AhLzGOrxCS14dOc5yv3VBPRg4l3srErLLzk=;
        b=UybF8H5oQJVFcgMntr/qn8Bb9iB1Wpj1Jq6mIvKVP3f5OhqpB/fZL53QSHPTErYubz
         f7H6Rb+P2ccAx45JE6+AblwPnS8nH2f7KlPqORTRKUQtcDx+hN1L29j0PjKVIUde/FP3
         qM5+ZNj3KaDIeNUmBXzLizq6ZRDG0t69Oys6ZCIvpjZ11vZ0GotQYwQyVDL3wfigy4yP
         ZPkIS7UBhXtggEE3xAn5JWgZH/n5KPXVOWcwfF7yFzSFURb5xcsvZOA4qtmj4o4T8dJ1
         DiL3wfvJ9DR6MtUd31w2JU560/2l0bR8uzAvnlw5Nm4Ov7r6+94bSM0EJVbX/qQW4wPF
         8Vag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770012347; x=1770617147;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7cFeh0F4AhLzGOrxCS14dOc5yv3VBPRg4l3srErLLzk=;
        b=efGJeD0eQH59agB2wh1voVAfCx9ggE+yAuNpzQV5spep8nN4NcDa4PKTqzUorrNJnU
         LLaff2z+hiONhcelS0vC4gaowAs62r69gGStMRQ+0oa7eNVSUvhqB+5z9Fa3Hjh1COek
         WrAtIq0Jj1HP3m4hXZURyecWFpqjo2t45U3/sTwZHr5GCHdK8N4NJcMT6RqEALS/uqIK
         WVlyazgnGvpWQo+XdgHk5x3R9kUkHu9G+neSBvVAbZUYlOGSxlAwA8rZEQlSUBJjR9+o
         sKzzLlbXLqUTOe4dH/dCcJ+a39sWQszrDQMR5NgFW+/9+VvVhjuYCPgMxzvp74rlTn6C
         zTKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWawppC39tS0s4jSiNrbxVrrTqNSQ/bHQOqiY4MDXzyCJU93HJGS5OEUO53JD0BZKmV93mms2Lr7wJx/7Nbbpd3@lists.infradead.org
X-Gm-Message-State: AOJu0YxPOHIh+/JHgg/zGM/c1iCGtSo6FqYcTRoMUkFdSDKKwNNGHlOw
	5kpircQ9OFpw+aobEjDFenbrdmBgfKXZsimWBErNS4HzXhlCBKv4143As5a1xA==
X-Gm-Gg: AZuq6aJdVbIAsXuWGfPStsFebHhDQeJXe529e3q5WZvLBXQJ6E+5n7Q+k4ZrvfrboCN
	TNGKdIiGNIO0R49gWU5IeIspkZEa46YRflpZOs+VSRUNha4Fnij6Ki7fg3zO/RfCqRjZqFPSbx2
	L5yo46hxRruAC+ACVKFwLzgv+Eqbs2NIy/ukdRn0Q9genPDvdJPXSfFJDHOBDm9WLX/PAgYKPlr
	rQQH+dyJqD+tWqPXX6LG4l+r8VfuWVxZ8eVo6eTZYnwuYCZYTx6CrVSLP6Qo3NtzNLqwkqGIsLY
	o3jqc9sU8psQIItXASklNK7fwOFfW6dZ7UNp0+Aw3pF3fdV5aazHI039CxvBLnfMMjbET/OX3tV
	TOpwauuFCApAzmQnungYbIlbqsSi5JLukhNLRhoaiKXZPmhvw4REuv8NBPJAoI9JDhz7NtrmE9m
	KDB1IosJHEOOUnKITuGFZJgubsNXGNureN71p+vlnzjiUP2vRdky7DTcNN+8gibHg=
X-Received: by 2002:a17:903:f8c:b0:2a1:3ee7:cc75 with SMTP id d9443c01a7336-2a8d96b0b3fmr102479305ad.19.1770012347504;
        Sun, 01 Feb 2026 22:05:47 -0800 (PST)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5d99eesm132926135ad.78.2026.02.01.22.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 22:05:47 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH 0/2] Add Meta (Facebook) SanMiguel BMC (AST2620)
Date: Mon, 02 Feb 2026 14:03:15 +0800
Message-Id: <20260202-sanmiguel_init_dts-v1-0-c0023ae41899@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACM+gGkC/x2M0QpAMBRAf2XdZ6uZEL8iie3iFqNdpNb+3fJy6
 jycE4DREzK0IoDHh5gOlyTPBJh1dAtKsslBK12pBMmj22m5cRvI0TXYi2XdGDsVhSmVLSGFp8e
 Z3n/a9TF+tv5nHWQAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Potin Lai <potin.lai@quantatw.com>, Roger Kan <Roger.Kan@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770012344; l=707;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=n/w//Nuxlr+/ykO3WHyVzyFaLLe6UAbemJnx2mm0Xvk=;
 b=WdN+eQh0JqxC5Ye/37ngcek31btboBmbn5k+V4pSQgqp7f8zakKS34ssJuZjwoH8vmU3r3F03
 NItOTLQGf9SBp0ZFjAdmWh6kAve3n8zOUhbxxD8tZCEeuenYy35Tazx
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_220549_081140_C1919971 
X-CRM114-Status: UNSURE (   7.89  )
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

Add Linux device tree entries for Meta (Facebook) SanMiguel specific
devices connected to the AST2620 BMC SoC.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
Potin Lai (2):
      dt-bindings: arm: aspeed: add Meta SanMiguel BMC
      ARM: dts: aspeed: add Meta SanMiguel BMC

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    1 +
 arch/arm/boot/dts/aspeed/Makefile                  |    1 +
 .../dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts   | 1163 ++++++++++++++++++++
 3 files changed, 1165 insertions(+)
---
base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
change-id: 20260202-sanmiguel_init_dts-79cdb33c50d5

Best regards,
-- 
Potin Lai <potin.lai.pt@gmail.com>


