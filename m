Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EC8D25B4B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 12:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N07p+s1dUgvFBMxNpW2da12jwTaJJ6ibvwkL6xYgEWI=; b=VNfea44/IVbmBy2JQ1ZcU1PqqW
	s43whPRaDZri2mqxOVU7DMEGqZqMxwqukz0woHzbke27P6U6kOMp+mt3l7v9VtAWEum70+nP7UgSn
	j/82nZojvn7WA92w6INhu5O9bMwYrExZvoqtmY4ZD3s6Q4IQNdSDX7FLfOBO0JoisQK+hiPxGHqY2
	ZLQqsw/UQsnqcCR6KJEIDXGPLZ0OMAuQJ88gIkLL7Fepz6YZNP2Gm4te8hTB4KLLbF3nmpaYu4+Cp
	/ekTJK6ZoKNqqsPQBjkIsDpUlS3vfErt3I5f2YERDn2F7pyHyJwDULMPC/HcDoneuKRhy20ZhuIiI
	AL+z+Lzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl4ev-0000000G0CI-3rgn;
	Wed, 28 Jan 2026 12:28:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl4et-0000000G0Bf-3Wt5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 12:28:32 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S92U0A254531
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 12:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N07p+s1dUgvFBMxNpW2da12jwTaJJ6ibvwkL6xYgEWI=; b=aoe/GZK3vTUzRy/w
	MoHBh8zCcW3mXfkwfyhi/TU9963Zu9VzJ27aTykGkNqRPURJ7+Mj+G70TYN3Kfqp
	qvCdottrWm3epCbfL9lhgC70jAvXY419vKb07waHP+Hpsod2FueJeF0vLwdB+E/F
	mnwc5w+NScWcERrq3VLamDsv20gfaNjcUndJ93W8JS0qGOLCjEWx2+X2EGSFCQgy
	6fvk1t95Q6aWj4OrHf/Z/bp+rHDpPqNIWEQIe3qzJlXWOGjwSrO0nxOaegpJ27NE
	9GjQESAS0mQUAvInGR0BOUVrQuDUXp6GYrk4dC/fGtenEeuqufzHaBWemYku5qpP
	ZBy5aQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by20y3ax9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 12:28:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70c91c8b0so55996685a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 04:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769603310; x=1770208110; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N07p+s1dUgvFBMxNpW2da12jwTaJJ6ibvwkL6xYgEWI=;
        b=gYtt46WXTbIqJ+Vd7pHJdcUIxgUXtf81T8pt0s50zRJWmJ5bbmrSeAudj2eZrABL2F
         v80gzh1CbwMtO1Nyr2TLXCPl+cos7DPmMt5DgyFmyR9hWmmvGJvnB8GlgQqqkmQjiK6O
         utuDfIusFNv30rFLRDX37vX1UQ/RZh2Fz1RwkXbNSW/MsFYfYM1I26Pp/HPOUdz2psau
         CYQipGeyKIoI2NbQiBm8wNdu6uRoZ5TMoNO/vG79MBe83kD37InFS30n2NIATWp2zZ+J
         CW9A2B+JF4vv+4Z6Z1JedoKTrQOB5txylIp4QY0aUvzrruH4Qa7r25+i1+qUgxDcveFr
         AGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769603310; x=1770208110;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N07p+s1dUgvFBMxNpW2da12jwTaJJ6ibvwkL6xYgEWI=;
        b=UTFsYLieJj+1Q9TixoL+MmrAu5HdDDfkCh882Ti8oRpo120LggwLAXR/VPABV5odYV
         JhsZ0AxRdLzpfDT4+78GwRgGkC5mRQQJlvZLaVWk1hNMEmuPT46qxWY+/xqAEMiGjp9b
         KsWMU8XlqMd0swbXhhxLLgtWNVTZaVAalApYji/HsrrjU01jneIL13MOM4TIx6+MW9nv
         AAEOzOxoZSFp4Qz4TGQYIZZ4v+rt0Dx4w/ouidq/LX9tkMSDhvtLsimv2GwrsG0BkNVO
         tFaZpQ06RE5SE5kRWNssFGQwTYDlv3XMa9LpQAm/+V+TPW5CNJjN/VQLWrIbeu83vW8g
         MZ6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUzwPSQeh/e9rBgQuzHLreLn+gcgbrqnG4aeRgz6Vd16bRG4TfixYLoN/dYiQcEwe2+gCgLoVu7sv29PycHWi85@lists.infradead.org
X-Gm-Message-State: AOJu0YyVj+97CXz7HbbOWBDfIL4ZggZgWVcVnNcECmc0bBNbRzzXjysh
	8uQV+wrnCu+S7C+2nNCoTHR4VneN5qX8mhbrSrdFONEU+enTdVnFMN62Tk15BG9FMWVVtlWsh6Y
	tbXeNnGp22qKQd2Iyp9l+lfHv6q8mtQq+KSOD43ZXS+GVLwC0lSoeIpxxT8TuZolqASZS4ES6if
	WXow==
X-Gm-Gg: AZuq6aJhxhwOymq1VwVM88VYOLLBbchJN9Bj4DXh7/d5xCMFJd4mXhp0DYG77qx4Qgp
	3FoybHcfWWc9trK8HCFG1+r7p3roYxCpGkLGmfjoY/ucp4MBxErR2/n04cp/L3rt1LDZOKwvDS2
	NaUjTcmYRtxbyJQaGockHbwdjGgv7BByMD1Zw0DbacBBokRO9bNmvBP4x1morIPGCcWXe+g7jdt
	055hFItnaLozP9ogD2AYm2mAedZxQQt1HZr82QcBA+fWk3zuIdWEGXlBikFWg0BNU4Zm/p8b8g3
	JQX66jcEvJ+3rSB+EUbCXZEZY3EQq8wzHzRpbEKoobMuTji2Py+9xx8+4GuTBEi8fwsAuCrReiC
	Q7uhpbi1Zdxv11BHSsY4oSYvnm82J+xg1IzbboPxXpNSF9DifCqWGmqO1Fw/sZsyCzY4=
X-Received: by 2002:a05:620a:46a0:b0:896:ead2:a657 with SMTP id af79cd13be357-8c71ab1cc92mr355685a.0.1769603309694;
        Wed, 28 Jan 2026 04:28:29 -0800 (PST)
X-Received: by 2002:a05:620a:46a0:b0:896:ead2:a657 with SMTP id af79cd13be357-8c71ab1cc92mr353085a.0.1769603309287;
        Wed, 28 Jan 2026 04:28:29 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dcb4b1186sm60595566b.39.2026.01.28.04.28.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 04:28:28 -0800 (PST)
Message-ID: <63531057-ea7c-4a87-9848-04e502bffc32@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 13:28:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] PCI: qcom: Add D3cold support
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jonathanh@nvidia.com
References: <20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com>
 <20260128-d3cold-v1-3-dd8f3f0ce824@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260128-d3cold-v1-3-dd8f3f0ce824@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: c7DoV17joomBR7d3ZTISTvh5gjo2M7Bb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEwMiBTYWx0ZWRfX9961zTEzf+id
 42idhCYZjLcmN09sKIGg9ttRqMC2Gbb/pZfMW5LUJ8Bq04va5h4xHiMWTdqUQov4LXSJ8p9qFpj
 HfxCQjTYEzMJ0sFpNKEsSs3/0B1U7ToPg9cccz9PEZ1ScoWecdx1UENy3FJ23X1EWxkWobHQ/5r
 mgfalbL05sXCBBMSqXXLdfI+EmHqjRHIwhs1BWXKWBqSsmeKxD6KD0sCExpRsLfAM3bm76eCRLD
 EU7gjlYYSPzmf7uwqMfesw3R1f8Qp2DR4A0kZ8ebZFLSNnCN5bP6FwpP4N9COZz7TuvUxznVZRH
 /nIGo/b9c94idlK2GIgHhqE3VXvWHpf2Dnju3GCSxlCCWCNCBczminniHDiwJ3PkDgSu0n3vHJY
 OQwt0GA4Qa2IMkqo3hQjzGFwZNpX9ZffuokWWwlE+laxpJXvnonkGKM+xbEERHDrkmme7Z+dMnt
 a0OucRjurf2NcXD3Nsw==
X-Proofpoint-GUID: c7DoV17joomBR7d3ZTISTvh5gjo2M7Bb
X-Authority-Analysis: v=2.4 cv=IKgPywvG c=1 sm=1 tr=0 ts=697a00ee cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gkRObvzxmN_HJK3DEhcA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_042831_899824_CC7F7326 
X-CRM114-Status: GOOD (  14.54  )
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

On 1/28/26 12:40 PM, Krishna Chaitanya Chundru wrote:
> Add pme_turn_off() support and use DWC common suspend resume methods
> for device D3cold entry & exit. If the device is not kept in D3cold
> use existing methods like keeping icc votes, opp votes etc.. intact.
> 
> In qcom_pcie_deinit_2_7_0(), explicitly disable PCIe clocks and resets
> in the controller.
> 
> Remove suspended flag from qcom_pcie structure as it is no longer needed.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

[...]

> +		/*
> +		 * Only disable CPU-PCIe interconnect path if the suspend is non-S2RAM.
> +		 * Because on some platforms, DBI access can happen very late during the
> +		 * S2RAM and a non-active CPU-PCIe interconnect path may lead to NoC
> +		 * error.
> +		 */

I think someone internally once tracked down what that access was

Can we fix that instead?

Konrad

