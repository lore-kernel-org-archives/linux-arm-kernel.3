Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A369DE99076
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 10:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ncq8CIy6j/Z62nAIbhODRfhoacPZ6Dyu9QP51nZww8k=; b=VkxEGlwAPG7gTxBJv6Bo0QZeA9
	CuqH3e+b8HOy981SMc7xcVIqHzg2CulCL7BKsaUyf/rTUUbX1ElS+V5jL+6XHjeUaNsEt/zEF5yqs
	m3YTasxVk1JjO8/soggv6rnPuHRIIVsISlJzCWfrAAd1gx6Dv/6ysbO80OOxsX28rqwxJCBZuFWlV
	U6fd5/PYWNlo0M2dWy2uMM1Ledk5kGPrO5Ex8a21H9VO38D3ctVXIkKbLo5ausbytTyy5NZWTZ++Y
	RANaJ4utcRooFkVNcvHN2lXH1D2iFBmvaOOzdCk1VZnvntpPJY0v0sNWRZMVNJFqKim8df6j+U+b+
	dxGcY+9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9Ic-0000000C1KL-0Smi;
	Fri, 10 Apr 2026 10:41:18 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9IZ-0000000C1GV-1JB3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 10:41:16 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5a283c44478so2956327e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 03:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775817673; x=1776422473; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ncq8CIy6j/Z62nAIbhODRfhoacPZ6Dyu9QP51nZww8k=;
        b=ysfjybx/oJAEXBCSrPg7HGn53ISgwzYaiHR4uN1AI64wNcSf5jiW5e/iu6e8rjZ7Lt
         DDSYfdnNE6YxaetG/1kA1N9cA50kRQSH7aTkj+7Dfr0lZwF/nYeK7LZa5O27zRmGFJ9M
         JWbSH0dNY7Yhzp8EjuYd7LGgLOovI+644iT+9TkQERKfWsWngY4557TmzbhpSvnNR6uR
         kRxnt0/oX4ytJXpBGxHTyJ3d/qRqMTvzwpxronLUzzmkIzSwpxqCKlzaL6Bi+Zuq5blG
         ZRVD3jDbRHDMcmI4CyVkWOZgCkywpZ7nBMs8U8TRjGOinoXiP0UJAA8hZqNtSbt6/lY2
         cAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775817673; x=1776422473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ncq8CIy6j/Z62nAIbhODRfhoacPZ6Dyu9QP51nZww8k=;
        b=OJitjj78D+LfjKBJw4klEtNwCK5M2SOjf3ho79chjsQ4Gvn5lBX31c3GLEMiXj/l4F
         MfWr4TzfLCvTgTGQDF3vifqxqOgcg4saNqljxApbYu0NrcnVs5oxtsOQjsMz1qd8ouPU
         WKFs6IO6Jj5uPk2+LWUkzsShg7aNkt+WXKstWu8T6gbYe9UegUJ8/KefYeCC8VBNAg7b
         eqWnUbHBCd8da4cUO24KMzNieW+9aYq2VF2WgB7Nui5UE3YufZjH6cK5FBKahkLnHGPB
         AWVNVHKelj4Cn3p/Z5hA9uDqpy/iCZlvZ3A9xmg4/WtOTxhrwjTeK2EqUpK3KSSmZs0Y
         8iGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOXt6G1KebbCRbpFNQdJyXovCNnGQ0X/9g7Ex60/ELiIga31y5jf9EgvnaDdpb9g4Puwcrolfns7myWjMqiIic@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo1VMcBm8hfKWP7hvWZy7Ib9BppA9zPcP6C9gU2mgXsa4cEXr7
	9EySeCrgNUDpU7cISuqxKISjluwXX4JAuCCGgojTwqtMMkTvoNrtsf7n6sEazbUnuZQ=
X-Gm-Gg: AeBDiev1aLcvQfejIa49IauPu2RBUqygSznYsN9tDMiij4BQh92vxUK59eyPLMYBwsH
	Lco1zneNLb8kbF246/WJysca3lmJ0Ob+HtIu5F2bkRw9bdx0A+ai1LKbLl5p4sRVGoYbOf73TyS
	82c71vAE+xGRMn1/qQRvbqyVy0XHESpOYRd49QN+KpzmdrVFfTBg15VcHZIbQxGFrCANGGbTLJT
	16DtMZhrnKS8zaVNczpnYjH3ew4o65woj3yoIVQxqVuxdQWTtzFlx37r8gDtzLb8MkftgG0hbRe
	X+o5a1hG/ASlAty3Kc0Izhfkt61HZxLso6zRfgS0yiPBETYrSywz645HU0mekXLPH8aljNKI0SY
	Sj+kWgjQug7+XNyfE09ROsvnm5pR3pw9oyLPTUTr2whmm2gjb7p96wclThFByQ3vbYlKSGLy54W
	Jau0q8M/1aJsVOj6uyhyieq+vC01RmmVOBqs1f47OyNrBKO6DKcZ2/GBKUWmQAZGXa0fUrSu2TO
	G+a1T/CzOM=
X-Received: by 2002:a05:6512:39c6:b0:5a3:cebc:65ca with SMTP id 2adb3069b0e04-5a3ef6fe0c8mr858352e87.7.1775817672992;
        Fri, 10 Apr 2026 03:41:12 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495455acsm5588331fa.23.2026.04.10.03.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 03:41:12 -0700 (PDT)
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
Subject: [PATCH v2 5/9] pmdomain: core: Extend fine grained sync_state to more onecell providers
Date: Fri, 10 Apr 2026 12:40:48 +0200
Message-ID: <20260410104058.83748-6-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260410104058.83748-1-ulf.hansson@linaro.org>
References: <20260410104058.83748-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_034115_371090_E9B25BE1 
X-CRM114-Status: GOOD (  11.82  )
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

A onecell power domain provider driver that we can assign a common
->sync_state() callback for, should be able to benefit from the improved
fine grained sync_state support in genpd. Therefore, let's also assign the
->queue_sync_state() callback for these types of provider drivers.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 783d6f981708..f11dc2110737 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2918,10 +2918,12 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 
 	fwnode = of_fwnode_handle(np);
 	dev = get_dev_from_fwnode(fwnode);
-	if (!dev)
+	if (!dev) {
 		sync_state = true;
-	else
+	} else if (!dev_has_sync_state(dev)) {
 		dev_set_drv_sync_state(dev, genpd_sync_state);
+		dev_set_drv_queue_sync_state(dev, genpd_queue_sync_state);
+	}
 
 	put_device(dev);
 
-- 
2.43.0


