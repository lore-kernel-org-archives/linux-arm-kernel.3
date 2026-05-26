Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556A9CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 23:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Evk5EyspxzR6ZavlVSKWDIaFwkdiVPIwBA4H+nbGGoY=; b=GRLTxbqVGoJcw/sheUBMkGLpGG
	uvt+oXmVZ+uTx0NI5lKw2Ssfiu4aTSHF04NYCSyWxJ6BTRruD0MRN7od32Av5wOTvMjKwyHnAAmlp
	tM2BXPd9UlVIrrFzNskG1v1LZyr80Y6B0JMNqUf8R8vPuzrxYfmkWSdGhFGpuobeECaEt7WGAvaOa
	pOMDk5M/VQYH9Nu4O2o7h0dAgS6gjE1lxDE+wmcvYhzTyjqh6KifGl0SG/rMUCXRQOaohSSOjqoBs
	IMIzhyFqOzIOMbKbZLsu2njdM1x7AlU3JYXxmwg18MolFXQwZXkOFkVfXd2cA7PStWsSXHhIWf0Py
	+zPQraxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS18Q-000000033C2-1LCm;
	Tue, 26 May 2026 23:24:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS18P-000000033Bm-1YD4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 23:24:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6DDB060018;
	Tue, 26 May 2026 23:24:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B99F1F000E9;
	Tue, 26 May 2026 23:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779837868;
	bh=Evk5EyspxzR6ZavlVSKWDIaFwkdiVPIwBA4H+nbGGoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eS4FN6v5uZF6WQYUBPar9j7uTNCbODjlFVd+n3nx3EOeWEwfxSXhTnUC57RLoJELO
	 xJoQsD5GkXSt7c9KJRLR173aW/6bzbOtj6G9+AT6Ua3AdySnAXf9tImtIVWrlBuKP+
	 vFN0AK/ITu3cr15Sxw/jvyWHWGS1HCFENaq9HflT/Qoj3Hu88Sp1zG2xsxID1IE9lF
	 trcXrtalYMk7KacS7ArR0Wqh2XVMkjK4gPVKvuIVYDS7zxIuVonyHC9xfVujO9JwN5
	 Io5iKxMUkW4YwPaiWRJ62by6oGvEoa+4vUMFj7vp6xmHLdnKWJBYcTuPUaMIAw91vN
	 hmgSSA9TtzPYg==
Date: Wed, 27 May 2026 01:24:23 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Cc: brgl@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v4] i2c: davinci: fix division by zero on missing
 clock-frequency
Message-ID: <ahYrkrqk4WzA4QNy@zenone.zhora.eu>
References: <20260526102240.4949-1-chaitanya.msabnis@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526102240.4949-1-chaitanya.msabnis@gmail.com>
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

Hi Chaitanya,

On Tue, May 26, 2026 at 03:52:40PM +0530, Chaitanya Sabnis wrote:
> When the 'clock-frequency' property is missing from the device tree,
> the driver falls back to DAVINCI_I2C_DEFAULT_BUS_FREQ. However, this
> macro was defined in kHz (100), whereas the device tree property is
> expected in Hz.
> 
> The probe function divided the fallback value by 1000, causing
> integer truncation that resulted in dev->bus_freq = 0. This triggered
> a deterministic division-by-zero kernel panic when calculating clock
> dividers later in the probe sequence.
> 
> Fix this by redefining DAVINCI_I2C_DEFAULT_BUS_FREQ in Hz (100000)
> to match the expected device tree property unit, allowing the existing
> division logic to work correctly for both cases.
> 
> Fixes: b04ce6385979 ("i2c: davinci: kill platform data")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/20260514044726.57297C2BCB7@smtp.kernel.org/
> Signed-off-by: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

merged to i2c/i2c-host-fixes.

Thanks,
Andi

