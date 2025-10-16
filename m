Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FE1CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 15:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/17roYdKr+GzN9DHpwztR22HOpJRCT0nyR9yz9jCU4Q=; b=F0rnl/BtV8kLKrfbyG5ImUnyrr
	IMqJyaprKdlqRvbxjYQMeIgSTUpcUPcj+ggf4pIDiilWWrNkWPyblm1YGHxhJ1Ce1z9VSPIM34FM8
	Xh9zWSzQ8E4lwBy9L4dhUnrkgyjRnaK/U1IMxmiYV2NBlMU5s8CdSh8zyRiO35MKiUpvd1aJujhWD
	Kg7i2pXif/uhBrY8HvyCw4O9oHOKBZ7kZXNyIDyVQC2FNNiUvxxdevo1DuJkiaAMPVrsyw1no8E5l
	KeOaYOKD3xM1eohCbu5Qj26DUcRe6kwhs7OX9ebcrc1hFjiw6DOzy5ie2Ka4M5Tzg4I7LEk7WTQ9L
	91jSnJhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QOE-00000005JLw-0Bzn;
	Thu, 16 Oct 2025 15:59:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QOC-00000005JK0-0pnK;
	Thu, 16 Oct 2025 15:59:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9ABEC64037;
	Thu, 16 Oct 2025 15:59:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7CE6C4CEF1;
	Thu, 16 Oct 2025 15:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760630379;
	bh=SJlzwOOY6t7zuzTUWnggtH3r47vy917/ILKlY4X2z2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k6wE2v29DTycMLwHb8XFJFqEWdwScI3nta6k826+Pg1j67L2VFtrhbBTmBaugVUej
	 a+2ERtrJD+AOE15b+x1ojsY5O5/mNRHit3m6j81bDRTPLggc6kDN/01J4kiVela95u
	 3iUEvnxEZjzfswNFVKsvBGsvPrvsZV9PK2IqAr6Ucmk/wU+At16EPsw5wH41aWp1s+
	 dJs4ufb0xmzWOwFoAIfLqOAOtZ+OsmNL67vpBBaeFtwkvR/LkAVjnnhJ/DU4mGtLkc
	 aV2S/KL9pUSZBuMpgvNmMVsR8qHaHR5XDuqbkcr4ffMAxDkXf9AdkP3UzUU2pA6Hzi
	 3Q4X0CkfTXEaQ==
Date: Thu, 16 Oct 2025 16:59:34 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v2 10/13] net: airoha: Select default ppe cpu
 port in airoha_dev_init()
Message-ID: <aPEWZhetZ74NVgjr@horms.kernel.org>
References: <20251016-an7583-eth-support-v2-0-ea6e7e9acbdb@kernel.org>
 <20251016-an7583-eth-support-v2-10-ea6e7e9acbdb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016-an7583-eth-support-v2-10-ea6e7e9acbdb@kernel.org>
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

On Thu, Oct 16, 2025 at 12:28:24PM +0200, Lorenzo Bianconi wrote:
> Select the PPE default cpu port in airoha_dev_init routine.
> This patch allows to distribute the load between the two available cpu
> ports (FE_PSE_PORT_CDM1 and FE_PSE_PORT_CDM2) if the device is running a
> single PPE module (e.g. 7583) selecting the cpu port based on the use
> QDMA device. For multi-PPE device (e.g. 7581) assign FE_PSE_PORT_CDM1 to
> PPE1 and FE_PSE_PORT_CDM2 to PPE2.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


