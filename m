Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BCA6C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 16:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NsIpsnCHMaMX+L15e7tjvSysbCwRgG5P+DOALl6smkY=; b=Bnr+/gIWudm6lZqAs7K6SrVgIY
	SHeIon+leFLHD1zj2m0Dc72GOxFLchcNxDAiCWpaE//QnyVEDUVmxEWyzm//Nb5/J2kSEiS+ScttX
	zixEA+sACbBVcq6K2+AX06A56hpNKw51+3ILRA4WGRSXcV5d7vXNsOQMKG83ls1DCD74T/wpm+OMD
	H0gQ3z6x0e+1z2Y+htGOcTSX4FmmsKSfphyLnNcqgbHMbyafhQQ6idtOL91yxz4znEgHroqYI1qh/
	RrAZ+ZcOV5lLu8eLWLRsXxF+GoObNI4QrwO+Al9U+GUgViH/dWQsOapbaZqzF6ww6t3oX3A8XCfRS
	QUM0dGqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH3bm-00000009r2L-3tJ2;
	Mon, 19 May 2025 16:44:58 +0000
Received: from ms.lwn.net ([2600:3c01:e000:3a1::42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH2bK-00000009eC0-2afj;
	Mon, 19 May 2025 15:40:27 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 61B3D41AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1747669219; bh=NsIpsnCHMaMX+L15e7tjvSysbCwRgG5P+DOALl6smkY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XIqp4KIrZbxWevhvMsGnazsroPPopIYmYQ4Zp9YyfirCSncs81GyuxYz1djcggK5T
	 U0vTUgwiADRBmVVqZkVVF4JDwtg0TcmUsPn3gWNUy7b4cK0Y6kmZhAToo/TuLfR/Ha
	 TRhxzxWOPQu7zLmfZOqSSOHQluSk8D5coBz6oW7ePMXtaXaX32JIiuc0OalkEHSGMM
	 1JwVon9qVfrjkkWeT72fDD6Q6RyLqsnfbJhQUHvfkFntRmYAZhV5f+vKtfdVp63lJw
	 yHT/EAA8VeKjQzlYblZ+O5zbmS/sdgINTkI9QJorwZ/2XNWmHyEtuejRvdC+D3Igfk
	 flbFcoIS7Q2bg==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 61B3D41AA1;
	Mon, 19 May 2025 15:40:18 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Jesung Yang <y.j3ms.n@gmail.com>
Cc: Vineet Gupta <vgupta@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren
 <guoren@kernel.org>, Brian Cain <bcain@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Dinh Nguyen
 <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, Stefan
 Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne
 <shorne@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-openrisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jesung Yang <y.j3ms.n@gmail.com>
Subject: Re: [PATCH] docs: align with scripts/syscall.tbl migration
In-Reply-To: <20250506194841.1567737-1-y.j3ms.n@gmail.com>
References: <20250506194841.1567737-1-y.j3ms.n@gmail.com>
Date: Mon, 19 May 2025 09:40:15 -0600
Message-ID: <87ldqsip7k.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_084026_656368_D348D7AA 
X-CRM114-Status: GOOD (  13.14  )
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

Jesung Yang <y.j3ms.n@gmail.com> writes:

> Update the documentation to reflect the migration of the following
> architectures to the centralized syscall table format:
>
>   arc, arm64, csky, hexagon, loongarch, nios2, openrisc, riscv
>
> As of commit 3db80c999debbad ("riscv: convert to generic syscall table"),
> these architectures no longer rely on include/uapi/asm-generic/unistd.h.
> Instead, syscall table headers (syscall_table_{32,64}.h) are generated by
> scripts/syscalltbl.sh based on entries in scripts/syscall.tbl, with ABIs
> specified in arch/*/kernel/Makefile.syscalls.
>
> For the convenience of developers working with older kernel versions, the
> original documentation is fully retained, with new sections added to
> cover the scripts/syscall.tbl approach.
>
> Verified with `make htmldocs`.
>
> Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
> Link: https://lore.kernel.org/lkml/20240704143611.2979589-1-arnd@kernel.org

I'm not sure anybody has looked at this ... but nobody has complained,
anyway.

I have applied it but ... it seems like this document needs a more
thorough refresh rather than just adding some "actually, don't do it
that way on these architectures" notes?  Hopefully somebody will find
the energy to do that at some point.

Thanks,

jon

