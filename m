Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F60EC143C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 13:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B2MfjI+hJWOgg7EoLk+8AQIgm6BBATog0kRiTKcn0Tk=; b=vg3qriSOQoyJIa2ki0jKVuU2P0
	/6Glwac1glzcdKn2mFUBAdSQYvUQ/1A01mKIuf0H1BDbHjFmQg3vvmGrUZYbm8pV09ZdChtZ0xhEf
	F/PpvKZS32DVunuZXoRpIxG3imxfVkIAZRwCbWEXXvMsstAARezItjDNFrgPENOTlutejJjG2oeGI
	unEokx4OqR5BQikGyo0EaEWBwoB/9h/EF2dL5JMtXxyhNkb04xH0+KQKS6BCvx6OC1H3T1tm/S7QX
	I+ARLNGeN9txljmxRbcJwuV3VXiBlWdyKQ1vYYFvkKqVRHcvNk6BEaWpSDWwEbaPsfEczVFXZ7s9A
	qfTsTsYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxPit-0000000FDHB-3QMQ;
	Tue, 03 Mar 2026 13:23:39 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxPip-0000000FDBw-3Mhf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 13:23:36 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-389e4330e32so84030241fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 05:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772544213; x=1773149013; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2MfjI+hJWOgg7EoLk+8AQIgm6BBATog0kRiTKcn0Tk=;
        b=MNdNryf86D7nnbGLnilFj7tnZ0rYo52luB2FzGkYNWH07/og/dAJ0v+9U1bjetKsQU
         tjSoosbSAGuRH8MQb0OJZpqX6Y+NpZC02L6OYZWIh8F1fNGlU3vpxS3BwGgRLUNPhxsA
         61uGNWbGzGXerpm6PD3hIKuXDW7xoSu8ZzHSHz1i+YIOF0vy27d28SiPKucwH6aazwp5
         wQWAYd9qw3mYGe2t37wBTv/HxmGPKT5FoKmFJW8LyegRz3Pxv0vakS1mz7JKp7EtvTl0
         Z3vu4YuSGly9K+QyhYzwHgGEWOO48YmmH12YyoNI4P3J+odiZM9BdIJsQ+HN/oO8tx/T
         4POg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772544213; x=1773149013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B2MfjI+hJWOgg7EoLk+8AQIgm6BBATog0kRiTKcn0Tk=;
        b=B7h6qrPYRHSdcK49HrJEAgMNaaBpgFyjdYbR1Lt7Go1egEuX0/ho6QgJYAxrNcJ4ni
         lL55g2KlJH5Tvp6L4zZ/aw/f5qtL0j4XOYMepwXlBUL4oNxsQQcih4Kam59cXwKWtxSJ
         vGYOHSU0iQH2GZGOrPVP+opXC7KwDe9VXPEmkz4jdqX37ijPcuCFT315l8jRE2lIpemv
         xHl3Vozu6Ia/QSzYfclOm563eEVQVb23zeoMnbkvpLk6dEGc8F6EbiB6TCec5n6vgkNl
         4eR9Aa6oNxfq+jHrV5Gftj19iURR3kuBUS+MTUHKZtZD5R+9WtXUhR3H7MdEJzyAfg+J
         yfdA==
X-Forwarded-Encrypted: i=1; AJvYcCV5+kyylX1+NSq5tGVik8It5FGuPOL9a1aOUPAq0Oj4DrPuE/PsAtukcvwRsvvorMqm5R0lZ3W3ZqhoeNaiEIGf@lists.infradead.org
X-Gm-Message-State: AOJu0YwQvwL63PnaonBJdJKyAd2KYZTmscz1ozthlcH4QpsSPJIMih39
	m7awhhr2TYnyQYjNEPQ1oJ85lCsFpLauUzK2o4wRAwzjn16XjBSXHV3V/rchzJOT8Cc=
X-Gm-Gg: ATEYQzwprXZEA3lAgOpdYw3bNutsdItK1CaoGJvLk3uPX/H3fJ9T1qYzg1y/8Pbl/3i
	EWc8BEYvVtDMNPCo4vegMgNh31sqGhf9PZowDXk53tLBpCzDVGUNBkodoG/GW1m4O1wlA8tKB4n
	o2KK/0ue4wu/L6N/P5KTeIkBwticxSAln0fOWlmz1oUH6H8fpK/rS+UO5iy6SfYH9mHaY6LQyTY
	VNaXUaRPy+t7bbKxvDoer4dHlh0SrN0mBmnAg2Q6rjHMT2F+PKEe6sj5uub7sT3J5f9eWoNkeTd
	sfJ+KI0wSUKi/zTW2ZTikZRA70em3oc6D6Jmj2WIEkmAUY8/ddh4+xLCItRSZG1A19Wxwf0KED7
	Z/9EYHf7wP+A5VFpmSMX4ioNYjpVCECCPKfUHTp0jk5XZhAAwXtEBCFChJ5mwZ4sCWYpQYJLiYt
	Ll6XrtNpSFSMMjeRFgWuvfjq5YtWz6ovpHUNHrJPExNezq5Zyo+/DT7kzX/RU/BPHh6AkxMRx9
X-Received: by 2002:a05:651c:515:b0:37b:9e27:89f with SMTP id 38308e7fff4ca-389ff363a7cmr109584081fa.37.1772544213430;
        Tue, 03 Mar 2026 05:23:33 -0800 (PST)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1235811e3sm587866e87.29.2026.03.03.05.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 05:23:32 -0800 (PST)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-pm@vger.kernel.org
Cc: Kevin Hilman <khilman@baylibre.com>,
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/9] pmdomain: renesas: rcar-gen4-sysc: Drop GENPD_FLAG_NO_STAY_ON
Date: Tue,  3 Mar 2026 14:22:53 +0100
Message-ID: <20260303132305.438657-8-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303132305.438657-1-ulf.hansson@linaro.org>
References: <20260303132305.438657-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_052335_866462_FB6C30DB 
X-CRM114-Status: GOOD (  10.96  )
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


