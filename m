Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DFBD78768
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 10:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ozG0xW+TN6Pi4dywPncHsCDjL+EQbVR/bZYS04g6N7o=; b=4N8+mXdku0M33MSa/E+l6KtuWU
	TGlG3ZlQtf+RMKsNOio2R+ginG8CFM6TNC6O4VOMMCIHwK5ZpAWq3TtmMB9uIFKbcYjlcldfBypDW
	Ad23mCErhn6jOa143mn84JemChRyoqrtdoa5qQynk/fP/dEBbfz9uyVYWrX5lDQ8sInL3EgpAvnbr
	0KJkGzFF0tc8gRECa2IyQ358Q+HojKRvib8WgRVLXlYIXYqB5LwIOGsV0AhCo/x3ji7GpoQqeCE4a
	pyXiwyTTcHSzMiPb1WMA8t8lc1FigI+ilzvilCDynCUibYAe0Rb4NmRrzozOY45+25IXP5HVCYR5o
	zV0SpC7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEQmv-00000002EjU-3vHs;
	Fri, 22 Nov 2024 10:21:21 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEQau-00000002Cm1-2CoJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 10:08:57 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2ff976ab0edso20529131fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 02:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732270134; x=1732874934; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ozG0xW+TN6Pi4dywPncHsCDjL+EQbVR/bZYS04g6N7o=;
        b=MUS9B6yvlxHyBj0HWIyY+Hkfz2KjK4K8wjg6YACdy6Z3MCid0ugz1FPvDOdIhT+/+3
         Gv2ya0ZeiagP0JapN5jClbs8W8KOVsia7TRamG8+xOsgMUvwEYkZC4vFIRVcTkLxU9tm
         gp6aokYgePTGR72Wl7PuUjqC63bXauuXIr3XYPZSF+RnPXF9x334iThE403nH1NIv/aO
         v+ebru0tO7McwEd5fZsfEs2bIdVrDg9m/mOPr4T1G9l+KL2Z/LfiQRsdyDbjb8PbCtmE
         rWuydpknWZ7h46GSYalefen9xx8dRpVk/sLzCh1Et1hsNHO4k6Ahb6fqk1Fe9wmMPcJC
         irFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732270134; x=1732874934;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ozG0xW+TN6Pi4dywPncHsCDjL+EQbVR/bZYS04g6N7o=;
        b=Rm8LnoZWZq24OP6g/FSk+1dKWyp2VXLNN98kiBJmrbddtHRgts8T6oIt6t0MOMtxYw
         m7ieksM/EMDYec3vr6O5Tjuhmj83QxHYKrcipj7dMfK+awz33jlKi5gskfNtr9cDR5xJ
         1Uz7giI4hQxtCklKGyFH0qHrLU1f4QZ8iB96LH1vOH5sFreMzu/MMCGrFIE5OBPOWn4d
         6MIG6C3K5aUOgxERr7SlKjJ4N8CE26kTNYdvuTnQYheM+3Gxa4qpMXT71SP8/IEFUY2q
         ffC9g6EmvS8Wvi2zztij0L4TG44GbFqK3o4T7Uqxri9bFzS+wTmN8hjzIGNvZ6OtP41d
         1fRA==
X-Forwarded-Encrypted: i=1; AJvYcCU5SIo6p6WhgLehCNE0KhDBbQO4NgLup4xSoaBK+O9Noe0OpvbalYD1nuI/T1UrzeFmennyYsIEwqB0bNiH5gfH@lists.infradead.org
X-Gm-Message-State: AOJu0YyZB+BA1mui+xZDx6srKpDjV4FvRnB9OsZgiEfE2OnHrzUst91S
	58dHsiX7Uub+9CxuCTo5qEvE38eSflKtjIlypzjZQwguhJ+doFz0yprM2rRqTjk=
X-Gm-Gg: ASbGnctcxP0cjrra/vnGIIDqVF1CAP41DpRX8TyJvNHxTGiuLJgaMngQYqWWQo+Tuou
	aVAvsgPtEaYkhGE2V5BfscVYiVVGuQnBZ2PyZgezXy0Co/ThpZneye9gIMyGLl0cD/3I2X0ab43
	+LCWq8CYL+i6Ba3FpNgZnSnzuVpiPaRAaAZ3xrUeXSBZWxLLG3znRghrTkLxHaW/OMYFeVgN41T
	tMDIDGN4ihc1fUDUBIlGs3B7ytMviyX6c1XJ9u1C2Ds/v4nbXD69pG/ABGVKZBbPIdaUSLyAtLv
	d+5zLT4adqZXjKMMFAnIfYyM3fFI6Q==
X-Google-Smtp-Source: AGHT+IF1XEF/8Gyn2P+dzKuFrYGukbKDM9XOQg3PsZRAmJKFMQcRvEJoruUPypP/45RqggGEEbK2gw==
X-Received: by 2002:a2e:80ce:0:b0:2ff:a8e9:a64a with SMTP id 38308e7fff4ca-2ffa8e9a6e6mr6070311fa.6.1732270134081;
        Fri, 22 Nov 2024 02:08:54 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffa4d58592sm2762491fa.68.2024.11.22.02.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 02:08:53 -0800 (PST)
Date: Fri, 22 Nov 2024 12:08:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
	Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 6/9] drm/msm/dsi: Add dsi phy support for SM6150
Message-ID: <nwgfas7oxaumusdeoaheph6rj535szahfkfnbmv55y3nhhmf5p@3gg3ddjgaysr>
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
 <20241122-add-display-support-for-qcs615-platform-v3-6-35252e3a51fe@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122-add-display-support-for-qcs615-platform-v3-6-35252e3a51fe@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_020856_563111_A958C8A9 
X-CRM114-Status: GOOD (  12.36  )
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

On Fri, Nov 22, 2024 at 05:56:49PM +0800, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Add phy configuration for SM6150
> 
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 ++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 21 +++++++++++++++++++++
>  3 files changed, 24 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

