Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 485F3CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 18:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IdoA2Hsz3DXflOJ/uWb+OTuJMtFaS4jo6XzpS3PQUeQ=; b=Py7AEXMokan346RRTeQtHHcIks
	y/VtwoSNrp59Mlj+lVqxr4yM4W+zw/ayJnm14SmoX1u428LSojXge2gWtQVdW9cgRNCvz4s6zbNUg
	QuBoJEWuNfbGqhisQjEeAwv8ynF+CM2XsY5cNDuaDedEv0uoGgVoQKoihtHyj+SCHZLalOp03ZegO
	UmDSE7fLL3xuSUDrMjUFs1GumX4Qo5D0UDEhgKoVOZ6muQyw6d/DxMKmjYKiIVgtecoSSgijsIAYO
	sHCGPe4qYMPd+10Wy3QUgrWoEhnDdZqWLPOGqM8BWIT7FWzE08lNm1MujFCkTKV/ZnL1S4b6vAuw2
	Qq3qDldg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDoE1-0000000GTwQ-0ROm;
	Tue, 28 Oct 2025 18:15:17 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDoDy-0000000GTvr-0inz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 18:15:15 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-27eeafd4882so30475ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 11:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761675313; x=1762280113; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IdoA2Hsz3DXflOJ/uWb+OTuJMtFaS4jo6XzpS3PQUeQ=;
        b=0bFiM4nunUFpFx/lAKmWwiQa8jTFkJ4TebBcVNcZEp+tm6L9EKh4KOPjZnS2/ZKVf6
         jEXigbafMIoECUiiP7XjmT9vaHSWAg+ESIX2PZQuupXEC8NbH2HLMMZlkMZMwnVlulYi
         YP6Qsz1OVdXvYOQAdQD56iWQ/Am1JeoPgbv03bfhilgI1lf/CtMTPLnxcLVR4CuU72Od
         UdKWE3EuDOir5Gnsv3evKkBbSuNXXQREJle8L9rDu+vPbW+ZTQZhPihCxvfnmIf+t7b6
         7/PVIaBkBbJRYh/ZTsSm4QMx1YG4HuggRaXoZxRgSE3kAqp2Ow9GjDrdAetJ9uDrqalS
         qTXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761675313; x=1762280113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IdoA2Hsz3DXflOJ/uWb+OTuJMtFaS4jo6XzpS3PQUeQ=;
        b=lxnrlUpi9ZcLOK1+nugUa6zehuW9mUAhQczXbI/QDWebAMBCQRClocB9inc+5v7+x/
         Xsk+5b0Df8u2frlkHk84VZPCDN8nanwOw7p463bgXqL6XjZc1NpRHbEU4/UkUZp0hno1
         wH6G6TT0qj1ly0T40C9IWxWwo/5245WWFon5brSumrYNeUZlsV4hxuxX2OdHrWD49DE2
         TKYg0c4Qox9ns8rw/D3vXbxoqg6C9peBwK+eifb1b6OHtz5fgVWcNLETnRTNJXCFv8TR
         mJeBzbkCICCfz0XMDeoYn3L8AArbjPhuAAkqbnM8XgDwN6ggEyG5NElgzwOnY0Twgj2s
         uguQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEd5TIntsKcBe2yQxQUnZDDGxnk6thX3UqqiH/8rgOWM8Q6CNv8ss8Ho0ht1k94/get9ZD9YDZjCreBtfk0cQI@lists.infradead.org
X-Gm-Message-State: AOJu0YyoP3qyLQrC3lRr/WRyvMRGChxgc9sFA3ay6dNQkGcxjV5IyfuE
	IDQ4RdZHytH+1TU3U2un2Hah/yA8XkZDrxxsbyYCf70wQ9hxSB70DE6mjfQE5Y78LmCRZAkh+gn
	BNCpM+/TdbEDaXC6VfTVKNItY1v4g06vUWuaQ6Moq
X-Gm-Gg: ASbGncse8teuh5KF++h74k49ocWQNp6f6cXCF02rTz0Qvl4Q68/zEYdKH5ZkfV0oNnu
	EmaBy2qJtsYUatO5xFeq5P+XhUvqXIB6O7RjlDIGBt8LIlM0YpyFIJu7Ffz0OfIi0IKtl/jVrhy
	+ptylMA66JW69ykU61K0uChrm6em6XHKz4gi2BCgzcK5xfUJs4biItjB/J7QHOldhAfy2/fmmlu
	k2llaqfYnA9Aq6RI8tnHtxqKLFrBpT9Sq/ND9yoS0B8CbRjAGNf4+AIhQ==
X-Google-Smtp-Source: AGHT+IERGgSXUSFxn2JeNfQ2C86EuHjvzEyZOaIycK2W0jkA78IAxEYdTtDG+mA9d+7pqLJIChA0NWObPqGrobS4WTk=
X-Received: by 2002:a17:903:22c3:b0:291:6858:ee60 with SMTP id
 d9443c01a7336-294de36e83fmr559985ad.4.1761675312071; Tue, 28 Oct 2025
 11:15:12 -0700 (PDT)
MIME-Version: 1.0
References: <20251025-idpf-fix-arm-kcfi-build-error-v1-0-ec57221153ae@kernel.org>
 <20251025-idpf-fix-arm-kcfi-build-error-v1-2-ec57221153ae@kernel.org>
 <CABCJKuesdSH2xhm_NZOjxHWpt5M866EL_RUBdQNZ54ov7ObH-Q@mail.gmail.com>
 <CACRpkdaeOYEcK9w1oy59WBqjNrK7q5zT2rzg8pHgDdZdKWVKZg@mail.gmail.com> <20251028175243.GB1548965@ax162>
In-Reply-To: <20251028175243.GB1548965@ax162>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 28 Oct 2025 11:14:35 -0700
X-Gm-Features: AWmQ_bnDLfsfNIG5--yjR8bWyBut4gyt9iExhd25ip84kUhmdr4d3xv1vPYI1-Q
Message-ID: <CABCJKudsbd6=8B+fkzbw6TkL-dVvSoT3Co=fW+jWOnuBtxsLKg@mail.gmail.com>
Subject: Re: [PATCH 2/3] ARM: Select ARCH_USES_CFI_GENERIC_LLVM_PASS
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kees Cook <kees@kernel.org>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Russell King <linux@armlinux.org.uk>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Michal Kubiak <michal.kubiak@intel.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_111514_233357_13A1681A 
X-CRM114-Status: GOOD (  18.22  )
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

On Tue, Oct 28, 2025 at 10:52=E2=80=AFAM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> On Mon, Oct 27, 2025 at 11:56:21PM +0100, Linus Walleij wrote:
> > On Mon, Oct 27, 2025 at 4:54=E2=80=AFPM Sami Tolvanen <samitolvanen@goo=
gle.com> wrote:
> > > Instead of working around issues with the generic pass, would it make
> > > more sense to just disable arm32 CFI with older Clang versions
> > > entirely? Linus, any thoughts?
> >
> > We have people using this with the default compilers that come with
> > Debiand and Fedora. I would say as soon as the latest release of
> > the major distributions supports this, we can drop support for older
> > compilers.
>
> Okay, I think that is reasonable enough. This is not a very large
> workaround and I do not expect these type of workarounds to be necessary
> frequently so I think it is worth keeping this working if people are
> actually using it. That means we could mandate the backend version of
> kCFI for ARM with Debian Forky in 2027.

Yeah, it's a bit unfortunate, but I agree that we shouldn't break
existing users until newer Clang is actually available in distros.

Sami

