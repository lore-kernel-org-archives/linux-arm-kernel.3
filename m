Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 182A3C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 05:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LnArCRvQP7qZOrcigjEhnlKt1WGcj0RSP3AVU9Xt1Rw=; b=S/R5UAIc3ijWnMKb1beVilTFQp
	P4k71ll4wRC14fQcsg6/6aQumIVq+kZfOSyLD1WiCJ30oHK3zUhUYHCnhQxbwjBhsIepi/9z9Ytve
	oJXMYuvaLCgI31OeHz5tUMtYSMw3R70RykfTp3gAG1stkVtCzdHm46Wforv07+MXwlqpS7DnK5VWW
	fZQpCzsPURqUS9jnkYFLG9nYsKgfNMmw6BVOr1avGqVjU5kHtpRPT+0PuypeYVUif5JHw3AzR2+ah
	SMMzKSD3AhdLOoNJjSCRWuWdaUEq4Q7dpwElhQhqKZngEzDu/86suxH1pBloUjFeyqWVXn5L4NJyB
	/zq8IfVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txfoA-0000000ADlc-2Kzz;
	Thu, 27 Mar 2025 05:29:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txfmK-0000000ADf9-3wD7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 05:27:46 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R3mahx006138;
	Thu, 27 Mar 2025 05:27:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LnArCRvQP7qZOrcigjEhnlKt1WGcj0RSP3AVU9Xt1Rw=; b=Xj4Py5i9Q0TzIzzi
	my+ADEun/Km1arM7a2uUxtPtAmNqAa61N4XTOgZ+w+xAP6yD4TDnez84m3xIbez1
	VZvm9DabIgtgG5aDDfsksuPdnnNotSn0oxC2k/ittPjmsMJTXb53sRj9Jz77BwnX
	N67MCTPS4G1EVycvyiLIk2mSf4knt2tBt9pLfoAJN5ZVWVrUGEu2PmOBcLO5+WU3
	k6KvIK7eZDxuA4VcJ6G9Te7sMriX690Kk8xhszgICI7HL1N6n28mf4YySu44OX3I
	8ROUO/tYmCNKX4I78KHBRv2xhDQEZ+utXIV9B3jSw44Yah/TA5yeKlqvtO3fcuDC
	Fl1Okg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45manj3r71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 05:27:35 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52R5RYMc020190
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 05:27:34 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Mar
 2025 22:27:31 -0700
Message-ID: <208f3edd-2be0-4edd-be25-d874d00b770d@quicinc.com>
Date: Thu, 27 Mar 2025 10:57:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: davinci: add I2C_FUNC_PROTOCOL_MANGLING to feature
 list
To: Marcus Folkesson <marcus.folkesson@gmail.com>,
        Bartosz Golaszewski
	<brgl@bgdev.pl>,
        Andi Shyti <andi.shyti@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250326-i2c-v1-1-82409ebe9f2b@gmail.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250326-i2c-v1-1-82409ebe9f2b@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8NOGiPWwjg7VCHgxcPrPDn4WeJACh39q
X-Proofpoint-ORIG-GUID: 8NOGiPWwjg7VCHgxcPrPDn4WeJACh39q
X-Authority-Analysis: v=2.4 cv=KvJN2XWN c=1 sm=1 tr=0 ts=67e4e1c7 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8 a=kRCqjBm0PVXXUO08W4wA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 priorityscore=1501 clxscore=1011 mlxscore=0 spamscore=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_222745_110975_F7067EFD 
X-CRM114-Status: GOOD (  18.56  )
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

Looks good to me.

On 3/26/2025 8:09 PM, Marcus Folkesson wrote:
> The driver do support I2C_M_IGNORE_NAK, so add
> I2C_FUNC_PROTOCOL_MANGLING to the feature list.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Acked-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---
> The driver do support I2C_M_IGNORE_NAK, so the
> I2C_FUNC_PROTOCOL_MANGLING bit should be set.
> 
> I2C_M_IGNORE_NAK is the only supported "mangling-feature" though, but
> other i2c bus drivers also seems to support only a subset of available
> mangling-features, so I guess this is ok.
> ---
>   drivers/i2c/busses/i2c-davinci.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
> index 6a909d339681214ed4f382b62f8cd924f4295e69..6a3d4e9e07f45ecc228943e877cde1fd9d72e8cb 100644
> --- a/drivers/i2c/busses/i2c-davinci.c
> +++ b/drivers/i2c/busses/i2c-davinci.c
> @@ -551,7 +551,8 @@ i2c_davinci_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
>   
>   static u32 i2c_davinci_func(struct i2c_adapter *adap)
>   {
> -	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL |
> +		I2C_FUNC_PROTOCOL_MANGLING;
>   }
>   
>   static void terminate_read(struct davinci_i2c_dev *dev)
> 
> ---
> base-commit: 1e26c5e28ca5821a824e90dd359556f5e9e7b89f
> change-id: 20250326-i2c-5561bf853f8d
> 
> Best regards,


