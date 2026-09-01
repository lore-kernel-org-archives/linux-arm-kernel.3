Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17856C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 09:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oiP65UJTHzIKZHy9DPbGfadk90dh2MxGb8BOL7evLB8=; b=sBExmhjrD4v/Q7tcCUjvWInx7L
	ofMhEKprN2uZHJtpAqG1UUn67L6ti12j+S3EL631039BEXnBKeWIlE/Lmo0XAPuLLmt9wc2a47H82
	uEoLdIDLa8YGaUIn1pNQTHSNHXeDheFP27uaivsrFybNvsGFZXIcpXfk9DPrg/QM+/rign10f1R1v
	Q6RUl/mEWjIZqqWDGjhZkVdstNEh/yLFpnMfnP7Fs4Xv0YnSUV4KKuAueQApyhrgSQMsuAoGLnMOO
	wO6MeDDFnituo1UIsQrKsWQKixADrhXeSrHS0u0yxqGFDGoER5MCiIZlhdA/Di7ZJ7TyptW/RJoH/
	JNBmVrOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KXN-0000000BNyI-2V2l;
	Tue, 01 Sep 2026 09:12:13 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KXK-0000000BNxA-3OEk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 09:12:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788253931; x=1819789931;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DwDMrU9WHt1pn0D65swC6i/CYaHJ8q0hFkMtbbEF1NY=;
  b=mVsa7LE0cUXXnQLUPmE30NOfX1aVO2tN+lRHPyHKLw1caY1FaBY7f+5h
   XNvvd3c6UFOfu4YAZmS+D0ZdYAhdD9Svp/m9ADRx85gNZXSLKK115fz5A
   yRkW7UUqy7gzsUyWCZmqr6amMrtR8dmlc5qrxE/e4vG+qMmIav6iAuhRy
   2Tp2YvrQZdvyiiV4xuj7ipMK2JjWsy4dDMnNywe9MEvjfmxByfX5Xe0wL
   +/jfnPQ8U6LVsN08GErL6gvBnmSOHXQ64FdXri4qWi4xLHzvjgIoI2sI0
   Ya07GPepVZ2iF+/63lEyVwrb/jzpjhoVsefUVys9cW4Q3XyCkk9nLvA4u
   w==;
X-CSE-ConnectionGUID: UYS2CejdT9OZkNK5+GN+NA==
X-CSE-MsgGUID: kBmvaavZQjC/xVMZXInkLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="100030939"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="100030939"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 02:12:10 -0700
X-CSE-ConnectionGUID: hjkgsHRkSEqT2urz8hf7Pg==
X-CSE-MsgGUID: SJjbmrc6TkuD2KaR8UsXVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="272828628"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 01 Sep 2026 02:12:06 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 9A2E399; Tue, 01 Sep 2026 11:12:05 +0200 (CEST)
Date: Tue, 1 Sep 2026 11:12:05 +0200
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
Subject: Re: [PATCH 14/19] thunderbolt: Add QUIRK_NO_USB3_BW_ALLOC
Message-ID: <20260901091205.GE106095@black.igk.intel.com>
References: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
 <20260830-b4-apple-soc-tbt-v1-14-44bc9348683c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260830-b4-apple-soc-tbt-v1-14-44bc9348683c@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_021210_858424_333E5FFA 
X-CRM114-Status: GOOD (  35.65  )
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

On Sun, Aug 30, 2026 at 10:19:32PM +0200, Sven Peter wrote:
> The host routers on Apple Silicon do not implement USB3 bandwidth
> allocation registers: the CMR bit set in ADP_USB3_CS_2 by
> usb4_usb3_port_cm_request() is never acknowledged and every USB3 tunnel
> bringup fails there after the timeout:
> 
>   [   49.259325] thunderbolt-apple-nhi 501f00000.nhi: 1:16: available bandwidth for new USB3 tunnel 18000/18000 Mb/s
>   [   49.265869] thunderbolt-apple-nhi 501f00000.nhi: 1:16: maximum required bandwidth for USB3 tunnel 9000 Mb/s
>   [   49.267894] thunderbolt-apple-nhi 501f00000.nhi: 0:4 <-> 1:16 (USB3): activating
>   [   49.269410] thunderbolt-apple-nhi 501f00000.nhi: 0:4 <-> 1:16 (USB3): allocating initial bandwidth 9000/9000 Mb/s
>   [   50.771764] thunderbolt-apple-nhi 501f00000.nhi: 1:16: USB3 tunnel activation failed, aborting

Okay this kind of makes sense. Apple is doing this only via software and
this is also what Linux needs to do with USB3 Gen T tunneling so we should
prepare for this.

> Add a quirk to skip bandwidth allocation entirely but keep tracking
> the initial allocation in software for the consumed bandwidth
> calculation. For completeness, discovered tunnels book 90% of the
> maximum link rate in software, matching tb_tunnel_alloc_usb3(), although
> Apple Silicon cannot have any pre-existing tunnels.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  drivers/thunderbolt/nhi.h    |  1 +
>  drivers/thunderbolt/tb.c     |  8 ++++++
>  drivers/thunderbolt/tb.h     |  3 +++
>  drivers/thunderbolt/tunnel.c | 59 +++++++++++++++++++++++++++++---------------
>  4 files changed, 51 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
> index c2d16ab6994e..afd9a11489a9 100644
> --- a/drivers/thunderbolt/nhi.h
> +++ b/drivers/thunderbolt/nhi.h
> @@ -169,6 +169,7 @@ struct tb_nhi_ops {
>  #define QUIRK_E2E					BIT(1)
>  #define QUIRK_RESET_DMA_ON_TEARDOWN			BIT(2)
>  #define QUIRK_NO_DMA_PORT				BIT(3)
> +#define QUIRK_NO_USB3_BW_ALLOC				BIT(4)

This is not NHI thing but lives inside the USB4 domain so the quirk should
end up in drivers/thunderbolt/quirks.c.

For now I think that's enough but in the future we should provide software
mechanism that takes over the hardware if present, and then get rid of the
quirk alltogether.

>  /*
>   * Minimal number of vectors when we use MSI-X. Two for control channel
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index c43cdd2c2e2e..7ab53a30fe30 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -3044,6 +3044,14 @@ static int tb_start(struct tb *tb, bool reset)
>  	 */
>  	tb->root_switch->no_dma_port = tb->nhi->quirks & QUIRK_NO_DMA_PORT;
>  
> +	/*
> +	 * Apple Silicon host routers do not implement the USB3 bandwidth
> +	 * allocation registers: the CMR/HCA handshake is never acked and
> +	 * times out. Bandwidth for USB3 tunnels is only booked in software
> +	 * on these machines.
> +	 */
> +	tb->root_switch->no_usb3_bw_alloc = tb->nhi->quirks & QUIRK_NO_USB3_BW_ALLOC;
> +
>  	ret = tb_switch_configure(tb->root_switch);
>  	if (ret) {
>  		tb_switch_put(tb->root_switch);
> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> index 0977cd690d7e..530b0e6c3a11 100644
> --- a/drivers/thunderbolt/tb.h
> +++ b/drivers/thunderbolt/tb.h
> @@ -140,6 +140,8 @@ struct tb_switch_tmu {
>   * @nvm: Pointer to the NVM if the switch has one (%NULL otherwise)
>   * @no_nvm_upgrade: Prevent NVM upgrade of this switch
>   * @no_dma_port: Prevent adding the DMA port of this switch
> + * @no_usb3_bw_alloc: Host router does not implement the USB3 bandwidth
> + *		      allocation registers (ADP_USB3_CS_1..4)
>   * @safe_mode: The switch is in safe-mode
>   * @boot: Whether the switch was already authorized on boot or not
>   * @rpm: The switch supports runtime PM
> @@ -196,6 +198,7 @@ struct tb_switch {
>  	struct tb_nvm *nvm;
>  	bool no_nvm_upgrade;
>  	bool no_dma_port;
> +	bool no_usb3_bw_alloc;
>  	bool safe_mode;
>  	bool boot;
>  	bool rpm;
> diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
> index 7e8284575dff..9178120a6b66 100644
> --- a/drivers/thunderbolt/tunnel.c
> +++ b/drivers/thunderbolt/tunnel.c
> @@ -2268,24 +2268,40 @@ struct tb_tunnel *tb_tunnel_discover_usb3(struct tb *tb, struct tb_port *down,
>  	if (!tb_route(down->sw)) {
>  		int ret;
>  
> -		/*
> -		 * Read the initial bandwidth allocation for the first
> -		 * hop tunnel.
> -		 */
> -		ret = usb4_usb3_port_allocated_bandwidth(down,
> -			&tunnel->allocated_up, &tunnel->allocated_down);
> -		if (ret)
> -			goto err_deactivate;
> +		tunnel->consumed_bandwidth = tb_usb3_consumed_bandwidth;
> +
> +		if (down->sw->no_usb3_bw_alloc) {
> +			/*
> +			 * The host router does not implement the bandwidth
> +			 * allocation registers and nothing can be read back
> +			 * here. Book 90% of the maximum link rate in software
> +			 * instead.
> +			 */
> +			ret = tb_usb3_max_link_rate(tunnel->dst_port, down);
> +			if (ret < 0)
> +				goto err_deactivate;
> +
> +			tunnel->allocated_up = ret * 90 / 100;
> +			tunnel->allocated_down = tunnel->allocated_up;
> +		} else {
> +			/*
> +			 * Read the initial bandwidth allocation for the first
> +			 * hop tunnel.
> +			 */
> +			ret = usb4_usb3_port_allocated_bandwidth(down,
> +				&tunnel->allocated_up, &tunnel->allocated_down);
> +			if (ret)
> +				goto err_deactivate;
> +
> +			tunnel->pre_activate = tb_usb3_pre_activate;
> +			tunnel->release_unused_bandwidth =
> +				tb_usb3_release_unused_bandwidth;
> +			tunnel->reclaim_available_bandwidth =
> +				tb_usb3_reclaim_available_bandwidth;
> +		}
>  
>  		tb_tunnel_dbg(tunnel, "currently allocated bandwidth %d/%d Mb/s\n",
>  			      tunnel->allocated_up, tunnel->allocated_down);
> -
> -		tunnel->pre_activate = tb_usb3_pre_activate;
> -		tunnel->consumed_bandwidth = tb_usb3_consumed_bandwidth;
> -		tunnel->release_unused_bandwidth =
> -			tb_usb3_release_unused_bandwidth;
> -		tunnel->reclaim_available_bandwidth =
> -			tb_usb3_reclaim_available_bandwidth;
>  	}
>  
>  	tb_tunnel_dbg(tunnel, "discovered\n");
> @@ -2365,12 +2381,15 @@ struct tb_tunnel *tb_tunnel_alloc_usb3(struct tb *tb, struct tb_port *up,
>  		tunnel->allocated_up = min(max_rate, max_up);
>  		tunnel->allocated_down = min(max_rate, max_down);
>  
> -		tunnel->pre_activate = tb_usb3_pre_activate;
>  		tunnel->consumed_bandwidth = tb_usb3_consumed_bandwidth;
> -		tunnel->release_unused_bandwidth =
> -			tb_usb3_release_unused_bandwidth;
> -		tunnel->reclaim_available_bandwidth =
> -			tb_usb3_reclaim_available_bandwidth;
> +
> +		if (!down->sw->no_usb3_bw_alloc) {
> +			tunnel->pre_activate = tb_usb3_pre_activate;
> +			tunnel->release_unused_bandwidth =
> +				tb_usb3_release_unused_bandwidth;
> +			tunnel->reclaim_available_bandwidth =
> +				tb_usb3_reclaim_available_bandwidth;
> +		}
>  	}
>  
>  	return tunnel;
> 
> -- 
> 2.55.0
> 

