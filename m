Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6644FE77160
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 23:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q5qEW4jJfic/KmqYMW2G0FOLqVypcgVgmsP5xVbecKw=; b=nKolGSYs8jlm6Ovq8RX44BUDbQ
	FWuJo32R6Fn5U4vFFXNpM2bFJRAjMuZsGs71zAb6aymcFujxRWudCgJn6OWqhHsVXpKBZdtbVbOh0
	KQoLij2ZVsFFYp+Mc8JgJSnixJlR8jM9IxawiXgk5zczK2vAVS7er+zOOYdHPkyafdngmubSoaMUd
	0W2nj26MaDuVw1uDlc9pLPYlEWTaAfF6DJTjFyKr2sVCKsBE87Yg24DQJLE581sq01ktYWDoeQHFj
	252CFySBzjqVlgQRVDlP5yzrelfuJcC73yuaFB8HuP6HBXwxewXjE+0LXJOFhooy9VRHrui4Gs/Mj
	uIXklxrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIcTX-0000000B3Fn-0cOy;
	Tue, 03 Dec 2024 23:38:39 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIcSH-0000000B338-0P00
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 23:37:22 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-724ffe64923so6448832b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 15:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733269040; x=1733873840; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5qEW4jJfic/KmqYMW2G0FOLqVypcgVgmsP5xVbecKw=;
        b=jWN13RnUDoMvi9iigXYqBtvKIh7YIcwIDXazwqAOLZQm14VSH2zDnTfr+ecDL5Z80L
         c0gFa2A5vnIbzcR0DyWDLgVcNQNKdtRlXsn63CmEza14z2UpBgEpkSWPkbLTEDGlRWcH
         nd84CwdnedQhTAfIvdr3t/3SU/fx21UesYXWfPfvzP7s4xdrZmF166LnDAgfPFiKz4jj
         +crYNfSNcrMC+VCtr3b8mCTt8fL6uvrBMPjeeAfft6YzRz52qlPMV68uhNTsJri1HB8y
         0Txr9XzfuWB8xC6pNCzKYOsBOvrZSWn8N925wer+kkTYmV0778+54PDvzcsHFgCOPrCN
         9Mxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733269040; x=1733873840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q5qEW4jJfic/KmqYMW2G0FOLqVypcgVgmsP5xVbecKw=;
        b=R8GhocIA3pyJatqoz8tap+NkTRpzdRfnjqO6MRUQQO51k/UWBLnyBDf4ATxoR+FyWc
         3wlP0O4R1lIfdsDn6fTEf/I9xc+KgHUxB/h7hR+krjI9eVZCsJZmJX5ZWfEbb27bCNp/
         5XCnn5BCoDv7DH5XV4wuvw8wG1l0uV84RuoBp38lfFE8uPQm/6kcQ8Pg64pwPWje/07o
         ugaai2IxvXDuHvE+PGmKkzfT0VQGUJAEwf633LZyoTHmSn4lVWGHpBVkAmGyvrTU6+Ao
         L03KaTMMYzpNs65Mk8Di2Q63Woi8dM2Rwt1XBwtV3GY0MRGTLvVuKWeoPwE9jRIY4KNi
         P8lQ==
X-Gm-Message-State: AOJu0Yx/8pfNJzwqeiE2p1JDsiOVzpsRvjiBuyR9uJJRGenY2tIf/K3l
	oLvRISeyHeS+nJh/Fi/Kr+yojOp+7vyee/J1NPfyaPmz3MroZTQitocndKwBXo8=
X-Gm-Gg: ASbGncu357T0m1cNDu9QjVS/MJwOjJrf5lOm2jz5Vcy9u3Ur0y1aOyncOw58UaVfG7O
	Qo/S6VdKzZIp1JwzLN7tcjGJQfr9TBeMOebrgHncboWzX4h/WMzTk8dRUaqmFc0yJeYzeoiEoh7
	wwhC9ZF0LQiSAqo95lKfyKCSZnw0pCdOPn0MhnxGUDn+X3cU/JJ9UvulaDeKlAkQZGWlC4aGQul
	RbEgSDBla80it/ln0eoLqahXw==
X-Google-Smtp-Source: AGHT+IGmUB8QfjA0RY2ydXBICshKM7ronJUqIxAE4e7WvnlpNAzxGCSvOX9ygh9d1aeEy5n49zRLvQ==
X-Received: by 2002:a17:90b:3a85:b0:2ee:d024:e4fc with SMTP id 98e67ed59e1d1-2ef012748a3mr6764344a91.33.1733269039866;
        Tue, 03 Dec 2024 15:37:19 -0800 (PST)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef270352c2sm119187a91.33.2024.12.03.15.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 15:37:19 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] arm64: dts: armada-3720-gl-mv1000: use nvmem-layout
Date: Tue,  3 Dec 2024 15:37:17 -0800
Message-ID: <20241203233717.185016-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_153721_129910_65855244 
X-CRM114-Status: UNSURE (   9.70  )
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

nvmem-layout is a more flexible replacement for nvmem-cells.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/marvell/armada-3720-gl-mv1000.dts     | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts b/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts
index 56930f2ce481..7b801b60862d 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts
@@ -98,10 +98,24 @@ partition@f0000 {
 				reg = <0xf0000 0x8000>;
 			};
 
-			factory: partition@f8000 {
+			partition@f8000 {
 				label = "factory";
 				reg = <0xf8000 0x8000>;
 				read-only;
+
+				nvmem-layout {
+					compatible = "fixed-layout";
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					macaddr_factory_0: macaddr@0 {
+						reg = <0x0 0x6>;
+					};
+
+					macaddr_factory_6: macaddr@6 {
+						reg = <0x6 0x6>;
+					};
+				};
 			};
 
 			partition@100000 {
@@ -221,17 +235,3 @@ fixed-link {
 		full-duplex;
 	};
 };
-
-&factory {
-	compatible = "nvmem-cells";
-	#address-cells = <1>;
-	#size-cells = <1>;
-
-	macaddr_factory_0: macaddr@0 {
-		reg = <0x0 0x6>;
-	};
-
-	macaddr_factory_6: macaddr@6 {
-		reg = <0x6 0x6>;
-	};
-};
-- 
2.47.0


