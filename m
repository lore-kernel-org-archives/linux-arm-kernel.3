Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEDF3FF886D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 18:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HxkgeF4LNZGOlYkWj+Rbzgew6yzkspsu2lszfChr6II=; b=nGzMi999NJ87b0SxZFkvZtpzBe
	8O/aXarMw0+Cye8T4vTBB8+h2LM3GRaQf+E+Yzb7jxLgtNUXJqfG322L5emm5hJ0kNBHMRQ7k2Kwm
	/+w5vIuQGIPYG8SKjJtyiXOBw9glFp/9EO0QyMC6mYyujX14OxVjagmFDzQoh1+Y6dZnSlRp6rWB0
	8z948cHfF2h8QfYeHUSMbFA5ha40YDKN0OuJ2Hw8Y1vT7jiED/JAFXIjRMhwk9hYdhF5yhLI9oitj
	wFlbzSzRQ5NjTTacL1pxXJEIHF7Zz7kqqbv9EWK7wePXXVoOH8Y4zr3m2ETy9KxaxmaLNNGjOgwFE
	sFED9Tig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHQMp-0000000HXrl-1sVV;
	Mon, 27 Apr 2026 18:07:35 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHQMm-0000000HXpj-3ME5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 18:07:33 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-43d1fec59c9so6958381f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 11:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777313250; x=1777918050; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HxkgeF4LNZGOlYkWj+Rbzgew6yzkspsu2lszfChr6II=;
        b=llEKoovWctMT8lQo9hFF/5PKGBo1SnTmEBaxM00QR2Jtg6d6gp9DWsipyKwP+1U3gF
         sXgZJ3dhvfVpagCRYfN6kwVUHpinPZxzJIXomT1mwqWX+T6ASdc0Y/PEz7GtEJ7o+W+X
         9Dld4dOYq4CyLoHA23pMwGdmtuLNCDkqH+pKDY7VhnMUKU7gChr7UPUzLLzZb8o9fMVk
         G7CQ/iwKg7XMJ+MUZJeN8zwV5cY5qAMASHgj6c6mlIjeWRSjAT8ERzep1xU7VfPU7Z0S
         eQ9QRb+zleevxSH7Q6x4wGQKUTryZGjoFgD5t7u82hoHN38VAIyyZPn4r9BqEeGqNqwO
         lkgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777313250; x=1777918050;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HxkgeF4LNZGOlYkWj+Rbzgew6yzkspsu2lszfChr6II=;
        b=W0AvXyJo8fIFy5rVmRtrNhZanyuYJj4M4xR55KBJ+0E+EzJkqyejaD/+jivjff2Nku
         FUZs3X2Z0wtZhyS4BLMrey7FNKI25qvyhKxjm37f1lqtq11rvmBlJmMSZNIkMtCDOhpL
         RnP6KEVVOfAd/O29r89CfkqyXeszzMG4HQWGsNw8N0MotWCLp8RIMp4E2kbs9NXyZy2Z
         TbIeUqNkkLb/mh7rx7mVPr0WrA/tvfqgvqIPgNVvTSQoBnP812x0lw4fzF4j2JKRFxxv
         u+8ruxBlEWvsc6QMh+tKMnUOdywO3UMuF3K+exI1/JMBvBX7xQb5OTSWRyRtzqMKkUr6
         Fr/w==
X-Forwarded-Encrypted: i=1; AFNElJ8wslpKlSV+Pi+EYhzb7J+ZSfP01s0VZYFJofhgNU6rmB1rGePZ3dm7N9xKwElUwa/zrO4gTK94db8huG080mhB@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ0JtKAsZpBZnIP+XEmRPZ6f9CSxWTnWZvmYhpJAj6OpH9b/dG
	its+TgGiEOr4Hj/hk4HDBUeG0lsQ+DBBEhOdKBILj/eLopTlrW90sZgM7TTQBeY547k36/gkAUy
	AXiCCCdJxCav7EDHdlg==
X-Received: from wrmd3.prod.google.com ([2002:adf:e883:0:b0:43d:7940:a11b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:41c7:b0:43d:799c:b2cb with SMTP id ffacd0b85a97d-44636a393e7mr256856f8f.24.1777313249648;
 Mon, 27 Apr 2026 11:07:29 -0700 (PDT)
Date: Mon, 27 Apr 2026 18:07:28 +0000
In-Reply-To: <289b424e243ba2c4139ea04009cf8b9c448a87ff.1777306795.git.chleroy@kernel.org>
Mime-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <289b424e243ba2c4139ea04009cf8b9c448a87ff.1777306795.git.chleroy@kernel.org>
Message-ID: <ae-l4FGDPLwBuDXM@google.com>
Subject: Re: [RFC PATCH v1 5/9] uaccess: Switch to copy_{to/from}_user_partial()
 when relevant
From: Alice Ryhl <aliceryhl@google.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Yury Norov <ynorov@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, David Laight <david.laight.linux@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-fsi@lists.ozlabs.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	linux-wpan@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, bpf@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_110732_869448_1CB1B2BD 
X-CRM114-Status: GOOD (  11.62  )
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

On Mon, Apr 27, 2026 at 07:13:46PM +0200, Christophe Leroy (CS GROUP) wrote:
> diff --git a/rust/helpers/uaccess.c b/rust/helpers/uaccess.c
> index 01de4fbbcc84..710e07cd60ae 100644
> --- a/rust/helpers/uaccess.c
> +++ b/rust/helpers/uaccess.c
> @@ -5,13 +5,13 @@
>  __rust_helper unsigned long
>  rust_helper_copy_from_user(void *to, const void __user *from, unsigned long n)
>  {
> -	return copy_from_user(to, from, n);
> +	return copy_from_user_partial(to, from, n);
>  }
>  
>  __rust_helper unsigned long
>  rust_helper_copy_to_user(void __user *to, const void *from, unsigned long n)
>  {
> -	return copy_to_user(to, from, n);
> +	return copy_to_user_partial(to, from, n);
>  }

No Rust code uses the return value for anything other than comparing it
with zero, so you can keep these as copy_[from|to]_user() without
issues.

Thanks, Alice

