Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC2F1EB7EAC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 09:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HgNePX7ca+FZHnkRpuhdJQZhOY6UQv+RvgcyupQpELQ=; b=EoaB0Urtw3Hk6qz43n1/noQrTI
	yHcSwrvucpVke8VHvYlsggYpT5ZVK0qDKskmMVJCo1EW3XwUXkGrT1h+GekGr4IfMb576qtz/Eq7I
	8vwG29ZgYVX/BbJF/zlaryGxzYzn7vcPT8goUaiEeRIyz9wnK8qlwomikqqpw9trfh8qAXrRGEYOi
	8l/1zKxnko6yGux2cT0zoFchnBmSFTrdMJHlcmPJ0OOIog9tc4TehGRgOhMhthApQ5gSOpPgrasV4
	bkP569DPKl5+1+izwl3G73nCUQMEcI9Z6RKgNoEYMtovJ0iVzcx6JidpLQ7ZodVzqpEzRjmRLjjQ/
	xCDGGe0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxicg-0000000Gsm1-3IFz;
	Wed, 04 Mar 2026 09:34:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxice-0000000Gskz-2rGu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 09:34:29 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6249KlcZ1455993
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Mar 2026 09:34:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HgNePX7ca+FZHnkRpuhdJQZhOY6UQv+RvgcyupQpELQ=; b=JFVTiT7lxucAne5+
	vWI+HQTpVk9V3jWmx1PWUucrFvamP0yDOFY034alLz3ZBgzIEfMi0MS4uquN1hh8
	EI7aXuxp6dMz6qO68oU/aQSWUICNJo/sGcNoD0kPndEVtSWs5OCjVP5rcLH80Phg
	ky3wGQTwGMI2mB5E91AT27+H0OF6l0sY8Q3oWToivevSOK2GADQjRFKwWcBWEA11
	9S/eTjbdqGKh/aZMhmaHEf1pdgu2dgjd13zO95DicZf3Ff6fn+rEkPSwwJQABuHd
	scgJ1dbD5faRcuu9tqpogs2bthEi90+/7K8PlySiEJVEWT4ZR/QIh7aqipwVG5tU
	9sDJBA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpj1801s7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 09:34:27 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-354490889b6so23311188a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 01:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772616866; x=1773221666; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HgNePX7ca+FZHnkRpuhdJQZhOY6UQv+RvgcyupQpELQ=;
        b=an6fTaqq13nKKoEXFtNQuvJjHP9J/ilEOUsN5qLOGruZWjoXBNMKnXcimqh6uB2NEs
         NSQY+5rbTfYKeQWpp7uvDkcUZG3Xu3qLcQ9h6UpwbrRQfNmKIuM7cZKa+SMcSBDCG0Zj
         sxEBuoX5D2bcJMWmspYPRPL5Jjl3Qtd77bSiwkiHP4OjJtC2Nd8rK3jzxAkyUqIhBAmb
         j3JbOLBXHwBpW9VizbZkpKjQCWw+//JLJV7NdgF2yI/K0D+eIS0p3/dwatQl2yOkGlQs
         AYIWRKbTfg/wwffFbOIHutCvMIC3bQYPYWZXMEZF61TkoyYOjFOTvhJmKuS7ECICY/j1
         XQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772616866; x=1773221666;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HgNePX7ca+FZHnkRpuhdJQZhOY6UQv+RvgcyupQpELQ=;
        b=Ir0VKTZOIBCOpYs1LszGJsy54oOuGsXlVWavqnaqICBKrQyGS4P0qraX4/owuZHWpg
         jos+nhUw4Z9O7bMGnikr6ik0/D/iS5haf3H51+Re3CFGmM/+qeG/A0ZR/grK+kpJi4m3
         ewonuhilzQ75erruhfPq+/v/ScpN/ygwiUR7zp6bF+bHgnEkZR7iZKlYmVN2PArKcRqh
         1fjh+STlCEtaZaKLvDpC4xcPOq/S+vr8NqPwSX41ZNAF9rcUr7hguPND9FkT1GYVo5CN
         TelTuKk9OaLkUGYm/guFm4S5eW8d52gcmT4Byv/NEDZqHMHg631amBkVbrEsdQOQ1uKG
         chcg==
X-Forwarded-Encrypted: i=1; AJvYcCXdBbDXiWGOv40WrwqOvJ0gXCbpFQ3fHimgp/1FtBU+pN0iufptJvNZvKNFKbyOUQL6xhlZyhRpduFARj7herCb@lists.infradead.org
X-Gm-Message-State: AOJu0Yysgk0TH4hIwNH7BBljbDYkkuuZkp6WOWgTURSlCmoRdH2zOpvd
	MMcA7U+YwLJ/G4GE3U+px5LvAoiwQyTBCvwxgSeoLnmw4A9J9SL6O32EbeT6Fwi0GrfHUCdAJhM
	eawOYKcUZQmveQEDd0i5D9FbzYe3nJNHK2csxqAsQrsrr7S7f+vkujx1BiarxzPfsggprObI4Ps
	rhkySpF+r4Bg==
X-Gm-Gg: ATEYQzx8QKxmgr9M/Os19ScfZ6te7IIyiSxaDFQ6n3cbJ/ON6mOn5nw4RbCEC/bHWcI
	uWtVCgw04+6VxQ/IpK/0alJx5ajbPRymvozkFTYBzWdyPGZxmFuL9ScqSw59IR4+YEfxB0h4P2Z
	krLq0jCk8kr4nl1FVQH012+CP3+VCrwbGEar7VBk5ACF/jsb5IfBumBlchiJ9vhK3k4Ik0L1xC1
	AYYKP8EtNLtydRmCu2lXCpSWK9dhKQHVfeAws+zUeDilTacP05eHn/bub98kBbspnCu3xeKTGZc
	PmKnLPo4YzcP6WWUAEFZAJHz9c+h4+AZEGy5YINA9dIDJLZ3U/Q+vX4qQiA7Q/EtJPeMONRQP8O
	oG2Hj6EokANEJeKHwxJruTyrBcv5LELXBWmeqDPn/Pl1GPtzbZmcZBfu4
X-Received: by 2002:a17:90b:2691:b0:349:2154:eef4 with SMTP id 98e67ed59e1d1-359a69c0d3dmr1241349a91.5.1772616866193;
        Wed, 04 Mar 2026 01:34:26 -0800 (PST)
X-Received: by 2002:a17:90b:2691:b0:349:2154:eef4 with SMTP id 98e67ed59e1d1-359a69c0d3dmr1241312a91.5.1772616865529;
        Wed, 04 Mar 2026 01:34:25 -0800 (PST)
Received: from [10.219.57.109] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359a8d65b31sm500720a91.0.2026.03.04.01.34.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 01:34:25 -0800 (PST)
Message-ID: <4bc86c4d-3a4e-4ece-a01f-dce735ee9bd3@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 15:04:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] of: factor arguments passed to of_map_id() into a
 struct
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal
 <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
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
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
References: <20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com>
 <20260301-parse_iommu_cells-v9-2-4d1bceecc5e1@oss.qualcomm.com>
 <grcqbs42seqxmes7lm527kwhqf6osherykg6pc3w5voubd72rn@hncfl3oforza>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <grcqbs42seqxmes7lm527kwhqf6osherykg6pc3w5voubd72rn@hncfl3oforza>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WNzKud4k8K-JNPZnKK622H4sBwfIm1Tc
X-Proofpoint-ORIG-GUID: WNzKud4k8K-JNPZnKK622H4sBwfIm1Tc
X-Authority-Analysis: v=2.4 cv=Ed7FgfmC c=1 sm=1 tr=0 ts=69a7fca3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=MLUpyK7X_zb698vRSG8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA3MiBTYWx0ZWRfX+ViyaOUtcl4t
 Q4PFY1OK8BWPJsyldudI/f2OON/uO5HreMY47I0lt27Qa2sTeo2zbkOp6Y4v1WY+z6ueXieHt4S
 HYZs94D8y49QGjCUBFfz+4TtKoMC9AOcjA/mbNTjtW88rIZQ6aIexbB9wN3NSGdHrAbuzbE74CY
 nYL/je8DveUzz610Vclrdsr4fkcBNpBkL+Ud+OZd3xyv+9KsqW/UQsH0hG667U8oj43yMUEo0tk
 oDfIoikHHN62OimN0MKf8EM9imTRyHRz+fhAsUPnaKGwR8NTTUpWOc3i/iCWHUXkV/McDe9Rft8
 LW6jNKCVA3Cu96RCXwDBngK0kDjNkvx2F9FZXUFEzIZFw7q2d1d94Iz+W7LvU4Pw3n3y7KOQeQf
 V1gbGKwQytmRb14R9oIAoC7rs+hUrsFjIl8NmfC1OYjaGkzupN+1Ik0J9izSV9hJE2ieF8IgMjZ
 SLeQJR9WELF5ZbeaQ2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_013428_841425_7F69E3E7 
X-CRM114-Status: GOOD (  28.21  )
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



On 3/1/2026 3:32 PM, Dmitry Baryshkov wrote:
> On Sun, Mar 01, 2026 at 02:04:20PM +0530, Vijayanand Jitta wrote:
>> From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
>>
>> Change of_map_id() to take a pointer to struct of_phandle_args
>> instead of passing target device node and translated IDs separately.
>> Update all callers accordingly.
>>
>> Subsequent patch will make use of the args_count field in
>> struct of_phandle_args.
>>
>> Suggested-by: Rob Herring (Arm) <robh@kernel.org>
>> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
>> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
>> ---
>>  drivers/iommu/of_iommu.c              |  2 +-
>>  drivers/of/base.c                     | 37 +++++++++++++++++------------------
>>  drivers/pci/controller/dwc/pci-imx6.c |  8 +++++++-
>>  drivers/pci/controller/pcie-apple.c   |  4 +++-
>>  drivers/xen/grant-dma-ops.c           |  2 +-
>>  include/linux/of.h                    | 21 +++++++++++++-------
>>  6 files changed, 44 insertions(+), 30 deletions(-)
>>
> 
>> @@ -2193,11 +2193,10 @@ int of_map_id(const struct device_node *np, u32 id,
>>  	}
>>  
>>  	pr_info("%pOF: no %s translation for id 0x%x on %pOF\n", np, map_name,
>> -		id, target && *target ? *target : NULL);
>> +		id, arg->np ? arg->np : NULL);
> 
> Is it just 'args->np' then? If it's NULL, it's NULL anyway.
> 
Right, will update this.

>>  
>>  	/* Bypasses translation */
>> -	if (id_out)
>> -		*id_out = id;
>> +	arg->args[0] = id;
>>  	return 0;
>>  }
>>  EXPORT_SYMBOL_GPL(of_map_id);
>> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
>> index bff8289f804a..74fc603b3f84 100644
>> --- a/drivers/pci/controller/dwc/pci-imx6.c
>> +++ b/drivers/pci/controller/dwc/pci-imx6.c
>> @@ -1139,12 +1139,18 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
>>  {
>>  	struct device *dev = imx_pcie->pci->dev;
>>  	struct device_node *target;
>> +	struct of_phandle_args iommu_spec = { .args_count = 1 };
>>  	u32 sid_i, sid_m;
>>  	int err_i, err_m;
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
>>  	} else {
>> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
>> index a0937b7b3c4d..e1d4b37d200d 100644
>> --- a/drivers/pci/controller/pcie-apple.c
>> +++ b/drivers/pci/controller/pcie-apple.c
>> @@ -755,6 +755,7 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
>>  {
>>  	u32 sid, rid = pci_dev_id(pdev);
>>  	struct apple_pcie_port *port;
>> +	struct of_phandle_args iommu_spec = { .args_count = 1 };
>>  	int idx, err;
>>  
>>  	port = apple_pcie_get_port(pdev);
>> @@ -764,10 +765,11 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
>>  	dev_dbg(&pdev->dev, "added to bus %s, index %d\n",
>>  		pci_name(pdev->bus->self), port->idx);
>>  
>> -	err = of_map_iommu_id(port->pcie->dev->of_node, rid, NULL, &sid);
>> +	err = of_map_iommu_id(port->pcie->dev->of_node, rid, &iommu_spec);
>>  	if (err)
>>  		return err;
> 
> of_node_put(iommu_spec.np);
> 

Sure, will add this.

>>  
>> +	sid = iommu_spec.args[0];
>>  	mutex_lock(&port->pcie->lock);
>>  
>>  	idx = bitmap_find_free_region(port->sid_map, port->sid_map_sz, 0);
>> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
>> index 1b7696b2d762..5f1d6540049a 100644
>> --- a/drivers/xen/grant-dma-ops.c
>> +++ b/drivers/xen/grant-dma-ops.c
>> @@ -325,7 +325,7 @@ static int xen_dt_grant_init_backend_domid(struct device *dev,
>>  		struct pci_dev *pdev = to_pci_dev(dev);
>>  		u32 rid = PCI_DEVID(pdev->bus->number, pdev->devfn);
>>  
>> -		if (of_map_iommu_id(np, rid, &iommu_spec.np, iommu_spec.args)) {
>> +		if (of_map_iommu_id(np, rid, &iommu_spec)) {
>>  			dev_dbg(dev, "Cannot translate ID\n");
>>  			return -ESRCH;
>>  		}
>> diff --git a/include/linux/of.h b/include/linux/of.h
>> index 824649867810..9d72d76f909d 100644
>> --- a/include/linux/of.h
>> +++ b/include/linux/of.h
>> @@ -463,7 +463,7 @@ bool of_console_check(const struct device_node *dn, char *name, int index);
>>  
>>  int of_map_id(const struct device_node *np, u32 id,
>>  	       const char *map_name, const char *map_mask_name,
>> -	       struct device_node **target, u32 *id_out);
>> +	       struct of_phandle_args *arg);
>>  
>>  phys_addr_t of_dma_get_max_cpu_address(struct device_node *np);
>>  
>> @@ -929,7 +929,7 @@ static inline void of_property_clear_flag(struct property *p, unsigned long flag
>>  
>>  static inline int of_map_id(const struct device_node *np, u32 id,
>>  			     const char *map_name, const char *map_mask_name,
>> -			     struct device_node **target, u32 *id_out)
>> +			     struct of_phandle_args *arg)
>>  {
>>  	return -EINVAL;
>>  }
>> @@ -1458,17 +1458,24 @@ static inline int of_property_read_s32(const struct device_node *np,
>>  }
>>  
>>  static inline int of_map_iommu_id(const struct device_node *np, u32 id,
>> -				  struct device_node **target, u32 *id_out)
>> +				  struct of_phandle_args *arg)
> 
> Document that it's the caller's responsibility to of_node_put() returned
> node. As it can be seen from the previous comment, it's not obvious.
> 

Sure, will add comment regarding this.

>>  {
>> -	return of_map_id(np, id, "iommu-map", "iommu-map-mask",
>> -			 target, id_out);
>> +	return of_map_id(np, id, "iommu-map", "iommu-map-mask", arg);
>>  }
>>  
>>  static inline int of_map_msi_id(const struct device_node *np, u32 id,
>>  				struct device_node **target, u32 *id_out)
> 
> Is there a reason for chaning the of_map_iommu_id() args but not
> of_map_msi_id() args?
> 
 
Thanks for pointing this out. I’ll update the series to keep of_map_iommu_id()
and of_map_msi_id() aligned.

>>  {
>> -	return of_map_id(np, id, "msi-map", "msi-map-mask",
>> -			 target, id_out);
>> +	struct of_phandle_args msi_spec = { .np = *target, .args_count = 1 };
> 
> Which driver passes something being worth of storing in .np?
> 

You're right, There is no need to store these input args. Will remove these initializations.

Thanks,
Vijay

>> +	int ret;
>> +
>> +	ret = of_map_id(np, id, "msi-map", "msi-map-mask", &msi_spec);
>> +	if (!ret) {
>> +		*target = msi_spec.np;
>> +		*id_out = msi_spec.args[0];
>> +	}
>> +
>> +	return ret;
>>  }
>>  
>>  #define of_for_each_phandle(it, err, np, ln, cn, cc)			\
>>
>> -- 
>> 2.34.1
>>
> 

