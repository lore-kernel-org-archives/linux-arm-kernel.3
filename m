Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C41C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 14:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JF2SZUIZ+BCUsqS+/yls5B4+IVbjBfE9IjNCznqvy2o=; b=PKpoJ/VbnE3urpWuMflfZQJiOk
	eyFx/1ZDxt0G6w2vGu0ZaPD/TfAjUHFtdf3WuL/EuoW1veN9Z09jmUAfe06IVuT6vzou80ORZxdYC
	D6BwADd9/5qnUkLMLzySruJUh/480LfspXE8D5lzZpjbWS5CqgJXSgMgicdSVaVPixuMeFXle9+pF
	XYnADJnpggaWm6aEE4jrVjaKej3xHbswUVM69VIOyhDIlbcxz+ry8VmscLWE5tEi9DPPDqIzaogR+
	YRXij4h5qtoteXGU5beqVKMDqCsYyfjc2ZjJpE+v6TlSJpGfAjbP/QRprzYKZ/uc0I9EpdhdzFcMy
	at/xvLdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toNiW-0000000ERL9-1PXU;
	Sat, 01 Mar 2025 14:21:24 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toNay-0000000EQLo-0OoJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 14:13:37 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-abf4145368dso15479666b.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Mar 2025 06:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740838415; x=1741443215; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JF2SZUIZ+BCUsqS+/yls5B4+IVbjBfE9IjNCznqvy2o=;
        b=OfUBWo8KDEMVYVCYSq8BZPrL18g43QPKSmZQ2Vv130rJB9nPb0xnjdQTVvteH4cWyq
         Muli+basKWcLkXkKtgOYAhBTzYdbZ6wR+kTXLl/I2UA96nFdzQlX7kezak+bwPfp0l+F
         Qxf1Xgu9f2jXjfiGsotneN+n8ad2WAbfSChhLUjwkSUq0XbO6hlZc5iDeFTdRG7F+MaW
         CPVuNpHfgdM60hdAJzfOYrHIgbYSOHzLqQ2ENbUdWezLfTlcu4K5mRbAWjH70rCZJ1Kv
         2GE3Q2fZFmpxatlMt5bdB5Q5aCtDBSZM3ERYJfM3IwrT/acSf2iiMn1z1311d8j5Ywln
         OTpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740838415; x=1741443215;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JF2SZUIZ+BCUsqS+/yls5B4+IVbjBfE9IjNCznqvy2o=;
        b=chYteV0AWACNoUFj2KgQgfE6n9vnMAqseN5I0RlUnAe9eshok3FbdxuiKY4cBnzY9l
         qY22ovHgNYzGviENEoPduemXrWVGpAJfEsEPwOsGSL6+yCX9M9g6NMyAW82A3BHj3FSA
         g7rQaYewHOKiM34bmGzGfMN9IYGBWQwlvn0fCVm+hDIDq08O57eVH+fJMjpv/2rdrlrU
         XaD6CE3HD6XN0wNjQtkDXf5t28nbc21RcEcnFXW2xSn9m1O1j69b1cLTaKXYbHqvlCHr
         dF30psDqbKZHN6BzToLVqe8/xNVrekZrBtWikZdT5wbdvlEqE267Pvitw1Jdl9tvLuVk
         Wv2g==
X-Forwarded-Encrypted: i=1; AJvYcCXgwD6y/nff9kWE4PKjJ4Lad+ewtZE4VM5PpJzHbxsDfnppljJOEHI5qFkWF91iDtyClXd4cKbWeSsaz9A7mk8v@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5754FE3oH7CTEB2gTPmBb9ZhCzs5M5xQWelN4LjwsqKRR5MR2
	4N8nn+254O5kca+drLs/ciy5XBKHTPfOTCVzc+mzp4XMjMR3RsD9dSxsiWfTKcY=
X-Gm-Gg: ASbGncs8WO0cTzMh20q8Ym800aLCZtCN+jaPF5pAgT3FU7rpiRTmiDXqGVszH6xjKbt
	3+WNvq9tVdo5sjSLihAFnh1j+bqQ1CQgmmQawGjQvMSJ/JRtEZRyRqahxjnKfqAyfMWBfdW/Fsu
	IJHUhLNqLfHtM+Mo4me8HtDa/REVUGzO95cK4xz94SlEXMdfkGghfhMAiDazuLndq3FIdFjwyUT
	6KiAQH4miAN7GDfv9UenfUgOMRsYfg9udNwf8WMRsq2yWWQ2beRggC4cjPvi4PnZQ9T/kuKhcOr
	2lxRS+z6K04o9r+GQRcfOXNpKVnrsaA87lrgokvA0ZB7KDOv/ECxT+zno/ky
X-Google-Smtp-Source: AGHT+IEXjfOAsbzmDdwBeUYHq/6or4MctOJ1aDy3KgGo+cF5AzBxwpd05SEBfk2hys/UsQO5ckCxQw==
X-Received: by 2002:a17:907:3f2a:b0:ab6:b8e0:4f25 with SMTP id a640c23a62f3a-abf25fbaf6fmr324049266b.4.1740838414804;
        Sat, 01 Mar 2025 06:13:34 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0b9cbfsm485532366b.14.2025.03.01.06.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:13:34 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250301-exynos7870-pmu-clocks-v5-2-715b646d5206@disroot.org>
References: <20250301-exynos7870-pmu-clocks-v5-0-715b646d5206@disroot.org>
 <20250301-exynos7870-pmu-clocks-v5-2-715b646d5206@disroot.org>
Subject: Re: (subset) [PATCH v5 2/2] clk: samsung: add initial exynos7870
 clock driver
Message-Id: <174083841272.17657.12697906967603393824.b4-ty@linaro.org>
Date: Sat, 01 Mar 2025 15:13:32 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_061336_143734_E49CCC2A 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
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


On Sat, 01 Mar 2025 09:27:13 +0530, Kaustabh Chakraborty wrote:
> This is a basic implementation of the clock driver required by
> Samsung's Exynos7870 SoC. It implements CMU_MIF, CMU_DISPAUD, CMU_FSYS,
> CMU_G3D, CMU_ISP, CMU_MFCMSCL, and CMU_PERI. all other CMUs depend on
> CMU_MIF.
> 
> 

Applied, thanks!

[2/2] clk: samsung: add initial exynos7870 clock driver
      https://git.kernel.org/krzk/linux/c/4149066a5e958963f7123be51d3a65d336045c21

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


