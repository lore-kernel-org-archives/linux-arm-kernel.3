Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10728C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 20:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wK+kLL3ofBUa9HVa+9T566UL4xro0DCdbR7BZ4cxWTE=; b=BMK8jhQ5o8rmD9mwWduquHBRg0
	9BGL2NhLwytbylKpANPRFe9jN7vtm7753aXffhbHQYd4uVhjCM/2632rGYHWKSWwfeHIa65FciHrs
	/atEmQUvT+GQZcxZznIBJ+i/r9LP2eVD9oeWLgNTfoz2cG55k7/LCjj1mYUdTg8sHlBKPe7FABB+o
	qPnc4JX5sDlod9I9wzd8K6iWsZ6cJOsIDNi/GLLcA3+/YHoh+OyFlT986FyJypwOPUdDQqdkQB6hX
	ZaQ6OTExHzE8LfN1wj9WbZHJcgHYV6ay6mc5L1AJE8Y71FB+XcFBEVfaSIUWWDLVsVlxR3nAkgkh2
	Svgz8+MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG1bc-00000004YuR-29Et;
	Fri, 16 May 2025 20:24:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG1Ua-00000004Y4X-2lK3;
	Fri, 16 May 2025 20:17:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D8CC05C024A;
	Fri, 16 May 2025 20:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C9B1C4CEE4;
	Fri, 16 May 2025 20:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747426635;
	bh=gdghEq68rS4dPfk9w/Dn9+8ctElaEIgaJKGdi8w2LsI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cC+TjSS/6y17tbIKaZGsUJoPoCD1aU/C16eEMGQPyvJ9FM3znQC7DENjYVkdt70Jh
	 aFOIkPu/qJkm3eWmq1rZ2IciIRicDngFiXU/dDFBxngh3y8GA6Wvms3mKF9TBmdNFZ
	 6Ip4GISVjxFV4aqS7OtJ3OWKMATh3yfxhYQfPgtaJF3bvXCNoXjFNAWo1/jWsdwbOj
	 PKDyYPwhzcuV8TMg9FkaF8jKMQ6Ph4dVqc7AAl881N/gOMY4aLKf74zn5KFQuQnZ5a
	 mlhX1lzFp+/ApepbLqGVDxBdxj0XGVweXkfe4TRVDRA5JOcUHIvUX7elCJNqi29r4C
	 fXGzduw+HA5kg==
Date: Fri, 16 May 2025 21:17:11 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3 1/4] net: airoha: Fix an error handling path in
 airoha_alloc_gdm_port()
Message-ID: <20250516201711.GK3339421@horms.kernel.org>
References: <5c94b9b345017f29ed653e2f05d25620d128c3f0.1746715755.git.christophe.jaillet@wanadoo.fr>
 <aCZZyDvp-TZ7AFwS@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCZZyDvp-TZ7AFwS@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_131716_738569_D25C98B1 
X-CRM114-Status: GOOD (  11.54  )
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

On Thu, May 15, 2025 at 11:16:56PM +0200, Lorenzo Bianconi wrote:
> > If register_netdev() fails, the error handling path of the probe will not
> > free the memory allocated by the previous airoha_metadata_dst_alloc() call
> > because port->dev->reg_state will not be NETREG_REGISTERED.
> > 
> > So, an explicit airoha_metadata_dst_free() call is needed in this case to
> > avoid a memory leak.
> > 
> > Fixes: af3cf757d5c9 ("net: airoha: Move DSA tag in DMA descriptor")
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>



