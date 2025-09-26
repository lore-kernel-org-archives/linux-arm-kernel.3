Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4615CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 16:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OOAJKtszuFOluuG6qYkOjreur/Dr9vuVBO3HUnQ0sBI=; b=i2K9jHWsJEBvMW8ihH43Badotr
	BLPx2krT49OUykLEj9dUEg5HtH+TVjsTjwwSTER3W3pjUJjWtmEVpc1+T75YfZBzTklsoPse/oqu7
	1escfQfAcV+HaDU8CdcMeib4bYJtH9a/9ZTRaRE4/iZhPJ9/R2LtcjAi44Kf5GUu7AeWTeMoe+h5k
	7U39hzo6LuwEOIw1wKqNo530HiepMqbU0xgUDpAR1CdSzv6x+g50ZRLbrC8cO0SkCs7ySaLWM8L8T
	J45FVnL7g6DE414pEWlSyjp49rnskEGYt/foVnCMpGJ8qo16h3ir5wScc8qDkOIXAut2sVB5MHlpp
	zPtLnZ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2BXm-00000002yIy-0o3i;
	Fri, 26 Sep 2025 16:43:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2BXj-00000002yHT-2B9q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 16:43:36 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEX3Gq020343
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 16:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OOAJKtszuFOluuG6qYkOjreur/Dr9vuVBO3HUnQ0sBI=; b=h+iVNCItG8IaNeo1
	5WKet2QPTfpcZVIJTNHUnA1IGc0tJXiF0e4OMG0eP89dQxPTjv3yUpM8TBpP7DAQ
	IhgMxGGm26m+RUmIboNHJp9FYOTEs0zvE1UKja8TxVWN01jYtZGZ2b4L7OByN55k
	nvAF8UZh13tjgob9ioN1jL40C5FnHTr/OhnbunN9yvOMYo7nCmUH9ESTkm7Vm/Cd
	Y4w6DOwI+N7tepyxyoudTuzUxhkDo5oieO0MmxITVHu+OEfXeGxu5D2ea3vWkkm4
	34Ju6XGEucVq4FkxEIvY496FdY7jXIIEjEgXTT6jFF3R9nSrsLRIh0JvYbaBfdI4
	3X+eZQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49dsqrgw0p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 16:43:34 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-780f82484faso1811215b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 09:43:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758905014; x=1759509814;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OOAJKtszuFOluuG6qYkOjreur/Dr9vuVBO3HUnQ0sBI=;
        b=RRHauC9ej+dLyjqCWPjefZQ1XDmLbm9rxuAmUOhYPUi6ucsEIuK87khke1veSufsHC
         Kyt5mnUu2IqqRH9IDxENzWX5BWkYuabrIqnKa9S1JEYgBjKBimjkTPbU1xjImRUG32nF
         3Z4JpjmPtFO6FzfB+qhQss88VxEcSvq3XalbM6nzTVHsBwPug32NYGWTETqgfgINOyZS
         E08TdIvFCyZrSKSSjiQbgypEE57DdKbvotVpbGO+igLc2PQRv+G+75ISFtz8LtE6YDhU
         LEuaqsVBx1ylYl3Hg2HmgqkKH5mJi487QU7UMWbrrlnjw4h2ajFz0xOeJFAEvXLuw3Fp
         EgdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXH9hDy6pZ8HNdeXX+R1G0cWKhcEm5npENABFVmcQv9U38A+BxGaxq+MnYRSoO2zRsTQleqJZwIY1uCRnw9Cfa@lists.infradead.org
X-Gm-Message-State: AOJu0YzPJcxuoPSdl6F2RfYbE2JQh1Gy/NZmFc+oK/LDtJMaLrtzofgt
	RzQsALtpXepQ8RRpl4oHo0n+uV2mvcl8/h92/7os94zU9Yl2wLPF7i6S/f5ujBvIIYp1+TT1/uP
	J2IiL5v7X2QSG3ZQI+QzdPMnNzHpeoIld4pnG1BXl2AB/QaiT998O5ZXF67em/dOUUcttimTdoW
	kUEQ==
X-Gm-Gg: ASbGncvz62/ttiDDNgBGg2HjHdXdo7jM4Kq8ImQp7cMCgX3YXRnPrlvOBE0r5Bzbd/w
	/l6abZ96pGhCtfAuitjBG4ZxT5mH7qsp8DVCIJx62V4p0mYF95O84Wf2upyCxUNovKm6I0X457n
	DysvtShOMW4eOWXKdVKJtHRc+7AIr7YHf+2/odROLJ6fb7zvHlkLyJuOswkl62bYJWM44/P/2Vu
	5RVKDatO+irCZaAVRzGU0nNY8aqEU/ssurBkyTBCPXw7IX1uZRMAHtGZWMCUfgHt8uNqVrnzBB3
	9Rw5VVGLLBhaMzt29FdKohpu1LrBGuRsv6xFXcjaPObOeHF6SOZn/9aH16xy1ZfdW47P/2HE+m8
	=
X-Received: by 2002:a05:6a00:2186:b0:77f:2899:d443 with SMTP id d2e1a72fcca58-780fce1d14fmr7444714b3a.10.1758905013432;
        Fri, 26 Sep 2025 09:43:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5vWBMgBvL7brIlV8nI5zcGRZcgZLch/n6zvZd8dJYGcdbkBvuKaAP5Kh0UT+1HHmZItjGyg==
X-Received: by 2002:a05:6a00:2186:b0:77f:2899:d443 with SMTP id d2e1a72fcca58-780fce1d14fmr7444655b3a.10.1758905012812;
        Fri, 26 Sep 2025 09:43:32 -0700 (PDT)
Received: from [192.168.29.113] ([49.43.224.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-781023c8aebsm4809340b3a.28.2025.09.26.09.43.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 09:43:32 -0700 (PDT)
Message-ID: <7cd09815-a657-47cc-9cc2-3751996c3592@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 22:13:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/9] PCI: pwrctrl: Add power control driver for tc9563
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, quic_vbadigan@quicnic.com,
        amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250925143924.GA2160097@bhelgaas>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250925143924.GA2160097@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UgYrz4sif-zMIwG_a16hr0lAvPjjdSnQ
X-Authority-Analysis: v=2.4 cv=d8n4CBjE c=1 sm=1 tr=0 ts=68d6c2b6 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=w+9hNF1SH6wH5mqaHp+xkw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=qleSEWVE8P8leAEWZfgA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: UgYrz4sif-zMIwG_a16hr0lAvPjjdSnQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDEwMyBTYWx0ZWRfX+PxSfABAYRzj
 naQpnVfJ5cg51MrmJJSqNC9U6I6SN5Ql5+shpLYzzyNmsxzL/9mocW48NJTVnPrSJ/YeaO7bBq9
 lUKtxIUMhUeTSj+J09xNXH/5K98X4VTRbwsucxlfVUkOxpm7hrzVeYUpIWlMtojDz4TBRMIHLQv
 RLHLqMydphq7ESuX/B26h8AlnB3QcgOedsy0bYxjiZPNSsoVCtkrMzM9diJUnvWr+2jINiwKggW
 tAUYuWp9sskUZu7B1m3jFUlf7Jp/Vq0lb6AKLrBXfHGty6MpbKrH12tpkga6ZUzBmHqeG5S/VLZ
 lDpM3x1QSAII9jEa4P2oi96c+2eHLvVFLPse5kOy8SHuovafPWyLvkLZgGKEuP/cgdFtr5rNIIi
 KPVdwokVZa3KWq3VAedZdMDrolspfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_05,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509260103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_094335_570940_B33FA655 
X-CRM114-Status: GOOD (  33.17  )
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



On 9/25/2025 8:09 PM, Bjorn Helgaas wrote:
> On Thu, Aug 28, 2025 at 05:39:05PM +0530, Krishna Chaitanya Chundru wrote:
>> TC9563 is a PCIe switch which has one upstream and three downstream
>> ports. To one of the downstream ports integrated ethernet MAC is connected
>> as endpoint device. Other two downstream ports are supposed to connect to
>> external device. One Host can connect to TC9563 by upstream port. TC9563
>> switch needs to be configured after powering on and before the PCIe link
>> was up.
>>
>> The PCIe controller driver already enables link training at the host side
>> even before this driver probe happens, due to this when driver enables
>> power to the switch it participates in the link training and PCIe link
>> may come up before configuring the switch through i2c. Once the link is
>> up the configuration done through i2c will not have any affect.To prevent
>> the host from participating in link training, disable link training on the
>> host side to ensure the link does not come up before the switch is
>> configured via I2C.
> 
> s/any affect/any effect/
> s/.To prevent/. To prevent/
> 
>> Based up on dt property and type of the port, tc9563 is configured
>> through i2c.
> 
> s/up on/on/
> 
> Pick "i2c" or "I2C" and use it consistently.
> 
>> +config PCI_PWRCTRL_TC9563
>> +	tristate "PCI Power Control driver for TC9563 PCIe switch"
>> +	select PCI_PWRCTRL
>> +	help
>> +	  Say Y here to enable the PCI Power Control driver of TC9563 PCIe
>> +	  switch.
>> +
>> +	  This driver enables power and configures the TC9563 PCIe switch
>> +	  through i2c.TC9563 is a PCIe switch which has one upstream and three
>> +	  downstream ports. To one of the downstream ports integrated ethernet
>> +	  MAC is connected as endpoint device. Other two downstream ports are
>> +	  supposed to connect to external device.
> 
> s/i2c.TC9563/i2c. TC9563/
> 
>> +static int tc9563_pwrctrl_bring_up(struct tc9563_pwrctrl_ctx *ctx)
>> +{
>> +	struct tc9563_pwrctrl_cfg *cfg;
>> +	int ret, i;
>> +
>> +	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
>> +	if (ret < 0)
>> +		return dev_err_probe(ctx->pwrctrl.dev, ret, "cannot enable regulators\n");
>> +
>> +	gpiod_set_value(ctx->reset_gpio, 0);
>> +
>> +	 /*
>> +	  * From TC9563 PORSYS rev 0.2, figure 1.1 POR boot sequence
>> +	  * wait for 10ms for the internal osc frequency to stabilize.
>> +	  */
>> +	usleep_range(10000, 10500);
> 
> Possible place for fsleep() unless you have a specific reason for the
> +500us interval?
> 
>> +static int tc9563_pwrctrl_probe(struct platform_device *pdev)
>> +{
>> +	struct pci_host_bridge *bridge = to_pci_host_bridge(pdev->dev.parent);
>> +	struct pci_dev *pci_dev = to_pci_dev(pdev->dev.parent);
>> +	struct pci_bus *bus = bridge->bus;
>> +	struct device *dev = &pdev->dev;
>> +	enum tc9563_pwrctrl_ports port;
>> +	struct tc9563_pwrctrl_ctx *ctx;
>> +	struct device_node *i2c_node;
>> +	int ret, addr;
>> +
>> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>> +	if (!ctx)
>> +		return -ENOMEM;
>> +
>> +	ret = of_property_read_u32_index(pdev->dev.of_node, "i2c-parent", 1, &addr);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to read i2c-parent property\n");
>> +
>> +	i2c_node = of_parse_phandle(dev->of_node, "i2c-parent", 0);
>> +	ctx->adapter = of_find_i2c_adapter_by_node(i2c_node);
>> +	of_node_put(i2c_node);
>> +	if (!ctx->adapter)
>> +		return dev_err_probe(dev, -EPROBE_DEFER, "Failed to find I2C adapter\n");
>> +
>> +	ctx->client = i2c_new_dummy_device(ctx->adapter, addr);
>> +	if (IS_ERR(ctx->client)) {
>> +		dev_err(dev, "Failed to create I2C client\n");
>> +		i2c_put_adapter(ctx->adapter);
>> +		return PTR_ERR(ctx->client);
>> +	}
>> +
>> +	for (int i = 0; i < TC9563_PWRCTL_MAX_SUPPLY; i++)
>> +		ctx->supplies[i].supply = tc9563_supply_names[i];
>> +
>> +	ret = devm_regulator_bulk_get(dev, TC9563_PWRCTL_MAX_SUPPLY, ctx->supplies);
>> +	if (ret) {
>> +		dev_err_probe(dev, ret,
>> +			      "failed to get supply regulator\n");
>> +		goto remove_i2c;
>> +	}
>> +
>> +	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
>> +	if (IS_ERR(ctx->reset_gpio)) {
>> +		ret = dev_err_probe(dev, PTR_ERR(ctx->reset_gpio), "failed to get reset GPIO\n");
>> +		goto remove_i2c;
>> +	}
>> +
>> +	pci_pwrctrl_init(&ctx->pwrctrl, dev);
>> +
>> +	port = TC9563_USP;
>> +	ret = tc9563_pwrctrl_parse_device_dt(ctx, pdev->dev.of_node, port);
>> +	if (ret) {
>> +		dev_err(dev, "failed to parse device tree properties: %d\n", ret);
>> +		goto remove_i2c;
>> +	}
>> +
>> +	/*
>> +	 * Downstream ports are always children of the upstream port.
>> +	 * The first node represents DSP1, the second node represents DSP2, and so on.
>> +	 */
>> +	for_each_child_of_node_scoped(pdev->dev.of_node, child) {
>> +		ret = tc9563_pwrctrl_parse_device_dt(ctx, child, port++);
>> +		if (ret)
>> +			break;
>> +		/* Embedded ethernet device are under DSP3 */
>> +		if (port == TC9563_DSP3)
>> +			for_each_child_of_node_scoped(child, child1) {
>> +				ret = tc9563_pwrctrl_parse_device_dt(ctx, child1, port++);
>> +				if (ret)
>> +					break;
>> +			}
>> +	}
>> +	if (ret) {
>> +		dev_err(dev, "failed to parse device tree properties: %d\n", ret);
>> +		goto remove_i2c;
>> +	}
>> +
>> +	if (!pcie_link_is_active(pci_dev) && bridge->ops->stop_link)
>> +		bridge->ops->stop_link(bus);
> 
> Is this pcie_link_is_active() test backwards?  Seems like you would
> want to stop the link if it *is* active.
> 
you are right pci_dev extracted seems wrong and not pointing to root
port dev, and  returning always zero. It is pointing to pci_dev in host
bridge which doesn't point root port.

Thanks for pointing this.

I will fix it in next version.
> pcie_link_is_active() is racy, and this looks like a situation where
> that could be an issue.  Would something break if you omitted the test
> and *always* stopped and started the link here?
if we stop the link if the pcie link is active then we might see AER's &
linkdown.

- Krishna Chaitanya.
> 
>> +	ret = tc9563_pwrctrl_bring_up(ctx);
>> +	if (ret)
>> +		goto remove_i2c;
>> +
>> +	if (!pcie_link_is_active(pci_dev) && bridge->ops->start_link) {
>> +		ret = bridge->ops->start_link(bus);
>> +		if (ret)
>> +			goto power_off;
>> +	}
>> +
>> +	ret = devm_pci_pwrctrl_device_set_ready(dev, &ctx->pwrctrl);
>> +	if (ret)
>> +		goto power_off;
>> +
>> +	platform_set_drvdata(pdev, ctx);
>> +
>> +	return 0;
>> +
>> +power_off:
>> +	tc9563_pwrctrl_power_off(ctx);
>> +remove_i2c:
>> +	i2c_unregister_device(ctx->client);
>> +	i2c_put_adapter(ctx->adapter);
>> +	return ret;
>> +}

