Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D068FD0068
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 13:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJR0gix/qcjxRB9opOK+DpKMd4C5hZuqEeiEi3zYUkU=; b=aD3rq09KR/1V3cxPx9Hrghn98v
	Kpp2+erV39tHmmhqR+ggZ4yvERIw1RCx1Mw69pAB9QEkKb7vrpAPdpXKHN41aNeHiGzL1q0vJtqn9
	Prgtm7g7vYmlnvoAt4JBe2rKAHSjyV2Sfzpj+pZwqWOhvqvtvUt3hPsKYcHC/LzXz87hV9k9IsDzM
	rSfjvEY753ADOo4Z6CWIHTR5sAK/PSswHXP8FOuoP+n3HXVXyvP6ncpVa9ZKwvR2RfGkIGGfL3FgJ
	HVi1AqpHlDQNTMlL6ftUrFHEEOD9urfbpZVJAEmOsjRUjKZvSlS5+qlnpMe5XhLkLyaxoUqLr85nj
	PxvHqgGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwh37-0000000BXdw-20Qo;
	Sun, 01 Mar 2026 13:41:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwh34-0000000BXdQ-3qpo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 13:41:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2097F40A7A;
	Sun,  1 Mar 2026 13:41:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33FB6C116C6;
	Sun,  1 Mar 2026 13:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772372490;
	bh=EpqZVzKWdEsIkiPzJLsZ2dOR2VUf0GLN3zoNLCZ07I0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FRjKGUAOwBXUw/Q4rIXTMJTFpyf/hELE745qa8J8eJbLJubMPF+dzDZ2/lHjLk7LC
	 4G4E9qEnfWW1NNbiShcur5+UphomtkhaTGlSeLbrjZtaQ+vG4PH4GXBYLMONfctJw2
	 V1fl1huk3bBdVGzaSf7H8dLFsuo2hojF20kKyu5VGD3Iu3l8TSWF8nTsByaEKcAa0g
	 L7xmfGmmgSKIVpIJj4ZX39j7yzS5dv3ttvEHg0fZsbFgkTGxcNOljeNz1yp52prbse
	 Rl6IlZ1x3C65VAtItkhlSsR3Rdx++DhswtBd+xb+sebjCLba53bJ/wZr6YSlkeo0aX
	 zr77y5F+pohQw==
Date: Sun, 1 Mar 2026 13:41:20 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Billy Tsai <billy_tsai@aspeedtech.com>, dlechner@baylibre.com,
 nuno.sa@analog.com, andy@kernel.org, joel@jms.id.au,
 andrew@codeconstruct.com.au, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iio: adc: aspeed: clear reference voltage bits
 before configuring vref
Message-ID: <20260301134120.38ae5ae0@jic23-huawei>
In-Reply-To: <aQCXm_rvwpB6-UUq@smile.fi.intel.com>
References: <20251028054102.1954503-1-billy_tsai@aspeedtech.com>
	<aQCXm_rvwpB6-UUq@smile.fi.intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_054130_982226_895CCF7C 
X-CRM114-Status: GOOD (  12.11  )
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

On Tue, 28 Oct 2025 12:14:51 +0200
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Tue, Oct 28, 2025 at 01:41:02PM +0800, Billy Tsai wrote:
> > Ensures the reference voltage bits are cleared in the ADC engine
> > control register before configuring the voltage reference. This
> > avoids potential misconfigurations caused by residual bits.
> > 
> > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> > ---  
> 
> It's a v2 and here a changelog is missing.
> No need to resend, just reply with a missing piece.
> 

Billy. This one is still outstanding.

I was rather expecting a fixes tag as well.
I'm going to mark it as changes requested in patchwork and stop
tracking it. Hence please send a v3 addressing Andy's comment
and either add a fixes tag or say why one isn't appropriate.


Thanks,

Jonathan

