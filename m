Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B35CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 15:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=knoBTxhys0G5L6IMAZNao0/3R6GsTIMb0vdRqZYYHho=; b=xR15kSQKXVSNDrDylKFxmdx7iW
	G/bH6y8p7dfG7B5V/+mX7CxKbG6oDiXAKVt6PpXNAyhDRrUAMla8boJmAAK3Ic4QR0NSPoUrtETVD
	SS7QYOQ6Kc8vfE+e/IQJcr2PSMhaJptskIkfj5M3cynlo86b+iOynTVOQG0+rqXy2v3//6cAgicrY
	mK7d5Ramp8PMoKTW8So+TlRPlDLnxHFlo1vzMlTq49YwDB8frtaFRUTSgKNVVdYGbgsWwGwqsBlvu
	r+YXTUsanAFny+QP5na5r7bNw1rV4zIXMREOqrrTZdgLCIAOPATLII35BHUZ1KsTxaFfxxI8W4MS4
	QmZRdS4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIcj-0000000C2Zi-2LZO;
	Tue, 04 Nov 2025 15:07:05 +0000
Received: from mail-ed1-f51.google.com ([209.85.208.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIch-0000000C2Xp-0b32
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 15:07:04 +0000
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-640bd9039fbso3889941a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 07:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762268821; x=1762873621; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=knoBTxhys0G5L6IMAZNao0/3R6GsTIMb0vdRqZYYHho=;
        b=Z80SQ6f3VDDsbCzhv88t75psAsH/HNf+TdzvNEDj0yyVB2hYZnPTzb/ep8sq52E8Kc
         pHsWJhpsHB6AcJoT5CmV2+yS2/Cfp/LJVfq1sbQlgZBmprUrj9PuMZ/gxFPDzw6LxcAv
         HeXDUFqSQnXIN2hel3hiPA8eL3SxEdu8nT7E1JskpKvHnCvcq+b1Si9vZ34jv49F0HwB
         iAIgNSqD2RmWT1AIusy303aWP29TlUGT/kBAqe1mLyoXpUrVotj14fHpOtfDnxonBT8d
         fUb9GJt9ZIVlG2h2fshe34cGMBxfPgnmjw97Q27sRsjk/jWJ24e3nlxu5n+dVKurxME8
         qAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762268821; x=1762873621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=knoBTxhys0G5L6IMAZNao0/3R6GsTIMb0vdRqZYYHho=;
        b=tCNNtUF5heoMYkjJR9rz5XNAE+R0GrQJKzxF0gP0BDd44K/zUBEgpSewXtBbp8ZgTU
         hTv5YR2nw5HeJofL8Wai1t1cCXCgxRSUXdyNc/DqMXf9LUYlBhPF/nPoD5Vo48az8VQA
         wd58EtO7Cb94TPqeN17wRX9kd9tt8o4GGrCiEXCUx7Dt45ktcVeczUn7FAGFO8AdMz1n
         xs4JqM2dZl5LP/ah4j1InsDeCHH8W41+3QZDbGIfPT36LYpQQD8NH0ztJDZx8KkSdFGd
         Z++c3miIpjvv2ayBT75x2hEo4zpBNr2kFxgyXEhfaSDfA2bdrEDDkYsgMrqRzvPpQdt2
         AA6w==
X-Forwarded-Encrypted: i=1; AJvYcCVRTRYjH3uytOsr8qL89husJVlDn2oHggFUbzabYTPUt2rhPmWa2P1a/iY9mohZFFoyiz0OHYopVcenWYQrF/EL@lists.infradead.org
X-Gm-Message-State: AOJu0YzxuJD+2ckMl18+vkSAv/2o64m04pUZg8qyRN3blhizjRBNr9Y7
	IEbExAYjaFd/neftwUdNYBTNvuB8GSPs+DJk7pSkcIioCJ70DKxwAnJc
X-Gm-Gg: ASbGnct/uLEAPnxyzStUdDDmwor1Qsh6neq4xwFIA69XX7cLVZQ4/VCQuIEZsBf75Dh
	seE9sn/JqCRB3N8A0xtspLUFUTl1anhAgZMAkcinR8+wxlsBdF2zZSAXs/Nib9qDyAVaVxrlKkI
	7mOSZdC3faMaG+aN/PZQefXa48NStgzYtT2Gl+FIHEZ49ncYmCqq0QR0WzKg9wtpWAzSXQ2fkoA
	nqB2kUkDlPsZhV4ex4WtCPuiPyHLRd0u/fVkzpIIBHluX2Lw2GnLONBhC7v4saqvyc88PoORjmQ
	9ZMY2d4SBqLv9ci7PByQGlx/Lvfn330WN1WWtNv/3z8TqejGOiULpJiH7j2zwSIxsAAy9FT8aYB
	OuG7jlQxG8769ke5ZfCak/bRH4cgjnlP9SpXCgHmGO6lWgICP4CPyF86A2LhVQzLgpDm3NXRArc
	cfhMqM7LbJmVg2uJxwG3ypvlaO3g==
X-Google-Smtp-Source: AGHT+IH3QQar3AAy6xFUftSUi+POCA8TYsQTXR01XqUsEDkX3Cp2Kija0BWAy5x9Z/zOTkdgKsJWSA==
X-Received: by 2002:a05:6402:350a:b0:640:976f:13b0 with SMTP id 4fb4d7f45d1cf-640976f1865mr10596262a12.12.1762268820845;
        Tue, 04 Nov 2025 07:07:00 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e6805da3sm2342014a12.15.2025.11.04.07.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 07:06:59 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] arm64: defconfig: enable i.MX AIPSTZ driver
Date: Tue,  4 Nov 2025 07:06:10 -0800
Message-ID: <20251104150612.1874-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104150612.1874-1-laurentiumihalcea111@gmail.com>
References: <20251104150612.1874-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_070703_189146_66A65FBD 
X-CRM114-Status: GOOD (  10.74  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Enable the i.MX AIPSTZ driver, which is used for i.MX8MP-based boards such
as NXP's IMX8MP-EVK.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 03d89f29e7c1..ae5d32ea9fc3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -271,6 +271,7 @@ CONFIG_GOOGLE_FIRMWARE=y
 CONFIG_GOOGLE_CBMEM=m
 CONFIG_GOOGLE_COREBOOT_TABLE=m
 CONFIG_EFI_CAPSULE_LOADER=y
+CONFIG_IMX_AIPSTZ=y
 CONFIG_IMX_SCU=y
 CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
 CONFIG_QCOM_QSEECOM=y
-- 
2.43.0


