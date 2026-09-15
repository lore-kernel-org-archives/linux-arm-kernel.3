Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8B1C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 08:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P9syazwThZXUn1aVDLlXlF81tphXK8lH2tEemacpfKU=; b=JKD2qI0kgMiW/GnSCUnXRY2FJy
	i/nR94Kxy4dUxnFDzLekuHxLclZ2w5d0nn9JdqTf9Czfrmu6mQzKOny4jIjo4gtovwBOrCzeeuI+o
	jqqmt6zRrXf3kMEFKilo95whI45yL2mvcYgxGtT5DN/LKMSMv4Q9F8pU/D3BlHRYLRa64yeqsptIv
	Sls9L3I20LntlsZJviGD2birPg6V0GobpZDDUg0o79QJow5zV47j1r8S2RMJXXkjXBWxEJed9HyyU
	XDZ0Glh7+OlfOZbIGbpIZiqiaV3wnSXel8bIvjth9MbYf00uGPSpW9A/Du+nft9D1aPPpXyjg7aYq
	KcbsESww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Opp-00000005gs0-2Ol8;
	Tue, 15 Sep 2026 08:48:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Opn-00000005grV-3uKX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 08:48:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F6A840A30;
	Tue, 15 Sep 2026 08:48:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C607D1F000FF;
	Tue, 15 Sep 2026 08:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789462091;
	bh=P9syazwThZXUn1aVDLlXlF81tphXK8lH2tEemacpfKU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=RA4Q/Y52/SbIfU6/XrwUkYSZuPwlmEUXii6Z+aSxA9Zkj/qvz4En3OagQoB9MJBDD
	 Lgvsh9BIS9hCBNL/ZTZSe26SE82mKfwQi5ZXNh8IHX/TWPRji6ibSN/gY6NReDb7T7
	 kOyKEznss6DMt9a40aXr4WPZuqZCuytpKhWC+6XUgsG+3ZPTwbLCkG17BJ47MljdHV
	 tKRLIp0+PR+X0vgkF5NnLvX6LIqDa0sL7acSSQMR4L/fNaTfmcCLCQ45gwmV2hn687
	 gWEJ8/wDsr4NwTuLp1QuJg9+fiae90MdLH/+6qb/wb4FHP8/pflP7TLmKL4nJqlI8k
	 Q2262FwtonOPA==
Message-ID: <2136d3b9-c227-4e05-9089-89fb4d565577@kernel.org>
Date: Tue, 15 Sep 2026 15:48:06 +0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/6] ata: ahci_st: Do not ignore errors when getting
 the reset controls
To: Niklas Cassel <cassel@kernel.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Alexandre Torgue <alexandre.torgue@st.com>, Lee Jones <lee@kernel.org>,
 Tejun Heo <tj@kernel.org>
Cc: Brian Norris <computersforpeace@gmail.com>, stable@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-ide@vger.kernel.org
References: <20260915084127.692494-8-cassel@kernel.org>
 <20260915084127.692494-9-cassel@kernel.org>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20260915084127.692494-9-cassel@kernel.org>
Content-Type: text/plain; charset=UTF-8
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

On 2026/09/15 15:41, Niklas Cassel wrote:
> st_ahci_probe_resets() treats any error from devm_reset_control_get() as
> "reset control not defined" and continues with a NULL reset control:
> 
> 	drv_data->pwr = devm_reset_control_get(dev, "pwr-dwn");
> 	if (IS_ERR(drv_data->pwr)) {
> 		dev_info(dev, "power reset control not defined\n");
> 		drv_data->pwr = NULL;
> 	}
> 
> This also swallows -EPROBE_DEFER, which is returned when the reset
> controller providing the reset has not been probed yet. probe() then
> continues as if the device tree did not specify any reset, so the resets
> of the SATA IP are never deasserted, and st_ahci_configure_oob() and
> ahci_platform_init_host() access the MMIO of an IP which is still held in
> reset and powered down, which can result in an external abort.
> 
> The resets are optional in the binding, as they are not part of its
> required properties, so use devm_reset_control_get_optional(), which
> returns NULL if the reset is not specified in the device tree, and
> propagate all other errors.
> 
> Note that an absent reset is now indicated by a NULL reset control
> instead of an error, so the "reset control not defined" messages are
> dropped.
> 
> Fixes: 76884cb2f7da ("ahci: st: Add support for ST's SATA IP")
> Cc: stable@vger.kernel.org
> Signed-off-by: Niklas Cassel <cassel@kernel.org>

Looks good.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

