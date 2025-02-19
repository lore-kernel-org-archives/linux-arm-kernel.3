Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81BABC021B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 18:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCXULtz+TfbEIUzv+aPcSIYu9fSixmaT70fYxAi2ec0=; b=M2xxlHfUA64Gg6GUmfBbQAEJX4
	wV1Pb/lsDvL0VgBP8VuttsXkLghQfnAQ9zXphNkexrY+2A75bxGZbwwyrXjbqjvQlmAXIFbNYbaoz
	BO4izoozZUR1bDyknEQQzUFPExBtnSfDpZQgOigAWmHVOXZGBevkepxRBeL76wegJzSgl/6C8otoG
	p0F+YQzuQKpj1d5+KcHsIb7qGkZXG92hZkv2KJS/ObDB4R+IHT/LwScIRZS0IQtWPkSiXMRDfqJ81
	vJMNiJxl98oKvjRbJP45yWSp7jCh114hRpdB7V3ess8dpLm050LOXl74UFxyR9wVTxyv9EZUxgLtX
	8UnfzuVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkp0T-0000000EQH2-2xTg;
	Wed, 19 Feb 2025 18:41:13 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tknsP-0000000E6EN-0GHX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 17:28:51 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-307d1ab59c6so41581fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 09:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739986127; x=1740590927; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zCXULtz+TfbEIUzv+aPcSIYu9fSixmaT70fYxAi2ec0=;
        b=puqp0oukjJnV3Pvc20/QMZzpcNyee2LrR7NwZqap6ea+tkmvwCER+Ey6Oe6oeMEWzQ
         bll1JxPSa5b2bVA3+KvuDX04njDMb2o3ZlUdTZLtlH1URBSr8WGUZZnnpFr4Qn29y4jl
         6eTD+Svz7fXBOfNRtH645X3jg0iJnyuvum5LFHQ+/Upqh4/5cSaPsEy0rsAvUb4hhKzB
         fazup3/B96Bva9Toc4B7kp3ZOfI4wrMKiWoOPvYPwonkDpueGmY5gXXe8QgpDhuik3fr
         ZSSRvmMPsDQTWg5fh6DT9f1/IGln1lgEaR+N3Yvr0NvQ0YxN/yhY52lep4EpGTC0NJHi
         YUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739986127; x=1740590927;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCXULtz+TfbEIUzv+aPcSIYu9fSixmaT70fYxAi2ec0=;
        b=R3AF3Ac+cotU3xaQhThVvQSyU8BrVrOtxQKlKYCi94Le/MlxOApJFjOQ/h/sxOIrxt
         B1zl4tW/nxg9SsLJmOs1DLzX9HDGWQ8qFaDmBtkacCVOkDypW/pe8zBuNYHyWEnJw3Pd
         KUqeHZhu3epTyXQvHJobgHxPYXpwCiPraXrAIMScu9+A6e/I8cfKdEfdnhwisvP8Kqfk
         ZelcU888urbDYQpquWuaP2+RvVtrywL8XbhShEfj0NM+PDaREnqeG395e/5blnqJ4jhc
         HGHurSrZcu0XQugXOoUvIFHQGw8gGatw9nUE10S7+CngXOp8mUI9Lj3miWDy2unWRBlL
         DVPw==
X-Forwarded-Encrypted: i=1; AJvYcCVphF85UR9D9OMNWwkoO3vPfaSOuLtC9/6lDFx3OmXZyq6YSt8uIh+TXvSIMALrrXRZbfLbzVQQQF5+MX9W/oXF@lists.infradead.org
X-Gm-Message-State: AOJu0YxthIjIHMmHn29ExN3U0JXq8de6Et+r4eY8Zeb0j6r4OhhzNITH
	ZYRhmtqx0HzklRExud+Ob0scHo9V/Y0YMHPKV55btT++abGcNUze3K8yRTehjds=
X-Gm-Gg: ASbGnctggcyqBZZWiez+dR7IjiAINCDC8AeiSKU29EC8bu0fyfhcTpMXXCTjIhPNJ7h
	yiBBTuMycsUY3Asi0kSZGjasTgGatDQo6HQj2axxvpS3rgoRkE/kUdNN3m3Yrx38yEm64+aXvOx
	2b855h9GYf/jdiOewnbJaZ/fR9qWCF7FJQQHnNcEHghExBI+L9CF5AlpjDcKrJo8ryHWN6mcFKi
	thmbEsX2hEesuFXjwr3UtjgKChGe5Ovt44OEXcD1JJt80tCFlv3Pc/48l8O/gCAq13/3yZFHnaC
	TWh2Q3Wduuhp0RRK15qw4ktqcHgWvQq/47XZJCrfO6VwzWJ3D5clSnp21u7o/g7YAD4PmoU=
X-Google-Smtp-Source: AGHT+IESuJWqXNXUiZl0M/R+WM8qXHx9smX+DwiL2S6QGonn1pTBFk2AxnVmvzXppPQRcAtEABXWIw==
X-Received: by 2002:a2e:9b0c:0:b0:309:20b4:b6d5 with SMTP id 38308e7fff4ca-30a4502608bmr15251471fa.28.1739986127105;
        Wed, 19 Feb 2025 09:28:47 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-309216aa863sm19168511fa.98.2025.02.19.09.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 09:28:45 -0800 (PST)
Date: Wed, 19 Feb 2025 19:28:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Vishal Sagar <vishal.sagar@amd.com>, Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Michal Simek <michal.simek@amd.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 06/11] drm/fourcc: Add DRM_FORMAT_XVUY2101010
Message-ID: <gkqq3c6pew5etfmjqqzgxtddlu7h3tbscrijkbymls524vfrrz@uy7qysfecrjk>
References: <20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com>
 <20250212-xilinx-formats-v3-6-90d0fe106995@ideasonboard.com>
 <bdpw2g65uor77tijlhpabodog7haqvdcemnr3wzqkooerzuib5@hfdn5zsrbkgg>
 <7674314f-d95a-433a-81d2-ca78bc199359@ideasonboard.com>
 <naw67daoyb2lfmq4jovlwanz5niaolptwnug3c3kkrtlfoh6dd@trkctqyzvtb5>
 <23e71045-1ae2-4e02-9780-aa11a338d481@ideasonboard.com>
 <20250219150840.GA31825@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219150840.GA31825@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_092849_104422_7FF2A987 
X-CRM114-Status: GOOD (  26.14  )
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

On Wed, Feb 19, 2025 at 05:08:40PM +0200, Laurent Pinchart wrote:
> On Wed, Feb 19, 2025 at 04:47:26PM +0200, Tomi Valkeinen wrote:
> > Hi,
> > 
> > On 18/02/2025 05:26, Dmitry Baryshkov wrote:
> > > On Mon, Feb 17, 2025 at 10:27:56PM +0200, Tomi Valkeinen wrote:
> > >> Hi,
> > >>
> > >> On 17/02/2025 22:15, Dmitry Baryshkov wrote:
> > >>> On Wed, Feb 12, 2025 at 04:56:10PM +0200, Tomi Valkeinen wrote:
> > >>>> Add XVUY2101010, a 10 bits per component YCbCr format in a 32 bit
> > >>>> container.
> > >>>
> > >>> Is there a more common name for this format? Otherwise googling for it
> > >>> reveals only your series.
> > >>
> > >> In the cover letter I mention the gstreamer names where available (this
> > >> particular format is not in gstreamer). AMD has these in their zynqmp
> > >> documentation (https://docs.amd.com/r/en-US/ug1085-zynq-ultrascale-trm/Video-Packer-Format).
> > >>
> > >> XVUY2101010 is YUV444_10BPC in AMD docs.
> > >>
> > >> X403 is Y444_10LE32 in gstreamer, and YV24_10BPC in AMD docs.
> > >>
> > >> I'm not sure you'll have much more luck googling with those names, though
> > >> =).
> > > 
> > > I'm asking, because include/uapi/drm/drm_fourcc.h has a pretty explicit
> > > waiver: GL, Vulkan or other open standards. Otherwise normal
> > > requirements apply and it's required to have an open-source usespace
> > > implementation, etc.
> > 
> > I can drop DRM_FORMAT_XVUY2101010 until we get it to gstreamer. I just 
> > had it ready, so I thought it's better to include it than leave out.
> > 
> > Is the current gstreamer support enough for the other formats to fulfill 
> > the userspace requirement?
> 
> We've received a green light in the past to add formats to drm_fourcc.h
> that would be used by cameras only. There's no open formal standard there, but
> we have libcamera as a de-facto standard. I would assume GStreamer to be
> enough for a scanout format.

Thanks for the clarification!

-- 
With best wishes
Dmitry

