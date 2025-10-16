Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7664CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 15:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bpzV9RgmuYA5Ksl/4M2XHkUxmiT+no7vL8lDP6Drqjs=; b=ZBbP2u1/YOZkR94hy8DGugWqnV
	ncboszHbJHW9mO0UIcsE/oAjhDn+OjwTApI0+BWg9i/xiTtARqOYCirfB6nljry9HAX+oVas8FAzi
	qbnehCj2W39ZG1AsdotWLt9tCLNNp1RMdw3dwkkPlXBkCBjgn//cJhPlmUDt6e2mlLSZlaej9rmfk
	YkcE/mk4NUppzorVMrrKlanRZxurHW287q2tT1+Lc2yfUHCn7m/ssrkrpIvBDjgmzM6jZI5pgpn/H
	AizH32BSmSlJ6GI7pVwVw6kgzq7H4y6jxXmgZf3zOf2+gji6Tj1X99+dClx5Xhtf87inMxHwGnakS
	U+zjplOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QIt-00000005HB1-31lB;
	Thu, 16 Oct 2025 15:54:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QIr-00000005HAD-2a5f;
	Thu, 16 Oct 2025 15:54:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CD66064013;
	Thu, 16 Oct 2025 15:54:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAD18C4CEFB;
	Thu, 16 Oct 2025 15:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760630048;
	bh=MzbQ2BY+xkSQDjQHaiNk2TeebhTVZYDmnm7F8+q9KHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ICMMHz+rh+Oy/eceOUktsQjXuWuXOPJuWINTXnkn0zPWMs8d4XlCQF5zPTIwunhfv
	 suUTNdZdTUg7ztTsPIjyCA/jegFv+M9IJHkb/O0DXAY3kWNIOy+1n1ejALSvWuFZFO
	 vT1VKA+TjXeh2fkX2EJBTcTFC3NwA+Qwvpjr41Tt2cVY4lH5QCQaIywSn/K2v4vK29
	 dD1D5MfPVQPUc8VHj5+ahgdXuvzIcPcHLEWyIMKg8A059HUMEjH81sVx690GnTkiFy
	 ZlKY1arAUEms2HW4jzQYJ5t+WB73ghVMr7A9BWaUMth9kdJ41Z5aaAcUMNJ/35kvWw
	 zCfhKIeRZ1mMg==
Date: Thu, 16 Oct 2025 16:54:03 +0100
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
Subject: Re: [PATCH net-next v2 08/13] net: airoha: ppe: Configure SRAM PPE
 entries via the cpu
Message-ID: <aPEVG0smO9lUek4W@horms.kernel.org>
References: <20251016-an7583-eth-support-v2-0-ea6e7e9acbdb@kernel.org>
 <20251016-an7583-eth-support-v2-8-ea6e7e9acbdb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016-an7583-eth-support-v2-8-ea6e7e9acbdb@kernel.org>
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

On Thu, Oct 16, 2025 at 12:28:22PM +0200, Lorenzo Bianconi wrote:
> Introduce airoha_ppe_foe_commit_sram_entry routine in order to configure
> the SRAM PPE entries directly via the CPU instead of using the NPU APIs.
> This is a preliminary patch to enable netfilter flowtable hw offload for
> AN7583 SoC.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


