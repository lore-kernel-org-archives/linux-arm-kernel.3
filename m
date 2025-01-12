Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC06E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 13:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TB4adxko33N4lxV8vB34w9Deg0raCbTSnaXjgezepI0=; b=Cq4jDufPzwAUvHw7XFfkaXzcSU
	D5NsNq1sGs9F8p5fnQJKQmDj2JnT2SBQ3gfBISQcaNgZxxw85/O9eT7Z4Torl1mBLfVnOVh9kv+4I
	FsbbuODcwVpO9a3k6I0DhutqLKH3H36gUJmzOHSh9ty7uf2F+tblRZc4exrcuP0uysgF3uP7xzqeV
	+zxAf3w8K9XyfMDCQSm1nEMwegIqmZot+kY+bhpxLz64mCOc+PFO8WNqKSIvIrYXHTzyfz8UP1nKJ
	eLWa2m3swl69i+JwBOdmdbpdHbCDWdoNxIbd6P7vILsHeZ7CRsXSc5Qk+CCIIvNVGpUKjI62aakfT
	rdLlKeNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWyCk-00000002n63-0RCo;
	Sun, 12 Jan 2025 13:40:38 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWy5Y-00000002ler-3vY1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 13:33:14 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5d3ea2a5a9fso441143a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jan 2025 05:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736688791; x=1737293591; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TB4adxko33N4lxV8vB34w9Deg0raCbTSnaXjgezepI0=;
        b=zpJlymowe7mhELLVgjrh+onfq2styhDj3IWlTk39Emlt7FsASh7T1rhUNPAqsQkyFM
         ixxueDtuUBG8CJAXuiTesmIKD+94P1+2dtsbyZ98N/0Cjy6KsnqjxOP8JOCaFXaviOgL
         i+W8dNKPNBVgm/xOlmEqAvRGLoS2wRkPH9T6fsY2FQThwCF7+7mG4GsWyy0NtUiBza38
         1AgcPyaPZxAzPvg+OPe/bntUdvIsBS3v0E6GjoM/Tf4RI2ncN7oSsKH//6EQZy/do179
         MjVE4YVZnKGWqqNhGyK+HyrKswd1z0+7+/EFB8EiXsg1+WZ2pADH05hEx1/QRy1nNEod
         lTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736688791; x=1737293591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TB4adxko33N4lxV8vB34w9Deg0raCbTSnaXjgezepI0=;
        b=iL63YdXqnhNXcWA2cw0pXGZetP6VsIazc1ipnIQJO9Ikj8urABEUjj0UnVj6K6gMh5
         DI1I1JXgWqVfubQ8aoD/v4F592/FCpxh948wMZaGi9X9BlM5CjhIFwS1IDm/nF8nfRpC
         4dG/kXEWP/IJ+BbTFG2/NE5DaqV8b85/FtzLF1VrMwWHz5mp21ebzpFba8NbyDCjft/2
         hz3bbA4s0q9b0o+52jfU6z+Fp60DFN8h9b6/y1Kq34PvX+sxbRjrn6YuYhehwjqMr3T3
         wEDO3MqxPrgwFzVelWjgfHDw41o7EWzO2q1KhuxZhVhNPglK9Shm6mcPh0NHLo+5kHWp
         c+ig==
X-Gm-Message-State: AOJu0YzkvM3LhMN7IW83q5hBfUEtuzoYOsKjYVTlQofs8PeVe0cov6EJ
	K830ZtY1CnK8PyJ70T6xGeOFg450VuZUyc3VUdnGVHTcabXed21pGzYhhzEU+xw=
X-Gm-Gg: ASbGncu6s8w5j9ue+Hzg08YnDsS0Jpd8VHe16HhvDzG4DMfz1EHD6WYZenoZXdaTxFx
	IgSTPQByoMxw33qsWRyNWTKZCL+M8N7K0wbX6yVWByxdk3dzwoZwaMnGa+asn0WYIL0OdAE34r5
	uZRk184V09KOCLllMT5GvdOpu86E+hEdm/VW6zpkUSzhHv3hduUAExCN0MgQbZRrmqnXoIi6cL/
	twjMKPA8TqJbCu0YMLHs9QSEbjSrbtWEfRDLdOvZH0+GO7eFvrkw40eWGzKI1HH8LBprJCI
X-Google-Smtp-Source: AGHT+IHIeA9RUVsHVjCtYBXrSzIpeTFeEgLh0b/t4eC6XNfpXfMITPN9fmFvIdYvwM7BkZDK6rGKqw==
X-Received: by 2002:a05:6402:2355:b0:5d0:8111:e946 with SMTP id 4fb4d7f45d1cf-5d972e15f45mr5790801a12.5.1736688791295;
        Sun, 12 Jan 2025 05:33:11 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9903c4477sm3584609a12.51.2025.01.12.05.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 05:33:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 12 Jan 2025 14:32:47 +0100
Subject: [PATCH net-next 5/5] net: stmmac: stm32: Use
 syscon_regmap_lookup_by_phandle_args
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250112-syscon-phandle-args-net-v1-5-3423889935f7@linaro.org>
References: <20250112-syscon-phandle-args-net-v1-0-3423889935f7@linaro.org>
In-Reply-To: <20250112-syscon-phandle-args-net-v1-0-3423889935f7@linaro.org>
To: MD Danish Anwar <danishanwar@ti.com>, Roger Quadros <rogerq@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 imx@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1641;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=56BLcFVoX+7Lw71cTwO9yffs0jhx9suVmg3Qou8SBBk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBng8SEkQmvfABZs7QuVyVH4wapih3fPoh+Xo3JF
 lM90gZIsb6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4PEhAAKCRDBN2bmhouD
 14yoD/9oAXKquSceP15cb4gscg+NjoZ+s/tq5Q7p4hSunWTAFL8/Wd9T3H6hKFgZZce+fKazJeH
 OuMNJ+xcL0SXlWwVY9G4b9YXdEuYoJA6TSXQUiajhx0AbWHblwVbebmLTEJVyYxSPWKdYMkDOM1
 TwZdHK7mwNYgdJvCSJ5ND4AME0ONupR57eCjYKJHW06hflFBoqQ8JoXGpkG1cVrGrD5Yc/OpRdL
 qs0TPrx9Pcx0TLduLA4Y0WEIwAjWwQqipQVQXuiGf7bJDAcmgmrl3MMGhztBFz53tcAzWArA+wz
 vb3OxaD76FgG1AH8bHu1gUF6XiOMqGyO5MNclKzxnq20cnvmD51A9HJVo4AZ6Kn5iyQ2Uc7JAmX
 f852BpZXk+tD20hJ4LWw1CunjrtcZMKrTZs3KwJJqwhYUcylqd5+Jud0bH/kIJ0hy0kr4HV12ME
 3cNiRRBx75ErXkyDnOh85zzcqJ1wHwyKln9Bu5QVcuOFmneuqUyzyCf1YYN/Yo/V1dGEMoThVcc
 Q91OFMfYpRjz4xynGG/SP2H+RVf9RMxS4KE0TyKWEUrX2T7KR3PB9WV0SZsrOss40nqpKqD7WaP
 y8K8kyRxarGD7SGNq5RqQXaHmQcDpKew2kHjLq1oC/56T8THHvlHWulDPgyaCHBrlE/uSvzogDW
 bj/Ib9m93TZhnaA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_053312_985085_3D43CB15 
X-CRM114-Status: GOOD (  10.80  )
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
syscon_regmap_lookup_by_phandle() combined with getting the syscon
argument.  Except simpler code this annotates within one line that given
phandle has arguments, so grepping for code would be easier.

There is also no real benefit in printing errors on missing syscon
argument, because this is done just too late: runtime check on
static/build-time data.  Dtschema and Devicetree bindings offer the
static/build-time check for this already.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
index 1e8bac665cc9bc95c3aa96e87a8e95d9c63ba8e1..1fcb74e9e3ffacdc7581b267febb55d015a83aed 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
@@ -419,16 +419,11 @@ static int stm32_dwmac_parse_data(struct stm32_dwmac *dwmac,
 	}
 
 	/* Get mode register */
-	dwmac->regmap = syscon_regmap_lookup_by_phandle(np, "st,syscon");
+	dwmac->regmap = syscon_regmap_lookup_by_phandle_args(np, "st,syscon",
+							     1, &dwmac->mode_reg);
 	if (IS_ERR(dwmac->regmap))
 		return PTR_ERR(dwmac->regmap);
 
-	err = of_property_read_u32_index(np, "st,syscon", 1, &dwmac->mode_reg);
-	if (err) {
-		dev_err(dev, "Can't get sysconfig mode offset (%d)\n", err);
-		return err;
-	}
-
 	if (dwmac->ops->is_mp2)
 		return 0;
 

-- 
2.43.0


