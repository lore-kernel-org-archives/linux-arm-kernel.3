Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CD810F286A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 19:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=teVHKGkb5tER6UyOM8vX2vU3CT20tkmDTGularD2JzA=; b=u2kUGEtSku4HigPHXIQ+D27ZKv
	JaTN1ywLj/FE9FlHROPyLsncjakX/QmbemTVJ1cpf59X+ubYQx6RnOycK1R+zW1w3EY1O0VHkTMfV
	YHMcl1Hc1gC39r2bRHhbXRISkWFesBS1mHPyoj/sBulZID+XvcFvxmhXTGNYWjK/a2QLoxGW/iQpZ
	T03nEQzHTFB4Pv5la/iOZgVCLR3Qi6nAfdFS1NQwv7YpvcW6ArJnLjuveq8kQsl+AVz8Kt6vSoal0
	cjLMTsFn0vNG3NY40VlDDeS5xcrxlOWPMZP/1YB/uuf9C0jZNeVVSomhFk6RKVX9xSs6Bx+SOPd1Q
	z0R2tXvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6D9t-000000087hW-2IQw;
	Fri, 27 Mar 2026 19:47:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6D9r-000000087hF-0mmp
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Mar 2026 19:47:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=teVHKGkb5tER6UyOM8vX2vU3CT20tkmDTGularD2JzA=; b=dDaslA/h3Afj9hDuKKm7dKDhPB
	q3L+W877BRDtNU9rU7/9inDNpwL2xukuJ+gp4r7cfwXr7sGbu1cCIdcS6o1wbw9c/QXgiJSf0Ur8Q
	0W3k8NWrveh4HJVOq/8wpI7mJEWn2uL+NgNpNreyl8S3M7P4ZsbUtGAmpY+AnCadNDySsmo8/wdTt
	Qr4NW0DKOXvJOmdT9EY9R1bBtjiJSbqvNmlPed2TSSLBuif2Y4caUUttg9NcgZZIZj2Yy2tswkG7L
	iGHf6+REwO2N02gnXLwbNlnPgIEgzx7v3FZxcXYpn6keLcRhB26fUrHBpdpUUXRinABkoQhdWVJwW
	nWGx/WvA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6D9n-0000000BAE2-31l0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 19:47:49 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2bFS3137108
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 19:47:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	teVHKGkb5tER6UyOM8vX2vU3CT20tkmDTGularD2JzA=; b=SLJ1XQ9AUQtF+mV1
	C+LyFCxHX37K4YVqKudiM9weqXdcz1X9S5iKJr6SpWiGbun4XhyzS1YpPrnMZcPc
	a4uvhMKKdJYq4LEluqfWrHoUEtUxNpFJnd9GPsdrdxEv0965ePL1/raXo2hGrgnY
	ICI/Rtp41aHnuLZI7WfCTj4I5pKTE+WO+WJwBEZG22YNYS8BGGm57AW6iolHJGKC
	iDUMl5QGggfhTNu5VQTXwSxMj5t+pIgrh+mI4hyXHQlxDbhqIPFmQ6m2HKWDQiK8
	jj1jJHWn1VlxRSHnBDICXGuwp31kefUJZxqCevOKVy9bMaTxahZN8bMSoo9hglCw
	A7tvZw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d59r1d02b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 19:47:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50937cf66b5so118690471cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 12:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774640863; x=1775245663; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=teVHKGkb5tER6UyOM8vX2vU3CT20tkmDTGularD2JzA=;
        b=Mq8ZAdZKA8Ni0UHC6IDP7/rzUa/8ov2X3JDIvrSh8xYrQBviL6tJUNNnnKkq1/hzko
         rJuczsOwdO4KkBZ6Uzz1h55Y4slzHKmD46ZlmDGLc9Kj5yFnj5rZE+5iVB9MalttkkQ8
         /tuqUOFqV3VDbRJH/JgcY4UXTP6b42nMrwgvH7l6U+5i7B3o8PKkftswZjYFqXBerMU9
         b/ZC+uACAUTShbPBtzdiR/RgKEhJOvrM6XeRXAe9LlYXPskP0RC4FKSLlWyZf78gEku7
         j/ZXYp0YaKu0HV3XX3K8aC7u+g0KovY4w++TlDSY7v2berkV77d7UE7dfyzhFrLiJ5Jg
         ge1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774640863; x=1775245663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=teVHKGkb5tER6UyOM8vX2vU3CT20tkmDTGularD2JzA=;
        b=olOTqzOCNC4K3qbjAcxPpJRCxyzz6xJOPspmqK9whdijwv6JSVCC1O8q7AxfCZ9qtS
         xrv/YD7iLbztOdp+j+UZl9EdbxJss/dmIznFqFdUiKPrDWSaU5DZ9/KOrnXMpa1DOGCP
         S/XeXxkvHaI2L/taVGwrAwL0jX5jlah5Jwhj1/cOS6n+lJV3fz5gJS3pgilRxDrpchA3
         DUqrAypZQqUm5o0gbSgHoGjblof24i/DXd/oQwyMp2khxZolc04Fos2Q09BAqzIgq71U
         8EdqBgJcd6AkPSMWUM2wcacJ6KG563g22p/wGEFpdhO0XLl1XpZj2n/NvU0rqr0GYHJr
         yVIw==
X-Forwarded-Encrypted: i=1; AJvYcCVLqcU2n4TiO27IFn7cF71loXGctRw2CRtMjTbENsA1P3gi/dMb4RiIMDhv1GHLuM5WzAdTkKxD3laOLtLdBil4@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/rz/L3c+NUDsZwCmbfkVWyb4SWJNyNkP3odYnzpoAQVIvOcEg
	Oo1chvUHt21MHKp7k8NAD3FwzlCn4o9GSpmCocrXHEDMO56kuRV5HPgOYil13lftEa/OCdnZV0t
	00L6+QaDS5/41iRJoIusgWEmscG2I864+4Z9aLmcWTSc3xtJtzBeXwfKn3D2oKtJp5vD2lqVl3g
	UMMw==
X-Gm-Gg: ATEYQzwloN+AN1AeUTwDoxrvVbNBftqKI4+84bAW/VT4Ka9EaPWNSnE1RYDbZu3OxL1
	PYE+p66PUzinPAXyauL+0mKXLV5evUKXSPLkVcIl+YY5Yw2XRquoN2lqfqpiRFfwzV5XJwREsV+
	MBt1UWyd9qyrwiupp7Y3lU82SPRlvW3oAVVJvJEatwDPo0zQqn5+balh0S/6diuKMmnZzUSktDM
	TfdZbVkKfbtIilh8X48AaZsv5rE156PZSaKfjTp4KKykIONDh1OxfTywZVPnrBQ9zV7p/TQmFHy
	DhLc11R+p1bR2q4MnO7TWajC/hOx9HWT5E38c2tvCiz9aRgXpxZ/fIebMiZIZ1Ke1b3v5gEH1sg
	yP1PYmQeVjDpKYawBPLCjhie6EyMyx5klrMWehrI642SYbW1c7VeTt0X2RfiikpZjqf8uejNBvf
	UGXgz4SuZReOL2IXPu94xYNJFk8j0dOWlO
X-Received: by 2002:a05:622a:4188:b0:509:238f:ad8f with SMTP id d75a77b69052e-50ba37d196emr56634371cf.5.1774640862823;
        Fri, 27 Mar 2026 12:47:42 -0700 (PDT)
X-Received: by 2002:a05:622a:4188:b0:509:238f:ad8f with SMTP id d75a77b69052e-50ba37d196emr56634101cf.5.1774640862390;
        Fri, 27 Mar 2026 12:47:42 -0700 (PDT)
Received: from umbar.. (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c837130basm275211fa.12.2026.03.27.12.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:47:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/5] drm/msm: add RGB101010 pixel format
Date: Fri, 27 Mar 2026 21:47:37 +0200
Message-ID: <177463970769.3488980.9125473167622953389.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260324-dsi-rgb101010-support-v5-0-ff6afc904115@pm.me>
References: <20260324-dsi-rgb101010-support-v5-0-ff6afc904115@pm.me>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEzOCBTYWx0ZWRfX3TQ5toK4v+Rv
 ku/qycYjZVwNywDBM50V2IXlo854Kgnvi1d66egwloYatEp8zAReYFJDqGNThf5ry+huiIJ77tP
 w4CVjqPbFS7E6i7yPK4wdTAdcWUAc+ZU3TLSjWmkOzDiyyw/UqZv3w8FndFy6OyTYecuYkHEd8z
 mprIG08hMXSjdefZ06gd74IppDnooHyXPkC8ULXUUWAarTe0n6TQs/ckRWXFYRPVWLLJnG0wgYF
 PVPOBTlqN/uyB2hX1na/CUfLEWdDnIx4BK4inSj2w2VbsHqYlrlFK3MM4w4mmuy21UceKto/Z/m
 /iU4UJz2D7BQCzflL+05QHMA4JzEeTI9F4KjBKQlqsRQUThEwszAfradlWPUWYXOkFiUMDes2wo
 Cbnw8XeIdZspbpXFGZ77EB6d3m6MeptBH7YD1BarBSSjPjmtiUj/J1U559E10FNxyqF7tprXb34
 MUviSa26pXzMqmrQhcw==
X-Proofpoint-GUID: FXZyqoQVDhjfEbjFEszg6G5EvvrzpWmM
X-Proofpoint-ORIG-GUID: FXZyqoQVDhjfEbjFEszg6G5EvvrzpWmM
X-Authority-Analysis: v=2.4 cv=JaCxbEKV c=1 sm=1 tr=0 ts=69c6dedf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=e5mUnYsNAAAA:8
 a=Q2NTn6QYng6VSU78D54A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_194748_070163_491F5F19 
X-CRM114-Status: GOOD (  12.79  )
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

On Tue, 24 Mar 2026 11:47:56 +0000, Alexander Koskovich wrote:
> This series adds support for the RGB101010 (30bpp) pixel format used by some
> newer panels.
> 
> Tested on the BOE BF068MWM-TD0 panel (10 bit DSC) on the Nothing Phone (3a).

Applied to msm-next, thanks!

[1/5] drm/mipi-dsi: add RGB101010 pixel format
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b50dc1e54750
[2/5] drm/meson: use default case for unsupported DSI pixel formats
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a780b7f6c8e5
[3/5] drm/msm/dsi: rename MSM8998 DSI version from V2_2_0 to V2_0_0
      https://gitlab.freedesktop.org/lumag/msm/-/commit/913a709dea0e
[4/5] drm/msm/dsi: add DSI version >= comparison helper
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a65c4d30988e
[5/5] drm/msm/dsi: Add support for RGB101010 pixel format
      https://gitlab.freedesktop.org/lumag/msm/-/commit/cebf747abeeb

Best regards,
-- 
With best wishes
Dmitry



