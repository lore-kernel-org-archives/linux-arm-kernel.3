Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01651CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 23:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m/Ok5eZP2WT5DjxR3Pgcz9PvezqkWw2q1gsOHrEJ7Lw=; b=VVJlgNcqg9/QavY+bx6kO3qahF
	Z9m+/ZNFsNmC32/g/YM1baZTURA9wLnlCkqUdE/OWBKJBxcF1Z84+KNhly0BlgLkuclgWwset0zLY
	M0mE7thZ240wgD1LMd/oqZXnse1ouF2d5jLw1jmiKr+ysnFXydhZxF89Oty5Iuu+CAe+K58aWIm/g
	D9dRZ543xsaq3Cbq7ttdiXupfjTxY2E4T6A+wgu73XUZCYA4TgP0YJ49euI7nRdA9hKSSDelkriQ9
	h1Me6JoEmiG4wOdhRx6smqmGQaWJmrhlSuxbn5wSU5ZXRetFirIvLx0RmhjlNw0h3zQFoqRfdcgM8
	zfSpIkfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUulW-0000000FvWx-3DR4;
	Wed, 03 Jun 2026 23:12:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUulU-0000000FvWc-42d7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 23:12:50 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653EbdqE1476732
	for <linux-arm-kernel@lists.infradead.org>; Wed, 3 Jun 2026 23:12:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=m/Ok5eZP2WT5DjxR3Pgcz9Pv
	ezqkWw2q1gsOHrEJ7Lw=; b=AKO0kRCc4FDL0Exl+w9EmkRmbCgOCv8JV7dF5sf4
	Xzk6TaJzPOo2cmh6tnW6DzwFGBFmYwhKOZ1i2RbCBHE3PmpCueZa2uBNjAdt1M/M
	uUsP17oebLptspUQmUra8ebiwLAr3hLP0ixLkCk8WQD7c0t9DZ5Q66KduzYXG04/
	zSLCshI8fbZVbNFTjuXbBN32KGDnDMGk5D6NZkwJ+tE+pkasYogjvtHeRNQmzJMv
	SXJi0xul8oDXT5Lvdu2Sm3mmo3oWZXWoSZW1XkYefTtY4OFWNMoj109gmU9SHehb
	uhdY+JZpifSrRvdm+leYkLjqNHWy8La89tMIaZLGmyRbZg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejp6nt2mx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 23:12:47 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-963d7670e38so125303241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 16:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780528366; x=1781133166; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m/Ok5eZP2WT5DjxR3Pgcz9PvezqkWw2q1gsOHrEJ7Lw=;
        b=G7vwcjvWSikVUJyQQSMXeoTsqk6urURTAxpietfAjSgHReD90KjzIsv7f9neUEIItA
         nNin29R2yLwVuMKQNXbgnsv/Ibwp/4tlbt27AHjN59vz0pSodLoKVOq20JLFzGVf0HPl
         q/pMx3SX6Yl8QQGCSbh4GEwe0WYeAmueMpkTJfFDvTVhWJU7xgutiUEoeKqAjk0jkVO2
         FQDx0WQNwWp/Oiz9Og8QlvHTd0etqPg8o0Sp1j90oZGuIG9Uhn43h39bfT4q+QMPcdiw
         HnvR7PWWj/EaFpKbcdZ8FG68GrAcIkCxijVxODDF5SuNFhSHoUfOH/ybb6MIqywzUiBn
         iCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780528366; x=1781133166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m/Ok5eZP2WT5DjxR3Pgcz9PvezqkWw2q1gsOHrEJ7Lw=;
        b=W2rNr8WpcUr9TkvpCaKSeEYZuIHXtkU+ugtKRDN9Ajbu2nj6RAo00Jo77Mq2ZEMIy4
         M+3/8gvnVxFiwKrJijMAiv5P6LJLC1TiID1mqMJL4IWWPXg1pvgC/javxYMkGF2Kgkte
         YQJdaM+/PH30YOpBixSUzAZ0yz6v38JSsiIUmpVPCBjhre//jZT6DQHVtDOjYmx4lYcH
         yR9z/oGAncw6fPLpr4PSwl7tQTLjjgUuUTUVSJsYEfgQn/QDnIOha3ve2cuZDgrvqmA+
         DSui3Paa6AXMJqwKFXknrVobf/NUfKtf7n+cwxnLo6h2LPCmpsERBhvrt7/6ul4irf+S
         jlcg==
X-Forwarded-Encrypted: i=1; AFNElJ+oNgNDE7+peRFj5uwDB5VqRZMFEWFYJPTQ2xVNphvlP3rBTflSYNS9Dxu8UBDgIegzu/DMUGNE4LiGRJ1e0uV9@lists.infradead.org
X-Gm-Message-State: AOJu0YzoLxzNxdHiA3DgTQLWGXs0ZljxLae/pvkCfwC06iEo43JaxhxU
	GeX+Jj+sT6DOgVnAlgja1glKz5Lb8zXGjortLnO9mT5lidcPJeGl66tVs4vCWg0vVkQs3p8IckG
	H+gskT6GuGHQvlFyNvi8fa0NRJhTROYwyivWmPW571R+pws2ie5vRXqflknwGODMqBd5suP/CB/
	nnNQ==
X-Gm-Gg: Acq92OHZkgVI6TrBkGMmZ3VeJzjorpE5YYmZgMY2MgKW0zSDf2bE/pMeisWpUIRCbU2
	/VHyx4YToTK59xKRI9B1I5OIKTEt7LMTTED5Gs9poig1TFtlz4HpUCjEa7v9Ndm1FLWwcgHkkAQ
	jrgfMeIkbmKA73VKykS7aRmfklyU7jxmgkTlaDfJ0Kby2AqJVuII/gPBUP+X4xTp1QIFlZQJ3N8
	0sFFSgg+LP8FBDbkpiUMs0cxtBNSYHZihiTd+QsTZBmiL4q3l7MONtn1DBwzoxLGr4j4HYZy7Ty
	8lo4b6ShIbKGpH74tY72Fqd9bogFos1D017io7M5qDCaIgSvED4ddXNiGgOccu5LeVZkwlY5Wp8
	BSqm9bN5jF2Cb0D317siffSa/IYsZ6jHSjcx4xOJ4hLS9DgrhVofyWIhMffylii+y3I1gETsVgQ
	Lb3aGRU6vfV0yRyjDN8F+LYUbA0tYqDYEaDIa/yGV+xigbEw==
X-Received: by 2002:a67:fd88:0:b0:6c8:c356:16c9 with SMTP id ada2fe7eead31-6f552a06f87mr522655137.20.1780528366152;
        Wed, 03 Jun 2026 16:12:46 -0700 (PDT)
X-Received: by 2002:a67:fd88:0:b0:6c8:c356:16c9 with SMTP id ada2fe7eead31-6f552a06f87mr522622137.20.1780528365620;
        Wed, 03 Jun 2026 16:12:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b90421dsm870868e87.30.2026.06.03.16.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 16:12:44 -0700 (PDT)
Date: Thu, 4 Jun 2026 02:12:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/5] soc: qcom: ubwc: Add Shikra UBWC config
Message-ID: <2idag2lmgvmsqjixrjr4y32jfaa673h7jrei6pjjn7gm7ybppj@n5zycvdpmw24>
References: <20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com>
 <20260603-shikra-display-v1-4-aeac1b94faa7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-shikra-display-v1-4-aeac1b94faa7@oss.qualcomm.com>
X-Proofpoint-GUID: GYbsyFw-J7jMYUOMfYRF9iYyTIHs8i6H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDIyNiBTYWx0ZWRfX/23xyl84fAsm
 ZdHpjtzt3FIKjyxRDxL7tWgk2WcptNMN+jB3xrbXATG/fLDPtn6e7ii6oBgflYcldQHMz3ghBFP
 J2/NRyPRvFyRfbG9eSub9/rOMpgPWClHFT0nWVSbrfTqfWgmlx8lbQsp20vau4iTd+yF2WOiUaQ
 K+AjPepqCjUOO/Tgm+8VMdWsvok/iG3vR3hunybNGqrv/JeaLcaAGu3FWhynVHtwdGWUonjohNz
 EMtcfHWQstnlFCWHvFn9xsuk1XWsnpG+liPcL47aPxH7hA02LbJfpn8iYh4fi/zI8v/GxNQjkDf
 hHu7WLwvRqv6mHouUaYalDMGN5mkNm4CmiikTODuxt63j7uO+kbjB6lm8xoau3TRYl+Tn1mrlmo
 R8JIfysnmbQRemCU73xQc5FsJbTBKS9+gu8NgjkbO/cNX2wKfigU0f7pgcrUNGBkiBzMNY99nlf
 QWuFh0Wmkn4FHMzMhEA==
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a20b4ef cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Y4AeZ4K9FrMMlEv3RhwA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: GYbsyFw-J7jMYUOMfYRF9iYyTIHs8i6H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030226
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_161249_230519_842905E9 
X-CRM114-Status: GOOD (  19.28  )
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

On Wed, Jun 03, 2026 at 08:29:29PM +0530, Nabige Aala wrote:
> Add UBWC configuration for the Shikra platform. Shikra has no UBWC
> support and no highest_bank_bit setting, so use no_ubwc_data.
> 
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ubwc_config.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
> index 3fe47d8f0f63..01dca97e2671 100644
> --- a/drivers/soc/qcom/ubwc_config.c
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -278,6 +278,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
>  	{ .compatible = "qcom,sdm660", .data = &msm8937_data },
>  	{ .compatible = "qcom,sdm670", .data = &sdm670_data, },
>  	{ .compatible = "qcom,sdm845", .data = &sdm845_data, },
> +	{ .compatible = "qcom,shikra", .data = &no_ubwc_data, },

qcm2290_data

>  	{ .compatible = "qcom,sm4250", .data = &sm6115_data, },
>  	{ .compatible = "qcom,sm6115", .data = &sm6115_data, },
>  	{ .compatible = "qcom,sm6125", .data = &sm6125_data, },
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

