Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFE4C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 14:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5lg2SSIflWKzsNjHH0yMEoyVMVATrSnMyc3UcY37Ync=; b=yErgMnhKNMVeAk9j+UZa9VRCV3
	owGeJiLtCTa2AsmZdXnJtciVyXrtJERbavYj9VgEPGmKEptaiPrwe21Sn3erppTNyTm3Kp6SlkCQC
	ZEW+2M0iRoFOAZJ2dYGmQpWw+FFrrzI6TQMzUgJRsFpdwBhkA++g5XddePGiTXAIC+3PUjCf/3RLd
	2tW0sZacmiH8jIBYQhp4/EYzXq3g0D+N+Q7y7dFuRRLAsuH3tJEf2KtTDuf0SFVz9W3zOVebLehM3
	GAgT7zo7tRRFuUaEXQs85xS9YZrAOgwqkN4c07mF6+uAV5ky1P66LyZxLWlEZZr9HVdtYOANTP8M9
	kHsRDo+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzyxe-00000006NjI-3Brd;
	Wed, 02 Apr 2025 14:20:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzyvt-00000006NQ2-0tHc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 14:19:11 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532D2p7v023738
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Apr 2025 14:19:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5lg2SSIflWKzsNjHH0yMEoyV
	MVATrSnMyc3UcY37Ync=; b=XzKwPnSkuXaN5BjDpe29/7huBfGAIzL5jrqN9ObG
	JcWeZk9TIDjV292XawvH0RYQ4w1vIxpg0YWqOem2bdtQdwFpvxeZiU3fgvMU061I
	p3zlMFVgwVhhMnluu2Yq4UgcFHqYBWWp10mZcJtAf27niaS1RpV9wvCfwsK6szVH
	K9HIst9aDXcJGWPo76GkLtcN1G9nEes6HWGlEs1zjEpa4U2gR3F+fWr7BhKqpW33
	PP0EQBvdUQs5MnUREI12S78fodeBZZaQeZnE4Nd+dZsr8BZNPicIAYbXjSJdiTgL
	7FI3uJZNLI6xRzn03bExIrFF4c9EUA+rz7PhwNa0DNsYwQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rxapsjwk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 14:19:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5b9333642so765118885a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 07:19:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743603547; x=1744208347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5lg2SSIflWKzsNjHH0yMEoyVMVATrSnMyc3UcY37Ync=;
        b=hc6/nVGivhnOZMWB9/kDRKoqbbw8pFIWlMtehQ9HP0ckNEzxxYlHWFsZHcCQvwtrC5
         94+f2YP+ZmIuz80Gw2xk/Tef3ZFkW2xevHPKDUCuSfWbS2raBjieueHWmDr86U9IcAYJ
         jRb/27HMbd5x7pJMC9cNTkncN441i6/vKrAu65PLFoJKJ5S3I4pX6To6QD3QL7qJh5X0
         cvuOgBdgOsfAqZyNyO9+gFubGmYu4srzEYSQ87mFMLCkIjCKgKEg4ReabFbtlCYj1mPS
         fbBOk2JTjVoKEEwuTdasaIxJJkSNUlIBMC3bL9oHXHEhxChZ0li+u0OU/lENA5SEOOqZ
         JhIA==
X-Forwarded-Encrypted: i=1; AJvYcCVkWPlwmTbVY8s+tE473ZT14SWWQXYaaVEiSe5GYzooGZsP/2bzHf5PuEc94l01wzlFUi8c678dzZ05Vsdx5vs6@lists.infradead.org
X-Gm-Message-State: AOJu0Yyv3TPEwBvWSU2+YjcTcl5SZvdZm0zZKVYlvRpxujpQ/S9nXuqb
	lYvErzgwrOdySejsn5lsI5Pix40OqqW9HM6xjNdxY25eaUZwe1NuZZjeItDe87eQPsqu2OO/XW8
	QeIrVqFL/Ea8jBnp4fik6eGXbB+B6a8GwFfGJKnh4PmnHqtY+Rdh5YOHrWxcaxgMp1Ix5AXkdZQ
	==
X-Gm-Gg: ASbGnctJReHM1t3Rq+0L49DgP0AE/JaNK6qF+z0lGplWIiWfJJwh3wkR5jCOEoLslwH
	k3C6KskRJTrmz9oBuVAwBVMoAd+euqQrTHusoEE4X/fkBafHs/tylgPEcPPidnOCCOvnOJ6er0V
	ZmFom4xYzimnTGX6FKqYdlXlHl74k/GhMOAhjBBGtxn/IxYVLINtGtDvlHGvtEqr9vyLuS+RVCY
	Gjx+ekSgvH7eGfSb415sH7+ok/sdXE4LYNJUXADgd/u+CsUPIIKkYySLOhUnSGcv/Pq/OmxeLdq
	KPhevDJurfUAygKpR+e22Y6bi2LDCuItYkRQe+7UfCE7m7sGpCvnUocm9jiAe04hqqjohHM+PVG
	qZn4=
X-Received: by 2002:a05:620a:2494:b0:7c5:a435:8c98 with SMTP id af79cd13be357-7c67d22bee3mr2076317985a.0.1743603546809;
        Wed, 02 Apr 2025 07:19:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGf8XoxRo6CiED/IRIBY/zHf/t+XSXGEYpSCXW0hOzZD/FhK/1SyGdm2DXSeef2sMqiG/5kQ==
X-Received: by 2002:a05:620a:2494:b0:7c5:a435:8c98 with SMTP id af79cd13be357-7c67d22bee3mr2076314785a.0.1743603546418;
        Wed, 02 Apr 2025 07:19:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b0e951a1fsm1428704e87.245.2025.04.02.07.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 07:19:05 -0700 (PDT)
Date: Wed, 2 Apr 2025 17:19:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: shao.mingyin@zte.com.cn
Cc: vkoul@kernel.org, robert.marko@sartura.hr, kishon@kernel.org,
        wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org,
        zhang.enpei@zte.com.cn, linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, luka.perkov@sartura.hr,
        linux-arm-msm@vger.kernel.org, heiko@sntech.de,
        linux-rockchip@lists.infradead.org, yang.yang29@zte.com.cn,
        xu.xin16@zte.com.cn, ye.xingchen@zte.com.cn
Subject: Re: [PATCH linux-next 3/5] phy: qualcomm: =?utf-8?Q?phy-qcom-ipq4?=
 =?utf-8?B?MDE5LXVzYjogVXNlwqBkZXZfZXJyX3Byb2JlKCk=?=
Message-ID: <2s6gmwdlv5i6uqqrkxve6wiug7g3u54aqpycjftwbpars5poz4@nkb62c4yc522>
References: <20250402194100610qY6KQ4JPISk-4v214Qs36@zte.com.cn>
 <20250402194357404aoSxd3G74tojxA7uCZXiy@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402194357404aoSxd3G74tojxA7uCZXiy@zte.com.cn>
X-Authority-Analysis: v=2.4 cv=Vbj3PEp9 c=1 sm=1 tr=0 ts=67ed475c cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=5KLPUuaC_9wA:10 a=1RTuLK3dAAAA:8 a=EUspDBNiAAAA:8 a=qROKWDKVmaoWvDy_uEsA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=kRpfLKi8w9umh8uBmg1i:22
X-Proofpoint-ORIG-GUID: dzG5IsauOuArJAEaagihCCbCGg22HsPD
X-Proofpoint-GUID: dzG5IsauOuArJAEaagihCCbCGg22HsPD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_06,2025-04-02_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 mlxlogscore=793
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_071909_264991_D000AAC9 
X-CRM114-Status: GOOD (  15.43  )
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

On Wed, Apr 02, 2025 at 07:43:57PM +0800, shao.mingyin@zte.com.cn wrote:
> From: Zhang Enpei <zhang.enpei@zte.com.cn>
> 
> Replace the open-code with dev_err_probe() to simplify the code.
> 
> Signed-off-by: Zhang Enpei <zhang.enpei@zte.com.cn>
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> ---
>  drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

