Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84CEC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 12:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bvDKGhwF/6FN8qle0rBqMKtnL7x6rX9WRfN3/Txq6BU=; b=igarZrwYGZZ51qTfpjJs7xylpL
	h+rAVY2kjMGxgmcygDeHvGPw+UNvvgWK3R4W1n/WakPRmC9LBuYi8vVS/K/vxkJbCtM3w3cqTuMhx
	ed6WaE3dQFK33BVH3ZMPYe/qaAtSXs+JvJLhrHFR6CedHZvGVlc7retuB9DqYgVrcbgblTy6J9M8n
	xQwY37ozVlWCxGEnT6/18oAvKq+pD8kmJ4CB9kZC2nfRj+ldKQFCqhStJCOwccoFHTLtFDSKMGetw
	lHpPqxcVIpjxUANBYW9sICAuMQESKTTlFElhJsWTgJdrATdQw1ZiGPELlWFvI6lfdhjSeQZxH9Ofq
	noXptwqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3uUq-00000008xlV-2Q2x;
	Tue, 08 Sep 2026 12:00:16 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3uUo-00000008xl7-363m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 12:00:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788868814; x=1820404814;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W8i82HOkiZbVbSBZCtn5Kofxi2cYhcgb58khxqBCrRA=;
  b=k+rLkWy9zL2asZ1KRVwuw+kB6C8mn6PSCAmyNbUCAHDWQE6c9c5i7mwB
   Oty+ru9nYVM9HhqyRDPOl9KLOLj58gtrDU3YOpcxZJ7nDGtizzlktzAxi
   SUphfDMKpxZhzcSWcI3/ZAsL6g4XXFCN53wq8KOCuzXuaDueFqDWZl/ur
   +9U1ja//sOtPUBrtQe9M4zmdx8lTA6p1jm+3JBY4U7BV8Yx7A/IrerVKd
   bB2EO7PPfY0G1I23QN3/LtDLMeUDFjHaUUo89rQpb42kionodIGre11Vg
   pwWITCO49Uk3MEwpAqg2x1U7/5Mp1mV78Nxk2OorZXFMjVpDGSaOqrUxz
   w==;
X-CSE-ConnectionGUID: 5Edh9JJvTYGbVqGn5hMJvA==
X-CSE-MsgGUID: H/LcbmIPQMO13kVOK1OE+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="100625103"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="100625103"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 05:00:11 -0700
X-CSE-ConnectionGUID: eahnnXcoR9aH1T7npJNTXA==
X-CSE-MsgGUID: RWz8rladR3e4r9kcUpNVlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="274502608"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 08 Sep 2026 05:00:08 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 555E399; Tue, 08 Sep 2026 14:00:06 +0200 (CEST)
Date: Tue, 8 Sep 2026 14:00:06 +0200
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
Subject: Re: [PATCH v2 01/22] usb: typec: Add alternate mode state notifiers
Message-ID: <ap_4xnV_SJg1FoL_@black.igk.intel.com>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-1-1f80085f93fb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-1-1f80085f93fb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_050014_791980_5EE6FADC 
X-CRM114-Status: GOOD (  22.24  )
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

On Sun, Sep 06, 2026 at 08:36:24PM +0200, Sven Peter wrote:
> The Apple Silicon USB4/Thunderbolt driver needs to be made aware of
> cable details and whenever USB4 or Thunderbolt is entered. The cable
> details are already available as part of the typec subsystem but there
> is no way to get a notification on typec_altmode_update_active() so
> far.
> 
> Add a blocking notifier chain to each alternate mode and call it
> whenever the mode is activated or deactivated right next to the already
> existing sysfs and kobject_uevent notifications. Replay activations when a
> notifier is registered.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  drivers/usb/typec/bus.h   |  6 +++++
>  drivers/usb/typec/class.c | 59 +++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/usb/typec.h | 16 +++++++++++++
>  3 files changed, 81 insertions(+)

...

> diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
> index 10a783b738ef..914a6f0844c5 100644
> --- a/include/linux/usb/typec.h
> +++ b/include/linux/usb/typec.h
> @@ -19,6 +19,7 @@ struct typec_plug;
>  struct typec_port;
>  struct typec_altmode_ops;
>  struct typec_cable_ops;
> +struct notifier_block;
>  
>  struct bus_type;
>  struct fwnode_handle;
> @@ -184,6 +185,21 @@ struct typec_port *typec_altmode2port(struct typec_altmode *alt);
>  
>  void typec_altmode_update_active(struct typec_altmode *alt, bool active);
>  
> +/**
> + * enum typec_altmode_event - USB Type-C alternate mode state event
> + * @TYPEC_ALTMODE_ENTERED: The alternate mode has been entered
> + * @TYPEC_ALTMODE_EXITED: The alternate mode has been exited
> + */
> +enum typec_altmode_event {
> +	TYPEC_ALTMODE_ENTERED,
> +	TYPEC_ALTMODE_EXITED,
> +};

Mode entry and exit are not the only state changes that can happen.

> +int typec_altmode_register_notifier(struct typec_altmode *alt,
> +				    struct notifier_block *nb);
> +int typec_altmode_unregister_notifier(struct typec_altmode *alt,
> +				      struct notifier_block *nb);

This is basically a partial revert of this commit bbe80c9a89b8 ("usb:
typec: altmode: Remove the notification chain"). Can you check if it
would enough to just completely revert that one.

Thanks,

-- 
heikki

