Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE24AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 10:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uc2/OX4P4+qZ8YfdxG54xkPztMxglA34ZXzI4is0OPI=; b=E9C3kiRBf0nSw4YW7RQh+ATGhS
	oAyLcUr5pVTUVcucmR5rS2zkUiBTjPB2iom8ReLpO0dnezd9aatU9QA5ebGEs73c2MeR3xPGtcFv/
	oNQ8Zt1SYTZhHNjANByyLcoeIR1xR8R3TDPgjSHDRjxyjhSIZP+M9uU8hwtkl8s5cG9CmW5gSbby5
	8n+w9xi8esbOkt4nqnuPSSNXmbisLwGsHqu5xNJ1ZSWZbWHtdlV/JQJSXLHd936U7VXr0nlRsoijB
	tEOwaxlsTQXS6QlzpnF38Uu/4HYOJ8B+A7CTu1xi7302qGUvVVxYdNkWq5NysW+rznmog+Xe28/g2
	Udjm8Jtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgKBz-00000009ErI-3n5t;
	Sun, 05 Jul 2026 10:35:19 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgKBx-00000009Eqm-02cx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 10:35:18 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-842358aaf36so959614b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 03:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783247716; x=1783852516; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uc2/OX4P4+qZ8YfdxG54xkPztMxglA34ZXzI4is0OPI=;
        b=DfAUWTH20Wwpfpau759oHRMHPLH9XVtoT9us8w/IdLKZXZ91fxWyhYpP1DvFkskcb8
         i6Stv+rNZicHKylWYHiT59kSETA5VLREcR8YCY7H6yQCc7CMVSinOyxGu2+RiJee0WOr
         sCjbiWq/vW7k/1E4r4N5mRu/JzCuesSrS+yWr4KBcHp7QBcaADueC+yL1y7gF8WasStJ
         QfedSm/tpgv3tUK4tWCzM77/nN98ox7ooaiJ5Z6kvgSzospJxjOmdpGRl+b/ccXLmc+X
         oO5D507XvP3Bb46JlnDa+pyI5IeLqdZmOBX6+AbJWj6zAPWgZlfpBkTWdsMVplP0q7L1
         HJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783247716; x=1783852516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uc2/OX4P4+qZ8YfdxG54xkPztMxglA34ZXzI4is0OPI=;
        b=pUBStu3wPOIYdrta1BRM0j1YxVzbfWRC5zQ3r6zi723p1bz6I22Cge1+DeMrtm12LD
         ZYW80hN7pYqdpa6h8w7OqO9eRevEer4CrVSygdP2+nAMoW+Hf476LKY7qjNmlhU+3GSe
         aoQE6Sd8WgH1wTUYR7dspEAqMC6Wfks3yWUuXzgUapNfa6FV33aO4oWQls1YkifNqIZd
         eyyEvXoNMcBIHfHc8DkPYPqEChsD/rkbpdQpkFrgM2WWI7wVmvx2EA4oqjX6kNj5fmEc
         Q45m6xDK1h2/PViAWtGWMPAlDVyIrrt1ZEoTmjHJrTwQ8yJRs6cov513ia3dj9yRhNQw
         Ii2g==
X-Forwarded-Encrypted: i=1; AHgh+RrEl8AABrcPS/fuHtMF3S2+NT6wMM5GmC6MQJ8opLEEWCJJzTc0N0LvQcr1e/6je/RJUo9naKZBwCeOZ+QzUiGR@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9hSH83qnQjGvsp+w85Gd7H4vbQNdszBhx+qyclxXyka1Li3DW
	NttnacYdmsPvwgu5cBnu1B/eJdj2eos7omMuhdw7BjR6hPK7fxrQCTku
X-Gm-Gg: AfdE7cnCer1bMRlwsIWcrHsxB09RMKjR/qvsu+gKaliZffFq43fAfoKSQ+anJAU6wMw
	gJLs9KSL5uRNOJLVy9GXY8TKfm/imrf8XA7VTdwTpx8sAP3dqfs9NzkHxjAATdFXgQpJCEdR5zc
	52ZF47g2KmT8IUX3+36vyqFwum00Ji+zluoIj/iRGJw0rZUzs002cBka4p84fWDrTNvA6a4FKFo
	lBgcI2vKTgX5j7M0hANjue/DVg8yUyDT5+loi4S27++qxr+u5CY4P5tJG/i9uP6Z/PnTaa+pNCk
	JDvQz1hHALVvifdhgOmK39JP25ibATwOVzDuUufI78J7ROvzYEv97NTwLRD+CNVEhjoCZZatzL1
	LO+8IW6wU0FQ83WoHmOwrqrgDM9Iw8ieGASBbdEJBPQ846Mj2iX4vFRJ0okVnii2lkeKKKtY=
X-Received: by 2002:a05:6a00:2e1d:b0:845:d286:1fb6 with SMTP id d2e1a72fcca58-847f6fa9cfdmr5543003b3a.52.1783247715985;
        Sun, 05 Jul 2026 03:35:15 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d82382sm2129385b3a.49.2026.07.05.03.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 03:35:15 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] pmdomain: arm: scmi: Check pm_genpd_init() in probe
Date: Sun,  5 Jul 2026 18:32:56 +0800
Message-ID: <20260705103256.284467-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_033517_052463_E9A6CCF9 
X-CRM114-Status: GOOD (  14.05  )
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

scmi_pm_domain_probe() stores each domain in the onecell domains array
after calling pm_genpd_init(), but it ignores the return value from
pm_genpd_init().

If pm_genpd_init() fails, the genpd has not been added to the global
genpd list. The probe code nevertheless stores the genpd pointer in the
domains array. A later provider registration failure then unwinds the
array with pm_genpd_remove(), which can try to remove a genpd that was
never registered.

Check the return value from pm_genpd_init() and only store successfully
initialized domains in the onecell array. On failure, unwind the domains
that were already initialized.

Fixes: 7458f72cc28f ("pmdomain: arm: scmi: Fix genpd leak on provider registration failure")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/pmdomain/arm/scmi_pm_domain.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
index 3d73aef21d2f..a60189ea32a8 100644
--- a/drivers/pmdomain/arm/scmi_pm_domain.c
+++ b/drivers/pmdomain/arm/scmi_pm_domain.c
@@ -99,8 +99,12 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
 		scmi_pd->genpd.power_on = scmi_pd_power_on;
 		scmi_pd->genpd.flags = GENPD_FLAG_ACTIVE_WAKEUP;
 
-		pm_genpd_init(&scmi_pd->genpd, NULL,
-			      state == SCMI_POWER_STATE_GENERIC_OFF);
+		ret = pm_genpd_init(&scmi_pd->genpd, NULL,
+				    state == SCMI_POWER_STATE_GENERIC_OFF);
+		if (ret) {
+			dev_err_probe(dev, ret, "failed to init domain %d\n", i);
+			goto err_rm_genpds;
+		}
 
 		domains[i] = &scmi_pd->genpd;
 	}
-- 
2.43.0


