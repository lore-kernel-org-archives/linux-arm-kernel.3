Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41CECA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 12:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bs2Jgzs7Tv+fLgxyw08H5RN1Ifr7kpK1dx9qY8mqF68=; b=X89gy2mo8Ttd1CpvRypEP66C3v
	hrDPlTFe37WUvaBnhDh79Op7eSpQM2wEHg5c72FIFBazBK3Nsd17zSNB9PoMTvS2ZMJKWhPuRHgbK
	qdGh2sYG56oXLAn6E6rAAt/1VlhnyPaf75cIMfNTxP20hAOD0jk+l9WRYUbPV5zPlqAl6pA1/oB/2
	pJDx4dVBCTsbz4AbB6Ch8k2DRPHXumkoCHJ7GKYf0qAEWGVkJjxHk9/yqz0a7cXd4Zrb6wzAcIMxw
	vld8vWgquIaj7d5+1AKkRUzDE08TIrSrhRhxOFf8DkVFs5auxPDnjh/jem39OLPXsVtTGcpcqpUPI
	GELM0Crw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGFDy-0000000ASr2-062O;
	Mon, 12 Oct 2026 12:33:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGFDv-0000000ASpm-0phC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 12:33:48 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0GwV1236398
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 12:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Bs2Jgzs7Tv+fLgxyw08H5RN1
	Ifr7kpK1dx9qY8mqF68=; b=lDMJcHN/OPzq1UlDCuCQ65E5z1RzyVIhBJCOh8QD
	AcYZMy5DsN7x6i0KGs2sryjcj3yWICTOYdljhsJZCHp5YNeHtNSrT1tC+Gh1QzoV
	avhztiEp2vcnh/FO8yDSAhCIK+mEKcD4BL79euU3FtK9eiE2JKGYcPw0HG5IUeFZ
	4507/+Uu3ClC+MovwFh7WB7arRHwVkk4y9zKPx01QYnbP3irlWzExK2sF6RK8RCQ
	cOhBWh4JVbPaxFCquDxV7wld/w/BRw3IEJOSwP/JLhUj0ZUgy0b/03/DnOnyTx1M
	NS0NaNSPm9B3kSNnbafdBJtd2Hh02DPZE4z/OYgKnhj96Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j6djy5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 12:33:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb7f9bb86so347626685a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 05:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791808425; x=1792413225; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bs2Jgzs7Tv+fLgxyw08H5RN1Ifr7kpK1dx9qY8mqF68=;
        b=fxE8EtsEk+G+FxWQXIfHwc3a9ocziKu17hiL8I3R4lKnkLR4S9jHDjO8Bddu87z2hi
         0l7bpbKPzbTwZhyqCco0GyES9V3jnBOAdTj5wPb0mJc9+iC5EKKFbwyq7IrT39WAxsO3
         OLKCB9EJCVuyievLt76Wr60nL4oep1v36saJo/AYegzMWPwaou5/zd2lzYCcCYtb35dR
         tyXXYojX5LydlrNDzKMc8mIfGdU/+kM3rZfnX5qqdQSrS9gvvuVNO6KYwHKj3tSW2yPt
         Zeoanykaal8FSyBXZJxppps4+O3HzmYL3KD6wO3nhW271JOVXpbNxDtVxhCrV0IpvfKw
         VlyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791808425; x=1792413225;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bs2Jgzs7Tv+fLgxyw08H5RN1Ifr7kpK1dx9qY8mqF68=;
        b=cTUxT9s2xR56qKBWYEusS6EMaJGndltZjcahliOuc8oDc7X90w6afIOl3rJzcnvTfZ
         4wmRIpE7hOykuPhocdRZmSHXP3gkuuCrI3ZLdGZTMebidwbMW3rYT84ZJE9Lg3fDrUeE
         qSzYu2zLufaTGCWmPECRl50JzkeiJmGDUAu5TNbofPg45zZKAt8t6bEH1i+38W4CspHI
         2/DF/l3Cwf/f9Gc0tgowf7fu5t62YwNS0wZTTGGq51141i+8O5YCpATaxqeut0znepwS
         bYwmlkrbFC/98haWppB12Sx7JF2/Jb+9YrsMcrw/Q6V8ZmysvtooU86i949Ko31V32WY
         E2sg==
X-Forwarded-Encrypted: i=1; AKwUvBzZ6wvS8u4xu2XxRHdOjTznDOXVWtECF/BTH/CZ3pqrI/+YO+jJofRA4t5NBA60IHK4kXM2hJjWzSdKk2AGpFVh@lists.infradead.org
X-Gm-Message-State: AFq9FYL3wQI/y7ajm5L4uoGkFb+citokSS6TPi7JWKuT7VwztUjZO03p
	BN7rFG4VGgSXD9EK1+O8e1nlvqCL12VhxletPXpQQ+zWx7hPS2KLXqX9B2Zo2C7af7xwnsM/OX7
	laGDWWIWEu2usiIt5Xj4VBIEYMz0G/+z0K3nT0YhJ37bZJhprNL0tn2N/En0iuO9ncgtb56dCiN
	lsKw==
X-Gm-Gg: AYBFou3j9QpLvrIIahDdBslmUV8qXwPSwJuOUR3KcPY5RMQncGsKNOnnHxBo/VkkRNM
	wVcZ3QAtamcF3nVGSdGDlx5MQJJqyQesI0pbR5PUrYxXZawroLTeZ43RSv22G/H+RWrd21oDyK5
	hMBQYPgrEc81vkLfxSZ56v1y2hC9DrUlItXNnuSEZU7g4YxwcKbDEHbvQJtQR/lxv1TI52pPi9S
	82DsFIupR+e+BwPnZkLLonG7A5H3ZTYvjBbyNleiHfTU762y79t57brun3HGHLHdnQFnswXNGEI
	t+eyeow/idpvu8XBQdQb9ixwBSK1HJjfZHXyRYdxwfItnh8N6GMdYdAYYdalwP50PDwLtMpPqD1
	JrdNZwG00h3wDVM4z1IqZZ3a8IHlJ7fy7RT1H9cdejAKuS0R52pc9bDVuWv6QWzvYHRd2QY8DrW
	s1jpfeu9qeJrnh
X-Received: by 2002:a05:620a:6493:b0:93e:c12c:f12e with SMTP id af79cd13be357-93ec12d0591mr1359657285a.73.1791808425118;
        Mon, 12 Oct 2026 05:33:45 -0700 (PDT)
X-Received: by 2002:a05:620a:6493:b0:93e:c12c:f12e with SMTP id af79cd13be357-93ec12d0591mr1359651885a.73.1791808424602;
        Mon, 12 Oct 2026 05:33:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcddea81c7sm2819066e87.49.2026.10.12.05.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:33:43 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:33:41 +0300
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
Subject: Re: [PATCH v2 01/20] drm/atomic: Handle max bpc properties before
 connector state allocation
Message-ID: <mkkc7pbeh3aiyhhnbkis7owqvvpt55lyminlcnu5gun6s76vit@5pmsxkrdey4f>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
 <20261009-msm-dp-hdr10-v2-1-1835d4966da3@radxa.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-msm-dp-hdr10-v2-1-1835d4966da3@radxa.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX3KK528Df+k2t
 mwlGyAB0OTGhTfOBYwH/V+gEY4zo7RBIqCmRzDt587+9Q/RZDfyNm2DEMcZMz2mo7RL/pNZHWCr
 g98VwCOvTZrxjQfVRp9RlUFdw8+o8yjL9USZEHMtfolFwqIMI+2m585nNGunBit5gh1dHqpyzIQ
 9XGmvhdh+rsMSuFQh0CpGMsEWM1rfn4KFReQsBEGCGEYJIzxg865EVEy5xh0HO6GeSUykBI1N+0
 y8TTliCP9G6KcqKv5qf2EK6mZYl+ITuhQI+Xmwkd72OyrEyFFkaRNfGtmadcIYlic8yhoWWST0J
 csEJLCRL1ChGwdGRtpv8ymdVZ+nhKsA3iutpC3vi8Ntz5IVzyfP1/EUta2j02cVuvAIVEOWySBs
 UHcpWsNW8fzwJkVYoDc1dJgMzknLSnYC3hXt0SVAqZ26bJfFBmE0zjgi7YDJ37jD/8wiwvoIkDo
 GjcChiA8dI5zMqy5Qlg==
X-Authority-Analysis: v=2.4 cv=aK5lOr9m c=1 sm=1 tr=0 ts=6accd3a9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=ksxQWNrZAAAA:8
 a=uu4xuC75hOI6q6cYBXkA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: ZHZ_QC9E3usUhyiddGjkt25YTRRH4jTW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX7P0kLkoIg/AC
 DmRD9lJQzmMr9GhgsAzBwH2fzCBbZ+lpwvqmmYM4A+RbvWOv2zj790PreKX8t3FrFA1+1Ih4M1j
 9TwD+KAgLORp7j/HLnmabXluIg3r/MI=
X-Proofpoint-ORIG-GUID: ZHZ_QC9E3usUhyiddGjkt25YTRRH4jTW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_053347_357809_B93DB059 
X-CRM114-Status: GOOD (  18.81  )
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

On Fri, Oct 09, 2026 at 11:15:53AM +0800, Xilin Wu wrote:
> Allow drivers to attach the max bpc property before allocating connector
> state, as needed by the upcoming non-HDMI bridge connector support.
> Only update the current state when one exists.
> 
> Initialize max_requested_bpc and max_bpc from the attached property default
> when creating connector state. Use drm_object_property_get_default_value()
> rather than the range maximum so that state creation and subsequent resets
> restore the value chosen when attaching the property.
> 
> Cover deferred allocation, existing state and restoration of a default
> that differs from the range maximum in the connector KUnit tests.
> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c  |  8 +++++
>  drivers/gpu/drm/drm_connector.c            |  6 ++--
>  drivers/gpu/drm/tests/drm_connector_test.c | 53 ++++++++++++++++++++++++++++++
>  3 files changed, 65 insertions(+), 2 deletions(-)
> 

I'd very much prefer if instead non-HDMI bridge chains followed the HDMI
approach, making the state available.

-- 
With best wishes
Dmitry

