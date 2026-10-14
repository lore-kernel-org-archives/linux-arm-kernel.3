Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84951C3DA7A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 19:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=voN+/DnSvNdqF9FDu+3qMGQaGXIMjzAKCkLlGWfn+W8=; b=wFDaKKOKVVhjIxWaWtcH1aUVdT
	9xKuec5ohzeReRALaWyisKKTyaLYHaFSWGsRzgq2N/Pyn44Z64VjvgW7IgktvGM5x8HiSIQG62Kyj
	4FrwS7MBPX4D2Cth3o23BV+BJZqAanf4JCkXB7EF1bNTbBMpHq+lbSaOhXamIaGOaAFROjobAMwq4
	zAAJxFN7GVXnDM6EBCeNyMfCTirgsOXet/crvRWxuMBp8+A3scTQkYhU7XZU2UAepCMZafZ87fx5E
	frskU/WPqCsIkHoYGK3Gj3qWw0Ak/5hkzoz7H24uTkYDshapQ/RxRoVZI0fGmy5ce5Nopdh0p7nhQ
	xpTGeGLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH4De-0000000GBXp-2Slt;
	Wed, 14 Oct 2026 19:00:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH4Db-0000000GBXK-3U4i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 19:00:53 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEbJR53642816
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 19:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	voN+/DnSvNdqF9FDu+3qMGQaGXIMjzAKCkLlGWfn+W8=; b=QWkjTE5apijBfBE6
	nq2/otO/V/2ZLXOJPZ4IhjF77TvAVYeXfGJUTZijKqX1/2YBFj1G2Mwaeg4hRXaH
	oyrwWf8p3v6pXFMhsvyj77wSgTE2O8VB+tyvWIC3ekuA3HUMbUlu7/u3P6hKd+3F
	p7PXrJZc+LrUrH7gKmsP9L+8ZKTVmzSpwGBDBWZvY72qPo5b+6gcN/zQNCvVTLjc
	jaCu7CDfvNPy6WBQpi6MoeLZmnERpP+02zz7TmorU5QZsket1NbHfmbPEQ3/wPB3
	P4R1MgZVWBVuOsBEGzPLwEqvuQIVEVUBHlkO7IrlQoAbU+tLINl9aMQeiGAQ8E/9
	hBRu1w==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha470b37u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 19:00:50 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1665200f4c2so6202949c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 12:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792004450; x=1792609250; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=voN+/DnSvNdqF9FDu+3qMGQaGXIMjzAKCkLlGWfn+W8=;
        b=FiZzA0DTG7fiq/Sp7v7Vu5U+M8auvCzc2c5YHzHc7y972iPNtYcxFw/yoeA9cRLpso
         RJWtSBjZsTjw+Dl5iRkxzeydcND/Gx9SYfiGgpIydFq7rNz9LLUsPSLGMkDsN7pQU1J3
         NeM7h62NjxnnIq3bLhzCx5p8Cd69DQxqpAgFPXj1W6DnL8tkYM5fngseK/sQYkNf10hG
         IimR0Vq5QhRL28P+VH/qypKnnV3Q5zKY8ca+4XufLKlFJauAF00ioFUQhQZEXjNLDEeL
         1Gb4cwwRq2oRGl3dCw2ga+wE1m4t9X7mgKftPRN0ywjp1fPoycR+eCJ15tV9bchXxoda
         Bu2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792004450; x=1792609250;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=voN+/DnSvNdqF9FDu+3qMGQaGXIMjzAKCkLlGWfn+W8=;
        b=JX3lPH6ywRGn+jp5R+AovpTTPRHzaxL3sGpO/jEnqqnpA5ggCMGWTzZvqWRay6ImKf
         QU5IF0i92cKRySC6LmY+6w6x6V3gYjHzDA/1ouO2Cgtc72Dw6AVAjRkzYaJ5mbbNj9vy
         +mYw2+GPmO28kQ2tZka3Cfg05n8TI6z03vRCl7X2RQnJHmnhMcYrih1ekard+XTJBB21
         C/u2j9ywta2QrWksvfwfkEMgVOeMfSRgcAIig3vkJtDK99j6j6cYxbM0QYW6Zdk0TOc+
         mBhq2cpQ6MXNNj9gedlkRETeBbwL7xBJgIDzx3x2LCC24vJY2/b2uXfnuHDQin9u7HL5
         k8LA==
X-Forwarded-Encrypted: i=1; AKwUvBwYOBCrFpq2XxmYBFyrtwfWq+0LCceTgOv7L4Uy9dg0f7mepfa0U/xoSRToa7XTjJUcGxPEZpLcrfNqwnAt5l6G@lists.infradead.org
X-Gm-Message-State: AFq9FYLVr/Hcmtm9cO4Xx+C6xyBytzGDilRXQlZu96knS3uByGbKlNw5
	5OBMENNBHSwjbkdldnKvu0YJqt9r+Vp6/1tZkS56OfPNGIRRpnP+OIKGROVGNtFNE7sOZqAynBV
	gB62XESPYOKhCd/2pa3T1gw+gJczj4+CJ//3YB+c/59Z5zwPh8i6wsmxwOGO0vZRi9FpBnsykmJ
	zZkA==
X-Gm-Gg: AYBFou1g053J6WJ8q7A1sNXXyxHvSbl4ZUbW5A7UBCH30AE5RpzMc4JQb3N+WQtxefL
	ZAIZrxFuT/sSim1ceCfslH5hH7axdtgVHdn/+74szptpNQxw6VvQ/ZmZHVEJudsRMe4jIYeDTZt
	+KfBimoE6CwlF+fCrAPesq/Maqjt9FEJeTpd2DprdRipYBFlLEgoMDijGjThWMBPzmiGP4JGEy2
	zR/JoREBTZ6rnsHXvEWg9xWCb5kWDo88EvidE4dU0fxWImVVZdxUuo2bZdvHP4BDmShSyG0o2te
	O0TQsMeSERsCr/wRALhin9+P49t7qBHi0HQ3cgXCb22DNjo6Q6i9XgOVo+FUsZVrE/vLh2Zlt4H
	8VLjBPFy/9i8pqqVN20Xma43UyG8epr/8nidUcATZtlLnSzE6EsdJg6+ShLf/OK4=
X-Received: by 2002:a05:7023:a47:10b0:14c:1f57:3e86 with SMTP id a92af1059eb24-16a5f5ddf6bmr21715194c88.47.1792004449146;
        Wed, 14 Oct 2026 12:00:49 -0700 (PDT)
X-Received: by 2002:a05:7023:a47:10b0:14c:1f57:3e86 with SMTP id a92af1059eb24-16a5f5ddf6bmr21715140c88.47.1792004448426;
        Wed, 14 Oct 2026 12:00:48 -0700 (PDT)
Received: from [10.71.40.138] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a31f6f5csm47683131c88.11.2026.10.14.12.00.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 12:00:47 -0700 (PDT)
Message-ID: <ff4fac87-380d-410d-942a-a48edce70397@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 12:00:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3] net: stmmac: dwxgmac2: enable L2 split header
 support
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Hongmei Xu <hongmei.xu@oss.qualcomm.com>,
        Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>,
        Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>
References: <20261013192759.776537-1-sagar.cheluvegowda@oss.qualcomm.com>
 <as9XUbOfJazEQ4y5@lore-desk>
Content-Language: en-US
From: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
In-Reply-To: <as9XUbOfJazEQ4y5@lore-desk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA3NSBTYWx0ZWRfX7RAA6o9RaGmS
 sSTUy0nPxvS+g494RSYXJM7NCv5ZSGt6zmfj1xEWlRNIWoWKgHjZP8fl0Fjg029kcRuVz1U5aOE
 3eTb1RBa8ISIUqGTn6L0daTnHYPqq/tplbUvaIcdQfdpf0tI7GSngKKUNV7jkemBWQmENgWjVFV
 9XMllVO++Jl771bFiaMOHzw/4cb03OLTo1tZoJTqAmQwYAZO9oaqCMNQmqj9pVLMBL/ThgGOCmA
 OSL0wcKIgYgTRftmBbA7DPuJ3iPRuRog54CW3+dFp7sjVoI3/XYwXn3SCZE10c3HlHXqWH6XEfg
 EYVxlQ8VX8XmgDHANXzwRfSCXtMoT01mxYHt8BIcR8FsD8xPCk1bzSKYLrYuP1JdDdpfa4oIqJV
 4P57kn2cf2ZGcc1qhSwhlW3YwKtNT6G/jtySTqnYszxJIel1Vef3rSqpzaTgRxr+YlKejVGWPW9
 zQ8q45I5/D8MqUt6gcQ==
X-Proofpoint-GUID: q5gkxpQWTOxQ10nNdRSUDevJFb0c1r97
X-Authority-Analysis: v=2.4 cv=P6avFSAu c=1 sm=1 tr=0 ts=6acfd162 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=uAmjrx48wFnj9rB13rsA:9 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: q5gkxpQWTOxQ10nNdRSUDevJFb0c1r97
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA3NSBTYWx0ZWRfX2NvAUEV1HSt/
 DdlVwqxRQAeQET7kxFI1Tpu0MZ7InXB/Nw1WhqtDNBvEuM8TZNIvhjjyfuL2NXpH1R7XgawYKdr
 z4M1qwS59dQtubDPVG9Zw4mF5v2Ni08=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_120051_994864_10D8CAA5 
X-CRM114-Status: GOOD (  17.47  )
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


>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
>> index 6719ac6e395b..65ac5403ec58 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
>> @@ -292,8 +292,18 @@ static int dwxgmac2_get_rx_hash(struct dma_desc *p, u32 *hash,
>>  
>>  static void dwxgmac2_get_rx_header_len(struct dma_desc *p, unsigned int *len)
>>  {
>> -	if (le32_to_cpu(p->des3) & XGMAC_RDES3_L34T)
>> +	u32 rdes3 = le32_to_cpu(p->des3);
>> +
>> +	/* when FD=1 and LD=0, HL is RDES2[9:0] */
>> +	if (!(rdes3 & XGMAC_RDES3_LD)) {
>> +		*len = le32_to_cpu(p->des2) & XGMAC_RDES2_HL;
>> +		return;
>> +	}
>> +
>> +	if (rdes3 & XGMAC_RDES3_L34T)
> should we check FD=1 here? Since HL is not defined for the case {FD=0,LD=1},
> right?
>
>>  		*len = le32_to_cpu(p->des2) & XGMAC_RDES2_HL;
>> +	else if (rdes3 & XGMAC_RDES3_L2T)
>> +		*len = (le32_to_cpu(p->des2) & XGMAC_RDES2_NONIPHL) >> 2;
> same here.
>
> Regards,
> Lorenzo
>
Hi Lorenzo,

Thanks for the review. dwxgmac2_get_rx_header_len() is only called from stmmac_rx_buf1_len(),
after the sph_active && len early return, so with split header enabled it only runs on the
first descriptor (FD=1). I don't think an extra FD check is needed, but I can add one if you'd prefer.

Regards,
Sagar


