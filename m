Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EC2C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 16:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=otdawq32D6/5bERzoT5Rk23HrOvjEoRzM0gTHt/o2Nk=; b=EdwXKccOcsvpgR
	aaMMD5hw8l/Gk5ujLDXYD2+uj1gHIEVLRln8QFAICfD4XCA7C4yHdLnSAYWX+TpFUJwlPFynJ7noB
	yi0lopfMOOYyBrUJGJsV6C/13jNyFdXb50nJCF94tR9350GgXjHWTKktJ6naU4O/8iYmv9DuA98X6
	kfn9diaULoooZmAwSFEYWZyv5PjHMXHho3oipHdhqOLZUQZWt4xTFEhebA9KVPIfTsapKKf4XPJ9a
	wcxoENA61S2I0XO6clyNWwOtMGUlR4MHqtFZKwumR2acKcLykmxzD4dMrWNfToT2Om33bdqJ1kj72
	IgU10+Clwu/Ftfu8lY6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuwdq-00000009bHE-3JpF;
	Wed, 19 Mar 2025 16:51:42 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuwc4-00000009apC-15nv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 16:49:53 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-300fefb8e06so8906852a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 09:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742402991; x=1743007791; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=otdawq32D6/5bERzoT5Rk23HrOvjEoRzM0gTHt/o2Nk=;
        b=Pd7vNCX766KO/moLZ0kWPYcR5IFby2Jb4/PK4v/vALdxgq1sg0vF5jQfM5vXHFOcGB
         fbAJXa5Kp3GForkJeggFf6gINbSjIz8jgxQCJev29HIvQQGTYS1PLOOnbQYbNervEKdr
         b0C5d2OAiWFH3sGQokT0mrRjWwxQULqCfoxQPOnTzM5Ov0KFciqywUGd2DfHV3FUBokg
         U/WBNjtEULrLgk/5dtlaVAWrpTs/m448abgrikO42xbERRFO8UyD3oFxi33Hi2TQP+91
         XwkGgnN8woi1lS1TXeluyhzMikPpX8mjO2qCtJie07xmJ+NrHhat29iEZW+NgNELDerg
         qYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742402991; x=1743007791;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=otdawq32D6/5bERzoT5Rk23HrOvjEoRzM0gTHt/o2Nk=;
        b=sXwZjo8GPEERubtUUEWn4Mz90eFBvd2J3JX2/UO8aCdO/B+vTpGPRcz2+P2502aiEK
         3LtcR7xay3qlSYZxLUChdwmd9nkZQF3Tt8BhU8W1Z0TSEVUbhDWjkmEMQIt3aLWySNvT
         Xe0slYzYml9LrzL4jAL3DeaXbJBf0ahD6mcRlOQJrIDlhfC6DbUZshRz0ryoL4N56AnR
         NENaMqOIzYioi9dQ49r+NZGqTt6467wnS+2VAzAKN3nCQXoMSdK1sVo1zlmjZaFD2BiD
         qhoT777qZCZUPDLAh2aU4XVOPdgCdoDQRACxXW7AgTjnCAGOz18OCziCgw1yBXyGQiNX
         zvvw==
X-Forwarded-Encrypted: i=1; AJvYcCUX9nMKBrA0EvC/gAyKEthKqSsWSLvfqTiJyb4J5SMJUhzri2v/MBdCIy24OI/UzWgubUOx7W0FjJCV73UPhhTg@lists.infradead.org
X-Gm-Message-State: AOJu0YwW2w4F7/jxVuwcKxX5wFGvjLKzn70cpc6x7stbAmh/xBDzefpM
	voCGbhoNHaXAcV3KbVpz5s2Q7G/C9yLFsqOGJ7xum+7zKUZkgc9R
X-Gm-Gg: ASbGnctCZz8p0mrpCkyS4E0d4tjbHKurgSJ+vkoyvjm7N/qVHgE6nqU/0QQX1Fl05VI
	av/mMjnEV2W1+LkJTR2bb38uxb/I50iqqUa1Z750PaVx/nEvry4+yfPtX7Tbb/lcmu8O+ReJ7CR
	XNE9/HMExxNt8H7CYPdIifEHY24okqYWKIIsnwHXcMJl9MoFBH9jY4GN+4xXB+NOTBUKOKTw3+Q
	jwi41v35NAzcNsOyUDkoMOlJP6jjNl6ztvuQt1oEBcy8uvCqfvEIo7lvf2bamvMc4KmN6sVZDH6
	MH64EtyPaU9zE4TWJcMutWEzwDuN3kjBssSPa8V/nQxPwJGax0dE/cAjTykFUV65bq29xDYnR9k
	TFIZ2SPuVsXpS9KWEo5GyGg==
X-Google-Smtp-Source: AGHT+IFWe5EGmpUjldgNs4K1HGGbn7yVxSWR9yHkVqi89+su3KAenSmxurHklNjkpkjyUU7So5s1SA==
X-Received: by 2002:a17:90b:4a10:b0:2fe:a336:fe65 with SMTP id 98e67ed59e1d1-301bde5816fmr5014331a91.10.1742402990848;
        Wed, 19 Mar 2025 09:49:50 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf576bc2sm1863641a91.5.2025.03.19.09.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 09:49:50 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH v4 0/8] ARM: dts: aspeed: catalina: Update DTS to support
 Catalina PVT hardware
Date: Thu, 20 Mar 2025 00:47:21 +0800
Message-Id: <20250320-potin-catalina-dts-update-20250102-v4-0-7c34b8139014@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABn12mcC/43NQQqDMBCF4atI1k3JxGi0q96jdDHRqANWxaTSI
 t69UWiRrlz+w/C9mTk7knXsEs1stBM56rsQ6hSxosGutpzK0EwKmQgQkg+9p44X6LGlDnnpHX8
 OJXrLfy85KCNSVKY0yAI0jLai1zZyu4duyPl+fG+bE6zXLx8f4SfgwI0wGhMZF3maXesHUnsu+
 gdb+UnuSDhGykCClgmArqzG/J+M96Q6RMYrqfIMtFJGVnZPLsvyAZAJFuB6AQAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742402988; l=1684;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=ltDzPnx9DrYQLZ42Mpq+ze7mXFl9npW/CfLcWJZUc+A=;
 b=h9W1GzNDRP1ipPJnnPG4uywIzZY/IGU5ILv0VsAds08ZDU+V1HSp+fdDPVblhY2OxMh1OFhxX
 7AfuI8FFiVuC3b0Lw9OpX+U3yF11FTPUZn8Hj7nxYAz6fZ9Iin/gMVV
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_094952_301765_18EE3DE7 
X-CRM114-Status: UNSURE (   9.62  )
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

Update the DTS file for the Catalina platform based on the PVT hardware
changes.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
Changes in v4:
- Split a single commit into multiple smaller commits to reduce complexity.
- Add `multi-master` into i2c12 & i2c13  
- Link to v3: https://lore.kernel.org/r/20250114-potin-catalina-dts-update-20250102-v3-1-14981744b2fe@gmail.com

Changes in v3:
- Remove delta_brick nodes due to compatible string not supported
- Link to v2: https://lore.kernel.org/r/20250113-potin-catalina-dts-update-20250102-v2-1-1725117fe7a9@gmail.com

Changes in v2:
- Add delta_brick nodes to support PDB brick board
- Link to v1: https://lore.kernel.org/r/20250103-potin-catalina-dts-update-20250102-v1-1-b0b7a523c968@gmail.com

---
Potin Lai (8):
      ARM: dts: aspeed: catalina: Add IO Mezz board thermal sensor nodes
      ARM: dts: aspeed: catalina: Add Front IO board remote thermal sensor
      ARM: dts: aspeed: catalina: Add MP5990 power sensor node
      ARM: dts: aspeed: catalina: Add fan controller support
      ARM: dts: aspeed: catalina: Add second source fan controller support
      ARM: dts: aspeed: catalina: Add second source HSC node support
      ARM: dts: aspeed: catalina: Remove INA238 and INA230 nodes
      ARM: dts: aspeed: catalina: Enable multi-master on additional I2C buses

 .../dts/aspeed/aspeed-bmc-facebook-catalina.dts    | 172 +++++++++++++++------
 1 file changed, 128 insertions(+), 44 deletions(-)
---
base-commit: becaccc292bfbd12df81148746043c5221e49da8
change-id: 20250102-potin-catalina-dts-update-20250102-914b06a4bdba

Best regards,
-- 
Potin Lai <potin.lai.pt@gmail.com>


