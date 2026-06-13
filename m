Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23B0CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 23:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+piKGdfpKolr3My/nM07IULWkn0gDvLzO6znvEN8MGU=; b=icJIwQdQc27DW6YegZIpCpQpZ7
	zTGN2dFYsdLbmoh4a3IqxpIbA+xi0zavSVh5vJCP8DGPuUAhzsRHWOm1b1WWn6LZaAoVpH3cLRnL6
	nxX21n7M6wokWA/PyoDfNtRQX85+MrLp4HmaX0Jub5gqj8X/JK9An3Dc75eQQ8H4HwBODEdHkNEzU
	00x6QmEGI4b3UVJOFDWZKy999CGTm98fnC2uv69CSX9KjYHgl0qNoRy4h90ZmJT0VNHpWv9WTKMxK
	cSR0Uu8+axUf7FpyzPcuoxaiFwtDOAXKMomH/VbjLb8+P1xzqJ8XkNNhn2cmxEsNMnHfof9bDD8QO
	9LqAnzvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYXML-0000000CbMv-1EFx;
	Sat, 13 Jun 2026 23:01:49 +0000
Received: from mail-dl1-x1241.google.com ([2607:f8b0:4864:20::1241])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYXMI-0000000CbMb-1bYB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 23:01:47 +0000
Received: by mail-dl1-x1241.google.com with SMTP id a92af1059eb24-1363fe80fe8so3141852c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 16:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781391705; x=1781996505; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+piKGdfpKolr3My/nM07IULWkn0gDvLzO6znvEN8MGU=;
        b=LHO6IsfX1QPFEHRvHPxujmo4h4LCvDkhwaX+lJEYGpRTZ08C5ov7WA2hyugbIGAY3t
         rlmww1zkvHj9iKK2Q0amqf9vECT2kQzGBcKbY40ofGpX+JjNFAfvMwwPthWBrz5NpSEV
         JEfsrRCCPCbw90oXoh5MGPKBGLdEksQofLC1TzaU6o31/1fDjuqPFY/Qhj0nNKpuHJIh
         YdZ2Mqsn3VKT0VZPiCZNhedTRD2jzWnGzXFoklKseyfqyK2BlxXqqWpeaOYdvyUi4ihW
         uBeZk2rszY/3BqxiXDaSuOgCOWQ41asPoTYe5VOofdrCNvBTAEi0qn7uBXOg1nQeCJi3
         Bayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781391705; x=1781996505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+piKGdfpKolr3My/nM07IULWkn0gDvLzO6znvEN8MGU=;
        b=QZus/CZc4htAYlVrNx5ezG5NzAtLJ/oFgUtArG+FbRWG3PL839zpTlZD+zKmWkuIBI
         svsNrf8hcVNPXvBsbSXs8bAKx9kQmRYvQH3BmOSO/iWykrsygWIWSnugsxZ5DoOSiSMP
         m1Vqk18IptV1PlpfAOSVsvMQxvDpL+jjzXk9KI4jehsmHbpLOBTgfI8y4HIb7Y/gcKsM
         IwK2Jo6p5C3fEtP1gCSccCw5+Te8PnvUhX4dkteFYXe21tjA27UZMxU9vf+xNg/9FXGb
         M/+XMTh6czUWGJHmBPiE8AOxxCVzLgO8neKGNIsxcN4biDjMK/24AlxFQFw1XdW4crKE
         oQNA==
X-Forwarded-Encrypted: i=1; AFNElJ8QSZYrN/vVnT3MtNd9P7VErkH4+LjE0/ZkzftN/RlT3fEo30YN4Z0YXp+keUVAIF75Gm8VkdTEY6hcnhs+i1oq@lists.infradead.org
X-Gm-Message-State: AOJu0YxhGPeAeoJW9y00ehldAWO/JY9SGGLWI0ToUO6WtWbpsDTbixHr
	Nvl10D2gM3d4iDIoSxgcYFdsApjWVu2b0QTME2f8/zLC38WSQ4b6DN6fiZFm+DBL
X-Gm-Gg: Acq92OGUFiYbgQ3eFwrj4+rZtT/xaNC7mD1yCma8JLgtmlfAxvqoJEyFPEHKXsK1b/y
	St95CpQJtt0YsbUD+8otlIVD0GXsg8g3B49M9DCN/h9ByQsJil8UDKre/03kAvobxwvLYMSGzu9
	xHj8d3MjiO0RblGbHeZKB4ddhZqLiaoXplSC4aFl0G/xElXyTD//As5jBP2yvCsgHNEegtgdUzJ
	ISZc+ivmyF+26RK5obtmK/ThhGL4kf5uipXl+9AizGKTd+rCZughQ0uUiKChiC1ZfY1lAwJpAlh
	ABHzSxu5fknMTK6mqweW4ZCsgSR7UPg6EBCk9zSawNt0VPcQ70EIO7t5B7UP9fNvsUTkHeYTAsy
	fo+a7uGOHb8bYUwkdAzS+rTtunS6zBBQGqh33fP1B+CwgugxpwFAqWN5FzjLzLXFdNjK4IZKHWY
	G6q0xbBfzPjfztUu91ERMJGaxJbXBXo9V6SlaRp5XYa0ua+iWzA9bGOQ5tlooac7ERnn+cxk5eh
	xTdV5WVCUcYtY+2IU/lNsfVWczzFkVIt6COBPheNAM8KbiYFKQtNO/+0navr4pRiEj2iXOUHf38
	bLbxEIDU6ajWU85R/Q==
X-Received: by 2002:a05:7022:79a:b0:12d:de3f:f3e6 with SMTP id a92af1059eb24-1384bbadc69mr3140136c88.38.1781391705352;
        Sat, 13 Jun 2026 16:01:45 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b964853sm6169253c88.11.2026.06.13.16.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 16:01:44 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: Kees Cook <kees@kernel.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Cc: Russell King <linux@armlinux.org.uk>
Subject: [PATCH] ARM: mm: correct CONFIG_ARM_LPAE macro name in comment
Date: Sat, 13 Jun 2026 16:01:36 -0700
Message-ID: <20260613230139.141855-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_160146_421603_A49B68AB 
X-CRM114-Status: GOOD (  11.67  )
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

A comment in arch/arm/mm/pgd.c incorrectly refers to CONFIG_LPAE
instead of CONFIG_ARM_LPAE. Correct it.

Discovered while searching for CONFIG_* symbols referenced in code but
not defined in any Kconfig file.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/arm/mm/pgd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mm/pgd.c b/arch/arm/mm/pgd.c
index 447945836c3f..7c56279bc5bd 100644
--- a/arch/arm/mm/pgd.c
+++ b/arch/arm/mm/pgd.c
@@ -78,7 +78,7 @@ pgd_t *pgd_alloc(struct mm_struct *mm)
 	       * sizeof(pmd_t));
 	clean_dcache_area(new_pmd, PTRS_PER_PMD * sizeof(pmd_t));
 #endif /* CONFIG_KASAN */
-#endif /* CONFIG_LPAE */
+#endif /* CONFIG_ARM_LPAE */
 
 	if (!vectors_high()) {
 		/*
-- 
2.43.0


