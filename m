Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6795BD35177
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 12:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ycc6WMg7OLshR/yyfU2jpKKLPa+z0xOJ3hTWvecsxRM=; b=m3geTi+ok7neIjcm/o5prH6UEW
	d/jJwQQVj9G6kUC7S6NK8mndhH69XuD3L5gZ1IJPTOW8Zo0+jmBh+pbv5iDMZosAYqKoc68AMVfCM
	SUZlyYl1RTlRuOXakqWP169SJB3HgMvWmChArs0rxD+/j9NoXnnCv8MocJLRqSznsKrVI+UifBKa/
	TjWkWOIhCq9MqVePCpZTbLElH3m87z89jZ7A974m7kO2QsS+RE6ySqrPrPKFUzoDMXHnC7M0xrRG5
	Dtvl8zqe138GBlUje1Y5qfk7Yg03Nj334i4IAIWDVkm3se3L3smDeK0w/qrVmbJl7zep62K8iq5Q9
	NpOhGs3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7upW-0000000FCOt-1ax1;
	Wed, 01 Apr 2026 12:37:54 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ud2-0000000F337-0pWy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 12:25:01 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-b97f04b44b9so538271866b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 05:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775046298; x=1775651098; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ycc6WMg7OLshR/yyfU2jpKKLPa+z0xOJ3hTWvecsxRM=;
        b=M5WkMcl+EKvMFwXo1qHb0SV2ZheUhpewleyOhyw0g+kPB0Tpk89Cwck805J/rrF40g
         eYovGqcGpQ3XLMDq4VNi+ivmWwZ8MAGt/ly0BqQlJca98p+/ZA41KSo9wm/f0/FHcENE
         uM7p5UWOaKo1tJ2qan6/Um9XI1OSOXD2n5J/z05jpObqfTcU5xuctPKn1ZDjvesSOFew
         FAplWuHMvXkJsWW7wFlg0ZHybpusSxXrsVuLBB62vjSPFXFlflpRAqxbZ3aF/wy3ax1x
         n5grSUy+UG/J27aQ/upV1xQ1yl7r8cPzJ5bEeGyceqvSqV1ldUaIUfbQW0MIl2vCUEYI
         rpig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775046298; x=1775651098;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ycc6WMg7OLshR/yyfU2jpKKLPa+z0xOJ3hTWvecsxRM=;
        b=DxiWT1tRlu8l8s+R2nPx3SqoQtajljzJE0ktHc2NjpW2Ur8PFYmXD2Izui+KBOL09N
         HWFLIk3ZE8o+5OhTQOG/i8oGVVjCYC7dakCBuI2TbLkRQUJFQIOluLlVVcSViAlrzm2f
         LXi56X4JJDqTGTrlwy6IWeT2uANI9GahLe7RXrdsBxrCHGkoN5p963OJJxMv5HO5XCQ7
         yKb+JMuW+MwNBBM7y+gZh2RJihLCst57IWqfId/3XvF7WpfhFS9uUz5alr1RFynGVdLd
         s0OA20pS5bCYu7FVnG62gUvvqtGufXzmwyWHGpgkd1UvAjrMU7OAavn3rRu3EmBAYIvY
         i8nA==
X-Forwarded-Encrypted: i=1; AJvYcCX+JsJtVxlFONvmCNR7PeS1Rg1v6g9tlKBiy9obBugLDia0uce2wmw2IJ7/mJCkkUZcPh/eYNihH7p3LTBb0HnF@lists.infradead.org
X-Gm-Message-State: AOJu0Yzfe/xFNhLCUnH1joISF9RG5cZ6R8DIs1ZdOilFWpEtlO2JwfXU
	aKjbu9Yu4Z+nE5Jb3G77L46i9Ux3rt6oHFdtGDxXlPl5ZHjwNb9HztA/wX29PGnTkpPZylVau17
	fKZTzP8JgTlqXi35ygw==
X-Received: from ejcbp3.prod.google.com ([2002:a17:907:26c3:b0:b9b:54ac:688a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:c448:b0:b99:5f69:9ee2 with SMTP id a640c23a62f3a-b9c13cf93e8mr221111666b.52.1775046297024;
 Wed, 01 Apr 2026 05:24:57 -0700 (PDT)
Date: Wed, 1 Apr 2026 12:24:55 +0000
In-Reply-To: <20260401114540.30108-2-ojeda@kernel.org>
Mime-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-2-ojeda@kernel.org>
Message-ID: <ac0Ol1PaRTWNK6O9@google.com>
Subject: Re: [PATCH 01/33] rust: bump Rust minimum supported version to 1.85.0
 (Debian Trixie)
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <christian@brauner.io>, Carlos Llamas <cmllamas@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_052500_255204_D9C95670 
X-CRM114-Status: GOOD (  16.91  )
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

On Wed, Apr 01, 2026 at 01:45:08PM +0200, Miguel Ojeda wrote:
> As proposed in the past in e.g. LPC 2025 and the Maintainers Summit [1],
> we are going to follow Debian Stable's Rust versions as our minimum
> supported version.
> 
> Debian Trixie was released with a Rust 1.85.0 toolchain [2], which it
> still uses to this day [3] (i.e. no update to Rust 1.85.1).

Debian really *should* pick up 1.85.1. It contains bugfixes serious
enough that the Rust team decided it was reasonble to release a point
release.

> Debian Trixie's release happened on 2025-08-09 [4], which means that a
> fair amount of time has passed since its release for kernel developers
> to upgrade.
> 
> Thus bump the minimum to the new version.
> 
> Then, in later commits, clean up most of the workarounds and other bits
> that this upgrade of the minimum allows us.
> 
> pin-init was left as-is since the patches come from upstream. And the
> vendored crates are unmodified, since we do not want to change those.
> 
> Note that the minimum LLVM major version for Rust 1.85.0 is LLVM 18 (the
> Rust upstream binaries use LLVM 19.1.7), thus e.g. `RUSTC_LLVM_VERSION`
> tests can also be updated, but there are no suitable ones to simplify.
> 
> Ubuntu 25.10 also has a recent enough Rust toolchain [5], and they also
> provide versioned packages with a Rust 1.85.1 toolchain even back to
> Ubuntu 22.04 LTS [6].
> 
> Link: https://lwn.net/Articles/1050174/ [1]
> Link: https://www.debian.org/releases/trixie/release-notes/whats-new.en.html#desktops-and-well-known-packages [2]
> Link: https://packages.debian.org/trixie/rustc [3]
> Link: https://www.debian.org/releases/trixie/ [4]
> Link: https://packages.ubuntu.com/search?suite=all&searchon=names&keywords=rustc [5]
> Link: https://launchpad.net/ubuntu/+source/rustc-1.85 [6]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Acked-by: Alice Ryhl <aliceryhl@google.com>


