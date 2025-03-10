Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3996CC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 20:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kxNF8e48hf51wGrFc06CsODYSc9fXYwI5IwZer2AB2U=; b=uS+lI/ARyhiSufwqDpGSPIMB+D
	JASu/Fj6p9LsIOPUFKUVl6uKFqHQVgL5zDB8at/WfnVVtIn5X6F9AakWs1oO5CmMrisk73KmmFmvt
	VBfAWVwIpXsaoFjK5QZfj+9xWEoM1MRrXMkwzaVx00+8IY5++vUwcaoV8C/bvTv+BIaZxbI37ie76
	CFuONsmiTehB/Tor1C2+I3IOr9LEXCygUIo7Uaed4sL2jKLti66O7nvrwj/qp0liox4d2gPvxm6lt
	EklxQqtxZ1UYYhqAgGZ0p3gXPlvZUF44mNeNLbDRnWqh6e83Tq19+p0xbHXhKocFBFEUfuYz/2aVf
	qZaibjPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trk8R-00000003vzH-3myt;
	Mon, 10 Mar 2025 20:54:03 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trk5n-00000003vOC-0Dj5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 20:51:20 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-307325f2436so48184401fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 13:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741639877; x=1742244677; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kxNF8e48hf51wGrFc06CsODYSc9fXYwI5IwZer2AB2U=;
        b=Rg1nkVXIqHPLHuo++bcuFZ3FDt0O9t+vBFK9q/gvQW0msVoVRrXTsQs104216WZVLt
         RxGiJzcrpHf5vaALiPgcxGlT2zPcwajTyZRUMCHseEfTLp4XGCy1eLCytAfKZJzMAeCv
         qTcIffUoMZUCSElHLsYB+ryiVpwpgG6dc+SJF5Wo684LLcDKe/94j/zYMCjK6qGuJnGD
         XOlQU9L86rS8PqL7R5m+Qgd5vU/a24j5m/N/wucavqTeZaw6qGXzjQKM9jvExqDXOvaT
         HZ+/Gd6SDJLAdj34XJAxxgWh6yaDDNIn0OiWers9KM1oDzTj/oIUHKlbHExk/Jxpb0nw
         iIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741639877; x=1742244677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kxNF8e48hf51wGrFc06CsODYSc9fXYwI5IwZer2AB2U=;
        b=rvHRyHCn+WrUzYJ89VxIZXnOqpB0Hq217ezqjkvqv7L0C4IpCFT6aWSiU798Xb5isR
         25+Swhn6Qh4mmVH5Naz59d2qU+4UllrI2PNCVVyfRVN9ASHK5WxzRJxcBrtO9T5UpoVU
         fDDPMH/94/giP5omzi17bCZdv1bIaFAOBXanMtZo/UHehwW0eRCXC/uFD9UdDM3oaJYw
         CxPBfqDV/k3FDYabAxutfpWQwdszRYuhlJYuK9F1yU2E5fNGn4g/N8mWB6Dok6hbsvYy
         7j+UbMAilbfvgDBuJGivvJehTZQP14OdMvGBKSrTT4pYiJDSmoTrc/Ooq7Uqc0wCdJDb
         YeCw==
X-Forwarded-Encrypted: i=1; AJvYcCW27KdhHBE4I1t9FGkBHAwdl6QdczNBgnHzUrg1gxdlIQeVbJc3rM5o3PotvjlTi8Witgt2i1UanUKSvHhiwBUY@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7RxkOETjAbwQL8RQS8xoO7q/ANDDUqNT75nJ1YEOigIjXFSS4
	ov16d7PTfegshA3rZ2+7EOVsW5SIN14YkpR8Fj6oiuZNt3MMMR8Ss5BXsvCL40I=
X-Gm-Gg: ASbGncto3tSdvlZca+wPASL9Q6N2lPOy3QbYhoK0+uHqb00Dko3m0fa9cxmBvbmvhDP
	CVR9V07S/B3AhpEcQ7THVsEzV++3saxjOuPLV2I8cJ7wPA0i1y2r4bEiK7Ag9g0mHI3kCKjG5OT
	yfbaAYXyrN3KN5thO68y5zglJM8MQr5/ZvSfSp0V4Ror/ht46N8WynWrVtxDmbQ9+kmZaFTfdte
	LikPPcZ8ldBAPR8/cGyUrn0jO1jWRawtQo2LuTz0DwFXDNu1+MoprslaWdW+k6qtOLbyov4tbuN
	7xMObtLWBLmthL/hml/vJ2zBIpQaKiiVWih7NLwd+4z+OR5fnNH/5QspNFmJCLSqkfV3N69bGaM
	td8jdQ9dx4i1jLtvxsGuQfj1P
X-Google-Smtp-Source: AGHT+IFPbDF/2E9yu0QkgjYjNcSbSQMHb9SKSyVgCW0jWJzt0rN/zgSyXWNMQzVNMXXx8FaEgf2kjw==
X-Received: by 2002:a2e:81a:0:b0:30c:12b8:fb76 with SMTP id 38308e7fff4ca-30c12b90187mr13907201fa.15.1741639877485;
        Mon, 10 Mar 2025 13:51:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30be99e81cbsm17438501fa.93.2025.03.10.13.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 13:51:16 -0700 (PDT)
Date: Mon, 10 Mar 2025 22:51:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, andy.yan@rock-chips.com, hjc@rock-chips.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, dianders@chromium.org, 
	sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, boris.brezillon@collabora.com, 
	l.stach@pengutronix.de, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 06/13] drm/bridge: analogix_dp: Add support to get
 panel from the DP AUX bus
Message-ID: <mz7qmjokw4b3zk4y2u45ykzgtgqpsu6f53pflhqodyjd6svvvk@7jzggqezbubl>
References: <20250310104114.2608063-1-damon.ding@rock-chips.com>
 <20250310104114.2608063-7-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310104114.2608063-7-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_135119_095440_7C353BF1 
X-CRM114-Status: GOOD (  10.87  )
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

On Mon, Mar 10, 2025 at 06:41:07PM +0800, Damon Ding wrote:
> The main modification is moving the DP AUX initialization from function
> analogix_dp_bind() to analogix_dp_probe(). In order to get the EDID of
> eDP panel during probing, it is also needed to advance PM operations to
> ensure that eDP controller and phy are prepared for AUX transmission.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

