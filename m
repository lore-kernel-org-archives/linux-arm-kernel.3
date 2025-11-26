Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBD1D10390
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 09:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uNzqUkF/NLJkWaLEGgTmR+sXSpHzl8FkPtQgl/1Phuc=; b=soWQcPRxc7hLwdD68xr9BFHy6j
	YTF1zSSUkHyMc+dcpnVxcrZi50i+IL7nq6vImZwIVUy8wPk6VhvYikE/1AZYAdk5rfDlL/tVqd9cY
	WUQ5dl4pD/J+vXax0e6FO2dIFl7cHJPsVTvfQ6rPjZWm4qSih7LR3Elqmor0Z9aiBbjixnwjahWVb
	wxRtcjfSrlK82+k0pfRACSC42QvCOZ8u00rt26sQ2ZsVQ8POoFctb43xdsmDPePqt+KRJ8MGfgmil
	V89rS2y/kGlX1d1QaGihb1KWraTD1x9yGzuvWD2A48m3B+icsfEC8zmHl7D1c0k5VZPYFVRAoouUd
	aGqI5rjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOBlM-0000000Ehm7-0F70;
	Wed, 26 Nov 2025 09:24:36 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOBlJ-0000000Ehkh-0kWV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 09:24:34 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1vOBlH-0002uy-KF; Wed, 26 Nov 2025 10:24:31 +0100
Message-ID: <1b2221cb-803b-4709-bb61-4a347397df28@pengutronix.de>
Date: Wed, 26 Nov 2025 10:24:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/8] scripts/make_fit: Speed up operation
To: Simon Glass <sjg@chromium.org>, linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Tom Rini <trini@konsulko.com>,
 =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>,
 Nicolas Schier <nicolas@fjasle.eu>, Chen-Yu Tsai <wenst@chromium.org>,
 Nicolas Schier <nsc@kernel.org>, linux-kernel@vger.kernel.org
References: <20251119181333.991099-1-sjg@chromium.org>
 <20251119181333.991099-2-sjg@chromium.org>
Content-Language: en-US, de-DE, de-BE
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20251119181333.991099-2-sjg@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_012433_225177_3F13B1FC 
X-CRM114-Status: GOOD (  23.01  )
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
> The kernel is likely at least 16MB so we may as well use that as a step
> size when reallocating space for the FIT in memory. Pack the FIT at the
> end, so there is no wasted space.
> 
> This reduces the time to pack by an order of magnitude, or so.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Reviewed-by: Nicolas Schier <nsc@kernel.org>

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

> ---
> 
> (no changes since v3)
> 
> Changes in v3:
> - Move the ramdisk chunk into the correct patch
> 
>  scripts/make_fit.py | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/make_fit.py b/scripts/make_fit.py
> index 1683e5ec6e67..0f5e7c4b8aed 100755
> --- a/scripts/make_fit.py
> +++ b/scripts/make_fit.py
> @@ -98,7 +98,7 @@ def setup_fit(fsw, name):
>          fsw (libfdt.FdtSw): Object to use for writing
>          name (str): Name of kernel image
>      """
> -    fsw.INC_SIZE = 65536
> +    fsw.INC_SIZE = 16 << 20
>      fsw.finish_reservemap()
>      fsw.begin_node('')
>      fsw.property_string('description', f'{name} with devicetree set')
> @@ -299,7 +299,9 @@ def build_fit(args):
>      finish_fit(fsw, entries)
>  
>      # Include the kernel itself in the returned file count
> -    return fsw.as_fdt().as_bytearray(), seq + 1, size
> +    fdt = fsw.as_fdt()
> +    fdt.pack()
> +    return fdt.as_bytearray(), seq + 1, size
>  
>  
>  def run_make_fit():

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


