Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B250ECD8CA7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 23:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ckdyL+V6dINCVvWcXnQmFz/4kOvIs/K/YFOIyF7XGEY=; b=ASaZDsPZm0/J1X/rfekWPH0dwK
	GI+Yo8VQ4I5RUNfzICqPM90S/QmArrN9GPBqVRNsu0yile2kIqU0hbBuNUwWYYYGDO9Yd4cCenNOu
	QaMkm7vULeY1fmlVVgO4KfdgHZHYKyJkxqAI3G/H89eunJZ8CGZ7Ilb3Wp70aih6o94Hdyd+09N9V
	+nZ4/oMeOtb2GmkuIMY3JmPtfK/pPw4HQQq5Pqh2XF9JpKABQm5s1WBcXRSnBx26fQwWa3wcYMElz
	iX3IC0R+z9sxOvhgdxCU/eCbd1kexhpyG2GAhnmiRGCpHwlBrHSUzh158y5sAhYM4Uej/dTN9q9xr
	QRnxVTLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWjNw-00000004Wxd-1ita;
	Mon, 08 Jun 2026 23:28:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWjNu-00000004WxV-1UID
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 23:27:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CB8A8434F3;
	Mon,  8 Jun 2026 23:27:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E763B1F00893;
	Mon,  8 Jun 2026 23:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780961277;
	bh=ckdyL+V6dINCVvWcXnQmFz/4kOvIs/K/YFOIyF7XGEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iCOGCNTX47HHolXMzB44/6ze6ILlLqyNZ8QroZgtEzSjIOo5t2mJptgPx9ukhAlK3
	 FkMSZtyirX3DUZ/6OHyhQ4QktdbQvg3WM1Bftq9sybHCf2TP2gX2Gx2IEdJCe54Bfa
	 ShiHgray1NaqB1Op30p7AkQ8DfXSEqQoaShG1LG6FsDSStRfS1/8ME/wpCNPpWpsGV
	 RN29tiusJIzMgeb4V2RDP/1BF6mcFw6N4g06I6n3wIHG6QdJvNxAkm4/2QSToyvv/1
	 7ZlgIIAgonNYfHFl/K/PeYZXBTTwXqwrfWT5+sNSw6CNrt8aeAvaplZEBcj4ZcXIzF
	 u1HSnSBL2Cxfg==
Date: Mon, 8 Jun 2026 16:27:53 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Oliver Upton <oupton@kernel.org>, Aishwarya.TCV@arm.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: -next boot failures during KVM setup
Message-ID: <20260608232753.GA2993766@ax162>
References: <aicVyebkEMs6w6UV@sirena.co.uk>
 <87tsrc946i.wl-maz@kernel.org>
 <8eac5e73-282d-4c72-b726-0c5c82fc81f0@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8eac5e73-282d-4c72-b726-0c5c82fc81f0@app.fastmail.com>
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

On Mon, Jun 08, 2026 at 10:56:12PM +0200, Ard Biesheuvel wrote:
> Haven't seen this myself, surprisingly, but yeah, this is obviously related.
> 
> By now, I am wondering if unmapping that region entirely is really worth the
> hassle, or whether we'd be better off just remapping it read-only.
> 
> Given we're at -rc7, I'd lean towards dropping the whole branch for now, or
> alternatively, only drop/revert "arm64: mm: Unmap kernel data/bss entirely from the 
> linear map" (and its followup fix "arm64: mm: Defer remap of linear alias of
> data/bss") so that the region always remains readable via the linear map.

FWIW, I can confirm that "arm64: mm: Unmap kernel data/bss entirely from
the linear map" is the culprit for this particular issue based on my
bisect. Reverting those two changes on top of next-20260608 avoids the
issue.

-- 
Cheers,
Nathan

