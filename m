Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF68C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 13:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QXqt/TfNNS4iK2D0KIQwOPPSsGXvQRI7uTBOlyeJv7U=; b=Hfmzk3vKrzMuIHFKG/HZtLXIcU
	FAPX95dA7qxSxfJrlIVSjtiVy+3T1wF36GyRRqSneUsR8hFmjyRoN9f54IYSBKaZfIhOArNiPGfoP
	beJ8KEJDUqVblzJXmJ5O9WiKv+wzQ0kxFMvPIfFsb8dXlLuDa6+0h9GEV+l/A76Zs7WRSn7GIqWb0
	MywGgpi+RvuYbbJ0QzRnmYfsQ6iVDxdI5z0Awlp29ubbIRdXl+gD722G4bXcic/m9zvnxB24sfEN0
	PbBCLRWPFY9jfh9gdquyjdnkzmzXuPO6AnxdsXzxDt4OP3kFjFjUFFpTsrP5bZ4QEzLO9x7iFjoDk
	s+v/Sy2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66WL-00000003iOk-344C;
	Mon, 14 Sep 2026 13:14:53 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66WI-00000003iNL-2HhC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 13:14:53 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843c2790ccso1153973f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 06:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789391688; x=1789996488; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QXqt/TfNNS4iK2D0KIQwOPPSsGXvQRI7uTBOlyeJv7U=;
        b=QtQ+0fJ2MbergTVJoA2/F3UUnU/TNeAzI57rH03Dyzvl5G+hsZjEPVetxM6zFiZYNL
         eq5Mb607G2q2os1mMKdqwn7ZaLaj+67n1imJJwxvsY8zPuJn5CdhDnx5IDN2DhD5Z2CQ
         GUBzZAHF+NThsvS6Dcd2HSMc6udGG8ZL7+vYebgajfnQfuGjAJ4/jdPqMX4KDw2FhclB
         5m6XtKupCnNFQRzOHHHNkKypWFXwRkD61Y2YQMl84k6DBTL4plt2rAu36QVz8kUwcjT0
         6hGi+Q6BLYgiNLjrbashl9Rj5wj4zI2WAnmtBArrrxW8pgzvz+phwiPw8BzMmx5rHi5g
         OJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789391688; x=1789996488;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QXqt/TfNNS4iK2D0KIQwOPPSsGXvQRI7uTBOlyeJv7U=;
        b=V0eSvc4kf1YbHp2DPs/yuJLlU1ip9xnUjToM2CD8IfeeQfOM3wfVVs9AaQYoNi/xI3
         SFO3+SMqrkx6pdDjlqRDG+WuqHTUF4ts6QeX2uiCtsrP1gDgne7+QeSH/zPUrteTQ8vE
         svDxQQ4H1e+IUG9jtHxzH8RY1D9bSitvJLLY8HcpbIF3MRVSBu49R9aZ0Q3BCjLS9ANR
         LjJfmm0x5yTdKb9TrNv4u5+CvIgWgiY9YJqJ+nc+wA/eCCxCAPDTAImdrqppBBH833uC
         JprCOTC0Ff/+XSv3N3ejPj+tZd1aOK0P8FhvbyqZELWG1ERH/6S5n/BNpiic3LGMCqrc
         ekkQ==
X-Forwarded-Encrypted: i=1; AKwUvBwrKJCsIOfOVH+L7SbwYWVvFlRt0JEPcFVPR4FmrkkacojQ7RV/6fNxRohStROYEnUvO4Dvckmh5vjRHM5dlzts@lists.infradead.org
X-Gm-Message-State: AFuF++mcTKwZeFf528BlCoIhu5CRl2KZKtMgsk/vG/KxXZg6wM86Y8We
	VsA6zxZfdVn1tLI3UtGziAKC8E1V/OZ7J1kpsPyWMrpd5Fm3v/LYFrUZXNOxNy7LRFk=
X-Gm-Gg: AYBFou1IRXdUBkea0dIi8GitLYqomX/UQQ9AAVAjrl+eg5skamssu7tppTPQ0ZedFAj
	/qmADmp9jwmm981PODpAl5PAO4bn/y9V3gWLBhd5uE+P6BOyDTrgN8PKyLge9aqVsKasiAPZ0FN
	Pbjgpo/7vGlHObkVYrbVv3xDwXUM6+68gRnNHb+iJnb791AfTHx9XczeGZH/+6z1tpQ41Esrz6G
	McB/c+edmxZFIs+jH3l+GPm3Q8B2l1kyWfd+xECdBP//XjycNzgEMFoGdKkE5a0Ma1gAr2YXgEb
	lVJLfSD0hDKpMaXWgpbarR43Dmf69WTc+DtxepbIynYY6GiQVM2DUw9mmHbZb8LvkZQ3jVIvA8E
	Em6UWSqUkBjnKKbyUCKPXZjD9nfRQKm2elTSare7nAoa9zN0aJn3WoFPg/xDQE7xLlipPvlvLCX
	giPDomznPGYXy/iYD2uJ+1zqfILEFVtMeqD7Gevgj+FNG0PQ7vyOLrT96lEg1M7eys+5VxM5o=
X-Received: by 2002:a05:600c:46ce:b0:49c:dca4:94c with SMTP id 5b1f17b1804b1-49e7a6870d9mr47453825e9.13.1789391687993;
        Mon, 14 Sep 2026 06:14:47 -0700 (PDT)
Received: from [192.168.3.100] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e608sm28719703f8f.23.2026.09.14.06.14.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 06:14:47 -0700 (PDT)
Message-ID: <964d6626-202c-4d0a-aef2-86a383f405ab@baylibre.com>
Date: Mon, 14 Sep 2026 15:14:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] ASoC: meson: add audin main module and I2S formatter
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260912-audin-v1-0-7fbefe928711@baylibre.com>
 <20260912-audin-v1-2-7fbefe928711@baylibre.com>
 <20260913-inventive-millipede-of-certainty-dd58ce@quoll>
Content-Language: en-US
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <20260913-inventive-millipede-of-certainty-dd58ce@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_061450_616811_C7EBF7E2 
X-CRM114-Status: GOOD (  25.41  )
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

Thanks for your review and feedbacks.


On 9/13/26 11:41 AM, Krzysztof Kozlowski wrote:
> On Sat, Sep 12, 2026 at 12:14:32AM +0200, Valerio Setti wrote:
>> +static int meson_gx_audin_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct resource *res;
>> +	void __iomem *mmio;
>> +	struct regmap *regmap;
>> +	struct clk *clk;
>> +	int ret;
>> +
>> +	ret = device_reset(dev);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to reset device\n");
>> +
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	if (!res)
>> +		return dev_err_probe(dev, -EINVAL, "Failed to get memory resource\n");
>> +
>> +	/*
>> +	 * Do not use devm_platform_ioremap_resource() here: it would claim the
>> +	 * whole AUDIN window exclusively and the FIFO children would then fail
>> +	 * to request their own sub-ranges.
>> +	 */
> 
> And this should point you that child is not a separate device.
> 
> Please open your datasheet and read what is the address space of this
> device. You claim here ENTIRE address space. If you insist that entire
> address space is not owned by this device, then you misrepresented
> hardware in the DT anyway.

As I mentioned in the cover letter I designed it this way so that I 
could easily re-use the same driver code for all 3 FIFOs just offsetting 
the base address. I knew it was a bit hackish a solution, but IMO that 
was worth it since it was simplifying a bit driver's code. Perhaps it 
was more software-oriented rather than hardware related.
The other possible approach is to fully copy what AIU is doing and 
allocate each FIFO as a DAI. I'll follow that design then, but if you 
have any better idea please let me know.

>> +	mmio = devm_ioremap(dev, res->start, resource_size(res));
>> +	if (!mmio)
>> +		return dev_err_probe(dev, -ENOMEM, "Failed to remap memory\n");
>> +
>> +	regmap = devm_regmap_init_mmio(dev, mmio, &audin_regmap_cfg);
>> +	if (IS_ERR(regmap))
>> +		return dev_err_probe(dev, PTR_ERR(regmap), "Failed to init regmap\n");
>> +
>> +	clk = devm_clk_get_enabled(dev, NULL);
>> +	if (IS_ERR(clk))
>> +		return dev_err_probe(dev, PTR_ERR(clk), "Failed to get clock\n");
>> +
>> +	ret = gx_formatter_create(dev, &audin_dapm_widgets[0], &audin_formatter_i2s_drv, regmap);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to allocate formatter\n");
>> +
>> +	ret = devm_snd_soc_register_component(dev, &audin_component, NULL, 0);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to register component\n");
>> +
>> +	ret = devm_of_platform_populate(dev);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to probe child nodes\n");
>> +
>> +	return 0;
>> +}
>> +
>> +static void meson_gx_audin_remove(struct platform_device *pdev)
>> +{
>> +	gx_formatter_free(&audin_dapm_widgets[0]);
>> +}
>> +
>> +static const struct of_device_id meson_gx_audin_of_match[] = {
>> +	{ .compatible = "amlogic,meson-gxbb-audin" },
>> +	{ .compatible = "amlogic,meson-gxl-audin" },
> 
> Why do you have two entries here and no fallbacks? This makes no sense,
> really. I have no more doubts that your "gx" is a real SoC/

OK. Genuine question about naming here: would "amlogic,gx-audin" be 
fine? Because in "meson-gx.dtsi" I see many surrounding nodes have 
"amlogic,meson-gx-" prefix, but that doesn't seem to follow design rules 
from "writing-bindings.rst".


-- 
Valerio


