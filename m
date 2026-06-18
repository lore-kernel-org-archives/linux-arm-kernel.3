Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159CDCD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 08:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2t+RkjBFL1lZxO64xK2l79qUSt5JM3y5CAjnWbpJF2s=; b=nUujb7xP0qSUUA8hggLnSmIKAu
	3xKcIQsT2qWc0Qc/EEwPuBaQBJTbOox2cdsd8xlrN99hXePwS9LrOwVsqZBc/jDz4e3bOr7AUNhlK
	eJOTPoiKhHRIdfy51KL7woEj6XJnbG10QaGyfPgprScsbqpscNHy/MgEa3oJMWmEu+EsVJ2H+VNMm
	zxakCTurx6Gu+Y1YjcCghbdEY1txz9U2+RbGFYJ5I5eWblY8KHNf2OsvLHfIKFQ/QPTkinVn82CGU
	lcrPR04WalcKENfqEsjKHQqQU3NKd5ShGWDmb0zd3amXWEsKzHK4tteEbTjwiqDxwkSpwSRuzKobU
	zlzvO7+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa7he-00000000opM-3vV2;
	Thu, 18 Jun 2026 08:02:22 +0000
Received: from mail-43172.protonmail.ch ([185.70.43.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa7hb-00000000oow-3nOl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 08:02:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rasmusvillemoes.dk;
	s=protonmail; t=1781769735; x=1782028935;
	bh=2t+RkjBFL1lZxO64xK2l79qUSt5JM3y5CAjnWbpJF2s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=FV+rwnEoy5qvX19DmBCoPvVnyMzrAOtumwXoUfetPoSZlM72lcpIPhets9nZKC3Y9
	 ++MWFO6w/2CpYjIVoma//uy0OnNJGwT12Sol+YUoI7or3hFNqtcvR+UrNFlI+EVT8P
	 //TsbPhdKNHsC/JbE48Ta6ianX0G0dpgVUKcNGiKlbf7C+dlgGbm198XVihAm2KZSw
	 DqKfz4PzpR2d1piZFDHpkjVT6HJagz/4B1QXv2qVEjih2bRcNXAiratjBQcAwyJFJY
	 2w7p84ewLIAYJk7u+yO5DfeD+7mrUo9zm2JF9x8JedS8VHp1DF5JtHwjB3unNkYYxR
	 Jhi9BcpTilPUg==
X-Pm-Submission-Id: 4ggtVZ1FRpz2Scmx
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: <linux-arm-kernel@lists.infradead.org>
Cc: "Ard Biesheuvel" <ardb@kernel.org>,  "Will Deacon" <will@kernel.org>,
  "Jonathan Corbet" <corbet@lwn.net>,  <linux-doc@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] docs: arm64: Document that text_offset is always 0
In-Reply-To: <20260604140839.1930847-1-linux@rasmusvillemoes.dk> (Rasmus
	Villemoes's message of "Thu, 04 Jun 2026 14:08:45 +0000")
References: <rWEeI8VTs9ivADjblsACv--YW_WrirJXCPkBOYE-az7ys6mFKCBWMAkGvsTwYpJrObRYWS_hgRXyiSqiZSb46Q==@protonmail.internalid>
	<20260604140839.1930847-1-linux@rasmusvillemoes.dk>
Date: Thu, 18 Jun 2026 10:02:12 +0200
Message-ID: <87cxxonunv.fsf@rasmusvillemoes.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_010220_555314_39711BCC 
X-CRM114-Status: UNSURE (   8.57  )
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

On Thu, Jun 04 2026, "Rasmus Villemoes" <linux@rasmusvillemoes.dk> wrote:

> When trying to figure out where to place and call an arm64 Image in
> memory, reading booting.rst should provide the answer. However, it
> requires quite some digging to figure out that text_offset is set via
> ".quad 0" in head.S and is thus actually always 0 since v5.10.
>
> Update the documentation and make that explicit. Reword the 2MB
> requirement accordingly, and remove the paragraphs that only apply to
> the ancient versions where text_offset could be non-zero, as they only
> confuse a current reader.
>

ping

