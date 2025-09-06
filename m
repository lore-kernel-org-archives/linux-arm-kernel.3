Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A87CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 23:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=708BMybgUVX8T0kzkl/T8rQ5M+KnoydnWW00G5kbvEk=; b=fepUZhcmGQDN3E02BE+fq4ntyF
	8QXaLzctujFd1dFbUAW7+PKDaB3ikm12lfrsJLBQbYBGTmlOWPaGT05vUtYu8yevPOipbqkd3gIyY
	VxBIEJo9NbISFgYn5gE5aQxJaPE2OnsTJudFLmiy4B+Ue7uDrEjGiKKAyCzQNGDooTHGyH294g2cY
	YaSYwGogsBEqjCvxX2ToiwK87HgUfXQDAbfQIaxlor2JbKVFZIfmqbl3pJ5caq6bNDQXCJaYOsjuK
	th4w4TLdSIY2XOY0u9qUWdaCMqedbk0Hw/S5QOyihc/bN8sTwOnn3M1UM9+ubemnsLg2LTV42mDDy
	V7O24Obg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uv2Pe-00000008eMR-23yG;
	Sat, 06 Sep 2025 23:33:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uv2Mu-00000008eD8-3gpg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 23:30:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E19D940753;
	Sat,  6 Sep 2025 23:30:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 413B8C4CEE7;
	Sat,  6 Sep 2025 23:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757201450;
	bh=q1iTThsw7oKpa0zcQPp1lbL8O39eXWUFrfG8Gq7JLkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LxUu0HkE0H8avOiTvooj1Fk/dhVtoRl4Q5BJPmUo6coiGIpXS6RA++E+vyWuiIjI4
	 L55/6QXlwlNPzafdqyJ7tTIlwAZHQU9PqiixX04vyP+5hWCqout9j2LZcphH4BEd86
	 TTdRhs/xeUGOQwpo0GLSjDHlAVShMWNfYe3jVuYYCmc/CRAFmNrM3XcyxISCAO2Pih
	 sFMnCpATcCPr87LzBvkVjd/LUfa5YnRCPpFck68LgJ0JppDpzCBzAsTe5yGmovA8rY
	 pYFEJyDkwNb30v/YpGdYH68O+7CHyW/L+o7wqjjevHsIhEbzCLyZ5fQ3T+PFCIQKwN
	 bJMqX/vv6aTVQ==
Date: Sat, 6 Sep 2025 16:30:48 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Zhiqi Song <songzhiqi1@huawei.com>,
	Longfang Liu <liulongfang@huawei.com>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 07/12] lib/crypto: tests: Migrate Curve25519 self-test
 to KUnit
Message-ID: <20250906233048.GA109599@quark>
References: <20250906213523.84915-1-ebiggers@kernel.org>
 <20250906213523.84915-8-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250906213523.84915-8-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_163052_941737_2826E3E2 
X-CRM114-Status: UNSURE (   8.45  )
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

On Sat, Sep 06, 2025 at 02:35:18PM -0700, Eric Biggers wrote:
> +static struct kunit_case curve25519_test_cases[] = {
> +	KUNIT_CASE(test_curve25519),
> +	KUNIT_CASE(test_curve25519_basepoint),
> +	{},
> +};
> +
> +static struct kunit_suite curve25519_test_suite = {
> +	.name = "curve25519",
> +	.test_cases = curve25519_test_cases,
> +};
> +kunit_test_suite(curve25519_test_suite);

Correction: there should be a module description and license here.

MODULE_DESCRIPTION("KUnit tests and benchmark for Curve25519");
MODULE_LICENSE("GPL");

- Eric

