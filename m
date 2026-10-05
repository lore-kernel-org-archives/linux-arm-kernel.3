Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F6ECA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 06:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n0T0IOWboKdZzgixZTEBycGeF7SAtlri90r5Da2YU1E=; b=X5tUWCgjpUc7o3Gy27EnKrHtcL
	AMzJTqnEcLV9V5d/L9x2W0F39J4noMXCS6pfX22w/eOqFMe1oWNmLA7dP13nUbiDNPn3ohdQlbMom
	YUIWvQgFntGZli7rGY6XcHt22j8Xo0KvvS+rB2FmHWXEOEdyPrChf/5HLVkj4FG8g+wUxalz7Omr0
	WMfE6cQOjyV+nfrj6hN71cAl627xH1ZphKSqfsKcEcDA3Nprnr6snT0dL9jkV6/L20y1ZU9Jnc1Fq
	PM2BqBCrn4KAi1iY4FAoWBXpKt2Rkc9tCYmzVrXPnkIqUqLRXA5Z7Mwk/1Kk2DO5sW5p6taYSWeuH
	mUDR7/XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDcHI-0000000FjKd-3sTB;
	Mon, 05 Oct 2026 06:34:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDcHH-0000000FjJw-10OU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 06:34:24 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695103hO3688113
	for <linux-arm-kernel@lists.infradead.org>; Mon, 5 Oct 2026 06:34:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n0T0IOWboKdZzgixZTEBycGe
	F7SAtlri90r5Da2YU1E=; b=BPwlFgnFC/fFgks+dPqwYJ6/Z18qCk0hOVn6FenQ
	OwabMH+ND1jxkfi4ryL1eHaGQg8Y2RB9uqmXtrkUW0BqVEe5hSp3MIo1anEAxMfG
	TX1yLBR6wi7Q6VCJgUOKQGZpIs5bJiYp6XLcUbVkZybhJCrc7lxi649nvUjjye2c
	lG3vriQHSnsnbs6IxJm5RQtgygMdtOabx1Ra4oZHmaJlxHCwwgYfiWEphA2p6UQO
	RMaazbwkIOeXM7AZxVdliK394YpaKgrt+IlU4yHd/anNqV1sZnsdur0l+1qRww1V
	/askKGtpyyezdftFCjigoUB7d/BLosUVXopwIkjOXGDjKA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3chfjmnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 06:34:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a3f673221so316529985a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 23:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791182061; x=1791786861; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n0T0IOWboKdZzgixZTEBycGeF7SAtlri90r5Da2YU1E=;
        b=jyLj/H+82pmVRfzapKUzYJ9oDk+J66B3MuT4YirX15z33EzsPB8UP8P43Bdlb2AFWn
         UgDt9Pz0ZLRIqH+aSbEscT92CeKIXszmArZ9PyX9D3J/g2wG8VY5jYUFzkyCRCw1KVyS
         PmVbNYnoSCDRV6rj6lXA4MjzwkOCBgLiFzW56rgswkpkFWKanu9CEMvz0eIir9OMA/1z
         whu5Bzi7mzm0uzsBNwdoaJ2bo68HQ1g0RNPtWB98iqeUGzgAXZ7RlQK/hkR4/4dQguUk
         FvlDO2e/wCHx36L/QISm37uQpfN4dZzSrkEGqwv5SwRylT+5HJu4rjDvlk3+eSOx4MvS
         8GtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791182061; x=1791786861;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n0T0IOWboKdZzgixZTEBycGeF7SAtlri90r5Da2YU1E=;
        b=UUJnyke9VlUYDdn7QA+8gqyc35w3qLRVkBXT0Kpb3G1nAvNuZg7Uw9d2yVf60FVsuH
         bc/h059O6emE2uaaViwDWgAbexmRlD1X/preefAtdJwDZEEyP5ti2AdJemTUU5dUDekC
         dDQ26+LRRa9gNtzSabeN/rM0RGg79JRj6GyvIgrKhRuFs9wHE6GR3SCB/Xo4cKtwYxcX
         +Ed56ZyYcHZidnwfR+af53wtBQ1CzKsrLP8AGJ/lbBKPll+OV2+0VXbdBJHuva2yrkxE
         wwQmsxGa5cWPmx+/RPy6H2RGj3lmoI1iWee0saII2ZSCPM0sl5QG1BtbbIE9I1Ffm2Tk
         U84g==
X-Forwarded-Encrypted: i=1; AKwUvBzkzaFOd/iWdrUMU0Vcrv4OnCDFTqOc2PPaDABQF4+g0Xp0/mVemylnOXoVg/bZu6XDoZN9OeXEFxtEfzjdgGjq@lists.infradead.org
X-Gm-Message-State: AFuF++mGjsZns/HTC77He6+jjE6n7+KGSbGKPXLiooGs6bB3FspT/usV
	fHDhpMKHNAFbgk8b/6jc8t77EgJ1JFctQNi3Nlq/lfrfK0if91l04NkTHNbVdCl1Icb0RBUbc3u
	7Z7DKfNPmzMHtrSRKzLiWKjeVhEiW/W2OYnQSRVUUo2pCLrYMluX2RSuXSm/vZz3seBHgDxMxlP
	7vlw==
X-Gm-Gg: AYBFou33GM6gk8tcBNNiYPBXkCG+Ehx2YjlYDGOaYb/hm/bHOb26JAIKfkXYTnvFOfK
	HzNtdXqR4DHNmQCtdWMzODM9q7QpKcSSpGbOQ/oRfrpgtbiN/6ul2UB4iT87b8U2Qr2WK07Znqs
	mXS67lka/qdppWe4Qxo11h0OZQwKyNYUuF0ZGZQEWYe8HznZ8dXDl7YB2s69RZ37zP7K6yC2Gd8
	IvjjP/GUK6woGzRXrEUZNu8T2oCpcFasmgw9X+lDMPArgyG+fhc5a66ij1vVhyqgr6sNH57IF8O
	6+JstZ0g5bBbT14z+XSDoECr6IfBLX8lnzP9oa2c9JAE5oHbHfzrCrv314xlJuGrVyINbds+MtK
	BAa2aPNIE29k8ofXE7HDEnrJkVGX/f+nu9LcM8un3RnZYh9l6OgKO4M6fslaSJ1OFtnLY8tUbYe
	AAvNbaLorooisd
X-Received: by 2002:a05:620a:4152:b0:93c:5951:38e9 with SMTP id af79cd13be357-93cf17937demr1638678385a.52.1791182060409;
        Sun, 04 Oct 2026 23:34:20 -0700 (PDT)
X-Received: by 2002:a05:620a:4152:b0:93c:5951:38e9 with SMTP id af79cd13be357-93cf17937demr1638674985a.52.1791182059963;
        Sun, 04 Oct 2026 23:34:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c79da2bsm2924985e87.48.2026.10.04.23.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 23:34:18 -0700 (PDT)
Date: Mon, 5 Oct 2026 09:34:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: monaco-evk: Add Raspberry Pi
 7-inch DSI panel overlay
Message-ID: <w4vltai3lbzu3dq4w27jjotlu5nobc6vfnuxoo47g6mrkhr5ta@tmmd4ug4gzyv>
References: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
 <20260907-rpi_dts_overlay-v2-1-a4989322ce00@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-rpi_dts_overlay-v2-1-a4989322ce00@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: waMdDeQjeG7b1MHlCFkZdwfU0GwM2_Rh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyNSBTYWx0ZWRfX+lxVzaouq4V5
 D4h9uJkkgxR/AoCw0UTCT4HGY0gCgrFVITcAqEU1QeYrG/iV3qXvQEoxKE7pWbWxoeVn8PyYL0F
 dJTd2NleCbWCkCYP/mLLnUeBrRQ2oD4=
X-Authority-Analysis: v=2.4 cv=eZSo7LEH c=1 sm=1 tr=0 ts=6ac344ed cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=wyx5Qp5Zs_5CJwpGNdEA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: waMdDeQjeG7b1MHlCFkZdwfU0GwM2_Rh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyNSBTYWx0ZWRfX6mEFn0pBDHGq
 FrsSjObZBFy3QkydxqR0mQKaYlFWSui29wkHBSjWpFMN5qMi3k0JaMpLoJg5BeGQRHrGvT8E2cn
 GiIvCudg3HT0ZuGtCRw8QBzTXfAe02Kmy9yKpi5csvaSuGdR2FQ1DdvdPFWdFoWYaT5NIY41yZQ
 rQF1Qw8+vuZcrPsJLo/VfPN+a/yZbZfiXcaR04WtkCbO/YkNCwFsDfGadcA9oi7HD3bQTymIRdY
 Vqchr2lwqfKUQPPKSFfGyjYvJDdQzOnieoDV2r/WuPXF62umwZTp4ufztF2bjXyfjY0Bqwl1Xr7
 FaRdpg0ym89xptTQGbdw/lF7Yhsx5a5/JF8n83bKUR7RfHSJJiwhesH9ZGGPivgd2dbdl9m6vY3
 GoSqA6XHhdinF3GOThPaHfqCpDCpZ7bNi/zi4Kk6cb3YJMgz7fIld2XaLFS/i8LIyYxNFw4Mlub
 pr8VczTs9CRWTItr5zA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_233423_392456_D24EE1AD 
X-CRM114-Status: GOOD (  16.13  )
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

On Mon, Sep 07, 2026 at 12:03:53PM +0530, Shashank Maurya wrote:
> Add a DT overlay for the Raspberry Pi 7" DSI touchscreen panel on
> Monaco EVK, using mdss_dsi0 with 2 data lanes and the panel MCU on
> I2C8.
> 
> Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |  2 +
>  .../dts/qcom/monaco-evk-raspberrypi-dsi-7inch.dtso | 82 ++++++++++++++++++++++
>  2 files changed, 84 insertions(+)
> 
> +
> +	reg_backlight: reg_backlight@45 {

Can there be an underscrore in the DT node name? No. Is reg_backlight a
generic name? No.

Use regulator@45

> +		compatible = "raspberrypi,touchscreen-panel-regulator-v2";
> +		reg = <0x45>;
> +
> +		vcc-supply = <&reg_dsi_touch>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		#pwm-cells = <3>;
> +	};
> +};
> +

-- 
With best wishes
Dmitry

