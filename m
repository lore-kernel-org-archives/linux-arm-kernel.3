Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E275BCD3447
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 20:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xxb1o17JXihaenZdPmnSQRmPxQEVKPEXTDoHbn1RBpU=; b=pz66ulLFLVsMrYHW7BD7c5ngAu
	fSmOKY1G1DLlPVEllHSXGzGzMsPHeJ6yvzEsM78mS8UDj1WeqfOH0A8ce4o6UQ0ZKJvIvwKs+kZ7i
	h8lUbG2RmMIoY+9CWkdoNdGmM6kQBEhWWPCsbff6fTKKXNineTE8aIa6HTK1VFe2/yUFVQ+In6/d3
	wCvzRV7qQfDReVJy6fCq62zUGsDu5QMk8Os35YaYbOnoI32Nan3GjLuRi8C/nKv42aUcqaEdFK7Ig
	dbvT55mHzTI/j7OuN3C/CoaBuHHpy8q+lBK8wX9TdFRSBC4782vSZVuIpS0Qe1UUtugmwCOciHesk
	3UXBMioA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLoMq-00000009cV4-3Eun;
	Sat, 09 May 2026 20:33:44 +0000
Received: from fout-b3-smtp.messagingengine.com ([202.12.124.146])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLoMo-00000009cUT-0sVt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 20:33:43 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id AF7881D00054;
	Sat,  9 May 2026 16:33:38 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-04.internal (MEProxy); Sat, 09 May 2026 16:33:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778358818;
	 x=1778445218; bh=xxb1o17JXihaenZdPmnSQRmPxQEVKPEXTDoHbn1RBpU=; b=
	V/JOr9OaQTLYVW30NndG+L7VPvlDy+LYm0Kub7u5v+zTWlpcyJB3tWKB9mLgASNB
	t7yASuCpNTdS4VT6bvfNidW2pfH7v6NRmqELVMlP6Nuy08kn7WQJFJ0AJKo697sS
	9Lh/fFeGABnrwN4GMlkmGb0ZRgt4J/2La7FWi+DKMlXCwAXpFLTbQmzj+JtxCglM
	KNWkT9ucLLOcOFVY2tN1W7t9UyGaWWHL7hwn8dAGeubDc4nw2kRMmRtQ5T3jFwLo
	JGm6SYEDegUKLvawIF1wmQV7KLbq79GPT+Y3j1DCdrq/m3z9m7ObAYdrpxxHUtTi
	jN9nULWQN3n2/SnhoTIjXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778358818; x=
	1778445218; bh=xxb1o17JXihaenZdPmnSQRmPxQEVKPEXTDoHbn1RBpU=; b=A
	rOyGU3lg3s7Oa9hIJdX1gEEuJHLGgkz8URgShUpQ++b9xrtOVJnVzwtJBajqaFYl
	rTqXNpNkEZyl1w36VUGBhSVN64FqBVl5xC+BiIE/WelFAv/MLnxQnYmvLCtvllyz
	wPeq7GSitO10m4ds2o/PgvqPz32QYw41DJxvxLi0/+ICIXfHRRcCYsJ8WAJD0iqP
	XQqqwwWm0syh50ID+haOb+AKQyv37d9p3QLOI/2RMZfCVkjnXrtx/xRkFeYSSvAU
	G4OdIlznTg5MnWE/9CVpC2snBT9oHNRPnhNF+XKP+TraS5MpucciCsDjpFfem5aY
	6esuAmHFZ5zvZp2xexIKQ==
X-ME-Sender: <xms:IZr_aSYyVLr1lEdt-Gm2P8Gxt5Q5WQ8LbqazMtbn97_SErFV5BuAGg>
    <xme:IZr_aQNSfgXMzTn6gG142F1Pjx0xW6tmyv07wrpTz6h2NIShP56sB1JO9TRlZm9r8
    RKSHoJn71PbqJnxRjohUEMx_fvSHshPaxbZnCaxOaYr_hsYKW0rVrg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduudegvddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtth
    hopegrrhgusgdoghhithesghhoohhglhgvrdgtohhmpdhrtghpthhtoheprghruggssehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopegvsghighhgvghrsheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhf
    rhgruggvrggurdhorhhgpdhrtghpthhtohephhgthheslhhsthdruggvpdhrtghpthhtoh
    eplhhinhhugidqtghrhihpthhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheplhhinhhugidqrhgrihgusehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:IZr_adXCKy0GpMA5JKBwLMRuse8SnWXWqhxlWF3Gt6zxQO0aATds2Q>
    <xmx:IZr_aSgIluwNYEA91ntGjHKaZylH6MZA_vG2GsolEDJDupm6GMWTWQ>
    <xmx:IZr_adqYlT3jL70lFcrV5NNAN478l2if8Dou0Ca-rSho7kEpeuC5yQ>
    <xmx:IZr_aQGnn6Yq0DOw06lTUl9FpRh8OlvfN7oAcCgolbErfkz3ymGGcw>
    <xmx:Ipr_aSth5EOCKrcaIGlIw60wUuOES_f8MxJr1yk8m8JSA3zISh7AJplW>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A6FF41060065; Sat,  9 May 2026 16:33:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AUyVbQhJqVtJ
Date: Sat, 09 May 2026 22:33:17 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Eric Biggers" <ebiggers@kernel.org>,
 "Ard Biesheuvel" <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-raid@vger.kernel.org, "Ard Biesheuvel" <ardb@kernel.org>,
 "Christoph Hellwig" <hch@lst.de>, "Russell King" <linux@armlinux.org.uk>
Message-Id: <75f5e8ce-e61b-4cca-ba8b-8ddf03310527@app.fastmail.com>
In-Reply-To: <20260509200503.GC11883@quark>
References: <20260422171655.3437334-10-ardb+git@google.com>
 <20260422171655.3437334-18-ardb+git@google.com>
 <20260509200503.GC11883@quark>
Subject: Re: [PATCH 8/8] ARM: Remove hacked-up asm/types.h header
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_133342_694748_93D2A4A0 
X-CRM114-Status: GOOD (  13.02  )
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

On Sat, May 9, 2026, at 22:05, Eric Biggers wrote:
> On Wed, Apr 22, 2026 at 07:17:04PM +0200, Ard Biesheuvel wrote:
>> From: Ard Biesheuvel <ardb@kernel.org>
>> 
>> ARM has a special version of asm/types.h which contains overrides for
>> certain #define's related to the C types used to back C99 types such as
>> uint32_t and uintptr_t.
>> 
>> This is only needed when pulling in system headers such as stdint.h
>> during the build, and this only happens when using NEON intrinsics,
>> for which there is now a dedicated header file.
>> 
>> So drop this header entirely, and revert to the asm-generic one.
>> 
>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

> This is actually a UAPI header.  I guess it got put there accidentally
> and isn't actually needed there?

Yes, commit ed79c9d34f4f ("ARM: put types.h in uapi") has some
explanations.

I can't think of any case where this would actually be used
from userland, and lots of ways it could cause trouble in
theory, even if it never has in practice.

      Arnd

