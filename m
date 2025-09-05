Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AADECCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5FPGflrxjZym8ZY2z4bNy4EwBxYh8zse7/OpV6jx/HE=; b=G0T8/Y0uCXnCj5ew/gqqC0JwUO
	IpO9HMQlkOYgSHJufHfn+O3FNFa0KaHWVgEeEw4FF3CVpl7JMQFhoietpgtdalrxMuU8Zx1Y8N5FH
	YARNV8FRoO8XYCukdrxULVfJDxycQKvuKIyj/2y5gHPLPKGkRmUFAQOunxAe8nyZFBzFObzaR0JWv
	m7xRfY6jp9VoI0NzWR3rEKkI7rTY4eieGer5lLjZQ3Pf54GDe726Y7g+J51XZ/EmrOaCoQ5eoY+nt
	wdfnwwOW1dKgeRoaL2I9d75cB3sQ49e2mHrvm2MKmmntTRVPwgXsvp5v1MQ9tZC/rLw/exk+K4i/f
	SSyzIrcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXYr-00000002Oy7-0MhE;
	Fri, 05 Sep 2025 14:37:09 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuUAo-00000001E8T-3rf4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 11:00:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757070007; x=1788606007;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xWFG9IcSFRaAzKyA5Lio/LJJoAzp+33hlHZFKOaExJw=;
  b=iooWAwvVJlJwvGNK3gnPs2jTnToGQmKVb7nTvikUoLASODUNLsHWg9zC
   URoETuQ88EISCZJkgW6KncYxEbU3ohhQUPka4TmEztX+R8xSjiSNqDAmF
   0YR/wJhBtE1kqfnHajOQW+bHxmENUsJXZ19hwf6ysV9xFR0fG0buQYZUN
   inZ4eu26/OdvXHfAYR+eQwrz30iqWnxt04d+5KhSHit8uhFcs+AM0GnXS
   oE3cJlzVSgbf0X/KtIs6j9qxYGH2Jvhg7py5JsGXPsbjxk3HabQqV9mJG
   ASvFaKQoz5RwJIL59Hjx/+PxMBiMjAGwbQwiOAlYdl+x1cWDto7iU9jCk
   A==;
X-CSE-ConnectionGUID: ed651Aj7SvK7/7B9kYaz/Q==
X-CSE-MsgGUID: AArdt5OoSniEh3lsv5TCIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="59118970"
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; 
   d="scan'208";a="59118970"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 04:00:01 -0700
X-CSE-ConnectionGUID: zgDOmaF0S/+OTUlsH0/d9g==
X-CSE-MsgGUID: 7w6td42BQWaRq1lJzsfd3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; 
   d="scan'208";a="172579445"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa009.fm.intel.com with SMTP; 05 Sep 2025 03:59:58 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 05 Sep 2025 13:59:57 +0300
Date: Fri, 5 Sep 2025 13:59:57 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Fedor Pchelkin <boddah8794@gmail.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Al Viro <viro@zeniv.linux.org.uk>, linux-usb@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: ucsi: stm32: Use min() to improve
 ucsi_stm32g0_fw_cb()
Message-ID: <aLrCrQOdLsqq0U37@kuha.fi.intel.com>
References: <20250830110426.10007-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830110426.10007-2-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_040007_007991_DF2F23B5 
X-CRM114-Status: GOOD (  17.58  )
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

On Sat, Aug 30, 2025 at 01:04:20PM +0200, Thorsten Blum wrote:
> Use min() to improve ucsi_stm32g0_fw_cb() and avoid calculating
> 'end - data' twice.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi_stm32g0.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_stm32g0.c b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
> index 57ef7d83a412..838ac0185082 100644
> --- a/drivers/usb/typec/ucsi/ucsi_stm32g0.c
> +++ b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
> @@ -10,6 +10,7 @@
>  #include <linux/firmware.h>
>  #include <linux/i2c.h>
>  #include <linux/interrupt.h>
> +#include <linux/minmax.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/unaligned.h>
> @@ -523,11 +524,7 @@ static void ucsi_stm32g0_fw_cb(const struct firmware *fw, void *context)
>  	data = fw->data;
>  	end = fw->data + fw->size;
>  	while (data < end) {
> -		if ((end - data) < STM32G0_I2C_BL_SZ)
> -			size = end - data;
> -		else
> -			size = STM32G0_I2C_BL_SZ;
> -
> +		size = min(end - data, STM32G0_I2C_BL_SZ);
>  		ret = ucsi_stm32g0_bl_write(g0->ucsi, addr, data, size);
>  		if (ret) {
>  			dev_err(g0->dev, "Write failed %d\n", ret);
> -- 
> 2.50.1

-- 
heikki

