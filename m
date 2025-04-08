Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 866B0C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 08:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O2WDaFTvaUX01AMLFTMni4XPjML3oDv27qr1Wl7mBb4=; b=ag1+JTtTe4DdKR8tbR4aIdbDrS
	b6NmiK6Tcg+rBBHmY0kGxx638FaRoTAlHQVDyC+hbGvupE/n0UDyiQWr1N7Q1Wgm/6SNrF9IIBXel
	d6Uk4wh2hz4usZy9XP+Qv1UK+Y+umGGrJ1NUtkcdfnvboPv8Gzs2v193bRB23C8A5Z6qlBX5yDYQn
	Qwv720aVr7CsFP2OTVk9aryq9yegTJz51l91gi6QkfyZlh3W/SiyNpDZPXlVsy5T+ghKRRGl0y0Ii
	TXu//5qs/GdUKkk6v5MUGR6NtOO67YbP69NIp//InEQQg1o6mT9ykKZmTe9DwjSJbBKBx0YxOj+Cx
	+8n3rvVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u24gk-00000003KP0-2Wvs;
	Tue, 08 Apr 2025 08:52:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u24bc-00000003JDB-38zA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 08:46:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7382FA49061;
	Tue,  8 Apr 2025 08:41:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4147C4CEEA;
	Tue,  8 Apr 2025 08:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744102010;
	bh=ReDfcUfMOpsNbvyyw5CHCguPoy2XwOLWpjwrd1QNJZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XzcOI0qFCRIiNeziun3omyXC4XT2tra1CSZRP4RLHcpwmJc5k0zr7FiBaeKTQpnZc
	 tMww2dQje85Jt9gIZ84V6ZvLGWpmBBMzNeCpKYyAWMKlURarbsdTUT8aBy2gJ/hnmi
	 Dzc2Z1ArI6iXAySInGqzXVrXwbQDm5R0UQmARlDe2uT4Z1UFRvbhoczk/q80qKRNtV
	 JOhScnrfGkF30ICvX8sMhocw6O2xoPbrZJ7ypocmjF83eS96ls/1jkOx9dOv4UDLuo
	 rOvGzaC6LpvUSGHgiOa8/uOvomLisuh+fRm87M9PD/TuMAkcvce3kxajWn35ChCnXX
	 2EMLXS+kq3xYg==
Date: Tue, 8 Apr 2025 09:46:43 +0100
From: Will Deacon <will@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
	Borislav Petkov <bp@alien8.de>, Brian Gerst <brgerst@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Ingo Molnar <mingo@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Takashi Iwai <tiwai@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uros Bizjak <ubizjak@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-raid@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH 4/4] arm64: drop binutils version checks
Message-ID: <20250408084642.GA1768@willie-the-truck>
References: <20250407094116.1339199-1-arnd@kernel.org>
 <20250407094116.1339199-5-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407094116.1339199-5-arnd@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_014652_856514_1F71C3FC 
X-CRM114-Status: GOOD (  14.92  )
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

Hi Arnd,

On Mon, Apr 07, 2025 at 11:41:16AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Now that gcc-8 and binutils-2.30 are the minimum versions, a lot of
> the individual feature checks can go away for simplification.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm64/Kconfig              | 37 ++-------------------------------
>  arch/arm64/Makefile             | 21 ++-----------------
>  arch/arm64/include/asm/rwonce.h |  4 ----
>  arch/arm64/kvm/Kconfig          |  1 -
>  arch/arm64/lib/xor-neon.c       |  2 +-
>  5 files changed, 5 insertions(+), 60 deletions(-)

Since some of these checks are dynamic (i.e. they try passing various
options to the tools to see if they barf), have you checked that the
minimum supported version of clang implements them all?

Will

