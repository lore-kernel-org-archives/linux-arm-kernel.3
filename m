Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB092C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LBb9ADHMqWm21+2xiuaoD6zmeHkRqVhQ1J41zISVZPo=; b=RbYa5smovV9rNNCbuWNPaMm1oN
	f+orG5hlbh1Fh9fVGUb56g/Brcb/pCZgMdze2Tx5VnSkELJ6OKfN50JwYOZeks/YHduZsCMeukb7a
	drCGSDaoUlfGPufKzJ5qIQS52OVPGcX96nln7A839Tfk2nnkGKmCgIzBF42DRn9aok2OJsEykBJGy
	lqtgpBStJoBXUNOulUfHGoWwv84MYVhtVpVN0asTRTXHDCiryUYLll7K1VJL1ghhAM8cvEZft83a0
	ANMyKVsK2nTdUL9K7zyylSOR3lGx/04yF++pebe3+VYmgd6af2qG7a1QFEwV/Gu+Q6anLnv7xRrpu
	abWwkXBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zNA-00000009lt5-0Oi9;
	Tue, 08 Sep 2026 17:12:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zN9-00000009lsw-1OLz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:12:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6854B601DE;
	Tue,  8 Sep 2026 17:12:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FE6E1F00A3A;
	Tue,  8 Sep 2026 17:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788887558;
	bh=LBb9ADHMqWm21+2xiuaoD6zmeHkRqVhQ1J41zISVZPo=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=UNPyQighJpwB7k16N1QTtDfhRutUH5wNTLjkZOU8gxH3E5CO30yAFT24po/lVVUlo
	 RmXjr0EWxFZ7+w0qITjiFiDPfhKHCgQvPbR64MZUQ1wQu/zazrvFBbPx4Kd+ZNCt36
	 G4zPe05FDFYBGPS8iYi0qcYzDDUXNOyaSp1ECsEsKZTGBsUJGszvGchnPxpxQeeew0
	 ZjNOjVBYrtmldOYTOYPu+Ivxo2+HKeO58i9MxixJq/J6LE9059SX0iKd5sysRwiuFB
	 Gl9N8ks8THEcGLoGFxWGLSOGpF+YWuJEbQf/w3yfF9lOnXl85QiIWSY4t6dkXX/lVh
	 sFLxBZnhryXVg==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 8BB72198003A;
	Tue,  8 Sep 2026 13:12:35 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Tue, 08 Sep 2026 13:12:35 -0400
X-ME-Sender: <xms:AUKgakqL4n7wutvMnvzDWLRL-kh5vN9TADPKZT2rBtmDz_ntUEnwGQ>
    <xme:AUKgaleeYP9nxumKfTpNWSy2RzDNUiHNrBNGwN57YbTRQFesC0UBjl1wbg3F4Ta_i
    pTgg3ocJLJXFvpG_Mnucp4zuD0zUO6iKthhQUKEEaRnONE-4Fr3mdU>
X-ME-Proxy-Cause: dmFkZTEpDua1X995u/upmh/8VYUEeEvtAsxNZ28jsqTO2/21LX4omQP6tTahEpbGYbXrq3
    iv7Ifl/LhyTLQXwzD22gMXOzSFq0K8sn1147GAalntI4KdbDwGWikhiiEep1ud5NR/hgH5
    x91p/v42lRLHD0z1eqLxDwgC77/XPZmVuDL+4Y9DW893uBsirabnCTEJJuNCdmOjJHBRIE
    IJpkJq7dDVGyzSOV5wVIIpm8mtJpfqK12zjE8OLIQ1eLJf7oYdb88oU/4JQaGwbQVfwmuQ
    AzO3zdZ5RwFbttDTnDxIDqhNEhlJqi0Wtd26BGSv2xNvX5+e5gXLCnPj1c6YxMFaFXlgS2
    TxNnbWQpRfNSQ742yw70sFKDgkPXdOBSFUNSxpx0jRtwrJCy64OEgSsAm/BMH6g+cP2+ug
    VkiciIeGnqzpSLdJlbVRpXyRoD9Pdf/FqcMgjHVCLVl2wpKOnMUkYtiSMRu0gli85CAIf7
    etRELk++Km2bvZoKdy6Sne2H0YUWmupH81g2Aul2m8GW7MSr9M0BV4774k0/mnFZ9Blzxd
    qL326MZwrBsTKdsljjpZP8RILWzLKml/nJ9Iv34eyr/XljuYd8+QD8wu6pHnu4wGMaMFnF
    tdAMexmGMZNsC5JW85bOAb5ho6eII7S7cygXLhsM4lGROosDq8+DKXx09Ldw
X-ME-Proxy: <xmx:A0KgajPw9DTNq1MbtWKndEJHIC0n8X8ae82hlbJT7DzT8hjgABquOg>
    <xmx:A0KgavhUyncxIWXps2OoWKMY9ITkUew1eOiVMmid6UaRuEqHkEfVKA>
    <xmx:A0KgahiUp3RpJHTpZ4SnBAqYZjOLxH-PuO20DfUTnal_a6rrt9loUg>
    <xmx:A0KgauJvhrtXs4d4Kwy39RBG6iH7aX-IheYbMQCwZ9vu7hZMIG7XPg>
    <xmx:A0Kgagm9s4o7EniipLfoGBj6dFjP-wMYrU4A-UppdNDWdqF_Q_0MEKfh>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 11361F8007D; Tue,  8 Sep 2026 13:12:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 08 Sep 2026 19:12:12 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Will Deacon" <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, "Arnd Bergmann" <arnd@arndb.de>,
 "Eric Biggers" <ebiggers@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Alexei Starovoitov" <ast@kernel.org>, "Oliver Upton" <oupton@kernel.org>,
 "Herbert Xu" <herbert@gondor.apana.org.au>, "Marc Zyngier" <maz@kernel.org>
Message-Id: <ea76bef9-c346-41a6-9276-a5eb8cea3776@app.fastmail.com>
In-Reply-To: <20260907163726.17104-8-will@kernel.org>
References: <20260907163726.17104-1-will@kernel.org>
 <20260907163726.17104-8-will@kernel.org>
Subject: Re: [PATCH v2 07/14] arm64: head: Force little-endian early during boot
Content-Type: text/plain
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

Hi Will,

On Mon, 7 Sep 2026, at 18:37, Will Deacon wrote:
> Commit 2ced0f30a426 ("arm64: head: Switch endianness before populating
> the ID map") configured SCTLR_ELx.EE at boot according to the endianness
> of the kernel in case the bootloader had entered the image in the wrong
> endianness. Additionally, if the MMU was enabled in such a case, logic
> was added to turn it back off to prevent the hardware walker from
> misinterpreting the idmap page-table.
>
> Given that the MMU is only expected to be enabled when booting EFI, EFI
> only supports little-endian and arm64 kernels cannot be built as
> big-endian images, we can rip out this handling and simply force
> SCTLR_ELx.EE to 0 (little-endian).
>
> Suggested-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kernel/head.S | 20 +-------------------
>  1 file changed, 1 insertion(+), 19 deletions(-)
>
> diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
> index 8951ce693552..d5c1ea0c5b3c 100644
> --- a/arch/arm64/kernel/head.S
> +++ b/arch/arm64/kernel/head.S
> @@ -138,29 +138,11 @@ SYM_CODE_START_LOCAL(record_mmu_state)
>  	b.ne	0f
>  	mrs	x19, sctlr_el2
>  0:
> -	tbnz	x19, #SCTLR_ELx_EE_SHIFT, 1f
> +	bic	x19, x19, #SCTLR_ELx_EE		// Force little-endian

This bic has no effect here: the 'and' below clears it anyway, but x19
is not written back to SCTLR.

When I suggested this, I missed that SCTLR.EE still needs to be cleared
before populating the ID map, regardless of whether we enter with the
MMU and caches enabled.

IOW, we need to retain the SCTLR writeback logic below. The only thing
we can drop is the clearing of the M bit and the invocations of
pre_disable_mmu_workaround. But we might as well keep that.

Apologies for the bad suggestion.



>  	tst	x19, #SCTLR_ELx_C		// Z := (C == 0)
>  	and	x19, x19, #SCTLR_ELx_M		// isolate M bit
>  	csel	x19, xzr, x19, eq		// clear x19 if Z
>  	ret
> -
> -	/*
> -	 * Set the correct endianness early so all memory accesses issued
> -	 * before init_kernel_el() occur in the correct byte order. Note that
> -	 * this means the MMU must be disabled, or the active ID map will end
> -	 * up getting interpreted with the wrong byte order.
> -	 */
> -1:	eor	x19, x19, #SCTLR_ELx_EE
> -	bic	x19, x19, #SCTLR_ELx_M
> -	b.ne	2f
> -	pre_disable_mmu_workaround
> -	msr	sctlr_el2, x19
> -	b	3f
> -2:	pre_disable_mmu_workaround
> -	msr	sctlr_el1, x19
> -3:	isb
> -	mov	x19, xzr
> -	ret
>  SYM_CODE_END(record_mmu_state)
> 
>  /*
> -- 
> 2.55.0.979.g7e5102b832-goog

