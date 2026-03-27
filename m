Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA96109E544
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 09:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iimVuL7Si0EC2QW/qRbXnzLK0ktDtNjpoesWqPPB7kk=; b=3GjNcAgiZ7xeY1yVfL32TiuI92
	mp2vnqofKxZEIhJz+9HdEPq+uf8owftSrySnuaVk2PNq7/bIEj2+uTUEj/tXJdz7WjHvjclJ2KPkx
	3fXnShuEtK20+rcossSJUvhTuiYuecjpluXQlohGcPH/pudUueg80vwZcrdovsPBpCpku0swPfsBN
	xuuY1WkQAXCgSalE0OjkURtvwq2mDsNK37B5SYYvSRS5vtoSnSeephS9f6xCr50m4G2p3l8DqeG3/
	fFoyAPOPt0OeHAuo3B6pp180SRyqQXa2z6DDRv5B4TPioIU8Y/9WACA6OF50A7EHwFMsQ5sOaD+lV
	w9fA+T7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63b8-000000075Gm-1KAU;
	Fri, 27 Mar 2026 09:35:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63b6-000000075GP-0f8V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 09:35:21 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vhjc731300
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 09:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iimVuL7Si0EC2QW/qRbXnzLK0ktDtNjpoesWqPPB7kk=; b=dfqtedcKdd+VWg1M
	7rr8jESz/4pyob5K2fouLMEhfpda0yOt9fk6Il6m7RWjeliiACai4e+ZB2hlrx1I
	9MgYxRv0KQ/ku0BWB2gtqXXvKiBRNyf12jRfiUQuuolYntBskTlFgAufv+olHd4U
	9+pYzSrzGS/nBGGzKPqngAx3//YA4A3M7kaA4l965KaJ1iChtAww5Rf4BioiNEed
	zzoIYSIj9ktfWv7IMm3l/NGkcKvqOL4pYOu59I2WfsLqBIG6r82rTb5Ka8Nq3b8H
	ykkyk8hGHoSagfqLpuEBqOyCW+kifxN5Cw9NttYhmJ8EX02pYG8IZakCzrf4EwZ0
	7Q/RGw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5a9q2rym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 09:35:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b064884a7cso63019355ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 02:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774604119; x=1775208919; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iimVuL7Si0EC2QW/qRbXnzLK0ktDtNjpoesWqPPB7kk=;
        b=LoAAVv7P6irz0ORE8+L0TXYDc3cdOFwAoCU1+KNKgLvoc4MPwZuljmpj2m3hwuCzSp
         upmT5nVdxSobEBd+nYxtSh9ObdK7SfpOk0mOD4j7C3F/xaJHHCyi7x2xuJXlZTPV23UC
         cQhHY2CdQWrN5RDS86+STBbIStPCcHkb1vMNDPYyOZF6yZFMHxau4dKs8jxy+57Dw6v5
         lwi7EbIEwxInGnRNNIchDY+ITHUqgbsEh7FNXpP37mSqYeXIUnpbHOhDTDsCF2KhL29n
         WlugyqQL18v067tDinjZ/1ek9+aHibStrmRy8wkOs0RuOpsSU7JMRejmUfgB0OwRCv1K
         sLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774604119; x=1775208919;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iimVuL7Si0EC2QW/qRbXnzLK0ktDtNjpoesWqPPB7kk=;
        b=SjSVH3t76mYsfPc/ozm3cgtVl+4kR5wMgb1WtkUbXGOhm3kr+WCnnrdv5/vqG7zZ5V
         s/MAGT7qINAVIlQvj24QvOqf4eIPIDJnepk54AOmSwVtUqIigjPjsZoZIbZ+Hixk6/m0
         0aK5R0qxCU139g1hc+tLSjYcE9Lwg/yICwc58IRNqMEIUWp07GPSEKPu2myfes2BEzca
         2qNoCAm1SIvluYx7+9YliWFB4gSmO/bk8E/On3qdoWV9WY3PHSzwztUL3/t+pYBlx9Ci
         5wEswVMXDEhr3wzw2m5IdWN/Qq/drB9eeC41seWXGZgJUjL5TOdzti+nlmI26sg726Iq
         MB1g==
X-Forwarded-Encrypted: i=1; AJvYcCUI2FLgEdkMT6eMQOMMKSilW5WfyPrSGF65pos0lNM+R3ecmIEtM6SpAwvld7rUhuy3x1QxiI5k+rVBtWwESHCR@lists.infradead.org
X-Gm-Message-State: AOJu0YyWPM1QmOd6a1Yjlb/4Ap7QKqboWOs1Zf9fvSIpxpExWiI8eMl7
	Whep4s0sYEM5FTW1FHmSGlRyHMdIWro5tQLxG18fkhB6+k67QU8oQFOJ1bgjX3hwp2I+cLUAwn3
	GzfQFvBnLmUbbPUAUtaANuTQsksyVCwlSxY90myF0WpcSiNyO+dO4aPxvMLTwwuYWseNqtM573r
	iFDQ==
X-Gm-Gg: ATEYQzy9ws7wcwzA68w+oLO93NhRbz4wM+SxhD0QM/yj5FvCxCWahS88pW1RFPfrKgO
	iLao5kKV+PY1hmmL3Wl94tJXp5B42DZcn8hpRkBq+g0TgyhCQU108SwEEcmiJJKBUzr//AcdTrw
	3q0RNuKFLock3zLrO3+lr6JgqGvbt3OGyVd17Yj0Mt6/MFuFaWdkqhj9GU6H4ZftAJ7ix2wWDDU
	2bpj3zik5akA2LZArXNERq43R4kcxdMtIVRvy6giFdc4Z2W7mWSt17Zg1iLUMQ0YfAtobg5RwS0
	5p0lmUXUJfiTGEIOAlDBN0sRqpPAJpBu3veukpByFRL0x84fOmA9OrkAuChMB9YyXvuobg1PEYs
	07ulDAeDGHyE5e62LLr9kkfGsmU1545XHLW0/m5DWHkkaO36lj6iNpj8P
X-Received: by 2002:a17:902:d502:b0:2b0:6d8b:6a07 with SMTP id d9443c01a7336-2b0cdcaa738mr20284175ad.25.1774604118590;
        Fri, 27 Mar 2026 02:35:18 -0700 (PDT)
X-Received: by 2002:a17:902:d502:b0:2b0:6d8b:6a07 with SMTP id d9443c01a7336-2b0cdcaa738mr20283585ad.25.1774604117910;
        Fri, 27 Mar 2026 02:35:17 -0700 (PDT)
Received: from [10.219.57.109] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc7a7e3bsm72543195ad.27.2026.03.27.02.35.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 02:35:17 -0700 (PDT)
Message-ID: <2c21c307-99bd-4051-8c09-06d370ad9b24@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 15:05:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/3] of: Factor arguments passed to of_map_id() into a
 struct
To: Bjorn Helgaas <helgaas@kernel.org>, Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>
Cc: Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal
 <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
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
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
References: <20260326161957.GA1324845@bhelgaas>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <20260326161957.GA1324845@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vv9cWmZiKxKNySYma8mWpb4AjaB20IKC
X-Proofpoint-ORIG-GUID: vv9cWmZiKxKNySYma8mWpb4AjaB20IKC
X-Authority-Analysis: v=2.4 cv=J4GnLQnS c=1 sm=1 tr=0 ts=69c64f57 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=vU6kfqNVzfA0ps7fDeEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3MCBTYWx0ZWRfXx/by5RQB4r3f
 b1j4BrdCrMkeJzOFTGDFK/unqIF/jgf2qdzq9LWiuliT9qlW6TzaU8PMyeUhKXrdrah9830lzhX
 8opk7YnKR/y9QfwhAT0YSDjBZU9bu0hJoXQ0h8ptvEh/8PZ+b55Xhcd90zbfqmEq+jmhhKyil04
 L53dD9oI3ePRQD5L+4tE0cQxaHyDz/0OOIHX+Ln1XPhlhbwRgb0F7hAOjZ1IrNwpCqvUGF623ML
 Sb3nPNsoN1qgXtzATa/4Y1Br+wvjrX4WGU+fhw/omgNa6Ttl3lZ1MAMJRBK9L6eGQwyrVTt6/VF
 EBkUJk5Q/gf+onI7fR+a8s36zYJN+E+adCNExfaFHsqM7SPok/fgp1KorkmxsN8DC6rGMUCjpdh
 CaGyZSQNGLiO1glRFLowaU2qtqKi+Fuw+wpBsCP55huIffzvF5/lPi+DwA9l/vXjEAOK4sWx1dq
 CPt3SkABrBIcSxxLsMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_023520_241086_3C115978 
X-CRM114-Status: GOOD (  30.95  )
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



On 3/26/2026 9:49 PM, Bjorn Helgaas wrote:
> [cc->to: Richard, Lucas for pci-imx6.c question]
> 
> On Wed, Mar 25, 2026 at 04:38:23PM +0530, Vijayanand Jitta wrote:
>> From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
>>
>> Change of_map_id() to take a pointer to struct of_phandle_args
>> instead of passing target device node and translated IDs separately.
>> Update all callers accordingly.
>>
>> Add an explicit filter_np parameter to of_map_id() and of_map_msi_id()
>> to separate the filter input from the output. Previously, the target
>> parameter served dual purpose: as an input filter (if non-NULL, only
>> match entries targeting that node) and as an output (receiving the
>> matched node with a reference held). Now filter_np is the explicit
>> input filter and arg->np is the pure output.
>>
>> Previously, of_map_id() would call of_node_put() on the matched node
>> when a filter was provided, making reference ownership inconsistent.
>> Remove this internal of_node_put() call so that of_map_id() now always
>> transfers ownership of the matched node reference to the caller via
>> arg->np. Callers are now consistently responsible for releasing this
>> reference with of_node_put(arg->np) when done.
>> ...
> 
> Not actually part of *this* patch, and AFAICS this patch is correct
> as-is, but is it necessary to have different logic around
> of_node_put() for imx_pcie_add_lut_by_rid() and
> apple_pcie_enable_device()?
> 

Thanks for the review comments. Right, there is no need to have different
logic, I will update imx_pcie_add_lut_by_rid() in v12 so that of_node_put()
would be called unconditionally.

>> +++ b/drivers/pci/controller/dwc/pci-imx6.c
>> @@ -1137,6 +1137,8 @@ static void imx_pcie_remove_lut(struct imx_pcie *imx_pcie, u16 rid)
>>  
>>  static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
>>  {
>> +	struct of_phandle_args iommu_spec = {};
>> +	struct of_phandle_args msi_spec = {};
>>  	struct device *dev = imx_pcie->pci->dev;
>>  	struct device_node *target;
>>  	u32 sid_i, sid_m;
>> @@ -1144,7 +1146,12 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
>>  	u32 sid = 0;
>>  
>>  	target = NULL;
>> -	err_i = of_map_iommu_id(dev->of_node, rid, &target, &sid_i);
>> +	err_i = of_map_iommu_id(dev->of_node, rid, &iommu_spec);
>> +	if (!err_i) {
>> +		target = iommu_spec.np;
>> +		sid_i = iommu_spec.args[0];
>> +	}
>> +
>>  	if (target) {
>>  		of_node_put(target);
> 
> Here it's conditional on "target" even though of_node_put() checks
> internally for non-NULL, so it would be safe without the conditional
> here.
> 

Agreed, here of_node_put can be called unconditionally , will fix it in v12. 

>>  	} else {
>> @@ -1156,8 +1163,11 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
>>  		err_i = -EINVAL;
>>  	}
>>  
>> -	target = NULL;
>> -	err_m = of_map_msi_id(dev->of_node, rid, &target, &sid_m);
>> +	err_m = of_map_msi_id(dev->of_node, rid, NULL, &msi_spec);
>> +	if (!err_m) {
>> +		target = msi_spec.np;
>> +		sid_m = msi_spec.args[0];
>> +	}
>>  
>>  	/*
>>  	 *   err_m      target
> 
> And here (outside the diff context) we also call of_node_put()
> conditionally:
> 
>   ...
>   else if (target)
>     of_node_put(target);
> 

Agreed, same as above.

>> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
>> index a0937b7b3c4d..c2cffc0659f4 100644
>> --- a/drivers/pci/controller/pcie-apple.c
>> +++ b/drivers/pci/controller/pcie-apple.c
>> @@ -755,6 +755,7 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
>>  {
>>  	u32 sid, rid = pci_dev_id(pdev);
>>  	struct apple_pcie_port *port;
>> +	struct of_phandle_args iommu_spec = {};
>>  	int idx, err;
>>  
>>  	port = apple_pcie_get_port(pdev);
>> @@ -764,10 +765,12 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
>>  	dev_dbg(&pdev->dev, "added to bus %s, index %d\n",
>>  		pci_name(pdev->bus->self), port->idx);
>>  
>> -	err = of_map_iommu_id(port->pcie->dev->of_node, rid, NULL, &sid);
>> +	err = of_map_iommu_id(port->pcie->dev->of_node, rid, &iommu_spec);
>>  	if (err)
>>  		return err;
>>  
>> +	of_node_put(iommu_spec.np);
> 
> Here we call of_node_put() unconditionally.
> 
> I think it would be much nicer if imx_pcie_add_lut_by_rid() used the
> same style as apple_pcie_enable_device() and did the of_node_put()
> unconditionally.  That would untangle the function a bit and make it
> easier to analyze.
> 

Sure, as mentioned above will align imx_pcie_add_lut_by_rid() and
apple_pcie_enable_device().

Thanks,
Vijay
>> +	sid = iommu_spec.args[0];
>>  	mutex_lock(&port->pcie->lock);
>>  
>>  	idx = bitmap_find_free_region(port->sid_map, port->sid_map_sz, 0);


