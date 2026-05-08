Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F4ACD37A7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 12:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OSIE7E4h7lWy1SBxFs356ugBkbZI4NVO2rqkoC6AUWs=; b=ebZ5Y58qsVTvoGrAJp8ovBlGXE
	TF6NAXyAxJgio/+2GcTcYYbVLqUZMjXt1v4JdqxwUhxVEsqT3ke9muPrwjsgXkWnyWCTN6B38R/ib
	uGdtPbyypxfUiuvQDihVze7Hfg9ajFLt8oe/fqlJtBPXdEfEUDA09bwN0jKdgYyYcdHvRFE2zD2AH
	CqYzLaQlEKcBQLXstql+UsizImO8fvO1VgWyNrru4s1e+sZSEBGTtAGcJMj8FKj54ddIZ3tqnKece
	if5MWivilYMOb64TB9NXLEWFFR0pAfsgW1xQz3NS+WQibdodIGDhMv87QvkgUw1/SuJYR1CDVH9Iw
	tOXPEysg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLKUV-00000006TEX-3B7w;
	Fri, 08 May 2026 12:39:39 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLKUO-00000006T3z-3xax
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 12:39:34 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5a858881ad2so1987192e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 05:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778243971; x=1778848771; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OSIE7E4h7lWy1SBxFs356ugBkbZI4NVO2rqkoC6AUWs=;
        b=KeLDmB3jDx7bbQJz8PGGbG52LtuOY+B1FHGPECRUq/dC7TUNF7q6+pBBY40BXkFmFk
         nPLXIkfHs1d9a8Zk+h5tI79m6JDHEkapxytrD2kgv20qrJcr/XmaVMPtJR4DdgGVHIRe
         uzo0FbzzCXfvP7Of0UKfbyqXXoFTkyMcKRXixCyQ6PEeZ5JLrgYEZyMw3fxtLFSaljCF
         0EqKMWz5IMJPBcUD0U49OeRAwr/ocdnqcQj0lvUsfsAshZPu3AAw74a6Syt+pnoMtxRw
         r4XSZ5xX5b2LlQIMPwOItM84fu+PmvKnT/iz3nFfSEfiBOW0L7ka0SntCEmrZKr+NYCL
         bWEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778243971; x=1778848771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OSIE7E4h7lWy1SBxFs356ugBkbZI4NVO2rqkoC6AUWs=;
        b=ke8yFtFsi6hvz5MR9OjSYLRERxM1uxPwb15ZgU7FJUyt/X0aVRGRn86/xEqmSgUSpX
         w1T6qhRoUSA1nrn7z647W84u5FzyewHVOMBKqlB4m+y+hQC7cz1i3FE91kmjEMEfDZBc
         EODDC04MZr5LboIYmrLPi569LrHmQez9tLAr3EgdyV2Lghx2+jZhsL5lrc/DsvI7HtnH
         YrrlvQng+f9snfCc20u5enrXWNbsaE4iIAPlOyIQN1GoGFRGFdpiqCHhFLThV5g1A/6U
         uuSlym33FUQi73DJKZ/KgIY6g5HCsGv6ZagflHqWJXiR8K30eMaechdjVfngAjZp3bds
         q6yQ==
X-Forwarded-Encrypted: i=1; AFNElJ+j85wT1jKx2DYV3px4hpGuoVo3UR8S4tkCNVidz0L6KadRNYQoE+YCfjDMm7TybMk/ffdGG0Z6wpVrSeEX5g9O@lists.infradead.org
X-Gm-Message-State: AOJu0YxkqoR2hz9aZK/ahoEK4F5AdorjXXTzYIMo7Kk+CElrN3k6Z+LR
	5fRCs7D3lU1HfMfHW6C4i0SO1SDvxe3+uKtI/Q7k7UlGMzb+HhbQyJZK8umTs1dkc08=
X-Gm-Gg: Acq92OEtJYMyEeCcIjzooUAWP/tdjHZXvpivkpHbd+7RX0Djk3lKm8G4hCDOEcdPekk
	jxcYE5D4JdwNILBGWWTMSoQiCC/ZRXI9N/JWUFXxHlPNRXDDxnssyPeaOoMTt+ylTLGBeG/he2F
	JutM8nG8F8AFZSmhiuRMvdw3JYhrPoY1AnVxQS55QJowFzKgQAegi2If5Pl5Qqr339fnm94GmKP
	pbV7+336tXGbUAxQx32d70clqJt70TGxBh7lI6MwYulHjyw1inOAzNRs0PaZLE4OfPjAs16xg6v
	0Qw0/zBCWVf/ZI4AjOO7iXp2KWNQx1h8d9gsdy6X/bSb3o+P5+n82Gq11OkEqc23nS/mirfdy5b
	FAw6iVWwtwYqSQXf7id7w+Ju7AA2/83z8tW8V2KPRgVimJKYk9k/8Qhq5sO+G0NkwJVrolzvPpu
	Q5qOzlI689AivAC08hO22cc0emOKoQB1RrlwIc4m7TQWS1AqquyrmFgHscsNIdPOAHh6RhY/bZ
X-Received: by 2002:a05:6512:3d03:b0:5a8:99bd:12dd with SMTP id 2adb3069b0e04-5a899bd13aamr2719864e87.31.1778243970587;
        Fri, 08 May 2026 05:39:30 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5fcc7sm4569621fa.18.2026.05.08.05.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 05:39:30 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 10/13] pmdomain: renesas: rcar-sysc: Drop GENPD_FLAG_NO_STAY_ON
Date: Fri,  8 May 2026 14:38:59 +0200
Message-ID: <20260508123910.114273-11-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508123910.114273-1-ulf.hansson@linaro.org>
References: <20260508123910.114273-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_053933_003992_E1183CFF 
X-CRM114-Status: GOOD (  11.32  )
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

Due to the new fine grained sync_state support for onecell genpd provider
drivers, we should no longer need use the legacy behaviour. Therefore,
let's drop GENPD_FLAG_NO_STAY_ON.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v3:
	- No changes.

---
 drivers/pmdomain/renesas/rcar-sysc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pmdomain/renesas/rcar-sysc.c b/drivers/pmdomain/renesas/rcar-sysc.c
index bd7bb9cbd9da..e4608c657629 100644
--- a/drivers/pmdomain/renesas/rcar-sysc.c
+++ b/drivers/pmdomain/renesas/rcar-sysc.c
@@ -241,7 +241,6 @@ static int __init rcar_sysc_pd_setup(struct rcar_sysc_pd *pd)
 		}
 	}
 
-	genpd->flags |= GENPD_FLAG_NO_STAY_ON;
 	genpd->power_off = rcar_sysc_pd_power_off;
 	genpd->power_on = rcar_sysc_pd_power_on;
 
-- 
2.43.0


