Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D01DC98314
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 06:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+B5t/jhPSXcDtCr4sgosp99GBOYZU3VlvXjJL2sNCxU=; b=g1q7UkrVAGxkvEzW2U02mCwRFC
	Ch21KkQTLYTP7k1IAbe8cE5o9m4RqCR8CN2/wMpQz3wnmRyrGS0FOCm/M3ithwnJyB5f2LvPpWUa5
	bTS50NohD6e29PFXmXpe4eit7pbp4eXt5ZCohSv9gO4sE8JSIy1Avy3CGFlZU8Sfi872UK3u7mUyN
	8UzbVfm9e5Wzao9f0r3yLDvpQKWgRjcBR+ysZU/b5QDyeaz3GasMSpx9xcNkyLkcSOUDXWWHBuOrN
	j/w9ZKihZQFOkxasbXsQOOqVgrFoiijAkmWHmh2SYIhmNOut8vL3ju5BpTi7d1ros79P1eOhk3Fkp
	2OnbsliQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dLp-0000000ACT1-0OUr;
	Thu, 24 Sep 2026 06:54:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dLo-0000000ACSZ-14Z9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 06:54:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A30C26020C;
	Thu, 24 Sep 2026 06:54:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 436DC1F000FF;
	Thu, 24 Sep 2026 06:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790232875;
	bh=+B5t/jhPSXcDtCr4sgosp99GBOYZU3VlvXjJL2sNCxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YtQngvU78cQ7bRp6A9FZCK+zxlT8nuBis2fITPldmcYR+ih+kredadetUJpdILfqU
	 axd9JXEKVJsS0qs346dBnIZzKzsMABFP2KwLW6FrtJIu4lPSquUN8rNTMSQwFf04bQ
	 OYpSY2nNfDRf2N1KddOQ8+XjxQCeCB1TeBlCE6UlkXdjcOMr76uyKj3OVeJcyvjpx+
	 xzZBMPhCqhHlYHxJEZm7aJbRm9efWZxE6zt3Bh12lyb4AgODsjxU4CtNIp4OMFO3dr
	 biP/ImfiMWiNkN4tqXFMqykzojH4LxIWYNmU9rtaKSW0TmQhevpRQEvvwCjoz6ZpNe
	 sUA5Ka/OU4pyA==
Date: Thu, 24 Sep 2026 07:54:29 +0100
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
Subject: Re: [PATCH net-next v7 14/14] misc: lan966x-pci: dts: add fdma
 interrupt to overlay
Message-ID: <20260924065429.GB13925@horms.kernel.org>
References: <20260918-lan966x-pci-fdma-v7-0-0ecc179c8a2c@microchip.com>
 <20260918-lan966x-pci-fdma-v7-14-0ecc179c8a2c@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-lan966x-pci-fdma-v7-14-0ecc179c8a2c@microchip.com>
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

On Fri, Sep 18, 2026 at 01:34:06PM +0200, Daniel Machon wrote:
> Add the fdma interrupt (OIC interrupt 14) to the lan966x PCI device
> tree overlay, enabling FDMA-based frame injection/extraction when
> the switch is connected over PCIe.
> 
> Tested-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>

Reviewed-by: Simon Horman <horms@kernel.org>


