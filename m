Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D47DEC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 02:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DNIPX+qp+mv15F6MyRu/UL9dtic3jOnL9AKBXoTHwZE=; b=EPIe5+7AQmRfSM
	xhfHxPMlO//6XlrtEhMCScAk7m+Hzj4hAPdJij7bpbDWiub9lcPE8GoZNgIwskcSTAIKGrmew9w8N
	9lzmk2UAOfC+Qk/ZlBqlCHlT61tM5eSHyIEY3ifSpByuqW3COuwwufmhpfPIdyGLpmgXFLC/Wc+ih
	M7mHM0ceQDpgsosJQJX8JONVARAh+HMScRla4lj+rCNvXBpGP2X64EWl1be88RwV6QPDS10VbVjhl
	ayseJj5DP258Rf4LKBsuQRuGpbmfZ3PFYlN8TRoPvPE8fKkpaRTlb781YSFDtWM4rCQzJGPpImEsL
	archi9mac9wBfIeWLiWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u88bW-0000000FlAQ-3IAY;
	Fri, 25 Apr 2025 02:15:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u88Zf-0000000FkuT-3NN0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 02:13:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 404475C6543;
	Fri, 25 Apr 2025 02:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDCE4C4CEE3;
	Fri, 25 Apr 2025 02:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745547233;
	bh=zhKRqLVd26FfGbO14mufcGFlylQAXcG1racRs/okgag=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=H8xHJ3QHyW32cpizyk44/SZZ7fLssnULuTJhyh73dm6ah7nOv+8lQkBFycU3KCBQb
	 gjtKPXLpOLt2qIOu5gy+XDnYUYQpXo3IPhkXuCPr5JhYb2E/zRHT5iPtEiCrTbA8vk
	 0AtJeKfurLux9WVFiolGd6zSbmHF8wlHaDhwftUxAHifydoa4sIC1MSNia9uuKtfNs
	 x0zkRhpUpZDzLXR0ubHxp+qINQrvRLFOKckCEjDzbJVQ1guaZSlY9kZFDQdW3DAvCX
	 /DYOYrQans7jn++GyA6TCj3zsMcytNJQCpANb+tW9D/Q1gAObp27PuYKF1u3xeM+VM
	 R9ahJvStFzGDA==
Date: Thu, 24 Apr 2025 19:13:50 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Parvathi Pudi <parvathi@couthit.com>
Subject: Re: [PATCH net-next v6 04/11] net: ti: prueth: Adds link detection,
 RX and TX support.
Message-ID: <20250424191350.7bf69fdb@kernel.org>
In-Reply-To: <20250423072356.146726-5-parvathi@couthit.com>
References: <20250423060707.145166-1-parvathi@couthit.com>
	<20250423072356.146726-5-parvathi@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_191355_890558_6762EFAE 
X-CRM114-Status: UNSURE (   6.31  )
X-CRM114-Notice: Please train this message.
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
Cc: nm@ti.com, vigneshr@ti.com, tony@atomide.com, edumazet@google.com, glaroque@baylibre.com, pmohan@couthit.com, diogo.ivo@siemens.com, robh@kernel.org, javier.carrasco.cruz@gmail.com, praneeth@ti.com, m-karicheri2@ti.com, basharath@couthit.com, pabeni@redhat.com, richardcochran@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org, schnelle@linux.ibm.com, mohan@couthit.com, s.hauer@pengutronix.de, prajith@ti.com, rogerq@kernel.org, jacob.e.keller@intel.com, ssantosh@kernel.org, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk@ti.com, pratheesh@ti.com, m-malladi@ti.com, netdev@vger.kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, afd@ti.com, andrew+netdev@lunn.ch, horms@kernel.org, krishna@couthit.com, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, 23 Apr 2025 12:53:49 +0530 Parvathi Pudi wrote:
> +static inline void icssm_prueth_write_reg(struct prueth *prueth,
> +					  enum prueth_mem region,
> +					  unsigned int reg, u32 val)
> +{
> +	writel_relaxed(val, prueth->mem[region].va + reg);
> +}

Please don't use "inline" unnecessarily.
The compiler will inline a single-line static function.

