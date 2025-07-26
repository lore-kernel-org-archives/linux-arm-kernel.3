Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 186D8C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jul 2025 12:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VoyOpXRtg8gribBcwI2od48JidopHaqstqRQI8GRAvQ=; b=p9PyjxB+01lWXfzgpGxjoL4fan
	/TLUdIOsOyUEBDC6q79KV0WHwUBdX04xvS43eJY7tuxETU8G5X37IkH/uEgLL3Nw43pJQMQYUwzEq
	MzLvWIz2ZcxsakUSX7O0yvlCHs3k8z3PcjPDhaXpfkwVi7IbURBe5CSbTpqYGflUOaGN8jw0SxkU6
	9FavpvyGVGAE2Y4eH/PxPE7YCGcmqx45oOJ+yxn9QUmcgw5BhGSOBROGyY9/59H8ApJeSrIa9Ps6N
	TLs3dnRLzq29xYHJkY6kAjR90vM3YZbeij23qGrB2iVc4Jnaoe/WNcZBg5VwMy0G7WiLDp6uLkq+l
	9A5ojMFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufdhn-0000000BQs2-2QUd;
	Sat, 26 Jul 2025 12:08:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufddE-0000000BQOj-2RH9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Jul 2025 12:04:05 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56Q3WLoW009668
	for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Jul 2025 12:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VoyOpXRtg8gribBcwI2od48J
	idopHaqstqRQI8GRAvQ=; b=Uic5+gBJ9Cg+damRxJqNwUobzHWxb0WUFthMrxQ5
	82CAhudDKkbCP1zzrv/qSse5/vBH405bLWg/Zt5Z/h2L7RgyrDAO/2dJi4Upups1
	23cW9WrrbUVAiVKjQOd8HXVmMdEJNZkKlTZGXc1Ze5GqNdNhRFFuIwHUcXJnxB01
	CSDLSBgXOZA2skOgtyuOOgv2F9Pb3wNWpaTcLA6j0dINwirELFTURIs8MVIPmcXB
	LGSuTAzFxblbw9a4VNTarVC32W1p2HUdmCrW7Sg6a9toI4PQZicsjHYyaVa0iuI3
	onYYM6JuMSpfi56WDDAtDVSfogo/7h3X969T26iYpa9aRA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nytrnnm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Jul 2025 12:04:04 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7073a5f61a6so1517116d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Jul 2025 05:04:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753531443; x=1754136243;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VoyOpXRtg8gribBcwI2od48JidopHaqstqRQI8GRAvQ=;
        b=ZG60WZPiFeu9gI/q406Y76bPfp0TE7evjhiixTpr5oPdQu1E3CNq++WnBLg9snLeFo
         UwzH2UQPpg8S0WagE7NmQ/bky6YsE6FFwp5FgPQlvrePUUlrvHqCcW3XnXj0Thiryd00
         OkI/cQghlSqJ6b/ckYyO14KQW+UxSWfCcxl90HQ9FUUWill4stu99LR3DYa0JXfpITo7
         DDsAiyahD5tcyjLNxkVTZsGpNjFplYXSTpLwH9nlbKINxeNSpU290FmopQ1+ao4RA8sQ
         GbQo/EFf4JLXmcOQA7MB3anuPZn+iSIyh5Q4p0m8qOB6mRatURcKxQCScf5OXrpS4q9/
         u/rw==
X-Forwarded-Encrypted: i=1; AJvYcCW+/LRPPnUnwnS1RPXFYuMlEWloR5KpijGCtE0Chph0eseHYpKj5mWOJOquLFpgN0W0UN2iFfJ4oOUW1gs+uMg+@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo3aV9Kn9cWrFfQWUTYCS5/552MGA8MX3nMxQVnLLj27CkKayn
	WXtkTs9RiGWZm2yCd/yw0mV+5HodzG/zuEJGBHJZ2YWOqJlDY1FpTUVaw8OuIC6D5JFE83vWDqn
	yQMhk3RcCqOKSjmiNQbEGxSZFfjrErnO1koECIscSRjbEc6pPVDLZhNSmbOt2YsEHCNVJITTLTn
	K+yQ==
X-Gm-Gg: ASbGncvNNWXWcYq/0+VTMyzmCGr/uOJaQPyEPUBN3zNzbRpQMCFpo37x/+RB/BhkA/D
	4HquL+3J5ZhMvnEJmmOHvl7idlpO1JQeXmvA2+HhbxMkSOS2g1XzUFXSuDntyV2Jrrj8mF3QQur
	3hd9kOixIlNuQ9KfH2p820V8LWWtG0CEgMasewxvFy/65VblIL6yyap+EXpiHOk9bdD/NVMgO7X
	bdcJnz04be3ANNj0Sh9XLWE3e6jE4094EIfhX9RgBi8np1hy3gs51KVb435iq1Rnwc0IZZfZ4hc
	G5Kh49YnXqOTeJAlfn4pO9cOhqQJM7cHX3aJ9KHQtnD70GqvmmTylNmP5n3MVj6Py+0gfWt1hGQ
	dYLmHx9HZaHT0klcvbvgWtJkH3Mvq6hOwyWGOHVyXxaiAca+pve/d
X-Received: by 2002:a05:6214:21e9:b0:707:2c79:e7d4 with SMTP id 6a1803df08f44-7072c79f177mr39705406d6.7.1753531442397;
        Sat, 26 Jul 2025 05:04:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE58ci26k7CLxO9KIg2k91tBSPq0VEHMytUV57ob5dO9j8+ZCHVsrHrzcPy3gVkj6+ng5cHLw==
X-Received: by 2002:a05:6214:21e9:b0:707:2c79:e7d4 with SMTP id 6a1803df08f44-7072c79f177mr39704146d6.7.1753531441626;
        Sat, 26 Jul 2025 05:04:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b6316d924sm413275e87.43.2025.07.26.05.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 05:03:59 -0700 (PDT)
Date: Sat, 26 Jul 2025 15:03:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
        alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
        andy.yan@rock-chips.com, l.stach@pengutronix.de, dianders@chromium.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 10/14] drm/rockchip: analogix_dp: Apply
 analogix_dp_find_panel_or_bridge()
Message-ID: <c3a7fptnm7vxpcz3ouzyov2woi4btknb2so7np6z4iq4anyodp@ajgkwlc4khga>
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <20250724080304.3572457-11-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724080304.3572457-11-damon.ding@rock-chips.com>
X-Proofpoint-GUID: legEzeFpkom557oyIfXNl4ByJZ_CzBjP
X-Proofpoint-ORIG-GUID: legEzeFpkom557oyIfXNl4ByJZ_CzBjP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI2MDEwNCBTYWx0ZWRfX5z2l12hSrpss
 Hj9Y9Dc3eeaoKhqe+IosD4SHvosjeN0aEOy8+Xa7wybn3WZeoVt4RF6wCJkVB04VOMeIiKTWx3K
 5nY2Y4Ba6G/xtq77xn1O+0zi0rziUDM7DhcJqG3LwqLmhAL0AWvuT6knKpaJ2eSQPI80kyPzDU0
 2ntZroNNlHvKDabjLsZ2I1xRt6lgsqcoy5O36tNd82B0HUUi3ysXfhDiZsqCEP849HCagtTS2zc
 dCbv1LT0ygfKHGrxw89meFdrgJCOwFTzxTxpvqkIYcizzQm8tsulXXK2KjNMI/l7hhmOSjpP04e
 +z3rvJUb/TCzQvHoIBOH0rnc1NXGnGeze+hoH2lXBS8vew32kFTM/UOyO9xPsU6lptMLu1RXA57
 HaMaafoFsvtd3ydI6kBtNmtrzgYys0gsLmOVGZviErbUvmDlISLsW0OVB9FxuZlVkIzLmlKG
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=6884c434 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=23ZsHGXRUfRepE-eGp0A:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-26_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=769 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507260104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_050404_615751_E7DB68A7 
X-CRM114-Status: GOOD (  13.26  )
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

On Thu, Jul 24, 2025 at 04:03:00PM +0800, Damon Ding wrote:
> Apply analogix_dp_find_panel_or_bridge() in order to move the
> panel/bridge parsing from Rockchip side to the Analogix side.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 38 +------------------
>  1 file changed, 2 insertions(+), 36 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

