Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7203C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 06:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=86ZMXQ7rWbd5+Kz4WmVDnIj3yBwaLGUiWHIv6rRn9PQ=; b=NFIfZ818sw2HzsAiFApMZTESB6
	3FnWZJx7hr0/FPTGM6tjQb8TmviR/CNE7XdPQ6TjdRMB5l0it/5z9kr719ooACtL1li8yLZfP5HEK
	kN1YRYmCdpxL0rix293ZrWBZp96xp3rtBAhhjWYVgHqAx6a9XPIKL3g1BT8L1Zja1rX4y3pWArW6a
	fxrZvxc8w7yATL2axTLb8canZ/KAIGnNqolX37T1i3mcSFNB/BvDZT+00SNAoXE+5vCHR7Pn+Fqc+
	ZSomDyesTwVS9rOd7/WsZulLf7qMhk4IxE+nWgunvLarXPJr1BYQ+WLE9z5JcMSI+vcE0i0eYV1uk
	s5OCbiEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x36D4-00000004k1S-0SOP;
	Sun, 06 Sep 2026 06:18:34 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x36Cx-00000004k0R-1K8Z
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 06:18:33 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2d53197d8b5so21307575ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 23:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788675506; x=1789280306; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=86ZMXQ7rWbd5+Kz4WmVDnIj3yBwaLGUiWHIv6rRn9PQ=;
        b=b0IwIOQlcEc9MqVA/NsomIJsRzEzCNW9lsOaFQA4qjotvbQjtwy9RJIVs/w93ffqf7
         lYL7Ng78WvQhFat5VYU5Eeu6vaWLFfrAR7bCajqTbclmk+yTCm2PAf53y2HR0BK2rcb1
         ok06B2L3rJK4jl33/urzhy2H2xHykKOeQpv1Ub1K5bQjchib6IVsJ6vHmvNNUMnqd3MX
         GSQRh7yDFxCEqWfK+1oPJnxUoTPdsV0gEFXOlkQ44SyNDlYhr8Y5nSEZwfPm+bVmrRx+
         rgex1ND5N6cVXLDrtZ/5cK+qHwXbcpVC4Ax8Mi2Trtl+XyspynulRE8irOX/bBCYxmXg
         Q2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788675506; x=1789280306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=86ZMXQ7rWbd5+Kz4WmVDnIj3yBwaLGUiWHIv6rRn9PQ=;
        b=b4cMSj575xE3NPUN0pRanbSxQK8Vf8gVZM5jipTHfWWiQBEwW+nYeuTESVktuAs8rG
         6P3UjfkmykRyY+Yg6OU2QtgEG25d2ZlPXgcEuIByuiZN4iGgDzHrsbRhj92qu2tBiB+0
         Vn3us8TaZ5CQS8ANzEDqXIGm7bxfbQYmC9U9GM4wavrogvP/2t9jJaR5OCenIDi3weyX
         3PWkpxpJNxxO8NOipJgZBYBejKnbT2sw0Kx523NLWhh6MtKshWXDh7XoFylz1jBXcbSy
         vS8mX2MaM44wMaULGRdSJJ4alwRddR1iqXgXXSu802YzjW9MJ4G1FquZXpCDJsZqN907
         9yLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGWwDzLzPvs9HS9owArkUq6Z6EaoN1JpDzXHghHpHFnjXHAmMxr9NS7utnVr7J4v8bGrVFXys1E1LTxQJLKP9i@lists.infradead.org
X-Gm-Message-State: AFuF++kf8flGCRItrWAHQ0iBInhzeZdrUtk1QGAoafP9uVkRvA5GI8Ki
	b9KrkGgId2zDdwum4fPydZfqHjlEpCsh0oQqq+9Ux1aWuIfEoACjeq7FuYxGt5zF
X-Gm-Gg: AYBFou0OQWDtYXn1IsYqlJIXIAJI7lMcAEtpavRYvKyuJt/HR4xx3bnifkhU+LaEEz1
	vkNIofacRU+Vs45oxRt9hV2Q9DAAB3nJizi5kW8QNVuCQum1JwEduFCDN9KuhYDAwSziqfY7w5Z
	2XbmGs2TtdLkEXQOxjqf8gEe+h4Qv3Y+eveKq8O4j51d7GRZDDunZlYEJgdollJU9uuK3YBsvKl
	a/FxnVj65sTFvy0J9zFPBNYOQw9eEi7vlFax7gB9Sh2mlLizZzWUu0gisL5POcD2iSljhBFEjGj
	fg3mOik+vY1K8/SR9MCxjFw9OLqzHeuv4XSqoolP9e0Hd5kvcQEFJ52efA9PEubWqmXaAe0J+M+
	pryFUgXhVTtFK2rws+LWhZbP8znlF5jtcRQmqm57JL5aeIzKjQttxY7LM7tlnSlLBH4ZX0W519v
	OUrHhymFzIBRC7HlhKv+8ATTfgsuls6JRZ0welVxfoB2bXI05gLyU1/D8qqSY=
X-Received: by 2002:a17:90b:4c4a:b0:398:bc52:825b with SMTP id 98e67ed59e1d1-39b2624c32amr22181806a91.21.1788675506361;
        Sat, 05 Sep 2026 23:18:26 -0700 (PDT)
Received: from gmail.com ([58.84.62.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm18280405eec.12.2026.09.05.23.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 23:18:25 -0700 (PDT)
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
To: rafael@kernel.org,
	amit.kachhap@gmail.com,
	daniel.lezcano@kernel.org,
	thara.gopinath@gmail.com,
	talel@amazon.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	mmayer@broadcom.com,
	viresh.kumar@linaro.org,
	sumitg@nvidia.com,
	krzk@kernel.org,
	peter.griffin@linaro.org,
	myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com,
	cw00.choi@samsung.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sven@kernel.org,
	j@jannau.net,
	marcan@marcan.st,
	casey.connolly@linaro.org,
	sre@kernel.org,
	wens@kernel.org,
	t.schramm@manjaro.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-samsung-soc@vger.kernel.org,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sumeet4linux@gmail.com
Subject: [PATCH 1/5] powercap: intel_rapl: Use %pe to print error pointers symbolically
Date: Sun,  6 Sep 2026 11:47:50 +0530
Message-ID: <20260906061755.5103-2-sumeet4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260906061755.5103-1-sumeet4linux@gmail.com>
References: <20260906061755.5103-1-sumeet4linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_231828_065020_E56C2772 
X-CRM114-Status: GOOD (  12.89  )
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

Replace PTR_ERR() and %ld with %pe and pass the original pointer directly
to pr_debug() and dev_err(). The %pe format specifier prints a symbolic
error name (e.g. -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled,
otherwise it falls back gracefully and prints the raw integer value.
This makes messages more readable without any functional change.

Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
---
 drivers/powercap/intel_rapl_msr.c  | 4 ++--
 drivers/powercap/intel_rapl_tpmi.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/powercap/intel_rapl_msr.c b/drivers/powercap/intel_rapl_msr.c
index a34543e66446..46972ee1ff84 100644
--- a/drivers/powercap/intel_rapl_msr.c
+++ b/drivers/powercap/intel_rapl_msr.c
@@ -582,8 +582,8 @@ static int intel_rapl_msr_init(void)
 	rapl_msr_platdev = platform_device_register_data(NULL, "intel_rapl_msr", 0, def,
 							 sizeof(*def));
 	if (IS_ERR(rapl_msr_platdev))
-		pr_debug("intel_rapl_msr device register failed, ret:%ld\n",
-			 PTR_ERR(rapl_msr_platdev));
+		pr_debug("intel_rapl_msr device register failed, ret:%pe\n",
+			 rapl_msr_platdev);
 
 	return 0;
 }
diff --git a/drivers/powercap/intel_rapl_tpmi.c b/drivers/powercap/intel_rapl_tpmi.c
index 73f36d9c09b1..6baaad3c59ef 100644
--- a/drivers/powercap/intel_rapl_tpmi.c
+++ b/drivers/powercap/intel_rapl_tpmi.c
@@ -408,8 +408,8 @@ static int intel_rapl_tpmi_probe(struct auxiliary_device *auxdev,
 
 	trp->rp = rapl_add_package(info->package_id, &trp->priv, false);
 	if (IS_ERR(trp->rp)) {
-		dev_err(&auxdev->dev, "Failed to add RAPL Domain for Package%d, %ld\n",
-			info->package_id, PTR_ERR(trp->rp));
+		dev_err(&auxdev->dev, "Failed to add RAPL Domain for Package%d, %pe\n",
+			info->package_id, trp->rp);
 		ret = PTR_ERR(trp->rp);
 		goto err;
 	}
-- 
2.43.0


