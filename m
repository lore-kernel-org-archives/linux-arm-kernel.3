Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA3DDC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 20:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MFIKZkaTfjlzWSNll4lqXgpcQhLW3KQ5qFxK5aL+7cU=; b=cr1sElFNbD8giSL1XP8Eke8pVW
	1WXWCAs0fwWkq86/0J9TJ7VvCwzlpmmQiz4fwGRJx9STxlNuH5AXQsQPKcIFpoMQ+ZfvnpWe43ziG
	AErffNGpshfFYafB6CBhqdL7aCz7GK9mo407hANFv/tByG7T0ypsPW4749DFGEh4WbocARpWwoYvu
	VvnAZTfyvNUerI6gAmxnndZgN1YXBU7Kssxkct/5jaYNMiBrFgoBT2YXQ++BdeZ2cgS7VZvmbQUOm
	M6/Mi1Y7kw7wHlOdjpqZZLYs1+4eD4FK5F4fvHWgjpRdmKuaQskRpaAPsNLpH3BlnMOSmMfpRgzwo
	PqACOO0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trk6p-00000003vci-3RAb;
	Mon, 10 Mar 2025 20:52:23 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trk5B-00000003vH5-2xUp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 20:50:42 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-30761be8fa8so52688061fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 13:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741639840; x=1742244640; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MFIKZkaTfjlzWSNll4lqXgpcQhLW3KQ5qFxK5aL+7cU=;
        b=oUdq9f3daE0NVmFRYIZdoCNhHTCrIawwu7njtv0Sy3+0xZ7UThKYX3alTVMdZZAdqu
         7ZZaQlXMDU7zbdVbrpaRlr3RYI+Q624AvURmq5nML5Ei6ANQAtmNjmDTWKUDe9mExqLd
         mExEgUc7IeiStFm5J9RrRHlB2DngDHXpWef+vJFVDxuA30/Krvnp1TLxjtNPdNtraiFm
         1+cpnhhqfiMITgYEcZRPF1z3r/6AnNRGc3Cw3kmKuZ4QYL/ZnWFva28lv/kPMsuwLIWx
         JhSANK1uOcYk+ilkwzmUJ1ijTTTFgFLFL0FyAvZBBWfW5Lnw6cLhRaxIIDpPtRq2Hjef
         eksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741639840; x=1742244640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MFIKZkaTfjlzWSNll4lqXgpcQhLW3KQ5qFxK5aL+7cU=;
        b=gSqfx2C1Ed7Dx8ykm/calZS28EfrtZhoXbJCl9g9O2qqnYhbRYxIK+Uxg2eGtoJ7lF
         nxNUpJzeYVbT4Zm+FxKo3SFP+WXuU1yUZLrXz8HXW22KZ5HuooP6vQYTlKoZFscr2Tsh
         4DY6ImGq8xrK3Neymdym+R4mb9ZkcrJLHfhWg50V7HDO9+6w5nMpzqqV4St+2WZRxK3L
         3s+K2XmLeZ3VkrQWlg4v04jAqnlJwSwubJoVk9DqeSF+eHbBA9fb9TqdxIQPIfKyPDxp
         MMnQ7NN/S0INL/AkSKa03MDWGKYKXP0sas0Qg8MYlXZLpewv1w21srmBef+2JGXAqGuD
         MdJA==
X-Forwarded-Encrypted: i=1; AJvYcCVMUqUjhALN+BisEEAXHgEAU7m5ujVwgTQvvOcRv4ESVueI4FZSOQBbU3LmQbnn+6PE4ncwdJ6Ks8W2lh0D0Wqr@lists.infradead.org
X-Gm-Message-State: AOJu0YyvEup+ct9Aor1Qj1G1w6TargqqDy4L0U1OTNu5PSQpeKyyGZG7
	afzB2uPAg43u4fWez1bgwGYSW0KmrHFDfZu9NERY9QGOxOtQwd3t3wTeVdTdU8M=
X-Gm-Gg: ASbGncuzj2u1qABgHGWiPrfrmQ6x+gsDlkc0/+AA5uegNMCYAiCJXOK+sVdHffwKlyC
	sI//CVQCMlC6pSHo06RbbWfg3lulbnftcPkmhqSFooHBotAAwXU/bV9RaFaNtKn0oeG10eviV5/
	eoipsUkV08yuSFcAa6fQwTZUhaw6ihiLR5kG5y2akl6YoJKf1y8DrzwVF/qDoyVGD6GaCjDDc66
	CRVHgvN9KRkwByCT1ArzpVpl7EGPli38YwpNtpvjIPe5EoqJbmeEXWqfIZSWsLXp54csFLciOGS
	a7PwAuPa3pmutEHr8GW/usLzMzQkKySPDh2D5HWjc1qvnFvXrbVoNeS3N49qepmcOl50FYGU4d3
	TjlR7Zum0q6oHF8ksBTTokyXl
X-Google-Smtp-Source: AGHT+IGcrlELrZBnhqzie4iDaP6avVfnzS9Zwuy/y5VMLk7WTqgSbAIjxpbHVS4pswFb2Tc4oA719A==
X-Received: by 2002:a2e:bc27:0:b0:30b:bb45:6616 with SMTP id 38308e7fff4ca-30bf45e2500mr50729081fa.29.1741639839816;
        Mon, 10 Mar 2025 13:50:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498ff85e23sm1362140e87.225.2025.03.10.13.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 13:50:38 -0700 (PDT)
Date: Mon, 10 Mar 2025 22:50:35 +0200
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
Subject: Re: [PATCH v8 07/13] drm/bridge: analogix_dp: Add support for
 &drm_dp_aux.wait_hpd_asserted()
Message-ID: <gnwqnapqlc7bym2nd55oif5lxxiibeme22upepbrgafilpcxxn@py5j7ju4rac3>
References: <20250310104114.2608063-1-damon.ding@rock-chips.com>
 <20250310104114.2608063-8-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310104114.2608063-8-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_135041_753610_4D7C0D13 
X-CRM114-Status: GOOD (  10.90  )
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

On Mon, Mar 10, 2025 at 06:41:08PM +0800, Damon Ding wrote:
> Add analogix_dpaux_wait_hpd_asserted() to help confirm the HPD state
> before doing AUX transfers.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

