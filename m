Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBF8EB28D4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 07:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GlI/MBV6xozWTc1OM4u2SGSvVebdjrM1lCT9WkwRC+M=; b=q1w87eYT/Tr0/kn9V8njwb84qI
	JFl7IGr2LhZHP6fjgWdbjzedlKWRsu+1A7qo+ka6EA7S2B11bTKCzQtDn31zQNFu8PeUmgFLOXucs
	B+rISuLxL82Ftr6gcP05Xi6jVzQPk495uDv20laUsArVQP7f356isZZP85Z/ZqWMH6xoGbPSKwBNq
	JPQ/o+PtD4wyXdN/48YNeRaPqNFqhu0FuO4lWDFqpm1BBHcboMKAWIm+tuRjKBIgJ7eSyAM5Efdtj
	EstENdolr8h4HyfuFHItSFFgardKx6asdO3aR2G+giR8K6EHyRfsCzZSVpOtTEYv6P+6ruWj0IR/i
	rOBGSl8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voGCE-0000000Az9i-2nPU;
	Fri, 06 Feb 2026 07:24:06 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voGCC-0000000Az9M-1KBY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 07:24:05 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so19202805ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Feb 2026 23:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770362643; x=1770967443; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GlI/MBV6xozWTc1OM4u2SGSvVebdjrM1lCT9WkwRC+M=;
        b=ATAM9KVuk3vV5Vpr6O56Eh936QufGM1ESJGjE1DyObo/xaXeOG1+ObgWtN4L79vQA7
         1LEoQXrJECmpuQd5EsgfwN0qD/SgDsn1gipPaX5GpUs/+GjHhccZYA/M69w7ErAL+fb4
         HdbmfRi+AVg7ZOYG3rxWGDXsacBXBwKgqJBOlQ2AyZXLzwXvWn+SoMv5g8KNaBUS3R7o
         HileQI2blKrnrCNNsV/mVz7bZNGgirVBuDIKnZLKwqEukuQV2uFuzusUM5xG2NWeAQhT
         wpwSqArlljl9IbUyYxbolXaQXQIuHDI9E/ei/bIJQP5vthFXrUicQQ/j5p5sODhRqdYa
         ZU2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770362643; x=1770967443;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GlI/MBV6xozWTc1OM4u2SGSvVebdjrM1lCT9WkwRC+M=;
        b=CyczEmbyr/l3J6Yd32+3sUL2oklYfMiIbvkyYDvMEPz533f2/0fKa0Y+Wke3dyN0r8
         29mTXqEXo47PmmQhlmIgA4HDpAXpZkDR2rVex1ntWOtC6G2MeaxIwOmgH6rMw0G2EYyi
         6YwVjmHd5NEGqaumc62e/itv4NqG5F2plVWh4lkippPz+Ki3piYYw8iLYVUoEHQ75zzL
         iQdTLbE0mTS4ahgupjltM1lXhyISSpcuKK50dxD4t7PsqeCDXAxLKttCcRLr6TJZf+8R
         us1XPOs9gEeY9Oi7pMWqDSF2y2sYk0s7RUo4YTe4PaC56wo2+q6psruwkwtlQyZUT3Im
         P2Tw==
X-Forwarded-Encrypted: i=1; AJvYcCWbLNo1V3rKuteyi06pobN5kXlODZtU2+N/IEgHFJpFGsY4qAHcIK1Psush7kk/flbpH3mcLCgpIWpKwnHlukPA@lists.infradead.org
X-Gm-Message-State: AOJu0YxkcvJ5Sagi0UIFXe53RPJC9Frqz1JmAPF4jc8x3zxh1/gddHeu
	7YVJOmpOna/zoTC1rGlwtW2Qv9+q6zeJbVoRt7UFN7X3YxFImg4KLdJX
X-Gm-Gg: AZuq6aILsM2X3gv3HMUZnnkPz5bg7VvkaE93af0CszfE6cwU0kQK8mUUvkjycfLGpe4
	fIKLcIc90I57gseCcYRbiz++L+LAIi8JWLZXfUqEbdXQkQTvQwG8OsUU10+ZU+zQdID+BVAsR6o
	rWZIs/0Foij0vGsl+hiRhb/yhcr4FRIHw6SFOo5LCFEFzW9hbyWdJGOqB8+JOi3cCSmLOkfk6Qo
	CMSP+UvpJZ7H0qL9fswBj3ALgZFgEqmoppyLrS755x5H1P4CylZ/WldJ+tzKS8dLRFq9JvF9IOS
	1jwB8OBy1ulbTFkHP6IYfe0cRdniZ7asWbr7kHbtHtXyhhp55Z+i5Q5w7fWhI2RTv4veGDkOlKG
	Pn/GJouuMsvnWC2Ul5vQGFUSZs2zqvZ6THXcqCNAUEtrTHPtFDdH65Pbw+oO3a0RN5tol1n1V/P
	2LER5frM67tiBuMXd5pqVasGs/YulWQIkxmqqPL6WYfchY3olJsmydP/UAETsmu9Jl
X-Received: by 2002:a17:903:ad0:b0:2a8:fbfa:e825 with SMTP id d9443c01a7336-2a95194693emr18851275ad.37.1770362643089;
        Thu, 05 Feb 2026 23:24:03 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c50206sm14481175ad.19.2026.02.05.23.24.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 23:24:02 -0800 (PST)
Message-ID: <0a1a8f92-860f-4f4e-aad0-f743f099efc1@gmail.com>
Date: Fri, 6 Feb 2026 15:23:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/nuvoton: add MA35D1 display controller driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260129040532.382693-1-a0987203069@gmail.com>
 <20260129040532.382693-4-a0987203069@gmail.com>
 <20260205-classic-innocent-angelfish-5c3cd2@quoll>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20260205-classic-innocent-angelfish-5c3cd2@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_232404_390875_DCAA7654 
X-CRM114-Status: GOOD (  22.30  )
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


On 2/5/2026 9:22 PM, Krzysztof Kozlowski wrote:
> On Thu, Jan 29, 2026 at 12:05:32PM +0800, Joey Lu wrote:
>> Add DRM driver support for the Display Control Unit (DCU)
>> found in Nuvoton MA35D1 SoCs.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   drivers/gpu/drm/Kconfig                  |   1 +
>>   drivers/gpu/drm/Makefile                 |   1 +
>>   drivers/gpu/drm/nuvoton/Kconfig          |  21 +
>>   drivers/gpu/drm/nuvoton/Makefile         |   7 +
>>   drivers/gpu/drm/nuvoton/ma35_crtc.c      | 372 ++++++++++++++
>>   drivers/gpu/drm/nuvoton/ma35_crtc.h      |  67 +++
>>   drivers/gpu/drm/nuvoton/ma35_drm.c       | 371 ++++++++++++++
>>   drivers/gpu/drm/nuvoton/ma35_drm.h       |  48 ++
>>   drivers/gpu/drm/nuvoton/ma35_interface.c | 193 ++++++++
>>   drivers/gpu/drm/nuvoton/ma35_interface.h |  30 ++
>>   drivers/gpu/drm/nuvoton/ma35_plane.c     | 603 +++++++++++++++++++++++
>>   drivers/gpu/drm/nuvoton/ma35_plane.h     | 115 +++++
>>   drivers/gpu/drm/nuvoton/ma35_regs.h      |  88 ++++
> No maintainers? Why would we want to take unmaintained code?
I'll add an entry in MAINTAINERS file.
>
>> +static void ma35_mode_fini(struct ma35_drm *priv)
>> +{
>> +	struct drm_device *drm_dev = &priv->drm_dev;
>> +
>> +	drm_kms_helper_poll_fini(drm_dev);
>> +}
>> +
>> +static int ma35_clocks_prepare(struct ma35_drm *priv)
>> +{
>> +	struct drm_device *drm_dev = &priv->drm_dev;
>> +	struct device *dev = drm_dev->dev;
>> +	int ret;
>> +
>> +	priv->dcuclk = devm_clk_get(dev, "dcu_gate");
>> +	if (IS_ERR(priv->dcuclk)) {
>> +		dev_err(dev, "Failed to get display core clock\n");
> Don't spam logs on defers. Syntax is in entire probe path: return
> dev_err_probe
>
>> +		return PTR_ERR(priv->dcuclk);
>> +	}
>> +
>> +	ret = clk_prepare_enable(priv->dcuclk);
> Why this cannot be devm_clk_get_enabled?
I'll fix it.
>> +	if (ret) {
>> +		dev_err(dev, "Failed to enable display core clock\n");
>> +		return ret;
>> +	}
>> +
>> +	priv->dcupclk = devm_clk_get(dev, "dcup_div");
>> +	if (IS_ERR(priv->dcupclk)) {
>> +		dev_err(dev, "Failed to get display pixel clock\n");
>> +		return PTR_ERR(priv->dcupclk);
>> +	}
>> +
>> +	ret = clk_prepare_enable(priv->dcupclk);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to enable display pixel clock\n");
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int ma35_clocks_unprepare(struct ma35_drm *priv)
>> +{
>> +	struct clk **clocks[] = {
>> +		&priv->dcuclk,
>> +		&priv->dcupclk,
>> +	};
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(clocks); i++) {
>> +		if (!*clocks[i])
>> +			continue;
>> +
>> +		clk_disable_unprepare(*clocks[i]);
>> +		*clocks[i] = NULL;
> Huh, pretty complicated and pointless code. This should be devm and bulk
> API...
I'll use memory safe helpers instead.
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int ma35_drm_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct ma35_drm *priv;
>> +	struct drm_device *drm_dev;
>> +	void __iomem *base;
>> +	struct regmap *regmap = NULL;
>> +	int irq;
>> +	int ret;
>> +
>> +	ret = of_reserved_mem_device_init(dev);
>> +	if (ret && ret != -ENODEV) {
>> +		dev_err(dev, "Failed to get optional reserved memory: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	base = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(base)) {
>> +		dev_err(dev, "Failed to map I/O base\n");
> Why aren't you using dev_err_probe?
>
>> +		ret = PTR_ERR(base);
>> +		goto error_reserved_mem;
>> +	}
>> +	regmap = devm_regmap_init_mmio(dev, base, &ma35_drm_regmap_config);
>> +	if (IS_ERR(regmap)) {
>> +		dev_err(dev, "Failed to create regmap for I/O\n");
>> +		ret = PTR_ERR(regmap);
>> +		goto error_reserved_mem;
>> +	}
>> +
>> +	irq = platform_get_irq(pdev, 0);
>> +	if (irq < 0) {
>> +		ret = -ENODEV;
>> +		goto error_reserved_mem;
>> +	}
>> +
>> +	priv = devm_drm_dev_alloc(dev, &ma35_drm_driver,
>> +				     struct ma35_drm, drm_dev);
>> +	if (IS_ERR(priv)) {
>> +		ret = PTR_ERR(priv);
>> +		goto error_reserved_mem;
>> +	}
>> +
>> +	platform_set_drvdata(pdev, priv);
>> +	drm_dev = &priv->drm_dev;
>> +	priv->regmap = regmap;
>> +	INIT_LIST_HEAD(&priv->layers_list);
>> +
>> +	ret = ma35_clocks_prepare(priv);
>> +	if (ret) {
>> +		drm_err(drm_dev, "Failed to prepare clocks\n");
> Why do you print error twice? Once in the function, second time here?
>
>> +		goto error_reserved_mem;
>> +	}
>> +
>> +	ret = devm_request_irq(dev, irq, ma35_drm_irq_handler, 0,
>> +			       dev_name(dev), priv);
>> +	if (ret) {
>> +		drm_err(drm_dev, "Failed to request IRQ\n");
>> +		goto error_clocks;
>> +	}
>> +
>> +	/* modeset */
>> +	ret = ma35_mode_init(priv);
>> +	if (ret) {
>> +		drm_err(drm_dev, "Failed to initialize KMS\n");
>> +		goto error_clocks;
>> +	}
>> +
>> +	/* plane */
>> +	ret = ma35_plane_init(priv);
>> +	if (ret) {
>> +		drm_err(drm_dev, "Failed to initialize layers\n");
>> +		goto error_clocks;
>> +	}
>> +
>> +	/* crtc */
>> +	ret = ma35_crtc_init(priv);
>> +	if (ret) {
>> +		drm_err(drm_dev, "Failed to initialize CRTC\n");
>> +		goto error_clocks;
>> +	}
>> +
>> +	/* interface */
>> +	ret = ma35_interface_init(priv);
>> +	if (ret) {
>> +		if (ret != -EPROBE_DEFER)
>> +			drm_err(drm_dev, "Failed to initialize interface\n");
>> +
>> +		goto error_clocks;
>> +	}
>> +
>> +	drm_mode_config_reset(drm_dev);
>> +
>> +	ret = drm_dev_register(drm_dev, 0);
>> +	if (ret) {
>> +		drm_err(drm_dev, "Failed to register DRM device\n");
>> +		goto error_mode;
>> +	}
>> +
>> +	drm_client_setup(drm_dev, NULL);
> Best regards,
> Krzysztof

I'll  return raw error codes and let probe wrap them with dev_err_probe().

Thanks for the review.

Best regards,

Joey


