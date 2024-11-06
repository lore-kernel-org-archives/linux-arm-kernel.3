Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928F4D29FBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 09:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dN34SSgBwYUCwi/Jxu+wRXh/eB3/vsROfybEBktpwsg=; b=ObP8DTOdjhswAB
	9sX3z5oGX9bDQz2V43F/vLtMZ6UpbUq5qJ9f0puhAcWqhHQ5XKMcaYJbdIcGiNXYjX6FrFr/ZxGhf
	hLaeOQXndYAFWwGSR2OjmELVpzI6ntHlych7fLIoGPdcj+ofzvZwFa1EBXmrwFzV376hj94v2NI5c
	9VSgxMrQaHutk3Rnn7shxvtsSAyCg0v9VXwTi/9akXFFC+H/RJ1p9S0/U5S2IIX6X90Ch1deZfAAI
	KvNjRpLabNW3vTmfuLZKwZatwWkSXGL2zuvRoOO847jTPoBJ45Fi743ac/h7ctUF31b7VzRFJmyXo
	5LCHAZcErQrKFoYKO75g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8byo-00000002P54-0yNL;
	Wed, 06 Nov 2024 09:05:34 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8buo-00000002O5x-1jFv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 09:01:27 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-20c77459558so54400175ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 01:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730883684; x=1731488484; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dN34SSgBwYUCwi/Jxu+wRXh/eB3/vsROfybEBktpwsg=;
        b=Qa5DF1N1uEJ2hufE4QGqBPswC8LDScZSzAdZeNK6y64LKrDbhvRZUb1NtKD6Bmu5ag
         p+snzTuEpYHVJJLGU33RhXBatJ2KO13Q4Yk+BxMHZ7gGSSAGRCkgI/7KJTBk12dMyUiH
         Q9es7cnupcx477HE6AuhjmYcoRR26DLxS+iRpNVij200UJHvgtNjlX3DqEHMzmkku8YX
         XdmnGSJVz/KZ+2T5Sts5c+JR5Sqc14V1grLVx1cRA/dr/My7kM5IyHpfX3TpyZh88WWb
         I7auhpPiBBfPl/ih7xW35w//ugVw36X3Ftuk8LzRRW+Y7sInTtn77FuM3jmfs8+z+rTA
         LxgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730883684; x=1731488484;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dN34SSgBwYUCwi/Jxu+wRXh/eB3/vsROfybEBktpwsg=;
        b=YG9DldKxgVzKK+fyPWqKav/CakM8OKzmjdiI9BuG5EXxsrVSwRsq+zUXiPytzHaTWx
         /0qkCUTSm5NE6hXxulN1Fhl096tbGllm1ozMPUc2JMa2hrCuYT6FMRrExLt0cjNoFKKN
         Kv0357RzV/sYVCYiofAfYqxFyvWv9Q90iPJdP/aiTbgL0PpMND1lCRHgbrwEkMrxhVyl
         Yv3DSTsWDNAwNE/4/U3WdTfT+LvWo+YyoMXZ+vQ7EGQFgncyEKqY5DxUOP+Us+Dm0HIx
         CuEno0hcevDGa2dfaiE9JGbcJhZrqeZvmBJvKjyhb/CoAHr8qzTRE4movQyd7dn6k+hx
         qMHw==
X-Forwarded-Encrypted: i=1; AJvYcCXoD9mjhGwBIMDfu33C2dFi/02LK9lf4eZ5XBfHiyywDYqvjZ3xNIqWFd4UmNJ6Xo/BiGu5sCZGX9HOHb2W+6hQ@lists.infradead.org
X-Gm-Message-State: AOJu0YweeiiMSnN4JC7rhD57eap20PhMKhBzPzdacVIJ3+WNCBCzYDwx
	fp6v93WF03fxemBIii202rfnBu8YTPZS9gm7g8iqDVZruqN/gepx
X-Google-Smtp-Source: AGHT+IGnkFWynLLU5/2Q69B9cDIhpvlGXMSFaoZSiGRLdCoNVTx1MDEWli01wkh9fzWNeKIA/izOUQ==
X-Received: by 2002:a17:902:cec1:b0:20c:a19b:8ddd with SMTP id d9443c01a7336-210f76f2952mr385802445ad.51.1730883684628;
        Wed, 06 Nov 2024 01:01:24 -0800 (PST)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057d380fsm91317665ad.240.2024.11.06.01.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 01:01:24 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH 0/2] ARM: dts: aspeed: catalina: update CPLD IO expander
 pin definitions
Date: Wed, 06 Nov 2024 16:58:50 +0800
Message-Id: <20241106-catalina-cpld-ioexp-update-v1-0-3437bcfcb608@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMovK2cC/x3MQQqDMBAF0KvIrB1IQijUq0gXQ+bbDkgMiRVBv
 HtDl2/zLmqohkbTcFHFYc223OHHgdJH8hts2k3Bhei9e3CSXVbLwqmsyrbhLPwtKjsYERrdU8I
 CpR6UisXOfz6/7vsHoiqHUWwAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Potin Lai <potin.lai@quantatw.com>, Cosmo Chou <cosmo.chou@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730883681; l=613;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=4PoFtxt4Dc071+Aor3cOXjBAyVvWgANaB9cgnRPVnao=;
 b=5pNiHn4f7T6DPb7g/9DOVkSstHqYNgW909o72dsst+ZevKNbg7fFnzKUdhkOrOXHuHdJMWbEN
 uRzgp41XATMAcio4YwxNRdvph8iuwYd/tCnNeLHisu1MY0Iaj+/OQka
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_010126_484566_90A6991B 
X-CRM114-Status: UNSURE (   7.92  )
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

This patch series updates the CPLD IO expander pin definitions of PDB
board and HDD board.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
Potin Lai (2):
      ARM: dts: aspeed: catalina: update pdb board cpld ioexp linename
      ARM: dts: aspeed: catalina: add hdd board cpld ioexp

 .../dts/aspeed/aspeed-bmc-facebook-catalina.dts    | 150 ++++++++++++---------
 1 file changed, 87 insertions(+), 63 deletions(-)
---
base-commit: 59b723cd2adbac2a34fc8e12c74ae26ae45bf230
change-id: 20241106-catalina-cpld-ioexp-update-e4ed409a2fed

Best regards,
-- 
Potin Lai <potin.lai.pt@gmail.com>


