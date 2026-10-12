Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F589CA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 08:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JsBn+x/B4FRTAQ9qeP4Xp/X8QK95CkhbCMiwhXCn/08=; b=he9jXJH4+xmuu4W780jhxwLSXC
	ke9A2rnlZclbv/+p8u3x5XmorXYO0t0BVtcdKBZcNTV2aef4+ysrBPgHAifEGEcri7tdOlKz0eZSJ
	2ETzgP12wZj/C/59d9K/7Mv0d42AUi5IFqxKaeYCqPm1/kQL4QyOvlAhkgX/Y1SXxYy/TJoZQ2Ht5
	+bhFj5wOqaCLQjOY+dzSUNnF8ex3EpgPm2XoCjDBTYTqZuu606tX3yx8z4slE8IIf6pq0lE4yspkV
	q512lzPJa3Kjo6d2Z+qwAPyBm+alXBgsjffCSuPreWsDQSu61S5Tw1t2WBSSDVRMBB50xl2+cwzX/
	BXvPPJwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGAyB-00000009sqc-40Mg;
	Mon, 12 Oct 2026 08:01:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGAy4-00000009spT-1KVw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 08:01:14 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C56DtP1002721
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 08:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JsBn+x/B4FRTAQ9qeP4Xp/X8QK95CkhbCMiwhXCn/08=; b=R/iGb5yh5gV+VzRZ
	yCFEkH4d4rDnR+vKoe15fRaCJi4R42/mdiB6NmcJrF5frK9CRi3rD8YYWU2pyb8v
	OUVigOu78zNtDxDGKQJmQjTq4oHP5b413jrhdmFsg0VBon054OMYK/KYZCZUia+q
	Nw1aiu3pupkVf7mrgTgolwvyR1DMps1/4jTDyCRPZMgbB4BjFAKcdfC0NYj/O9S5
	GZoMfYcCBDmj4obyPe7oZqTlMAl0VhU6mL/9baAWZyug+xKCnMO9Mny2Xel4px/W
	kWHFX2jSt5qEiCBmM6FQsUNLHaYw5hVsiW8VcRGvOzD6Xh1acjR/zrWWfkpAFXt3
	Zgfvvw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8qtkgx70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 08:01:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cac495d99so6409985a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 01:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791792066; x=1792396866; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JsBn+x/B4FRTAQ9qeP4Xp/X8QK95CkhbCMiwhXCn/08=;
        b=N5RwTvWQ0lb1YzdGw8cLRo2iwYabqGtwdW4v4VYPk7pZPhzdaqHA0vbDbBd0AbfLLC
         b2VBmx45xrwIPloqLo07rH18kvrUzqUsIACZwRZF+8/TXyyv3HkFSd/gUbp+5wVJBkqR
         p8EgOR/Ga5SE3H9Bs0C/4WoEIz6GLge/BugCHG52TgTIUwbVTTvKjhnz+1Wee+F4JLab
         2xBgGjtF3uHMygTreHMRyVIov0yOdDPe9545EwbTXN443uwbCkcL4MurbNkozG3T+bzT
         ZSde/kpNqfpk/G4B6Ig99W5wyan90uYIIhQdbOCGe4SsRrojVeJXiuK3PjtNXwyfVAit
         YdZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791792066; x=1792396866;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JsBn+x/B4FRTAQ9qeP4Xp/X8QK95CkhbCMiwhXCn/08=;
        b=Q9TLofBkgLfZMV04H1F5Kwm/AYc3w5HnKgew/YJ+ynb3O/4QV5lJiM6I0D0Ap5FKMX
         kKPzwTm9eNfrIp/JqAtQLHqP1fPSkNflm2hvVGHV7fAi7DMrnD2cKxtkLOCF7WSprA7D
         y/5BXdf7gqiFgQAQS55dnyErh+IHNYmP6nBxvfvGbAtoJhBbtzAVzrd6t7jg8vTnbsYd
         9PrXhyso6Ln20oaqEmvz1/LSLD8aoHDXwhqYclUEVh+2oZXJbuK96UJK1LpdTEY1UloV
         mplpGLW+65mEhC92tpL1KvssDRrOMh8Dg6L0iMs0ii975J/r96xFmX4Qd4HVIxMzsEje
         214A==
X-Forwarded-Encrypted: i=1; AKwUvByVHN+MRr1ZRBS0xDwMloWhspJFrogLqG6+3cLfXtpzrxd13zeJtjytG3Lif+PvtpRxHtS4Mzu1kYdKksN4BUnI@lists.infradead.org
X-Gm-Message-State: AFq9FYKc2W8uLOKdqRERy0GaLeZ0oRKe4a83BzoGwiNcgF0fYsK80nl3
	SrevdGT3S3XY3859R9eTri2bk5oN64gwuJlw5dfYaF8UJRUBzPBEHnqvr7nCIQBt6P2hpZRYd7n
	Xq00tTyE7wRbvYauz7iSmBjCW+I6sxnQ4mnrk/nmYoJZio2EorzCIWgFRkjBsyUCV8xE+vtLv2b
	flrg==
X-Gm-Gg: AYBFou1/wVX73Q+bnyuJayei4LczaJ4YeqEVhTR3HQ8msMonhcdRoVjuk/1VLpSGw4B
	CzKzTWBFZY7s8e7t2a61ARvV2YKSZViru5sSvCswwEHioqTc/SCenaIVExWbKjzgVSq7KjwWnTJ
	nmI6ts7eWo5DRNGV+scfIXs9TDZEeb+K2FBkdqNpfg0tKHXGyQguhdt0TfRLyXyxfsfPF0wePVv
	skQMhcn4oS0WOSC3PYtsAeBAXDcw6cEuhmLFF72qlgU5fzfS38TiRMkF2kRkJo+LRDCg809xqjQ
	0pjAwZrKPVaBY0MD16p+zfe4gZajJPWxote2+lCPAMAx/1vsOqrOmcWMTtPRsK019Mw2tqgrVUw
	d4jz9vTzabAQKVwH0DXDuVw==
X-Received: by 2002:a05:620a:1a10:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93ebd23a4f6mr1661416585a.4.1791792066167;
        Mon, 12 Oct 2026 01:01:06 -0700 (PDT)
X-Received: by 2002:a05:620a:1a10:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93ebd23a4f6mr1661411885a.4.1791792065667;
        Mon, 12 Oct 2026 01:01:05 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3c9af97sm27169731fa.14.2026.10.12.01.00.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 01:00:42 -0700 (PDT)
Message-ID: <d33eaab8-2933-45a9-a716-b3eebf3dd9d4@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 10:00:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/20] drm/msm/dp: Clear stale MSA colorimetry bits
To: Xilin Wu <sophon@radxa.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
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
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dragon@radxa.com, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
 <20261009-msm-dp-hdr10-v2-14-1835d4966da3@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-msm-dp-hdr10-v2-14-1835d4966da3@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzMSBTYWx0ZWRfXypxwd/+einGS
 /C13KFfWO7+gf01K2cT70lW6EHNDeZY9zZoqQAF2eO244llJiNKK1j7CaiQ1LvBze3NCWfrWMLW
 z2ozqKL8VJW1TQ4jNzNol8DcmJqIVzbVwXz+eJu7/yg3waZ76imnPbDEcfbq0J92nuzUFhxEWww
 7LWwEEZ36U8ktUjBGkW1oOKcoQdpRIFSSee0zHhUChZGpZYKf9T0tpDn90HdL81p8OX3z1M7iug
 i8QU3Ri2X4b3KQ/Mog1ZccrC2oYdOicI5/EXLG5C94OiR9KRIdO6DHEWpchxQwUJ1XE6Z3Lzbk4
 /R2Le9ik7nPjHfnyFfSag3GNobpk38/7OidBd4t1DPJ1q6DqgSbiTodZauEePh2uWbF5l3EVkOB
 vwlaQSfdZi22vJEIobhhRpn4j1u3AwDE+lqd1HDOZbU27h6CLV0g9JVY48cix68kptpruWVjYVV
 1Dau9QcrcvvVXzcenmw==
X-Authority-Analysis: v=2.4 cv=c8U+0h9l c=1 sm=1 tr=0 ts=6acc93c2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=ksxQWNrZAAAA:8 a=KLRTrxjsjmTHsxePAeEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzMSBTYWx0ZWRfXyvYGdAa14xij
 M82JX485t+2zFOGh8fqFxEsV5cj0XSYXkB2WD+A3m9upvKOiCqtt7h1dGRH/TE+9nLJM4s048LD
 KkQKJP+c662+iRdzY1zyptQu9KgnMVc=
X-Proofpoint-ORIG-GUID: ql-8szSxlp0kdIGgiwbUTvtO77EjCIj8
X-Proofpoint-GUID: ql-8szSxlp0kdIGgiwbUTvtO77EjCIj8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_010113_244417_DB3B4B59 
X-CRM114-Status: GOOD (  18.29  )
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

On 10/9/26 5:16 AM, Xilin Wu wrote:
> The MISC0 update clears the bit-depth field but only ORs in the new
> colorimetry value. Bits from the previous stream can therefore survive
> when the new value clears them.
> 
> Clear the colorimetry field together with the bit-depth field before
> programming the new stream.
> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 791bb3af2cad..783cafb22374 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -476,7 +476,8 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
>  	misc_val = msm_dp_read_link(ctrl, REG_DP_MISC1_MISC0);
>  
>  	/* clear bpp bits */
> -	misc_val &= ~(0x07 << DP_MISC0_TEST_BITS_DEPTH_SHIFT);
> +	misc_val &= ~((0x07 << DP_MISC0_TEST_BITS_DEPTH_SHIFT) |
> +		      GENMASK(4, 1));

The colorimetry field spans bits 7:1 AFAICU and bit 15 means
Y-only video

Furthermore, I believe this register holds the standard fields/
values defined in drm_dp.h near

"/* MSA (Main Stream Attribute) MISC bits (as MISC1<<8|MISC0) */"

so we can drop the local defines

Konrad

