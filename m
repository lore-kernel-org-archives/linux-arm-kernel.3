Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9AF3C54F47
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 14:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gFJTs6Oe3tZDiqGEPhPZQpV8g2gqNJNZcx49AsG9G/8=; b=OnALzOu4Ww9iT3PwWeprsVQD2w
	hAMYxh9K3TFQ0F5ZfINo6VMMYerewS4lLp6Cx6vqOpu6FPU2GQDVOFZXhneSj6FqgnM2sOVdN7i1Z
	bnymAmZ8o80tMnXx5tOIUAzsUnZu+TdbRn4Yh5hf1sTm1FYAQVyoRSe011cBZsf+w9GR789eDzHMc
	fYBnTiaJCmBD8Mifk7v0KzgCEq5AaE++x+rzBNTaWS4sOKNa0hGA/owosLF2cgkbJoRq1Loo7RX5o
	LvxdnqU2zIE+Y18a4T7xw+ik4zREKgKibxEkMMozZhE7+UX3W7ltOke6h8oNlbCx93495X2uDU9vr
	+BlIDDIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITbG-000000045hU-3Nep;
	Fri, 23 May 2025 14:42:18 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISdr-00000003zKD-3QQQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 13:40:56 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-550eb498fbbso8779952e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 06:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748007654; x=1748612454; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFJTs6Oe3tZDiqGEPhPZQpV8g2gqNJNZcx49AsG9G/8=;
        b=l4OqMqi/lpvO0rVQORCyHe+lDKMqFgfHC8xQsax0rgePcJaaVWvYIeLcWSQd0NhSk4
         klou+7zOjHvAlWTdopKtyJ3/RsydSq/MlMnrcAeRrFzQvk3qqhsb71nmKaJ62wrmVsqB
         25h1+D5FeUTbHW89ebnfcxKbHfIinuc+lciMRHCAizD4+KMojMQhXjPKtLi6BRbKA7gf
         49gEnuHFXbzSCTjpjbDGnu1/dOfENwVt+YlGWPvWXxwokzj0sswE2gosrWcDvwTMRp20
         n/j82QmoH4Sie6PaxjSz7POBgKwLXJtWZIsG+T9x5sVuWGj4jb/BYiN/3Si+4l3ijiHQ
         bTsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007654; x=1748612454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gFJTs6Oe3tZDiqGEPhPZQpV8g2gqNJNZcx49AsG9G/8=;
        b=eqGGXa7KKLahGZGghlo17OLylOajafSXoZZ3L0mEe5BvuqPvLo5pj0y/Sp1vZ2MR+p
         0XVbWasiWzc8SffcBkBis8mKnfL/xrk15zMi0BlAmFmxceJsQ67Bq1HygR4ApWY807Aj
         tiOsBdZf9Uz9b6epWpl5eXkh1HfP7SnrM2dQukD3PGdjKZjRO/2Ct9Yq6fhrYCanBmZq
         EVpRBtT5nCY24ppTtHi05QsqyP3HV2Ih9SDT3XHzz5pBWI21kC+RDnyoS9QmL5NyjYAH
         u7seAIb5DB2o4/FdEgJaThJArLo2m5jfD02S1L41x+zyLmUz+ESdcg25OxiVU09DxNjh
         kyLg==
X-Forwarded-Encrypted: i=1; AJvYcCUiS5JLkWCNFdsLFd8THKeclbRPlSJiPvWf5LQaM39p3CzSh1j3Xz10VK1T1KxmSsKEUlaxEC9lVZyxHYIx73kF@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3SJY7lUkeiz+Ty6Ncw1UMAQJE4ZJfNDDWsDogQBHmAyKVdMpZ
	U2NpB0ekxJrhQ3x9MHkbiN4X9bceBm01Fn9qpYCdYbeaETa5yXBBZIMlN0DIO4ewr1M=
X-Gm-Gg: ASbGncuWzIxVZsejrRUK85Ns5f+E24VF2wSMc1AN2d4PNQu6q+DcH61MJ9zArVIqZD3
	fwzxisOz1giEfd17ygX6uqa2Sikq3QHf1oEgek783ye8CmKVZ31g4t9ILiTFPaJs9ljyP0r91EC
	ey/FdNmv5K2YIM8rb1Txm1AU2N+jMd1NbYy1JD6qt/9yw9UiKOrWRHfSAEzl1LaqDYbrs/aWGKl
	Xkg7hDjb5zynKQ5gO3eDFz9HOQqpIpPIMNohk6P1/VkNVb1zczNJhIvDPhU8XBLDSIPVj1UQCV+
	AUikj0Ibt8ubnHLkOJh73HaGDwc8L8xqJVd0PIND+knAnA9s3VmfvendDPLsJKE1pT9Xzyqxd+y
	aVysomyXhdRdyZxJxRPrYamTpRg==
X-Google-Smtp-Source: AGHT+IG9T3c3b5OoxUcS87R1wLRRFL3PdXpvlFYoXNj4F4WD4Ace3E+S/nh+np/agz5oYIx0/z8iEg==
X-Received: by 2002:a05:6512:6802:b0:549:5850:f275 with SMTP id 2adb3069b0e04-550e990904dmr8181500e87.50.1748007653840;
        Fri, 23 May 2025 06:40:53 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc0d473bsm1950609e87.244.2025.05.23.06.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:40:53 -0700 (PDT)
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
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/21] pmdomain: qcom: rpmhpd: Use of_genpd_sync_state()
Date: Fri, 23 May 2025 15:40:06 +0200
Message-ID: <20250523134025.75130-10-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523134025.75130-1-ulf.hansson@linaro.org>
References: <20250523134025.75130-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_064055_851336_A147A567 
X-CRM114-Status: GOOD (  11.96  )
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
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
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


