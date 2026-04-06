Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C841E9D83B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 05:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9055rfnlg7fgk8VgLDnbJoGSSSMJhUoeMa9BriZD0iA=; b=mr57YeCCAPuClPlUkhz3387gMY
	LcpDyS+LvR7I06JwxfUQJPpVpKOqAXBvENceHEdAqrXh6zdUu3W3NJgyHWMs72LLpkN2doJGDiAmn
	V9CITeXNI52uSRRQX8T43efxgHoF/e99zBr7AdD0PtdIfr2ELSB7AqJCFzMlULoBJCGQ6K9nSURC3
	dpacOEikZBRZAuxamhVfuQJH5mabeEmHsSvhBGUnWUv6+hm5VIby9sBTVtL7p9d+3rsBad1+kqEhG
	tJVwxyKdbmXLqKDwPzymLYCb7OyBOAfa7sHubpfaOOxO9l2876yKpHOlHOYUBhIzGhWlqRASIi90E
	xeFE889w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9cqP-00000004p8z-1Gg6;
	Mon, 06 Apr 2026 05:49:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9cqM-00000004p8S-348I;
	Mon, 06 Apr 2026 05:49:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F9B540DF5;
	Mon,  6 Apr 2026 05:49:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63BD2C4CEF7;
	Mon,  6 Apr 2026 05:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775454589;
	bh=4thoVWcMmw4MkYMp3l5E6+QpX/OSrE+K9Cc8bqDe0Ss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bgXI890rX05ktv9oPv33HQAY90wguIlq0zeVRBIbmeDKXLA/c1mE1e5ydxu7hcduI
	 kTZ9nO2+CkEVZjIDQGxe5bkfu2tmthXMLqKff1bqGFPaj+08+iHC08xjxc92g1DPEE
	 KwVzjDTLqo2zhZDXkIrcuY5ezh3/H92TsCyGn+R1UdZRVT4pOQwueRJNE+JlSFvysL
	 s3ofTuZZGE6Y2soiw9bIkJ/yTIdEF/ZL9+ftN7CICVlDH8rbwnbFFIAgWY4IyHBOsS
	 w2C3bcHMNGEXDzAizYg/NRL6FHwycOJuhBHTezD2YnqnSWkNgtd7JsDL5QtQx8LstU
	 +278O8yuLefAQ==
Date: Mon, 6 Apr 2026 11:19:45 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Saravana Kannan <saravanak@kernel.org>,
	Christoph Hellwig <hch@lst.de>, Eric Dumazet <edumazet@google.com>,
	Johan Hovold <johan@kernel.org>, Leon Romanovsky <leon@kernel.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
	Robin Murphy <robin.murphy@arm.com>, Frank.Li@kernel.org,
	alex@ghiti.fr, andre.przywara@arm.com, andrew@lunn.ch,
	aou@eecs.berkeley.edu, catalin.marinas@arm.com,
	dmaengine@vger.kernel.org, driver-core@lists.linux.dev,
	gregory.clement@bootlin.com, iommu@lists.linux.dev, jgg@ziepe.ca,
	kees@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org,
	linux@armlinux.org.uk, m.szyprowski@samsung.com, palmer@dabbelt.com,
	peter.ujfalusi@gmail.com, pjw@kernel.org,
	sebastian.hesselbarth@gmail.com, tsbogend@alpha.franken.de,
	vgupta@kernel.org, will@kernel.org, willy@infradead.org
Subject: Re: [PATCH v4 7/9] driver core: Replace dev->dma_coherent with
 dev_dma_coherent()
Message-ID: <adNJebiLoHqgQEyZ@vaman>
References: <20260404000644.522677-1-dianders@chromium.org>
 <20260403170432.v4.7.If839f6dde98979fce177f70c6c74689a1904ee76@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403170432.v4.7.If839f6dde98979fce177f70c6c74689a1904ee76@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_224950_811508_246660B1 
X-CRM114-Status: UNSURE (   5.81  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 03-04-26, 17:05, Douglas Anderson wrote:
> In C, bitfields are not necessarily safe to modify from multiple
> threads without locking. Switch "dma_coherent" over to the "flags"
> field so modifications are safe.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

