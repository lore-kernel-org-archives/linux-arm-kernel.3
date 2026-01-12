Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B55DBC9EC90
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 13:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jaGuPXqFXeyZwxS5wActQiEFDVDRQPMhfrfAWEZUdIY=; b=MpLF8HFfPMQkcJYawjgnxGJphm
	WTNlJh8e4Ygt/jijVPrcs8ODZ+uUY5lTKIb9zPo3neaHUtrwLGNOxr78KCy7NjcXms9xnemRMGQ4f
	DoneWa+bHICKoWpS+X3BDhbGYLGNj2nEY2QTBZUqqnHko34Ww7xOZYNdwqWtjkumwkTWsDwDh2KXY
	rrz4t6cqDt7TeH8XyZPrDFaHKtCkJODCn7VDtGdd4AmslXZoDJxn7XgKfNrNBPZ1yaR4OYo286Srv
	jXya6lhVYBgXI0o0ew6NIjXSpib5ZXYwjHVx7hS7wUPCGERiRkpVtT9z5Rr87+ljbo+GkPFF4Pa0n
	CsnRAEWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfHz9-00000005PYA-11iZ;
	Mon, 12 Jan 2026 13:29:31 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfHz7-00000005PXi-0XZY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 13:29:30 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4ee147baf7bso825171cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 05:29:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768224568; cv=none;
        d=google.com; s=arc-20240605;
        b=F8WohogyX4zKzKJcJkJvGVvnowa/I6yt/ToE8sb9mnwg+DvpCus2ApvpjwtaNbXY1C
         KQ8dDOZBqssY4hMRNa+CQsOMMXG3HMKgoZEfydqxKtQV67cp+rlLkyvJNlHEgkgt9fuL
         cdKNULO2qnzvIl4WoiFTMge/w4QAXy/E+FURV3Z8hMJKGNuuH6Fksbbz41kkCdSlrxLy
         HENneKRV7qE2YZ1xy4R/4HQ1mtZ9rl/B6Ctz2Xz8eNZaNdBB2NO+sf1qMZVHEKTODdtj
         V1RWwVhiRKMoaym6bBNn+g0TE+tuMLBzSdJxfRfJyztiDBJotbAQEzQ7VAVHCZ3Ob4rC
         ThNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jaGuPXqFXeyZwxS5wActQiEFDVDRQPMhfrfAWEZUdIY=;
        fh=r+VrWTcdf7jKwAe5lcZbQRInFY5RpixWg+SjKYgKuSc=;
        b=JHdj2W4R1Oh6c9xz6Dqwg5uvk1MCKWvaLV41IPeG0zrrOgR6s7ilbKyNaEtQn35448
         rGfBRRj/uRarrf7cwOrnPKGO0JaWAyuyiG2fHTVZDS9lMq09cXUuZy/m+mDPM5rQxfkb
         op1rCXRIJuBfOitL9XnANZigyqwwIPriAqt/WxjlX96oVPjcd2IeHiJokLioDUDbkwJy
         XRQLoBvL66Y8n4Cow9pUXvLjLZxXgNJ/N/Y6fgwIkvA/rdPLcYIsWinvE/wbnm+eDeQF
         HIznp/4TBloSQAaXpRmMsnT11+3tTuh9lvZ+R5Lw6nCAd8V5OjI63yNSaHHt8nP8BpGU
         6hfg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768224568; x=1768829368; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jaGuPXqFXeyZwxS5wActQiEFDVDRQPMhfrfAWEZUdIY=;
        b=Pgnnb7JYgGPbWbjFOtO2xBpq8jk/GirMynjBiJjtZVlqG4kLFQIfhHfGkQygIeQ9K3
         jTnd6J0/6wBkYgty0jT3V2l1imnePBWviFzs/jLJEFCOmF/JGzR+2XIXXxoh9rQc67Tc
         pTrBppgg2bwV0LxdhUzOMPfmouCjhOJSR+bz/TptX9WGSeoh0mTfUZfDEzvjbAscEQMO
         VVS/wXftQsK33OJgkvZukg5JjuZQVxzn6LBpn27sCivujw4QEFHNX+nU802XdVfKrRK2
         zrG2dYoXUTkEe5kxpxvCdjADW4dcvSXI02Ppdnusvyd+sAV2UUIruUNq1+D+uEQZy4z3
         c/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768224568; x=1768829368;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jaGuPXqFXeyZwxS5wActQiEFDVDRQPMhfrfAWEZUdIY=;
        b=MghtqYoQYviR2mTWZOwiRVMbBPLXCg1IMT9nKa7EWGNCXo/30sbETNkm1j96m0SFXo
         HRghsj5ypDLV9WKkwT1mfWGX6Qhq55SFGVG4OfBOrijkwbjNroQoHd1PUZfzSIGEH0rN
         +T8ywO6Kn4XBBbqJK6XOhvfW1ojkzmAXt5eGTMFb22kSpVbTFxobNZ1ASfap0Yna0kdH
         TjEdSSiUCs9QEMguRX+/CLaFSdKQuYsDG9xpt6cImoNX01Bbjmo/9uiuvo5ngAexCd0x
         KzKkPgxVXHTBZL9P29HhniFrbo9wogV55YMt+B6+dmG8wWAmWOLW8Jqbj3vpfY7mhCK2
         EqMw==
X-Forwarded-Encrypted: i=1; AJvYcCVOffi61qRO1tXbfBu0ZWcrUA6NbW2qnaBZlpGophkwmzzCEpSQXKWfs4TWBfFD89BA80nlve8UrxXAcffolMmo@lists.infradead.org
X-Gm-Message-State: AOJu0YyPQBoS3x7jFxDQVBHoA6n+jIfvdhUfU521UmmcDBku91HSiKbB
	sxh4HPMFH/0QmSEGAZv5eoFSlzWVYMmjquTxXSM1OFptiSNAxY1PUo51nZDUnMQ6qLfSM0BZG1e
	8ytEUWlrQ3klWkeEKBpDNGCixRhH7foNe/oKPzRbT
X-Gm-Gg: AY/fxX5POw6T/APtDHUx7zb976T1GfztO6JfAftj4f1GBgeUzxZ9vZsx7J+Jh6c00il
	MfsMq8iSgXteF1A1LSslri4vxIbVP5GCDh4CCw0b+UVYfR/L8Lci4nTNt64zKVt7gA11bYRd293
	ron2Bcz7uIHMlEwOlxTb7FwPD8WPD6p5hN2MYrxkSDBUtMlElKtC9O0WWQCbatHOztT4ukvDvSu
	G+M+GcLdUOglmfANjQoEzOHEuTtZ9pb2bVREYITjVt8nFfLvYW47tTiXf2lQ2Ya2tQjGogH
X-Received: by 2002:ac8:5891:0:b0:4ff:bfdd:3f46 with SMTP id
 d75a77b69052e-5011979b086mr18062621cf.15.1768224567393; Mon, 12 Jan 2026
 05:29:27 -0800 (PST)
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
 <20251223-kvm-arm64-sme-v9-14-8be3867cb883@kernel.org> <CA+EHjTw-6-BFcr60+tgDzOE-OfcetD7yQtbNMkqr7BgiMXfeJA@mail.gmail.com>
 <96efc90e-bf1f-4b87-ab7b-0e24970eb967@sirena.org.uk>
In-Reply-To: <96efc90e-bf1f-4b87-ab7b-0e24970eb967@sirena.org.uk>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 12 Jan 2026 13:28:51 +0000
X-Gm-Features: AZwV_Qhr0cnxEyY0NvApe2jyI_fTASUjPe1TmX1ATOL61XV_IRaHe4gUVPwKxys
Message-ID: <CA+EHjTxQUADWmCbSgUiFcXz_BxDPLE+THHnF6Mwx73hnhc7OJw@mail.gmail.com>
Subject: Re: [PATCH v9 14/30] KVM: arm64: Implement SME vector length configuration
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>, 
	Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_052929_173187_A7C3212B 
X-CRM114-Status: GOOD (  22.78  )
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

On Mon, 12 Jan 2026 at 13:27, Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Jan 09, 2026 at 03:59:00PM +0000, Fuad Tabba wrote:
> > On Tue, 23 Dec 2025 at 01:22, Mark Brown <broonie@kernel.org> wrote:
>
> > > +
> > > +#define vcpu_cur_sve_vl(vcpu) (vcpu_in_streaming_mode(vcpu) ? \
> > > +                              vcpu_sme_max_vl(vcpu) : vcpu_sve_max_vl(vcpu))
>
> > nit: This isn't really the current VL, but the current max VL. That
> > said, I don't think 'cur_max` is a better name. Maybe a comment or
> > something?
>
> It is the current VL for the hypervisor and what we present to
> userspace, EL1 can reduce the VL that it sees to something lower if the
> hardware supports that but as far as the hypervisor is concerned the VL
> is always whatever is configured at EL2.  We can obviously infer what
> the guest is doing internally but we never really interact with it.  The
> existing code doesn't really have a concept of current VL since with SVE
> only the hypervisor set VL is always the SVE VL, it often refers to the
> maximum VL when it means the VL the hypervisor works with.
>
> > > +       if (WARN_ON(vcpu->arch.sve_state || vcpu->arch.sme_state))
> > > +               return -EINVAL;
> > > +
>
> > Can this ever happen? kvm_arm_vcpu_vec_finalized() is checked above,
> > and vcpu->arch.{sve,sme}_state are only assigned in
> > kvm_vcpu_finalize_vec() immediately before setting the finalized flag.
>
> I don't expect it to, hence why it's a WARN_ON.

I understand. My point is, by code inspection we can demonstrate that
this isn't needed.

Cheers,
/fuad

