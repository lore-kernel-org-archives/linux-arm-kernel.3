Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50D5CA5FE3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 10:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J2QUNYNnHdWQ/LZMhbJIi8OYNLDwOK3NJvOKK0udUn8=; b=n3pkRDGmo39hj8FV2/uUXp85gO
	Yoldx14KcXFsRTz3j0eJbig1xWY9mKNq1wZF2zx94Vw6R+6msGqMxhNqnWeNS0+vzqopxugVo0Znt
	UHLe/3/9CceY2QePxAVwqZnB/tD6fCJVQMu0f8eeXXh8Hgp3JVEIBtHL1vw51wuOfYx3GHwZ4llzP
	fVH68wUvulS4Hjqh5b0rm6ZBwtRyLqnVF8WwU6636wlEUVnKU1CAZQEu/e/IQDIwWeqaGQc5h2QO7
	7mIvGu3mssN942CsOe/tW+6g429QCT+weGyjVVaEizE/gNTs9ZU2BOaq8t1Tff/vrK6TnmfF+Bbt+
	m/ZBhAeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwvF-0000000DMVf-2sYT;
	Sat, 03 Oct 2026 10:24:53 +0000
Received: from mail-dy2-x0d.google.com ([2607:f8b0:4864:36::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwvC-0000000DMVM-3qdU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 10:24:52 +0000
Received: by mail-dy2-x0d.google.com with SMTP id 5a478bee46e88-34c28125492so26512eec.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Oct 2026 03:24:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791023089; cv=none;
        d=google.com; s=arc-20260327;
        b=dWhpnqTKq2DymzCRvaoEJeBrDgB745qCh1lwauqXWUq/Ge5PtTdsv0vXHZ93vbWArk
         MiP3UQCFanhvXyE6i9mB0plSA0F8TA2wyfvmjsfgNOFlF3gpO1OMJfxp8ALun/iP281R
         qxlPFAqi71hwbvO4D9MiC3TtJCnvZZsts0SEJUuCQJ8aU4w2oYj59nAYmZDvoD2LpU/B
         nyZYRyzRwV/Mz4k2d7g8MR6G7xMoyQIMNkweXMticRqBpPTD08Ruj+Kgl55fbLLRatnz
         CsbuZcXngME4U64/HQJW7kYi4SDV/3vDkzORRFmMh+GMaM9Vs89ZYA0ZMR4dfF2rgOw3
         3O5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J2QUNYNnHdWQ/LZMhbJIi8OYNLDwOK3NJvOKK0udUn8=;
        fh=IfVwb4OvEqJvhezhdwb42bGBsRhCXpnMOabD5+G3YuM=;
        b=hsshDZZr1IwlbLEqr3UPgwlbBGPzF/41HHDO0Tf7bWK3zyzWmu1TrsZ/JJ2iGWPS1b
         WXo6sIb2V9UMZ0+Kgerb6afuYabzQ+AMnwNCOK+YCwvXlzN9qUcq6ZVkIvJIIUKWspjr
         13Thcu4ofdzwxhU6g154A5O7iaI8GiPo6SPFRC1PJAKmCv3iOSrt8g8UHg1Qpa0owevk
         XTKQ5dgLKFUUuPahsmVZ+uu85EGtkhHUAEo2KE7etAEOH3+Gdhm4Yj3D6c+RDWfDHeoY
         bYTJd8nvdah8klzIG1Y1pN2CVOds/p9ryZadZpxxTMek92LEX3J8Wdhz/CTGuYjMbTmA
         pQZQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791023089; x=1791627889; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J2QUNYNnHdWQ/LZMhbJIi8OYNLDwOK3NJvOKK0udUn8=;
        b=hlVgTSpohzgLU/upTGTbhQv9QHqi26GBmDUCI3ERLdGsjaDIMx0QgGC9/75OBaNEgh
         OMoescCjYxRA5QetZSpin/XSm5y41ADS7KJzQvbC0IAHHIVTLKEkBtlZLzQk3kbntW91
         V/fKpnw56uHnfK+EHAEteV4YVGRxjztxAXYqryLHggiuhl23zNASNDCv793vEwzFtXFU
         TijgjOM9i7Vgv0W/nTWeNCXyklibf2WCxK40v3oeAm5H+MUu97gqZz08oCVL8So319e+
         wF+SNIT4IIXxrCYn3BhYazA6lEwMcbtZ6q+qEa7hqMsmm+1NtDxqN1jnvRRhLpfEpq1M
         me0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791023089; x=1791627889;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J2QUNYNnHdWQ/LZMhbJIi8OYNLDwOK3NJvOKK0udUn8=;
        b=dprUIGnhW6WS+gmVzus8wBshWFJ4UWEbdUNV5mZr6rO8AIlNZLjpKL2IwtpI1ebxHk
         z28zyOBBA7cUF7WwRRTPq5CaEQw1OU+CX8FwMQS5oqg/a0/bvU2saigSntryBS2eI7/d
         jtdFGD6LzgkHUvb1PI3Q6rAqhh5N5S0fl2uZgHSa/pvLARzqn1XRlJfquOQe0jU6o0kH
         N1aWBSO6yfYqlaEY2oUYxNjA9l7mQownxcILai18bQGkOoIsYUtSvL5vFbTAH/JgkvU8
         brapBY0TGXVAnf2ML/PuA7i31gD9v1QCf4XiEFDppGajAJCy+BxvLHwBdFdLpCdEgxUl
         bBUQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9/sibThBEj2d+QtVFJYHFvnbc83Kvt46yoWEUXWbqerwwPJgCk4bGDmu0ivdggW53vKte021v4jeBAhQDbWG6@lists.infradead.org
X-Gm-Message-State: AFq9FYK2EavfDz12rD696sIuHvdrWRlNs5XgtzOcEoEu9pc6r6/jRbV+
	pTT/zVZ1wFWrItCo8Ne6aT1sshpGQ3qJDe5H4uJEXIk8pDcnHfs0M33mtmcaljrLimB8dX4ccvX
	0mz+wHlnf3EeGh7iNjVGbSHoYvhsmfmk=
X-Gm-Gg: AYBFou2uFORUJoK92HCqxMD9fvUrm3da2iEEKjOnOihgI2k1WZvD8Nx9RWaqRkXWAA2
	K94D6cVuZzG8g91ZJ3T9tJTO0TWN8MZfZ5JVsX9Ix2P1gT00iN+sY9BBA63+PZJb1LXhAexKIPF
	M00vlexaVGKMpPc4kHzIBiP5XNbdpXIgBk4N88JPq9oYXMYtGlFDNBq6P8M2w6YAmQpvuHu5LeX
	qBJVu/RILllwK9Q20AcXCYJUvVK4Gt6bipM4NZ5ESTcowqjDgcQfRQWUGf7upO+APsFnp0Tw62l
	cfGvIllcAvdCRDxKtv8KnT6eKP7yxkMW8l+S22iHP5yKR61M4tEKh+b5hBZ8qACHzhhQwdYdyv8
	FwLLu/uos6Dbar3BQgfdQemHi/6OtWbrKJD7AGiG85mOK9NpUDgyTOewciYbcIx3uUD0ejq78/n
	yRMn6LQHsqOelT20P61frIAaGAJ+o93/+gUIuuLO+SCUU6+Cus7x/axsMFICiVgw==
X-Received: by 2002:a05:7300:54c3:b0:34b:47b2:677e with SMTP id
 5a478bee46e88-34f14ff2bb8mr10351658eec.1.1791023089391; Sat, 03 Oct 2026
 03:24:49 -0700 (PDT)
MIME-Version: 1.0
References: <20261003093827.77857-1-kmehltretter@gmail.com> <20261003093827.77857-3-kmehltretter@gmail.com>
In-Reply-To: <20261003093827.77857-3-kmehltretter@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 3 Oct 2026 12:24:35 +0200
X-Gm-Features: AclHuK-MLIrX0vJiZQYXgDSKkkdNcg8lXBGZYj63LJj9lWkFu6OJmgqYprkqXmo
Message-ID: <CANiq72kGay03jqFOfFcJOjr9Poy+yc2u0=Ep_9LQ+KMy=1JtRQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: rust: Enable Rust support for ARMv5TE
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, Bradley Morgan <brads@mainlining.org>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_032450_962093_7DB0D2BA 
X-CRM114-Status: UNSURE (   9.22  )
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

On Sat, Oct 3, 2026 at 11:38=E2=80=AFAM Karl Mehltretter <kmehltretter@gmai=
l.com> wrote:
>
> Tested on v7.3-rc1 with clang 22.1.8, rustc 1.99.0 and bindgen 0.73.2

Great to see more arch support! Just to confirm, are there any
toolchain requirements to be aware of?

If yes, then we should add them to Kconfig, `scripts/min-tool-version.sh` e=
tc.

If not, then please test with the minimum versions too! :)

Thanks!

Cheers,
Miguel

