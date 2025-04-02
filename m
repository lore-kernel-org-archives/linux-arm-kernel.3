Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D23C36017
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 12:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zEG4gecI8tD+Jl0eEYFS/WRbrree3429dPKL1Yhc7hE=; b=xXYr7JBz3v2sYLPbPjPd1f2hec
	nEheFQ5HbvANTc4M0uKXy5QtuOZloB8es8woHMnDbW5K8Zz5aVi0bCOPim2ac1iV8iEuCMxbfoRxx
	kcxMPmJT6NEim02YE1JjWv18LcgjejW2jkQ31l2A+ulSJgeo2fpalvS8lv9iXlGHETrIFd9cwaoyV
	Y65nj5SY/9zwA0t5GMmzDSBWI1037kiVamyuBeYQsqxn/RwQZeDSl/ltOIc3N4ClxTyn+jvL91Chj
	QeJ8ik6wh994zm5A9R7CgEBZim5bZKB91M+5t7fMHKIVhaAD76iSm86g47mWCok45mnuMiYg6V61n
	qGKrsREQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwt8-000000061X8-3R3n;
	Wed, 02 Apr 2025 12:08:10 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwrO-000000061LH-3fq9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 12:06:24 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-54991d85f99so821354e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 05:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743595581; x=1744200381; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zEG4gecI8tD+Jl0eEYFS/WRbrree3429dPKL1Yhc7hE=;
        b=wLKfQDNqfzv3MlC/TfcOPbswwiplMKX9fe1yp4HpI6SXAA++OmVPczl/KlVSTTWmXV
         sdQ7SIS70wP0WLIPUOIQ7+RPreLFG23tiGqPjUsOBdjEphl8m59nvdBZdFPsFq8Unoc7
         H+JmTQqXXnPTGk9nG4W2c7GUY5kqmSzd7PFT6HIljonGNrzsxIoEVjW43w8Vg1ABqL+p
         8ry1QfhbmjlODH5DxAQsbLUTLJgGXgte/j+IO2wI3M6eGFIc3wpiTndzN0d2PZBwXZ7H
         OVhOLt5VDG19uGN2Immtif+U7zYhDTwXF7xWG230KxDaarAuWdKJCYTfa7MuIEOe8AJx
         4xPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743595581; x=1744200381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zEG4gecI8tD+Jl0eEYFS/WRbrree3429dPKL1Yhc7hE=;
        b=HWtTK9OpSR1S5WYezC4OwXl3Co6tTgHa+FOa9+Nvf6XfcBfsk1498sOrcTUtpP9rhh
         65du8JCBDShN4IJvulQc2+NM/QOIEEf7jEUZB8f0trMdMv07DK0n+bEH4zg7kRudZsr0
         M8XbpeSVakBidm5P/s6GIkD9SAB3OrtFiWdpuacQuC2ZES8RfkrLi9GpeXVSQfOgQLG0
         mcrsI2SudzROThemwyPdgNhUwtPWMcWSNKlc5HpNOXvmPasvdtCbOvsVBHzn/2C32YrE
         Bta8sEVzBAm/DYLrphuwH0EuC+v6zyQ4Cw8NnpiAnbAjRyrKnkxr0/Ibpzvu92AjtLB+
         t66w==
X-Gm-Message-State: AOJu0YwMiZsHYBNO1ha/BYRzMDizWWjRd336bBSsMpoc6CmdbtvCM7/N
	bAlTuF2030f3t6PAMiBaXLwnyUZBD9b/9Zli+nK16w0+GD2JqLWtTDeX8oUXzSw=
X-Gm-Gg: ASbGncv5T8hyPiWSUfGPebTEDnJqNAMOoo+7Nv6m9KMVKpFPHOi71adyQ8h9yw+mBcM
	8v4whBteAWXi7CZCSa9bz2nb72eGwPaQDDee7I37/rumobHbqNi/UHfIqYyY6kNfWU8//jwk3To
	+kuoLECYsP1rbjfVY09slxiTWCNRLmfNCetsiaaZ6Edxd8038HISwducYKSK0e8/oLvkZ82Zm6r
	Ob7FjLyVUfVKjQlrNBoUX7oiSjWqzlF6KX2kQOxZkpK69QU0YiWZzeO7YatxVUcq/J7i6UPumE5
	ew/jGlWP2SjvvZLqNjSd5aXTAmpRBJvQomLfW1VK2WWob4oHyNkj8VKFlcSD4Hyy8qSoUcLEyjY
	RFaQEe3zWHtI6vt0XTuE=
X-Google-Smtp-Source: AGHT+IHAorU5HIF63fzGnkivetyexueQYMJ3ZBC4Gy8XB0gdbMI3Klf829/ZF7PMB3Gu1bJ9VZlDzw==
X-Received: by 2002:a05:6512:3d28:b0:548:878b:ccb3 with SMTP id 2adb3069b0e04-54c1a1daf7dmr682827e87.25.1743595581025;
        Wed, 02 Apr 2025 05:06:21 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b09591bc4sm1594858e87.166.2025.04.02.05.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 05:06:20 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-pm@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pmdomain: core: Reset genpd->states to avoid freeing invalid data
Date: Wed,  2 Apr 2025 14:06:13 +0200
Message-ID: <20250402120613.1116711-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_050622_939170_DF25F7AA 
X-CRM114-Status: GOOD (  13.41  )
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

If genpd_alloc_data() allocates data for the default power-states for the
genpd, let's make sure to also reset the pointer in the error path. This
makes sure a genpd provider driver doesn't end up trying to free the data
again, but using an invalid pointer.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 9b2f28b34bb5..c179464047fe 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2229,8 +2229,10 @@ static int genpd_alloc_data(struct generic_pm_domain *genpd)
 	return 0;
 put:
 	put_device(&genpd->dev);
-	if (genpd->free_states == genpd_free_default_power_state)
+	if (genpd->free_states == genpd_free_default_power_state) {
 		kfree(genpd->states);
+		genpd->states = NULL;
+	}
 free:
 	if (genpd_is_cpu_domain(genpd))
 		free_cpumask_var(genpd->cpus);
-- 
2.43.0


