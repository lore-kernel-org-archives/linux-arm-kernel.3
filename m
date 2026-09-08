Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294E4C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 12:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QyHTawNuhcEnnxXQJgyQFb+DEMaOnkLb3lY8OQIcFHo=; b=mKZAH9xu7pfG/aMoOC1OamAIIy
	lQvwaNb0HVyHISQPmoXazIkCkr3A7JFi/M1Yiessy+nLoUqzNBfkVDKjbHVsJhRd55KcaiMa8MfLf
	ZFmgoVJaOH9lxgvtumVk9IODxGCndDF0SI7hx/8d2sV9eHL3XDCrv+9vxcNUmh93h0ixIvxABTsqf
	18TfKeleK7OH0xkXeWfnotiFLoMx31Y0eCnLKL9jc8kOssl5yeCyNO1DbtFcXmnQzFlzGpkWnDUUn
	saVYmn2XjOfQUCOPyJaoYlm5s7kXsLew/TZW45g2sx7AvKpkKVFGTISo5OejUbyZqCYEusZ+6sS8K
	HlpGqp5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ucH-00000008ykM-03br;
	Tue, 08 Sep 2026 12:07:57 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ucE-00000008yjn-23px
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 12:07:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788869275; x=1820405275;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nY/f36e4XCBpBx5q/CWt81lKze9qX8oQl+TRB/FvkTs=;
  b=f4qYwzptFG3yVTH/puLS31W56HsnHSGTg33uJbFz5Wdz4XQka0NLkSFp
   gCovJsS2DDICQ3aD/N+l5UGa6p86LBwi+bGcoOjYGOAFzKop3wFxfl5wY
   aVXPZ0rJ0GBg5meP6UR9mYt+sXZ66UN0m1Y+pl04arOR58Q0bR/iZ/D6o
   LVZyLcR1wA8jhG0U/TFFfLhLz1EZ6FmdacQCbcnut2EHHX0VW+0XHOVBT
   wmJa+3ZWSa5mhjm9pCUEyUSQ6mVQd/PDkcKN0h29R3Abdc+4X0Cy9OtFF
   bysqNLO1vvI+A1HBw/Eiem9JaKRDFvaGA/fVt9LFocHiLGZfJX/V4IKNd
   w==;
X-CSE-ConnectionGUID: bvIUq/WLS7GAFFzm5LgQqg==
X-CSE-MsgGUID: sRyk/hRQRom5qyW6zNwJmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="114808213"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="114808213"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 05:07:54 -0700
X-CSE-ConnectionGUID: aBvCWuEhSdG7xqg4PMl2eg==
X-CSE-MsgGUID: VDjQnp8RRumfORIpT2bbvw==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 08 Sep 2026 05:07:50 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id BC6F499; Tue, 08 Sep 2026 14:07:49 +0200 (CEST)
Date: Tue, 8 Sep 2026 14:07:49 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Sven Peter <sven@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 02/22] usb: typec: Represent USB4 on the Type-C bus
Message-ID: <ap_6lY1fBb5L6VaO@black.igk.intel.com>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-2-1f80085f93fb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-2-1f80085f93fb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_050754_542925_5F508CFC 
X-CRM114-Status: GOOD (  28.39  )
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

On Sun, Sep 06, 2026 at 08:36:25PM +0200, Sven Peter wrote:
> USB4 technically isn't alternate mode and entered using the EUDO and has
> no SVID or Discover Modes Response. We can still represent it like an
> altmode on the Type-C bus though by adding a mode kind. Exclude the USB4
> modes from any SVID-specific operations and driver binding, but allow
> consumers to observe their state through notifications.
> 
> Like for other altmodes, expose the USB4 mode to sysfs: Add a mode_kind
> to be able to differentiate and then expose the EUDO, make the USB4
> active state read-only since we only represent firmware-negotiated USB4
> modes and omit anything that only applies to SVID-specific altmodes.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
> Hope it's fine to add you as the contact for the sysfs documentation,
> happy to add myself otherwise though.
> ---
>  Documentation/ABI/testing/sysfs-bus-typec | 36 ++++++++++++++
>  drivers/usb/typec/bus.c                   | 67 ++++++++++++++++++++-----
>  drivers/usb/typec/class.c                 | 83 +++++++++++++++++++++++++++----
>  drivers/usb/typec/mode_selection.c        |  6 ++-
>  include/linux/usb/typec.h                 | 20 +++++++-
>  include/linux/usb/typec_altmode.h         | 10 +++-
>  6 files changed, 193 insertions(+), 29 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-typec b/Documentation/ABI/testing/sysfs-bus-typec
> index 205d9c91e2e1..524bbcbadf64 100644
> --- a/Documentation/ABI/testing/sysfs-bus-typec
> +++ b/Documentation/ABI/testing/sysfs-bus-typec
> @@ -12,6 +12,35 @@ Description:
>  
>  		Valid values are boolean.
>  
> +		For USB4 mode devices this attribute is read-only. On a port it
> +		indicates whether USB4 support is enabled; on a partner it reports
> +		whether USB4 is active. USB4 entry and exit are controlled by the
> +		port controller. Partner state changes notify this attribute and
> +		generate KOBJ_CHANGE uevents.
> +
> +What:		/sys/bus/typec/devices/.../mode_kind
> +Date:		September 2026
> +Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
> +Description:
> +		Read-only protocol kind represented by this mode device:
> +		"altmode" for an SVID-specific alternate mode, or "usb4" for
> +		USB4 negotiated using Enter_USB.
> +
> +		USB4 devices do not expose svid, mode, vdo, or priority
> +		attributes, or the legacy modeN attribute group. USB4 partner
> +		uevents contain MODE_KIND=usb4 instead of SVID, MODE, and
> +		MODALIAS variables.
> +
> +What:		/sys/bus/typec/devices/.../eudo
> +Date:		September 2026
> +Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
> +Description:
> +		Read-only Enter_USB Data Object (EUDO), formatted as
> +		0x followed by eight hexadecimal digits. Present only on USB4
> +		partner mode devices, not on ports or SVID-specific alternate
> +		modes. USB4 cable information is encoded in the EUDO; there are
> +		no USB4 cable plug mode devices.
> +
>  What:		/sys/bus/typec/devices/.../description
>  Date:		July 2018
>  Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
> @@ -36,6 +65,8 @@ Description:
>  		the mode index is not assigned, identifying the alternate mode
>  		must be done with either mode VDO or the description.
>  
> +		This attribute is not present on USB4 mode devices.
> +
>  What:		/sys/bus/typec/devices/.../svid
>  Date:		July 2018
>  Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
> @@ -43,9 +74,14 @@ Description:
>  		The Standard or Vendor ID (SVID) assigned by USB-IF for this
>  		alternate mode.
>  
> +		This attribute is not present on USB4 mode devices.
> +
>  What:		/sys/bus/typec/devices/.../vdo
>  Date:		July 2018
>  Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
>  Description:
>  		Shows the VDO in hexadecimal returned by Discover Modes command
>  		for this mode.
> +
> +		This attribute is not present on USB4 mode devices. USB4 partner
> +		mode devices expose the EUDO in the eudo attribute.

USB4 needs to have its own device type. The USB4 mode should not
expose things like svid and the vdo at all. And the USB4 mode
registration should be done with a dedicated API IMO.

Thanks,

-- 
heikki

