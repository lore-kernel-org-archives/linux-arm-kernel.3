Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B589E77170
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 16:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ERqtwU8OA/8boolNfifBHtI3svqy087oNlMJx9UxCto=; b=U5CnMD5Ef0Amev+kb5hTrbPfkq
	odhTCEfts9WWSJZ0jtnQawmaSE+/yf0JkrTQhZ4c0MS1+cpBj4GQUiKbxhxSZybaw3PEZ+SwRmcQT
	g/PyWHSkaFWTiNeEPTsJ6b4deJbR5Fos6u2OCRQY8nsa5H4mfpAe4iO8GotXrJ+nvSRISP7RGj8Dg
	q0rjU5PaiV0mfJs8taR4pfZm5gkIHE/Husq3lXcppz9fWggyrQ0jGa1AoPm4Gdg+xR+UM6AgvLfXV
	pVurhyOclUdrDZJMgRy9Q2UrPGBaqbZ/42mhzNulQW9+420pJQYpGQhL9LAq37+CsLc7L1g/4Txhq
	zf05N0Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIruy-0000000D7AW-2f4r;
	Wed, 04 Dec 2024 16:08:00 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrlV-0000000D4Xi-42Ah
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 15:58:15 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-53e1c3e1c50so1045663e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 07:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733327892; x=1733932692; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ERqtwU8OA/8boolNfifBHtI3svqy087oNlMJx9UxCto=;
        b=Ya1b+Oc8XOIuSjtQbjSCWU5mjwWBchu9tiAUXaArQMiNYmIndC79LqC6Gx8PINpa0r
         jQHlhfTKRHb5kip+8xYntGok2Npjhoa1jvlqdrfSR5l+AsQFU/EMSQyUkmNSUPnRaHeG
         PFoYIE55n6gN4gm/l75EpH8Bp4VcqHbTg7K8VPbuMII/MZzde4V5Ulv9yIKDkT3x/UFD
         IM0GU43gAQxhvP1qL1GC7HlzvYZlhaXv9wk5uU+KdtvyW7nB92HKlunaXHSlBUp+VaBR
         +k7HJuUwH8FLoj0XJ6JUDzUCdoeZTaggYPuN4YC/nHepme/rrbr0jJcp2pPV3e4tIe8+
         aPZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733327892; x=1733932692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ERqtwU8OA/8boolNfifBHtI3svqy087oNlMJx9UxCto=;
        b=htKvUnXZ5ZFCxPNlm1tIBmV/6iF9zdCUaU5P3iHhjoJCeMC2p5Ml52hdjfU9cSxFm1
         4RqVNcf6TXFyNovltYtFmru0h1S9S8wH9cl+V9KIUumFEhMTpkIJMmElCAyaHOzhiwyl
         Rwa+ERJKSr6gkyMSXgLd1v9frDSUX49sDS5iNcqD8gI2OwLuCm2YjScJe3ojVBiX0Ymb
         DtmIaRLPb0z0ZK59MbsIlnAkNTp7D3dFYcFpBd7P6F5FkqoC2GD/4tPKFPF/Sm1FqUQs
         EPKyoiI4S5KTvnsi/bsF4ICdAmyoJZ4qc45oKosxSqkDlzFHPzyjBSzUisnz7k6LDYIF
         MLKA==
X-Gm-Message-State: AOJu0Yyfn5Ukwgqd6moJJyf2/dY0W2TBNUK6YogQ2bVGHniRi5hPEbWo
	Itee0bnVgmB+6fIcwA6Q7NV1UyqM2K+XSJOo1gEF9VxwT7UihlUr
X-Gm-Gg: ASbGncvGgcsVPSAj9xaynsx/TtfZLl/1jkpySk9ZpG8TPsun4KC3NaNtgdlfhihJGNo
	30eOZ4bFY35XmN2/IZFdLpJ8t8oh7O1o4HD1FvPZo1WkAkbTiAR/SgtFrz3ZjjdnrlnWRaA6GJT
	8ZZTuFxR9LmRdAvbobqhFKCj5TdUWViuddGeCSmt2/NsLAXyCuBeblzPfLUcmBuYGP8BIKva5d7
	wvLYYkLLPjzA4BdaSf4RQ+iIXUc/ExOK7fUYW9RO2sJUoB7kmt84bixsVu22TnQNu9CtPjE6b4u
	/iJAWPQBUZmXzDE=
X-Google-Smtp-Source: AGHT+IE+kEoBbCoYkLKnifs9gNrwDg0/EoXrecLwl97llJBHT7iNVuPl6X8ay9kKQ5BBUQOvWv6xFA==
X-Received: by 2002:a05:6512:39c9:b0:53e:1ca7:e0e1 with SMTP id 2adb3069b0e04-53e1ca7e2fbmr1940269e87.48.1733327891633;
        Wed, 04 Dec 2024 07:58:11 -0800 (PST)
Received: from [172.17.0.1] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e1f5498easm168999e87.105.2024.12.04.07.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 07:58:09 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 04 Dec 2024 16:56:51 +0100
Subject: [PATCH 9/9] ARM: socfpga_defconfig: rebuild default configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-defconfigs-v1-9-86587652d37a@gmail.com>
References: <20241204-defconfigs-v1-0-86587652d37a@gmail.com>
In-Reply-To: <20241204-defconfigs-v1-0-86587652d37a@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1241;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=S6Rb/mVurB3CrznT++E7Ya5mPE957VSJz8lp4pr8HDM=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnUHvwJ+cCx0uF/fqpIJmM21EDZ3lt1UiVigNGK
 eef3S37RnSJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ1B78AAKCRCIgE5vWV1S
 Mj9hD/wN77SL824IT6g7JyBPkgmErbp6/Y/OZrf3FgD9B7F4lBl+X2LT//GB3+iyNul+3BikBgh
 BwuGyUwhSct+C5Sq+oVQCu2HG8ms+1kNGl/EHILWDYvYGYJcXr0u7e1IF5jmv7gCiM3myCusPKY
 AETbDZahjYdnWnfNf1U+sOeBw81AhQq2eNxx+sT5bQ7qF1t0BUTXuHVB0XH3CQlkmXrX3tfYpTG
 D4FIckCRadFZ34NkWtRHme1m6kRkUXaYInAtxRL3reZ9V7LNclpuLbNp1l6ryNEmWyVfgyGMPha
 nbIuOSTjG+OCXYwEiGoJdEpK+GO2rDApr8tfYLqavol6pwye5QNFAJPjd41L0eUxJ84AyNFNE7i
 ePhUDoGUkbf9gnsCKRx4z3dWbN3NyR0djL6D3j/40L7iNcbmfZv7RtC0ZutCwE9VI1un+SjRcjf
 /9u+A3lFRcqtrDjZUf6ulSidwizc+8ZjOTJBLx+BNUkZMxnTJ5CuBcauNCepHMiV7pgsxCHuBqR
 hhHia77aFKgwF1appiYa/LFd/MfDakiHpmjE/7y10fpmiiah0Rdg0g1dzJtresgvc1q8riy4C5L
 Wm4ibA1iN85GnHXL79CCODH3PHBM4K6lmvx5t62IOj3aJdnAERjh99RQ6Gtj3w0FY3iveMIqIwr
 1j9SS25nE8HzMcQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_075814_003294_456D141B 
X-CRM114-Status: UNSURE (   9.25  )
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

This configuration contains obsolete configuration options e.g.
CONFIG_MTD_M25P80 which is integrated into MTD_SPI_NOR.

Rebuild this configuration by run:
make ARCH=arm socfpga_defconfig
make ARCH=arm savedefconfig

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 arch/arm/configs/socfpga_defconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/configs/socfpga_defconfig b/arch/arm/configs/socfpga_defconfig
index 294906c8f16e8f4f5f6a4af5770d79a68528fb34..90c3aca7f8afde7db0062e46261ad6def7e8c146 100644
--- a/arch/arm/configs/socfpga_defconfig
+++ b/arch/arm/configs/socfpga_defconfig
@@ -41,7 +41,6 @@ CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
-CONFIG_MTD_M25P80=y
 CONFIG_MTD_RAW_NAND=y
 CONFIG_MTD_NAND_DENALI_DT=y
 CONFIG_MTD_SPI_NOR=y
@@ -84,7 +83,6 @@ CONFIG_SERIAL_8250_DW=y
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_DESIGNWARE_CORE=y
-CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_SPI=y
 CONFIG_SPI_CADENCE_QUADSPI=y
 CONFIG_SPI_DESIGNWARE=y
@@ -140,7 +138,6 @@ CONFIG_EXT3_FS=y
 CONFIG_AUTOFS_FS=y
 CONFIG_VFAT_FS=y
 CONFIG_NTFS_FS=y
-CONFIG_NTFS_RW=y
 CONFIG_TMPFS=y
 CONFIG_JFFS2_FS=y
 CONFIG_NFS_FS=y

-- 
2.47.0


