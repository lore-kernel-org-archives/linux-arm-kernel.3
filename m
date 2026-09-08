Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD670C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 08:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=evTVsArVkjw/HqhPNx1c7QC+crugD4MQPhZEQL5jwlY=; b=XGBLnHuBlADlVm4+yiMJcJWKgc
	7Q5sAGlVbTgTGAgPANy4IJl8v//Qx3cfqHlupHGFnLXUdFskUmmN9impzdNadRttwU/D5NzmdgbMB
	12sB+k/QB3uBowDD7vmKTzGGUcXqlL0HXTXAZeZaJn8yG2r0P5yZjo8pVRrd5sMSsk2m/Zf2PsmmP
	W0xMHmLCRay51zHRbN4Qn93r6Jl9uWE/o/P6SysMWlyT5HqGEGml46+mc9pfKOkU5zvueMh+0sWud
	cAKn7e/1y6UCyTbo483Ho0PF9gsuKx8+bjHZ6nFxKHSDFMVdU45uaMWDEgrvaPmyP6YPOCYOyRCBB
	f2rl/asQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rWY-00000008T1C-0yK2;
	Tue, 08 Sep 2026 08:49:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rWX-00000008T0u-1lnG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 08:49:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D8BE560A93;
	Tue,  8 Sep 2026 08:49:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 296BE1F00A3A;
	Tue,  8 Sep 2026 08:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788857388;
	bh=evTVsArVkjw/HqhPNx1c7QC+crugD4MQPhZEQL5jwlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ux/6rO6WyuwRd+OGVJ78umAyZo6l9Bd2fqaSBTx2B8ZPGSUqSwd+e+yFn7eoSiy/I
	 yKI+9eHTCgRGCzskJizrsD9MSpz1NfzeFUh4Yb9jO4wZeUZ5WeIzRyzgMvNQnUAc6o
	 Y86+KAHVmcI7DSW+36vy34jQEn5EnoJ8z43eHno1Lj48LmpLG25przrp8D5RgqTgEg
	 P8MTlqi8tyZoNGPNSnrIOXJ6AqEAstWaTdDUK1e4g7c5KGt75gN2slwRtvcNE0L3K8
	 nwVTLhHCUQwO+1H4v90NAe0+SOURn/NmHcy4tLLS/SHfLDkV+r+nylMP9H304iJyc/
	 tNLIw3J8jHc8Q==
Date: Tue, 8 Sep 2026 09:49:44 +0100
From: Simon Horman <horms@kernel.org>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: netdev-bot+sashiko@kernel.org, radhey.shyam.pandey@amd.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, michal.simek@amd.com,
	andre.przywara@arm.com, hancock@sedsystems.ca,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v5 3/3] net: xilinx: axienet: Fix IRQ error
 handling
Message-ID: <20260908084944.GN40544@horms.kernel.org>
References: <20260903073252.339250-4-phucduc.bui@gmail.com>
 <178880965548.219967.14368880612178322930@kernel.org>
 <CAABR9nFGduckDNRGBt0NHdSHNPo1pKD1PJbtpw1eUqL200LCdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAABR9nFGduckDNRGBt0NHdSHNPo1pKD1PJbtpw1eUqL200LCdQ@mail.gmail.com>
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

On Tue, Sep 08, 2026 at 09:51:26AM +0700, Bui Duc Phuc wrote:
> >
> > Critical: 0 · High: 1 · Medium: 0 (1) · Low: 0
> >
> > - [High] Incomplete fix: the axistream-connected branch of
> >   axienet_probe() still cannot request a probe retry, and this patch now…
> >
> 
> irq_of_parse_and_map() has always folded every failure into plain 0,
> with no way to tell "not ready yet" from "malformed DT". Before this
> patch, that 0 was already turned into a terminal -ENOMEM, not
> -EPROBE_DEFER, so there was no retry path to begin with - this patch
> doesn't remove one, it's a pre-existing API-level limitation.
> 
> > Pre-existing issues:
> > - [Medium] DT binding and driver disagree on interrupt index ordering.
> >
> 
> This is a pre-existing issue, unrelated to this patch. I'll keep this
> patch's scope as is.

Thanks, agreed on both counts.

Reviewed-by: Simon Horman <horms@kernel.org>


