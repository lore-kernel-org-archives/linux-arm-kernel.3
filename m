Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6140E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 18:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ZfLFbNpnmpDV2565vRSGO4sUYMlrYKX9NM4kz4voi8=; b=T8K1yFAO8V7/t5N1gByZIwUSVl
	QqrIEbNmye/Rcd4kG0rB0opG5bW2f4JGDxnReDxlM3lbFaCkJLKR4n78TsIX6picaYrqIttCxCAFq
	q0KrY4AVALZIHaZtPCHitZTUzsAvX+1PYeWDYks6d/hGtEZ1Nc8gK99fgUHjl1A6Wdh7mBZWDZxAm
	r8ImUU4Pimttd0W65thgSIa5mudiOfCtL7yTlvjWMWZOoUkiFBjVg2PnV8yHghimwDv18cQOUhdUc
	EKJe/NOO/zv7U2mURo4g0ncUWitVM82DsFn9eyhqDdhHDJVFz8wbHdw/fUyP4CuYpRddFPVlv1Pn9
	zh3d4n9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWgZF-00000001Gtw-05iC;
	Sat, 11 Jan 2025 18:50:41 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWgS6-00000001Fe0-2F76
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 18:43:19 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-38625aa01b3so322515f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jan 2025 10:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736620997; x=1737225797; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ZfLFbNpnmpDV2565vRSGO4sUYMlrYKX9NM4kz4voi8=;
        b=BluVuAVn3hng6sWF2tUvkNO+eBiLfpVQoWqS4FggobbogxV9rY39VLQOmKvI5t+vLw
         UyxsZo9aNIl8ePGjxazLqffxJhpH/srbMF8vSnzzSn6g4FgxcreeOoT2fXTMWeEK6KCr
         P5FtcjAtfewtaM3LkwcRmCdf9EbFlDFRPjGr4XzWAYEe1ZU41AL49OLslDW5qCGdIKpG
         leuyg8mQA2b9/i8AGh+PEYXjF6c60Rqgiei9anTzPMr/KNlU1l7iRaqIDysW9v3Pyxvc
         /WxOPIZda1PMbKzLt8fp0mxultsjw/833ztKsPGe7iZdT2vkDtFpLCRTSd+0UX5I9UVd
         dpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736620997; x=1737225797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ZfLFbNpnmpDV2565vRSGO4sUYMlrYKX9NM4kz4voi8=;
        b=F/AXcRLpOBwzv1AJMZFRz+NTjbemPs7rIVj0WHdycKZ0p/eYvfe4c3KO4KIjWalYcj
         yRcoWcVFFMTfTjKIOjE0uPS0orZZTt2vsTBf3KlEfuBumfmyFUws/Hb4atQAU/4k6t7V
         /jwQwn+6cUM/oP1W89CqafeyawGaiVVXpO7Pr52bbr5Mib/0GbQQmA8qUDurWyDoh3Xv
         4F7ZWioMK/sAI+2iI6hP64TK2TGuOAkHnKLDrXOimSC7tO7hL7EMqihFg6XgxgG0plQa
         Gq9Xh3T6U4acn8YM1NMG11NTyJQPbwg7Y8Nle+if39/ogAi/gbvTHtlXhl4v81vN7Rr6
         HYWA==
X-Forwarded-Encrypted: i=1; AJvYcCUtvs4ynmiGJzA52OHbp8IRurZ6b6jSFfnKUHDWrEJYMr767TmZwf5PjsZZtCd19cx6lJQ5rnS6w9ssJwnh/1sZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyVLA8wh7vzzpAeAVxDyFMXtqOanC5Qg+A0UfPrc2jCZvqhHJu5
	wybFnX2SXK4ERag4+UsmguwXG6jo1hHRPK5M6w/qrAZ9B3kFTdYaEojWVLqGT8k=
X-Gm-Gg: ASbGnctTphEM/oVuvTIZXP2YvoVS7rYJsHTXRs8uG93CfQ8ioPB6cfVgnI/QvNdCkQq
	dhOhn+1tppnYUBvhjAFKIpr1ER1ufNBPiGIU3M4D4SywNOP+1VtxhT5mdMp0FOp3ndFRgJgfu+N
	ARqPFGig5Rjh4ZFuxD+qoONtq2spwkhL3mzQ3M4ygAWTWqFCVTySShK+OuuG9rwwb20CgieYb/G
	sLCsdaXu8HSlRjAjwExySufFFtqvL3Osi8+IBf04UsZPRWtOyO5uqm1cAmDQvvY1Szg4sYq
X-Google-Smtp-Source: AGHT+IFW0/peneFHNHf0VQ2I87ynYNTzqYw++V8lH2N+J7woIMmlHMzRJMHLntn2pbYLKroEqwtCug==
X-Received: by 2002:a05:600c:5027:b0:434:a30b:5433 with SMTP id 5b1f17b1804b1-436e26ff752mr59166135e9.5.1736620996872;
        Sat, 11 Jan 2025 10:43:16 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436f9bc6b9bsm205885e9.22.2025.01.11.10.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 10:43:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 11 Jan 2025 19:42:53 +0100
Subject: [PATCH 5/5] remoteproc: st: Use
 syscon_regmap_lookup_by_phandle_args
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250111-b4-syscon-phandle-args-remoteproc-v1-5-73ed6fafa1e3@linaro.org>
References: <20250111-b4-syscon-phandle-args-remoteproc-v1-0-73ed6fafa1e3@linaro.org>
In-Reply-To: <20250111-b4-syscon-phandle-args-remoteproc-v1-0-73ed6fafa1e3@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1645;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=qF4PHMuL+t0qB80xl2hrwOztjmUZsyo+dEMuKAh+IB4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBngru0nQc+fzofOvHIUV+/fgemqTdgb2BKYWbit
 e6gPsMjdtKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4K7tAAKCRDBN2bmhouD
 1yAJD/9qGYLOD6d1yxq+cU4dWnu4tTUYO2HfUKb3UxNFVYISpIcj7Fg/t9w6XscXb+F1dhdEuqQ
 Qo0sEKZLgMV+JVGLP4yG/wpPv1lz4lPtuTc50hpJS/SyOVckngINxUNKatVoRo/brjSSCjWKEPE
 TEYJAtE0v7oS7Y5zxCJDZWPdhukQb/Laes2GlHC2zXGRbWqpkLnyoPJsWhGxq4UQHADX1XzZYBQ
 SSq2OKw8Q8F9+Q1b9z6Oc25dw4LWHX4MTiPRxo73ls8Yz/9MsiSmFLO4cG8su8U3blX3VNwwKLJ
 mfBCEg450PfOR0hEv0PH3dFgPOy2eWDDEMHR/hv9weZtJhO657ODwYu6wEfTyWnzz5xqo+/S9QH
 Wed4A/iSt7Y91Qv3X/dmf+3cK38qH/sdheiCwCbF4ul84pOC2PK7slF4XITdZ9tFa+fqbVkb74Z
 vmwH4GPTDGzuCo7s1QwLaP+E+I/dbAaDX9TWO2K2TWlJiNkHxRTKBuXkTv0LvTw8k4kgsJtsqYg
 WtbDn/wo/G+ESTk5a+RBWLESQPBfQG/jK+DOvqsdFOZtnGHZjnvFdEFH6vX8jse32I8VEgsjtLy
 peNwU+JATuXIBWcNFBkq2ZsCEtc/PVsdY06n23bstvpwN4ZQdo996sgJ/UeBqV7JRYC4JxfXpVb
 YbAPZrXD5w08gFA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_104318_577158_F5211AB1 
X-CRM114-Status: GOOD (  11.94  )
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

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() and getting the argument.  Except
simpler code this annotates within one line that given phandle has
arguments, so grepping for code would be easier.

There is also no real benefit in printing errors on missing syscon
argument, because this is done just too late: runtime check on
static/build-time data.  Dtschema and Devicetree bindings offer the
static/build-time check for this already.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/remoteproc/st_remoteproc.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
index d1f35e8a83ba525613ed4e54d2269b7e9f427e46..e6566a9839dc5ffc83d907a3076fc4b0a644138a 100644
--- a/drivers/remoteproc/st_remoteproc.c
+++ b/drivers/remoteproc/st_remoteproc.c
@@ -314,18 +314,12 @@ static int st_rproc_parse_dt(struct platform_device *pdev)
 		return err;
 	}
 
-	ddata->boot_base = syscon_regmap_lookup_by_phandle(np, "st,syscfg");
+	ddata->boot_base = syscon_regmap_lookup_by_phandle_args(np, "st,syscfg",
+								1, &ddata->boot_offset);
 	if (IS_ERR(ddata->boot_base))
 		return dev_err_probe(dev, PTR_ERR(ddata->boot_base),
 				     "Boot base not found\n");
 
-	err = of_property_read_u32_index(np, "st,syscfg", 1,
-					 &ddata->boot_offset);
-	if (err) {
-		dev_err(dev, "Boot offset not found\n");
-		return -EINVAL;
-	}
-
 	err = clk_prepare(ddata->clk);
 	if (err)
 		dev_err(dev, "failed to get clock\n");

-- 
2.43.0


