Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F2B1C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 13:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HbA7wIT/9Nlfmp2V7Aisy8o9l4C1NtYHVfdsGm57q8M=; b=BTPEH/YyZXPlJTcMUnHyxqtguO
	8grUoFkufCv2T/IWJcKqj98ztkNscddAINbnhBeim0j9kfl+6nVfGsTIhE1V8QCOps8TukyS86yRl
	1UxLPxOSXzlX3nGcCuzyTs1FjKfh1BxcnjjTkxKL6LDvL0/SmE0JuPQ1I0b8Lm6kTdqlrAiV0k/nG
	Xp8C/9oCAWOoJyGV2IUQoEbI+d2JUoZrm6egaAbkSV382tpHK7/23g6W38mH3aZholF1qXgVaFFLp
	sSnAYKKRckHNhUeckuypdN/avTjxRqdgXunKkRxtjmALmkGc1w1DObyVizHNP5jDGRxspkvm0ivZP
	2Nroyr5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugOM3-0000000EaWL-1eJo;
	Mon, 28 Jul 2025 13:57:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugOCX-0000000EYn1-2cgd
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Jul 2025 13:47:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HbA7wIT/9Nlfmp2V7Aisy8o9l4C1NtYHVfdsGm57q8M=; b=oVoE9j3NJjMzXC1HhqZbSnV3VI
	xdZMcN+3DvLW7n1+VnJXnOAYHMMHWQz6vDmZLmVmLx2GQYLKOd7MAvtdleJwXiin6yvabRmwbMb4n
	ENXd1kAwQKv6BSWx5zpIRdAGIuDUCR5/39joVi6kOghU43KqZaga4pQkl8QaOdyKHPXLJPtvT/i7W
	eFRmZB6hlpagLmn4JEVGK2p0laEMlaYFNelwhtF+VDr9nr8/xFMuKdMA/+mwHtFl0RYQvICW9Dk+4
	DU3kKCEZbA9Eaf5YISLVMMITZh6yPWdr/V9109k0wfXKwFmMJOFhVqpRB/2gv9QmY73KWOIqHdXcM
	Z4UhEbHg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugOCU-0000000CUK5-2o2c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 13:47:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D6BB41A51;
	Mon, 28 Jul 2025 13:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E09AC4CEE7;
	Mon, 28 Jul 2025 13:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753710450;
	bh=AItEbBNl2zFy92ODxc3mp9jL4d5m71/4Fr68Dt4OVuo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rzeSKulxax2Km4aDCARHbj6ZXQNH3BVsFnwsNmh0CcaaFwLHp0gJRzK/lf0QoEgmj
	 lgwT+va6Edy8CqhC1xR8MCUU5b2wFfFAjaPRkp06cC0s3xfWwNUAHG6kBAYYXpeC2A
	 9GlfJpJttUelva3BCPnGmJONLBc/HJzgZ4x1RPfoJsvkdsz5VSjlVAVU8uAxyi4wtK
	 K2a/YQGaBd60Ucs3PyJXUlep7FCHw95pJD7MsyJt5EKiXMrDdOrXku+UsBnN3J/4FH
	 jrKUQM4Po2nwnq2nw4ht4kON5wbvM+F5IMtgG6An53JNlyhH8F8SD9kRQVLLBLl1Xj
	 gMPWUHlh/+++A==
Date: Mon, 28 Jul 2025 14:47:12 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, David
 Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lucas Stankus <lucas.p.stankus@gmail.com>, Puranjay
 Mohan <puranjay@kernel.org>, Dan Robertson <dan@dlrobertson.com>, Marcelo
 Schmitt <marcelo.schmitt@analog.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Dragos Bogdan <dragos.bogdan@analog.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, =?UTF-8?B?T25k?=
 =?UTF-8?B?xZllag==?= Jirman <megi@xff.cz>, Alexandru Tachici
 <alexandru.tachici@analog.com>, Stefan Popa <stefan.popa@analog.com>, Linus
 Walleij <linus.walleij@linaro.org>, Stephan Gerhold <stephan@gerhold.net>,
 Ceclan Dumitru <dumitru.ceclan@analog.com>, Alexandru Lazar
 <alazar@startmail.com>, Andy Gross <agross@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>, Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Mike Looijmans <mike.looijmans@topic.nl>, David Heidelberg <david@ixit.cz>,
 Manivannan Sadhasivam <mani@kernel.org>, Peter Meerwald-Stadler
 <pmeerw@pmeerw.net>, Andreas Klinger <ak@it-klinger.de>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: iio: Drop unused header includes in
 examples
Message-ID: <20250728144712.20bfc746@jic23-huawei>
In-Reply-To: <272b1700-7ebd-4693-829f-8d842e6eece7@gmail.com>
References: <20250724111345.47889-5-krzysztof.kozlowski@linaro.org>
	<272b1700-7ebd-4693-829f-8d842e6eece7@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_144734_962181_C781A677 
X-CRM114-Status: UNSURE (   9.03  )
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

On Mon, 28 Jul 2025 09:33:37 +0300
Matti Vaittinen <mazziesaccount@gmail.com> wrote:

> On 24/07/2025 14:13, Krzysztof Kozlowski wrote:
> > Drop includes of headers which example code does not use.  No functional
> > impact.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>  
> 
> FWIW:
> Acked-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> 

Updated and fresh testing tree pushed out.  Thanks

J

