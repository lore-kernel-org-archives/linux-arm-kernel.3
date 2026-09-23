Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3FCC982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 09:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C3iALwKhweGWgTgs/ynHjahU+T6YJ3fzthsWNjuqcpg=; b=VWe1+6/A1HT2gqN/pR3u6571W0
	TOkyhC2QEbN6aFJ/sCjeUTLnJuB+pVaCvWhrYfp7W+6LNK17La0G/tLSp0xujOs/SLzhQsh6CEkWG
	THWfCawOYnJHTa+dNbgokJ1lPV+LJYKhXn2K5QM+JU3aLnQeh/j95o25aD+AbsxTIQESy1M1kWkq9
	gGIpgtDW1hdXHuYPlOZMnzMAY/IbMKrr3Ygr3bufQA+a2x4bnoPbaFQXprPkuCD4hx/uXNLMM2m32
	FYiTxSkbK8wBAPhmAr7vhWikUTRau1s+7ip4NW9CPj+19Ybur7RQXtEsT7G7p/hmNh//4paZL7Ee6
	U8Fiba7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ir4-00000007eK4-3jyq;
	Wed, 23 Sep 2026 09:01:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ir4-00000007eJa-00M9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 09:01:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7255D601FB;
	Wed, 23 Sep 2026 09:01:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B18C1F000FF;
	Wed, 23 Sep 2026 09:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790154089;
	bh=C3iALwKhweGWgTgs/ynHjahU+T6YJ3fzthsWNjuqcpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KQDVBRwgaZwcyX5kpUVev23cDupF4Yh0z/fQO5qma/hc1uSWR8aM3MyA/UoS0L4Xo
	 bzk2Kxuq/oqwzFX1QgelXBLrA3Si7Ttj7nClPFH9WklMhJN+O0Ik3wOZxjNuQ1ueoi
	 Snw0YyzBU0UJZNACEiSNy2w5aeGPhmI1Ncdv0uUrN5tA9RD9GHHPP+78+sSxbbXBmr
	 fn9OLDprYrYuhrQNcL6V7CkdphZZJ65tn1kdFp9R3qHl/Kx/Bvv6hHt/SGsm8lRhz+
	 wytn/6x4dJlHU+gzet1xW3w2o7CsJUu9jfW3j8X/p/jq60GgcUg+OofmGnWbjRMiHc
	 9UZk/FFH3rBzw==
Date: Wed, 23 Sep 2026 10:01:23 +0100
From: Simon Horman <horms@kernel.org>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	UNGLinuxDriver@microchip.com, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Herve Codina <herve.codina@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mohsin Bashir <mohsin.bashr@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v7 08/14] net: lan966x: clear FDMA interrupt
 stickies after switch reset
Message-ID: <20260923090123.GQ13925@horms.kernel.org>
References: <20260918-lan966x-pci-fdma-v7-0-0ecc179c8a2c@microchip.com>
 <20260918-lan966x-pci-fdma-v7-8-0ecc179c8a2c@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260918-lan966x-pci-fdma-v7-8-0ecc179c8a2c@microchip.com>
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

On Fri, Sep 18, 2026 at 01:34:00PM +0200, Daniel Machon wrote:
> When in PCI mode, the GCB soft reset issued by the reset controller
> can latch spurious bits in the FDMA error stickies. The latched bits
> sit in FDMA_INTR_ERR until the FDMA IRQ is requested later in probe,
> at which point the handler fires immediately and WARNs.
> 
> Clear FDMA_ERRORS, FDMA_INTR_ERR and FDMA_INTR_DB right after the
> switch reset so the FDMA comes out clean and the IRQ handler does not
> see ghost errors on probe.
> 
> The clear runs on both the PCI and platform paths. On the platform
> path it has no effect — there are no spurious stickies to clear — but
> keeping it unconditional avoids a PCI-specific code path here.
> 
> Tested-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>

Reviewed-by: Simon Horman <horms@kernel.org>


