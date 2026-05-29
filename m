Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A42CD6E51
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 14:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NjJKmutnUNBGPFFmHdw0hEt43SqCNilkH+GSFOwNlCI=; b=X22dDrQrZgpolnfH7Wb+QxxbwG
	mYGsv6XxYL/WIPf2CfNvioFyu5bCV/BfTDlV+F4B6qxEL9LJbwYG1bBoPS3ABNQVEvV1SN4s8YPKC
	43f60imE//h1yp28qGGbGObU14OeTsoFLwBpUMkB5RdRxIsWfREUsG/M9uw+OmfOpVzGfIrOGt7l5
	DPW4DeEOdoIvw8wfcAgNiNg5NznrYc6/6WMQ7O76BdzDnFpuHaqKYPoVyLjvcf2Qy7GuoSZ4ER2cv
	vLkPkAyZ70qanvn7ua0SI3IYSvi6H0Vds04bg5ujUTeXiav8Qe9rEnB97jD0fpkgMPRNZH/zByIjd
	V9bP8t5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyDX-00000007WJo-2114;
	Fri, 29 May 2026 14:29:43 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyDV-00000007WJS-0Apf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 14:29:42 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-137c0db2638so17553c88.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 07:29:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780064979; cv=none;
        d=google.com; s=arc-20240605;
        b=WXQ3esyjkC0K6Z69UG4uXWIcpUyjizcpg8v5N9o35fEbLwJf9Q9e0tJdnRg9sFjqLu
         qtQzssWXb8RDGDZrYoZXeJqvmPMTXEX5FbkI5X0DdxLH80ClWyOlpKBeIoPcvyr92fDQ
         wjjqIRWen17Vl3LkPFkSwNcodPXgZ7xvZo8DkqDRpQa7ttXLr8azyia0qNPelNDNiKWT
         wvfXczRg+qAfNbXCDdJHc8Ome3QkNkXtCLax2jqOO2wMicRxL4ZtCasD89VOLtm7GSbn
         khi7y2J6lKJATyKdJZjonG0L/vMchDwSVnhRkUD4ln701cP3HuwfYeHAda+ZVYvNQYHN
         HwHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NjJKmutnUNBGPFFmHdw0hEt43SqCNilkH+GSFOwNlCI=;
        fh=/jkOfrzWP05sfhlqIeBzHrRUTlN3YkXNRM+wXeo8MLE=;
        b=RsaxRMT38OUxv/wHjEF20W4LafSeTIleSQN7N+YqjwXfV7ksEAm+M1xgONDxIhsl8D
         pHGCmtCV4QdkOu7ipnvtn4tnSXCVFogIvkgI1ftJZVBfhAR7OyInozXw36yuJBYz+5Wd
         E5Yxi05Bz1hBmw2j6j16eOhWr89+8WnlLKk2Dd7rCybBY4i6IGm+yht02X0pV6O0IAhk
         74rBsUAzTXhLzuYM3mpgPWmmK3yspjCzoljvDePQMCQajAkBVn292JXElsb0oailhdAw
         I/AoRcOHal7o7p8sTCE6oAXv84m29uSEY1YAbpFcARwDHRJopp0kTgDNMBQTVHFpdI73
         QDgQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780064979; x=1780669779; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NjJKmutnUNBGPFFmHdw0hEt43SqCNilkH+GSFOwNlCI=;
        b=G1WwmjyMaPlwAQ85tDOzHrkY2e0LeyJx4q64c8r4C/FrV0aZfu8S1fT4VPMCyrZYsY
         4K9IpYi58+LxGMJbkM9/BkHtExldWXShnFXOd/dS3fL+LZsUjY9wpqR49cX9f1A/sMAp
         FP9S8NMWTQF5uPdurEAd60MBTbE7B24iCUAEN6NYrZcPRw9AgQoIo9g0y8RS3IRFB1FY
         VdBL4ebDv7gTs430HtOFxAuPw75GzKRccQaCR4D1WV61AnPlsxKjJhFsfR3P4Rw13+GX
         c8T40DUhxpoYa3eTbtwcoXPMsTjjIRYZM9L8fnjh0dnNHe8jF9o2aD/4nvywBY8YltjJ
         zX6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780064979; x=1780669779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NjJKmutnUNBGPFFmHdw0hEt43SqCNilkH+GSFOwNlCI=;
        b=IhKdev3iYqjp5RTHWQvLpSNEqi8qhFSR0NRCnIfESU46jYi9+aO0ImUpNWxJPbfEvd
         madumIViAxVeXu7g3oNjUli0S+6Ll4MFvoEOVel0cVRm7fO1iVJFSLteDY79y7gpUmFS
         0uhCNdyfsbAByo8o4xPxMUTUrt4dMo6G+kd/xR/Bg7z/jE0ESz+ZSOAP2Xkw/pgTavha
         kTLfmiBInvlqCKaHqKmwBGOchQXrsBOHJVsWY31hAU9Jf6xFXekejzbedbfhxw9RnpjO
         z/pU46fwF3b7jHYnuyu6NMpCL6dOB1Sxo0clpb1sUrOf+08c7PDmbS8KWbsPJUtjHWkk
         s/RQ==
X-Forwarded-Encrypted: i=1; AFNElJ/AymlkBzzBbryuVdTmsvVvj3O88UYams+9fzLs/fIf2eiiKlW5Lbd7EFXmVuD187a/qUDNbVKhByC/Ta/I2i8Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yztczp4PQo5vZ5Xo6cOtOwNOMIkypWyQmSOUNldEvbGJmtXtNJL
	kSkRDaDwnG2cbDn3Ib3tAZPtiun8QquVylfLES4/3w2SUT3E3NSsTifCSPHkP2G8ttwaFWLGrew
	lJJMOcAVT77AfOSyRtivY8sjLMj7SEA4=
X-Gm-Gg: Acq92OFC9DjKhxckcZ4jmHnyjvKcR7TmAXb7OBDy6qTHAUATpHTlzRFN7IglBc+yK9s
	ypePOsTGDRjz2E8wP+Mz0TkUM1fQjRnSrimAWll6u6/HhRqWmq+Z9cKppje+7FKcG80ykLBbIlc
	PVfas6zAH8s3d9hQBDUqf1Sh1vpoflD0Cy433PPdBscZamtnmlq20IYrU2R/NbKvF/A++wyH1Vr
	vDt/6NEc0IvCJvYScpnWPD7qA8KOXLnIAsAByBcrRaoBPnJy2gtOdwPbm77D9T5x5qcKhlTikcH
	KuJEJf58OvwmlGGSdTU+G+DAfT6fKvVicPMGHvR0z1TH/JNeGA3r0mWKkKQ78WZYeY72eNeQDnT
	hDkBRusCN+hhEJp8sjU7NAE3wzNiZJwXUXA==
X-Received: by 2002:a05:7301:fa13:b0:304:5074:83b1 with SMTP id
 5a478bee46e88-304fa68c838mr7153eec.6.1780064979301; Fri, 29 May 2026 07:29:39
 -0700 (PDT)
MIME-Version: 1.0
References: <20260527-uwtable-module-flag-v1-1-caa41342be4b@google.com>
 <CANiq72mCYOXrWM7_3jby_ZvYmspXsYVzRqhTgQiBF0bdDLAaEg@mail.gmail.com> <ahkzD01e14wOTNBk@google.com>
In-Reply-To: <ahkzD01e14wOTNBk@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 29 May 2026 16:29:26 +0200
X-Gm-Features: AVHnY4ITXSy2YsBgESTon1imbL652KMxtXJwaINjczc3yS9Lri52BUZ0ApSInSU
Message-ID: <CANiq72=eccCAvfG4kYA52uV5+1ysU6QFYq+3GUgTVwJ4=kxDwQ@mail.gmail.com>
Subject: Re: [PATCH] rust: arm64: set uwtable llvm module flag for CONFIG_UNWIND_TABLES
To: Alice Ryhl <aliceryhl@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, stable@kernel.org, 
	Bo Ye <bo.ye@mediatek.com>, Isaac Manjarres <isaacmanjarres@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_072941_085032_093A9B40 
X-CRM114-Status: GOOD (  10.20  )
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

On Fri, May 29, 2026 at 8:32=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Hrm, is there a way to perform the version check in the Makefile, or do
> I need a Kconfig for whether the fix is needed?

We shouldn't need a Kconfig -- we can do e.g.

  KBUILD_RUSTFLAGS +=3D $(if $(call
rustc-min-version,109800),,-Zllvm_module_flag=3Duwtable:u32:2:max)

I tested with 1.96 and nightly -- I can apply it to the Rust tree if
arm64 prefers.

I hope that helps!

Cheers,
Miguel

