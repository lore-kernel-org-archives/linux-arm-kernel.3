Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2461F45A0F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 23:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xxPy7nsbAghT5E3uapDIu2fOz6eF6mBtTMfx5Uz4VeU=; b=jL50opw7RY3fyNNARGdAmWqGZa
	dWqcdoRLvMNF981izSyvawLX66xx2pHPZ1ffsnJEv2wXAMW1rbA6hh2PD0tCl8FHoFYcWmy1qiJvh
	KH4jyq0FchrQ1c8Y7DNotsVAxstABaaYqus80kwC16PvFcx68kXnYZgCw3amlSv2hGmfRV6ur0bGh
	Sk4MwNtl3z8EV3VhAx4UHO0hHKDkZTsCtTd+LIQCrHPnE5F/WzMUqUxePGvPk6RG5OtFZ3oHqLiHV
	RWijgLXiJvKkwClaHqDz4JjM3sG3GwPe5YgM8fj9495ANEcuoAKVJD8W4cZApSfsM6P9dv638fpI3
	xwd6COBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBLX2-0000000CwCt-092Q;
	Fri, 10 Apr 2026 23:45:00 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBLWx-0000000CwBB-2UO0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 23:44:56 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-35d932cc948so1835529a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 16:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775864695; x=1776469495; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xxPy7nsbAghT5E3uapDIu2fOz6eF6mBtTMfx5Uz4VeU=;
        b=z5M+FGEPCsJxMbYTUHL5lrl3umjQnXxyNyOye7jn1xV7EIzSGac0FDZwyKug8gLlus
         5cQukjz1c4z56vCPWWoAczrfuUJTuZ41H3lDzipJOcrsqzwU2JkY/IwyEXIwZ59RAoSO
         qAAkE4RZBcG6w5p1vYkDGVgR4kykx6aG9FGAVDvyJ+Sf/IGriZx506c+WDPcDovHKn0Y
         rzeXIeLfTRmjmE9vdNFX8LwMfHmFDXKBvXGXxsi5N+X4dxn9JNNLPcvKo+9cSK/oZVLq
         ZK8qPJZmnoC68BZ49DIIGdOE2vELLOx0gfvSCu2LA56nWlRrfJ+fEc3TH6TF21x2ELpr
         oGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775864695; x=1776469495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xxPy7nsbAghT5E3uapDIu2fOz6eF6mBtTMfx5Uz4VeU=;
        b=U7H/em7TVwFnvrhZw9eDGD+nooGvPjpu2Ds2NnOSp46N7HJyCakOI/ojeBG2u9DVt6
         SED5/Vfx+hichvR43tqdyBhwsByXmQtp2hjtCNfZiTwM5fApTjZy1nmZr+dAaqOp5Znk
         3xuYX5VNyqq2JXGPp1Z6m2ylcg60l8dFnOisfokwpl31jJU4STyAgGbReXXhknSAgSEJ
         6siX1kEfA4cboVYKb7LA6qd3IXmyIsq8L66E4LD1KkdM2OovbhOnlKvUytSb50deDLZv
         NGegEgrqYD+fP6+ip37/qITAcjspQBzc7oSv581PAvTqEh2lwT5qIJaPXrNL0qWMcrg4
         M5Zg==
X-Forwarded-Encrypted: i=1; AJvYcCU/tNVSBi5LfM1lXTr4sI815nNtN82AKOiUUiweODYVpFGPQE76Th208vSFcONlTyQ7nFldR55PIiecm6nuo29y@lists.infradead.org
X-Gm-Message-State: AOJu0YzzFGByNG9Z5bJnpwp3ckgWL4jFHfrXp2VW/oqgI8MykHDlp86w
	o3hX/zjScNI8d4+86GyDg2OKEVDPD3WnOBZfbwNT9RVIltOg2k3z1FXmmzaF//3ngOBI2eFWG/f
	5frLhzRU=
X-Gm-Gg: AeBDiettcr/kuca8pBZyrK3UQvojWVCrnirLa4uroLVoFYB+kQz3hecNI1MrvSx0E8Q
	DgHt46XfhGdoB3IlwKFkUeztkeFYY54J60Fo5CvOydNZiidOuLkJ7hD7xxdnCJocVa3CLSbRt7Q
	LOvAkj26g8UStmUZRMLW7kELSyfS1Zh+R8RRJXy6byVlm8qk0/RoVinJNw7yzFZ4TEFMpfKij0u
	9pvL5+oM31hhMIw0aFfANjFz9pq6QFYUpudZ9RqZBmc3P9ByJhfZdI/0M5NIkFczjTS2pGi1GTm
	/+WbaPHzmp1zeHW2xDaOSTNPmO8MSJjXK8oOXdSwtXzAB5C7CtvC/v32jHYQjUTnEPQTYTKsbdF
	zK36d2nKpKJUd1ztUJX78YsIq18YrY4d1k/AFIkHkyyr5gIrzyYmDD68sshMuQilA31zlxx8fmp
	+mDLibhX8uyWrMP2My03U=
X-Received: by 2002:a17:90a:f945:b0:35d:9c32:6219 with SMTP id 98e67ed59e1d1-35e427d7f46mr5220267a91.9.1775864695045;
        Fri, 10 Apr 2026 16:44:55 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e3517f2a0sm10472699a91.17.2026.04.10.16.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 16:44:54 -0700 (PDT)
From: "Kevin Hilman (TI)" <khilman@baylibre.com>
Date: Fri, 10 Apr 2026 16:44:38 -0700
Subject: [PATCH v2 3/3] pmdomain: arm_scmi: add support for domain
 hierarchies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-topic-lpm-pmdomain-child-ids-v2-3-83396e4b5f8b@baylibre.com>
References: <20260410-topic-lpm-pmdomain-child-ids-v2-0-83396e4b5f8b@baylibre.com>
In-Reply-To: <20260410-topic-lpm-pmdomain-child-ids-v2-0-83396e4b5f8b@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1600; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=PX3RRvN2uw+9v2vWDcKKkvjMH6VQ8rbrFfzvSFGoTrc=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBp2YtyxxHvOuglRXsHxemtA1xpH5tLnawaN4yYq
 oG8j7wWxguJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCadmLcgAKCRBZNxia0/vG
 ZWS7D/4ubuhV0GKzqz0HTWzwuwk/cyPQdJs5BD5yPk3x2OlDujuArp5KWz9Zb862Sl2RNLa6EUB
 VTHLsDJYzazuaQiunBkJH3uoMnSTIh0uwRh6OaOVafKsMld/NWyfDh2LKusn3S3ulc343Nv3IwT
 fr/S5HZiJyMHxNVUoS3j3YQ0Q9I+d5J1LrrQAalSGOlANEvwyIf+/p0IJ6sd1NUVo1Tj1AGdyT/
 rtibZq1EakyZsTdWvNLe+utfRPHY5aAC8BedesuQWRbA30Gy/KK0N9IjxE/mwSaLDpJJPMgZ+MM
 d/K8sRQS4NsAVnmdj3kE4QznzUFzCgf+zXzcJCTsU9RSC+QThJgTUrmogCCEiowaqZGUiEtTUI0
 giUEDl/doY5z7UXNUX16ImfEk1cUUGefUJH/CV7r7OHXo7ECqHBVw92UkhQozOFL1OuffuNuX/i
 b4siw+J58JNN7+bS2EvW0otNbs7udqEIlHy/GlNs7FIWn6xMEmselmWU0phneTxuDe2Xuwe0MMQ
 HuZzQ9LvL5DC0PK8+VAJGxUtM2gk+j/JygVHXWPbyO567XetOAcybWkywZokcbHmrAewVzV7o3+
 pDU+5g6kuThE4wZmtwDEaTTl9mnxQXkqSaSJsDNSVOBj05g0o4wM7/U7E/IdyaSNOJVIqPn/+TD
 Eq7vbGTMdWb8EPw==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_164455_636282_13F63261 
X-CRM114-Status: GOOD (  14.65  )
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

After primary SCMI pmdomain is created, use new of_genpd helper which
checks for child domain mappings defined in power-domains-child-ids.

Also remove any child domain mappings when SCMI domain is removed.

Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
---
 drivers/pmdomain/arm/scmi_pm_domain.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
index b5e2ffd5ea64..6d33b3d62ef3 100644
--- a/drivers/pmdomain/arm/scmi_pm_domain.c
+++ b/drivers/pmdomain/arm/scmi_pm_domain.c
@@ -114,6 +114,14 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
 
 	dev_set_drvdata(dev, scmi_pd_data);
 
+	/*
+	 * Parse (optional) power-domains-child-ids property to
+	 * establish parent-child relationships
+	 */
+	ret = of_genpd_add_child_ids(np, scmi_pd_data);
+	if (ret < 0 && ret != -ENOENT)
+		dev_err(dev, "Failed to add child domain hierarchy: %d\n", ret);
+
 	return 0;
 err_rm_genpds:
 	for (i = num_domains - 1; i >= 0; i--)
@@ -129,9 +137,13 @@ static void scmi_pm_domain_remove(struct scmi_device *sdev)
 	struct device *dev = &sdev->dev;
 	struct device_node *np = dev->of_node;
 
+	scmi_pd_data = dev_get_drvdata(dev);
+
+	/* Remove any parent-child relationships established at probe time */
+	of_genpd_remove_child_ids(np, scmi_pd_data);
+
 	of_genpd_del_provider(np);
 
-	scmi_pd_data = dev_get_drvdata(dev);
 	for (i = 0; i < scmi_pd_data->num_domains; i++) {
 		if (!scmi_pd_data->domains[i])
 			continue;

-- 
2.51.0


