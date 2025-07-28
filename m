Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DEC3C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 06:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0v1yUQUeQEzUoSADn+AjVSEy94CHuuV2CUdJl0yjuIM=; b=NjOf64yiPk49CRKtXq1ZYUYS/u
	VtMvnn3BcictBHD09CJz4WducyjE90RILY3aJtrk7MBwe7QjPvE4ArENJQz2TEFgKijSrXScVPIlo
	R1Ek/T5N1bs1YKi5q3ciPbFlZ1E6WIa8axSoAaL8hc2yH7vRpquCE+Y8eU9POAtg9CMlPU5a4BLP3
	9J0LLeVht+pfvbe7YvGRYS4mIBgxUzDXeJdpvP7FjcpEkiCzOcCQ/VJjN/DxQZWboNeSMuEqazuOZ
	293P6J4dD++TnH9y3V/x4FuQBsRyTm+PmPKaBfwsTD6Vs3cMJeN7VFpxk7vas/Z3I4Mj2wQzkK+5i
	hYwc4yGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugGzT-0000000DiyI-0Izp;
	Mon, 28 Jul 2025 06:05:39 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugGqY-0000000DhLG-3LeA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 05:56:27 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-879d2e419b9so2734847a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 22:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753682186; x=1754286986; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0v1yUQUeQEzUoSADn+AjVSEy94CHuuV2CUdJl0yjuIM=;
        b=j/8NIZ2eJW6J8dH5uEj9pXt1BBVGEK+xWAv61OqsFtQDrIW3h8UN1bgHedzqlwwG6y
         4JpMBJHjbbBh5WOuDz7O0xzqrtRcP8nCvnv1AB2ChhXqzzQqB9wmvx0snQegWS6CAQN9
         bR0gbCz8Okf7JwYu/v1lz9D84yy5G5Q5VQ68ItMCpqHhBaWx/gMtDUaIMUcALX4QVjM8
         h/PeXjyAsPkknLMsd4A1I6YphaDvb6QQkUzPrmUQ3OcvHk3klVRUvvqSZMe1jGibHRb6
         qH3O529/fVj0bEsB1AAkJhAlbbZ5IiApdZoNlu3I6g0F0LvMoM0Z+zT9ShootnK2gkcx
         qe4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753682186; x=1754286986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0v1yUQUeQEzUoSADn+AjVSEy94CHuuV2CUdJl0yjuIM=;
        b=pn9PSfClOVSyBpJrr7aurw1zQ/Zwn/5NFHcmmQ+pcXSEXOG9PqeIdy8WT+9nlJvYup
         jYy+zWc1mu/pbBqrup1V6LUOGIi6UwvbURmQ2tOG9cGa3lpjxUa3l8zKw5btFhc/Tw07
         3d4MgEvgwqiwwhI8SmYuHkN222AexemvGKQLDfCYkXmkj4c2cDYrsk+Mn3hZCP5PBq96
         bQtZ4fgy/sEVNb0FZoT7o9IGqAyS3JmZm7jdZxKw9RcHQ577sOyJIiWoRlVVKoJjpRsq
         GehgnYkH/aXdwRF7WIH2Es77hieq4VytsToXZZ7yOijkqdyuHMPTQR2NVxzL1hNA3EBm
         xo4Q==
X-Forwarded-Encrypted: i=1; AJvYcCV9BdJxPEoKaXcAuapGu+cyNCre9tHpQj+kvY6jHrLlQ4tANf3thYtVZy1sL/uedyyCGeWIODtWeaw6tk7s36fJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyNqo1jDKIJKUiRghUhagM2FkJLI6JfN2O34FbeSxEsRxWnjpLo
	X1aZ6xzUUo99mCMeLxQw96ky6X/GYb/asiQcyqd5BfBBpjq2OEgc2id9
X-Gm-Gg: ASbGnctFUCwfIlyHd6y7Hr4kwOqMDjsRv807fRO2DuyxiiQ2t8SxgXch6c0bmdnQSqA
	TqVbR00fiXkpNoNHwnD6r6dy2pAkmSJbev6JKxaOpGwgO61UxIu9BYn/LGXYCG2lDzkul3MG04u
	mcS6fhbr4YuiJKoLUfOmlEuAppygr/+S9g50f3z3t8ZT+OAIUFmwzL18T0U1D8wbA+isaDKngQk
	ONrODhJ862DmUEJLtmqhLjyfAlVpxXsxCDr/VLyf/VoR08BbI9FY2Wte0bXT5Z3X9ZqcCFHPA/Z
	LJj5k4tobLlyF5wwuAwA1ICOXTGzy5ke6muY5N1WytL93TwthIeObPD02WiwZaGn30iB96uTuEJ
	/YqkXl9YaTs8vFr9+wUfCnidjWZhlTdaRbAFtWpi1LRVX3/8qFEkhI4G11Y5uSAHZP1MW2Dbkmp
	0Wz7QOBO3pLg==
X-Google-Smtp-Source: AGHT+IFHEC7n8+B8Tb7wSp7/znoNLEQy2YYidfHzQJc/uhDuybjOx5iseDVn3XjiJ1+k5dNKflv98Q==
X-Received: by 2002:a17:903:289:b0:234:a44c:18d with SMTP id d9443c01a7336-23fb304fb2bmr160718715ad.22.1753682185872;
        Sun, 27 Jul 2025 22:56:25 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe514b59sm45091795ad.128.2025.07.27.22.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 22:56:25 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Tao Ren <taoren@meta.com>
Cc: Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH v4 02/13] ARM: dts: aspeed: fuji: Fix DTB warnings
Date: Sun, 27 Jul 2025 22:56:04 -0700
Message-ID: <20250728055618.61616-3-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250728055618.61616-1-rentao.bupt@gmail.com>
References: <20250728055618.61616-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_225626_836069_6D1EF3C8 
X-CRM114-Status: GOOD (  10.37  )
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

From: Tao Ren <rentao.bupt@gmail.com>

Remove redundant adm1278 properties from fuji dts.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
Changes in v4:
  - None.
Changes in v3:
  - None.
Changes in v2:
  - None (the patch is introduced in v2).

 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts
index f23c26a3441d..840d19d6b1d4 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts
@@ -248,8 +248,6 @@ imux16: i2c@0 {
 			adm1278@10 {
 				compatible = "adi,adm1278";
 				reg = <0x10>;
-				#address-cells = <1>;
-				#size-cells = <0>;
 				shunt-resistor-micro-ohms = <1500>;
 			};
 		};
@@ -577,8 +575,6 @@ imux67: i2c@3 {
 					adm1278@10 {
 						compatible = "adi,adm1278";
 						reg = <0x10>;
-						#address-cells = <1>;
-						#size-cells = <0>;
 						shunt-resistor-micro-ohms = <250>;
 					};
 				};
@@ -648,8 +644,6 @@ imux75: i2c@3 {
 					adm1278@10 {
 						compatible = "adi,adm1278";
 						reg = <0x10>;
-						#address-cells = <1>;
-						#size-cells = <0>;
 						shunt-resistor-micro-ohms = <250>;
 					};
 				};
-- 
2.47.3


