Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25BD6CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 15:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o9j9JckZewB0T/evvAwAYflbY/oMjYUWYlwvg8R/JAM=; b=cYukQLSxabVAsdUZcZbiZ1pnX7
	kFa+XRKBEscHDZllEfzYZBldBUSxwYmEjMc9t6bwP31C4H1EFPsx3cAXZiXqj5/hx+NwTEAmF0f/V
	XHqmOXsUX4MeGjzEK93QowbKWdmvT8JHtmNCUzvH0BDhITcJwjm6UrWmeVuZ61+QdYHTa0ZCAxSv6
	WJz41KzxoP0hRpKUkpSkhsmnHGb89ZFlHnq//qTXxkrmrcXrGv9jf/iiddqXL2dpB6ByZef5prM0A
	GKUu4QAzzqmpaYR1p8lzGVs2UQSmYjnTW+sRqaJtGtwq95JLKA3uYcbET5HfAPh9KgXQvhD7wdKib
	gNmDMXIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOdaM-0000000Gp1E-2PSi;
	Thu, 27 Nov 2025 15:07:06 +0000
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOdaK-0000000Gp0f-134F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 15:07:05 +0000
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-640c9c85255so1320502d50.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 07:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764256023; x=1764860823; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o9j9JckZewB0T/evvAwAYflbY/oMjYUWYlwvg8R/JAM=;
        b=KOdfRbPmqcD/+ydvH7mPKtIeobIZ/69MQDfBRqmYEFo7AFWc7hogPHTTuKkAClgRAF
         7H5jFodumG6wHph7xV5T7CjyPWu67CWgPm7XIAvDHpW5YBhpJKFrCukt7TmkfzvY+Sdd
         xKfWkzIvfwpOl00+ewBXxP2vpe8NoU1JaNXgCF9hflJnabryhAvWOAul1lSYmzae+8zD
         2pDoDqIeG0tiCSXIvFEFVYIAOQ/Z4DPuDeVRT6qAKs7ljz69EmCZ94eaM545RLemT1Z7
         A3wucggLfUx02pBuDkV/YuiKfmNjHHOEyMoKvTAKW+htI6upvTwPyL3zd17KfLNL/YTd
         toCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764256023; x=1764860823;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9j9JckZewB0T/evvAwAYflbY/oMjYUWYlwvg8R/JAM=;
        b=Fz+Sl9XYL2p8YsQJPFgfbULsSFGyovRx77QDo3ppR4CFEGMQtMFoWkomPH+7L4M412
         wVjkfCQZKeZ4j+zMfv50ysoTW9ZZTJ+poru8HD0KWYHS5rPn4gySYeuPxEYXIxf62unZ
         nrzvDSaJOu0iKHq5EONOtK5AxK1YykV/zuPN/5hONRPAwFXsdnpsy89gxLpiKmku19G/
         +sMNhwpS5D46509Bbp0PfYMYlMYj2Wx2Khyh/fd+KAmiFQyUvFCisZDf//pA3o1P6Wx4
         OHcamWmWW10+T9bhcKApS0WgZPJu2hySSygMV4Rc304v8bnJtkoJbhe/JETA5feEnFU5
         SiHQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+5IK9zmI05rZgakzPOQAY2N+bxq2y8FmIdEU7j1Z3n694yaKaP/5vdW8Qqrb76nrJNQAnU0Koig5Zk0MUpRs8@lists.infradead.org
X-Gm-Message-State: AOJu0YzZK8CwE8ppyFMFsLtCumXbVUghRihy42Sj2DCAgjQri3PaM9mV
	x+IeYryecdu00Si7J/zgRVsZs0LmkC9bftNfOgToNvpBJNqqTK2QZxFV2BeQYZXe7lwZPIBjqIi
	5tmcX5gSuvkuQhPjkomvqLc8wdLZQl7BjKUKP5kd7bg==
X-Gm-Gg: ASbGncv/GHwmpkBRIrZrynXI2pGt1KiM/YiB8X2LP+LooeRQ7/4E4+wRmvhq3ag6a/b
	lBufabzwYAGuqzfTGbNKgf6nzuuwhw4EO9Izb+IHkgj6tZSJJ/tcwSuEoU+bBgFQ1PzZnwHjc99
	RCZFp9iA/71Gyr/o5DS+AA8f7H+wTSf0EIEuaFzCRTsZURPWaubTFXgx9lVBb9hnNXW5fMOZuAI
	ZElcR2zm/hGYo79bHPT+AoSo05afrL1aJk/ptiPUI9lScY3kB4++5kmxtAUOHb5mPCLnXOi
X-Google-Smtp-Source: AGHT+IHOZv1XVUaCpJ1GafgJ+Q4ufaODDINZzVe7OUjEEvUjTH0ObsXn/Gn7AJqtRSZdFMpWXb50BEdfVotDE3qezIw=
X-Received: by 2002:a05:690e:1581:10b0:641:f5bc:68d3 with SMTP id
 956f58d0204a3-6432940d24amr6552660d50.80.1764256022644; Thu, 27 Nov 2025
 07:07:02 -0800 (PST)
MIME-Version: 1.0
References: <20250902-kvm-arm64-sme-v8-0-2cb2199c656c@kernel.org>
 <20250902-kvm-arm64-sme-v8-11-2cb2199c656c@kernel.org> <CAFEAcA_GJ7gzn7aMCZYxHnJWvx4tHSHBKsOxtQ7NTb4gPjkMJQ@mail.gmail.com>
 <df712591-397e-422b-b9c9-fbf080cad9aa@sirena.org.uk>
In-Reply-To: <df712591-397e-422b-b9c9-fbf080cad9aa@sirena.org.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Nov 2025 15:06:50 +0000
X-Gm-Features: AWmQ_blQNCtlqrFl6oR-29ayIeVzxjSMrcpdxqL32ABrh38kpa7m6Xz9ardxRBI
Message-ID: <CAFEAcA8LGwm-6JEhtKTq1E_da-T=H-aBX9-8LMJOAQpK5J+NfQ@mail.gmail.com>
Subject: Re: [PATCH v8 11/29] KVM: arm64: Document the KVM ABI for SME
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
	Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_070704_316014_8B645383 
X-CRM114-Status: GOOD (  24.23  )
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

On Mon, 24 Nov 2025 at 20:13, Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Nov 24, 2025 at 03:48:06PM +0000, Peter Maydell wrote:
> > On Tue, 2 Sept 2025 at 12:45, Mark Brown <broonie@kernel.org> wrote:
>
> > > SME, the Scalable Matrix Extension, is an arm64 extension which adds
> > > support for matrix operations, with core concepts patterned after SVE.
>
> > I haven't actually tried writing any code that uses this proposed
> > ABI, but mostly it looks OK to me. I have a few nits below, but
> > my main concern is the bits of text that say (or seem to say --
> > maybe I'm misinterpreting them) that various parts of how userspace
> > accesses the guest state (e.g. the fp regs) depend on the current
> > state of the vcpu, rather than being only a function of how the
> > vcpu was configured. That seems to me like it's unnecessarily awkward.
> > (More detail below.)
>
> That was deliberate and I agree it is awkward, it was introduced as a
> result of earlier review comments.  I had originally implemented an ABI
> where the VL for the vector registers was the maximum of the SVE and SME
> VLs but the feedback was that the ABI should instead follow what the
> architecture does with the vector length and potentially presence of the
> vector registers depending on the current streaming mode configuration.
> It sounds like you would prefer something more like what was there
> originally?

Yes, that's what I would prefer. The "varies by current CPU state"
approach seems to me to be not the way we do things right now,
and to be awkward for the VMM side, so it ought to have a really
strong justification for why we need it.

Generally the VMM doesn't care about the actual current state of the
CPU, it just wants all the data (e.g. to send for migration). We don't
make the current SVE accessors change based on what the current SVE
vq length is or whether the guest has set the SVE enable bits -- we
have "if the vcpu supports SVE at all, data is always accessed via
the SVE accessors, and it's always the max_vq length, regardless of
how the vcpu has set its current vq length".

What's the benefit of making the way KVM exposes the data
bounce around based on the current CPU state? Does that
make things easier for the kernel internally?

-- PMM

