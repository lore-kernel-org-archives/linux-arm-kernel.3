Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE2BF3D60E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 18:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wCXcpkuT9MjL6s3OBnbX3wIF98Pu7GQq85w5vsjac8c=; b=XpNpweLsMpiKmcPctNocMO2Xfn
	bexOcpM7jR2RW2WbbQE6vLuhC4Yllv4TewwCFUztg9PLVXd7tu51pVZzCmJow8cIUFYR3ESxlZitc
	ffajINuhd8ru8YiNhBnSR6rJL2GzVCs5EYkXRSxEsqbEWHlDV4oHrSu/FiRHUzJ5D13vQ6Rsmwqfr
	62qFwdV5nENlC7Dvu+3zW3SpkE69v6g30VxZsn0TIYbqtHf1iQQOC86QQ0xyZv39x3Xb9Z4evtCiY
	UUh5YydchYzjy00q4U1ikGCxFsy8oH6xtEb74rdogSyrfR0DIgBBtaNXUH3QD50nZ8sgWshEalPUO
	WdFQouqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6uu2-0000000AF07-3VZW;
	Sun, 29 Mar 2026 18:30:26 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6uu1-0000000AEzm-0DgY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 18:30:26 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-486fd27754bso36723315e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 11:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774809022; x=1775413822; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=wCXcpkuT9MjL6s3OBnbX3wIF98Pu7GQq85w5vsjac8c=;
        b=mFk91j/m4XwkOe0AUHNFmX0jsXq6bk9iyKZ0rLHseltjRKqSp91kXS/H3Sgvo0fMqA
         DtqJQCgDP2wFaY05r90JokgNcDDNSeXfcpJDv6uL8rbd/wq74ea0i85xNmH3XxDQHl3A
         QUlvvpmMWV55HpyI7DOo092Ge0FrCNBDSVSe6mJAzWOCb1H9mjQIWxoWM7KPTXYrTSCj
         5EBmDMwBfbqGGuEiRekwdZzT7YZ9dfZgTGZBPLzYClyK80AK/HVumCLiE9tStHYPxGqd
         e6JOoLAXf+l1e4LC2GQrY+OqXSMEahqrUb6p0cPMPao7GbVW5i1pbM86qerSmBVWiYJj
         A0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774809022; x=1775413822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCXcpkuT9MjL6s3OBnbX3wIF98Pu7GQq85w5vsjac8c=;
        b=EcrZPGW3+78cp1uTnoJfQQXaxxojh8AmoJQ/BDYg87VCmCp4dMjqmVR1By/ZYg2lv+
         LeCOzCrqvvV2Byp52eSRmPsDiGG5az1ombjy/vbwi2Pt71CoFoROyYuqkSOSqtzdq7wd
         RSMVsUZDGDHCqeBNg17gKxp967AjiCM/kqNpKkIpftR6EWt07/kiAVaPkqyR/jLdnOAN
         mGZY7V4L9KuQbqB6YJTxJuT20gV1hRyVg9Mx9LDTfQnQf1eZdBDWoG4QU8SX3athoqnp
         keCU/eekSAZJwwKp7dnsXoAynPrhu0QS/xtcWStIrzHRK0ubQwSEAutrC8va4sY+DrC2
         C1Jg==
X-Forwarded-Encrypted: i=1; AJvYcCWFRPVTqaEq/iBFxnL2h2WP2phWo6sC33GPEHGQCvn4Hi8LD9Ua7ayT/IT1rc69eXSQB+iJVMlrnYuqdYB5e8uF@lists.infradead.org
X-Gm-Message-State: AOJu0YxUNQIik1b97XfbAk3VqPr88W4lXosJL6ctbtXud2WWAahCWkwv
	+2d3s/faNLAP0ah4c7oDmpmJAzto2GHF6IdvEr1D6P2V9jwqDnxamFue
X-Gm-Gg: ATEYQzzoi1O026hV768UQjX7b6TGzwRZchkK9Td0TQdiGLHp6VXMJVBM3wzkV4yFSyj
	u6Ceiy9X4Yatlk5lvdmmfASS4u3SDLGbmp9ReuJ6t1Kgrfb/kxYp/vWa/MdSi14Cn64/rx4cBjX
	S9yuyJjgu3a2QB+i6nblvOCdq2PjFo5FmQMTjJJeSDYupB5VVIKivtHhXvEc14qichI+p4ZdNLY
	Aviaa6igomGDlqWtsZot+4RICYYgpQBpFb/o4HzXkvCusScwqSf/BF2A5IgTxT3hlHecbuWGraa
	Y6e3aocrkyhlFlIpk/WngO8kmXw1l9W/awlwURKFAm684tESjKZJYUR1dwnkO+GC76k6gnKdqQS
	kD3eGa/b+9tUnWzzN8qUz3yfUDqx5JE5x8H5iSa08G55foxjf1VRIeYiaB54ycWwSYRGj4jqILU
	/D//ZmY/1JG/syAlo+e2SbOZhZ1H0u2jVkw40XzYbYPlUIeXr+FY6Ics8=
X-Received: by 2002:a05:600c:1f13:b0:487:169:9f64 with SMTP id 5b1f17b1804b1-48727d73709mr164080515e9.12.1774809022057;
        Sun, 29 Mar 2026 11:30:22 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf245f8a3sm14307369f8f.24.2026.03.29.11.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 11:30:21 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: tony@atomide.com,
	d-gerlach@ti.com
Cc: daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	linux@armlinux.org.uk,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] ARM: omap2: dead code cleanup in kconfig for ARCH_OMAP4
Date: Sun, 29 Mar 2026 19:30:18 +0100
Message-ID: <20260329183018.519560-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_113025_118985_3A7476AC 
X-CRM114-Status: GOOD (  10.23  )
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

The same kconfig 'select OMAP_INTERCONNECT' appears twice for ARCH_OMAP4.
I propose removing the second instance, as it is effectively dead code.

This dead code was found by kconfirm, a static analysis tool for Kconfig.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 arch/arm/mach-omap2/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
index 821727eefd5a..f3f19bcfca2c 100644
--- a/arch/arm/mach-omap2/Kconfig
+++ b/arch/arm/mach-omap2/Kconfig
@@ -42,7 +42,6 @@ config ARCH_OMAP4
 	select PM if CPU_IDLE
 	select ARM_ERRATA_754322
 	select ARM_ERRATA_775420
-	select OMAP_INTERCONNECT
 
 config SOC_OMAP5
 	bool "TI OMAP5"
-- 
2.51.2


