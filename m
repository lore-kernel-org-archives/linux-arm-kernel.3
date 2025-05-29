Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD44C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 15:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GxYH3NexwAbeEcXLC/B+xWmBAAgWvD5JzKcWCQ9bGyI=; b=j18rzam7LiN3Sloyd4oi8xReYI
	ryzdKgbOs/5ETDpnbvBaYmpOFjkzM3azlLSWsQm50uqg6Tr9X0E5Hg8Dh0hpubTpZGx2DQMFqno0L
	8i7N+UHvPSAi2guxhBU8bXDw4xIGrcm5M8IQb0WovfWQ86Cm2szK63qlh2Le+TDJHTJqk1yNeJh8L
	PeNt2FQeeRRoFrvFg6r2kNCXY5xqm8CeyqEEGuJETGL7iHmejysHBJJh25AU5LttghoERXwDvxbKC
	GneawrshO1DdkNMJ15+4NpMwyDKmpkvAzglycB8TfOQDXbvDvDSg86XRxJeJqirhI/x2yjGKNDK/k
	U8ZseKcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKfED-0000000G4me-1c6g;
	Thu, 29 May 2025 15:31:33 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKeMV-0000000Fz1W-0UGk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 14:36:04 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ad572ba1347so147026166b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 07:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748529361; x=1749134161; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxYH3NexwAbeEcXLC/B+xWmBAAgWvD5JzKcWCQ9bGyI=;
        b=oomFqoghMyZUn6M3Nn5U1QBqYLxote5qiaW2gs5ovVRipmI4NK7bZOzLsPtB/xUb3k
         jQ8s3z48hW+z7kJUNtobh27Rhq6HpEl19WSRv/9LG7kIrpZuehs9w35Epfap9NfR4Ttj
         gvH/zPT0UaIbnltXlcYZulPCp5hL07Vb3575g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748529361; x=1749134161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GxYH3NexwAbeEcXLC/B+xWmBAAgWvD5JzKcWCQ9bGyI=;
        b=OiH+VFo7wY+md5KYuWdcCZQzg7omorD0ltdtsEM9bvZ7fJAlaIa1+Ks45FCo3A4Mrb
         Gv5SwpJHTSNe4fAoy/WZY+LAhrBDvwuTievCTsN7+XGdOT2k5tRbYivaXUgHEoaG4GOj
         wzs6w+NELBfGe28FoSZdCrdTAuGUn10HVkV9qKWNMSV2ipGu6BGNhKepocBuXQ1OB4xg
         7txmGIt33bP7GDW0t6P7r9vLsReFIQ+TThUs0lsnhHs5Js5ZzcnGgqlEkXsILBQ9eeGZ
         cxnWFJjz5ezBkrK9uMfc9YnJKUKtuT8k9hUkVho3mSFVQ9qElppFTHPV7sHlYEQKMLE3
         SI1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUhF7hh/BTeg6uSeRlbpo8qX7a4wua495++DsFvhhgUA5DaAnVnDSEAkxhU7jcO9eEcJ/QPQIRVktCxukVOydjN@lists.infradead.org
X-Gm-Message-State: AOJu0YyB/YWKm839mlujeQsjFPxafujqIeCdcuEbU7tBndCxatru3AZX
	VI9SG9BkOAVqHNgngkRAnfGPZ/rEWqPA+7qY5y2fqeMgGqXxiRPnq6gKdaF2rq3T7OY=
X-Gm-Gg: ASbGnctlks2DRd3tBI54x+A3e977HbgqGYR7yqhL3y1B6s1gApyRw3zWngNZ2ehOmY2
	ryhTRa9Uj7CSCz6R4aUubLavVV/11xvXmccTg9qa79/0BN6i9unJCMcNr6EzLojCqo8tEEExCj8
	YrYcVUibskuuKTwJDjb7ilgRy/lY0rqspUcAvZiurQk1+8jasTr5sEOx7z8+Ah4Pvl1xzN1sEL2
	CVwCvqsfw+Mx4bXNqHdFeld+6tExmGZQ7d1FbbOQRnDmnWkUad+ouL7B5YPUh2d5wnjwRz51pGw
	FEXE04AOwUtSvNbAmdmdIrqyRXjnpX+7Q6j6fK13dKobVDWQYlCa0Td4aF0Ao2Tr5haytnAc839
	VJNMZ1SSk05WNXXps
X-Google-Smtp-Source: AGHT+IHLbgs6cMrNEhnJZTad08BJDPcqxBNJSOsMwsYd7juFM8aU5XWIyBIRrYfe55LQYTGTKQIT4g==
X-Received: by 2002:a17:907:3f1f:b0:ad8:96d2:f42 with SMTP id a640c23a62f3a-ad896d21361mr957537266b.36.1748529361561;
        Thu, 29 May 2025 07:36:01 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7ff075sm154305866b.37.2025.05.29.07.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 07:36:01 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 5/6] ARM: mxs_defconfig: Cleanup mxs_defconfig
Date: Thu, 29 May 2025 16:35:12 +0200
Message-ID: <20250529143544.2381031-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250529143544.2381031-1-dario.binacchi@amarulasolutions.com>
References: <20250529143544.2381031-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_073603_155823_AC96CBDA 
X-CRM114-Status: GOOD (  10.26  )
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

Generate mxs_defconfig by doing:

make mxs_defconfig
make savedefconfig
cp defconfig arch/arm/configs/mxs_defconfig

No functional change. The goal here is to cleanup mxs_defconfig file to
make easier and cleaner the addition of new entries.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm/configs/mxs_defconfig | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/arm/configs/mxs_defconfig b/arch/arm/configs/mxs_defconfig
index c76d66135abb..91723fdd3c04 100644
--- a/arch/arm/configs/mxs_defconfig
+++ b/arch/arm/configs/mxs_defconfig
@@ -32,9 +32,6 @@ CONFIG_INET=y
 CONFIG_IP_PNP=y
 CONFIG_IP_PNP_DHCP=y
 CONFIG_SYN_COOKIES=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_INET_DIAG is not set
 # CONFIG_IPV6 is not set
 CONFIG_CAN=m
@@ -45,7 +42,6 @@ CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_DATAFLASH=y
-CONFIG_MTD_M25P80=y
 CONFIG_MTD_SST25L=y
 CONFIG_MTD_RAW_NAND=y
 CONFIG_MTD_NAND_GPMI_NAND=y
@@ -60,7 +56,6 @@ CONFIG_ENC28J60=y
 CONFIG_ICPLUS_PHY=y
 CONFIG_MICREL_PHY=y
 CONFIG_REALTEK_PHY=y
-CONFIG_SMSC_PHY=y
 CONFIG_CAN_FLEXCAN=m
 CONFIG_USB_USBNET=y
 CONFIG_USB_NET_SMSC95XX=y
@@ -77,13 +72,11 @@ CONFIG_SERIAL_AMBA_PL011=y
 CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
 CONFIG_SERIAL_MXS_AUART=y
 # CONFIG_HW_RANDOM is not set
-# CONFIG_I2C_COMPAT is not set
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_MXS=y
 CONFIG_SPI=y
 CONFIG_SPI_GPIO=m
 CONFIG_SPI_MXS=y
-CONFIG_GPIO_SYSFS=y
 # CONFIG_HWMON is not set
 CONFIG_WATCHDOG=y
 CONFIG_STMP3XXX_RTC_WATCHDOG=y
@@ -138,10 +131,6 @@ CONFIG_PWM_MXS=y
 CONFIG_NVMEM_MXS_OCOTP=y
 CONFIG_EXT4_FS=y
 # CONFIG_DNOTIFY is not set
-CONFIG_NETFS_SUPPORT=m
-CONFIG_FSCACHE=y
-CONFIG_FSCACHE_STATS=y
-CONFIG_CACHEFILES=m
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
-- 
2.43.0


