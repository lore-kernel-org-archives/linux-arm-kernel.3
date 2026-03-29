Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD56F3D5ED
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 06:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzSVIyxJVE3INc2YlO2V/JlUMWvH8XiTteapFFYHtbU=; b=uIX3vkg9PUwhO4YuwZzZ5KzpWj
	osLBlc6JS4bxcPyvWTA1+L7aacRQIE84KZ4anZvpvw0RO2gCVNs0TvI7EDUL6uLFfqbjHiqAayJ3Y
	vQRYV+9tBTwQ0QZMonBnDWkxUTMVRKvJXLKcB6q62LJ+UPpArFE8MOeMXHJeBUQ55yYkG95/2ANYJ
	ZMDEll89fNxwJXMDuWHU7QI33GFTmWVRm6ho912cRSu0o7W9Czw9u1r1sihYWORbXFz6/ft2xwy6p
	ldlUBnwrKRSsrKahWna40zR3IANNU55ix1NE2LLYljBjaS6E181QK5pRdnHgg2xhv3NT5/4PWvN6k
	dOP0CXsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6jRH-00000009cRS-0CqP;
	Sun, 29 Mar 2026 06:15:59 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6jRF-00000009cQr-04kj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 06:15:58 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c73c990a96dso1514532a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Mar 2026 23:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774764956; x=1775369756; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzSVIyxJVE3INc2YlO2V/JlUMWvH8XiTteapFFYHtbU=;
        b=D43fLbNlidaq3VrghB33SwV+wwkxbFJ9UK5IunFi7LbXD/q60+tmjioBGC5eEOX0j7
         C3cbNKVAJRZ7NUihQcEAsYvMKROn5dG3OT0WJyTlIh6nZc9GE4/SX5FT8SFw3/rmjVZP
         G7Z2iiezDh2tOkZHAOj8vZa3XF+mJhCLAd2bgP1bNkNAXEbXaD9GLiU5ys3DC/cl0fAF
         s2Hh7wW1tw7FAjFOSQJGICyDcV2s+GlyksBPIGqVZ2TomOuabJaFwgV2jInyiryb2doN
         e5EUut0eQv5dNHAE5Y4Ui9Gv85ThPIMJqS8BQCkB1pmjdsQ+WQpwHkLzoJxlwRcQcuey
         xiYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774764956; x=1775369756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jzSVIyxJVE3INc2YlO2V/JlUMWvH8XiTteapFFYHtbU=;
        b=ooVgRtMbpsD2IMEMCGTReMGKDnz8VZJiYfcGHNEPBKmNVv2Eno3IaOCy2W/vxDe5iJ
         b/Ln20LeZMEa+ddOKBWgjrCR/PncDgUHyrDMWsWomM0U3P0m341ohC5sm4r0WnFp+BM7
         I3arDKS95/b1J06QZxsu5WhVXVjhsZRcCtFP2G9UpQgv96ABVrxg7QO6lRu8UPLRYepo
         XW2/aw/xcBos62xVbYAC+9hryRscXEeZS4xDYD/RJ88JFZYSfvEc+4JoZbVHgoU2STBS
         hKXi6W4T/m1yQR7WWuR3aWXnKGlbunLslTDMSo6t9BI8qzuyg0k3j68RmsDSJ5NuH+7U
         V2KQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoqp4zBXp/JEk6GxD0yziQttqlQiJ7JzejwExe65Yts1X+ZFL2GoIs4vS+bNpjqvBWZcLoL+brIu21kbPanLCQ@lists.infradead.org
X-Gm-Message-State: AOJu0YycXtu6Q3f1XP5AQwko4FwqJEdtkVamRIAxHFypjGSgQDwCvxoV
	wpXqKhwEifq08Lf8dFdxD+YBqylnsnRh53mB0rtl9KKU7dcAdveaG8dK
X-Gm-Gg: ATEYQzzY3ovJdtK5MBrSoFFSAvR/q93Dv6bETnT94pOeaEDC13MwtSPP75ormrSAVk9
	Qhy3tRP1GMNmm1fxKitEzoEyiylnCjrgx6qI4BPghTX0YUFvkYF0B9HzuqQYE90rwzVmxWELhlG
	gCPckAVSYpj3+l5D7wa09we0iFvqVQWr4WZnui9wNuTOt4M9NV//GFPXustEPY5feFrrHHLUe0O
	b7+QKLI2ZCVjbibKV+1zPRHPrPRuqvXGzJ2Kk1oSdvPz2fIyMVCDRF5JIfSkpwrd5r5PYownVXo
	XEpD0sMlYbL3TGi3StTi21PzcQ3Mr6AJI4LNYfoeLxcBrgvADRfJrg9oRz/YV49nhgDgs33ByLZ
	MTqpoYHIVaU9LjF1xTWEc4eFdWxKXWTrrFIzTahULTx/YiZKtYZLYHlk82iH0dwxcb1hZ1AG6+d
	Wb9NRHffCsl65Q/caE8sg/zSxE0jk4HuOj+loqoPCnGHkCmlvzZegzABLfsxYaJlQIVIBHGWkHG
	Jg=
X-Received: by 2002:a05:6a20:7485:b0:398:9466:2eda with SMTP id adf61e73a8af0-39c878c4986mr8419647637.19.1774764956074;
        Sat, 28 Mar 2026 23:15:56 -0700 (PDT)
Received: from toolbx.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca8436f19sm3709731b3a.9.2026.03.28.23.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 23:15:55 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: rafael@kernel.org,
	daniel.lezcano@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	vireshk@kernel.org,
	conor+dt@kernel.org
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com
Subject: [PATCH v2 2/2] ARM: dts: st: spear: rename thermal_flags to st,thermal-flags
Date: Sun, 29 Mar 2026 11:45:20 +0530
Message-ID: <20260329061523.98346-3-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260329061523.98346-1-krishnagopi487@gmail.com>
References: <20260329061523.98346-1-krishnagopi487@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_231557_057639_C1FECD8B 
X-CRM114-Status: GOOD (  12.26  )
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

st,thermal-flags is a required property in SPEAr Thermal Sensor node,
which is incorrectly written as thermal_flags in spear13xx.dtsi.

Rename thermal_flags to st,thermal-flags to fix the property name

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
Changes since v1:
- Reword the commit message and subject

Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 arch/arm/boot/dts/st/spear13xx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/spear13xx.dtsi b/arch/arm/boot/dts/st/spear13xx.dtsi
index 159e941708ca..97357680dd51 100644
--- a/arch/arm/boot/dts/st/spear13xx.dtsi
+++ b/arch/arm/boot/dts/st/spear13xx.dtsi
@@ -332,7 +332,7 @@ wdt@ec800620 {
 			thermal@e07008c4 {
 				compatible = "st,thermal-spear1340";
 				reg = <0xe07008c4 0x4>;
-				thermal_flags = <0x7000>;
+				st,thermal-flags = <0x7000>;
 			};
 		};
 	};
-- 
2.52.0


