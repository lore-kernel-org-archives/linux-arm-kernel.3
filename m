Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ABBACA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 18:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yLp7Ndo/7k4Ng8+ohcODGZItHn+YB7X4XQ/xgVicdsE=; b=QAa9SVrYvrA9z2DqYmnBU9gT6R
	izZFFir17uzAjdv7RThgt+RtctGkqfa2C4sTMR5D6EhYB4ZpkW4R44xuivxtexnSiy+1HgQBZ9Myx
	enc7rGG1KvRWN3xjvsscTYJBfNYhG7025Hgmg2Uk9GCU7n1acjL8hcuE6dwsBPfq+kGUlaIVtGOW1
	jYwLkvwzhhqjGvDFCZlIJGEgwqqXXkXjVwzbNiHHznY/I0rRpQWqMw++Q94d0KfkaLTS+PvvTMB60
	B90cyyn7ykwaw1TXYlwy5hHas/NLZwhjIvFHIG/cujqV3qUeXp6uoTbOnB0upobJvhXDlmM9YmAai
	Lg44HJzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDROG-0000000FBrM-2ywq;
	Sun, 04 Oct 2026 18:56:52 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDROD-0000000FBqa-0Qs0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 18:56:51 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-4a1681949b8so6239285e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 11:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791140207; x=1791745007; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yLp7Ndo/7k4Ng8+ohcODGZItHn+YB7X4XQ/xgVicdsE=;
        b=GpooVAqtHZODX9dGORMZikX99RNkdix3LWa8TfXX6cEMclbZnLVA9tqg8pQk8S/eV8
         HN+93niIp3z1mRBiMVR1SkD9bMXsgNz3NgNRGVnbO/cMru1rX3cOTf2MzKoIxScWECPS
         wuuCvz6bHTXuhsIsiMLTeGQEKogw2ev4z0/7b/+AxZ58hyyHMcMymCX0DQ0uY7mo0Wjq
         dqYc+n3SKL9vMD71DcfWt6LpqFYP+nZ2+wm+TBUN/nTPQh/UjdMuCbrC2R7L0ydFclOg
         11uus5aVUbkj5PmdG/9SsfcWShxcs22i2VEXIIzxMn1TEFs1KEZ4a6EcJdHtQi6OpphN
         hrUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791140207; x=1791745007;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yLp7Ndo/7k4Ng8+ohcODGZItHn+YB7X4XQ/xgVicdsE=;
        b=ii1e6tg0o+nZ30Ktg57xSzrYVYj8ZhiNmw+Ap3APcSKvaNpwPiIBoNTSfNGp6zJBb+
         yzJ4Uz2rhtNjK9qLqBGOyZAvoEueljPvmEQTgQcjNnJ5CkXq2+cIkQLo/L3xH4FcSxCn
         vA8TjmrYirWVEfP6J/lbNMYp2CpkpCJkwHZnJZiv59xT8DYJhnXcjfKc2PQnRynnxe7N
         xOOXdcu1JnXs9Wl5t2bWDozL0QLwGlKFIySPBUOvM0nCrfbL9BBPUJPMATFLbglt1fzN
         txU0zbTJBmorEwOBXxmTDM6oIH30A2vcCUlti0GjNyETSB44U7ISxCEK+R7Fe67RXQ11
         NkuA==
X-Forwarded-Encrypted: i=1; AKwUvBwpQePw7dgD5mRpFEEa+it/oZyaz7kQ+r32CH4Z2nOMyWg1RqgxCdr28EOX8rxNyAEQrDylX0igCMzfY+MwWbeU@lists.infradead.org
X-Gm-Message-State: AFuF++nNFqTWKkPYW2TixN20xWJNZXYg9VSUVCefe44mYWTFzD30n9Ap
	VOv7eZ21VK1FR727h1bT6XAM3Y4mZzGqtvzrzi8tLHCwBznktL6wjOPh
X-Gm-Gg: AYBFou0zmtu6/6rwJKa2aWvookZE4B99LDY0tpbZ5mii7UlsNJEo/T74JwU5GmYB/dt
	4ezYHwvww2WNlbKYWKddtMHtPvObMdkWU9YCikHx5dcZwzqM8IryKwyu7J6ha0UGH8Ii4f4JiCW
	4dK0g3GcWAIzfTZVmib6t3/G29MVvX1nkvJ5M8gs8aaI7pR9+3OE7cP4seHaOk8LFi77XtF+PoS
	JwU7NySdErvG34TkcWQdyzZoQYL5nSajf6ztFAA27Frjw7L1+HD6KcECUNqA+nUrSWJuTTA36Vx
	R96d59WNlqd0e/kNTqkjS/RiltWlo9NOZYPAyHS0cB2fGnPx76vsX67MlBX9k4ruzGr8vAWoP+V
	ZAe1X9aO/hrelmi53JXWHGqZFIFBVgdfK1jUn0+6LthA3mRO62e51XbPRRhmajMhvPLcxWbXyxO
	d04Zt+vIn/AhojlXp8b+gsAUfFp0Ngj3h4p4+FklLYuSav8utRse06QOSvj6w7hlPl2/T2z1AJy
	iHRQZD854C7IqvmJeRIDd1vP30wA70v4f+Ee5umSRaEmIEKrM/kYm2diR98h9g079VCBRXbElwp
	Nh8zj4+d+keebMwT4/X5Z8wR/SAvCG3fQ4yO9hMY54cfT9J9f7QOGXtgmBim7sjh6Vutx/IgXS8
	Kqg6rPKA=
X-Received: by 2002:a05:600c:6212:b0:49c:fa20:cbfc with SMTP id 5b1f17b1804b1-4a02758405cmr139001325e9.19.1791140206606;
        Sun, 04 Oct 2026 11:56:46 -0700 (PDT)
Received: from MacBook-Pro-von-Karl (dynamic-2a02-3100-a190-7401-a90c-9d77-a1b8-e6a2.310.pool.telefonica.de. [2a02:3100:a190:7401:a90c:9d77:a1b8:e6a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280bcf0fsm318633385e9.6.2026.10.04.11.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 11:56:46 -0700 (PDT)
Date: Sun, 4 Oct 2026 20:56:43 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, 
	Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, Bradley Morgan <brads@mainlining.org>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: rust: Enable Rust support for ARMv5TE
Message-ID: <asKgtWX7q-mgvnOc@gmail.com>
References: <20261003093827.77857-1-kmehltretter@gmail.com>
 <20261003093827.77857-3-kmehltretter@gmail.com>
 <CANiq72kGay03jqFOfFcJOjr9Poy+yc2u0=Ep_9LQ+KMy=1JtRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kGay03jqFOfFcJOjr9Poy+yc2u0=Ep_9LQ+KMy=1JtRQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_115649_221703_77ADE56F 
X-CRM114-Status: GOOD (  12.94  )
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

On Sat, Oct 03, 2026 at 12:24:35PM +0100, Miguel Ojeda wrote:
> On Sat, Oct 3, 2026 at 11:38 AM Karl Mehltretter <kmehltretter@gmail.com> wrote:
> >
> > Tested on v7.3-rc1 with clang 22.1.8, rustc 1.99.0 and bindgen 0.73.2
> 
> Great to see more arch support! Just to confirm, are there any
> toolchain requirements to be aware of?
> 
> If yes, then we should add them to Kconfig, `scripts/min-tool-version.sh` etc.
> 
> If not, then please test with the minimum versions too! :)
> 

Thanks for suggesting that! No extra requirements as far as I can tell.
I now also test with the minimum versions (LLVM 17.0.1 and gcc 8.1.0,
with rustc 1.85.0 and bindgen 0.71.1).

So far I found one small issue with gcc 8.1.0. A fix for that will be in
the v2 series.

Karl

