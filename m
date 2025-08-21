Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179B6CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 15:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+oRchL+ZGiIm6AbmB6F+/gh0suQo1rfvXtM2Pmnn/tc=; b=3bYEWWLuhYzM5lP12cpqFrrgN0
	HVADGQvf4AZJ7udhpgfpeA8oz5B/JwE94XhYPTPXDa+lj5pCcDRHPNVFKiZevJzDL5J5M3hS2OXQX
	By2CYfwkYvArkNqs+j0fDlVMplihQnER3oynFotAfwvt7K2xZa/dQq5gme59cOCSFEz221GiYdng+
	udWmyaDtFXxbLbIpAFoq0GGRzKskHqMp0zIu8kdOoRRaZWbpH6/RCip1uHnePX0lB59s0uxqUn+/b
	xhiwU1XPW7s1PT3Tpgz8rVk8W+kHxXBtzGOOJQcOrQJjDMkXMUwUYcBsS2z9hbpqKtBYKIBntchEv
	tABlnHxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7FV-0000000HNKS-0hQV;
	Thu, 21 Aug 2025 15:30:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up3ap-0000000GmL9-0Vip
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 11:36:33 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9b8UT003636
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 11:36:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+oRchL+ZGiIm6AbmB6F+/gh0
	suQo1rfvXtM2Pmnn/tc=; b=pLgrUQ8UwRDGgkxhghdJLrIo1NxVJOOqX7qU90bN
	vI/JwszjzYwjPdZhF0MbqFeiQcpMQIwV6vQJWHUwjQ345GV7G45MfY/YOYMNGSoz
	3i7GEONr2sY0bl1NSvUNGPk75Qc/P73kUIYdg6yLV63xQ1+DA58rJw1LQ2ZZNCKq
	CBztzVy/m3Dnmm43zUPCaUXTqIVKUiIVreSxGSi1Hxzvhh8ebZg6GRvWrVTDIUQm
	II4t1izcldKcSzC58UHVIC2ohrqew12NSlz7ndjT+vurdehSx7NX0kOF6cFBJook
	6sK8efsNDNbzDUVOtzhn6Pnl9UiMp7QiYidL4c+CJ8oPew==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngtdk3fx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 11:36:30 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70a928dc378so20883716d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 04:36:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755776189; x=1756380989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+oRchL+ZGiIm6AbmB6F+/gh0suQo1rfvXtM2Pmnn/tc=;
        b=MrHi8ggP3f9yO9waXqspVyapUo2drQMnQO5XvJgNp4RcL0zGpKe8eTOe1/OkU7PTxn
         a2yoAT8JwDEDgtN+ovyIfLYMQ5wy9l19+MN715citXUqK4rxYkSVNpy0ltzr8jbL3Gjk
         3nqzx23eSyKpTDGO51YmwR6USgYF/j4a3lE7fHuJVtiRtFQ/pnI02QsK9vGbgk2wIP+V
         aPr48T2YfX731oDKjoLCPZ3pT5db0VD/M2ucTthVQd14cgPw5jR6XbSwsziChSq6pOrf
         rJgmQVAvWW6TC6axXT39FmgY+1qNR8tPNMU1pdhMcn+K8QFmB8cpo3mgh1o/RoFLnKuK
         FCgw==
X-Forwarded-Encrypted: i=1; AJvYcCV8By2mHJqzd6xI3Q9DQzkyPnliZJcKWlcbCUVHPRnxcvMBJpT8dkQV8YlNTDpnAckTv21mlorldKG8fsz2W/ho@lists.infradead.org
X-Gm-Message-State: AOJu0YzMIbfhYQUX2E7BCnXFyk9/Nv4A4NRBpqRQuWiGVT8szKx+RSho
	zY15snamNBhoTXjlx2VBQWtvqFcbDc76V0+gNJlZcnp4CUj5631JiD6p7WHa566OHKoSuW3BFjx
	Oyxxpa/2VUheX6bylj+sTaTOFEGWgf9OnlQZ+WqrAWNMeZ4B0oe4qnPuwjgBLl5Kor/hSx4URjO
	KCoQ==
X-Gm-Gg: ASbGncsEJ1MaU0SpnNyxJNvgJ1ClrMrYLR+/QUrZ5hibiLQ0UcrxkIfUDkvn1LVq+EG
	n0MJI8g37lAg+1MUz4f7XY77Bbd5RcTNp8VhGcTu7bR5mB/FOvAxfC7wgn72LrSHqriMN+qAY/s
	ELAmiBPtVkkkZf016/Z0mTWGK/eyoZO5a/p7akGe6vx8izciEhGCCvyYahgnLd4nc5bPuT0ARv3
	JezaBZMraj6h551gTrB7TlKB96fflCrN9s5NbwVQTswUZvoHHZU7UVMsAsp0OHZG5OvBqjE1e76
	3V9n4gQDkP008Olic4x9Rd0aQxAr9Tnz4jGFSeSijr4LQGedAzex1MIQlZbgqwURiA/60GEzEjb
	DGMzIMbKpF0cYptMdzFDIrOzbPV1hiqU6e94hKueTExvVAstcn1Y3
X-Received: by 2002:a05:6214:d08:b0:709:d518:74fe with SMTP id 6a1803df08f44-70d88f6c1b8mr21455506d6.38.1755776189149;
        Thu, 21 Aug 2025 04:36:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFc4pz99CtfcFnUf3vsu43oB3VrYZHY0a8u+w/WlSr/OGxDRM13tso2usgrGww5C5aEQRhY4g==
X-Received: by 2002:a05:6214:d08:b0:709:d518:74fe with SMTP id 6a1803df08f44-70d88f6c1b8mr21455026d6.38.1755776188614;
        Thu, 21 Aug 2025 04:36:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3f361asm2967476e87.116.2025.08.21.04.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 04:36:27 -0700 (PDT)
Date: Thu, 21 Aug 2025 14:36:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, mripard@kernel.org, naoki@radxa.com,
        stephen@radxa.com, cristian.ciocaltea@collabora.com,
        neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
        yubing.zhang@rock-chips.com, krzk+dt@kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, robh@kernel.org,
        sebastian.reichel@collabora.com, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v6 06/10] drm/birdge: simple-bridge: Add support for
 radxa ra620
Message-ID: <4qs65cbi2u777ykgial37gsyzosj5znduxwvcuwbxi3kxzy5dd@k7tcgcyepjoz>
References: <20250728082846.3811429-1-andyshrk@163.com>
 <20250728082846.3811429-7-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728082846.3811429-7-andyshrk@163.com>
X-Authority-Analysis: v=2.4 cv=LexlKjfi c=1 sm=1 tr=0 ts=68a704be cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=HhVUBrKwW8KbpwAMqUoA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: WebhWHksdNGhZ8hqpSOVVqvyegqpXxVX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNSBTYWx0ZWRfXyzSb5BcK5+pP
 lRTqlZOnqWd/HCCUj9TNHnKvoleVtyn1jvzGpXV0mx45apkc+VA+wO7h/4VE9YMumG9GttI7spa
 2j40XdGPkOvjxjODFegRtaUsBEA8H1JptN+mBt9PObf3SDmAabVrsTzaOgnaFzVda2oYjMxhP4v
 q/Pj5nbyRlvf8CiUuOAIGEA5f0ZKh6w9Ov1w07Zeck6F7UTtj++Ui7hH12K09SF5F8f9u35DHLG
 yFgVnnDrMVU58vwkhdKgX5Ld4aJSSvlTZhnEyU6ygqIOOxtJ4LEZuxGS3vKfsKgU8XGS3xvxSzO
 DYMX0+L/RemZIG0R2bAxGoMaal/LgJymLCS9Q6Nqq2OqyVMTJDmn+JwmRefCcQ2LpecNzymRQMe
 nc3RDZH0dBrSVhEd8qE8VCJlTbRjkw==
X-Proofpoint-ORIG-GUID: WebhWHksdNGhZ8hqpSOVVqvyegqpXxVX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_043631_168929_B081AAAE 
X-CRM114-Status: GOOD (  15.99  )
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

On Mon, Jul 28, 2025 at 04:28:31PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The RA620 is an active DP to HDMI converter chip, basically
> no software is involved to drive it.
> 
> Add it to simple bridge to make it can be find by the drm bridge chain.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> ---
> 
> (no changes since v3)
> 

Nit: typo in the subject, should be 'bridge'

-- 
With best wishes
Dmitry

