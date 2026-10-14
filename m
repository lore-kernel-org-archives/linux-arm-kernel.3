Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E399DCC6B27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 07:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sl6IW0nnvVtp07vNT44AV7L0erWrDL8jBfOworvsToI=; b=oxj78CzPHvSNBlwANszXMJRBQZ
	CV0uhonIpYBtkPC8bA6KnsHY0gZt6CfjwwImaT7MEqmjCn53j0IASG4WSf6xgI/xi8k7tIlJYwwom
	ksIdt/U+mOK+zylywRuzeImNAL4eB+BRNfQFLpOpXWomMr0wHuOf8nYsuZfLI/8vQW7AqVJAEBydQ
	TpnNYz/CrdYd7B0yp0OnZPuGJcL4+qKChhI1y+Fq79KSQei/iYWQhSWN4r96MbPAn5frPobcIj6K1
	CW4ZG3WGUBIgCFcPWbU3VRKX0UukUJuQeS2YlJX/MEHtK/cljBR5LMYb/ddo/DoCP82cS12JFs2bZ
	EXbENdPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtrH-0000000EpcR-2vj7;
	Wed, 14 Oct 2026 07:57:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtrF-0000000EpcB-2P2O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 07:57:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2437A60213
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 07:57:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1A131F00893
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 07:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791964623;
	bh=sl6IW0nnvVtp07vNT44AV7L0erWrDL8jBfOworvsToI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=co9OoteDp2WuxaM8YqiplSwL9GnSd9In+175+3Te3DpvnRRfRQnFkFo+66Rxr8uTx
	 fJYP8sycpWgurlsHVS+fCyw7p0VkLM5hgv1fQct5k3l5MryucUFTUwW8D16h6rKYJg
	 qC4Sw6Yl0Vw/3h8SiPgyDEjGvfrAQ7z9DAOU1XID9Fw9QCjsHRSI9Zp4EufxvqDtdj
	 OEQz2ODYL3dahOwI1VJmJpeVa78kuo8g0w91NTk7fJCZz3zCIfoCumI482++PTfRGZ
	 KioZJz1346e+z5inJu/Mi6i3b47QXZAtTuEh6hOOvlz2sD33rq1jc+BXpeoUaXnX5i
	 KjDhwntvI9xiQ==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a980c01033so5532251fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 00:57:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwLOYninExy45PqB4f5qElmTOLUTrsuJP/rT7ZH5t7ddb8LZL6z3iN5Zz4aY/Ohatvo9HeS1356VkaN69mohE8Y@lists.infradead.org
X-Gm-Message-State: AFq9FYLBUGGQJxUNrnrF3gWmW6EgjvM5LFQtqpYsdZxVo5qyJTx8pcSr
	7ZxrRANkcoYOF3siBI/YhZJQvl2LoghupmMVnZWpYhMlQ6nPuvGDY+U7kgL0bT8kMgBc4zV6s+v
	FHFr897Cp+Ydn9Py2Xwy8AoEyu0GYtagAYCTTV+SJOg==
X-Received: by 2002:a05:651c:1542:b0:3a6:692d:b7ed with SMTP id
 38308e7fff4ca-3a9c539343dmr40055691fa.20.1791964622555; Wed, 14 Oct 2026
 00:57:02 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 00:57:01 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 00:57:01 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260814075624.16639-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
References: <20260814075624.16639-1-pengpeng@iscas.ac.cn>
Date: Wed, 14 Oct 2026 00:57:01 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me3kH8rrifW20xw2JqECydKrbBfQ2ZfFsTrL6KwD8+9=A@mail.gmail.com>
X-Gm-Features: AclHuK_kQw-qSVTPtUkRCZuiCj0gamOTj8vq5XddbmqNqJG15Vf0yUsge2wg9SY
Message-ID: <CAMRc=Me3kH8rrifW20xw2JqECydKrbBfQ2ZfFsTrL6KwD8+9=A@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: davinci_all_defconfig: enable the current ST7586 symbol
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: David Lechner <david@lechnology.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Russell King <linux@armlinux.org.uk>
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

On Fri, 14 Aug 2026 09:56:24 +0200, Pengpeng Hou <pengpeng@iscas.ac.cn> said:
> The ST7586 DRM provider is now built by CONFIG_DRM_ST7586.
> davinci_all_defconfig still enables the removed DRM_TINYDRM and
> TINYDRM_ST7586 carrier symbols.
>
> Replace those stale entries with the current provider symbol.
>
> Assisted-by: Codex:gpt-5

Should be Assisted-by: LLM but even that tag is going away[1].

> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
> Changes since v1: https://lore.kernel.org/all/20260624082029.18675-1-pengpeng@iscas.ac.cn/
> - no source-code changes
> - rebase davinci_all_defconfig
> - route the revision to DaVinci and ST7586 maintainers
> - add the coding-assistant disclosure
>
> The Kconfig/provider mapping was reviewed statically; no DaVinci kernel
> build was performed.
>
>  arch/arm/configs/davinci_all_defconfig | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/arm/configs/davinci_all_defconfig b/arch/arm/configs/davinci_all_defconfig
> index 72703ef0c51c..ac0029701283 100644
> --- a/arch/arm/configs/davinci_all_defconfig
> +++ b/arch/arm/configs/davinci_all_defconfig
> @@ -144,8 +144,7 @@ CONFIG_VIDEO_ADV7343=m
>  CONFIG_DRM=m
>  CONFIG_DRM_TILCDC=m
>  CONFIG_DRM_SIMPLE_BRIDGE=m
> -CONFIG_DRM_TINYDRM=m
> -CONFIG_TINYDRM_ST7586=m
> +CONFIG_DRM_ST7586=m
>  CONFIG_FB=y
>  CONFIG_FB_DA8XX=y
>  CONFIG_BACKLIGHT_PWM=m
> --
> 2.50.1 (Apple Git-155)
>
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

[1] https://lore.kernel.org/lkml/20261009083137.3-1-sashal@kernel.org/

