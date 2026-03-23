Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D888F483CC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 16:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8+rg6T95L3e6cdKRmvOpy6bF42FLdyllOf+gYk+r2to=; b=FG0bmVQzRlaJGT9xWaTb8JhEH2
	NUL/+fUK5B6lhNFgtY48var+Y+xJhzWQpba/JNiUkvCtR1q/ludN6zuuWgR9fjWO4q9HAFUBTzp07
	ldme7/uzWiHvqHTAhTrIpnNXYJZH1a1XOgzljvfm2DlZE1Vtrdca+JtmESaCem0Y6pTbMNuhSka8D
	kZF1608LLZ2b50liMHMj4DepGud2eizOEfdJ4VA45Yuk2W468fvDT0s60LEm/dYfqRNJeQUI0sIq6
	Lh28EwEyycNXHQas++xSiwfGjK+obI7vRdoKayiF2PoX6696e1QxZT+VULYz/nF9eJ5BqlDTVqMKP
	tb+kV3dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4iS8-0000000HAGL-4B4d;
	Mon, 23 Mar 2026 16:48:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4iS6-0000000HAFR-0d2V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 16:48:31 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFHkPX1422601
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 16:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8+rg6T95L3e6cdKRmvOpy6bF
	42FLdyllOf+gYk+r2to=; b=b17pxW722M9j9oJ/IP8s8dtAYi/yBx5wKXEUHUS0
	x6SDLEFeAGIKIzOjzQGV47Oyk/14Hq+SkQ+YZnSykJ83agwW5E7/TypkX9sv/SS9
	NXzpT9o4aKemyY6vdkrSppvk8xpn7yCti0MHAaxU6x2we82FEwIgFUrhFjzL/n6z
	WHFaGQEFN5DIDiQ4rl/GNRAcAu1VPsq/BeYjfqUsyGsyeQcS4/7DiV6dUl1qitsc
	sOOV+AQGbeOBCBap7egEMM9mw7vQZdLiHfH27hbxaI0x4qSb/dtXVrLUnJ3DMzgS
	5wC5ewTZi/tkuC4TUInCM0zDWnsc1hdPgm7gOpWaGt0xCw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d36f08qfw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 16:48:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b31cff27fso4168771cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 09:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774284508; x=1774889308; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8+rg6T95L3e6cdKRmvOpy6bF42FLdyllOf+gYk+r2to=;
        b=ADak26Ju4r/4geJXPEvUWrfBv71rL8Led22Q4SkyutBNomMCWFs1wEdBAQesU/C0ea
         5X3itUS/ny4od1brYMm580s+kxNYSM6eT9deHxKcNc/UJY0dtWCwxsXiClj475jtYnBR
         KJ95bK03W7sflrY0bglUDWz2BCe9wzjZrLk72kKiMFEaALCyXOXE91OUBTLFKb94edDc
         9HQ512bn5AxhNTalrtJIN9dI1lJ7NONcVGkg9Ej29qgW9uuOfMkbRmtzgkesFkPzOTfd
         yEYZOg3YkRrVD6oSa6yZ3MMr0Yq0y0uq86C1q2Ppuj8cBrUsyKjR66+Q3PYaGnCkj+pn
         h1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774284508; x=1774889308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+rg6T95L3e6cdKRmvOpy6bF42FLdyllOf+gYk+r2to=;
        b=iEijlc0/yxP/CvXhLX5v67F4w2uauKV/snWOn3tIsYDesqdfkCh7mQlLSzuLVR4gJ9
         5CqN0kGSHQF74t/Ql/CqjkNAhGMTm+FRZQ118n1Qwj4+3gxBW3C+x54FJ2VM7A1eQA2I
         48GbM/eI6IC/VyfrPLo5hGsk6lD5kW9eTKWTYlbY/i+3pNedKJBln4YztuHEHONaPlzY
         G9+SwHpO13ToydnIoDIrNHAy4D/9LoCy+yLX0l5Qgm70NJRHOEFyhTbBFTR7FqgWdgvg
         F6nVzYzI1e/tOGyRw7Wy874tvksQV830CZklHT0nrIp77uLJjBc8T42BXHFlvLrGct9R
         F5cg==
X-Forwarded-Encrypted: i=1; AJvYcCX10lSws1zeJuvrCcptLy/YZ81A3KPSvhp/iG8Cd/az8/4zrYXUKoxktknPHOWRStXqfXcyNuYc6l+mN+7qkZVw@lists.infradead.org
X-Gm-Message-State: AOJu0YwTAJ6awX5f1r4Y7C+YvJckT7cshDgzoPWnnhOAqyUxYfnZw2HI
	Lj+YOSsYzDJ9RoFTGyDeGGxPP1+Vfb6ghky83BrNa781qmJnvbxaqXtKoiDaVDao8thZDJZToa1
	DIeYEPh/5n6+SK1/JylJ/eZgnno5TFgXAt4Dw2tRK9fa9yQ8p/jxRlggrwFBhwGVDD8hrD/iLWx
	ol0A==
X-Gm-Gg: ATEYQzxZOBS8IIU8vZ2DlMchkKga5k2D9s3uE1kLgZCP3rOJmQ/TTzwZwBXWCawHBcp
	auV9x6WOAnECLSoK0K7KbIF1VJshrnD69BM7CRokqQv4EUagc6k74AZdI5UOxche5QaidRKqdeX
	P58tSKMjxSO61zVSH1bbm42MON7bc1xZtJGmqitvEFkIO/726suwglpcNMA2pKi4VwEbnF1eIZu
	p+yDkUt8ul5yBOVkWYF4G9pkOqEk+TVzWCJcCAi9A/LApp54qaDIbwszDhLfkHT6802FyjJtNYB
	dsKsuDeS3/rvLH5u4Rq7EORfhm8LQr2LU602w5J7CV9desLvzu9oaOum8Ifj2VYroVn8qBYSBRM
	z6y7l9EnoqmG6RoAm57G5yD9XnwUeccBa2VHbxWp2GVGrrpQxZBoTj881H0qF8OsLwGZZDVOlD6
	QMSwDii9ohzRByctvF4rpCqCTUQsGzwR9akrU=
X-Received: by 2002:a05:622a:8c1b:b0:50b:277d:efc9 with SMTP id d75a77b69052e-50b374f5bd6mr176063161cf.39.1774284508187;
        Mon, 23 Mar 2026 09:48:28 -0700 (PDT)
X-Received: by 2002:a05:622a:8c1b:b0:50b:277d:efc9 with SMTP id d75a77b69052e-50b374f5bd6mr176062621cf.39.1774284507620;
        Mon, 23 Mar 2026 09:48:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf97594bdsm26711581fa.14.2026.03.23.09.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 09:48:25 -0700 (PDT)
Date: Mon, 23 Mar 2026 18:48:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 5/5] drm/msm/dsi: Add support for RGB101010 pixel
 format
Message-ID: <l7p6mczksd332pdxsn5lttnzxljux5fqupnmnetfdox5kriqpj@rolh7x5zdxxi>
References: <20260321-dsi-rgb101010-support-v4-0-eb28ecebbfe8@pm.me>
 <20260321-dsi-rgb101010-support-v4-5-eb28ecebbfe8@pm.me>
 <nmC5g-yqiyxWusbu6f0dZ0s7W-bqYdVUT0fIX9h1MsvYrAE521869Ei9NAKzwxbz30rvdYJCVjEWexnaUrAx_63G2DtM2mVUZthU1VRUbrg=@pm.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nmC5g-yqiyxWusbu6f0dZ0s7W-bqYdVUT0fIX9h1MsvYrAE521869Ei9NAKzwxbz30rvdYJCVjEWexnaUrAx_63G2DtM2mVUZthU1VRUbrg=@pm.me>
X-Authority-Analysis: v=2.4 cv=b+q/I9Gx c=1 sm=1 tr=0 ts=69c16edd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=qC_FGOx9AAAA:8
 a=lcybLqEkPtajXZbn_A8A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: DRqkj6Z2K8CZ5xhxh1juOGEYBQ0uxq78
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEyNSBTYWx0ZWRfXwE6s/o0g/iGw
 rX7H7O0Ig238jJWGVG3pyR3fIF5IWLnRxShBKwv+pEqdPtn7JJujcvengY4/PIVKGsJSGbd9bfk
 I0ZaJO4EoHkM7PGIV00ONjxrYa4XeNqjfcDd4GXMIZTc/3VzM5OD+2HEFgOaY5okYn1aJCeOiSK
 6qhoG7Lc9A9GZYNKSTPFhBBSR2iGIW7EHWdSZyQlri1jyMihhsEHlc3/hFn++2MnQlzBk/4oO6/
 1y/hSPVqp8s7I7jEDhCmT8rD7OHgvCaD7zZ4wRMt9zLbT7kDdRwFu/iIjRHv5G0HAEYt+p7/wpJ
 w03ZPzG1IB7/MUoC2bh/vhX1x1o8qzmjHq4wuhIYqwY+JmVgyGMR859Uf3TTY1bzbNCHwdNkS8o
 ax/sMJ9X6xSDuWJfIdHnrNB8KNJlQZv+oR7Of5qHrNEIJtvvKO29crw3mtE0Dgl8NliGdjsI6Lz
 muRjkBozutsUMUIKfHA==
X-Proofpoint-GUID: DRqkj6Z2K8CZ5xhxh1juOGEYBQ0uxq78
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_094830_311954_D0F133C9 
X-CRM114-Status: GOOD (  19.90  )
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

On Mon, Mar 23, 2026 at 03:28:59PM +0000, Alexander Koskovich wrote:
> On Saturday, March 21st, 2026 at 3:52 AM, Alexander Koskovich <akoskovich@pm.me> wrote:
> 
> >  
> > +	if (dsi->format == MIPI_DSI_FMT_RGB101010 &&
> > +	    !msm_dsi_host_version_geq(msm_host, MSM_DSI_VER_MAJOR_6G,
> > +				     MSM_DSI_6G_VER_MINOR_V2_1_0)) {
> > +		DRM_DEV_ERROR(&msm_host->pdev->dev,
> > +			      "RGB101010 not supported on this DSI controller\n");
> > +		return -EINVAL;
> > +	}
> > +
> >
> 
> Was tipped off to this bit downstream where if DSC is enabled and panel uses
> RGB101010, it overrides back to RGB888:
> https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/DISPLAY.LA.4.0.r2-10000-lanai.0/msm/dsi/dsi_display.c?ref_type=tags#L7209
> 
> Only does this if widebus isn't also enabled though. Should we do this as well
> upstream?

I'd suggest adding a bit fat warning here if widebus is not available,
add a comment about downstream switching to RGB888 and letting it land
this way. I'm more than sure that there would be some additional tricks
if one uses RGB101010 on SDM845 or SDM670, so it's better to let people
having those panels face the need to research those rather than making
them believe that the panels should work.

-- 
With best wishes
Dmitry

