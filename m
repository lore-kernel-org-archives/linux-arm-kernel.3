Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BDC5CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 08:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jh2My/4PVMTyrzVKY1/X4qz5ahSG+REoamijQn1whwA=; b=cPxhtxbT4WhoKkCwUPLeJ6zvjp
	iqbx5FKEnLlGXLpE7y8Y+E/fjcwc8V4gbchmaOrFGFlZ9UpOOyRiI2kSyeb327RkzPgwUByrXpCvJ
	DGI9IBYordDgApEDYT8gCQDf0LJHrnJqYlJ09paPHukRYhWlYofvZW3vpW5Djq7dJ1+lni67lUB8i
	5CmXY8b6M19iwvEvoK6p95CRjz7VksBEqJKcV7YdoyVaRJl53rImKVcU9JyBTNdTf4ah6MCaNusfp
	fAs7BiKJu+jaCOO1dXNCfSUlAabOAqmE6fhJm3CCbf0jpVg5s5lXstrFbX1idDrE5BCXUK/jAtB8c
	eAMlT9+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS9Nt-00000003WbE-0gUz;
	Wed, 27 May 2026 08:13:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS9Nr-00000003Wb1-26Zq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 08:12:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EE4FB600AB
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 08:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A483B1F00A3A
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 08:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779869578;
	bh=Jh2My/4PVMTyrzVKY1/X4qz5ahSG+REoamijQn1whwA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=ftnF4fhA2HYjSyeCQJmmgUYVt46QoseJlLvYe+tEnTi7PAsGwi0RWsDOnTfzClziT
	 KiGjm4SaKCfHKKmP/tCYIxyzbZvP4k+QzOviAWYc+yaCFG9AfrCXYFmWI3lP3SKwDr
	 UyzRbk7VDJCOwRH1U98M4fPz5r9Be8bhLWHyXJyBWvj1UNy1WnLa4Db8VI0NU6Lzfq
	 c8n+/6ZTBriwDTG5tb8MbnSlhDKwBbi0GDPer8vRbpwPID8TVJ2BrWiQ5to0Re6iOy
	 SnTmy+jimZigEJmksEekHzqkyp0YdlR0k35KqzviVfG7b0xYX4z44awmrQ8g/Tfs5+
	 /0ANeRFXELnEA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-392445f11c5so116649531fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 01:12:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9A2azm1IKe9bwRFN8RambjSxrS1XjCCKLW3PnrYH1t4O2xkhOkf/fZTB6yXdKsznFq3jBTFkDvOYkpD0mBI+re@lists.infradead.org
X-Gm-Message-State: AOJu0YwAOK3sMZx3DyrqwH5SlIGxRveP9afugUntjopLBgEaRA9JvRyx
	bJgcyauE3W+UiNXnpJ0biJYeeIfFJmU6uaf2YWbsDpYHj5DQqnogpWyT6AHCQRGrTxXuLKKTkRv
	g+EFmX5O/piW+5ke5oAUJ9vNliyGy6BrUGmUJNlkn3w==
X-Received: by 2002:a2e:bea0:0:b0:38e:866c:4340 with SMTP id
 38308e7fff4ca-395d8e1ac2fmr70867421fa.6.1779869577440; Wed, 27 May 2026
 01:12:57 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 May 2026 04:12:55 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 May 2026 04:12:55 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAMRc=Mdid6eE0_Vy4WBBz5OQuNg6fOmBGjjGHpWW_mXrcSMA9w@mail.gmail.com>
MIME-Version: 1.0
References: <CAMRc=Mfk9tP091DN=5kjb8fvFhj1=MiBZSq4NJ7+k5LNCVy9bw@mail.gmail.com>
 <20260526171050.12785-1-scardracs@disroot.org> <CAMRc=Mdid6eE0_Vy4WBBz5OQuNg6fOmBGjjGHpWW_mXrcSMA9w@mail.gmail.com>
Date: Wed, 27 May 2026 04:12:55 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mer5Ped1G+6xcuUhnzBoK_KLWjgD6VP6W9F=M6=U7sjkw@mail.gmail.com>
X-Gm-Features: AVHnY4IPDrzwDPTV0moNh90kVcpKP4hnCVac7KNo_swmvzfdOXrfSiJb0NLgTYY
Message-ID: <CAMRc=Mer5Ped1G+6xcuUhnzBoK_KLWjgD6VP6W9F=M6=U7sjkw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] gpio: rockchip: fix resource leaks and teardown bugs
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: heiko@sntech.de, linusw@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, Marco Scardovi <scardracs@disroot.org>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 27 May 2026 10:10:23 +0200, Bartosz Golaszewski <brgl@kernel.org> said:
> On Tue, 26 May 2026 19:02:44 +0200, Marco Scardovi <scardracs@disroot.org> said:
>> Hi Bartosz,
>> thank you for the review on the first version of this series.
>>
>> TL;DR: There's no clock-names property in the DTBs for the GPIO banks,
>>        and they don't expose a separate debounce clock in hardware.
>>
>> Regarding your question: existing DTBs currently do not provide clock-names
>> for these GPIO nodes and instead rely on positional clock ordering.
>>
>> While we could extend the binding to optionally support clock-names going
>> forward, the driver still needs to remain compatible with existing DTBs, so
>> it cannot rely on name-based lookup here.
>>
>> For this reason, keeping the index-based of_clk_get(..., 1) lookup together
>> with devm_add_action_or_reset() for cleanup seemed like the safest option.
>>
>> A good example can be gpio1 in rk3399-base.dtsi, where the clocks property
>> is defined as:
>>
>>   clocks = <&pmucru PCLK_GPIO1_PMU>;
>>
>> If we switched to name-based lookup via devm_clk_get(dev, "db"), it would
>> fail for existing DTBs because they do not define the corresponding
>> clock-names property.
>>
>> Additionally, PMU banks such as gpio1 do not expose a separate debounce
>> clock in hardware, so there would not be a matching entry anyway.
>>
>> Therefore, using of_clk_get(..., 1) is currently the only approach that
>> preserves compatibility with existing DTBs while avoiding regressions.
>>
>
> I see. Can you please reverse the order of the patches? The fix should go into
> v7.1 and stable branches, patch 1/2 is a new feature so it'll go into v7.2.
>
> Bart
>

Ah, nevermind my comment, I see patch 1/2 is a fix as well. I'll queue these
and fix the dev_err_probe() thing in tree.

Bart

