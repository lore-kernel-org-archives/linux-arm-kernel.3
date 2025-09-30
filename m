Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 541D9CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 20:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yRYR8mKHUZFaYtXuWtiKtjrky868kXbSvHpGdSOUABY=; b=Je5uXhrIMxpzocgbD376vkhdVI
	Xggpm5VzA3w/onxi+URYtobG4QvXtO26noNSxA8QtyYifvzOYa2OUfrMoWZ3wZNkqJ70V90Y8gqGr
	L2WM8884pBMnwxU95EZh1/IQT3GdQvqW7nLTwALhQzSsGiGYVnvvv3S8BHjhQ/KUhAYkteW8dfZtW
	1YbhRs4/WZx4huqkuEvUm3uiO2d++7hwHCpBqMBTqPvl+/3WqDmsO0JXpAf7AthsxCxbr09HnJ5ir
	GxgpcpudyTJXCHFbeXTzfJS/3tUhdOggfmDxWuCMWEyhuz9UeJobWzy+l9d7uc1KNb7fgJcNcJPDh
	PUiu7TbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3h59-00000006CAb-3HwO;
	Tue, 30 Sep 2025 20:36:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3h57-00000006C9Y-0WNt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 20:36:18 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UC6ipW000365
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 20:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yRYR8mKHUZFaYtXuWtiKtjrk
	y868kXbSvHpGdSOUABY=; b=aYaUOS+VDv+kxGuS0EJOBn3jZsRvgFGBxtozbsMR
	Ac9vrucmrZxwlJT/bwVES0C71Pifkfd7jEhfBwDX8PcD1l+BQYW94SrM/q2VQYFW
	DSfhw+ZrjsVgjnjN/gMX7X9pHlZBAnLC3pmHy6IGvzJ7/kW1NQ3nkMSWJJZNaB5Y
	fqwcbk6Vrrulg2sTCgxyVF1pVKVHnRxqEWiY6/V6mgv48P3LGjUP3xBoVnS0bCFE
	J/FQSPRuSa+6FvqfGXqEGpQVYAki1/LYqW1e3mKgBLGbDe3SGHhm9zt334YhoCu6
	nz5g1QtR41tllKQaQNXpN4HQjHYEMTJQgrL4TMs19jbcUA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fppr5vfr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 20:36:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e0e7caf22eso78931691cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 13:36:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759264575; x=1759869375;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yRYR8mKHUZFaYtXuWtiKtjrky868kXbSvHpGdSOUABY=;
        b=iknQkMWlZHEq7wQhZgPueJ84OlNTC11R1Ke6CnETCk114Z/jNM7Iwa1fYdBlqyB90R
         EWzHcpfPhuDai0gAnr+icgZrGH8WdRigH0F1d+H8dt5Mt+3yZFOVsOwgCxmIqq3JMQY+
         doxXpBlwxRfpyknyaSqFeOzDOQua6A6kIsnKzCmdpqJvJYLV9E/PQGNLDwx3Ef0qa4/o
         AsLHDw19tfJUaQ470KqdaY6rzgYN3rpBtUriZCNrQFeMr5rc9lLiglTSIGNGbc7krVfS
         KrX0U9/P6gflus1F748PSbT6wJNgZWXE3sN7F8O0sl0I216IBtuwbYMsd5+vySyzzD8v
         fbCg==
X-Forwarded-Encrypted: i=1; AJvYcCXwxuZQBa+MkL0x4T388/l5Z7Q2t4PFxRpaFcT5S//XgqBuAwF99cxgHle++8VnlNrCqPW1+o8/+evsJuaNN6/L@lists.infradead.org
X-Gm-Message-State: AOJu0YykGds45FJdSpiuXO12LtSUeEjlhepaQbZ7gXXEWp4e8BmDXr4j
	ai3Q2gU/f0Okt9khzm8gGESBBNw7Jc6E2RHEye494qDwRY8R9le/aWtJRoo0PJVVT1vEC8cXTo2
	qtKVpP69YYL/lbo9PuL9+/J22o6uTK8BUqcJ/s5NtUo0N0YZVgsak/0Qw//l1F0pid5XS9l2MKj
	1ROw==
X-Gm-Gg: ASbGncvW6YW8DyQaXesQbwZXoeKL/WesKW2jWnjBVqc5Qz0dkWoj4rMGHJHxTMyqP7z
	2UjCzwW5i4EW3wChJj9wG08tZrya77ieFuCEYY/6sl/PuTkW6bdTZU9K5mggW8U7SLdRUICI27k
	jLW+fUzqLNvxNUnmOrazQ/m2BBKbquHtkWTL58wy6cru8n8mr4mVg8G59EpT4FlBKyugN+6cWAM
	G9TTM9KDbVE9lKT8C37DbB4a0c6512BQ0dErdPgPAacxKciG5SpT66BIR3AuG7QDrInvJioEFeV
	4UCNDDcmAk32Pm/kjALY+EoxTh1kzc4mRuJs3b+cjgR/cn2FVrZqFkymjOOn2SG6hJS9OSoal9i
	PObSJ2etzWL6XxS0/0/n9HUFVK7baGAlE/bZin6IhdNgopbtwqYOXYguosA==
X-Received: by 2002:a05:622a:1f09:b0:4ce:dcd9:20e5 with SMTP id d75a77b69052e-4e41e2553a4mr14266711cf.61.1759264575276;
        Tue, 30 Sep 2025 13:36:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFuPPlCXIV5zyuzMgVAJcVfckSn/45lViJoli6ItFTToo3aAOYLqDps3QFpjsl6dnCqLcS/g==
X-Received: by 2002:a05:622a:1f09:b0:4ce:dcd9:20e5 with SMTP id d75a77b69052e-4e41e2553a4mr14266301cf.61.1759264574813;
        Tue, 30 Sep 2025 13:36:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb7710474sm34821171fa.33.2025.09.30.13.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 13:36:13 -0700 (PDT)
Date: Tue, 30 Sep 2025 23:36:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
        alim.akhtar@samsung.com, jingoohan1@gmail.com, p.zabel@pengutronix.de,
        hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
        dianders@chromium.org, m.szyprowski@samsung.com,
        luca.ceresoli@bootlin.com, jani.nikula@intel.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 18/18] drm/bridge: analogix_dp: Apply panel_bridge
 helper
Message-ID: <aeby4ds46ehzkrvc32pjcrxz2aalpc7icuis4y4zxfm5kvgcg4@ie7m7s6rcnqu>
References: <20250930094251.131314-1-damon.ding@rock-chips.com>
 <20250930094251.131314-5-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930094251.131314-5-damon.ding@rock-chips.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDA4MiBTYWx0ZWRfX9C3Zb5eP592p
 2Fd7weNSeWiT7jf2LP5Cq3hX3IVHoU0iXKo7G1nB/suUQCF6V5iPQTJ1PH1ihyuDSPWZm1W18zq
 SfPcwuRMplX1BrbmMUd7/50pRc61J5p00CbMErmxUtX6+UHXQcu82U+J2tncmA9QuT3QEC5Zxr2
 hGuRAQQ5a4/t+3KiOo71IxatxQW+Cw7xfcNqbPojOpDnJvrrSVcw/I7HUXU/RNrJ9vxKZdQw6B+
 BblpeXKH+Fzn4pPsNnl4m5ZNRdgJB743pYEyUWyt6z1L00gEK3w08S7njA0XxlBNgWf/ugIcBAh
 6lH5u4I3DiDdmWCzFz+i0f3N7eVxpXKPDuwtAqYE1+vbgEmEYhDhgMVRCILPp1q6zmk8hGFSH77
 6iARETcQCIy3rq9ImYBHck5FivrsJw==
X-Proofpoint-ORIG-GUID: _uLoBoEvdAL1PKufmxpVtzCLONVDR_tZ
X-Authority-Analysis: v=2.4 cv=GLoF0+NK c=1 sm=1 tr=0 ts=68dc3f40 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8
 a=rSdC-L6FqKhTve90478A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: _uLoBoEvdAL1PKufmxpVtzCLONVDR_tZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509290082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_133617_285125_7212FB8E 
X-CRM114-Status: GOOD (  16.78  )
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

On Tue, Sep 30, 2025 at 05:42:51PM +0800, Damon Ding wrote:
> In order to unify the handling of the panel and bridge, apply
> panel_bridge helpers for Analogix DP driver. With this patch, the
> bridge support will also become available.
> 
> The following changes have ben made:
> - Apply plane_bridge helper to wrap the panel as the bridge.
> - Remove the explicit panel APIs calls, which can be replaced with
>   the automic bridge APIs calls wrapped by the panel.
> - Remove the unnecessary analogix_dp_bridge_get_modes().
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

