Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ADC6C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 08:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1GuU9kfFUO3sRLlJpzULM0CoCktMIXeeeO2tbKm2f8g=; b=NC5Xs6RI7Dx9ujgdotb6O++dKi
	q/c62SA7JvQYflEQtaU0H8u+E5+nt2qoaBB2D0TZG0d5PzuEteWBYo/RTAF+M+P/BYjap6CgzcpYo
	QGGJQ7xSsiVvujCN1ixbbpHt/7s2jXyzwfnOGCD0vzlhblKBVIkAircIoPrD0xgNVddQ9y2hF25VG
	fDUVOmept80Lc0w3nan603fFnin/9i50Y7cd7AzngXTIEgQBiIn1NIIKs760eDKOI6y16emwPCTHU
	jRMeAiTn8I4LnvJeRMmHgbV/hqFbUHMaq7MCJumHq4QVsuUaAgYqUJFgOa1V2FoxNRkCn2gQ4hkgl
	Z4/vGG0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rIS-00000008QPV-3ENo;
	Tue, 08 Sep 2026 08:35:19 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rIQ-00000008QOo-0naA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 08:35:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788856514; x=1820392514;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jbFKZP3usfl3nbiXQQBQushr/COmFgv99A0YQe7Np5A=;
  b=fGpyb+kZTVM1ttqTFdFv8DWSPlQ9yRiNqPlITz6ElS1Li2+82h+I3k1i
   v2MRfb1yvNRS6QoW/EdS4s0f8edCvIN6sFhBB7QVUwrAJQERVj/HANwI0
   F0peH92bAjeDTVzrnR2/zyXr9WYm1tGYg0XxIJRC7WqvlUmeiNzYBs37H
   loMgxyZnPMjo8LUNNe9NMCfCvHShbFRi8SV0NzKQsD6enFieFgFVtHLSE
   VKAkbFySykgszatJNhqF/b4fHgq1t7ShC/f5K47lLE50jH5Z3aV8k1vj0
   JAZ1FaJx3+Hcd2qefPQ9/yuKHN75Z7c4D70TAhIJ+m5HCpmm1sPQdCGXb
   A==;
X-CSE-ConnectionGUID: dYFp70CjRnazou6QEMKnBg==
X-CSE-MsgGUID: Zq5K3wSQRDOlPXtSPkZASg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="93071028"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="93071028"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 01:35:12 -0700
X-CSE-ConnectionGUID: pU9Z+xzrR/emitPm4jDWdA==
X-CSE-MsgGUID: PUIMPEdDRmalDned3mUMyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="270892197"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 08 Sep 2026 01:35:08 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 8409C99; Tue, 08 Sep 2026 10:35:07 +0200 (CEST)
Date: Tue, 8 Sep 2026 10:35:07 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Sven Peter <sven@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Subject: Re: [PATCH v2 16/22] thunderbolt: Add add_links to tb_nhi_ops
Message-ID: <20260908083507.GC106095@black.igk.intel.com>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-16-1f80085f93fb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-16-1f80085f93fb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_013514_281647_F259B59D 
X-CRM114-Status: GOOD (  23.37  )
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

On Sun, Sep 06, 2026 at 08:36:39PM +0200, Sven Peter wrote:
> PCI NHI drivers discover device links through ACPI or PCI topology but
> platform drivers, like the Apple Silicon one, can use neither of those
> methods. Instead, add a callback so that platform drivers can discover
> and add these links through e.g. device tree connections.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  drivers/thunderbolt/nhi.h | 2 ++
>  drivers/thunderbolt/tb.c  | 3 ++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
> index e4964772a442..addb8bcb4849 100644
> --- a/drivers/thunderbolt/nhi.h
> +++ b/drivers/thunderbolt/nhi.h
> @@ -65,6 +65,7 @@ extern const struct dev_pm_ops nhi_pm_ops;
>   * @ring_configure: NHI specific hook to program the ring options registers
>   *		    and enable the ring with the given flags. If not set
>   *		    the standard USB4 NHI registers are used.
> + * @add_links: NHI specific hook to add device links to tunneled native ports

I just pushed a change that does similar to my thunderbolt.git/next tree.
This is to support Apple T2 macs (Intel Ice Lake based). Can you rebase
this on top of that change?

>   * @is_present: Whether the device is currently present on the parent bus
>   * @init_interrupts: NHI specific interrupt initialization hook
>   * @reset_interface: Resets the host interface
> @@ -85,6 +86,7 @@ struct tb_nhi_ops {
>  	void (*ring_interrupt_active)(struct tb_ring *ring, bool active);
>  	void (*ring_interrupt_mask)(struct tb_ring *ring, bool mask);
>  	void (*ring_configure)(struct tb_ring *ring, u32 flags, u32 e2e_flags);
> +	bool (*add_links)(struct tb_nhi *nhi);
>  	bool (*is_present)(struct tb_nhi *nhi);
>  	int (*init_interrupts)(struct tb_nhi *nhi);
>  	void (*reset_interface)(struct tb_nhi *nhi);
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index d2832323cc36..72418a07166e 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -3434,7 +3434,8 @@ struct tb *tb_probe(struct tb_nhi *nhi)
>  	 * before the PCIe/USB stack is resumed so complain here if we
>  	 * found them missing.
>  	 */
> -	if (!tb_apple_add_links(nhi) && !tb_acpi_add_links(nhi))
> +	if (!(nhi->ops->add_links && nhi->ops->add_links(nhi)) &&
> +	    !tb_apple_add_links(nhi) && !tb_acpi_add_links(nhi))
>  		tb_warn(tb, "device links to tunneled native ports are missing!\n");
>  
>  	return tb;
> 
> -- 
> 2.55.0
> 

