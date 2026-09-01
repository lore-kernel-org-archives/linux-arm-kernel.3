Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EDA8C624C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 08:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WAjfPRBGQzShc8YtJJtfd3nlouF6dpts5iw2uGzuEPI=; b=ajdsi9o/czgi3BiLXqBSxPjiBZ
	X5IkRLFeq4KbPc/v1BvcxHwr5NlDwxE8RB95AxqzxBNNb9OShO0GtiC/fP0eoFCmit84mRBDmEVZN
	8GztZ9buKciQYWFSU+Os70nELIBTrLWgpIde+nG3D9Meqt/XOP/e8t9rpySB01q8zG7PpxCt9nj2o
	f8XATSpENryAmBK/Lkmwl3PrOpTgdcihEqjLzo0Pim08q27qc1c1t3Pecf1Eouh9ZeM6H6sihJNdf
	h3ZS5IOnKtgHbObwq4LexP7Rz4++B2z8nmOrNrR6Hvwzw6l8q/250JsYyFh/q1qMBye29KqATIISM
	NK40Kw1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KA9-0000000BKkH-2cMH;
	Tue, 01 Sep 2026 08:48:13 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KA7-0000000BKje-0vDL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 08:48:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788252491; x=1819788491;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vKNhSQ2KYcaUOtuQBgsj1j9mWaFB4IaP4yx80H7ljDc=;
  b=UKaiUAqES+4g3SdKD/Wwdm4FgfS2GXid/pw6to3KteybCIqujJ1ImIvp
   n9J/y6RjLDWxG98r//cpcyU4kzreVxEZJLhdhijvwP2jrGvzoXbdxutzO
   A3PaUKDb/W1wa+cZFhU8K1IXIrLAzSjBhY7/TWqzdFLml+4xERI4i8c1f
   Pvv+f4ZLZa6QWGdiF8SnZgoMgTvstg+8rUNsYEJZKf3nKVqEZOZYvFzhv
   nkgIp/hhigsjyJEjeP5mzSl9yV+PhoO/TqsD6RxhZw7kdxdHi2QTDkKLE
   RYVIeNM+nVHma23yo8HJILrC+kPpuvBbdLd7rPsimt1iLslxyDVlaMA7l
   g==;
X-CSE-ConnectionGUID: tOLk5htnS5eR7FBHjxJFtQ==
X-CSE-MsgGUID: VG+e19wrRr6oFi7Dhw+fYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88434017"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="88434017"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 01:48:08 -0700
X-CSE-ConnectionGUID: WdsnewkQS9yOAp9UxZs+qw==
X-CSE-MsgGUID: Pm49jRiJTYiFtkP/MJltEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="270981162"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 01 Sep 2026 01:48:04 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id A858C99; Tue, 01 Sep 2026 10:48:02 +0200 (CEST)
Date: Tue, 1 Sep 2026 10:48:02 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Sven Peter <sven@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 06/19] thunderbolt: Try reading host DROM from device
 tree first
Message-ID: <20260901084802.GB106095@black.igk.intel.com>
References: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
 <20260830-b4-apple-soc-tbt-v1-6-44bc9348683c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260830-b4-apple-soc-tbt-v1-6-44bc9348683c@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_014811_307163_1C45D12D 
X-CRM114-Status: GOOD (  27.56  )
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

Hi,

On Sun, Aug 30, 2026 at 10:19:24PM +0200, Sven Peter wrote:
> On Apple Silicon SoCs the DROM is provided by a device tree property.
> Try reading from that property first.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  drivers/thunderbolt/eeprom.c | 32 +++++++++++++++++++++++++++-----
>  1 file changed, 27 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/thunderbolt/eeprom.c b/drivers/thunderbolt/eeprom.c
> index 2a13fa6888ba..389de7df84f6 100644
> --- a/drivers/thunderbolt/eeprom.c
> +++ b/drivers/thunderbolt/eeprom.c
> @@ -468,14 +468,14 @@ static void tb_switch_drom_free(struct tb_switch *sw)
>  }
>  
>  /*
> - * tb_drom_copy_efi - copy drom supplied by EFI to sw->drom if present
> + * tb_drom_copy_property - copy drom from a device property if present

tb_drom_copy_property() - Copy DROM from ..

Ditto for the other kernel-doc comments. If it is static trivial function
you don't need to add them.

>   */
> -static int tb_drom_copy_efi(struct tb_switch *sw, u16 *size)
> +static int tb_drom_copy_property(struct tb_switch *sw, const char *name, u16 *size)

I think this should be split into two lines.

>  {
>  	struct device *dev = sw->tb->nhi->dev;
>  	int len, res;
>  
> -	len = device_property_count_u8(dev, "ThunderboltDROM");
> +	len = device_property_count_u8(dev, name);
>  	if (len < 0 || len < sizeof(struct tb_drom_header))
>  		return -EINVAL;
>  
> @@ -483,8 +483,7 @@ static int tb_drom_copy_efi(struct tb_switch *sw, u16 *size)
>  	if (res)
>  		return res;
>  
> -	res = device_property_read_u8_array(dev, "ThunderboltDROM", sw->drom,
> -									len);
> +	res = device_property_read_u8_array(dev, name, sw->drom, len);
>  	if (res)
>  		goto err;
>  
> @@ -500,6 +499,22 @@ static int tb_drom_copy_efi(struct tb_switch *sw, u16 *size)
>  	return -EINVAL;
>  }
>  
> +/*
> + * tb_drom_copy_of_apple - copy drom supplied by the device tree for Apple Silicon to sw->drom.

Like these, not really useful comments you can drop.

> + */
> +static int tb_drom_copy_of_apple(struct tb_switch *sw, u16 *size)
> +{
> +	return tb_drom_copy_property(sw, "apple,thunderbolt-drom", size);
> +}
> +
> +/*
> + * tb_drom_copy_efi - copy drom supplied by EFI to sw->drom if present
> + */
> +static int tb_drom_copy_efi(struct tb_switch *sw, u16 *size)
> +{
> +	return tb_drom_copy_property(sw, "ThunderboltDROM", size);
> +}
> +
>  static int tb_drom_copy_nvm(struct tb_switch *sw, u16 *size)
>  {
>  	u16 drom_offset;
> @@ -675,6 +690,13 @@ static int tb_drom_host_read(struct tb_switch *sw)
>  {
>  	u16 size;
>  
> +	/*
> +	 * Apple Silicon machines always get their host DROM from the Device Tree,
> +	 * so make sure to try reading it first before any other method.
> +	 */
> +	if (!tb_drom_copy_of_apple(sw, &size))
> +		return tb_drom_parse(sw, size);
> +
>  	if (tb_switch_is_usb4(sw)) {
>  		usb4_switch_read_uid(sw, &sw->uid);
>  		if (!usb4_copy_drom(sw, &size))
> 
> -- 
> 2.55.0
> 

