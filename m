Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC30CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 18:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eF61zkZp9mMYxVggMMzwArKNA1z21l0hZQVBszHsT2g=; b=0PP6nziYE7qRGdjqOY8jwzI/US
	kT7+TNONYEGOvth40TK8mGcVj9ALannsntegykIS4X/IYLqEVzvbHnuFRXPrPCPdTpn/Kb2Smi1Oa
	SM2FnsdGTsZJ7YPDcnKcyO0jfMHFVfkzCctuQh+z4bYyk23xH1W83QGKrMNnMqytT18l/OL/APyhu
	VSJfVFb9/Q97tKOP5l+Rf09zlQ6Bxa2pa1J13GTPoLBmkOniyAJ1d9/JBxi1fDRwazKqTH5PmpCUl
	OhKakhNgEt8LEjGLbFl7zzbK2eaBgSNSyH5XJikd1f1BynIUPzVTGnPMzRuMW96PI4h/hjf+R6DY8
	cdshWtKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uubA1-00000003msM-15NX;
	Fri, 05 Sep 2025 18:27:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXPA-00000002HRY-1plA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 14:27:09 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5858Cqkr012146
	for <linux-arm-kernel@lists.infradead.org>; Fri, 5 Sep 2025 14:27:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eF61zkZp9mMYxVggMMzwArKN
	A1z21l0hZQVBszHsT2g=; b=F5vPBUQTBlKC7wn+jmgeXSyLos6dsnyMQncm+JVu
	4r31K2SfNeSKL8AE4GDWK6KuuJQ3CohKTgWA08ieqRKK/KfeX6oXYPsz6GKr1PS8
	xsylaqqlAAJ4PSyCGaPiJfVTAuz8DbfHuarGUxwMB67AfFDLKB7JUyQy9ZrG8CvO
	h2DoL4KmgSPDdrW2XnGUv1iDhE/wpi9B5aW8UdSEs2tvgr8wW6FjZI8C4Ak0SlYz
	H/iPBgeUqLrZJSUgvEimmNiN5sRt3FnCO0/40J6GlibJLiVRSt+uycsoGKwE1Ggc
	Xgvb8mLoVntLOI1qGVkZ/rg7Gxr29RFk/WPNQlITj9eq8Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48xmxj7qf9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 14:27:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b345aff439so56697831cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 07:27:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757082426; x=1757687226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eF61zkZp9mMYxVggMMzwArKNA1z21l0hZQVBszHsT2g=;
        b=XIpiNMQOKbLEAi/JB7QFrV5Du83Vui+ocuqzmmWoEWtdslOgLrWZemxP/VJGeFOcbf
         OnkTrzeilHIrgXcyVj9xm1oDqZ0AkxIQwtKcs2lpbS3WSHn9tGkpkgUkpNpJYFXN2gtv
         D9+rf5FvDFYHCXXucyCWcaN/s9QONmruWtPs7SzzX4RjOSjzGkDy3jA+DcCNuvx6OyRp
         ajYMzbsnVZEv1TqqblMb+nu8SkSAFjT7Rx0QafY4bHNvL/ebNSpV2V2GQMGWXvSgfBf8
         aVMQWql8IHg+r4B4kJP7PHxYJgnZgYujeFVzZO3wkCy/2UbJpRSnbPYseGR9RAeLqWal
         MGCA==
X-Forwarded-Encrypted: i=1; AJvYcCXpEQo+0/tB+ATHPHzreml17TP6RMytC/Ga8uEeYdthtqi/r7rkEa+lesBRWh9iQYKPSq4Azk0GqH6xWJbfzpUh@lists.infradead.org
X-Gm-Message-State: AOJu0YyGJUcLiDD+JYp3gnWHcmF39x8fdgyxro0E5INJtQZilm+77xVI
	o9nqBRglZYH6Njt7xIFaHeN/gpEUSfuTVtEGXLULJ37XlEcZhspP2VQJYOdNytH7ySU3yqt7WAs
	DRik/cS92l42QAAccWjUkNwTG2unb+WyCu5qjbw5+IjNpvYdTKHOSaT3jNVoGvREdvxsntLF/xy
	YHGQ==
X-Gm-Gg: ASbGncuSjexIzn2oSQ4yxMkTgobIIpgR39TCScIYnZzc7j96NvsCIN5lEpZPaQt8BmM
	XEvdU+TQ3Kuufz6vaHZrkUJYcoNFnOHYLwkhjqeXhBWeE/Bu8Z5UD7+xoRijQ0E4OkmrTikkg4U
	c+RhLmR9K+p6pklOvGyEo4PIL85mJGXoXKAe1o2zN1TasifKZST6rfM475iqIsOLETJc/a1facA
	GHz+bZmak2k6vWTVDWos3FOjYnucb1DgMHrhhygqT1t/6akmw/32NHnecxIJAwivBDLhNAOmR+f
	lRVmcAmEiGTOhr0Wa5Ee79euNMZTKnAyKw4pBunNBqvZIaW0YnkTKMeUspYTKP/ncoJTonY38tV
	f5Ol3BGS3fjj2/OtPJgP1mj48JZZy3ewcrYo97MfN5cndycKZL0Oa
X-Received: by 2002:a05:622a:1a89:b0:4b5:d739:627b with SMTP id d75a77b69052e-4b5d7396898mr89983011cf.76.1757082425961;
        Fri, 05 Sep 2025 07:27:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECmkBwlmY6UiEs6hcJX3488laXoD4oV0+tFPvFeEwoB/BLO8UPs9WqixuE8OIxKWAk1kYaYA==
X-Received: by 2002:a05:622a:1a89:b0:4b5:d739:627b with SMTP id d75a77b69052e-4b5d7396898mr89982311cf.76.1757082425175;
        Fri, 05 Sep 2025 07:27:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608acfc24fsm1802596e87.104.2025.09.05.07.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 07:27:04 -0700 (PDT)
Date: Fri, 5 Sep 2025 17:27:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, kernel@collabora.com,
        dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Algea Cao <algea.cao@rock-chips.com>,
        Derek Foreman <derek.foreman@collabora.com>,
        Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH v4 0/6] Add HDMI CEC support to Rockchip RK3588/RK3576
 SoCs
Message-ID: <zni6d5udvawma6kcjp54d24kihlue543dfqc2ti3k43jntaphj@xtuusmebp6qj>
References: <20250903-rk3588-hdmi-cec-v4-0-fa25163c4b08@collabora.com>
 <ncmsmxdcvhj4jec6wmqf5abrb7nijx7ac2i33tvvcc2prljez3@uks2cb6aunnx>
 <b8d068ef-d083-4bb1-b34e-b8ddaa62b436@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8d068ef-d083-4bb1-b34e-b8ddaa62b436@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDExNyBTYWx0ZWRfXyqBY3eCyhnqa
 OLCDDfevv6v/CNv2s/bm58lv/fd2l+Tsx6+0Un5UXwVb7FjAqkHpCGBsBMapc2Wq2c7GNrML4HH
 G27QE1UHcmCS1qqCfHAGRpuuWhq3Gi4B0YMZ3t3ZzXmbYpYQsX0Fjz8vRPwWzhaYZ3pHMB9ESeS
 LAW7dTW5Iq9ZXg3d9FenNpx5asJgxuIOUQZLKa3iq2xIIBuUmOJ1CICWRsamxUdAJskGWdzjHtn
 fcgZBg7imBu8V3spiGRhXMJyc3py7UpBH0s0fCJaPELPD22HpuzipBUIUsZkYo9kD+IsiR71XoH
 ZXCDMX/gY+7qmH2W8JjPHjUOMw2+gRJfWlNvVlzU/M5coVA6t5X1pdhYkmXPsvHkHwBtenu//AU
 iekdoEUW
X-Authority-Analysis: v=2.4 cv=a5cw9VSF c=1 sm=1 tr=0 ts=68baf33b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=QX4gbG5DAAAA:8 a=gdAa2DyRb25O423_gIoA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: Lw-fjEkGdSWYxa6RnRHiF4P1qeMWyNU9
X-Proofpoint-ORIG-GUID: Lw-fjEkGdSWYxa6RnRHiF4P1qeMWyNU9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509030117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_072708_477641_83BBBA81 
X-CRM114-Status: GOOD (  29.62  )
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

On Fri, Sep 05, 2025 at 09:32:36AM +0300, Cristian Ciocaltea wrote:
> Hi Dmitry,
> 
> On 9/5/25 2:48 AM, Dmitry Baryshkov wrote:
> > On Wed, Sep 03, 2025 at 09:50:58PM +0300, Cristian Ciocaltea wrote:
> >> The first patch in the series implements the CEC capability of the
> >> Synopsys DesignWare HDMI QP TX controller found in RK3588 & RK3576 Socs.
> >> This is based on the downstream code, but rewritten on top of the CEC
> >> helpers added recently to the DRM HDMI connector framework.
> >>
> >> The second patch is needed for RK3576 in order to fixup the timer base
> >> setup according to the actual reference clock rate, which differs
> >> slightly from RK3588.
> >>
> >> The following three patches setup platform data with the new information
> >> expected by the HDMI QP transmitter library, while improving the error
> >> handling in the probe path.
> >>
> >> Please note the CEC helpers were affected by a resource deallocation
> >> issue which could crash the kernel and freeze the system under certain
> >> test conditions.  This has been already fixed in v6.17-rc1 via commit
> >> 19920ab98e17 ("drm/display: hdmi-cec-helper: Fix adapter
> >> unregistration").
> >>
> >> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> > 
> > Cristian, I'm sorry for almost off-topic, but as you are working on this
> > driver: would it be possible to support HDMI (vendor-specific) and SPD
> > InfoFrames in the dw-hdmi-qp driver?
> 
> Sure, no worries.  I'll be on leave for the next two weeks, but I can handle
> it on my return.

Nice, thanks!

-- 
With best wishes
Dmitry

