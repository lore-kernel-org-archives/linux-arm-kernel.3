Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D0DD597BC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 23:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=30OmWzI8bY1NgWJeTzK26aydq5gBzrLGNDeVe/D6eIw=; b=czhRiDmoIv/Q9kx8JrriUz9hhY
	vd5+ZlP3ubBNrTa6z9AKlAdrWySy1sKtAx2/eV/ypy1FUbxbQTftj5uyhhQFl6l5eZNzTHeDWqLB5
	vACzfV6ahy4kIPEbnCCbsSQ5b2+LCjOhYBdw0eBg2DY0ZYtrxZOSC9NmZwuoiEQcDLxf9IDCiAruV
	BnXqHP+E3VR/t1YqH1Lg2g1L/RjUH9iLL9tLowfklbFWFUJ/4V7Qyy9kY4IYF1pfUm0eIhjDTkiHJ
	DZZ+/tApqLjdqcv8+OU2IT19kPwGXvtkwSEyPQNwHuU2BjZLqUObMkHvlWiiBIQ4C9ybXNQT4ABrX
	B368PX6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB0bC-00000005K6l-07Fj;
	Tue, 12 Nov 2024 23:47:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB0ZN-00000005Jpu-2ZbX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 23:45:15 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACMTbS2007483;
	Tue, 12 Nov 2024 23:45:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	30OmWzI8bY1NgWJeTzK26aydq5gBzrLGNDeVe/D6eIw=; b=Llj46RG/3j9c4EQF
	qCaWZYkQap95t5u0KygYnhHV77w7wYmy/aF+T0aysuWGyA+eJMCIrVmzcPcD17nF
	TaNV4bTjncpRuCCwDiDCulhZQBJAsP/7diU+hAOt+fMGANlB9+W7Zo3Em4/Nqsod
	EydU+nlD5iLx/Cd+wKIaYbz/J4rhQGBw+E3LEXp3QJ+8VZg5CLkfCcyTSRsIvV+L
	xdq/k26VW5P6yMwRF0htqT7CPnH+1zOHB1VFbU/WGYFY56EAk2LoONwcwUiDHlsu
	fF0SUTjRNxYTKKRHTL2jFp4Y0bchSU+np5xB4xLja8fR0pJtVo03L4T+yWRvKANK
	Kn9PWg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42t0gm0vpb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 23:45:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ACNj3BF022675
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 23:45:03 GMT
Received: from [10.48.243.207] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 12 Nov
 2024 15:45:02 -0800
Message-ID: <c504da22-abb5-4dd5-ad57-8e7b25733237@quicinc.com>
Date: Tue, 12 Nov 2024 15:45:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wlcore: testmode: Constify strutc nla_policy
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Kalle Valo
	<kvalo@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>
CC: <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        <linux-wireless@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <78810e3ebb74ddbd3a4538f182bf1143b89baba7.1731332414.git.christophe.jaillet@wanadoo.fr>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <78810e3ebb74ddbd3a4538f182bf1143b89baba7.1731332414.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: AQmCJZ-ADAi0H-gp8rhXAlFr50GaOSo0
X-Proofpoint-GUID: AQmCJZ-ADAi0H-gp8rhXAlFr50GaOSo0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 clxscore=1011 mlxscore=0 mlxlogscore=961 lowpriorityscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411120191
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_154513_725219_D6E77EF1 
X-CRM114-Status: GOOD (  17.92  )
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

On 11/11/2024 5:40 AM, Christophe JAILLET wrote:
> 'struct nla_policy' is not modified in this driver.
> 
> Constifying this structure moves some data to a read-only section, so
> increase overall security, especially when the structure holds some
> function pointers.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>    5062	    528	      0	   5590	   15d6	drivers/net/wireless/ti/wlcore/testmode.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>    5178	    404	      0	   5582	   15ce	drivers/net/wireless/ti/wlcore/testmode.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>

> ---
> Compile tested only
> ---
>  drivers/net/wireless/ti/wlcore/testmode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ti/wlcore/testmode.c b/drivers/net/wireless/ti/wlcore/testmode.c
> index 3f338b8096c7..fc8ea58bc165 100644
> --- a/drivers/net/wireless/ti/wlcore/testmode.c
> +++ b/drivers/net/wireless/ti/wlcore/testmode.c
> @@ -45,7 +45,7 @@ enum wl1271_tm_attrs {
>  };
>  #define WL1271_TM_ATTR_MAX (__WL1271_TM_ATTR_AFTER_LAST - 1)
>  
> -static struct nla_policy wl1271_tm_policy[WL1271_TM_ATTR_MAX + 1] = {
> +static const struct nla_policy wl1271_tm_policy[WL1271_TM_ATTR_MAX + 1] = {
>  	[WL1271_TM_ATTR_CMD_ID] =	{ .type = NLA_U32 },
>  	[WL1271_TM_ATTR_ANSWER] =	{ .type = NLA_U8 },
>  	[WL1271_TM_ATTR_DATA] =		{ .type = NLA_BINARY,


