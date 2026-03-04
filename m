Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF7BEB7EB5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 09:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=olej/QuVyiT3XCCYbNDROqVlMJ/ZiroIS/6G24fqqXw=; b=eSOl4lS4Vf9Ve5trfU8sfNYlLl
	5mG8OpMmql5KyQn0LSOe8Ot8+ZQc/UY60kFLrl6P1rVuG6ubikv2mbCz6LzldUATNCQjGx9leb3ND
	Ycl1Gd++zKZQnQncHli3QuRMOCJ0qyvQoiJMQ/mjhQV7KkkfOa0aI+IBmoxP5XClkvzYDPXqS0h64
	ENEnzINgSsNzzeXyP/MrGEI4HzKDnONlV9s6lmTriSmX+VjAxvyG424X9CphfFPlVhHpF+DdggUeV
	k01JUt6Sm3HlMd02XmD1CheEUvbzA7/zPuKbAhJxGAMTTQEUJEXRMLHwL+p6KZJkg6J7WQPxP7tJZ
	QSEOY6Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxic2-0000000Gsey-1uDC;
	Wed, 04 Mar 2026 09:33:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxic0-0000000GseN-1I87
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 09:33:49 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SPCj2275079
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Mar 2026 09:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	olej/QuVyiT3XCCYbNDROqVlMJ/ZiroIS/6G24fqqXw=; b=jG7fGQ4v5uKwi+m6
	jYRS3LTZutxZaRvtn8jkQxwWB2a0rTwd5e4FuO+g0wWd5G6gGJcJF4AE1G5i+wFk
	OVKDaM+De548acZWpPzF3QrgKX7M0ybyyo9T9nH5iq1FCKDwI9itphQ7adIazLDh
	RCVUSxnyEZWmuQHAooPZDGtWaMjcWZ8Cwxhrap9wNj/tneGiKaSjMDD1SK277er9
	zx1qlz8KOShYrjRR+IbVJPOroaviNiAlxyRY0ZMUgNqTvVo0VGxfRXNQzqpcimU5
	5LEprhOHTQYA/7ocebT16KTOpnKkzt3JtoAKgir2XJgo30Zc72Ql1lf/KJbK5HwK
	TOtKHw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpc4ms9jw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 09:33:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae53ec06b0so132979245ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 01:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772616824; x=1773221624; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=olej/QuVyiT3XCCYbNDROqVlMJ/ZiroIS/6G24fqqXw=;
        b=TMC6IEGfpgE/fLNoSTo3/aErQPzE85ECh86OWF3pQ5ey8uIMcpw0J9IOvCIkVSwiC1
         lmQLlATNEmI5GReN1YaaQ/9WfTN0GOcopYb50gXGEFTwvm3YoOCj0KbG6tZkqP16MKyT
         3EANe6dUSerDSdNcwAKdKEOhNoSsr6iVsbOwZZFasvz1Wke5zfARy+OQEKFH+lJwDRrZ
         SDlv/iTVB+HuE5QuXTO7ycxkwix2hBTM3AIZmbEe1OOdkDm68yueqh4V7AFM+bFuWCDB
         7L0gkdE01iFRDKBuJAP1utu3MXlEtyKUo56Jz7TnMlVqBUGDuFo1YIjhoHOF/xXofSRz
         nqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772616824; x=1773221624;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=olej/QuVyiT3XCCYbNDROqVlMJ/ZiroIS/6G24fqqXw=;
        b=RkMibGtEelzUeRYg/PNvh4Qzx7kxvQsEVb02mePiRl6DG1KZ6Ih36berMNbOThcM0Q
         hJWzj/+tFj9s9jCI9A+VRL+VZKdUOAUwOuChn6GuG9+faoy44XqWGbRRlkpsUyfbyA0h
         pNKfJcS5817oXVdl+IYnrGvmDWvgklqP89u/u+hIW8RSGwIo+Cwx5VfyrTszpP83le0L
         cZtexWWgdMwdSdHH0zmqCEl/0Y7+DhsJ1jIjF8TzrkHk6Wx2r6uYARbWI5BNxkLusO4f
         rLvNTRE4GNTODbrtFndHajZh8r+UJMHN7dIhxpLYqL4z4/F7ev8GOPLcN5e/hiBMXBRw
         WOzg==
X-Forwarded-Encrypted: i=1; AJvYcCUVEqpfSjgsXeLauYbXjY4AziwYxKZKF27nBXfqGmWt5AkNjerzJo6TfyFpEpTe5rtioF/zMKdJqo7znAu81HTB@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2Lv5FmvvXyiSS9lMRtC4B48ukT4CUQWseNP5mBDv7pQsY2ly6
	yGo6t/X6Ld6IPFXxZKBIg82HN6yRcdVAqh9YmyA0pUEbdLcPz9c4IBmMKfqZh3lMehXIkoCHMWB
	g6zau8x0mPXWBTghO8BEuprCWpNJmBISYRujxhilgjRgT7cR/V4BtDu4ugSNgpLxoVKLs6fTHo1
	suwg==
X-Gm-Gg: ATEYQzyohdTVBU4ic0cDPNpRDHeYrNGg+26mxiX7Fiy5sz8OPFumovWh8nN66LPLdZl
	dflMnUMqt0Wvshe7P2p/vvTe2mZaamhpnBwvskinT9mhQwlkZu0IcoBbK4zgLTH9GgsWxH44A+V
	EubCnTEpNOEWfpI3kYXd62e/Kyk2N1b2TPvcdBrc3wqblfLRpAmW1e4iC0NlU07GTtVlvo56RtR
	vtUg7D7/uBxlb30AQy43kxM6fq9vUdHVM4RkPlaf1Au0bm7LlJc/StnQsj9Vp62wkWAUEHDUCSI
	oQgp2IoyvJvZNjXJMkwBdfMolcV1d0bVunBWRfy+0/moH410zIqyXMd7VNyQCgYbS3c+XJ/JURW
	zbHV2G8iKftTVstT+8+P1PPqkvn1RqUHezi75b0Kip0CUKkoKps5JIOF0
X-Received: by 2002:a17:903:3586:b0:2ae:483f:b23b with SMTP id d9443c01a7336-2ae6aaae620mr19110025ad.32.1772616824011;
        Wed, 04 Mar 2026 01:33:44 -0800 (PST)
X-Received: by 2002:a17:903:3586:b0:2ae:483f:b23b with SMTP id d9443c01a7336-2ae6aaae620mr19109655ad.32.1772616823507;
        Wed, 04 Mar 2026 01:33:43 -0800 (PST)
Received: from [10.219.57.109] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae541358d4sm76250575ad.75.2026.03.04.01.33.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 01:33:42 -0800 (PST)
Message-ID: <d3687764-024d-4dbc-9342-8edc9b4f1fdd@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 15:02:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/3] of: Add convenience wrappers for of_map_id()
To: Marc Zyngier <maz@kernel.org>
Cc: Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal
 <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner
 <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas
 <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org
References: <20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com>
 <20260301-parse_iommu_cells-v9-1-4d1bceecc5e1@oss.qualcomm.com>
 <86342janlx.wl-maz@kernel.org>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <86342janlx.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: rz8tj9y2YE39_WFV3VZpErSyTzV2LBSL
X-Proofpoint-GUID: rz8tj9y2YE39_WFV3VZpErSyTzV2LBSL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA3MiBTYWx0ZWRfXyQXAPU4dwwfE
 MOMr5svh/14tTOCmF7cEEFIOmKOUu0iH5gdFEmzfNrd7BkIGLKQFy3cQ1Dxuib6BOyGRMeohbRF
 d+LqzwB+4teX4cx55GFmiizVoOB7dreJm2i8YNmLvoW5tLXLv7cz8qdwuzontISXKFsVlAv+Er1
 opx23Kz/1Xg3uQm0DLobxSwaJSOWDDUwMGJNuqe7qPT5DezZLR0xmcbO7l0dYc/KaC1UjUWFTUH
 wH/8Q4ekqSYUlof5/gT/4Zeem4Se0TCBmHzLrIAInp9ZYLCjFA20I9tnghgEsZ9Lo4CIIPId+bc
 oIGciOfPGsZf6TScoVl4AdjhNC9cFb6bn2tlz++2VLxkyHXQerhn3gZjT8ZZBW6Sx1F9Zv+Sg/B
 upWzX/fQx4c6aiNKbIUKgk8KWbR+ng6gPhzDmSppIPaH3HX7+Chpj7r8b1Bh6kACG/BDyZ4fnBI
 ut0X+DKCrU5OBsmowQQ==
X-Authority-Analysis: v=2.4 cv=C67kCAP+ c=1 sm=1 tr=0 ts=69a7fc7a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8
 a=xEgsDuFUHT4EKXnybycA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_013348_474359_03574050 
X-CRM114-Status: GOOD (  22.87  )
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



On 3/1/2026 3:16 PM, Marc Zyngier wrote:
> On Sun, 01 Mar 2026 08:34:19 +0000,
> Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com> wrote:
>>
>> From: Robin Murphy <robin.murphy@arm.com>
>>
>> Since we now have quite a few users parsing "iommu-map" and "msi-map"
>> properties, give them some wrappers to conveniently encapsulate the
>> appropriate sets of property names. This will also make it easier to
>> then change of_map_id() to correctly account for specifier cells.
>>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
>> ---
>>  drivers/cdx/cdx_msi.c                    |  3 +--
>>  drivers/iommu/of_iommu.c                 |  4 +---
>>  drivers/irqchip/irq-gic-its-msi-parent.c |  2 +-
>>  drivers/of/irq.c                         |  3 +--
>>  drivers/pci/controller/dwc/pci-imx6.c    |  6 ++----
>>  drivers/pci/controller/pcie-apple.c      |  3 +--
>>  drivers/xen/grant-dma-ops.c              |  3 +--
>>  include/linux/of.h                       | 14 ++++++++++++++
>>  8 files changed, 22 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/cdx/cdx_msi.c b/drivers/cdx/cdx_msi.c
>> index 91b95422b263..63b3544ec997 100644
>> --- a/drivers/cdx/cdx_msi.c
>> +++ b/drivers/cdx/cdx_msi.c
>> @@ -128,8 +128,7 @@ static int cdx_msi_prepare(struct irq_domain *msi_domain,
>>  	int ret;
>>  
>>  	/* Retrieve device ID from requestor ID using parent device */
>> -	ret = of_map_id(parent->of_node, cdx_dev->msi_dev_id, "msi-map", "msi-map-mask",
>> -			NULL, &dev_id);
>> +	ret = of_map_msi_id(parent->of_node, cdx_dev->msi_dev_id, NULL, &dev_id);
>>  	if (ret) {
>>  		dev_err(dev, "of_map_id failed for MSI: %d\n", ret);
>>  		return ret;
>> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
>> index 6b989a62def2..a511ecf21fcd 100644
>> --- a/drivers/iommu/of_iommu.c
>> +++ b/drivers/iommu/of_iommu.c
>> @@ -48,9 +48,7 @@ static int of_iommu_configure_dev_id(struct device_node *master_np,
>>  	struct of_phandle_args iommu_spec = { .args_count = 1 };
>>  	int err;
>>  
>> -	err = of_map_id(master_np, *id, "iommu-map",
>> -			 "iommu-map-mask", &iommu_spec.np,
>> -			 iommu_spec.args);
>> +	err = of_map_iommu_id(master_np, *id, &iommu_spec.np, iommu_spec.args);
>>  	if (err)
>>  		return err;
>>  
>> diff --git a/drivers/irqchip/irq-gic-its-msi-parent.c b/drivers/irqchip/irq-gic-its-msi-parent.c
>> index d36b278ae66c..b63343a227a9 100644
>> --- a/drivers/irqchip/irq-gic-its-msi-parent.c
>> +++ b/drivers/irqchip/irq-gic-its-msi-parent.c
>> @@ -180,7 +180,7 @@ static int of_pmsi_get_msi_info(struct irq_domain *domain, struct device *dev, u
>>  
>>  	struct device_node *msi_ctrl __free(device_node) = NULL;
>>  
>> -	return of_map_id(dev->of_node, dev->id, "msi-map", "msi-map-mask", &msi_ctrl, dev_id);
>> +	return of_map_msi_id(dev->of_node, dev->id, &msi_ctrl, dev_id);
>>  }
>>  
>>  static int its_pmsi_prepare(struct irq_domain *domain, struct device *dev,
>> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
>> index 6367c67732d2..e37c1b3f8736 100644
>> --- a/drivers/of/irq.c
>> +++ b/drivers/of/irq.c
>> @@ -817,8 +817,7 @@ u32 of_msi_xlate(struct device *dev, struct device_node **msi_np, u32 id_in)
>>  	 * "msi-map" or an "msi-parent" property.
>>  	 */
>>  	for (parent_dev = dev; parent_dev; parent_dev = parent_dev->parent) {
>> -		if (!of_map_id(parent_dev->of_node, id_in, "msi-map",
>> -				"msi-map-mask", msi_np, &id_out))
>> +		if (!of_map_msi_id(parent_dev->of_node, id_in, msi_np, &id_out))
>>  			break;
>>  		if (!of_check_msi_parent(parent_dev->of_node, msi_np))
>>  			break;
>> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
>> index a5b8d0b71677..bff8289f804a 100644
>> --- a/drivers/pci/controller/dwc/pci-imx6.c
>> +++ b/drivers/pci/controller/dwc/pci-imx6.c
>> @@ -1144,8 +1144,7 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
>>  	u32 sid = 0;
>>  
>>  	target = NULL;
>> -	err_i = of_map_id(dev->of_node, rid, "iommu-map", "iommu-map-mask",
>> -			  &target, &sid_i);
>> +	err_i = of_map_iommu_id(dev->of_node, rid, &target, &sid_i);
>>  	if (target) {
>>  		of_node_put(target);
>>  	} else {
>> @@ -1158,8 +1157,7 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
>>  	}
>>  
>>  	target = NULL;
>> -	err_m = of_map_id(dev->of_node, rid, "msi-map", "msi-map-mask",
>> -			  &target, &sid_m);
>> +	err_m = of_map_msi_id(dev->of_node, rid, &target, &sid_m);
>>  
>>  	/*
>>  	 *   err_m      target
>> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
>> index 2d92fc79f6dd..a0937b7b3c4d 100644
>> --- a/drivers/pci/controller/pcie-apple.c
>> +++ b/drivers/pci/controller/pcie-apple.c
>> @@ -764,8 +764,7 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
>>  	dev_dbg(&pdev->dev, "added to bus %s, index %d\n",
>>  		pci_name(pdev->bus->self), port->idx);
>>  
>> -	err = of_map_id(port->pcie->dev->of_node, rid, "iommu-map",
>> -			"iommu-map-mask", NULL, &sid);
>> +	err = of_map_iommu_id(port->pcie->dev->of_node, rid, NULL, &sid);
>>  	if (err)
>>  		return err;
>>  
>> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
>> index c2603e700178..1b7696b2d762 100644
>> --- a/drivers/xen/grant-dma-ops.c
>> +++ b/drivers/xen/grant-dma-ops.c
>> @@ -325,8 +325,7 @@ static int xen_dt_grant_init_backend_domid(struct device *dev,
>>  		struct pci_dev *pdev = to_pci_dev(dev);
>>  		u32 rid = PCI_DEVID(pdev->bus->number, pdev->devfn);
>>  
>> -		if (of_map_id(np, rid, "iommu-map", "iommu-map-mask", &iommu_spec.np,
>> -				iommu_spec.args)) {
>> +		if (of_map_iommu_id(np, rid, &iommu_spec.np, iommu_spec.args)) {
>>  			dev_dbg(dev, "Cannot translate ID\n");
>>  			return -ESRCH;
>>  		}
>> diff --git a/include/linux/of.h b/include/linux/of.h
>> index be6ec4916adf..824649867810 100644
>> --- a/include/linux/of.h
>> +++ b/include/linux/of.h
>> @@ -1457,6 +1457,20 @@ static inline int of_property_read_s32(const struct device_node *np,
>>  	return of_property_read_u32(np, propname, (u32*) out_value);
>>  }
>>  
>> +static inline int of_map_iommu_id(const struct device_node *np, u32 id,
>> +				  struct device_node **target, u32 *id_out)
>> +{
>> +	return of_map_id(np, id, "iommu-map", "iommu-map-mask",
>> +			 target, id_out);
>> +}
>> +
>> +static inline int of_map_msi_id(const struct device_node *np, u32 id,
>> +				struct device_node **target, u32 *id_out)
>> +{
>> +	return of_map_id(np, id, "msi-map", "msi-map-mask",
>> +			 target, id_out);
>> +}
>> +
> 
> Any particular reason why this is made inline instead of out of line
> in of/base.c? Also, some documentation would be helpful for the
> aspiring hackers dipping into this.
> 
> Other than that,
> 
> Acked-by: Marc Zyngier <maz@kernel.org>
> 
> 	M.
> 

Thanks Marc.

I made them static inline mainly because they’re just trivial wrappers
around of_map_id(), so keeping them in include/linux/of.h avoids adding
new global symbols/exports and keeps the callsites simple (similar to
the existing of_property_read_*() inline wrappers).

That said, I don’t have a strong preference—if you’d rather have
out-of-line helpers in drivers/of/base.c, I’m happy to respin accordingly.

Re Documentation, Sure I'll add comments for of_map_iommu_id() and
of_map_msi_id() in follow up patch.

Thanks,
Vijay




