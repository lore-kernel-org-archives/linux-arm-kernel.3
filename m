Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75309C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 12:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=snWpfyIoxF+5iUdUC2Q149RGC6bzU24eMSopGKtayLQ=; b=VLHW3rtW9wVaGOPml31VfTE4/G
	O/62mAxb1srrd46hUq2S2jZGH/DX6hZa0DPYc2AAE8tIUbdhpKUBwJxZHGfjbJB98mDiJG8ERFGik
	8uAC6zFbThEBVTk1qIeOAS1eoyEaAtccJxIIAIzL1U6od8OWUoICu19J8Tcqc+1dcckYYsF8titeQ
	VjJsBCuRx1OpiLS8b9+hYCDLNWhG9OeN0po7A4ObJ4jAbF62BMS6Hfd6/zAzo5tg62H5AL7cz52k0
	4B6oRw0FFFqvM8qkA94N2Z+A74hcX6fE3o+NECnYsvGexOuer/3/ppcZekFum/3R1MNXh7MlA09e1
	znc1RqWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50oe-0000000Gh1q-3j9t;
	Fri, 11 Sep 2026 12:57:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50ob-0000000Gh0V-42Tj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 12:57:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8EBB940B04;
	Fri, 11 Sep 2026 12:57:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5B4F1F00893;
	Fri, 11 Sep 2026 12:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789131433;
	bh=snWpfyIoxF+5iUdUC2Q149RGC6bzU24eMSopGKtayLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BU9pqrFp8KoLcgy05K75awi7EZw7+b/41XeUUzDTC5ALRfmsFSm+M76AHU9iN/69A
	 5KRaHg2TAK0CZxIIYkZtCdUWGnPoFZh5caxpz1RD7Y/fttLdZWGchZRrkId7PMDiW9
	 dnvEotSJ4EUs2B5IhGaOc9HlH946XiwAeb6k/k0P6iR0vODSoOoL11uxR6Zw+e45xQ
	 XX1S+iLr90veXwzL6MyB86B/c5FcIbp7alxka7L9HpchRP4+lWTS4g53wrtOelxFL/
	 GR0QDpK0wpj5Ny5jebskPJWitMMKdq6s911U7bGr1EmnRip82vgePK2XdzfpQgQJcn
	 yG4/kvRNiDgMw==
Date: Fri, 11 Sep 2026 13:57:08 +0100
From: Will Deacon <will@kernel.org>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Subject: Re: [PATCH 00/21] arm64: Move overflow sp into SP_EL1 and kernel sp
 into SP_EL0
Message-ID: <aqP6pKFicKO3j-Tw@willie-the-truck>
References: <20260907164247.17223-1-will@kernel.org>
 <40954731-a235-4877-b615-7a3f66f1b039@arm.com>
 <aqFDFYECDl15R_39@willie-the-truck>
 <5ecf87dc-30ec-454f-bee3-0c05f2f11168@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ecf87dc-30ec-454f-bee3-0c05f2f11168@arm.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Mostafa Saleh <smostafa@google.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Sep 10, 2026 at 02:49:37PM +0100, Vladimir Murzin wrote:
> On 9/9/26 12:29, Will Deacon wrote:
> > On Wed, Sep 09, 2026 at 11:39:24AM +0100, Vladimir Murzin wrote:
> > [...]
> > 
> >> I gave it a try and I observe splat:
>
> > I've hacked up an untested diff below, please can you take it for a spin?
> > 
> 
> With fixup applied I do not see splat anymore :) 

Excellent, thanks for testing it!

Will

