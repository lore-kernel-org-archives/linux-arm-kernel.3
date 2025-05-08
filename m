Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D58C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 18:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jxTFmNOX3bSQwoSwj3xy6KKdXMm3LG/6UFBryfdpRHs=; b=3PO76jKu0GcOwod7wTkamp5vDX
	VHm2fel17xdZmwO8KIAcGZArLusGML6wWm3vdZVmdZ9zwxHyjpWLBXe1uVGh6HTV70pCll7sC+e0R
	UWrtpsIAbaY/np5JEYHRB1Mo0ZSKAT5ippXtG8xQw+WcJaYtNG8J6/NJhqwKJv3aQn29u/5HC5i+E
	Os6WC61oON13rtvWv6xaH4LWX0PX5SKr6U4UrN1UIQTY0Sk03V5RvIEtcttswIgO8p2ZjPn7ZIaBJ
	yTiwpSQMTz3RyldobWZhX2/YDodo3qVSITJ8iysJ5+PQFLh3hZ0KpWJuV/mPuSlhu1qovlKTbGHx3
	E1wDzCZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD5fz-00000001VVG-05nO;
	Thu, 08 May 2025 18:08:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD5e1-00000001VLu-1rYB;
	Thu, 08 May 2025 18:06:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0432C4A1DF;
	Thu,  8 May 2025 18:06:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4981EC4CEE7;
	Thu,  8 May 2025 18:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746727611;
	bh=T3fd8i3e9m2qTXLSzLMLI6WreQFWFZts5ieUhzAtv50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z6qe3XtzC0dgxeaQP4aahmUFX24uY2iZ3t2sb6neITe69z8y/KsV14e0Un9m1jGK2
	 /tEnt3sdoHSmcStSrNJVclL2CaRyAjciHa73CCjMdKHpFD9blJNdWaOeeI77jtdubT
	 DjtKSPu29fda7idtTVch/6nzYVK1BqOW14ORfPccTGLKQkDdqmisXANhvptuC0tB9O
	 TerEWeAPM8x2xKoI4x/n0y4Zk27bbk+n6O4fipuNoakdGt6dvd4xUAiMHt3nza9IMh
	 HApWd5IFoifI1COGvPPwFJuVoSUh2d1oXeBxiuf/SD+xDmuqoXrGs3cG3w0fU5dfXY
	 FVGqTmzoMkKbQ==
Date: Thu, 8 May 2025 18:06:49 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
	linux-s390@vger.kernel.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>, Jason@zx2c4.com,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v4 07/13] crypto: riscv/sha256 - implement library
 instead of shash
Message-ID: <20250508180649.GA570496@google.com>
References: <20250428170040.423825-8-ebiggers@kernel.org>
 <mhng-0b1a0c43-eff8-4ea0-9aaa-46727504555c@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mhng-0b1a0c43-eff8-4ea0-9aaa-46727504555c@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_110653_501076_59EFE5F5 
X-CRM114-Status: UNSURE (   7.95  )
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

On Thu, May 08, 2025 at 10:45:39AM -0700, Palmer Dabbelt wrote:
> 
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> I assume you want to keep these all together somewhere, so I'm going to 
> drop it from the RISC-V patchwork.

Thanks!  Yes, this series was already applied to "cryptodev"
(https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git/log/).

- Eric

