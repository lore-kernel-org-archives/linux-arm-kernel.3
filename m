Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB217CD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 10:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JoRWGgOZZS3G91zVwdG4c9Lrn6Mvfm03iqOH0vlvM/U=; b=OPXlPzMhYwMMY4dRtGf44cAn8j
	z44/vdnPF7P8ZkfP0DDNvTk8LwSJlk2imZVi/84scVCvdF0N8014u79Pina34h0T0JNseW0hXzeQo
	J3VFiCOwn9U4i9EqJK6dkZOlw0s5pRGibBeRw95XN3D8ZkzqL/hYNPw3IIySRF48NZuBSz37ICYRH
	nzQ8xnBTChLrerRSNXYJ+ooXNZarYgwDa407y86qg8Ma+jnyEJXEvN8N/6nsn7XjNt+lF4kcXLNPG
	Ng79MEuiorEfAt12MsusA8+M309mnIq6ICCI779xOH2DeXha6N9Jx3mO1Jq+kQUIKFyrPJ3WUzkP5
	IJ5V0ujg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKvu1-00000003TdJ-0VXk;
	Thu, 07 May 2026 10:24:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKvtz-00000003TcV-12KR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 10:24:20 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647AKWck1669936
	for <linux-arm-kernel@lists.infradead.org>; Thu, 7 May 2026 10:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JoRWGgOZZS3G91zVwdG4c9Lr
	n6Mvfm03iqOH0vlvM/U=; b=TkUzYLVdDiDMQQqwZkOHH0vOVJwRA6Fw9vGkCznr
	P8/7iK/sHrwHY8tJTuFv67LAHfocEBWPmPzwLzOiq0RdZmXlt2DBqAGBnW1eo35L
	cHbnbTy0xVf6ITKvwk5QV0pR/K2lsaCdRkZhMJKdTzaLWiHJeXN4Tek1xCn4MUBt
	zk5zvD7ZX9wKua1nA/kGk08oZxomwuJDb5mMxHicFnb6RA9vjBCqY1MVMT8Zq7/b
	HzkyYbDDUlWhcWz1MCIpGGh7Q3kkM800DjV9rV/CD2ipSvNG+UgAjabH/5dGtAU4
	cKiWwlr1JRVNBZ+M+oxzMKTHXjP+B6QwlIoA4VWWCZwjWw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1p1e7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 10:24:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8d4c2906fdfso71010085a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 03:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778149458; x=1778754258; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JoRWGgOZZS3G91zVwdG4c9Lrn6Mvfm03iqOH0vlvM/U=;
        b=fw8scXAqpXNpCfEHCPK+Bi19Z1M7/++ymuZFXwzWEZzNn7Mu5faohLeiEjSSMifWTQ
         wafNtIit8gsZpELpKnWcQchlrlZe+B+U8gHN+l1+B4AhPnY3C6Y3MuTcH8xX9JNMIDyS
         EdjBjbyVVCC5BIBkHbAzP3piAk6s60H3orDouUb2djCOtc0VaI3TyDjr84n02HEddcxy
         hS3HcZBuZ9XuPFp5oVPrnsKiyTdeiROG3xIllEkGJL2tAW1oeD3RnjGWUMen+uOWjKcb
         W+caiEe3LxZ5RS+cQdq7rnN8C8nMzGA/3ElrCq6AZwgtNcQSxb02C5WZCawVSivD9ORP
         jp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778149458; x=1778754258;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JoRWGgOZZS3G91zVwdG4c9Lrn6Mvfm03iqOH0vlvM/U=;
        b=mZTCyZn4wK/hJqjsHfUcdrXLxV3a0Aox+m/hirCqQfVJPyzVvOlViT3Nz4kKsu5vBm
         S2RE/ns1x8Udsngwpk2RC8cKp5rFAJim51HvBpoix1oHrL+1+kE3PiJxPBpJrtav/Njw
         x8WdzgbAIng4sknkpH03nvWYbCsDQN6O+hbjSExHiH8IQU4gkoHxwL8zdpOqRhJ+30WB
         p10e3ctYb3i0mmlnJkgCon9LuX5hK0i5lfCPZnfjFTQDwJunACnLeYue3Kh18ErzuONF
         LDB2VM7DTHHEkcxgNt5oC1uw2zyOoOaL/DFcb5RLHAu0gmu1df2zSKJNv91DuPqTRMMU
         rscQ==
X-Forwarded-Encrypted: i=1; AFNElJ/RxfGTm1r/yPTxR28HJgReCB/y1Y3u61W3oHxZVODeR3prS0TxfoxcwLs7zSWtiDEf/2Rc6ShyrhU8a+r+AWf+@lists.infradead.org
X-Gm-Message-State: AOJu0Ywve2L/FrVmGYTgeS0Fh8B8h8JNrj4J1DkNNYGYh/imNctl2LP4
	lExUREWBmTrHZhSxHGHHCxEnrYgGR1IxOAZgPsMtmU3BDRA5IedhNfaW2yZeyq5FuxA8CEDVj4s
	xlVEObsbejMYLzkWyNvAj2zko1EWrDuAyKCLmSFqipAhXcJ3VbCTZ/W8r1pfMfb87NqI5W43KxO
	eKAg==
X-Gm-Gg: AeBDiesyDQkQHVHU6tWa2aKbPf2YkI4HX9HdBGjIR3rknlnaLwW8Ra9IWjiujq37IMx
	1hMnCu58Khi9ebr8PD1EkWA6ANr/YxLlEkF7ZnyReOvi9L28SK5jzhcVOydhV/bLL5tr6pjMG8d
	OQ6/RO61dPi8/EyIeOW4bgGYOEa37YTa84oanhWEuzB3Dp9NsEg8yGG1QFQR3jD0AjImEebUtaT
	4MwMy6kGjDqn1prYsai6jD7RSLhVGSjN81XhFhal89zxfQZ0UyEw7jBCWTp3FhuBKL/zZhhPl8A
	ggjHPxcjzYaN3QC1MxdICFgWhg+A8dKeR0cOBiU2gZdHmohKllP6DJDO2Jw6PM8b3YHq7jUUXzz
	9EbNrWJBnwJ9snzdTUvSq6LDZRsTATXqJnIivPZT8UYuhQ/OYk0g5oKANZwJoTDUBq6Yz/vyfca
	JnqQv8cxCsCA8KqMGJb024HcD7e6Yuq2P3sRCDX6++iJpQow==
X-Received: by 2002:a05:622a:4a8e:b0:50f:ade2:2da with SMTP id d75a77b69052e-51461fcdddamr103694141cf.44.1778149456925;
        Thu, 07 May 2026 03:24:16 -0700 (PDT)
X-Received: by 2002:a05:622a:4a8e:b0:50f:ade2:2da with SMTP id d75a77b69052e-51461fcdddamr103690731cf.44.1778149455632;
        Thu, 07 May 2026 03:24:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3939a58fa47sm37503021fa.37.2026.05.07.03.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 03:24:13 -0700 (PDT)
Date: Thu, 7 May 2026 13:24:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: x@2005.tr
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/rockchip: Open-code drm_simple_encoder_init()
Message-ID: <g7p4goe3fhnfxgp2tsopvvgbqmvvkktji25h4rsrbkavxac2es@ghc5v7xjw64e>
References: <20260506165346.19819-1-x@2005.tr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506165346.19819-1-x@2005.tr>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEwMyBTYWx0ZWRfX96A6qFx7IT14
 /HY9G0zETOniOpUfOzC3xwCUdifPhBSCPLzft5iDxzNzAn2E5An2dJoTfiRcefkcUVydcBlEBcA
 UZ5U9fI3B94IympEi4C4fI/4IhCDytJThYjRtFnVt4FkxAm88JsVqi6khJZ5FzmcotWU639YheC
 LQPvooamuTNSAMK6vr+f6miA4SgSfD6olATZedFs+ENBTlgXo5omcKBAQRZmU45HSm3BvrFTXA8
 naJyObuRy/UjGwX4lSYofDP3fx0B+EckqYGnSOqwkLexxrrk9ot4oKjK5cC2zlpX4wEvlllFAsV
 yVtChDB5blL/A9KMDPHeUsFzIuO/uTBA7EAPoQTdUVlAEc4mFHkUtsO/i1jwosNok3g6m+hI/ft
 a1l8IGwoDHcL7mb2UZ4GlASv2QqoAIukcZfVOZrTml/zjgArk0IxiYbeqDGJjdJc7SdVo1MDgza
 Wq1oCMIpgK9yFdizK6Q==
X-Proofpoint-GUID: ks5VZRx2EOF5Ea7vR4gA6QiNcGb462Ln
X-Proofpoint-ORIG-GUID: ks5VZRx2EOF5Ea7vR4gA6QiNcGb462Ln
X-Authority-Analysis: v=2.4 cv=K4IS2SWI c=1 sm=1 tr=0 ts=69fc6852 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=K37GZDC8KpGTtN--OQ8A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_032419_294488_17F9DC0F 
X-CRM114-Status: GOOD (  15.00  )
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

On Wed, May 06, 2026 at 07:53:45PM +0300, x@2005.tr wrote:
> From: Favilances Noir <favilances@proton.me>
> 
> drm_simple_encoder_init() wraps drm_encoder_init().
> 
> It uses drm_encoder_cleanup() as the encoder destroy callback.
> 
> Add driver-local drm_encoder_funcs and call drm_encoder_init() directly.
> 
> This is a TODO cleanup towards removing drm_simple_encoder_init().
> 
> No functional change intended.
> 
> Signed-off-by: Favilances Noir <favilances@proton.me>
> ---
>  drivers/gpu/drm/rockchip/rockchip_rgb.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

