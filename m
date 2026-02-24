Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10AADEFB7F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 09:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YEwajkDWZIIriDRhaKhIaBOdoffHhDaoBNGagaJeUoA=; b=cVHixy5KKQejwGorUp36QT7YrL
	R/07O6pO9RKmy91B9Vks7PGahE1/QeW9UtovpENrM0A7gukTS90hI22L6qyMkJ2PjKMPOslGKRo+1
	xZggVRE/BFi1ZhGb1cPV5j2a84Ipse8dwNNwJTA7n2SlVXBIuguDbRvJOQ/iMWLALG7HSu1I9JKj9
	2E86ziQay9k6xdqCdG8vZkkUoKEGLcg/b2g0zUPco5sVi74OVzKXx4lt7TbeH0boS7OT8RYHLg28A
	1dSNKZrJt+cBdXJZnJClQw6O3bPL5Lf642pu+TO9Qe6CmYfgs6m/8neFWsEPrDdrexsBpVAJHtl5r
	zECpGo7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuogf-00000001kOu-2uAW;
	Tue, 24 Feb 2026 09:26:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuogc-00000001kNB-493y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 09:26:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 90B5C409F5;
	Tue, 24 Feb 2026 09:26:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17A62C116D0;
	Tue, 24 Feb 2026 09:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771925194;
	bh=gW2ll+nM74bEEmCgEWg3HfAkPc+LIWHPoFwS1UekeLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V3VM8b648NiVpQDtl9iPxAXS0gQlH5thDEvogxog0EJOhz+ITQDgwa9p0gao+iKDo
	 al1jP6hrqySPLW/wyuN1yT9ItX+41Z326O5Iq9n0MY9fvZ4ZA956D4M1WvTmzx0XOz
	 ZEr6Z+uKu0h8yOsKpAf+o5DDDUSRZFh3z1HL6aC32bfaMYlc2oNlPUDirxUUmvoll/
	 7B9cYh6gPrHjI0q1mTQ/MxE+PhgNHq5WGMHsn1NEJD0RwY/XFIxXB7fUmsHW2WTFQz
	 cVs95gf/TAbBQzFcW/Y2yTdOae7YG6qEAGvufiafJzjr2iOFCnIH2SJdKpxJOwQahh
	 3ubd300ARbsjA==
Date: Tue, 24 Feb 2026 09:26:29 +0000
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next] net: stmmac: ptp: limit n_per_out
Message-ID: <aZ1uxX_fddwO7UYD@horms.kernel.org>
References: <E1vuUvf-0000000AfhS-0lJR@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vuUvf-0000000AfhS-0lJR@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_012635_060223_55C78347 
X-CRM114-Status: GOOD (  19.77  )
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

On Mon, Feb 23, 2026 at 12:20:47PM +0000, Russell King (Oracle) wrote:
> ptp_clock_ops.n_per_out sets the number of PPS outputs, which the PTP
> subsystem uses to validate userspace input, such as the index number
> used in a PTP_CLK_REQ_PEROUT request.
> 
> stmmac_enable() uses this to index the priv->pps array, which is an
> array of size STMMAC_PPS_MAX. ptp_clock_ops.n_per_out is initialised
> using priv->dma_cap.pps_out_num, which is a three bit field read from
> hardware.
> 
> Documentation that I've checked suggests that values >= 5 are reserved,
> but that doesn't mean such values won't appear, and if they do, we
> can overrun the priv->pps array in stmmac_enable().
> 
> stmmac_ptp_register() has protection against this in its loop, but it
> doesn't act to limit ptp_clock_ops.n_per_out.
> 
> Fix this by introducing a local variable, pps_out_num which is limited
> to STMMAC_PPS_MAX, and use that when initialising the array and setting
> priv->ptp_clock_ops.n_per_out.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> 
> This could be a user exploitable bug (although one has to be root
> so the gun is already pointing at one's foot.) This is the commit
> which introduced the problem:

Hi Russell,

From the description I assumed that for this problem to manifest
out-of-range values would need to be turned by hardware.
But maybe I misunderstand things.

Could you elaborate on the vector you have in mind?

> 
> Fixes: 9a8a02c9d46d ("net: stmmac: Add Flexible PPS support")

...

