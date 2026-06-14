Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E110BCD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 22:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KjrYwf8+CGJvAspf62xTPMZf7Nn80nEbSHBElVWQDkE=; b=oPaAL02t5Ii6PvQm2+pBw8cCWT
	w/hhdpYKsLWbe1slCbIwHFQd3Qn0pOboWO1w7YopicG+fCgk5KdBNgpI4D+K9Fy2SpaO5BR3oXP2O
	84jB8wXYa8gmIImV1Z29cUoQ2MVBNC1Mc6fFZf1yNHlD627cEyp8GP/PYbCSwuzQYUuxmkqB702Fg
	PLapuS8E1YkufOp3koWM/elNivYQekquBIhoJop5c67mUc+4dfLlFHIQW2Pt4qvvg93wFgQniNbyD
	mSqeNZCn+y9iiE3XFh0bsBfvBfR158Nu8+Zj7Zvh7e9BGnWB0MN46VcoqBssMeAIhaDpkIMqgupky
	20kR06wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYt28-0000000DKV1-3zJ9;
	Sun, 14 Jun 2026 22:10:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYt28-0000000DKUt-1rCP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 22:10:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 321AA6008A;
	Sun, 14 Jun 2026 22:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43BD91F000E9;
	Sun, 14 Jun 2026 22:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781475022;
	bh=KjrYwf8+CGJvAspf62xTPMZf7Nn80nEbSHBElVWQDkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SKVGDZMlDwKSdV+mCoh4SzN/s8m1vBmqFQzzeqloVuQhd7goh/9aVp9oHfh/FwD9J
	 30OcTAEXHGV635FFw9hR5A5wjn365MOefiD8PMMB/DY83xjtk7Wo/EG3+cFOsyNlBc
	 ll0LRb2fcj+BIjEUWFdLxNRAS6H++LuGmKRk//wKHH618f4m32x7gC9b5P0fzIh6+E
	 EKBbnhlAXHbOoNdaFhGU1JV8krUDzJWVhaKRbWZoeL0RoBPKwnvuS/MWbqW3TINz4e
	 cIYCm4ruDyJdb9wp/y+hI8LNMYU0acd32l7asH8pxPBfjJOBbWmcrHnLgZbGfNsjBD
	 pYQly6W18oSnA==
Date: Mon, 15 Jun 2026 00:10:18 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: brgl@kernel.org, khilman@deeprootsystems.com, chaithrika@ti.com, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH] i2c: davinci: Unregister cpufreq notifier on probe
 failure
Message-ID: <ai8lzZi-vWvkQlIF@zenone.zhora.eu>
References: <20260610030513.2651018-1-haoxiang_li2024@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610030513.2651018-1-haoxiang_li2024@163.com>
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

Hi Haoxing,

On Wed, Jun 10, 2026 at 11:05:13AM +0800, Haoxiang Li wrote:
> davinci_i2c_probe() registers a cpufreq transition notifier before adding
> the I2C adapter.  If i2c_add_numbered_adapter() fails, the probe error path
> releases the device resources without unregistering the notifier.
> 
> Add a dedicated error path to unregister the cpufreq notifier after
> i2c_add_numbered_adapter() fails.
> 
> Fixes: 82c0de11b734 ("i2c: davinci: Add cpufreq support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>

merged to i2c/i2c-host.

Thanks,
Andi

