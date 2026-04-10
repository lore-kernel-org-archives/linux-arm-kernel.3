Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A74F364B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 10:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q8wAkh4o7tl/zj3dU8ucWDwim4K0cFPOmp+J3PD9wxo=; b=ASlUxOpZDp0kl2gMBmxWPtyQgp
	g/3PYNsQw42HjE78nFsgYu0nMem58RjXRGhKasgmSeApRlvWiYwnBFDti03+hnJMYgTvIbqxGsjXH
	/5JFzT25wViCqlGMRz51rYyvdBB1PZdHO+r6m9vTbvAPTu/zs2Lf+vx4MZBtF9axhBiutEDkPJ1hQ
	5K81TzoxfbKP33vl8hJSW5kj1Ao4DedG4d9ALZgVoiIQvKsQ3oK9zRlPM/5U6VPJL5gWquhD+GkpP
	SuGjNQB2EhHydO2jnl16Psu6wNmD8LvKVRiorSEoBaKf+CT073f05nJNn0sjpTjSurLTcBQ+JXI0p
	t/G6Ak9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9Ih-0000000C1Os-23qH;
	Fri, 10 Apr 2026 10:41:23 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9Id-0000000C1JZ-0QRe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 10:41:20 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5a283c44478so2956415e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 03:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775817677; x=1776422477; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q8wAkh4o7tl/zj3dU8ucWDwim4K0cFPOmp+J3PD9wxo=;
        b=eYGudX9UlcC5wVuD1l7nxMPhPy6wQjfWxO89yPmHpv77a3dulki735YAhq8UW318gl
         U6jSBfb27WFf/O4Fmvbh9J5WOzI0je1ixmWahwZOlpxUgKNUsdm8dFJGgW65oYRSe+n3
         om3GgsWasIDPMRJ55du2vWHgD/Hy2t5Tsrb6vGlNZtrwRVq4UWly8if+j0lSJ3fjSZ7j
         pLM5XSXTVZs3hoq2AkIJCPdymxk1L1CNqgbpRzSk5Y0OXSX2WFPXaAANJGUYT8fUd1uN
         2UuGaaBAXZV4cIbxhCehvB6E+6TnMJyyWYWMSq+23gV0U8RKDPcHIzbcSaITL9kazFbV
         RSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775817677; x=1776422477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q8wAkh4o7tl/zj3dU8ucWDwim4K0cFPOmp+J3PD9wxo=;
        b=NJpshj9BqWXM+aJ6vQwpzr1hO2x4K/jnIYSq22y4XE446+RuyQLVSURCanPeK2AD3g
         TaTDCb4AmVDcQK9lRmHYrVkG9xQ0T88zUqX9bVUiGGIU/4DHseqxmibi2bsg9SoFLqis
         ODfPa62Vf4zCWhetXPGLHaY3P1RRHPIo7SEnFjmsX7G+ZAIG9RpAhdMi3zaEm7ubrM84
         nA/2rrgjpHf7w9jr9eTfR1m1LC/fGtS78fmAC+JqQDYX1M25IB7urnJZm4RMy7t3SHBa
         Tp7XhHAzjbhMQmw5nGgQEEgNK5RXI9C9YpiWGcGN86KwZt6LV+g1E98pkOmfui2C2is2
         B1bg==
X-Forwarded-Encrypted: i=1; AJvYcCUBZkfmtx71933jGNYn11NxrO+nfm3RKAnc4ZfpTOc6FP5KmBMKwEa9YbABqTIB4jez/sjeqMPVnB/IPMhE4dcF@lists.infradead.org
X-Gm-Message-State: AOJu0YxCdJ244t8zOpXHaXyn5sGCpPxRCoMG+LK1iyf/MsqQKmvS7sdP
	CNKPhSZShMIB8CQZb/AcCW8OkCxVbRbELJlH/jGwCqyaIZA0zeFx+XwIq0dJj2m98Yk=
X-Gm-Gg: AeBDietGHw9GtVBwnpsxACpmUYQml9oxSbplRw/YCjJjFYk18MEZ6X1Qe85RqvJPK3g
	su3mTIeTyw1nkGQgh+tV+qk5cihNu2l6uTGdN44+xKGsbgASHPZvQYoL3gQ635rvfSTs4T4iYnR
	9rNy7nduYgspOdTJd1tS8lMZoatkaaBpWwsMdnte14uUEk7druVseG6K4y4CGgJjqDqkxwSiBTF
	xGkKE5gCMM4MqIAC7TBvLXzRZioTjcp3FaO+VyCbavA4cLDdo14Y9ZPKeat7DL45542k3R44y0/
	bKqjwIqX7ZXHw0GJj/ZHCrm8gcm9Iryb7pjccKGzOoYhGrqhpJGjDXss9wnuODU4mq8dFTJg/9t
	9VjEO8YGlPOoNNEP62Qcnc2T6VMbqu/5iEEXV8hlEwuqpmv5iN7d/ZA8EPvLBYfXTVIUQJ0aoBf
	Iq5+J1O0xtMbHHaHQ/oVx05BeOadTOExVNrkrgGpq/A9OmvrmK5nrbzdfJvsb0ioXhxUAXCY71
X-Received: by 2002:a05:6512:12cf:b0:5a3:ef60:f2a2 with SMTP id 2adb3069b0e04-5a3efb5a8a3mr827213e87.43.1775817676897;
        Fri, 10 Apr 2026 03:41:16 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495455acsm5588331fa.23.2026.04.10.03.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 03:41:16 -0700 (PDT)
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
Subject: [PATCH v2 8/9] pmdomain: renesas: rcar-sysc: Drop GENPD_FLAG_NO_STAY_ON
Date: Fri, 10 Apr 2026 12:40:51 +0200
Message-ID: <20260410104058.83748-9-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260410104058.83748-1-ulf.hansson@linaro.org>
References: <20260410104058.83748-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_034119_160522_0B1CECE7 
X-CRM114-Status: GOOD (  10.89  )
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


