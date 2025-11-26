Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55EF8D10F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 11:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XlqNV/wMTHOYcdXtDpXn/nBuNOhmBNzkylvHm9l054I=; b=yy9/AEYnmiPa6iCgypFAIJp4GO
	RbAweF1JVVQfHOWu8lb1xS+AIOj7A6eubRdY9RJqQR0gBeui7PBeWal4mA3966VjBPQLtVyJxDvbA
	X/w0+EMDSOuBUWbFYU6xylKrpS0KK4WiDsevd8MjdldWF9c1ZbLSEt+lBJ+DzqGohLqpGK9Xq+snQ
	AX+pbmRDja8adB9b/x4HdmvR4aXMRCsAzWnBG/A1OncYJnatpUu5RaeDpvhHGXShEgs5ZFUHf72kB
	N6vk4gcVLNSzQ7d/dqSvLmyOo9aNzhXT77+QB/ac5GEcg8dUgrAFxNW/fwdy87jk7CtWVWjAKIsGW
	N4E5MUzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODPc-0000000EtER-3mlD;
	Wed, 26 Nov 2025 11:10:16 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODPa-0000000EtDG-3E7Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 11:10:16 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1vODPZ-0007b1-B5; Wed, 26 Nov 2025 12:10:13 +0100
Message-ID: <0c9e5155-f784-4656-a92c-1603f58fc4ee@pengutronix.de>
Date: Wed, 26 Nov 2025 12:10:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/8] kbuild: Split out module targets into a variable
To: Simon Glass <sjg@chromium.org>, linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Tom Rini <trini@konsulko.com>,
 =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>,
 Nicolas Schier <nicolas@fjasle.eu>, Chen-Yu Tsai <wenst@chromium.org>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Tamir Duberstein <tamird@gmail.com>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20251119181333.991099-1-sjg@chromium.org>
 <20251119181333.991099-6-sjg@chromium.org>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <20251119181333.991099-6-sjg@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_031014_870411_489DC98D 
X-CRM114-Status: GOOD (  19.64  )
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



On 11/19/25 7:13 PM, Simon Glass wrote:
> Add a modules-targets variable to list the targets which cause modules
> to be built, since we want to add a conditional target.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

> ---
> 
> (no changes since v5)
> 
> Changes in v5:
> - Add a new patch to split out module targets into a variable
> 
>  Makefile | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 638bc09a546a..8cd46222fc48 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -772,7 +772,12 @@ endif
>  # in addition to whatever we do anyway.
>  # Just "make" or "make all" shall build modules as well
>  
> -ifneq ($(filter all modules nsdeps compile_commands.json clang-%,$(MAKECMDGOALS)),)
> +modules-targets := all
> +modules-targets += modules
> +modules-targets += nsdeps
> +modules-targets += compile_commands.json
> +modules-targets += clang-%
> +ifneq ($(filter $(modules-targets),$(MAKECMDGOALS)),)
>    KBUILD_MODULES := y
>  endif
>  

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


