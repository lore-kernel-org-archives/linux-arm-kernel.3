Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6115EC01C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 10:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Gb2CcMURLy7vHBxtOqlaDyag0diZg8j9Xfj6Wyl6Qo=; b=gdS0YRf/3srE4vtGG1pMoUAiqx
	pzzBm3PgsW3c0EWBJE+TJQdNEwuqMlLxUCFChtLRWQT01D63OFR4nQFLO+ZMEpCs4RNk9UhKhrbIy
	cFaLhU6ML12QwvQVA5FD4LHsLcbp5AmcEYx+VcENhC/LehfCfBR751+t66nWTza1HktPr1jcAxOjC
	ip5/enoCbxvwjAHXjeYHXaGobNhV9zd6hzCfXzl1Fj6/aUllJ3V62A6uEOKv9dnRSdidK9Z4znNjo
	7Gz8iUpF+vZZhX3Jrot52jioRM3mFUcPmXPbwJ2V/oO3mMUJK7ZrKV+iUNHp7EqTqMfrAbGoxfB+V
	ZUJQAbTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cwb-0000000GYBn-2Xl9;
	Mon, 23 Mar 2026 10:55:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cwa-0000000GYBL-2ISl;
	Mon, 23 Mar 2026 10:55:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 26685600AC;
	Mon, 23 Mar 2026 10:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA31FC2BC9E;
	Mon, 23 Mar 2026 10:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774263334;
	bh=fIITDcaGNwe5JP28V/vDN52AYvBQ5hQKU+YhsH32KVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b/PsizxYuPyh6p+66BxpCqyKvwMg0/n0RigMKooGpzRMCF4lzfCXQyW3dQsZ+5rXZ
	 XjqstYEDmG0E8vAJiy9gQhC7NZ9hX8sCxg7l5D988q6XMD+SILzjhyGAU8q3dRAN78
	 JNVtoTFgUuHHodeau+xR5peYZmjlDr0LbMwUe4A83DvMOd4wuYFoRkroDNcMrDxZWB
	 Hs37S+U9xt3IKK/WhCXPklgEGRT2k15gX4lH6tQxbn44J31YcQfDOQCQ0rXEqkaipC
	 nIeSNcnZxdQq+zPtvOdFGIWQi4c2sYryx+aEUt+VyE8U1UCOrISPvVJnPADHDb8w66
	 aSFONyy70KK4A==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w4cwW-00000003XqX-1ggo;
	Mon, 23 Mar 2026 11:55:32 +0100
Date: Mon, 23 Mar 2026 11:55:32 +0100
From: Johan Hovold <johan@kernel.org>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Dongliang Mu <mudongliangabcd@gmail.com>, linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: meson-spicc: Fix double-put in remove path
Message-ID: <acEcJJgoaaOdBz70@hovoldconsulting.com>
References: <20260322-rockchip-v1-1-fac3f0c6dad8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322-rockchip-v1-1-fac3f0c6dad8@gmail.com>
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

On Sun, Mar 22, 2026 at 09:29:56PM +0800, Felix Gu wrote:
> meson_spicc_probe() registers the controller with
> devm_spi_register_controller(), so teardown already drops the
> controller reference via devm cleanup.
> 
> Calling spi_controller_put() again in meson_spicc_remove()
> causes a double-put.

Indeed it does: 

Reviewed-by: Johan Hovold <johan@kernel.org>

> Fixes: 8311ee2164c5 ("spi: meson-spicc: fix memory leak in meson_spicc_remove")

While only root can trigger this it should probably still go stable:

Cc: stable@vger.kernel.org

> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

How did you find this one? Are you using some kind of static analysis
tool or LLM?

Johan

