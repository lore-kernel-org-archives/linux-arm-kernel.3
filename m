Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC83C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 22:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yFVr6/ZlZ58oH6PQ/1df85MUNRP8LaKVokBKvtDDKzk=; b=o5jQbiGCqkNUVGZJSNKSr+OI9i
	KNddq+vPPOmvEqFyRbNDOv8aZeyV/VnPoKUO2IQ6WUBGQjYkkhLuR9IOKWBwo0RclO+7KGDK57zu1
	biM/aq5nvPlf398+rIv8wFNo/u4nPf3ExRyTxZhVOfpy2uOEPvpUWThngTEQaEE65DuX0Y97d3/VZ
	F0b+JmsmDgmqqmtWzk9TCfbm3sUG9s5vofAn69x+V4gxKlJneV7AREjVo1eIQwOC4mbwTI/mJcNlA
	54XTakg58DPRp/W/0CmTD2iFn6D5fnYUQ/5zHZy1Jen49EaRjROoNDgEcDMpLIeeo3Ue6jET7FAJ1
	82e/MTfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueiNf-0000000663h-2q3f;
	Wed, 23 Jul 2025 22:56:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueiLF-000000065uf-0rM5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 22:53:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6226FA55CD6;
	Wed, 23 Jul 2025 22:53:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16187C4CEE7;
	Wed, 23 Jul 2025 22:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753311219;
	bh=H9LloSRiugXBEdYC4N9Q/SYB3RgU55GOfsoctf+gWG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tLz/eyrusc8ybCkp9nqH5av1ejQFs6TDjviXQSB+yuUmKzZdODC4fIAZVmQJ178f3
	 jUaQfOl+vrWme/Y5kkaBY/q2Cch+UZqEDDYUWNONsEiSL72JC1bv1d7qbkpt8OQh8r
	 +d48MaNHfA9bbD6bh7iyp/o+jqHzyrapnqt7jxGXCnOIrJ9g75PoR+5OG9XFm14p7k
	 3M79NHeuqKkOIgbsa8BKPpwXOK+E8Ks+FLOlkrcvgyf4GWoWxmaRFm8l5UcVwBqBe2
	 dSqCGDZow9m5QbmIYQONZMCDyn+Frc8wggvhsqE5o0+bWbm18XURlo3vzbglRjX1pi
	 wv+BfLrm11kMg==
Date: Thu, 24 Jul 2025 00:53:36 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] i2c: lpi2c: implement master_xfer_atomic callback
Message-ID: <aysffqj3gzcjwgdch37aghudi6bg7vqwtg6ot7dxl23riuiafa@6mwakofxbbhx>
References: <20250718133429.67219-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718133429.67219-1-francesco@dolcini.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_155341_306717_034F26FE 
X-CRM114-Status: UNSURE (   6.89  )
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

Hi Francesco,

On Fri, Jul 18, 2025 at 03:34:27PM +0200, Francesco Dolcini wrote:
> Emanuele Ghidoli (2):
>   i2c: lpi2c: use readl_poll_timeout() for register polling
>   i2c: lpi2c: implement xfer_atomic callback

merged to i2c/i2c-host.

Thanks,
Andi

