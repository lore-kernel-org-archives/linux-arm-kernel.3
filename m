Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 538F8C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 22:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8AmqSYOxZ/Gz3faSrpjU3mtHcQAqTD8Ixyo/dOVw2R8=; b=ASlnelpma8SXbzyMwNeTxImcqL
	zHNeZW3B9nH/pkRIzNlOhKtxbiTg+Kgxr9LEb9rB8dRqZNGPh2hlqo7+B6NIvKcEUIhWxmRffkXGa
	om0jSDyo2pMMkQdKk+Uql+L1wQ0Vb+xELgZMGlTU8XIojtqBhIkbtuRpDiqT/ozyxvpW32A7Kl08m
	W9VJJkNPK+j6IQrwE/qWKoa+u9WpdxVOU+q/dW2K02Im9T45G1cPVS80mWYHizsEsrNDY189FRzBF
	1I9FftJwOMg2wTZsmaKiRJfVAm1p5FUu5vxKcSkUCdYeAapBxhOor3t8rTlEirFqwdld2RMK6mYo2
	JWCQAXBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u45dq-00000000Ee2-1Evi;
	Sun, 13 Apr 2025 22:17:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u45c0-00000000EY2-0ufZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 22:15:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 038AC5C4DAE;
	Sun, 13 Apr 2025 22:13:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97F55C4CEDD;
	Sun, 13 Apr 2025 22:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744582533;
	bh=JoJ6FwrMtTQecT32IcduAeWImMav6us8t8dtC+zaacA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jqZUGnUtyqI+w2LEhI8JPXPaCRsjcIjrdDEnr8Ce4Y0mDp3/4WB7vxmVHsEn83DRT
	 Gp1pB8XvG1nTGz9Py3aAijt0BEAe1Dw22pyTORAIp0sdhSHwGDd0kNqvUe4vmqNAb/
	 MmaJBoDMq55LWDButr3Dx2h6dtVHo8d9YZ8+rHI4XYloqSWPnZibpeAk1eC7QnYYro
	 tJ/Ir6GUtq0xGK6e9Qlw93jo0PFFawSiD6xiGQIeaTAX3zdUfqXR6cloIFnmh9RdMV
	 ZTgs29kjrhfucHQI1D5v0jQ5dmUIoyqupCub4f2P1vzhj72jYfPIS79pUDvlogt1ui
	 b79PGBS6da25g==
Date: Mon, 14 Apr 2025 00:15:28 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: vz@mleia.com, wsa@kernel.org, manabian@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: lpc2k: Add check for clk_enable()
Message-ID: <l4e6yznusqnkc4czvwywcrxbqxqjld32udulb23rcempj7f6dc@grj6y5hbv7y4>
References: <20250412193713.105838-1-chenyuan0y@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250412193713.105838-1-chenyuan0y@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_151536_304023_708CC32D 
X-CRM114-Status: GOOD (  10.99  )
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

Hi Chenyuan,

On Sat, Apr 12, 2025 at 02:37:13PM -0500, Chenyuan Yang wrote:
> Add check for the return value of clk_enable() to catch
> the potential error.
> 
> This is similar to the commit 8332e6670997
> ("spi: zynq-qspi: Add check for clk_enable()").
> 
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> Fixes: 3f9c37a0c9a5 ("i2c: lpc2k: add driver")

I removed the Fixes tag, I think it's a bit of an overkill.

Merged into i2c/i2c-host.

Thanks,
Andi

