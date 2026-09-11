Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C3CC88E41
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 05:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HX/WIqnMbATxafvirWBU6MEtc3JzCHTqWHGTjtEKx98=; b=SAq4buv5mRrQv73vCsb6Kly42c
	AWMVZeVr4MXwAYjr2BneqpbL1GcdgkfQNCHf9pk2lKggYPcZjzHWtZ0WdTr3Y1RctRqSEwb5hPeaU
	Qfwjx6R3P72rRKJOkRUwChEkbYel6VW+s2nVwJbEdJ61x9TB1/0ieZCQsUnrQJxtrXe1GbxlRqmgr
	xonyYCLbCvIEgk99RqmKp6vzXyU+HkwVCRwo0b+pqlGr4B602TDRl66RzBNKMJJfG3xD/KVdY4BTi
	hz99eFlZi903JCie6hUOOZ71+dGB8Gp8Mg1tSmp3OH2MMKVQp8+ZgxiHcAmlcXW1sBIqEaxCAzMNc
	48d5tFMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4tfV-0000000FrLT-19wx;
	Fri, 11 Sep 2026 05:19:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4tfT-0000000FrLH-1zoK;
	Fri, 11 Sep 2026 05:19:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A0F5460211;
	Fri, 11 Sep 2026 05:19:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDF871F000FF;
	Fri, 11 Sep 2026 05:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789103958;
	bh=HX/WIqnMbATxafvirWBU6MEtc3JzCHTqWHGTjtEKx98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UIPZ94Y2fHaLGK3NgL80e2cW2pDVV7qnn4o21dkuRO+gxyB/T2NNftpcuajRrLRU2
	 s9I9nia32rI+aki5uWTxwRmzNnWPp6q6EDm701QffqwS5smT2PCVVWu/9SMyR2Is5P
	 M/iTYXkzclQs2oOXVXI4cFxSZUMyr1qrr5hJnI4vjuMw1AFl7OliO9VYReTkFy8tUh
	 INEr2I+Ynb+NJrVYuS8JX3TRxfVJOTb924Jl0Ghy/gLbP98wZeN6H65bJwM3OmTbN/
	 gZg1TwNANF7V5AvHV97cfQ3KDcFzNM4JoXSiIAKIBB5+6PedTWARuLVxyEJrEwMf9m
	 ftMhcV4ABCUpg==
Date: Fri, 11 Sep 2026 07:19:09 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	chunkuang.hu@kernel.org, p.zabel@pengutronix.de, justin.yeh@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v4 08/12] phy: phy-mtk-dp: Add support for digital and
 analog calibration
Message-ID: <peqvlalospng4dbcldlitpxko53jtnmlphlaogyaiul42lu6wl@pa3avgnnfe4s>
References: <20260910092038.48291-1-angelogioacchino.delregno@collabora.com>
 <20260910092038.48291-9-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260910092038.48291-9-angelogioacchino.delregno@collabora.com>
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

On Thu, Sep 10, 2026 at 11:20:34AM +0200, AngeloGioacchino Del Regno wrote:
> Add support for reading the calibration values from eFuse: if
> present, write those - otherwise, rely on the defaults from
> SoC-specific data.
> This also adds support for writing the calibration values for
> the analog part of the PHY.
> 
> Note that before this change, only default hardcoded calibration
> values were supported for the digital driving parameters.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

