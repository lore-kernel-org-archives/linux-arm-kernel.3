Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4944CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 12:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=47vqK7Iv9Xuep7A6C/o1HemtgJkLnTAUGBL9UovdPBg=; b=QFGXPdSyYbWVKrh5jzjL96IxCj
	ClydurFN/0646Pu87n3QD6wnwpy0zZLNKWO9UvHEvdXaJfU522ST/AUBuI/j4ElTojn6dJ9yxmoUC
	6BJO9Fh3a0VREjINwQPiOrrGX4KMxX/8QyRW06/xlcDugpSbEO+i6R6di845UGal43NkoFVdBD7PV
	52VMMk+rpvQef0AqUck53zD1vx7ZhcyEoraX5W43erB6i+R+BhlF/l8aHsSvxh5x6sykLbuE3hNZ+
	CHR5gzX97RIizX1RGlpQPz6Oq4qqdmIpIE/pnKqaZsJsBAQBJa+5lJJKDEk/TsCQ1UzUHHPCYk+SL
	q8llBtSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGFSF-0000000AUsv-3vmy;
	Mon, 12 Oct 2026 12:48:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGFSD-0000000AUs7-17c1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 12:48:34 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0Phu2088495
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 12:48:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=47vqK7Iv9Xuep7A6C/o1Hemt
	gJkLnTAUGBL9UovdPBg=; b=c1SpKsnFABlG0oAUswbhng32HHGQaOPi3tQ7ktDu
	V5WiKbfuFdchJ6e7rBuZvdNNGkQPPQKCIkgxdJhtxzOJoCC/jA6nfTyI5kT/C842
	gC75AimibBYPtQ/L0SYvdTgwAWBEAjOeeqvrHlEHUD3fii6/89GHrlHHj2Mj1hgK
	qmYzRj0Ks2DFd34WYKZ4nDRvpLxjd5lm9cDshTqGHaDtCi+damY3HhYITrPjUduf
	QT/jl+bqpGHP25gFeRJ98A0MsQ0dKtRZTXJrDcVpy0rckjVoTuClNmk7l+mMrNzs
	GK+2t6XmhAqT7WGJOL9oRnyPsRQHj2TwstivL8mE5mNbzg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu1xvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 12:48:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc40759b2so439388985a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 05:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791809311; x=1792414111; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=47vqK7Iv9Xuep7A6C/o1HemtgJkLnTAUGBL9UovdPBg=;
        b=fiNjS5zFK/kekLLKKkLD2xpWmBQ8VurEzkKlfu29WwJ5GK1ToybF4IwFV3lHak2/Zs
         9RHQSrcfcsToRZPG3jtkey5EcJdnDUUmMHu6OaGeUweSsH2KkyDCaNdOODuLqVDr9Rdw
         aMdkJ5V7SjhUhV0/v2veTG6lsImb3nEyChrDW/w8CZSDQcTgxogPPTwm9DPrK0mKjV0Q
         plmtnkqr2My1pg7Vi0tVFKTqBExSVdx0oPNbe4RSqvRXzuSFgS4U559DRtmw/FCDVtTd
         2EMyg2TvtRAqD4j2T3nHJVOkxFKsE96/NQAVA7cCHEmHayfP4av09iKs95Giv1OogYgs
         raag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791809311; x=1792414111;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=47vqK7Iv9Xuep7A6C/o1HemtgJkLnTAUGBL9UovdPBg=;
        b=CzMlOP+mR5++bw1JL4qT1z9zap/+ftgVLpfHq8g8xvidDnPOS36FH6ZFAq6o0uAMfI
         aDe86Em6qIA1CSj8uA/5X2A8vKUE4jvT0+Zas8WQUdxjv0vpGbBjfSllIOc3MpyAlKlJ
         jZBdOfErIkwcCKP0fLfDtsRxiYMltsRrz2fp4IbeK16/obfGyursgpLqP3yUKOG7UQlM
         0X4qrzakYlmZyCsq8Pdme16ne9IEvUL8jP/L2fOblnilhGuQYX6mwZxYqc+op3F6xrgu
         Bo/IjC7136FEoiLUpQG44kJ6f+ggHANWWxN7UFbYL64SN1YycONf7CMiyuL4KjEGwoGx
         wasA==
X-Forwarded-Encrypted: i=1; AKwUvBwOl8Qttwheq/W/G46AMbSDyVB/Z37F3TQHrozq1ofldOQyc7z0+ItZ78KzDEP8Je5CZEtCsRPV3aj9xpLJC7Za@lists.infradead.org
X-Gm-Message-State: AFq9FYKFjuWnCKrThQd2EMQGSTOEflyi4+Svb5isR04IgRIRTW/D3/6f
	i2/N4uUgEPzo/hmWtqJlZGtmkMs04A66u5Q9m0JeiZmLqwfieXFTLCHhZuZ8tRy17OLOdf2wOQw
	HpzR9BGFp9bHWwlLWYYKjF9I6L44QUONYIb9DybI0oS3UfTgyFwkYEeyxprkL/GubMsoa/qRlhu
	b8XQ==
X-Gm-Gg: AYBFou3d889LOKjspdJsarE3vyosMNphxMpVOcYx3IH77ftoqUb1GoNgSvE6KBJ3ATB
	Ln9TfKw/Q7EAdhdLIl/GeOR2tkefQbTasvwI5kBGA39f5RguPL2zWOjY8XkeZICMA+LF+wNs3xz
	JslUUGAKAs+GvTBryK6J2PQvBc5AP1/zyg8CELvlCXqhZqXfbY1eZ2QUnLCJF2wq2GwRx5GXyto
	olirTnI4X+qUISsKwUtHCE1JrKCm68zL4atxGFdjaRpz871pxMinaLx7mjVzjRbO883nXTEZ2zq
	AdVTDW82qs2mKZd/hegakJQ64JwH2GFzP/ftSk1s7xDfOU16l0EnqgAyC4hUfRLy6wDMovZa4ga
	e2pqyOiale1icZNnQEOC40XcjQhO904JAvRoewwXsFousiadfPnHQ5Bu6xlVCwN76ITGMAn8mvO
	1oe3QwgafDDr6L
X-Received: by 2002:a05:620a:7118:b0:93e:9cc1:7b95 with SMTP id af79cd13be357-93ebd24265bmr1568718185a.58.1791809311390;
        Mon, 12 Oct 2026 05:48:31 -0700 (PDT)
X-Received: by 2002:a05:620a:7118:b0:93e:9cc1:7b95 with SMTP id af79cd13be357-93ebd24265bmr1568711685a.58.1791809310825;
        Mon, 12 Oct 2026 05:48:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde912a7sm2753995e87.18.2026.10.12.05.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:48:29 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:48:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dragon@radxa.com, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 07/20] drm/msm/dp: Serialize stream operations with
 HPD processing
Message-ID: <wk4gnn4pq4jkm7rwxle4ivleqj5eb5jpllfkjep4x3kacbadim@5bsg6g33e3es>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
 <20261009-msm-dp-hdr10-v2-7-1835d4966da3@radxa.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-msm-dp-hdr10-v2-7-1835d4966da3@radxa.com>
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6accd720 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=ksxQWNrZAAAA:8
 a=gPIhC6YDpAGJdL8mzGgA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MCBTYWx0ZWRfXz8+yjE53Ms5U
 TVY3rBqY/+yXWPT3kJM71iQ9d5tbIZ1exAlCOp0FlibgDfQ8sVrVzfu8nWkNH+SA12XkNevRJGk
 vK4s/1O+Y47GVA7XBPSzG1cjOfSdN5FKkj8AtG0pAAUG/IQiUT/4xXAh5F7/9LlmZXkiF784vHn
 a5KHYK9h7ouimi2VsvH+LOi3n5Q+7brSGE1NqE2QnwEJuGiovVKJ1ZifJT/ByJtttjnN04R7jGi
 xLirZ4okuYoiCFZIj4Arz0q6FMcbwuMU4c56kLkd9EFzTpwpCnb/QIShlNdadJLmvcbd6cq0oDM
 ka3xrU88nABiJ7QhjGG4ACulvJeKg9wwQhv8x5w2BqV6u0VEE0cz3PTz0P+/Ji/L+xnarWWLMCf
 ENaxx3TwkHE5QTHJTjg9HaSc3YDqNYVONAcQoLB2Jq65Ca3rHo/1pppUuUg1tIjIbrIWoijBggU
 c1ipbvizapoKdAyHlRQ==
X-Proofpoint-ORIG-GUID: eef7U1HEAWlL6F-PxeJtfWJwLHYK1hpl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MCBTYWx0ZWRfX8OZ7U1naOqly
 EW0jaERv2HgappRpMqgFaCYamwXi98r6hovEVxpcvxptDm4PggkwTsKNUbeuMpMTElQshDCt9kT
 RiwfwTAKpwabOoF2wVuakuej2zv6WQk=
X-Proofpoint-GUID: eef7U1HEAWlL6F-PxeJtfWJwLHYK1hpl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_054833_415778_B5E90CFA 
X-CRM114-Status: GOOD (  19.49  )
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

On Fri, Oct 09, 2026 at 11:15:59AM +0800, Xilin Wu wrote:
> HPD PHY test requests stop and restart the mainlink under plugged_lock,

What is HPD PHY test?

> but atomic stream enable and disable do not take that lock. Both paths
> can check a resource flag before either updates it and acquire duplicate

Which flag?

> clock or PHY references. They can also reset a link while the other path
> is training it or enabling video.
> 
> Hold plugged_lock across link preparation, stream enable and post-enable,
> and protect stream disable and PSR transitions with the same lock. Add
> lock assertions to the internal stream helpers. Acquire the runtime PM
> reference and handle the eDP plug event before entering the critical
> section, and leave audio shutdown waits and runtime PM release outside.
> 
> This provides the serialization required by PHY ownership tracking and
> the subsequent stream enable rollback paths.
> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 42 ++++++++++++++++++++++++++++++-------
>  1 file changed, 35 insertions(+), 7 deletions(-)
> 

-- 
With best wishes
Dmitry

