Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CE1CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 11:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wzM3FKLrWhS9Bb2TjExjJmxAKhc1IFpSqwHPLv7ULGk=; b=qnfIJ4wew0CFLyf07EnFpA/wvR
	SdKyLLCVv4fbh+y5RCRMKk0ttU3+7APrctfHQxMxqW7qP+q6gGMpnWXZM/01sx8lhAt3uteYxR/bu
	kcPmskuEjtuQllwqmAPWDdPinzaTcRveIoAqMPmQEyeYV8Z/yGAm6SpFHnvjLfze1zGIZeExPbwN2
	ktbdOoNy8fJ2/n5eGlnVd7uTwYmADBbpwmPxZesXZiZx43aCkZU7LkdyZ12Qm+oPX6NSbcZKj6jXH
	TmBO6rygzoN+cZZY7kVC5jjJcXodlFkQxZJJXp0JKIb4YYqY88K4+Ao5WUGkdETobk2QJaw23tE0Z
	Rgmr7TTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQNvl-0000000Absv-1U1l;
	Fri, 22 May 2026 11:20:41 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQNvg-0000000AbqZ-3711
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 11:20:39 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-48909558b3aso73147815e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 04:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779448835; x=1780053635; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzM3FKLrWhS9Bb2TjExjJmxAKhc1IFpSqwHPLv7ULGk=;
        b=VqHvdJPNsF1dhzxPSeMQNaNWjHykynvH9HmJEFBpBymTQN55FqoqHGzDFd7G6u1OwM
         I645iUhee4Pt9BwUkb8w0vw9Lz2obKfQLi7QYE48xWWwTQKmzqXgVthkEhxs6mVUzwOb
         0xpt6rmnQQ0GM4ajumPDOdVcsuE4gtrK0kPwK0Fi+J9XTPjnGdIF6ZIgcxyOky93sd+7
         gv4uVvtF4xHSoLpSZXjspjQMOe9EK0B5MKyX3SFnL80ad2AQj16yxbIEDK+n2lzKX3cz
         ZUyxGrPW5tXy1GjUT8S2DiDY2ri+ZnJiQMy1pk+SnOwluLgT/7czhDTIm5CaV436QXh8
         vsRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779448835; x=1780053635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wzM3FKLrWhS9Bb2TjExjJmxAKhc1IFpSqwHPLv7ULGk=;
        b=jxqjrtetl7NFbCeYg9jhP/mw+D7muUvh0aj+8dXLt2spqW+Cfn6cuErN7LIVt6GaW9
         nPhQKg/rmgHUpdxxmembp2vYf4lcPjAjOzjTf1XOufA9DQDAdvtvD98wVl9cCWTIPMDp
         zHOvyIFR/xV9ESTsOOy074lcxz413sgwBMEw0mUo1pGn/geQaHLI/FXmHVO+MUHxCsvu
         ryfRTtAZzwjg2jWKPRmdC5800KaU3TtBMOy8thdre5rnsxDtCvw5XiW0xntHGVh+4Hz3
         t5ZnFZptvg5wgAebxQs9hEMOQ4pjsYjJ1RDmbopf2dr+nsIAghA7se6UvGBfisS80WAH
         yPjg==
X-Forwarded-Encrypted: i=1; AFNElJ80u3+IBJCkGr7B9vWCNO8QaqTeMh3Vwnl8Cpj4X/qJZ0N1+CC/6bfvkLT/GyLbVZGJchG2vL09IDIO11oOMg2U@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf+zyiBJyiZqsQbYbzQh1KGu+KEQl0UxmbBeaQttg7FpDOKjg/
	cuDR78c25jxEuJHwvMQXmrhDWqZ5kuZMmGrdDlBlnMuJ9SEpqNMREQ7A
X-Gm-Gg: Acq92OF8hONxCvixzP2d7LGk0FOYAInNLQ50tPgtwdCH1azfks4OXrJXl6v/8Dv3p14
	mNDPPIzhAWNQMmAfJD7Ii/cXa3bxD4rZgWtnsAx1XKvWjwmC4kST/Ke1UwsoVXGItHBdQhqUGBE
	fv+A3lfBaxCWvDSWnawEQnnrw29DjbuZAIBGLDGMs9niKeU9eQwE6RA3pPgFCIr1UpksrU+ve5h
	NQGFhnNdOLR3CXfWz4CvUYuGmINLdlh/wcNYpt2ml12bmj7PK9g6eAg0CY+ZlQGAJq7mwRdxct0
	GFGdWSHHieqGj2WF6KmkHhAdTko9dntkll8+Aqz6qMeRTvvqgFDxD1jccO0RKV91l6QTHMCP4SM
	GYmax5jK43XcA0NN9EtMFNcHjjgCSZh3v9m0cnn+l2Q6WGzTLVmxwqSH8QKiLY/fjOOBr+FN8Od
	tioSpthYUzvsOCZzrYNSNhOgHyjReW/DFn8ecjjiq2frqGQAiEyA==
X-Received: by 2002:a05:600c:4510:b0:489:1c1f:35df with SMTP id 5b1f17b1804b1-490424a682emr41205515e9.10.1779448835090;
        Fri, 22 May 2026 04:20:35 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904526ca21sm34388355e9.3.2026.05.22.04.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 04:20:34 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] remoteproc: imx_rpoc: fix carveout name parsing
Date: Fri, 22 May 2026 04:18:46 -0700
Message-ID: <20260522111849.783-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
References: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_042038_033186_20887F69 
X-CRM114-Status: GOOD (  17.27  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The imx remoteproc driver assumes that the names of the reserved memory
regions reflect their usage (e.g. "vdevbuffer", "vdev0vring0", etc.). This
conflicts with the devicetree specification's recommendation, which states
that the names of the devicetree nodes should be generic.

Therefore, instead of relying on the node names, use the names passed via
the "memory-region-names" property if present. Otherwise, keep the old
behavior.

The definition of imx_rproc_rmem_to_resource() is added to a common place
as imx_dsp_rproc.c can also use it given that it suffers from the same
aforementioned problem.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/remoteproc/imx_rproc.c |  7 +++++--
 drivers/remoteproc/imx_rproc.h | 19 +++++++++++++++++++
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 7f54322244ac..1ee1c658dcc1 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -672,7 +672,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
 		int err;
 		struct resource res;
 
-		err = of_reserved_mem_region_to_resource(np, i++, &res);
+		err = imx_rproc_rmem_to_resource(np, i++, &res);
 		if (err)
 			break;
 
@@ -850,11 +850,14 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 	if (nph <= 0)
 		return 0;
 
+	if (!of_property_present(np, "memory-region-names"))
+		dev_warn(dev, "using node names for carveouts should be avoided\n");
+
 	/* remap optional addresses */
 	for (a = 0; a < nph; a++) {
 		struct resource res;
 
-		err = of_reserved_mem_region_to_resource(np, a, &res);
+		err = imx_rproc_rmem_to_resource(np, a, &res);
 		if (err) {
 			dev_err(dev, "unable to resolve memory region\n");
 			return err;
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index 0d7d48352a10..58e9daa41afe 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -45,4 +45,23 @@ struct imx_rproc_dcfg {
 	u32				reset_vector_mask;
 };
 
+static inline int imx_rproc_rmem_to_resource(struct device_node *np,
+					     int index,
+					     struct resource *res)
+{
+	int ret;
+
+	ret = of_reserved_mem_region_to_resource(np, index, res);
+	if (ret)
+		return ret;
+
+	/* "memory-region-names" is optional */
+	ret = of_property_read_string_index(np, "memory-region-names",
+					    index, &res->name);
+	if (ret == -EINVAL)
+		return 0;
+
+	return ret;
+}
+
 #endif /* _IMX_RPROC_H */
-- 
2.43.0


