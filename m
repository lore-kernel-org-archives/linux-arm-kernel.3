Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73152C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 02:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jbENKhjvnoUhQ9Fl7TONkFZKanQHQDJzBYnsMniCg44=; b=QFByZaceghqm4+EXGyIkEpfBtS
	VNBZ3oAAkm9/z35Rpc4tjWpXN1+EvZTAFIFsChF0aPPNFUiNjCqLvdB43+kcCqM6CkTEsR/t/JE8W
	JCIwAh58gbvJtja6aRVHTvw7PXVgOc8hSJudSFNojxNh7K+Sxjpt4XUDhM7gF3SxgIXW6jaY338HF
	1k7vV2aHxBRwl9nesAU0o2P27b1ZnRHrNMgkhtJDRZ3vbeYE8mwesarblqMaYn1kd36fLCko9gfqB
	9f6l3mg/fRjcglvC9pgDv1/3WUBKYtdlGe4wsuKNjrtcKAb9iAawoZPeKjqqu+ZPglsxKjt4BThFV
	5HJWpTRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x72D0-0000000AUh6-1wjO;
	Thu, 17 Sep 2026 02:50:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x72Cz-0000000AUh0-1mx2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 02:50:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 829C2601EF;
	Thu, 17 Sep 2026 02:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09C501F000FF;
	Thu, 17 Sep 2026 02:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789613444;
	bh=jbENKhjvnoUhQ9Fl7TONkFZKanQHQDJzBYnsMniCg44=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=TiEqp9iVDWcbpUtcaj85NW6psXeoU5GqbOF06aPe7TTNviy/1gV24iYqwR4vz2IK+
	 ei8SMj/+wqwccbiis6ZVYSZy349yRZBPTXncqfOGDZv80l2YRH4aIz7Bf3COvJeLBB
	 qrnwjt4iatfqcJg+t/8ISKMhjkEW0Th3BGr++TMfwkw6xfj3+zw1PITXBAQRXS9eMd
	 Pvc9jUPS8u+Dz5l/rex1r3jrvBjCcRyrk2k5mbaaQqAVClb9KnlPJEVMQKA/TO/tAr
	 ckCmvmRNmvagt5IHopUhEKZwgMbK2XX3cT4Uc2juqTYmuo3YLL5aIMraUh+AojAJl9
	 6YQ4CBHOOA+oA==
Date: Thu, 17 Sep 2026 03:50:39 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc: mdshahid03@gmail.com, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/6] iio: adc: bcm_iproc_adc: convert to devm-managed
 APIs
Message-ID: <20260917035032.006ab16d@jic23-hlaptop>
In-Reply-To: <aqilP8FSTmrLpqEQ@debian-BULLSEYE-live-builder-AMD64>
References: <20260908172359.30003-1-mdshahid03@gmail.com>
	<aqilP8FSTmrLpqEQ@debian-BULLSEYE-live-builder-AMD64>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Mon, 14 Sep 2026 22:54:07 -0300
Marcelo Schmitt <marcelo.schmitt1@gmail.com> wrote:

> On 09/08, mdshahid03@gmail.com wrote:
> > From: Mohammad Shahid <mdshahid03@gmail.com>
> > 
> > Changes in v4:
> > - Move the ADC enable error-path cleanup simplification into the
> >   clock conversion patch.
> > - Simplify the ADC devm cleanup action.
> > - Restore the blank line after the copyright header.
> >   
> 
> For the whole series,
> Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>

Thanks. Added.

