Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A910C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 14:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p1v5BxmP2rCNFSOwTVJRGcqOBB5QdIDbO+mvb6vcgSU=; b=GqdhnsivrtEHG+7EQJM2cpnMiW
	3A2Tn7ZqAy0ceB8Dg4ial7idtqcoYpBLfpLPteKuqJo4Id7unpjlgjKFi9F8hHaGji30ZI2np9icP
	5SKEhkAALHSQ8i3O+lkhW4vfTEeUwv/1442j0VkOjE5Q5eqFdW/mLObVA2tbgh9b61bn84ZwqilK8
	bUKRjAwWNTjAY5BdBrovY90ofw9XOkoRi9eFk7bbdP+Qdr2b2zs/tSmbqsnK5Ry5wqNsSskohpubN
	m8FXjKAhJPdHDLZ8UzC+P/CF7oTRo2izyNlr5yFAeI0FESlt7viSwBoCMmTXQeuLVZJe2X/UPGJ5h
	CB68rKcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk1ib-00000004lAI-0aA1;
	Mon, 17 Feb 2025 14:03:29 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk1h7-00000004ku9-11Dv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 14:01:58 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5461a485a72so1154700e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 06:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739800915; x=1740405715; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p1v5BxmP2rCNFSOwTVJRGcqOBB5QdIDbO+mvb6vcgSU=;
        b=hkANVxNOENLozlW2s2DAQ8Tqtkec8Ro3CeIv5UVAva+juN+7H1XV+rAnAvmYLmXnc6
         IRWthaIHsNiFraXv5uQGdJSQLl+Lydr18XjhjTMc7Jkv/bs6Tu28WrFlOMfzOVCtAajd
         WfYLZr4lIF8nzuwIzWJjZLBjcf3mo2wa1NbNE4+K4ljdEDZetnRITGuBexoqXFlWlMPN
         d/5i1Gdz7D4XlgTuQZzHhrMcbhVSpBn63j57gKo6qlKbpZ+17gclf2I9YwKNbFsjzHY1
         5uW7mgcFjfFYcbm7j4W6q2rCEwspEbnxC5DzuGov1PN5YayLKjGSuAJuWl/Fi6963R1u
         8HNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739800915; x=1740405715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p1v5BxmP2rCNFSOwTVJRGcqOBB5QdIDbO+mvb6vcgSU=;
        b=h8MPqurNfzxtfxEL1WP1F0sUtFIqaHAy8Q3XIqL8sl4LQRazjxdgxSUWBtJr+XVXd1
         /r+TuAg2rAtLiyai53zdvTAjnxCn3aWLFVpe2BqMMMTce3Wy7FhfTpekbGl4MDkrB1DF
         t15Y4aufrqdDtwa9Duvo30uwjfhIsakRIg6J1Fzd8zUeWzO3my3abOWkZS7QShbJbTXf
         KbP+/aXpX7/8JNzfWHWkVSzJ9x75m/Wq2Q8dvO9nB8Puc67uhdjPFF0RmppxjxdeWWNK
         Nmt7rPkdgJyUScTOQDFvnPT4T6Oyghb0p7B5It6w9kFqV2Km+blJ1XPB46lSv7k18Of2
         6whg==
X-Forwarded-Encrypted: i=1; AJvYcCUQKMrEnFd8VcidkuTqadFM62T6W2vmoyARs5VOeFW7Ox9iI0gDfxGo1vLCC8HcLL2xgaVn/AeIWKOkIygGRzH1@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw7HwLyRpsV4ubvtmg+XNI8KCqKrZDoD8A4wTGL4tK11KNqIMP
	Rc0q1NktpODCO0q1zJlYUb90c0DbUONHHjoRxehgFE/wyRRmkdr66pCCYND1dWI=
X-Gm-Gg: ASbGncvZFuirgCj6kd6xIw3lMlWJABDNTsjPuInd5jalUaGi7akELamQPn9ycBfGsnP
	JAz5z8KktscEL7IwfyvWZm9Km4+tohZWtRLmbuYhe3CJIpo0p/+bfzOJtrJeF0WYIJnPCF5kPE1
	C53bbBssAMeWj6BOl5/m9UgPsL7S2kpIklgB6W7g/9nW25cgMbVvCzW4Iu9feq0EGuQw/eNCG6+
	mL6buP6GUfoDMdpIWNaWexprbdp5tozQGD6aFyNVC5KzodC2a6w6V0lvPbS+89SSGJyisyvpK+r
	9FJ8eSZd/4noPlNjflptYfkX7MlN0gt8fb3Tjjv7uwvlgvOYGw4wX2Jfc8V/IwS/Dw==
X-Google-Smtp-Source: AGHT+IF/D52Y4+TysjkW4Xz5QNqCyiJ7TzizrtncOHf/Kr3p06spV8nAGCs/R5F9Gjj5PmpWjUddzw==
X-Received: by 2002:a05:6512:1389:b0:545:1718:98d3 with SMTP id 2adb3069b0e04-5452fe93081mr3468336e87.34.1739800913531;
        Mon, 17 Feb 2025 06:01:53 -0800 (PST)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5461d1d8fcbsm608806e87.83.2025.02.17.06.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 06:01:52 -0800 (PST)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] MAINTAINERS: Update section for cpuidle-psci
Date: Mon, 17 Feb 2025 15:01:45 +0100
Message-ID: <20250217140145.117086-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_060157_288026_8FA1C875 
X-CRM114-Status: UNSURE (   9.74  )
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

Add myself as a co-maintainer for the cpuidle-psci driver and the
corresponding git-tree, which I am already using for this.

Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 25c86f47353d..f2be70dec4ee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6087,9 +6087,11 @@ F:	include/linux/platform_data/cpuidle-exynos.h
 CPUIDLE DRIVER - ARM PSCI
 M:	Lorenzo Pieralisi <lpieralisi@kernel.org>
 M:	Sudeep Holla <sudeep.holla@arm.com>
+M:	Ulf Hansson <ulf.hansson@linaro.org>
 L:	linux-pm@vger.kernel.org
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git
 F:	drivers/cpuidle/cpuidle-psci.c
 
 CPUIDLE DRIVER - ARM PSCI PM DOMAIN
-- 
2.43.0


