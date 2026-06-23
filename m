Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84024CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 13:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pu2Ied/2CX8SQgA5iLJzmkqmoH1Ofyj6DGMTiEuzKtk=; b=jF8tY3y8/lpms4FdZ+5RJz/qEG
	UnH7gQF83vfuDeY1f9znS4AErbouMbTXpnRumNHjhPKp7LknopPWT4qz3gI4mhdbAm8nmedNnRsbX
	j/4NYw0dnxViQJLZFNK+AdPcLDUhyd32nnOnAZslhWP75T3QCt58ccrCTeWKoVQDa23kYvS5VN1j1
	XuaX7aCmBL9iEPZhvgJN084kouE4AXevNHgBmghLoBi6zC1stSN1WF7G/0RiQKUpnhVKz/j+2NiFX
	Xowm5u0A652B/ICSqf99gSfSWQM5Y6IGBYM/Nc5RyX9IeePRvyiLWtemigHiZsbLUGdoJYFPrgn2j
	sLnUSshA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc1Sk-00000006MeH-0ObE;
	Tue, 23 Jun 2026 13:46:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc1Si-00000006Mdn-36tB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 13:46:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 304F044463;
	Tue, 23 Jun 2026 13:46:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEC9F1F00A3A;
	Tue, 23 Jun 2026 13:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782222408;
	bh=Pu2Ied/2CX8SQgA5iLJzmkqmoH1Ofyj6DGMTiEuzKtk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BJtSQEfy3Gu7zg/q9oaOcRXAGcamTpvFq2eDls6gPhz7Q1UeOlxNau7vAroxmoiVC
	 2h38LMXY1+tASVwkce2X53+8m8qGHAZaMD36aC8ZyUaMvJecZ+fypGZ2pGjZ8sgKZT
	 Qgmmx6J3GEul2RlijjfNI7cFlO4MiBsgU1qKVusoR8D8xBGq87bAACfIvBHGmJE/5U
	 bEFxKFNz2JHaSuxVqMYKxxV5/7xOw2qcBysNVO7npaxeXaN3irtDKCwDr09mjflx9E
	 drS0t2rW4ZXK6EdfFHAxhAH2w3sh8pMGb+tgCaBufwQDh3auA7B+Sd6ZmbhVlqTaHq
	 FynCXUquWWaPQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Andreas Grapentin <gra@linux.ibm.com>,
	Dave Martin <dave.martin@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] arm64: uapi: Use __u128 instead of __uint128_t in UAPI headers
Date: Tue, 23 Jun 2026 14:46:40 +0100
Message-ID: <178221850412.2621079.13020491489927340307.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260619130835.5678-1-will@kernel.org>
References: <20260619130835.5678-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 19 Jun 2026 14:08:34 +0100, Will Deacon wrote:
> The arm64 UAPI exposes '__uint128_t' types in the members of
> 'struct user_fpsimd_state', 'struct user_pac_address_keys' and in the
> signal frame via 'struct fpsimd_context'. Since the alignment of such
> a type appears to be non-portable (16 bytes on arm64, 8 bytes on s390),
> prefer the '__u128' typedef from uapi/linux/types.h, which makes the
> alignment explicit and allows the definitions to be reused by other
> host architectures.
> 
> [...]

Applied to arm64 (for-next/core), thanks!

[1/1] arm64: uapi: Use __u128 instead of __uint128_t in UAPI headers
      https://git.kernel.org/arm64/c/9d6306113f92

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

