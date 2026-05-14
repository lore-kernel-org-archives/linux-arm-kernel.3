Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FD9CD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 23:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iCrvG6gDvT6q/NN1t3exob8czfIU3adNxBT+Aa2Lpbc=; b=LE5cOZCEKSv9PF2QPDin92TBt/
	Vo2ApFQls1/Gjbl066jeSJLn1vGwzYjNIttv8+rIAAKc8mCte+QOiiVxI1gHWUteZDj9HDuWXB19E
	lAa/QDdi7FlH8pT9iSBlULc9m4l0OcwyDXgEXscHKE8bFsdnkVBBhul3XU+8XiS5HCUeISa20gHpT
	z35UW6jx31ReR0RLBTOVFnLofb2gs+hbLF6EA9rjXdBOiSrZz0jBaIKhaJA5v4co7LgFR1PeM2cTE
	hU2CrFSTCCmm/K1vWP3DefuhlrNJra2CLlgtDXPGWPslkRzzRSXgcNeJ/btlwfmXLGPeu5dURLy6d
	5ZdglXqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNfPl-00000006owW-0Bz3;
	Thu, 14 May 2026 23:24:25 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNfPi-00000006ovu-1aBa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 23:24:23 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-12c7288cfb9so510707c88.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 16:24:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778801061; cv=none;
        d=google.com; s=arc-20240605;
        b=JZLrC/DTJnKxBhwmJa/TO/yDCu0fHfYfJpkbjtKhC0Hf3WdCrJY9Hl5ClcSoxoLU4y
         T14vpK00BUS6UdJndJamOzzV/InSlBCy3gn5jPU2o3V5TEPhxqK1OOpRYjS81r9VmvvM
         /5MU6eyx/EwsXE2Qah2O3G0+Gxjz8s3X41j/GfEsD0If6VF/Zc+X1eghwcdtrkrxZqqm
         TQdwHD1Mnwl0UjaAUjY2lK4IJAt/Dy+4ASDQ0srjUlya7DEh2H7fRVmMXDLhUgSsA6Lk
         gdodWpGJx5Ascs4CgQJ4E0YGyqneUWebFgPKfjk9WUhznwmybvxhYru8kg517sBosgR0
         hT4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iCrvG6gDvT6q/NN1t3exob8czfIU3adNxBT+Aa2Lpbc=;
        fh=zNQvOKGc4b90Ae4mr3s0n+T45tiwZYBzJKIOfqSGSGY=;
        b=D1HDVXHz4lsMcbw8BO5kpzAQW4X4hwhIZ5da1o5PpmGAsHRQT/Xr5id2VIgVKJazuW
         V+llUlMIk5gTvJt/6SRvdP+V3TzAxsyHwn/h3F5AzyO//KxYNSqZOWpRg7cxGiqtaGg4
         B7u3klmyao9mEYOJ7TAauWfWGdO9v0oAm72hQCjej6+aOht42NpheO/DYDpRlS2P0zF5
         ydx+xG0yYmyXJcgKyXJ/ZWQmc7eIEfnT+pG9zULGKqJ9FF5hDf0yuxex/hQz9fQ969Rj
         ouSU18DiRNyXb0gizZuEsOsNV6ZVazriaO6SCcPDhyd4VGrkZ040uSFJF6KGrTLKNcA7
         b6+w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778801061; x=1779405861; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iCrvG6gDvT6q/NN1t3exob8czfIU3adNxBT+Aa2Lpbc=;
        b=R1NfgSAUSwqj4jzfyjuVH7K2F8TrtbYyFQ8Ck8MkT36X027JCnCJJKH8QR1DaCcv/w
         uYhed4Qfou7EpXjMxR5GnSb4QMtP5HTejoeMU/OmW+dNPaZtnlP7j6lTr5GAXoekcKvH
         dkpna6RYoKMyBWU6BZdoxR1laIv80JWe9ytaxxgGzFPNYPHAMpeDtgmGLeChDpjFl3zA
         QlpATxySlKAEYgftXOpWLCkCOWL5E/TizLHVFeBvRWCc4h0VfDnPpO+l3OGYSDsl+MzR
         L+G8MKpIv+PQTkmIz6Qawnf9sv2R+myrJn2rAxDiPY8g+ft1pxQ3t5HUk09ynE0/pKny
         SxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778801061; x=1779405861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iCrvG6gDvT6q/NN1t3exob8czfIU3adNxBT+Aa2Lpbc=;
        b=SGQGMorFbNFqBlduGNOFbAOfCjdn62mJ/LlycnElM0iMb9pDlDeROnDjvBqhJhKR3D
         Nzw0sJeVdKXequ4y9qOe5DUhHKE/1r0Fk3KlAvS7bV8vsGYo9VU4/TSsdPcP56FQHBtv
         yl3T5B01v53uXAQ942pieGUiq7g0Qw5/tIPIJ91YHFBBxJyCb5R7IvckGTSLZ1NTCfC8
         lzY0jIxtb9vHD53MuVWLS/W8q/+WzWw7U59d/UGAFLaehnmVTejSLSpbfjURIrXSCNqX
         X5dYR5hB6TOieqHJqCVHRAPabHqbCwktQlutwN8zz4z9BOyK8A01mTXNKviWOLFhvz9i
         bz1g==
X-Forwarded-Encrypted: i=1; AFNElJ91EX58WrDZEtQL0fqivYHs7wIImdr2fITNbW67yFIYevMsfu/Z7f5gzTTDhiU5yceENPI8mIOgciRg+uC4KRdc@lists.infradead.org
X-Gm-Message-State: AOJu0YyxbybKLrlnskxGjI74sMLejXcsB240dmSficK4kpZdKK+3Gf+0
	8PgQQ0QvEeiDyDBrYfSu2lGWLzSJ8+s+4pjtSFim5Q+lsH9gvQpWnA+Ghfli+U7gkgOo/WeKLFl
	eqW/AEwoeCaof3HiCSerUDe5scoL7nBo=
X-Gm-Gg: Acq92OHgIpnjru6EenmHnAkKorOrbRTKw4eKBMtE3U8qrnuCcd9DvBy2oSzMppJYWUn
	NM/ODugVY8JF7tGyxj2KnE/hf3r6g2wkE996iKs9R58Fo1ZAHAHrkpjP+s08g7MQyCcQYuYgsA4
	C8uNzzrLcuq+s3rV6omZWLMmg/1m0LsKx70cIiGvORu7K3U2AxErLLJYjAHPZdbXZwgwC4ppN0X
	G55ZBMctdWQXLVBC6V/W28ammhpTunAvlBw+0YBRA83dNe2GU0Ho6GtdZRNjrk55WzqYj/P4rjV
	3OQokqIqJYoM9hDy+2F8SiqFtKfArnl1k/HkxI1La0/S9lURXTj9rnArQmuRMv6rJJIF/r0S5SB
	0elPdAAwl6QLzOH2qW8N83J5bZmDh+kFsJQ==
X-Received: by 2002:a05:7300:a903:b0:2ff:bba9:c76 with SMTP id
 5a478bee46e88-30398706533mr344093eec.5.1778801061172; Thu, 14 May 2026
 16:24:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260511-arm-avoid-rust-with-kasan-v1-1-24d55f4a900b@kernel.org>
In-Reply-To: <20260511-arm-avoid-rust-with-kasan-v1-1-24d55f4a900b@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 15 May 2026 01:24:08 +0200
X-Gm-Features: AVHnY4L53ARsjRDewJnLSnNGXHTdLumYZ67gHz05fYQmwiowdxVQQXO0c_1LPyU
Message-ID: <CANiq72n7jO2dbW=y0qqkL=qwu+nEt9DS9dYsLhWVSSLuJk+LEw@mail.gmail.com>
Subject: Re: [PATCH] ARM: Do not select HAVE_RUST when KASAN is enabled
To: Nathan Chancellor <nathan@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Christian Schrrefl <chrisi.schrefl@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_162422_420593_9E525889 
X-CRM114-Status: GOOD (  13.33  )
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

On Mon, May 11, 2026 at 10:02=E2=80=AFAM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> When KASAN is enabled, such as with allmodconfig, the build fails when
> building the Rust code with:
>
>   error: kernel-address sanitizer is not supported for this target
>
>   error: aborting due to 1 previous error
>
>   make[4]: *** [rust/Makefile:654: rust/core.o] Error 1
>
> The arm-unknown-linux-gnueabi target does not support KASAN, so avoid
> saying Rust is supported when it is enabled.
>
> Cc: stable@vger.kernel.org
> Fixes: ccb8ce526807 ("ARM: 9441/1: rust: Enable Rust support for ARMv7")
> Link: https://github.com/Rust-for-Linux/linux/issues/1234
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Applied to `rust-fixes` -- thanks everyone!

Cheers,
Miguel

