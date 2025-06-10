Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E65FCC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=WspmaVcDEbydWz49mRe41C62W1tN79O5epvi7B4LyM8=; b=smWuD4uSswyk/a
	fn4vndLELrVPKMKNg6pzrkoRYpFLxK5Unji2MbNeue201V+iES5JrjNtKoXJVX2mPYrunUTMT5ahE
	3SVJzO8e5J7qtkrlsgDCabRiF0/UzJFGK1GRthNdCcDzpG83cl+yu4BkOj1kljAgCzmZPfaECSkIj
	VpNtPI5o9iHGeL8LoaBA6rHtTzehHEaxYKNOzJBBmun2ZUCONwb77+lCN4PW6eaKdCe8j2EiC+No/
	q4DN4jpus25Xa9Tcu9MOtVBZf5IvYWELXi09+WQOH2tH3EcgbjQF7PcZewNp/CErJqOBlfOmJmab2
	seNVww+sVFTvUJScXtVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7ld-00000008FRK-3CGa;
	Tue, 10 Jun 2025 22:48:29 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP3xt-00000007prG-06Lh;
	Tue, 10 Jun 2025 18:44:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A7E6DA5157A;
	Tue, 10 Jun 2025 18:44:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F070C4CEED;
	Tue, 10 Jun 2025 18:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749581091;
	bh=joj/ZjLFg+NBtbJ9iqvbjqCoxWFWArbEFXoFWaKYYBc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=IR8Z198Ks7LgP8Zr1K0TzyqrbxOmz1AnrckCdFX1UFZxj6XqJYw+H3SkpnglH7fw1
	 7di9Jnz3jA85BbcW4Y+Hh7gLq/hmo7tI8OgRmTAGh2+kSFIj/0GJPAqxdomg5vc9Jg
	 XmT3ONIwah7+lDvloqeVaqh4HTczwqvFFEpbUkd8fdzBAdGWj1x/sGcmQglv82A2LW
	 5CU8FiMK//EImFO6sNfsiapjvKjfme0I7u2cxN0TuxFP3R7TegAJK96DOR0hNV0gy8
	 ATJdQ2Pc6vJ+faC71tgFx+zgvksU3SnUjT8FgXHiBr6PWEkCx8oFREuwT19ThQrtrk
	 v7zvhIC4+GGHw==
Date: Tue, 10 Jun 2025 13:44:49 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: linux-rockchip@lists.infradead.org,
	Hugh Cole-Baker <sigmaris@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 1/2] PCI: rockchip-host: Retry link training on
 failure without PERST#
Message-ID: <20250610184449.GA819185@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <810f533e9e8f6844df2f9f2eda28fdbeb11db05e.1749572238.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_114453_126680_2A487264 
X-CRM114-Status: GOOD (  14.46  )
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

On Tue, Jun 10, 2025 at 01:37:12PM -0300, Geraldo Nascimento wrote:
> After almost 30 days of battling with RK3399 buggy PCIe on my Rock Pi
> N10 through trial-and-error debugging, I finally got positive results
> with enumeration on the PCI bus for both a Realtek 8111E NIC and a
> Samsung PM981a SSD.

> +static int rockchip_pcie_set_vpcie(struct rockchip_pcie *rockchip)
> +{
> +	struct device *dev = rockchip->dev;
> +	int err;
> +
> +	if (!IS_ERR(rockchip->vpcie12v)) {
> +		err = regulator_enable(rockchip->vpcie12v);
> +		if (err) {
> +			dev_err(dev, "fail to enable vpcie12v regulator\n");
> +			goto err_out;
> +		}
> +	}
> +
> +	if (!IS_ERR(rockchip->vpcie3v3)) {
> +		err = regulator_enable(rockchip->vpcie3v3);
> +		if (err) {
> +			dev_err(dev, "fail to enable vpcie3v3 regulator\n");
> +			goto err_disable_12v;
> +		}
> +	}
> +
> +	err = regulator_enable(rockchip->vpcie1v8);
> +	if (err) {
> +		dev_err(dev, "fail to enable vpcie1v8 regulator\n");
> +		goto err_disable_3v3;
> +	}
> +
> +	err = regulator_enable(rockchip->vpcie0v9);
> +	if (err) {
> +		dev_err(dev, "fail to enable vpcie0v9 regulator\n");
> +		goto err_disable_1v8;
> +	}
> +
> +	return 0;
> +
> +err_disable_1v8:
> +	regulator_disable(rockchip->vpcie1v8);
> +err_disable_3v3:
> +	if (!IS_ERR(rockchip->vpcie3v3))
> +		regulator_disable(rockchip->vpcie3v3);
> +err_disable_12v:
> +	if (!IS_ERR(rockchip->vpcie12v))
> +		regulator_disable(rockchip->vpcie12v);
> +err_out:
> +	return err;
> +}

This *looks* like it could be strictly a move of
rockchip_pcie_set_vpcie(), without changing it at all.

If that's the case, please make the move a separate patch so it's more
obvious what the interesting changes that actually make a difference
are.

