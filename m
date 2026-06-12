Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CB9CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 19:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HH2moNpZWt+XN8tXRSKqJX51PwUlhD/ypigBEwKqVGs=; b=iS47AanYlAotohBdi2K9KeiPUQ
	1GalcwHFFQosqDuA1N81q2asP8RiPfHgMd+ihI42ba91hGCOVJyskvvNSmZEhv6Fp5uLTLMR/gudy
	HpnM4EAcHml7yRL5IyaqGEjYZ5H63yATviSnnw7WOCEyG6nOfkgYmgurB/AX9+F8nuBAEqtU+4lbY
	bwuqrB4SRIBWUb8k9BuRtf2OuI8pRGPmgG8h+njrmkoqnydIXaMhNzzsa5G+QtQ93FBzidBWG8aEC
	wYT1XoBee/S8vQlfNyarxKZlOrTazX4Fv2+y7CUyqA5Ur1Kk7K5UL2v/xMP16V+WT1eSFjqoL/YH1
	9VDKnczQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7Na-0000000BRkC-36jx;
	Fri, 12 Jun 2026 19:17:22 +0000
Received: from ms.lwn.net ([45.79.88.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7NY-0000000BRjH-20xc;
	Fri, 12 Jun 2026 19:17:21 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A346640430
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1781291835; bh=HH2moNpZWt+XN8tXRSKqJX51PwUlhD/ypigBEwKqVGs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=B50uc+n8SBBYjg70I3kRVsmnmUKcnKuIrmrZCYuEnV3ObcFO5GSJqKiwUjw+b9NZ/
	 MYYeaKnItIe4jFDsrzZRiitkI4duonYB0L/MFQ+NKKZhD/P8vVuDH1Evmp7kPiWpRx
	 z+eJ0zrEtOKFZUpGe1ifoAqueR1sWKsRFU6pxlWfXd2f8NNJK/WiDeFcJtCQAgQt59
	 OlU0HBB9M/QY4VXufYDWDqtngGEYtwcRJK+60SVzbpF5DhDJ0nFfgVzQ2fav/4jvQa
	 cJtNDppeMCYjSGOl+QiCeQiz9W2C2arD5leaSg1eN5b/PCtgWv/nmQZ0TwouTRAgbh
	 1MkpAqIRQry+Q==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A346640430;
	Fri, 12 Jun 2026 19:17:15 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@mailbox.org>, Vineet Gupta
 <vgupta@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, Krzysztof
 Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <chleroy@kernel.org>, "open list:SYNOPSYS ARC ARCHITECTURE"
 <linux-snps-arc@lists.infradead.org>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>, "open list:ARM/SAMSUNG S3C, S5P
 AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, "open
 list:LINUX FOR POWERPC (32-BIT AND 64-BIT)"
 <linuxppc-dev@lists.ozlabs.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>, Randy Dunlap
 <rdunlap@infradead.org>
Subject: Re: [PATCH] v2 Documentation: arch: fix brackets
In-Reply-To: <20260612095432.177759-2-manuelebner@mailbox.org>
References: <20260612095432.177759-2-manuelebner@mailbox.org>
Date: Fri, 12 Jun 2026 13:17:14 -0600
Message-ID: <87qzmb7emd.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_121720_521205_FADE26DC 
X-CRM114-Status: GOOD (  10.18  )
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

Manuel Ebner <manuelebner@mailbox.org> writes:

> Add missing and remove needless parentheses, brackets and curly braces.
> Fix typos.
>
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> [v1] -> [v2]
> "(i.e cache geometries)" -> "(e.g., cache geometries)"
> "Excer[t" -> "Excerpt"
> add Reviewed-by: Randy Dunlap
> fixed my own typos.
> ---
>  Documentation/arch/arc/arc.rst                 |  2 +-
>  .../arm/samsung/clksrc-change-registers.awk    |  2 +-
>  Documentation/arch/arm/vlocks.rst              |  4 ++--
>  .../arch/arm64/memory-tagging-extension.rst    |  2 +-
>  Documentation/arch/powerpc/vas-api.rst         |  2 +-
>  Documentation/arch/sparc/oradax/dax-hv-api.txt | 18 +++++++++---------
>  Documentation/arch/sparc/oradax/oracle-dax.rst |  2 +-
>  Documentation/arch/x86/x86_64/fsgs.rst         |  4 ++--
>  8 files changed, 18 insertions(+), 18 deletions(-)

As Krzysztof pointed out, you formatted the subject incorrectly, meaning
that the maintainer has to clean it up for you.  I have applied the
patch and done that this time, but please pay attention to the
formatting in the future.

Thanks,

jon

