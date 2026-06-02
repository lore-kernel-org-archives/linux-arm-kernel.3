Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84049CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 06:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=25RiKmr3kkqXNiMLL05VqyLEGej///AyDnj2qsFmAmY=; b=QML5PBra2zrxFZZYlk6O9AeeZJ
	1kYR22ZItKp+Og74d5LesQsJuxrayC86ZhOnYPJQ4sOyJtu+KYhg74Ra8FXjFvg1ZTaBrwjhcw8L1
	Us+6A6yQAQkcvup3mLKt74oIe+WECvXRpLzO+PZGeD51ptwReC2yilYYXqRjeMtClSKH/O6mMhk2X
	4L4RAStik4pu8EpmoA7kDuWwBEU1Wdy5clSlZtrPhPPT2qqenDfLuizEXgbVtkS4AStPhYZgrtZKa
	5nXizRpzvfzNy+54yYPcTHNRGTKEHTX1SJvea4vhnIu/fLJBv3B42iGWgH8nDwqE63NjtWPDfjmdC
	BTep1/Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUIyH-0000000CPho-2ynS;
	Tue, 02 Jun 2026 06:51:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUIyF-0000000CPhX-2dsy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 06:51:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B30156001A;
	Tue,  2 Jun 2026 06:51:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C66D41F00893;
	Tue,  2 Jun 2026 06:51:23 +0000 (UTC)
Message-ID: <17775f6d-3f72-4a05-865a-897d76f6feb3@tuxon.dev>
Date: Tue, 2 Jun 2026 09:51:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] clk: at91: keep securam node alive while mapping it
To: Yuho Choi <dbgh9129@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Brian Masney <bmasney@redhat.com>, Kees Cook <kees@kernel.org>,
 "Rafael J. Wysocki (Intel)" <rafael@kernel.org>,
 Thierry Reding <treding@nvidia.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260529042051.1626978-1-dbgh9129@gmail.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260529042051.1626978-1-dbgh9129@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 5/29/26 07:20, Yuho Choi wrote:
> pmc_register_ops() gets an owned reference to the
> "atmel,sama5d2-securam" node with of_find_compatible_node().  The
> success path dropped that reference before passing the node to
> of_iomap(), leaving of_iomap() to consume a node pointer after the caller
> had released its reference.
> 
> Move of_node_put() after of_iomap() so the node remains referenced for
> the mapping operation.  The unavailable-node error path already releases
> the reference.
> 
> Fixes: 4d21be864092 ("clk: at91: pmc: execute suspend/resume only for backup mode")
> Signed-off-by: Yuho Choi<dbgh9129@gmail.com>

Missed to mention, applied to clk-microchip-fixes, thanks!

