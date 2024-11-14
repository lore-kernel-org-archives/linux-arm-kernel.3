Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201ABD68B19
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 13:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Spz/FLEs6rhZtrhf3mKJTQa4j7O7N/nH4uWZ4nNC+/E=; b=zCD4X1EPogJf8+q+REgsdNWDQj
	xDfBcQhQxwi00VF6TGLbWltlxbOoLqtHjcSSFvOp6RhY7ulvPQpgdyzbKGrn+PgGSI2zoOqAQhoZk
	B/Xa7YteTQ7MYNQMwhI673laFhqP3TJzaCtYFIhc8sfA94fAEWcD9h3mn/fzOmx93UDowvwMofWhW
	cDcaM8uy4Wu++eJvr7ppuAuF2poMSzjQplzs7USJpEudRC6hAKUe/tCTt/h6nlBHEp72IfG/AoraV
	KcdMpkvpQ6diIDLBvDIQC8Ngr3m0o6FXQY1zuuNS7rn2jKixTyo/v/hcZVrAgb5oHhNRffDb74NQq
	v0iHmTmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBaHI-0000000A7HB-2P8H;
	Thu, 14 Nov 2024 13:52:56 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBa6Q-0000000A5pG-1mw4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 13:41:44 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-e381bfce6a4so349364276.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 05:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731591701; x=1732196501; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Spz/FLEs6rhZtrhf3mKJTQa4j7O7N/nH4uWZ4nNC+/E=;
        b=NnLJ5R22uAoHowPb5uy6OFfFr+ChqxKlq61oBCaIBp9iTrF19ge2MjjSCNLNT4xcVd
         czl6p6BgrqJH3qNaPt4koLVz+a+osRs8aO47t4VNpcNy+5Vem7FVg3obmJI1+ZbUcYmb
         DtgAaJPErei6d282zkyIf29TJ9b3t98TNuZrtH8FMOx6n2hMas+vpYm2WWmk3wa6mFU7
         LmrdjJXETgxQBRDztyeQApR/KTe/LBt2lWPXl04PwuJDfggL8mYHY7zvyibg40N168mt
         QH+iXeG597YJswj++14nHAAmXkFGUSqYskLaqCncNIAR21XNT19WjDwDK6Yx3HDf/5Q1
         c7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731591701; x=1732196501;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Spz/FLEs6rhZtrhf3mKJTQa4j7O7N/nH4uWZ4nNC+/E=;
        b=JZL/IWhXH73KoUlLNKMySKdWFJVmYn6EMvuCKsK0yK0lLPj7YFOKiWxG9Ca8RgpFV0
         2EUkEA/yFrVqeOgfvXqKW7DnZKJeYXDW7LSSkWFHbIfm8Ra13uvbHOy/pKdMB8HweBHX
         kKwo8pGyLZcLuYv2m8Su3USw1gqxJyiSf0dzzirNvWxjAMMZrwzaMpy7GBJKBtWbGEAF
         r4A3MBXhqReya3hv5AUgYChwQQ32DCxdylTC9yRSu570R+2nEvn1ZdCVq013mJPviumt
         spX61gpxAogdVFBxOtVc0ALQ8u1wu7ghH3T2CHuZ9UAYpeVfFPLuPXO58Lin61vjFKcR
         ilUw==
X-Forwarded-Encrypted: i=1; AJvYcCWVxVvP2P4FaQGYaKOJT0R4ti2oNFz5s0xau6PXuar60Amsy3m13SjpzexMW1wNXBdsWvQIrD1Xg+CCAO+DDPzb@lists.infradead.org
X-Gm-Message-State: AOJu0YxOsWkyhUrA0iZu9xWZa9VVVrjW7MO/k79Q7gd1/lrm/NvqDn6P
	vdOVpZLniI9iD4ju8QiETxHNHpqQ2Ccoq6H48XnDkb8DlaDHHmZu9SO5dehpG2H8x0rAX5VBfUm
	185v+uonPW/QM45HQpNxoNU8q60OyTSsiSZumJw==
X-Google-Smtp-Source: AGHT+IE9OBhWPTuVNohC5WRAGntCMa66vHJnC0GsF9hH0ovM6xYCWXHrFVChjjSq9tv9jWS0r9j8CiJ3oX8Geq2uOGI=
X-Received: by 2002:a05:6902:2c02:b0:e38:1364:7075 with SMTP id
 3f1490d57ef6-e381364718fmr1343941276.29.1731591700646; Thu, 14 Nov 2024
 05:41:40 -0800 (PST)
MIME-Version: 1.0
References: <20241113-add-display-support-for-qcs615-platform-v2-0-2873eb6fb869@quicinc.com>
 <20241113-add-display-support-for-qcs615-platform-v2-6-2873eb6fb869@quicinc.com>
 <404f006b-46e5-44db-9f22-ec2139468ecc@oss.qualcomm.com>
In-Reply-To: <404f006b-46e5-44db-9f22-ec2139468ecc@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Nov 2024 15:41:29 +0200
Message-ID: <CAA8EJpqQSp5eXoKHHEchKpGq9ZpU0k0RDASA8T+t+SENNx+_fQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] drm/msm/dsi: Add support for QCS615
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Fange Zhang <quic_fangez@quicinc.com>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
	Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_054142_501672_EEE698DF 
X-CRM114-Status: GOOD (  17.65  )
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

On Thu, 14 Nov 2024 at 15:32, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 13.11.2024 12:51 PM, Fange Zhang wrote:
> > From: Li Liu <quic_lliu6@quicinc.com>
> >
> > Add support for DSI 2.3.1 (block used on QCS615).
> > Add phy configuration for QCS615
> >
> > Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> > Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi_cfg.c          | 17 +++++++++++++++++
> >  drivers/gpu/drm/msm/dsi/dsi_cfg.h          |  1 +
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 ++
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  1 +
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 21 +++++++++++++++++++++
> >  5 files changed, 42 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> > index 10ba7d153d1cfc9015f527c911c4658558f6e29e..edbe50305d6e85fb615afa41f3b0db664d2f4413 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> > @@ -221,6 +221,21 @@ static const struct msm_dsi_config sc7280_dsi_cfg = {
> >       },
> >  };
> >
> > +static const struct regulator_bulk_data qcs615_dsi_regulators[] = {
> > +     { .supply = "vdda", .init_load_uA = 21800 },
> > +};
>
> I believe refgen is also present here and you can reuse dsi_v2_4_regulators

This was in feedback for v1... And the patch should be further split,
having DSI and PHY parts separately.

-- 
With best wishes
Dmitry

