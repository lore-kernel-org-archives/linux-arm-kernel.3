Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C45CCCCF2E7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 11:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Og2bNnMCiD+Qnx/yVwl7sa8q3E6jkBERvqpmHJS/OCs=; b=wqUx6cnp4WfOWPgM5p40hctXy0
	KLAOcBS0XTL9SMs4OuXTNWvWrhA/1xP8N0IajGanSLqIbZi4dZDgmLdXovGpRo6+bqncZGRdo7R2j
	foemDktkLAIqGv9EBfC8aE6XXHfuACMON9g539I+um4tfP0ZsO8IhvnjmRTGVjQXwTp1uY3shyNw8
	knPda27Rr6ZGTiPyLFv7VpHD/fSMkvgu7JF51DaJ3RFcBZO9F4OHtVCqC5ysrmHHMxWQgoPynO5RL
	Vurpx4Q7VWma/DMfPYKQ0ozmauqLPs8m/HtQ5hj5wqraH9GMoqtfHRFD3/ARiv26BtOyvfsFcmny4
	jEPtbpRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnMQ-00000001swI-1Jgz;
	Mon, 19 Jan 2026 11:23:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnMO-00000001sva-04QD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 11:23:53 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J9kKKJ774076
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 11:23:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Og2bNnMCiD+Qnx/yVwl7sa8q
	3E6jkBERvqpmHJS/OCs=; b=cK9FqWXf4YEzqdLtmjNxnI+ZOiB0a/BMinmgC5Nz
	A0AbGvNu5UOyKvZ0hNbB+39/iqnS/I12vuN96XYXVwIRHGFUFOuz/rWprlsueylL
	PQWRBkbUldWASFJjRUr39tMwOY6OkL4gvkdkJtFpDllq8yg0kJyY59jU+eUPomoF
	lXiiuN9bladCJM/XLOmMXcieoD/v13fH0X+G5EAgaeXu2Ig7SlYnwaj1rC/tYYEn
	iJJ4BhxhpRJA6mc7SDHc3fhCK2n6XbbZhTYUYz77Pc8cFSPmycdxwd+vaToy5vuV
	hgOJrzotIgsyd/6Qa1l7mqlNyzpXFhycJmPvnVadcv2aOA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsj9a8ahq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 11:23:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6b315185aso663755385a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 03:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768821830; x=1769426630; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Og2bNnMCiD+Qnx/yVwl7sa8q3E6jkBERvqpmHJS/OCs=;
        b=HWs/KNJuk2ifZGit1GIlihw9DkgSSx4yQjxA2lSMCU/R5CEUvucsYBJIb17osUlE6w
         Ew5qpmzHOyXSjZRdakR7Okf2l98bCZ195YNWkqIn6ByZbp4ajrB/JWx0rq5gfBElWbHt
         lYtanvHsuUGsZ8MfbnFokfPhHPqUZqAc6drXnDqOvmU9fZ7W0P29xVVdR4ClqNAtNbAh
         x87edPPUnP0FzmEKiRXKTvVpgxFMdFQbYv4aWaIj0c1gSAJl3/EIFOEWmTSe3c1kxI3m
         9Tb0LgoDHNmOsHgULyPmJzKa9KPeGMacvnZSeYZtwf5dBu49ETn9H2vfLjg9X/3TknZv
         NYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768821830; x=1769426630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Og2bNnMCiD+Qnx/yVwl7sa8q3E6jkBERvqpmHJS/OCs=;
        b=fYFqBGqEdo+Kb8NvgY4+b0vnllOTM+8LeNO5iN5RQpX/HBqY20qC0xJJkuiwMWug6E
         V0UaY+HKDzJijg8TFrkM5/zg9y+qHMaTO7VAa5vNHlCyAzUf+2z5tN8nVpg6g46RcF12
         zni2IiW7ivjgX/prz8tDi76CvsJ0d9eu4CV425F1j2lSIfFpdn7OvvSN+uEaRAI02VT9
         Slu3Nkz8iwKqR69p2rE5j8258RmbAyt11EheLIPfZifSrPymnylcphSh5To1gfNyNvn7
         pLjaP6J16CZ13kcNUYGd1IOkPpH3ouP2P0fBVXcZXKfOL7JrKVLmmEW/WxtmJ56Gs9Mq
         c5Gw==
X-Forwarded-Encrypted: i=1; AJvYcCVkFylcByg4chlbxuXMI4GEgLi/ptqyuXrpllUPqeJLHs6frJ6Hc9X0YOCZgJH2g9ywmxEUeSx5NMG1Vc716UMm@lists.infradead.org
X-Gm-Message-State: AOJu0YxPlew0IEtSALZvniwMqL/VF2/tneH51I3BAl+xyDSMLbErxGeC
	Y+g4mSuJBZl7ssX7HXj2q5zRSHJBCKfFmsQ+hr6PEf3PbeZx135sBJQCwiYmA2pWaiPmfoolD2D
	2tFKey3vJv8RxRpbIODMIIYG9mJzXGu4fwX3wIXZ+J0NUGUJW9IySfX4UHsUe/yeNuwNRNYy+8h
	zpl5Mq58IvKw==
X-Gm-Gg: AY/fxX637c0gld79QiDQsl+N1oeL7Vl8F0KVZNyH8BM+ep3crA7F85vOEF5jqMK5Rrz
	5qgQ6C45Qs8D3Pz3Rj58NM6HF71l9isIFVdzhxKxit7ANt1xVplt/kxgmr6xaKwNI5jm6ZYntrX
	gskK3AMMwq06a1kEi4P4rs9biWurwvMCosMUyqFwNxRl9AKRml09esXCyekFjsThA0EzVmca0tF
	AG9wS5f2k3plvw+9gBY0dxjsxbsQOA4aNGKR71CzXGOkewO1l23WyHNiTadhMd2R5rK8qU8jWlF
	s1P/BqKNoW0eIXCsBotvkxtQOO4JZjQvSzQXa6n3K36htyNtVOU/jaoOfrzCy/I69by902hDhuV
	e4aQVuBWDMwSjfEnSVsEgrEKy45ywC0uWJ0aC4IPFNkB3PmaVZbHebejsRd+XaItmY2OO+VRibK
	NwySTtComNQoRt3z8ZscS2Hsw=
X-Received: by 2002:a05:620a:1788:b0:8c6:af59:5e2c with SMTP id af79cd13be357-8c6af595e6amr1169574385a.18.1768821830107;
        Mon, 19 Jan 2026 03:23:50 -0800 (PST)
X-Received: by 2002:a05:620a:1788:b0:8c6:af59:5e2c with SMTP id af79cd13be357-8c6af595e6amr1169563785a.18.1768821828488;
        Mon, 19 Jan 2026 03:23:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384d8d5dcsm30685941fa.15.2026.01.19.03.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 03:23:47 -0800 (PST)
Date: Mon, 19 Jan 2026 13:23:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Liu Ying <victor.liu@nxp.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Samuel Holland <samuel@sholland.org>,
        Sandy Huang <hjc@rock-chips.com>, Sean Paul <sean@poorly.run>,
        Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 01/10] drm/tests: hdmi: check the infoframes behaviour
Message-ID: <yj3r6d3azwwfl5g5yo5wj65qy47f5hzrio5tvfmxhgzlc5bezo@ij4dctwhswls>
References: <20260107-limit-infoframes-2-v4-1-213d0d3bd490@oss.qualcomm.com>
 <2fb910198a3be542215592ac3f22d6b2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fb910198a3be542215592ac3f22d6b2@kernel.org>
X-Proofpoint-ORIG-GUID: b3E1a5EcOxi2Q8q3nRoz0LVKIwz0EWiu
X-Authority-Analysis: v=2.4 cv=N40k1m9B c=1 sm=1 tr=0 ts=696e1447 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VxRmli0-OQd2mcn04XsA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA5NCBTYWx0ZWRfX3I2+mnv1o83G
 aEANQEWoIYNpJCsmUece+hNUOYLPPyeJ5oMYR/W+QDMc8ij27F4mKD6We6xJbWTaX2/q4sRxTHF
 MeCxzgvscMvnMZDsUqjCAyjqD7KLYyGW0GyQwxJ3wDIHWgFL+6Q7stSsVuLeiNWUmocyDbw/4tn
 7/XAKb+84PysUYioDE+4x2Jbysu8CxqbYKwoijzICbv1tmkjUu2s6hEChzpz+ZWP4OrWSscWVM1
 LUODXjhIPeJi4h9kZh+OMhY4J+MemB4Jn+V4A/kLoHBkrfTZBbiKmOZO9HrDdTY1aG1wrOjNemZ
 /agBQ9nK60qGI02wod5N+37vACGGoUSyJACXVw3/Xf/hH8d2DUh4XgmlUmu/hOQ/hs2EqMCkAaS
 nNFdBuzRvQyDmd+t9JSA2mMKCo6sHldakmEulb/b/oFOxYRAe7yjAMrmKVBS88tKJAF/xz7Q+2n
 lpBZDoqBqfd6Bj2Oe6g==
X-Proofpoint-GUID: b3E1a5EcOxi2Q8q3nRoz0LVKIwz0EWiu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_032352_053566_67E49007 
X-CRM114-Status: GOOD (  17.18  )
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

On Mon, Jan 19, 2026 at 10:13:43AM +0000, Maxime Ripard wrote:
> On Wed, 7 Jan 2026 20:14:58 +0200, Dmitry Baryshkov wrote:
> > Verify the InfoFrames behaviour. Check that reporting InfoFrame as
> > unsupported doesn't result in a commit error. Also check that HDR and
> > Audio InfoFrames are not triggered if corresponding features are not
> > enabled.
> > 
> > 
> > [ ... ]
> 
> Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks for all the discussions and the reviews!

-- 
With best wishes
Dmitry

