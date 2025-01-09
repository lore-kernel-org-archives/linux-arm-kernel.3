Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564F7E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 12:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ISAvUvnxrJppDS2oaPXGBaXepNKXj9gL7beVEXrneoM=; b=E6KUXsGC9BbA3Cgbm1oNWTBL31
	fvftIFiRRmQqGaXlNwk412qTmfDUNsYixolaQHT8vNaaktWybdxtAKF5qJYEferE5jf8uW6Tqdl5U
	Im1EdeEZ/fWRb19z/Bi6GCtBQL/mEZ6S5LoEE49IhrEQ0K+PFhqlSV/VwKy+G91CcNFHagDv0OmvT
	nMh+ywCQ8XSoRfWVb0rGi2PqHvndYG2wDIuTG6AHN8iK0NKxeBKchurfWa4Rlpo2T2dIf5a2bBwcw
	wcxZbDTJCI9x/BNFI/Vk+Lt02AP6SUDcSMFbX2tHiOoHcYyftSrmtEYC529x8RvzFsr+DGf6qJBbM
	DqmfI7ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVrzt-0000000BuIf-2uah;
	Thu, 09 Jan 2025 12:50:49 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVryG-0000000Bu5i-2nC4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 12:49:09 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-53ffaaeeb76so949177e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 04:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736426947; x=1737031747; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ISAvUvnxrJppDS2oaPXGBaXepNKXj9gL7beVEXrneoM=;
        b=fh+O7RLLptM4IvOPmO33G50GflYx0VmLWVT8w2JDU3GecTSz1J/hIw+CGH2pPIBqAh
         jOVQiTvNjXBxWoUuQ7+BdIrJZAiA/32tVPiHnXKqA0G0DlqwFE7L61oJ00LsIc8QJuqs
         OhnsPBFAiV34ZghK3ugweWz5Luxk5xY2cdXpINO+jf9qtTxbTKEeMT34kxdXI6KOGWx9
         eQeKcae7BCQJJN8i4keFWJX0eg25ktMLMsRdAKZ7wNihEqkP9y+KMQmDPNCXo404NGKH
         p5D7UAzoirpa7IzgkG5odUO7OcgHatOB4/5axf/q5hN4BG2oWOBxWpXZmkYmqIPYJsdm
         qA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736426947; x=1737031747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISAvUvnxrJppDS2oaPXGBaXepNKXj9gL7beVEXrneoM=;
        b=lTd4zmXJC8yTmN1veopLhDSbTTvBfMS3XV37S1A35Qya837GfNvcGjZP4OnRU+8r/o
         sdFRunDAiMkAoLuta+Pq8Ee/CI4McyQZYW8NJOm4tDVv1pLW9ajiOFe4SC2JgWw/s/pG
         9B9hsWssC2GrCEQYtRw3LtmwI2MCO66Y9q72LDy/BxEQ/CGz33V0Orzc2gl0LR5k1zSp
         jfY6dOKNRkoYzQTCJxdDyrIumxNiBvWLlhtjzlQXSpSL/E17FNVQcTBCUZLmwxM0LdsU
         3pwQdsgeVfAmlcjXQBSj5KJBbc4XaXHCnZMTb9RB/9WJYgwOlt6uuRO7JvPWzyETMzck
         e/0w==
X-Forwarded-Encrypted: i=1; AJvYcCUmHN7D0fJ+KYtYyYuCLIPfD6rpNQCtq7d4WNcqQow4Y+TpnTQamj+u2AWKUpIWRmF9PY5zfJQaOOGJf86fAkYX@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1BJgJRFUjIMWAOB4kNQ1iKYBbcAv7//6jmH9UBRDPflkuTXjN
	0OQJvt40W/YHsrvzL2ovcofDio2XlABquYPVFktOMkQBW6gZx9tcEKEw+ofR3a0=
X-Gm-Gg: ASbGncswkUOItEA5RCrl4NMQNETXklgDF8WZeTSsRBvh6cQg+txIFJEptIXp7+QCxQi
	nL4BB+dGgG1Qnfx0w0rvJVhO5Xh3fc+WKZrpDSI39fP5zUhANVYreHv67DnGuc5i2npQY2n/GQQ
	AXpGwfPcFkthDrC23RLwcNXzsX3wfawt7fHt3clcGHkoxNZZRT8ESGZQMECCrQf0z/+JFAUlWmh
	OytuHKNI5tCqHEP9YmBO1rhz2adc00qtYxBYt6YY8LPJluuU78ZDJqSI1c2DHIkRi5QxpCx/lYK
	BdmP5A+G4jG4Lhfj3o1nv+sXk/fU9iHUHufk
X-Google-Smtp-Source: AGHT+IFtzPf5r/L8vL1E/ZArSF/N5lVRhLbGlgYJHuErJi9BwgLOD62Gve10/GJMoU02S8ksLbRDSg==
X-Received: by 2002:a05:6512:1281:b0:540:30df:b3ea with SMTP id 2adb3069b0e04-542845b972emr1634434e87.15.1736426946964;
        Thu, 09 Jan 2025 04:49:06 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be496c4sm193126e87.24.2025.01.09.04.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 04:49:05 -0800 (PST)
Date: Thu, 9 Jan 2025 14:49:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
	sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, l.stach@pengutronix.de, 
	andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
	kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v5 14/20] drm/bridge: analogix_dp: Add support for RK3588
Message-ID: <q522hpxpoxwierd3uwtijvnmaia5tec3gzazuzblhxeqgqgavy@d6yhljsiyvrn>
References: <20250109032725.1102465-1-damon.ding@rock-chips.com>
 <20250109032725.1102465-15-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109032725.1102465-15-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_044908_837101_C9B2374F 
X-CRM114-Status: GOOD (  14.19  )
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

On Thu, Jan 09, 2025 at 11:27:19AM +0800, Damon Ding wrote:
> Expand enum analogix_dp_devtype with RK3588_EDP, and add max_link_rate
> and max_lane_count configs for it.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 
> Changes in v5:
> - Add the RK3588_EDP related modification in analogix_dp.h
> - Move this commit above related commit on the Rockchip side
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 4 ++++
>  include/drm/bridge/analogix_dp.h                   | 3 ++-
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

