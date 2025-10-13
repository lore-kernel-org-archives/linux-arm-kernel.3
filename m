Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02A0CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 20:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h8b2DwudIexdSRYipqQ13kewJ4gE/3CuV6C5IduoJwc=; b=VpA7i2tgBSwMHbdQ0wS4cPsX+S
	cvd4bKPgRiRkJ6p9UMd8BS412/lb76plmPQZWa/p9enTMEY1iYTTG7TDb2rSr8Y14nTQitnL8vVjB
	Q51zURjEzrCCUfhSFCahXunrlwQwTAJ75D5iQ1anTOlYbb/qQAH79AclqILbdFsob9THkc1n5mVDa
	ZgyvzoWquHRHVHzWNZb6KRHO/h24DykMQnF1Ahf8jEL1ydN1TGCEePOUD6DXP60CF3f2aNNwVW2VG
	0af/i9Qt/c0cJZwKPWRHiXiDKE8Jyh+Hjob6Rds7GbCepeMvEbNvLhl7KlLWhxrJV8g3Gmkz8kzfm
	IH8ccJkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Pa7-0000000EVOn-3A27;
	Mon, 13 Oct 2025 20:55:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Pa4-0000000EVN7-2SdY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 20:55:46 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHD8FK002361
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 20:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h8b2DwudIexdSRYipqQ13kew
	J4gE/3CuV6C5IduoJwc=; b=IXcIkoB5lrzUNaD+HgdJcATWOkoQEcKeijyYxvoD
	CpeyXaCk6w8+tWGSjAMZkwZPw21qV3u1O1ltWg3VKydAx41BIaj7yET94j763QQv
	8I/Z2cRYqYJmZn5/9eQ44X518qWYT5ZOFYKy3uNI51mU8RGIcH5aJXPaF6WalADn
	CQvvpW+LgmFNa3+Kd6KgxOEkAEfo7BF8PvuLAhkdz7sjsigzp91+nUOOWeZRs5Ur
	hTq6JnBjke4ZYvn2gSX73qtSxdXDOyfUBOxqavidkmAIGZY60iZgEHSDfa3UaFJw
	+67xrf28nPjY7xEv2qBa52P21z2FZ4jz6ZD12F4OiNNcoA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdk64kp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 20:55:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-87561645c1cso2591666285a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 13:55:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760388943; x=1760993743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h8b2DwudIexdSRYipqQ13kewJ4gE/3CuV6C5IduoJwc=;
        b=TyW9Kl4OAUntCxk6fEgyLm+YzBmZ6KL9EyquoblfTZJAhCeiRj/Qcmxt8praW7uX75
         UJjAlyfySIeYtYG3PS5SXLecZPc0uJ0yrduaT/ZYvvef4uG2hb3HH8yVNviwSeARagLJ
         Vwq2gbdoyJSY7qZDJQUPFQKRcyFBpIvUW5w+1+JvvWTnq7ryisHzrc+PiWGfHPYN/lKr
         dLyeekLUQzpZRVnpWklDSnqk40DVWWdvQHnCvG6vsGLe1wslkH2VCIwH5pP7jG82g6S1
         l+iFUDL4sJNsc4jmrZGjthD9113sXqWywH4p0XJmvjW8BAi0wktIwtbJUmLr/dvryqP/
         8Smw==
X-Forwarded-Encrypted: i=1; AJvYcCUs303kA3XsKYeS33nAp5bu96prZ0apI8naGsFF17xmBAghGw+146GJTp0YwbFSkEPYZ/bF6n41098hKQWK7kba@lists.infradead.org
X-Gm-Message-State: AOJu0YwjNNIueJZ5u4MYdXgn+thup69m1BDDO3KDGbcid23QQaQs8qWX
	Uc+UZLTUjpeI1pHRVoc4MBC5Ohh0hri7JmPBWVqW0TVTGE0xYMXqWYxB1xxMN7z21ufHGansZLx
	lGCWI/Clfu3aq5cvaeWQSxZKc1VI3bLIvzNFxZJlz7BqAo0WWty+j3lKd3gZdVkfFe6oKPy2dDC
	bVgw==
X-Gm-Gg: ASbGncus8r+6Jq5knkLZyCOgNrqc47QZKfCg7IQmMK07pfkf3J7bzx3ZbwBYCGKpgZL
	WemKjCvI0kSFTuAbgiCdHLRao99Yzq+0QQE32GKO2yt5T/XJmgOLgp/X7/qgsBowW9lIa5GT83q
	tath6g7SvKByOsbo4UzlFHAmuowNkNFsgBkuVepYnzyPH3tr5uFM+uG/9fo8WiKvoxExWF8hGEb
	R5ozNqbromtZ/s82E3FoUy28F6yIa6t7GOS1mes+NfYHFlTzRnXKYqOKp/bCkMqglkfTG4mL3/R
	+4ABjAPdpxISGGedRsGixNveUm3Wbuj4xaD3K+JSHMT5kxcYHHWgXaLhAlX6xC87Yohvk0pUty3
	+i/BOBNJNGjPsjtu8GY8OzAESkvW5QdteGbxwNVY2UvMpiP1PKsE1
X-Received: by 2002:a05:620a:40ca:b0:850:95d4:db01 with SMTP id af79cd13be357-88352f83c1cmr2928836585a.21.1760388942664;
        Mon, 13 Oct 2025 13:55:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEp6cEaL5p5bxM9BKec5c/+vKMAwKsA7FMuN565mKfxMvwbeeumVcMSCt/OjDjFwBqiUk+E3g==
X-Received: by 2002:a05:620a:40ca:b0:850:95d4:db01 with SMTP id af79cd13be357-88352f83c1cmr2928833585a.21.1760388942214;
        Mon, 13 Oct 2025 13:55:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881f8c6csm4493487e87.28.2025.10.13.13.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 13:55:41 -0700 (PDT)
Date: Mon, 13 Oct 2025 23:55:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Robert Mader <robert.mader@collabora.com>, kernel@collabora.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 0/2] Introduce BACKGROUND_COLOR DRM CRTC property
Message-ID: <x33zabb5un2boben6r4qp3vvrgca5s37gmseespdwwbajumdxx@mcxe6or5p63m>
References: <20251013-rk3588-bgcolor-v2-0-25cc3810ba8c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013-rk3588-bgcolor-v2-0-25cc3810ba8c@collabora.com>
X-Proofpoint-ORIG-GUID: Oq-VBi6NLOHnRUOlUTT8Qs3LknUFpblh
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68ed674f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=6rgqHx4lmTWDBTbEgdMA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Oq-VBi6NLOHnRUOlUTT8Qs3LknUFpblh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX0PJtvh5lEiVK
 thllZ05nNYZcDCdakqj0aFPyTCyT8cON3hHpyAFcgh3BVJOM0w9dCdlHegQ7+XAUZFt2p3BlNkz
 /nhz1kn8JY+F1QjoA/Ghkft8CqdMHiU9Z2XmEi5L2tiOUl+XavFwcqUADzbymcPC/o7ux+/my5k
 sPx1XSCITunwfQafGrFfGPze5tu/K85k/piOEEPrmEAy11uMHl6OESBijhnfviMs5I0Y2zrHL7t
 /QcGghS3GONevEWsrq90YzOw4krbD7KQempGa47hZtMbDJ9iGfSkv+0Uc+9kxI/DJ6PpS4grvgE
 a8eAv6O9AawY7g+W2IzwCv4xbma4yhqT0CRPExZZGKIdxrTriDAkFFeUi7k0LUswu1oy1LHbwfS
 AOoIA8hoYztHk0l5ICKgabcRZzpHGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_135544_739842_B63E4211 
X-CRM114-Status: GOOD (  17.15  )
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

On Mon, Oct 13, 2025 at 09:27:17PM +0300, Cristian Ciocaltea wrote:
> Some display controllers can be hardware-configured to present non-black
> colors for pixels which are not covered by any plane (or are exposed
> through transparent regions of higher planes).
> 
> The first patch of the series introduces the BACKGROUND_COLOR DRM
> property that can be attached to a CRTC via a dedicated helper function.
> A 64-bit ARGB color value format is also defined and can be manipulated
> with the help of a few utility macros.


Please provide IGT tests. I'd at least check that using the
BACKGROUND_COLOR results in the same CRC as then one when there is a
plane covering the whole screen.

Additional note. I see a value in having the CRTC property for the
background colour. However it might be more flexible to reuse old
proposal for solid fill planes ([1]) and instead implement the lowest
Z-order plane supporting only solid fill colour as an image source.

[1] https://lore.kernel.org/dri-devel/20231027-solid-fill-v7-0-780188bfa7b2@quicinc.com/

-- 
With best wishes
Dmitry

