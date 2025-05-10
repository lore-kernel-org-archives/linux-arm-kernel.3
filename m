Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8677EC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 01:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KcbRw7WL1aA35JdPyMCk8b9GQjgHfODnY0TIqzziuqQ=; b=N7i57LbKP1p+K2sgwwRmh4/HCg
	X86hyupazkGMFcnFoA8CuZdAmv4clU8BnBRn4kP3saPl+K34ZwxQgCrCqHSD77GpTkdJSU5dVb72t
	JPvgzj0yadNzM7b7/0CqIpp0f6/k5acSEHeXNjns+I5w+tTYBdT4kIGz5IbTPYPVBUoVVP/3c2Tzl
	N1R9t+/gxBQj53g320Lzo0iHA2aCP8vhPLumS4FsL06GRpQklgSYHRJPPmdxJW4JSMJYoJXPY8YaE
	myHXx7VEXi1RuabIFcUwEr3kvSgDvSEOB14KraMvWc2m3wKub46zhuPG4cW/fWrwa/VAQF0Tz5pWa
	OYVimnQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDZ1E-00000005G7l-2ulf;
	Sat, 10 May 2025 01:28:48 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDYre-00000005FGP-3bTa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 01:18:58 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so19151955e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 18:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746839933; x=1747444733; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KcbRw7WL1aA35JdPyMCk8b9GQjgHfODnY0TIqzziuqQ=;
        b=MmU+CWv9qnjy/j90IGdiknrrijKR0dqQwoQPziBh0piz/bC/CJeIUvs3bERzw/xY0j
         bxLB/QaiFeSPiz9JYq6WTczFZ6spPMnntWA8PLrPclPpTQ6pWZbp6JazjHy5CGguGyAU
         V1TDZqnz+ydZ2wi9XgNU8oloI9dmHPQmLbJnyVbhpcwvY6L9fO0fdED1iXGNbpHFJvkY
         2exaIy9qavkR3wg2F2oaET0Wb+6nzHCF/ZVHT1nno6ZpyEul+1EZc14YnAgbAMwbcH+q
         dASok/ifea0I2apLPCCYwrFwVwMyc3LYBUzjMZZbyj/cXIhaiYaEMo2gsTkCNWponlSs
         DR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746839933; x=1747444733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KcbRw7WL1aA35JdPyMCk8b9GQjgHfODnY0TIqzziuqQ=;
        b=xJnHLyKedHTi1N5FYOxnSggMLv80/CTmQZdD5ptWgO5bv3jo6llE8vASur48Lpzy7l
         piaJvJLNvjziDa3mmNjX/kyPGuCV29cCwQupFHkSREpzlPCUNlUDcEdg3DryDtg/2Nsi
         KDvPwAX4UDaf/ps5M6MEaFMtvVS8bavmvuIMMxKM/Q9MsULmKj+wDxZ1iurMdLnyT0ez
         z4PB7WXO+Jir1XJHEE5BpU9sjNa+ihKFw2RUD0InejZ2/qnXrXyQcUy4FPp2yA0EyRKC
         9CUAJvDSQFAkWe2UrJCbh5Mmp2Xm/EdUnXft71HDLGBJ4bkeIfYJsbjT7n7t7FdodmpS
         OT8w==
X-Forwarded-Encrypted: i=1; AJvYcCVfN05ClIqfxnrOyLFDkuquoZ8bQYgNJIoueZJ1BJRhX+usoZomU7MRltaD/89I0Q7HUCdopAiXTdh+eqkrTXte@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu6sc1VoiWSH9SM2LmL2H4L8JVRZn2ltZe+wOmjlunPDo5qU7r
	H/Hm4ddEDbrfQC5tHmc1Gip+2xXpI8dfCaDmijiHBHyeR0mX4gyU
X-Gm-Gg: ASbGnctpH3y8lBrSu7lKpLuPFKQ0+OA3GmX7xe6ISepUWhh+A/1ig2sRo27vA1RiREV
	PyZGBRfyG1WPHOpfkX18GuQveDudXSXXFXxWBlzxTdswMksNUr+zv+N8LJKdSTe8G1KomZLFi9v
	+piNOzPZU5S4yee32H7OPMmz5dBdKYkDWhPQwhBv3JT6W4+SdhJlZXmzVa7mEgAiy+lPCOXDke+
	OabQeArA0tnTjE0JwQ0YZVuQotG/ZiR/ivbTexSSkrjhqaIHuZof52sgkbxQB3l7iDtOp5DEpTG
	zYJhFwp40To7eH3Uv9X0ar+8TLokhWcz0UDGPqf2Z0C8FSvfgDzGIbfhHKFp8NFLcQ1s2OM=
X-Google-Smtp-Source: AGHT+IHslDelJiKBr0u5zFkfUSe0cpcfUyw7dLCX3sH7zQ7C2K0jEXgxo60/V/aqM7KalwC2bIriTg==
X-Received: by 2002:a05:600c:8207:b0:43c:ee62:33f5 with SMTP id 5b1f17b1804b1-442d6ddcf2dmr42021515e9.27.1746839933274;
        Fri, 09 May 2025 18:18:53 -0700 (PDT)
Received: from localhost.localdomain ([176.206.99.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f0easm86967305e9.12.2025.05.09.18.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 18:18:53 -0700 (PDT)
From: Denis Benato <benato.denis96@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Denis Benato <benato.denis96@gmail.com>
Subject: [PATCH 3/3] ARM: imxrt_defconfig: define CONFIG_ARCH_NXP
Date: Sat, 10 May 2025 03:18:06 +0200
Message-ID: <20250510011806.13470-4-benato.denis96@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250510011806.13470-1-benato.denis96@gmail.com>
References: <20250510011806.13470-1-benato.denis96@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_181854_892379_068DCC3E 
X-CRM114-Status: GOOD (  10.53  )
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

Define CONFIG_ARCH_NXP so that CONFIG_ARCH_MXC won't be disabled
as it depends on CONFIG_ARCH_NXP.

Signed-off-by: Denis Benato <benato.denis96@gmail.com>
---
 arch/arm/configs/imxrt_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imxrt_defconfig b/arch/arm/configs/imxrt_defconfig
index 52dba3762996..7cc1555c0231 100644
--- a/arch/arm/configs/imxrt_defconfig
+++ b/arch/arm/configs/imxrt_defconfig
@@ -2,6 +2,7 @@
 CONFIG_BPF_SYSCALL=y
 CONFIG_SCHED_AUTOGROUP=y
 # CONFIG_MMU is not set
+CONFIG_ARCH_NXP=y
 CONFIG_ARCH_MXC=y
 CONFIG_SOC_IMXRT=y
 CONFIG_SET_MEM_PARAM=y
-- 
2.49.0


