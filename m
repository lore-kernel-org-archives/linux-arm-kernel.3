Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3CFCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 14:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ralOVts9fCNQ2tqBK8zNgoCjriSrrEOepBDVwIQK1cc=; b=a2scljK//LaL/0kL0OxshLhVIG
	tZ2YHBGCuU/exq+xY8Yn/bURnd9ZUUP2ytlg6K2+T6r+ukDQZ3aW8AUDF80whsswVJdR1pZABF5CQ
	0Q0i0QoP9ZzBcnJmwxvubcZp3hQvROcjJACkfYam+o6MsveRB1cCjiQp403kuOc42iSByjsbEK3H5
	mP97+yRGJ84lEmNWyw8xaZMceDUQmrOj5/pCuuW2xMi9HaCPlOMqqbixIL1VjvLZe8+BY045YOHcH
	F/yACl+H2Uz666xcBoPYXjpOvmVTR+0+5zFTOGld/pvVQrhHdw98BYzGktNmO/O1iyBt4NU3I9aUk
	au9A05hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSySq-00000007Y79-3vW9;
	Fri, 29 May 2026 14:45:32 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSySo-00000007Y6S-2ajW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 14:45:31 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48fed2519daso66191135e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 07:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780065927; x=1780670727; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ralOVts9fCNQ2tqBK8zNgoCjriSrrEOepBDVwIQK1cc=;
        b=FArtUKUltUiTzBcrU2ymM0U47JwhUYLzx7G8fviCnRmN26Ouyn57oRJ49f6UCN8BFZ
         wQzVoz7MtYTw/P//wpL8RsmOgKcCxciZdLLpIvMf70/wzfB1z4ziBoUYLftPNiZuCwKs
         R/VLdtICtS7JlGiJApoTsbAb0/mo6KLVRys8Pl3EACLUfO1g4FD2negbcVIjYHuVAk/g
         tr4fSIzUUikP5E6iZCIoR5mEn7iJkAQEenF1fR9/BtvvD6I2JhtvRuj0NcUw3G3Ip63f
         jHatF/+OudWADNnUfGp1LAszA3f8N6BPauRW4/dOgasFPunjDP3pU+GBp1vx7BRwaMP6
         hQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065927; x=1780670727;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ralOVts9fCNQ2tqBK8zNgoCjriSrrEOepBDVwIQK1cc=;
        b=SXQvO4xoDFmSMSA45vj70IO6v5TKRAYYTUcCVzgqFyeJxrvYvyL32waMlXgrrqBnNu
         AQr7yLl4hFYmqjJ7zcNRkGGX5KzTbl34uS6mNOQ+87oPOUgcLoORAlR5USnE3s8ezgmz
         ymlr0N5iV/f/e/ekEgLmlUC/1X7WuWf+eItEsFeMZbNq/3ez5eNg8RtY2aYSk2HP0FN5
         H/wqxytTClIZmgP7HwOZQBls5OpNiRVOtukEbeqkx2V9tohYFSwupwCe1qRDv2xvRCaH
         f0nXItMIDL0QilCXwGm3IKj0lAzjPN4HdaSk3Knw8pXvr/7jdjRZjOG1GWewcZv9BEuB
         oMyQ==
X-Forwarded-Encrypted: i=1; AFNElJ9brV4bPenmwtvGjEweeljx/MIOnBT/PghH4InL90uqsqfV7UL6CMBj9Ymn0jr5BFk+3lWG95Y3aUxPwiRvIx+l@lists.infradead.org
X-Gm-Message-State: AOJu0YyGuAtu1t6oF0F0kYMrZUdGt7wV3PKEC0jozcAgLDBvfefG27tY
	iPe/TZSSoqCstD5CLlKZV96ropWoM9d+qw02/wohgHQreOUpAdoVKiAREWpuYWcJ5YIBCz1O3+h
	aEAjNTE7jzOWaz5449A==
X-Received: from wmma4.prod.google.com ([2002:a05:600c:2244:b0:48a:93d2:60ec])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c0d2:10b0:48e:7854:1608 with SMTP id 5b1f17b1804b1-4909c0b34e3mr44173425e9.25.1780065927012;
 Fri, 29 May 2026 07:45:27 -0700 (PDT)
Date: Fri, 29 May 2026 14:45:25 +0000
In-Reply-To: <CANiq72=eccCAvfG4kYA52uV5+1ysU6QFYq+3GUgTVwJ4=kxDwQ@mail.gmail.com>
Mime-Version: 1.0
References: <20260527-uwtable-module-flag-v1-1-caa41342be4b@google.com>
 <CANiq72mCYOXrWM7_3jby_ZvYmspXsYVzRqhTgQiBF0bdDLAaEg@mail.gmail.com>
 <ahkzD01e14wOTNBk@google.com> <CANiq72=eccCAvfG4kYA52uV5+1ysU6QFYq+3GUgTVwJ4=kxDwQ@mail.gmail.com>
Message-ID: <ahmmhcyfgZQjnOcX@google.com>
Subject: Re: [PATCH] rust: arm64: set uwtable llvm module flag for CONFIG_UNWIND_TABLES
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, stable@kernel.org, Bo Ye <bo.ye@mediatek.com>, 
	Isaac Manjarres <isaacmanjarres@google.com>, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_074530_678599_82706A44 
X-CRM114-Status: GOOD (  11.56  )
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

On Fri, May 29, 2026 at 04:29:26PM +0200, Miguel Ojeda wrote:
> On Fri, May 29, 2026 at 8:32=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > Hrm, is there a way to perform the version check in the Makefile, or do
> > I need a Kconfig for whether the fix is needed?
>=20
> We shouldn't need a Kconfig -- we can do e.g.
>=20
>   KBUILD_RUSTFLAGS +=3D $(if $(call rustc-min-version,109800),,-Zllvm_mod=
ule_flag=3Duwtable:u32:2:max)

Ah, right we can do it like that! LGTM.

Alice

