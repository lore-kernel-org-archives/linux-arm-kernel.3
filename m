Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F5CC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 02:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ASwc2Ygv66cUz6aU4pmnpAE1p1jo1CzJkrv0lM5YYk=; b=v8Myg+/ropXAJOCL8+bDRKu7yk
	6AoEM5ZrOsNC8joEcYGG3p3EQALjvXLLqeETln7KJJhWnd1EZZaEIyJfHWRvJ22GJiygUu/ZSYeGN
	iv0k+ZFrf6MuwxRZKvHlkzf0Ut0j6HAxInWCEU5aATlg5j4UfHIvBfB6Ula6H68Td1rtHjXkylLNf
	KPIwvlHyYZpo4TgU1UUXNAVabBCQz6PuGTAQFxqtW3fg1nOAzDOimiskEts42DvLUxdAn1VbPyEJy
	0J+I2w1G/SY7DYNCeC3c+yCJhakA8LGbp3sGEhbVeyyu62KHtB6zafh6EpTlofGjIyd1q2zEihbB1
	mSBsvDhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtz0P-0000000FIzU-0L9a;
	Wed, 12 Aug 2026 02:47:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtz0N-0000000FIzO-3Mf6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 02:47:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 502464180A;
	Wed, 12 Aug 2026 02:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 071C81F000E9;
	Wed, 12 Aug 2026 02:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786502867;
	bh=+ASwc2Ygv66cUz6aU4pmnpAE1p1jo1CzJkrv0lM5YYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PiSsysQ7qMrLsD03v8wZWLZRJPBrRPg0zQexvwmp2S282dkNa3REJo1M63fTsTV9r
	 hPmaNjHCENc8iy69IgbO8Awu29TEaUB3TO5gEn2jq+RG2p8RfRbphQLIwlFc4HQOem
	 Njb72/0K3gnwtGRt7feZ0pGQn1EdqZBHd6tytpxlhetXY2o8C52jASL5CUMQ33SAcZ
	 rpvKsqUXbQS5HsjzaFCx+HWFUdIOenchXYQH5WXQYQ5I8Cg4qZJa8YuLwDp587JSlo
	 LOQyIzSMclP5xEUXi+6hnnvnIt6TxYYw5ggB/hs14ydl0VX17be28gcFTcXQbA3toa
	 bsBuCUTLpGs2g==
Date: Tue, 11 Aug 2026 21:47:46 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Long Zhao <longzhao@ambarella.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, devicetree@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
	linux-clk@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-gpio@vger.kernel.org, Will Deacon <will@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 05/10] dt-bindings: serial: add Ambarella UART
Message-ID: <178650286553.616367.17873097780629180417.robh@kernel.org>
References: <20260806-longzhao-upstream-cv75-v2-v2-0-6b09707c5fe9@ambarella.com>
 <20260806-longzhao-upstream-cv75-v2-v2-5-6b09707c5fe9@ambarella.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-longzhao-upstream-cv75-v2-v2-5-6b09707c5fe9@ambarella.com>
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


On Thu, 06 Aug 2026 17:34:13 +0800, Long Zhao wrote:
> Document the Ambarella UART controller.
> 
> Signed-off-by: Long Zhao <longzhao@ambarella.com>
> ---
>  .../bindings/serial/ambarella,cv75-uart.yaml       | 45 ++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


