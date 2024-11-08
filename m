Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A452D64063
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 16:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2nVKb2hvRP3zLcKR7jduFefSLqPzAllC+DJORNI8QjA=; b=W03iRiwU8Dh6GAuxhj4juSjswm
	XcfOh9rvnCL3AnNsa7rpwGTwOR8CW6CKJVk5XETKJ7u82zwlA6zAKeHpvW+0D7ISTv8/ILbaQK1C3
	1HX/eKI36f33X/FO34YXw4oK4SKt/AMFf19iLIUu0cu5XkuuQHIsgxkAKCLssEsrIXT1Kr23OWDwR
	hyw41m0YI9ykYnskCMQ1aXWi87Fx+QC8jXc26BYN0I+2Y4IFcSr1rGsDWBlWajEImO3AV6C0k7dw/
	WBErNyf2CzzvI3jfVxjX7i1m1TP6UhloO41vrgxj4WFEWcJrf9uX5zt0sqtOxaOMIo9OHbbZAeKsN
	DBVu8rsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Rub-0000000BDv7-386C;
	Fri, 08 Nov 2024 16:32:41 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9R1m-0000000B35U-2awf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 15:36:03 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4315e9e9642so19188655e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 07:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731080160; x=1731684960; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2nVKb2hvRP3zLcKR7jduFefSLqPzAllC+DJORNI8QjA=;
        b=Fyr7R/DFJGY9wZ8THdmjKD1/VwcUDg5V67PwMCwU+dBVDi0fvBwbUciBmRlZ+X7Lhm
         vVBIH+an/T2JVEKbrShy6bBk4JCwhXD9gQ3GY0QdFWMCq360+zehRc18voKQ9ZnP1r0U
         8JIeHzrAJI6gRDDq4rymcLSeXJAgcmmN7aVo8g0jFVE983B9waPaOwnULug42U3W7nV+
         pdhblvmjbr7hdqnb4iwIOLEOWr2fVNg5UYRkb3YW7CWdOZtGG77SHvImeVuqck3BfL4M
         oqBHMyBNqOmq79tJs9zir0pEc2C1Lzl7eDXNnFsKqsZQ74EDIGIHChQmM/vL+uNPwgye
         PLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731080160; x=1731684960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2nVKb2hvRP3zLcKR7jduFefSLqPzAllC+DJORNI8QjA=;
        b=k0OVPi0mMrdLn/TCMJCaAKwKMsMNxUZNhh6jf7YHPwu2Pw6C4NXHcMmuG5FhVYbZUl
         SfoP5UL5usFg+jzGRLKmOXTRcV15uPk2tIY3/5V53Wd3DITotEjd02Nv/di2cPSCfgEr
         dHFWn92p0RTk3ufx6RlrqcxADZX76C5G0jxf28JXEI4E4ahh3+TWbeFTMrTm9a5LOp0j
         GxB8h406PmIeQKtFxiKyvCG/EktSVVDb3ZSfAaa5W0RccthvuHjQGDx7jOMleYJMWC6N
         iiOl5q3u4T7jAAVjZRxwwxDd1ALGPn5s0ZDXPQsnogZpnmzGznMPmHzwdu0iiA7yB+FD
         VoCA==
X-Gm-Message-State: AOJu0Yyw7M+mKM21sYI2iT7vLp9Qe6Z21QetNnz449pv4rYbrfdqPhZF
	VhRwZ1ElT2b2GvmXrLUzsuFxLFfRKe3/DGMCc4csYsZYI0oX6pTO
X-Google-Smtp-Source: AGHT+IFuTl+S8WzS1KOeDdZG5ICETzGr8yuMTt04P9wVoRLrVQEU567NoDmp9dR1QkFr8R1TeWkRsg==
X-Received: by 2002:a05:600c:3ca0:b0:42c:b037:5f9d with SMTP id 5b1f17b1804b1-432b74fd71emr27480065e9.3.1731080159667;
        Fri, 08 Nov 2024 07:35:59 -0800 (PST)
Received: from eichest-laptop.gad.local ([2a02:168:af72:0:c5c8:af8e:e93d:4656])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b054b34csm74750545e9.14.2024.11.08.07.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 07:35:59 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: linux@armlinux.org.uk,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	wahrenst@gmx.net,
	elinor.montmasson@savoirfairelinux.com
Cc: linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v2] ARM: imx_v6_v7_defconfig: enable SND_SOC_SPDIF
Date: Fri,  8 Nov 2024 16:34:34 +0100
Message-ID: <20241108153546.268695-1-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_073602_683119_2529220F 
X-CRM114-Status: GOOD (  13.73  )
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

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Enable SND_SOC_SPDIF in imx_v6_v7_defconfig to support SPDIF audio.

With commit d469b771afe1 ("ARM: dts: imx6: update spdif sound card node
properties"), the more generic audio-codec property is used instead of
the old spdif-controller property. Since most i.MX6 boards now use the
audio-codec property together with the linux,spdif-dit and
linux,spdif-dir compatible driver, it makes sense to enable
SND_SOC_SPDIF in the imx_v6_v7_defconfig. This will ensure compatibility
with the updated device tree.

Without this change, boards that use the audio-codec property will show
the following error message during boot when using the
imx_v6_v7_defconfig and spdif audio is not working:
[   24.165534] platform sound-spdif: deferred probe pending: fsl-asoc-card: snd_soc_register_card failed

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
Changes in v2:
- Improve the commit message. (Stefan)
- Removed the fixed tag because it is not fix. It just improves the
  example configuration. (Stefan)

 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 333ef55476a3..c771d7dbcadc 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -321,6 +321,7 @@ CONFIG_SND_SOC_IMX_SGTL5000=y
 CONFIG_SND_SOC_FSL_ASOC_CARD=y
 CONFIG_SND_SOC_AC97_CODEC=y
 CONFIG_SND_SOC_CS42XX8_I2C=y
+CONFIG_SND_SOC_SPDIF=y
 CONFIG_SND_SOC_TLV320AIC3X_I2C=y
 CONFIG_SND_SOC_WM8960=y
 CONFIG_SND_SOC_WM8962=y
-- 
2.43.0


