Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD72D10397
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 10:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=482cWfWN4b0O6dy6KpT4Qir58fonrCMGelhqRPAhsfI=; b=mM2BRmVmxGiiT21yXHqfq2ogYu
	Uu23/jMgLLDYPaJ9RQU2qv0g37BHaCsR9EZDCDHWPkGp/Czwwe4rYT/R/Gq4YV3PWRrwIOmxJLblR
	yn3vZMEgxGhTanY4PCin0p90vtv7fXouD0q8r8+LR4IHfvkLLYf1mUKIouI1R1dUwFJEBjixGEPyh
	X/dxeMGbk9cHimafKAGF+4Bbp1Av6+6r5PKywI0DQYXYw9OpNhQidtpO+UIrWASd2U0wpZ/kPFmMX
	f7Ri9Fkt40tY3Y/fgSBvwe2cz/EmRlhtumwy/Q0hWldk/dhA8PHf+AQaWNgaZVNY+ih5Iz72WssVh
	qqRX5Uog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOCKz-0000000Ekds-0YrD;
	Wed, 26 Nov 2025 10:01:25 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOCKv-0000000EkdU-2wR5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 10:01:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764151282; x=1795687282;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e4cSdFEpo2kqlF5v6+j+zFUBcsT+moYHxEeI0riTT7Y=;
  b=dKAS426dyEU3rIHWKnzToP4/hSgdEbMdVVDQiFlbFoMWbRyDhcRHagjt
   EktW4sqfgOt4naz168e7auWcG+6Z5bvUWbCQtB7R+7mbI6ZRGiPTLdn/L
   PIADpVRPvxROpP7ZvX2DKEK1hqWS6qs0YlOOxWFfrT0fk8lncdCdMlxYo
   GVMEc2HDPVUnzsS94FUrByR+FVuyO/kwl/8xlROemxQ40C9VE4T068zcv
   AUxMzEKQJddM2XP66JMNOX5Ghz+VISoGbGNwzTeV1L+9Y6EkJ3lyxNkea
   Nk5D5I93vT+y14KEim8bNoCLpPei4DfpINNjEYOQ7Zo3QNF5dEtqfYZsr
   g==;
X-CSE-ConnectionGUID: 7t4hogwmTZiuKrLXcDiwTw==
X-CSE-MsgGUID: 7QTc9Ji4RwOoeLd0oIfMIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="76806449"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="76806449"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 02:01:21 -0800
X-CSE-ConnectionGUID: t9JDLjGRT8yGW+fJ5xCWzA==
X-CSE-MsgGUID: JdFY+pn8TA2cP8IiLg/HxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="192916164"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO kuha) ([10.124.223.25])
  by orviesa007.jf.intel.com with SMTP; 26 Nov 2025 02:01:14 -0800
Received: by kuha (sSMTP sendmail emulation); Wed, 26 Nov 2025 12:01:08 +0200
Date: Wed, 26 Nov 2025 12:01:08 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: amitsd@google.com
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Lee Jones <lee@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Badhri Jagan Sridharan <badhri@google.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Subject: Re: [PATCH 3/6] dt-bindings: usb: maxim,max33359: Add supply
 property for VBUS in OTG mode
Message-ID: <aSbP5OanDUGhEXXV@kuha>
References: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
 <20251123-max77759-charger-v1-3-6b2e4b8f7f54@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251123-max77759-charger-v1-3-6b2e4b8f7f54@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_020121_946705_B75F83FC 
X-CRM114-Status: GOOD (  18.53  )
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

Sun, Nov 23, 2025 at 08:35:50AM +0000, Amit Sunil Dhamne via B4 Relay kirjoitti:
> From: Amit Sunil Dhamne <amitsd@google.com>
> 
> Add a regulator supply property for VBUS when usb is in OTG mode.

What is "OTG mode"?

OTG is usually used to refer to the USB in device role, even though the
specification actually defines OTG device as a device capable of both
host and device roles. So the term was confusing already before.
Nevertheless, the emphasis is always on data-role, _not_ power-role.

Here it seems MAX33359 uses the term OTG as a synonym for "source", so
power-role?

Please don't use the term OTG unless you really have to - it's too
confusing. I know the MAX33359 datasheet uses it, but what you really
do here is regulate VBUS. So please:

        s/otg-vbus/vbus/

thanks,

> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
> ---
>  Documentation/devicetree/bindings/usb/maxim,max33359.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
> index 3de4dc40b791..a529f18c4918 100644
> --- a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
> +++ b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
> @@ -32,6 +32,9 @@ properties:
>      description:
>        Properties for usb c connector.
>  
> +  otg-vbus-supply:
> +    description: Regulator to control OTG VBUS supply.
> +
>  required:
>    - compatible
>    - reg
> @@ -53,6 +56,7 @@ examples:
>              reg = <0x25>;
>              interrupt-parent = <&gpa8>;
>              interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
> +            otg-vbus-supply = <&otg_vbus_reg>;
>  
>              connector {
>                  compatible = "usb-c-connector";
> 
> -- 
> 2.52.0.rc2.455.g230fcf2819-goog
> 

-- 
heikki

