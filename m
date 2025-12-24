Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2393BE75458
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 13:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b6BJX3RO6Fa9KANLRZsl2DTswgSgqWJfE5bB/nVGOxI=; b=ID4i34+1ogxnW+jm3jmKPLzMXf
	FXjwRQjXgLFa7ea3L5+KBhZi0CK7a+APHwB3NUacXbozyFn+J9rDf5Sd8XtIpAHJba4DS9Mi6lgcR
	ST6d9hjPUrIkx/xUMtrZPJXqQPwwHKnNkkUDvwnIXRMOADjXmHdSkwQZetkmBS6Xedvu93Qt7jZpU
	/12FjTfh6BrcWlOyzVK/Rx2tBSeRGzBIYtGy+8O9c9RWi2oH83luPn+q6IhvVT2Fx+y/cbB90FWTG
	EFDobX4JPLkCrdUpcCcqErY5PS8RfnPYUxJ6u/MAnMfs/TIaCraQKLRLJ1cHvzvG+p1Et0p/RJQvG
	iTUasZIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYPIl-0000000Gvck-1vC4;
	Wed, 24 Dec 2025 13:53:19 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYPIg-0000000Gva5-2pU9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 13:53:17 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-42fbc544b09so4517384f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 05:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20230601.gappssmtp.com; s=20230601; t=1766584393; x=1767189193; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b6BJX3RO6Fa9KANLRZsl2DTswgSgqWJfE5bB/nVGOxI=;
        b=R/gRJzqxDkYtq8Kmt93ubHWxyY5yrxPS6S3r6Waa+LcFJpDdWTR04cLyQ/TxMxeE8H
         K6YstXTx2nlDGvEARj3p/2KNY7dSNxPr3c4ZV1kJel2uksV+C7aEZqh2O9z2k8X1gGzj
         lguPLT8AiG54M3v/vmzXMpwrN3j/zlsxb/AnpW/MtL1fx3N973h0fbKGvmYfmqC2M6eg
         IjAPhbSNNsZpgVSHeuzn7HNayHkDtipUjoZadpxZCHaTrTaqFPPGJ8T+tGsTD/ZNik8c
         5zoCvbs+FdNJqAeNwgCV4vKdXRo8CuDSwaDG48YZwKrK3ro/d0loqiBOHH7Cq6J6VFyh
         kmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766584393; x=1767189193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b6BJX3RO6Fa9KANLRZsl2DTswgSgqWJfE5bB/nVGOxI=;
        b=wnlgBbphWYLpMZxuFMWVTduLhOFQIl60YQDThTpRL3oDLhzn8+zn9ug1+kPEgwDpbA
         o4Gp9PBle1Mg77bbIKcoaDkDV45jSPUJZz2W++Ek1pJa54ivaLWAVf1ZcEvHCnrcO4tB
         YRWDQtZpqCYJMsCPffo1mMOTHyJI5Vk+9ioLogAL9WNoPnj6CZq1aPfYXlfNHywioFVr
         nXSpwY6HFEuO7z/x3b7fcRFVS7hvqzPFJQh1hTYobRhthfiUJtD3iMHDi/MrhpQCy8VX
         Oo9opqe+SGIpPaIWfiHDvrVP+azM8s3S3dslcq/1HmTi418zxklR35RF7JrOkdBXDf+3
         VoSw==
X-Forwarded-Encrypted: i=1; AJvYcCXZQQnsbMZl4+KhrZ1zUz/+oFnvzbh88TJ1Aev4k1l/g85DvQGh0WVavMkPsRyxcN7WRld4QOpfrfnR+gEVXS+F@lists.infradead.org
X-Gm-Message-State: AOJu0YyAfzivgqsQd93QRbYXNDGoA6hG5fsV833FREROCuFRO0Ume6cm
	2Pznrak+aTSH0aaPfpJUz+qxvwmhp4r0tqZJo8PRerYBE1xsGEYzRHOiD1e16ah6Wg+K
X-Gm-Gg: AY/fxX5oPstGwqOlnY2+uAc/iUg1If6VWfE2quxiF4EphVZu8ckS/r7IxJMNfFVZ/c1
	XaO2vb4S8wUFCZfKGgv013J1Bd6qHWZ4Ap5cyMQIZvUT5o51HY7j1m0wrUtlRkCXdGfdotvn7Nq
	aa5GlfwZ0NDjsedvepo17K8P098iTB0dkHaXwCYSw+hhRbMPKrOH3xo+/xSL9b4kjC/J8h6XsTs
	pF9WJypeZnrgyx0oqT1Q5mSjA2Jay8DVOP2MVOnQQGWHsxfsWX/1IGkotFktzfD5X5VecrGGTXW
	He6ZMUdJOr57cOsliN6nXPoBw1Zrj67t04sEsavfR2/Rz/UkylPMLcIUPjrMdUnIxtLU6WxGOjY
	MuJe8au/O3AOyjv7yoXXJ7KPjm4aGv6xir+Znyh7JdCR81jGjIG9/+iLFbzGMSgM/hZ1A5+vpHq
	sDWxej3EM2mdmDoLgFQsAobI2IGKB4
X-Google-Smtp-Source: AGHT+IGoEJirx8QYl35KZRbnOCp6E4ECh/eV01i5gqpOP16EPi53DTG8J8VmfYXqp0RVfgjQ4vBKMw==
X-Received: by 2002:a05:6000:2285:b0:431:1d4:3a82 with SMTP id ffacd0b85a97d-4324e4c6405mr20996373f8f.11.1766584392195;
        Wed, 24 Dec 2025 05:53:12 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:39e4:e84d:192a:5c5c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa64cesm34494677f8f.35.2025.12.24.05.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 05:53:11 -0800 (PST)
From: joaopeixoto@osyx.tech
To: linux-kernel@vger.kernel.org
Cc: ajd@linux.ibm.com,
	alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	bagasdotme@gmail.com,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	corbet@lwn.net,
	dan.j.williams@intel.com,
	davidmcerdeira@osyx.tech,
	devicetree@vger.kernel.org,
	dev@kael-k.io,
	gregkh@linuxfoundation.org,
	haren@linux.ibm.com,
	heiko@sntech.de,
	joaopeixoto@osyx.tech,
	jose@osyx.tech,
	kever.yang@rock-chips.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux@armlinux.org.uk,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	maddy@linux.ibm.com,
	mani@kernel.org,
	nathan@kernel.org,
	neil.armstrong@linaro.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	robh@kernel.org,
	will@kernel.org
Subject: [PATCH 5/5] MAINTAINERS: Add entries for Bao hypervisor drivers, headers, and DT bindings
Date: Wed, 24 Dec 2025 13:52:17 +0000
Message-ID: <20251224135217.25350-6-joaopeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251224135217.25350-1-joaopeixoto@osyx.tech>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_055314_749217_DCE5A8F5 
X-CRM114-Status: GOOD (  10.75  )
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

From: João Peixoto <joaopeixoto@osyx.tech>

Add MAINTAINERS entries for the Bao hypervisor components including:
- Bao IPC shared memory driver and its device tree bindings
- Bao I/O dispatcher driver and its device tree bindings
- Kernel headers for Bao (ARM, ARM64, and RISC-V)
- UAPI header

This ensures that the kernel review and notification system correctly
identifies the maintainers for all Bao hypervisor components in the
kernel tree.

Signed-off-by: João Peixoto <joaopeixoto@osyx.tech>
---
 MAINTAINERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index dc731d37c8fe..e50ad6a1bc4a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4321,6 +4321,18 @@ F:	drivers/video/backlight/
 F:	include/linux/backlight.h
 F:	include/linux/pwm_backlight.h
 
+BAO HYPERVISOR
+M:	José Martins <jose@osyx.tech>
+M:	David Cerdeira <davidmcerdeira@osyx.tech>
+M:	João Peixoto <joaopeixoto@osyx.tech>
+S:	Maintained
+F:	Documentation/devicetree/bindings/bao/
+F:	arch/arm/include/asm/bao.h
+F:	arch/arm64/include/asm/bao.h
+F:	arch/riscv/include/asm/bao.h
+F:	drivers/virt/bao
+F:	include/uapi/linux/bao.h
+
 BARCO P50 GPIO DRIVER
 M:	Santosh Kumar Yadav <santoshkumar.yadav@barco.com>
 M:	Peter Korsgaard <peter.korsgaard@barco.com>
-- 
2.43.0


