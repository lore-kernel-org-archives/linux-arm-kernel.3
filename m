Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C27DC83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 12:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EjmnP04SfQHk+b63Z9FzMRfEl1AAdadnOvsZgedn7VI=; b=opc4qBpbX8LbJsJu6nls9x+Uh+
	vw1Wp5+6X5KbkQNzzmO92Xl/R5wpantr6LnzDBU1pEW3uiOsUQcJj2fEOWtz0TlY+vPvQ9y1m/lrQ
	qeBlOEitbT+fH1mTacyEMNz1uhKxrv64B/SMRo8Gaxpk+3gLEQ8mLsNSuJv2iurzof2VIAKZHB4k4
	Ul+Z7qiOHNC0YMyKWto3ZY91m7YLFLaKYeCvrf0AzCch3gPINzDeSN7erRu3qzOB21z8ivlR55TtU
	s6GlNYrEpcoLuFaM9EEqsxcMWtW3nFd7xLY9ZibHsqcpQJEgdKLc3yxbhKMOWGhQ5whG8/O3r6BYh
	8YwgFYAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWa9B-00000005K0i-38f9;
	Tue, 01 Jul 2025 12:31:37 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZT0-00000004ujd-0eJb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 11:48:03 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-555163cd09aso2419903e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 04:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370481; x=1751975281; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EjmnP04SfQHk+b63Z9FzMRfEl1AAdadnOvsZgedn7VI=;
        b=YIdgKdnHqIcXWcwjH81btfoJ9FfmboTgAQRBpkX3eWo1Qb7G5mnnLjB9oNkRVINcpa
         ge0/Bh9Ivi76q1FK6sBdpS09oDlp3P1kjoTa3coCVcZROov/FO2rDJgNfa4GG6G9bJNf
         kkdGbO68gyf+PgmUK3sjD/MEB9JvWboXty/SY3iGr8Z7z8iYZWk3C4dPCCx+4z8lJxNy
         ly9CtCd3rLknvGzN9w6vBFazAzHUMGa9ijtrQVJCOFVn/xuSozT9/3Suc5+FvkZIO0hG
         mxTcSEn0YfvUA+hio+VXvh97/cqhFliBybrpqKBX1uDBLxMuOf9KUWztymd2g9Zq8eHP
         URkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370481; x=1751975281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EjmnP04SfQHk+b63Z9FzMRfEl1AAdadnOvsZgedn7VI=;
        b=PUFqZmb2EEo+4wWpRlhPTwsoxw7tY8THVWD2VOBbFI5VdP7TbOkbwpMJ646cQabhhQ
         eTybkJPdI6aF/GCMOQJWs6ZXY5Kf/S1yv8+BCject1qO4QPzKI7v1PkdR8Q3vgd9g2q0
         rSwdFfyWGWRRo/LAJK1iNEoLf4Q0jiT8ShjxB0eY5Boj26421TGaM1XSOvvkNy7FObIZ
         1ei9wEdZVBZiKhzoNOJ5Q/6O1dgPh+R2ZbZEUq6yWzbcHonIojh0290GgAYviW6pXrJW
         9N3T1Ay456sFQrZSGskbXszjkyPgCd2jCpq8Avfkap0xAtNrgqa73411gK0Vu4DQTN06
         fNHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHyrR3TS7OcVNJwnAzJCGFxWhpPA+UvB+hYRHdDuDCNR9ogl8SyElQzIYqK/DQi1yUK7Ug1G/18QEWBNOd/Krn@lists.infradead.org
X-Gm-Message-State: AOJu0YyEu1Hv67R5pTgSvsO9XWXhUv4usRoZppf4VDwOE36c+SCemFzN
	pGbPHMgPZVKK02ljiciqdYw/j5oqSFDmoB0UuwV0/Y/v/NMG94dRlmqH7r0m6/ZdiYI=
X-Gm-Gg: ASbGncvtAaMUprR2wk8HugYbItwmyF40vqSzqRIMZpu3zrgXbONZ8rB3gJmqrD1viK3
	bPqpHBbf5u9SzI4X1OPl5Vk80GPLWdjYmmI1BjcjiSfZrGb0ir2UotBrh6lmupCs3QxL1VuBymZ
	5I+xJ+8xGOlRAaUUj3KtkCLKIGhe92xX6mVYSrg68Mr+COktyYWeiNQD2NKBWwHoiR/vIyudHpq
	xZ4I8hti8mT9LGKxNH3WelECEZQnM9VyUu02a5GLmlRI3z4O+Tvd+Mxxwnk6UtJcCkMZwrjHM20
	sM+E9geJdV1PGWbHVlR9lugRF/DTn1AQypgMq7Rxs9tiKX2uVtdTymja5/1pSQNsY/GLLBnaNh9
	uu1YmK7HUMssjj0S7FkaS3R1MV/bcAm3/ivUcoAAEyZpc6K4=
X-Google-Smtp-Source: AGHT+IGgBYI5CrDlNYn12cn6Hu+izxnojI0IJ5BqsjI5oNKcH7trnNHO9mFo0wcOyH2jWbqlzkJ5TQ==
X-Received: by 2002:a05:6512:68e:b0:553:addb:ef5c with SMTP id 2adb3069b0e04-5550b9e4441mr5040371e87.54.1751370480552;
        Tue, 01 Jul 2025 04:48:00 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:48:00 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Michal Simek <michal.simek@amd.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 12/24] pmdomain: qcom: rpmpd: Use of_genpd_sync_state()
Date: Tue,  1 Jul 2025 13:47:14 +0200
Message-ID: <20250701114733.636510-13-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701114733.636510-1-ulf.hansson@linaro.org>
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_044802_206492_77E2394F 
X-CRM114-Status: GOOD (  12.98  )
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

To make sure genpd tries to power off unused PM domains, let's call
of_genpd_sync_state() from our own ->sync_state() callback.

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v3:
	- Fixup the prefix in the commit-message-header.

---
 drivers/pmdomain/qcom/rpmpd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmpd.c b/drivers/pmdomain/qcom/rpmpd.c
index 0be6b3026e3a..833c46944600 100644
--- a/drivers/pmdomain/qcom/rpmpd.c
+++ b/drivers/pmdomain/qcom/rpmpd.c
@@ -1144,6 +1144,8 @@ static void rpmpd_sync_state(struct device *dev)
 	unsigned int i;
 	int ret;
 
+	of_genpd_sync_state(dev->of_node);
+
 	mutex_lock(&rpmpd_lock);
 	for (i = 0; i < desc->num_pds; i++) {
 		pd = rpmpds[i];
-- 
2.43.0


