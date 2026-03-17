Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C45F3381B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 09:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vOuiJ6MeDMkaWLveMBBkfhjpipSzpptBgVxbpSymF94=; b=RwG8rpIg3PFqfn9d20I5ZG0+MA
	04GyDqYfzMFzTim5hOsXmbnf+HCW2VHf4kLYFxDtZOyqXP0ey/S8i8fBeuJi/H0exLDXKurL9jIPS
	1nIq5dcEAEWpxVk7G3POwekSxzwynsdrKqcSMYQXxXTLZDcSnNkFUOB2Imy7ppPzfmzg2PjgMVlFY
	X6QMEUIxipFuWXSphAb6yvxpfxCLFx65dIigDIT7HwsKWr4n2TDYAjfmBoYg0VXF+2e+WCgFMIbWb
	uVunHu/zFBDYNVWms32ecuVGqmONNauGrdd4cy4zDiDtdwXUQHBn7B/ak7tfz8OkKGoHu5PoU1XSa
	XtI+aBQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QWi-00000005pJs-3WhU;
	Tue, 17 Mar 2026 09:15:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QWg-00000005pJI-2gG6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 09:15:47 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H5NjIZ1428764
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 09:15:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vOuiJ6MeDMkaWLveMBBkfhjpipSzpptBgVxbpSymF94=; b=LpA55TNuDvPNJoZJ
	o2ILbP6uuKoSILs/FaBIqRvUNZ3rXskSgY0pe81mRBUvlXjly7VqErYdDVHkSMyl
	5Phvwp6ukaLmdxsEpnSGz9YvXu97wZj+sSBdPaiFBpVT8z+FKETtM23WP5UWEbSp
	PDJZpysve5jZKLKrzg5V6ympYdkRal7q7DrD+dPYwwijhpG6Bc2XRoXIGjPO6HFU
	5mPc5T+DC5BY/WjjNVTl6jgxo4Ubpxa04CQFzd/rYgUa7UKELDjoxeGLITkf7Bqn
	TWCXdulkZg+Yks3teRIS/oIzbGqFSlLlfNQLz7bsLGZeOCWdMtJVPf8/IpJjzXHP
	tUwg4Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxh99c3dd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 09:15:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb456d53a5so367529785a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 02:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773738945; x=1774343745; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vOuiJ6MeDMkaWLveMBBkfhjpipSzpptBgVxbpSymF94=;
        b=iLezdsZYRJgPoUDmwUTAofs7Lxp2O+LzKyVtGySUpLTvrUTzIpCjLjKGD6bfH0IefL
         rOi/Vt5bs1Wp9pV5ILwQZoxkS6W/7CWAHPImxG8wQhCJL+YjUnww5E24egPU7/FF5QTm
         JUexc2p4JNzwq5DNrZOrtcoJ6d4yh1FnbXCR2Syr2ogSNFxOpzfkgwcR+ceRAfAQdk6c
         cOxDnEbzWwQlkeOp5HqU12yzqhmKTXb65+UN4Iqa3++24Ka/h3n2LlQ/aQghpX0WQt94
         Mc95S2QoZl6ggheeRDV4oYbvPytMw8oC7RI92+Kac048OiJl2nfeCNynNTbiBPMSFpc0
         BnMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773738945; x=1774343745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vOuiJ6MeDMkaWLveMBBkfhjpipSzpptBgVxbpSymF94=;
        b=BAX1xFGPvJH1XHc3pL53ErgUqe7T1CUn97dFnDR1hl518fWHmNZotqIT3SoiUYRpTh
         jjztRKzEUEuSd71ciSI/NE62nvLFpFU6nXQGFJm4bVCXZWO6fHYW4oxP3ldgOisXf35V
         moCCsMwLzyiXHTzFpLnCSAwLhjZXVH+larEy1D/V4U8ifurqeJ9+JWEM8mNIE/k4fCDj
         dxeZeqeP/ex9yL9NDWWJHtvWrWAFjKIVZsVJO2vWC7Lb2DhMNaJdfaRBFBSNhWq6SQ2D
         nA8+s6TjXzcKGQ1exzvKoxhoJRJnBd4vbB5nTpZJRyB5RDRU85pNuZfGXdx/VfR6Rjcm
         R7fQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfVyZv9NvntiL7/lUV0r2OEU58PUZg2V70rJF4XZ1Yi/AtTpJf1GZq163CKJhG2F5anPDAacevIddCe/9PmfVI@lists.infradead.org
X-Gm-Message-State: AOJu0YzpchdI/5kX9TUktK/ESOlVLiTN9cgzqt8SN8CJuxOao8YI6jkb
	ehrkBsaiYRfwPTLB6yGL+gOdgDqqwfBwDnSCz7tN4HWgpEaRLVJp/gXJzbWiij3fwj2b066+y3w
	ZOwiaGSbY5N04p5Nau0zYTzncmVE/sBSuEwRkKXoY95e72TynmSoWAYkpR4Nlbxk/wB445tvOWG
	Hjew==
X-Gm-Gg: ATEYQzyU5dZqSgTWS3rvqQx1BY4OHZlcRiNAocGiTQA4OhBfA1adzThE6ehU86iD66n
	EQkNFeRP5qagXjosi8CR1idlz6492uksmh9M9Z2BelwFgxz+hidpjNjNyywFK3LICfyRsvupYEu
	Tp1y4pBk1IfTvIYtzWBfdOfaPSV/ThguGG2DnVXm5psaf8xv32u9M6vx+moQNFgxESpB/+XI6DF
	Zai9y6C/GPeYXPDTjkj6n+2lyYacY5zVv9VxJPZxwDm80eqarDBC7Ysso+3QIwcn03uVaGzzBn8
	Q+QyvBz7mASVzQn/O00cW466qG10hzQ7MS/+ntBIGdyUq0XbyEgHVCinkXZ/kH360UJNUfBjIYJ
	tpv2ulZOMy8D5z7XnKmPucUiBM5BLWOdOhpCAqnNIpWUd/4IufbcSHbKIaU/MQsrZAjpIi8USnQ
	4Csfo=
X-Received: by 2002:a05:620a:1a0d:b0:8cd:78b6:e261 with SMTP id af79cd13be357-8cdb5a2d5cfmr1661636085a.2.1773738944988;
        Tue, 17 Mar 2026 02:15:44 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0d:b0:8cd:78b6:e261 with SMTP id af79cd13be357-8cdb5a2d5cfmr1661633985a.2.1773738944550;
        Tue, 17 Mar 2026 02:15:44 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66350d73f14sm6262122a12.30.2026.03.17.02.15.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 02:15:43 -0700 (PDT)
Message-ID: <f3344006-5511-4f1b-aea3-7dc81a091cd8@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 10:15:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] PCI: qcom: Add D3cold support
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jonathanh@nvidia.com, bjorn.andersson@oss.qualcomm.com
References: <20260311-d3cold-v3-0-4d85dc7c2695@oss.qualcomm.com>
 <20260311-d3cold-v3-5-4d85dc7c2695@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260311-d3cold-v3-5-4d85dc7c2695@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RJ++3oi+ c=1 sm=1 tr=0 ts=69b91bc2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=U-o9HKKhJ6a-R5p13S8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA4MSBTYWx0ZWRfX8adgoOiVct6I
 G9w73LNjJWBbyKJac0uYMuH07ucF/jY5KrL1zvsCrE1Msw5Audwgj0iOoJ0Ll7kYWgLmj+la963
 jBo2Po2HNJ+zHG61dVtMo2cO7aKJdkacSoRhNrh4+o/Sx9+BnnnrHNp4j2pZdFrXllz2RMprX3j
 CiSdhXQvxM7AF740/kvaPLnQAj68RC7IpHUVb+aFrJ0NAwSZOP3ZTeuM03XH2/lDIFns55T8m1/
 pJZfNg4uBQojc5DRI420jL8x5cjGKp1nQufWala+jrZxL88fB7HCPlc+Mkif2gRLs+ts9YE+rVz
 Gmb6CwCJvj2K6ZEu7OyAKDR5iLpVoOf+4zuC9H+IBreIHU0/vMYT8BGbisfsjH12/DUncbv0U72
 2jdiXFr4khsJZMOcT1OguRacKLDnQqBlbQ/9MQs6jMjymEAvRx2a5O7dTx7si8t02QxjINY5Itb
 pXaEvvG5g2QH2d/hzYw==
X-Proofpoint-ORIG-GUID: 3jpzeiCKCs1gToBekeWS8_HeyL2zGR_Y
X-Proofpoint-GUID: 3jpzeiCKCs1gToBekeWS8_HeyL2zGR_Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_021546_689494_B52E711D 
X-CRM114-Status: GOOD (  15.73  )
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

On 3/11/26 11:26 AM, Krishna Chaitanya Chundru wrote:
> Add support for transitioning PCIe endpoints & bridges into D3cold by
> integrating with the DWC core suspend/resume helpers.
> 
> Implement PME_TurnOff message generation via ELBI_SYS_CTRL and hook it
> into the DWC host operations so the controller follows the standard
> PME_TurnOff-based power-down sequence before entering D3cold.
> 
> When the device is suspended into D3cold, fully tear down interconnect
> bandwidth, OPP votes. If D3cold is not entered, retain existing behavior
> by keeping the required interconnect and OPP votes.
> 
> Drop the qcom_pcie::suspended flag and rely on the existing
> dw_pcie::suspended state, which now drives both the power-management
> flow and the interconnect/OPP handling.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

[...]

>  		ret = icc_disable(pcie->icc_cpu);
>  		if (ret)
>  			dev_err(dev, "Failed to disable CPU-PCIe interconnect path: %d\n", ret);
>  
>  		if (pcie->use_pm_opp)
>  			dev_pm_opp_set_opp(pcie->pci->dev, NULL);

Does calling .suspend not drop the vote by itself?

[...]

> @@ -2132,25 +2138,46 @@ static int qcom_pcie_resume_noirq(struct device *dev)

Similarly, I'd expect that .resume restores it (and you didn't do it manually)

Konrad

