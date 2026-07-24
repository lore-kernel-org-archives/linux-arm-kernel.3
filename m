Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852A9C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 06:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b2vJ+M9F1JLYCArJOe+bb3FjbJIxromizLHWPeuzgew=; b=P23EE/ftzGaW5GRmS2XsWXTiFT
	8kIGRzwyB0CPzHX+N80j6HLm5XZbGbyXzxk8TA82BThopBCl/vBCSb9d/RahOh8sKuT7S5NDdnO48
	M9UkhRnuyqGJaTZMPBmi8g2RdquqGXfjH+2wq9XC9AAU4HPNKDxI7yrkR41p3E9zmQknavud5VBiB
	Qjj6iC6CVYeWnMZ8ufmSaVoOVirnR0dePhcaE3dFkzkOZFjhg0N19hdJb7kepGCsRiFvIaeYdza0e
	RmwZkLufOZ4cPegiJqG0jCFCz72Fp4OVfhnuXHVGPapb4O8vWOSlfEpK0+A77Vo66d2reF01OzPHn
	l8uo4Upg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9fj-0000000FdH5-3i7n;
	Fri, 24 Jul 2026 06:46:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9fi-0000000FdGx-1KKw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 06:46:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C606E600AA;
	Fri, 24 Jul 2026 06:46:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D64C61F000E9;
	Fri, 24 Jul 2026 06:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784875572;
	bh=b2vJ+M9F1JLYCArJOe+bb3FjbJIxromizLHWPeuzgew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HKgAwGFOvOviAZUJinOxYdfg0wAx2QbSqVbqMnW1JJvoze7ts8+Ds109tCjdxxQPk
	 0rai1An1f7xfB/30JNFJu8L+Wnhch+4k+gY+R24jQ9ORWLNgZZnVENr8IR3QWrbtdr
	 uPqRxKc0XwWHkAP2ut71VMg1a23QETq0SXphP5gvW4gw18RVKe6AE0/ewyHgnJRuJh
	 PI9y6/k5h86eahNgB+G3oQGnL4/32yES+Y+KmL4VwWqMY2i7hmw88Xf8za53k1HovT
	 k/hi5B91WSoR92Bqaz4l4A/9AewffiDWU3xXqoN/ONU5EuL5SbmdWbosF5w7+XkDgj
	 GuEW9pwd0HA6g==
Date: Fri, 24 Jul 2026 08:46:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, 
	soc@lists.linux.dev, Douglas Anderson <dianders@chromium.org>, 
	Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
	Brian Norris <briannorris@google.com>, William McVicker <willmcvicker@google.com>, 
	kernel-team@android.com
Subject: Re: [PATCH v2 3/5] arm64: dts: google: Add dts directory for
 Google-designed silicon
Message-ID: <20260724-sly-grinning-pig-86900e@quoll>
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-3-3abae9717feb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260722-contrib-pg-pixel10-initial-dts-v2-3-3abae9717feb@linaro.org>
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

On Wed, Jul 22, 2026 at 10:55:54AM +0100, Peter Griffin wrote:
> From: Douglas Anderson <dianders@chromium.org>
> 
> The first four Google Tensor SoCs were offshoots of Samsung Exynos
> SoCs and their device trees were organized under the "exynos/google"
> directory. Starting with the Google Tensor G5 SoC in Pixel 10 phones,
> Google Tensor SoCs are now of Google's own design. Add a location in
> the tree to store these device tree files.
> 
> Changes by Peter Griffin
>  * update config symbol help with at least 4 lines to avoid checkpatch
>    warning
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  MAINTAINERS                         | 1 +
>  arch/arm64/Kconfig.platforms        | 8 ++++++++
>  arch/arm64/boot/dts/Makefile        | 1 +
>  arch/arm64/boot/dts/google/Makefile | 1 +
>  4 files changed, 11 insertions(+)
> 

This is not Samsung derivative, but new top-level SoC platform, thus
usual way is that you send it after review to soc@ (see maintainer-soc
profile).

OTOH, the maintainers entry is the same as Google Tensor GS, thus maybe
you want me to pick this up via Samsung SoC tree?

Both will work, up to you.

Patch looks good.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


