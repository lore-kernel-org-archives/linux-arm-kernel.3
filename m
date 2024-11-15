Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999B0D6A223
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 01:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zs+u/WBcKqFMpAZC4G1CWeKDGTHkGvE+KuzQ9IOGNa4=; b=J50INypwKZO/vfC/+OhPOcGCvP
	pBH3W3gM2uX8Ok/+ZAn9ul9Fl3WIRMdRq1C2H9DLwqcIvkuPVG/PYg3Yoo9CekJSg+AwwfJtjhkva
	jw//NzdbWzQbmHmeHFq5BpRLA9Zh6NZSzQNdRHAbwnwcfcZ++KqvrNYxvks1ucLrnHikRCty9lFm3
	Hezs1O0R/bV9iZwJlGZEpvrXT3UlLoT1pXBVHP6YKMfH0+FzI1nQL+XHjB/EyPajEk7srVHtwZUY8
	3ufHPsTSYQ2H28I4Xq7bpTAMFva6ctgzUnYgtRfKLrcSL9JtEg72o56rzbiWrYJsf5w1VHVUlfIiV
	8EMAwpqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBkqU-00000001GmX-3QNv;
	Fri, 15 Nov 2024 01:09:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBkpD-00000001GcB-0KeG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 01:08:41 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AEHIXlD028167;
	Fri, 15 Nov 2024 01:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zs+u/WBcKqFMpAZC4G1CWeKDGTHkGvE+KuzQ9IOGNa4=; b=AO8n7byDtsJ8Q4sT
	GxqOuotihj59zU/q/x6YXQZvlV18829dnnUkMDFfNr3AnErl8KT9WEPhg1jo413Q
	WJIwWaP6E70EUDSuBs5wAo13u+GsYsC2awJnya+rU4GpRh1UwR0ukt+3ZVEgXBVn
	SS4vqwM9PDDJth/0KBVGt5xtG7BuaCpAi/EEYMafDJ5FSO7S6uLrnxCeL5cnqaQR
	IitYhZoRG2okq2tSGKsv2GEDxzgHaLXURw8II1ctT/ehMFASq0hfrs0MsCBwtxQF
	m3/gx4PHJ8TfQXvb8FqENtfjYwyp/7k0kFgbZqRx1QevGYnuQo7KG4nSPP8nlS33
	TLC9SA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42w66gvhp6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 01:08:26 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AF18P0p015188
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 01:08:25 GMT
Received: from [10.111.171.131] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 14 Nov
 2024 17:08:20 -0800
Message-ID: <2ac308d7-35be-463e-9838-3bbedc2a4d68@quicinc.com>
Date: Thu, 14 Nov 2024 17:08:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: stmmac: dwmac-qcom-ethqos: Enable support for XGMAC
To: Andrew Lunn <andrew@lunn.ch>
CC: Vinod Koul <vkoul@kernel.org>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "Andrew
 Lunn" <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        "Eric
 Dumazet" <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
References: <20241112-fix_qcom_ethqos_to_support_xgmac-v1-1-f0c93b27f9b2@quicinc.com>
 <55914c2a-95d8-4c40-a3ea-dfa6b2aeb1dd@lunn.ch>
Content-Language: en-US
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
In-Reply-To: <55914c2a-95d8-4c40-a3ea-dfa6b2aeb1dd@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VpAiDIwJg0qQK9JKi3waIpj8WD7-13GN
X-Proofpoint-ORIG-GUID: VpAiDIwJg0qQK9JKi3waIpj8WD7-13GN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 mlxscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 clxscore=1011 lowpriorityscore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411150009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_170839_283122_EFD6D100 
X-CRM114-Status: GOOD (  13.19  )
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



On 11/13/2024 6:51 PM, Andrew Lunn wrote:
> On Tue, Nov 12, 2024 at 06:08:10PM -0800, Sagar Cheluvegowda wrote:
>> All Qualcomm platforms have only supported EMAC version 4 until
>> now whereas in future we will also be supporting XGMAC version
>> which has higher capabilities than its peer. As both has_gmac4
>> and has_xgmac fields cannot co-exist, make sure to disable the
>> former flag when has_xgmac  is enabled.
> 
> If you say they are mutually exclusive, how can it happen that both
> are enabled?
> 
> To me, this feels like you are papering over a bug somewhere else.
> 
> 	Andrew


We can set either has_gmac4 or has_xgmac flags by using below
dtsi properties as well. But since Qualcomm only supported
GMAC4 version in all of its chipsets until now, we had enabled
has_gmac4 flag by default within dwmac_qcom_ethqos.c instead
of adding any of the below entries in the dtsi. But this will
create problem for us as we start supporting Xgmac version
in the future, so we are trying to add this change so that
our driver can support Xgmac version when "snps,dwxgmac" is 
defined in the dtsi and we are keeping the default supported
configuration as gmac4.


	if (of_device_is_compatible(np, "snps,dwmac-4.00") ||
	    of_device_is_compatible(np, "snps,dwmac-4.10a") ||
	    of_device_is_compatible(np, "snps,dwmac-4.20a") ||
	    of_device_is_compatible(np, "snps,dwmac-5.10a") ||
	    of_device_is_compatible(np, "snps,dwmac-5.20")) {
		plat->has_gmac4 = 1;
		plat->has_gmac = 0;
		plat->pmt = 1;
		if (of_property_read_bool(np, "snps,tso"))
			plat->flags |= STMMAC_FLAG_TSO_EN;
	}


	if (of_device_is_compatible(np, "snps,dwxgmac")) {
		plat->has_xgmac = 1;
		plat->pmt = 1;
		if (of_property_read_bool(np, "snps,tso"))
			plat->flags |= STMMAC_FLAG_TSO_EN;
	}

