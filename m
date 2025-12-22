Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5F7E677F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 16:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UQLcAW3D2Pl+HMLn2UT+UCDz/+sYmn/YWfptB8decEw=; b=16hf1P1F+m5vs7SJKNwdA0B8Ek
	2aLUBAoqYF85x0Pxw0WF5LLmu7GujwPnulzVPZrOeguXK15fNoHQ6R8t6RNc8lK3RzYYlnTVeYTxR
	iqMJZD2Ir7FxDZY2sougeCgee9aenYbHANPcaV10FOpAiNn/y55IkfHPanwTecFY01JfmCa/IZ7Yc
	ek3IR5AQdXTnxDSEQ+jCTb8oPmlpKtsSur6vKOmEQ1gCUjE6/mH4oDK/mQGcdI0TubMYRQ6HJQphH
	ZmQVDEUJozBwyHnidjDFCZ/P6dXuMxjxM8pBd38X6djQJ1KwFXhjA2ABX7TssHEUgwF6wrdIWDTyo
	EmKNAMEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXio1-0000000Dy9r-19ae;
	Mon, 22 Dec 2025 16:30:45 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXins-0000000Dy6x-29cE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 16:30:38 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso27107585e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 08:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766421034; x=1767025834; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UQLcAW3D2Pl+HMLn2UT+UCDz/+sYmn/YWfptB8decEw=;
        b=J8AhvGz5wIPPiMzYLTFoBR7ZkzEpAQNcQSPEaanKSL1rPAM4RUR+sqwtmmeASLke56
         3In+1rjjJQ824AlRhkZ2QD3qSX+OfFhipFmWAe3CtKQAKl2jXfkMTiF2ed11dMot+CsU
         IwoqDZQdDaCxnuWAXNFiotDMAe25E3uGU85kx+FE+cEgbOR79aetfASKsX66sbhlUojq
         ZPm8yCJnPA8ocFjfCgqj7A9bzAa/XfEm89X5gB2ZUQ2vwZI02z74DOArh2f2bbsORdvr
         Y7d/29U34iBGArbyzVzdBmyupdpAhawGmwVQn4W9/OOc/XiVkbYhzs4kfEMp8bc9rSiN
         1saQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766421034; x=1767025834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UQLcAW3D2Pl+HMLn2UT+UCDz/+sYmn/YWfptB8decEw=;
        b=ZiXLJb5kpTFSWcYK0VDXWTpIPbDavV2PFhvxOSY96E/MNDCynnnPh6z48vTjSB4QDW
         ppk5/l8yUzo3opcP5xHsR6YIbLdf8pIBl/m801gbAhdztJlV27s5SRvvxfcOlONemPYw
         z9hb+rpnQh/oMUsQ84Ssdsemfvl8plIfeM2RsNX4DaH61x/YkZ7td6BIFYahRvsHTOB3
         X0NCJW5grt4fGQAEF/pN4rE42puKS3mVcjamnx6NCloW2hv9oYn3SukbczWia5Iw1786
         89O2D5ICqfhuD0+1+W7J6cp6F7dUbw3PhclT3JFH/CowyZCXycqG6zutvIjj40ak8E4l
         FhKw==
X-Forwarded-Encrypted: i=1; AJvYcCVCvHLfrPo77BJKOOmryD+/4eBkUo5zEtZQ82de42KvmuooIMtCxlxCuDNxpoT4mNJvCu8QkSXaZ0q/FUPC9ETZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzJvFE3P/Tmlkz2BULFKVe5mP+A8cH6f9YxTYxdBUj9ZvCzrzCv
	81IODg5gbtU5LrwEppU82R6PUQEtdVLWLxVbXroOMkDV4leHAcrGcI1k4kM+8rKMdPA=
X-Gm-Gg: AY/fxX4ceXQYFCraypcFjUQl688+GknfQM+Mg5f/wk/9z3Hgzgt/7rvzla3ZI+r7P3g
	JBA4LqgpqwF4CoLG3d+kDYWwsP5d162ML1abS1HbE15sqzig88fdy8PAAtOKBpu/C8Jr53jSXuA
	bX2vZ9EIMIEdq+EsxpuPwFMx3vuNDlDX2EdIXpPxdRpt0fpsRuE/B29CAGJQLaCJm/79obc+M22
	lVhNuH02NQvSOM/W6wCbwTGCdeBEodXXn/X9eDtjecQMfVkkVZXQ6ckhIdelcULfejyXfyQVS/P
	afzrDdXwhNJOQWbRtjj0MKOYAtOJAAAHj7rDtnCAX8PNK2asHr7EEfDqIBDLj1w9VqypEbyT3+f
	6s4EzJk9tHRQp1Bz/AxXrzKjI/nlubHILD+rDZoFhnfvF9g84uQhfkURBXesAeo5je4Nsz20sSI
	uCxQF00SHAjW8eSfbtx7EtizbBY01cU4iuloTC+bCloW9VTz4dpvPnE/ysZmwRTw6I
X-Google-Smtp-Source: AGHT+IEeeGdexdjgsFvULlja6N3RSPsn/5O1yANNDtE7dG770/+tSXgL411WaHfHcQRCeiljSozLIg==
X-Received: by 2002:a05:600c:470e:b0:475:da1a:53f9 with SMTP id 5b1f17b1804b1-47d1954778dmr112796935e9.14.1766421034505;
        Mon, 22 Dec 2025 08:30:34 -0800 (PST)
Received: from ta2.c.googlers.com (62.221.76.34.bc.googleusercontent.com. [34.76.221.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa4749sm23071258f8f.37.2025.12.22.08.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 08:30:34 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 22 Dec 2025 16:30:06 +0000
Subject: [PATCH v4 2/5] soc: samsung: exynos-chipid: rename method
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-gs101-chipid-v4-2-aa8e20ce7bb3@linaro.org>
References: <20251222-gs101-chipid-v4-0-aa8e20ce7bb3@linaro.org>
In-Reply-To: <20251222-gs101-chipid-v4-0-aa8e20ce7bb3@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766421032; l=1400;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=mA3bEVEGzR9311lzIXbM9ZlcwGq5dWk+rNJx03paffE=;
 b=9DT1m4KO0p/kJ7bAFDLOVuYZey7dZtu3ttSsg9WmvxKqB5+1VqyH7CXF1OZsCc5WVsy9YXSg+
 lE5k87cyBMtBcWb4gu82Iviz/x2SUYjJYd6U7VlrSSayjOIbJxIERUF
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_083036_589831_7481D30B 
X-CRM114-Status: GOOD (  12.75  )
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

s/product_id_to_soc_id/exynos_product_id_to_name.
Prepend exynos_ to avoid name space pollution. The method translates the
product id to a name, rename the method to make that clear. While
touching the code where it is called, add a blank line for readability
purposes.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index b9a30452ad21c326af35c06a341b28491cee6979..88d264ef1b8835e15f774ff5a31f5b3de20f74ea 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -71,7 +71,7 @@ static const struct exynos_soc_id {
 	{ "EXYNOSAUTOV920", 0x0A920000 },
 };
 
-static const char *product_id_to_soc_id(unsigned int product_id)
+static const char *exynos_product_id_to_name(unsigned int product_id)
 {
 	int i;
 
@@ -150,7 +150,8 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 						soc_info.revision);
 	if (!soc_dev_attr->revision)
 		return -ENOMEM;
-	soc_dev_attr->soc_id = product_id_to_soc_id(soc_info.product_id);
+
+	soc_dev_attr->soc_id = exynos_product_id_to_name(soc_info.product_id);
 	if (!soc_dev_attr->soc_id)
 		return dev_err_probe(dev, -ENODEV, "Unknown SoC\n");
 

-- 
2.52.0.322.g1dd061c0dc-goog


