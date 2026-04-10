Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29D8E9907F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 10:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xFGKXYCuNL9Hzt5KxsbO6n3yPcfxQC/HvpIhLFtUJ04=; b=iRCn8lkADHGb6J6lWO71woOnw2
	rqcAdVGmYBko0CO6dmjysVR7DctThrSwmoO23L6OXhH4CDZBpV8etF1FRqmVJFrOEma5fzxAmubrC
	tlDwkzvh2RA7deQHqT4GPDSZEH7XHHuh7I0j/dIlJMer8x6XfQWdAflcz0csL8lPkgZjXkb9FGIRc
	LHLBjmdT/KQcKR/gGhjVfooaHMToFQLmO/YlDWGMD7aSoir2vrQLTG5LkVUyQQN1NH1LqFlWWUzW8
	yCUoo9QH1CVm66YhvV+z2iS7LED92rqzvN6wQZsoZRLSKPVTmfHHBIY6sCLWz+WjiInfwA+02z55H
	25DjHMsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9Ig-0000000C1Nj-3QBE;
	Fri, 10 Apr 2026 10:41:22 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9Ib-0000000C1IJ-3wpo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 10:41:19 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-38cd00b3b12so14960141fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 03:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775817676; x=1776422476; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xFGKXYCuNL9Hzt5KxsbO6n3yPcfxQC/HvpIhLFtUJ04=;
        b=Rd/LyqHEb1MpJmrf0UsPX0Fw56iy2nRokupdTYZihJQ913sOWuT5/y98BD83FpObMa
         W9OW8N965HZdO2+Y6RzWlRf7JqPbj3YMwphPVfNeZHK6+10c8+7FPE1Jx4N8nLH9r/8N
         eDME/9JdZuD2NrLaRfK9wwjD2mXsnxzlaUtKf2j9qGmvhowxsw538qXFXcCPVRTmayFl
         jnEloNfZp1QtPJnl/9BFdAvl3vNsJ8rUvYdGquu9DGj8BLZlytB7RduNaGqZJDBglnaH
         YFnHS+ceJ/5V27OAJQibZ7Q3EJdpDzfP8twKXieAfUIehDi6orOo6/hkjDJlccrvq3Lf
         i9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775817676; x=1776422476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xFGKXYCuNL9Hzt5KxsbO6n3yPcfxQC/HvpIhLFtUJ04=;
        b=h7Wt5lRwEuukqbzlyUs51RUcxAGec3k1tD2NIh3yhZhMoo47Z3YCTCBuLwG6eIcPDt
         DvgSGkWRkegJITS78YIT3/1rsGaPdHUyaSZuam3MvApStBblxPKXri/N3dQqdiUOrLzU
         3Ua1OrL4yJ7rsVeAa2+RQnNYk9qaAh1oEAL1kt34hRd1n1O7PjSXTL2zJv8YmJxh+AnK
         sZhkcKJtwtJWdYl0rwYNcKKsJ9Z9rZy4KfHTF0319v0a7t5Sw8TQeegXTFzHkM7v5wXH
         98W9Yh//34i8FFrfnAtaz5QfXK/LpWAKX74RFjZf+mVfcB6wkY+Sk1ym+MVBm3xwUJqG
         iZzw==
X-Forwarded-Encrypted: i=1; AJvYcCUrvSEd2GzYRh+yKlNzGdZt0xz2uzuEgMa+dGJYclEoS4DBouxwTmCbRd+hukVNsLyBFYZM17Cl4R0DVQvzbzSr@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/eHcZMQwzZXO2TTYh5jPDO+EblnVyjQVAWlcAV6jtOuUnnLcx
	j2qX6mkhUizyGH4DTFlWLY/SDOH39oR+wL3YKeJUOcBDDzMc+kdC0THmHNuXJJunraY=
X-Gm-Gg: AeBDiesKeED+Y1huBqGUXiUnq5m2izh4otnq614mM7Fra0db2Dq5PSu4773UuywxOdO
	cYxBbXOqP26z1tY8GM6kK5S+59eTnhGr0Y0T5tmcdxmiTdYrkgVH/Mlt1jPGnx8SJzwafhhslc4
	yO3gpqpp/Go5PxvT5apg+qdpXnxhxf1ETDS7PrF/MaA0jZKBhnpCawQJa351NymSh69LxUBQfCI
	i1bEZN/wkDDcazCQAGieM8GeA3rg22VJZKmOUO7HjQ1tFK4d6sGbvYPKOxfbwwEFNflQykUhRh0
	TqRJoiy0JFoqiXiMdyFf+1gR/h4kgB9vO+W2/9/CxLxjCDcfMffofoGouNO8UK+RTMM/qFC49bf
	YZyroTs1jDMmmk+PpXFzrzYVsFD+tEBSOQ1WURqyZT5f/SKCWV9EXuap/m8xyJ1ONP2B5LpSq9u
	n8nXNnGRUX5szk0U9NZ5SNskaMfJuerWi35y+66IZsGuk8UTiJ7ivgiE46OPkblMdl/+gdzijx
X-Received: by 2002:a2e:a54a:0:b0:38e:2093:1993 with SMTP id 38308e7fff4ca-38e4bdcb2a8mr8185631fa.7.1775817675691;
        Fri, 10 Apr 2026 03:41:15 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495455acsm5588331fa.23.2026.04.10.03.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 03:41:15 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Subject: [PATCH v2 7/9] pmdomain: renesas: rcar-gen4-sysc: Drop GENPD_FLAG_NO_STAY_ON
Date: Fri, 10 Apr 2026 12:40:50 +0200
Message-ID: <20260410104058.83748-8-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260410104058.83748-1-ulf.hansson@linaro.org>
References: <20260410104058.83748-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_034118_025457_1E1DC670 
X-CRM114-Status: GOOD (  10.88  )
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
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/renesas/rcar-gen4-sysc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pmdomain/renesas/rcar-gen4-sysc.c b/drivers/pmdomain/renesas/rcar-gen4-sysc.c
index 0c6c639a91d0..81b154da725f 100644
--- a/drivers/pmdomain/renesas/rcar-gen4-sysc.c
+++ b/drivers/pmdomain/renesas/rcar-gen4-sysc.c
@@ -251,7 +251,6 @@ static int __init rcar_gen4_sysc_pd_setup(struct rcar_gen4_sysc_pd *pd)
 		genpd->detach_dev = cpg_mssr_detach_dev;
 	}
 
-	genpd->flags |= GENPD_FLAG_NO_STAY_ON;
 	genpd->power_off = rcar_gen4_sysc_pd_power_off;
 	genpd->power_on = rcar_gen4_sysc_pd_power_on;
 
-- 
2.43.0


