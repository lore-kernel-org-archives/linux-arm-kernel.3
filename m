Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B21D4A5F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 04:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PTH/th3kVR++fTb/tRsf5N6veOfLySec41H0A3ANw7Q=; b=CKDIBW/EXmaZXQuzZMsaIiBsX2
	5tqCK0HVXXwTHe0D3dlNlZbHa7QwIoTMSoEQzB56XwkJdXP1/FWPJq2kIbV3TwT+vxH9Kf/kP9bVg
	pH5ZVGoONtYgnSV5ulgpkOIFPeP5Ke2d+qphUJAbT5GAcKHtUCH1js2EEhtURmfWPeyh31EOFFi6r
	fQf2Q9YLx0zmiFWbiTo6CvvjBF0Pl+++V7zV+xbiw9GLw++vXRuQszH+67sK0wZwlC0vVy4bREBKc
	7uaIJQTdDuziBaapaghQX+p4Ou3hV8b7HWnWzdGykZ2MSxG9WvYskqf3aS8An+cFZ00WhHjNkJnQS
	NTccIAKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgbBr-0000000DYkn-07x4;
	Fri, 16 Jan 2026 04:12:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgbBp-0000000DYkh-1ENm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 04:12:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6918060160;
	Fri, 16 Jan 2026 04:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5566AC116C6;
	Fri, 16 Jan 2026 04:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768536720;
	bh=4uoGgoog5Fby7u6C0Dxo43qgoE40DFXVo7FCNNGrnfU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pofHY7nkpiKhAxQyLOLbPsRy8q/x5Q/3s4n/wEkvNw0YzWKn8tw91Nl7uszQ3mN4R
	 k2af9HzewRX7zlJGADX7lewi1sxDwR2sJvcO6V2gbWRDEnpu2+F1yhW9zGSmjabsHT
	 laMMS8KVeWATcL2n55obXgFbbrSQmlqLlMbsgmAy1EQopNMfjX6TPXzU9ZNoJ+fpl2
	 5JKOlnQXI3XrLyLR1fa4cvXYy+7lYnkaU3qtdtgC+Oy7ylKTTQy/B4l/83h47iT71o
	 YGPUza2uy325wf3IlpZzXqsZaQvOe9cFyJIj121e8LQJq8wPQS5gPbnbvAOpVTCLHt
	 tic45C3RQ0WlA==
Date: Thu, 15 Jan 2026 20:11:58 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Suraj Gupta <suraj.gupta2@amd.com>
Cc: <mturquette@baylibre.com>, <sboyd@kernel.org>,
 <radhey.shyam.pandey@amd.com>, <andrew+netdev@lunn.ch>,
 <davem@davemloft.net>, <edumazet@google.com>, <pabeni@redhat.com>,
 <michal.simek@amd.com>, <sean.anderson@linux.dev>, <linux@armlinux.org.uk>,
 <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <bmasney@redhat.com>
Subject: Re: [PATCH V2 1/2] clk: Add devm_clk_bulk_get_optional_enable()
 helper
Message-ID: <20260115201158.3371bf40@kernel.org>
In-Reply-To: <20260113181002.200544-2-suraj.gupta2@amd.com>
References: <20260113181002.200544-1-suraj.gupta2@amd.com>
	<20260113181002.200544-2-suraj.gupta2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 13 Jan 2026 23:40:01 +0530 Suraj Gupta wrote:
> +/**
> + * devm_clk_bulk_get_optional_enable - Get and enable optional bulk clocks (managed)
> + * @dev: device for clock "consumer"
> + * @num_clks: the number of clk_bulk_data
> + * @clks: pointer to the clk_bulk_data table of consumer
> + *
> + * Behaves the same as devm_clk_bulk_get_optional() but also prepares and enables
> + * the clocks in one operation with management. The clks will automatically be
> + * disabled, unprepared and freed when the device is unbound.
> + *
> + * Returns 0 if all clocks specified in clk_bulk_data table are obtained
> + * and enabled successfully, or for any clk there was no clk provider available.
> + * Otherwise returns valid IS_ERR() condition containing errno.
> + */
> +int __must_check devm_clk_bulk_get_optional_enable(struct device *dev, int num_clks,
> +						   struct clk_bulk_data *clks);

s/Returns 0/Return: /
the colon is required by kdoc
-- 
pw-bot: cr

