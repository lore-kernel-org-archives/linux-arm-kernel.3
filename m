Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33377E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Dec 2024 04:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kmRmow4ij1wj8NxR26ZZrxr/RgEq3MZKXl2c41wGPBg=; b=JbwmvQciWk5NPxHs83PTMlAKRg
	BWU79OsTvoCGwZ5yIs03HH4dX5JMid8EXpkj7rbAWzloJFdGccNgyB2PQUNCu1ty08RE8Yi86Rd8Q
	JROUDxPOn8pjNV/H7bnOsFxu7P5W9NfFlSkDZcYiDemZ7uxTW4GQIcKA6ujPfcJ1mNhQjvaGqyKEl
	djMzej+agn9KJaTum7RP6kom0T8QdJNElHa7dPDoq6fnob+fVSwX99vm1dSjOc1t7Budl0RB0XsdW
	1yixOFK+o84e7nk5Vhu4/Zm0zBA8PsCKA6RM/Wh5GPP3q2DAZ4OqcCPq9UEQJAHkM52U7OJQUsmYF
	s/DpQnwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRlFJ-00000002qXE-1cyk;
	Sun, 29 Dec 2024 04:49:45 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRlE7-00000002qPV-23xc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Dec 2024 04:48:32 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-30229d5b229so87625811fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Dec 2024 20:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735447709; x=1736052509; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kmRmow4ij1wj8NxR26ZZrxr/RgEq3MZKXl2c41wGPBg=;
        b=df5sXKv5EdBX0Wm49waYUMeoAbPe+IezdV6BWlbD7OX6I0BT5IdKdnUD522SXkH12t
         MEVaZFE3LCLEMHEKaX2lEcKXqg9ZsovEg1V6ULI3Y+a1LgxKK7D0q4RuIusoN9DbF3eC
         tf3GMfYdG2FoBV295MHS/VzHSuGPItGDQfss9P1rKOfC8nlA5AyjnNFFZDqtnaz8y71e
         cFcs8AQEBh9UR+tUqGoGSZ67MTZfKj/UfeIjWB1j5JPHsB238PIJdVKDYYA3FTNX+U9E
         bDlIDXO8QUg4J+Ja6ZjN9ycTCCkPlqYTIrs3NneqRTd3U2bu4eWEjMrQ6IZFz6mlxlS6
         Az8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735447709; x=1736052509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kmRmow4ij1wj8NxR26ZZrxr/RgEq3MZKXl2c41wGPBg=;
        b=qPRpjNNxZgWM3uJ2jkBwkrpHXP0EU4Zt7fKj0qQJj48uPNpkCgbU61cJCH0jZSz6Wz
         4MGeqVYP64qu8F7Lja3KOIeAxaplLU3x01daFvWUcsOqjPrOz9HQEdAQimChSNB2BdWz
         EiviuYyMYdsVDLd0yhrxOM+EuzbumKg8qR6eSldRm3n8A+eLG8ipUVGPPvbXHOFnSLMc
         IxHGaPBMb/adq33/SjpAfUykTp7IUbygIPjXxDkQEY7ihvphJg6+e+ljXjQVjK6TZQS6
         fitBtnKXYgoBKkDg44D7jJJqaMZQflZmKAKO1vgOGtSayvlnBKrqgAdTxu0IhpER2v5o
         qjOQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+E7Mvm0Cbbi1FzKRrnKawTTdhFxPqixgzw/2DmawIUs8Qq0rIsupz7HwSXeB/C5KE+ouJsfUrKcUlDf30Tnju@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8cAFRAOnPeOCT1bxuksJliuL13zG3g78oVBC/b+lO7y/U7Ze6
	qwuVnC1TqqOtoGMbUkhwHM+H7zm23fk28iwUrOY4vB8BA39tNqVl5oYi4W6RVsY=
X-Gm-Gg: ASbGncs/Edz8NSGmj6mBu9weJ3dCHYmTzGL22P0McRkAnvB5ircBoTnmYFvViery5jc
	MqJrmdfXnWmBg3GCBBTezSCPWaLL2lFzCrsXRZDUAwWHuaBY3P1L11IT9CXn1Xn7fIwF9G+IXlz
	YbyCIPfKLD8bntpGT9ghDNohhn6lFxVIpZcM700WqCNcuIyJRmZXgGY8OfZ5K1XpI5aG5WVHfhr
	HQ0DeGYyYgIlw8/Gsz/IRMzom7N85ZKB7auxEznjS5QTqhf8Fb42YZnFHPxmBQaYg4hieGDm9T1
	vWNiZZl9q3khMnJP0fMmLAtphNj5YaNvD6MO
X-Google-Smtp-Source: AGHT+IFLdOShLFUrgmFocbWkVBhAX2agF1zyEDdRzkJIIIUTfHxFHK7o41L90uicbnh2u3edwxhOVQ==
X-Received: by 2002:a05:651c:50a:b0:300:3a15:8f2a with SMTP id 38308e7fff4ca-30468503587mr106112501fa.2.1735447709482;
        Sat, 28 Dec 2024 20:48:29 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045adac821sm30924381fa.59.2024.12.28.20.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 20:48:28 -0800 (PST)
Date: Sun, 29 Dec 2024 06:48:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
	sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, l.stach@pengutronix.de, 
	andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
	kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 09/17] drm/bridge: analogix_dp: Add support for phy
 configuration.
Message-ID: <nqbcp4wwvzxh7qpvlobt3mw7clj22bmq72xsaw7sbzfj3dpyll@u5mq5ciijse2>
References: <20241226063313.3267515-1-damon.ding@rock-chips.com>
 <20241226063313.3267515-10-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226063313.3267515-10-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241228_204831_526783_EF9235EC 
X-CRM114-Status: GOOD (  12.78  )
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

On Thu, Dec 26, 2024 at 02:33:05PM +0800, Damon Ding wrote:
> Add support to configurate link rate, lane count, voltage swing and
> pre-emphasis with phy_configure(). It is helpful in application scenarios
> where analogix controller is mixed with the phy of other vendors.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 
> Changes in v2:
> - remove needless assignments for phy_configure()
> - remove unnecessary changes for phy_power_on()/phy_power_off()
> 
> Changes in v4:
> - remove unnecessary &phy_configure_opts_dp.lanes assignments in
>   analogix_dp_set_link_bandwidth()
> - remove needless &phy_configure_opts_dp.lanes and
>   &phy_configure_opts_dp.link_rate assignments in
>   analogix_dp_set_lane_link_training()
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    |  1 +
>  .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 52 +++++++++++++++++++
>  2 files changed, 53 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

