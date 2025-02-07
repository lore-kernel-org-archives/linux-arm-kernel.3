Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F38C02192
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 04:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=929Exw51MEvbwVtcyaVIc6NPKRlggudvA42S70626J4=; b=2v62r9UlCuVyg6Uu+vhrT1qrqO
	rk4jo+qC4ZWsTmgX2T52SPa8YbMnZsgcZjYuIGW5yw35y5PJYff2ARwolZd+fwDUu4nZDTADr9826
	Mqb3ZamkJ6NKYL7okQGs+ZadWF0PPjSN+A/FNMhl0SI0Ao3AtnGgn8W5VOGkxrG76Wy1A5ro1mk32
	q2KlvD8SaWGugIuBE13Iy8KCle7QEng86e/ofeYIMPDhRNDhjj66evGjOKDaGK+TFr7md69JGeFam
	s5v3KG/rCCuSOXpOy/wlQoWTPYrDaZFx2QIhskgDTHYya4qgFemdcrJTmCrGohFvxBc2wPG8tnTj6
	zDnzaUdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgGLP-00000008K4Z-2Tm6;
	Fri, 07 Feb 2025 04:51:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgGK2-00000008Jur-07YF;
	Fri, 07 Feb 2025 04:50:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2068BA43718;
	Fri,  7 Feb 2025 04:48:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85C32C4CED1;
	Fri,  7 Feb 2025 04:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1738903832;
	bh=929Exw51MEvbwVtcyaVIc6NPKRlggudvA42S70626J4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=On3L20QTFvBoRzk52pz2o4yw/IhLGEHzp1u8xRVp0xO85cLpGUYcclJZ2Y3ygco1V
	 M5q/ZLQT4hzi5FemSU+WzQVhqTnsrlqjK+Df1nMm2hYV+KDSDKy1Uy3h//gt1Csa9S
	 XOzvTPH1QHsbJh22r9A6pQfp4DZgWwmsJnqoNW7Y=
Date: Thu, 6 Feb 2025 20:50:30 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexander Graf <graf@amazon.com>, Andy
 Lutomirski <luto@kernel.org>, Anthony Yznaga <anthony.yznaga@oracle.com>,
 Arnd Bergmann <arnd@arndb.de>, Ashish Kalra <ashish.kalra@amd.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, David Woodhouse <dwmw2@infradead.org>, Eric
 Biederman <ebiederm@xmission.com>, Ingo Molnar <mingo@redhat.com>, James
 Gowans <jgowans@amazon.com>, Jonathan Corbet <corbet@lwn.net>, Krzysztof
 Kozlowski <krzk@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Pasha Tatashin <pasha.tatashin@soleen.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Pratyush Yadav <ptyadav@amazon.de>, Rob Herring <robh+dt@kernel.org>, Rob
 Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>, Steven Rostedt
 <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>, Tom Lendacky
 <thomas.lendacky@amd.com>, Usama Arif <usama.arif@bytedance.com>, Will
 Deacon <will@kernel.org>, devicetree@vger.kernel.org,
 kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH v4 00/14] kexec: introduce Kexec HandOver (KHO)
Message-Id: <20250206205030.38d84d4062786c9e36a825b6@linux-foundation.org>
In-Reply-To: <20250206132754.2596694-1-rppt@kernel.org>
References: <20250206132754.2596694-1-rppt@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_205034_216762_33022790 
X-CRM114-Status: UNSURE (   9.46  )
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

My x86_64 allmodconfig sayeth:

WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0xca (section: .text) -> memblock_alloc_try_nid (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0xf5 (section: .text) -> scratch_scale (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x100 (section: .text) -> scratch_size_global (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x11d (section: .text) -> scratch_size_global (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x129 (section: .text) -> scratch_size_pernode (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x14e (section: .text) -> memblock_phys_alloc_range (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x261 (section: .text) -> scratch_size_pernode (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x26d (section: .text) -> scratch_size_pernode (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x29b (section: .text) -> memblock_alloc_range_nid (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x334 (section: .text) -> scratch_scale (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x33f (section: .text) -> scratch_size_global (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x363 (section: .text) -> scratch_scale (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x371 (section: .text) -> scratch_size_global (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x3a1 (section: .text) -> scratch_scale (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x3af (section: .text) -> scratch_size_global (section: .init.data)


