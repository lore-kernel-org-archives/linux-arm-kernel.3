Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC2CC982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 09:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SSNNLlOcgV5+a/p7HUMpI0Cbgs5lb/bti2MHEm0fkBU=; b=GicvQpNRi0oRz4MI9doYo/HxCl
	3cklDW5OUmW0qnW7eIK+8QRZRlDPpxr3Opm0CMUNngsV5X7nXiQiyRX3Hx4shIabK5y9eF/85S7vw
	wAjqdwvsBwW+1GWAamSbWmIBbVCrGNKdpqv/lAQmXXwJf2XcTNAD74BSX7/f0J3VGEf8Os9xOrv/b
	PnnjAM20u0lBXiHCBkUpGhgdDIkqGhsp1FFUquk4cte68kERy7y/l8uG9i2ADU1ki5RhSlijvRb/v
	VtH0TCX70xCjK5UocXzoH3Nud37+lSmCN1gmIWtZWIhTq8B7oUC6wdn1OMxQAqsuJZG0kUy0rcqPJ
	frzzbqFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IqS-00000007e2D-0zXu;
	Wed, 23 Sep 2026 09:00:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IqQ-00000007e1N-1aio
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 09:00:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E732601F0;
	Wed, 23 Sep 2026 09:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A291F000FF;
	Wed, 23 Sep 2026 09:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790154049;
	bh=SSNNLlOcgV5+a/p7HUMpI0Cbgs5lb/bti2MHEm0fkBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fpm5fEi1NJSxefT9yqK6u/GKP9/fciJCIfL5mC5R83B3StrmalHVvuT3Abv0IMGYm
	 CxU+NXzWPV3OHBsHrikPoQQgJlFB6vz3XbaHjn0vSCgSzfTZ+0Rm6pfntzrdfaVcJh
	 SjdZQmAN3ziidT5cQjJPfGGqAVzTmSlUKL5gqGOxfbyqrtUMvsh2ys/oTBOGTAsKd/
	 O+Ap167UvdK2i2ufMWuukI9HVP6451qIJOgFHaTAeg3i5VY1wx47dMFu14xh9wVt4s
	 GgzKpMjD7htnjvpqnDsQuUVTvtAquCa7LeKIwBpwP2YQ6LBRIlukT7ATAeMYtMahQp
	 2qsnrTJ0EmbAg==
Date: Wed, 23 Sep 2026 10:00:13 +0100
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
Subject: Re: [PATCH net-next v7 07/14] net: lan966x: add FDMA ops dispatch
 for PCIe support
Message-ID: <20260923090013.GP13925@horms.kernel.org>
References: <20260918-lan966x-pci-fdma-v7-0-0ecc179c8a2c@microchip.com>
 <20260918-lan966x-pci-fdma-v7-7-0ecc179c8a2c@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-lan966x-pci-fdma-v7-7-0ecc179c8a2c@microchip.com>
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

On Fri, Sep 18, 2026 at 01:33:59PM +0200, Daniel Machon wrote:
> Introduce lan966x_fdma_ops to support different FDMA implementations
> for platform and PCIe. Plumb fdma_init, fdma_deinit, fdma_xmit,
> fdma_poll and fdma_resize through the ops table, and select the
> implementation at probe time. Only the platform implementation exists
> at this point; the PCIe implementation is added in a later patch.
> 
> Tested-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>

Reviewed-by: Simon Horman <horms@kernel.org>


