Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4F6CFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 11:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YBzqTyvFz5pY73g0wyFxPosxXrPbeTrE1uucBWxOS/U=; b=ArqLhz+wZ2VK+WFruDxAiFWOxk
	b6uiB5nVbI5S+3SO7AtMhELUvRocht0KfKaBTJeomJCrXi6feeDzd/xSN8HxnutsZ+PFAAMufbc52
	SHyLyxkrkp/3YE5PkW45JKH4nuOzYD9DllYlVAKS8vOUxCJyomIcMTRSE5psYeP615pmKs64LzVLP
	wjNWsF4SjB7trtOgncgklHMx8+1u0LaFq0FBY5erMLyIRKqlW+U8UTpUQvm+YWb2+EgaE4Nq2LuRV
	owTXwuweL+Hlaq2wtoUBxS4iGO6q0vnQBIiQqBbt8NiO2ATukKCB20HLbdAc0hoecIaqYwnNgRIrI
	oYUmIADw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNV4N-0000000Ba5D-3r9C;
	Mon, 24 Nov 2025 11:49:23 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNV4M-0000000Ba4X-1m8F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 11:49:23 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-640bd9039fbso6857587a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 03:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763984960; x=1764589760; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YBzqTyvFz5pY73g0wyFxPosxXrPbeTrE1uucBWxOS/U=;
        b=Yz9Cz/kaI4G5e7Q/Dliflie2ZPwYyOnISJfjqmZzMj41Oz6H91ejVhVtbKICI7zGkN
         H3N6ZvDoo/aEV0zJe9gaf6mIdv8Sgbw0G4pKkyOAm3ttNB/5MaPLyRyuOrLBJ3rDI4lw
         4k6zLX51si0rLMScMxaUig+l3kimrv6CSCFIEVIYiZxgzevYsMDD85wNmwAGvubhLGEj
         BsoXxqtDhS+xIP1IyFjxUfUx1iPb3p8CjuJU5ph9xJGxxKxpvgxpQ17NKTEeE3H1jU5d
         xu/+q4X5nFswN8ZUpk9u0w67oBAl3AYvWvu8Nh62L02sTAb5jTcXnyM23+oObeKVJpN1
         jLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763984960; x=1764589760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YBzqTyvFz5pY73g0wyFxPosxXrPbeTrE1uucBWxOS/U=;
        b=B9ZgrQkvppN0ovetc8bu67Fy3/9Pmop+H0eAjn6bIctLEKFwxD38LyR6aM7gC7+zXa
         +sNj4tNoWzCOm5lEY8dRhko5zV6NmM2kVIYQ1Wvj0lw62k1Axi34QJVmQ3SeRZTt0k4I
         lSzm4tVbEgHRUXFQ9MlLRtki//Fz6KwQ7v6O3r2GqhX0dCHPBfk7yN62Y1hNSiPo/+V+
         IaEiLye6TB5txwjTa86M+3bzHKGUDv/4hRJX3Za2OFwjNpEQN3SSakft/jVm6ohF5amw
         +mq5d4FfsLUIvoJ+iAm00M/30FuHotNnyx/0PFL9Fjnj5q1tFB9zii44M3VU3KMSONPt
         pQYg==
X-Forwarded-Encrypted: i=1; AJvYcCXvgo1UKp/pduogsji1VAOITq/bX/v+StIMq2HTjpLNtVxDDcOelVFGVAg7BBBmZY8eHFBnCdBNtIcV52JrtR/a@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6cP3cR2vxAKjzmt5s5HD/IO1p18i8MQTRD4rY3F1252NFDNz/
	Qu1NAZSTkDl33jKGPnuk4aAmvcZhUcHKWUspq8ElImqgNnEdsDH9Ms5JUx0Mw6rpZzGJ75b7xL5
	n0DX63edzlJovz/ijXlHJRXl+AV85HyxyJ4cB5vj/
X-Gm-Gg: ASbGnctfUpRvCucZbQv2ZzoXalp9GwrzavqCRfPZYQji9dw1Ozkq14B0APnQBKj4FXV
	EVG9yKIpGjd8Ipx/AfwYR3LdAh4Nc2fNw63fvmZgSwBTzEEofHo+Xb/EYOGBtNFyvMtsM5WKAZ+
	VYkX5awibdBHWP99fSzF+S9NDSS7dWyeDNjbTCjufhsCOMK3RNn0M2NvaiS90i0pxofO0M5cWGS
	ICQeTi4UiAID3l+Yi/ecWhWkcaywhDumOiY+OXUv0gp3+TFDzWTiI97+IjXV9SSuRkKWOyvkigK
	mgGu3WSudleDm+nf1QFOqw==
X-Google-Smtp-Source: AGHT+IG7FB3BP+B8s90UvG3u8TKisBLgaeNLNo0mcm7nvH+ZLDG/xBq9eIpbyEBwPDFPgxni00+/Homwohr3IjN760E=
X-Received: by 2002:a05:6402:280e:b0:643:129f:9d74 with SMTP id
 4fb4d7f45d1cf-64554320e9emr10547471a12.7.1763984959578; Mon, 24 Nov 2025
 03:49:19 -0800 (PST)
MIME-Version: 1.0
References: <20251114-pkvm_init_noffa-v1-1-87a82e87c345@google.com> <86y0nyqoy9.wl-maz@kernel.org>
In-Reply-To: <86y0nyqoy9.wl-maz@kernel.org>
From: =?UTF-8?Q?Kornel_Dul=C4=99ba?= <korneld@google.com>
Date: Mon, 24 Nov 2025 12:49:08 +0100
X-Gm-Features: AWmQ_bkhS5B96awb5hA1kiuNad2P7FKIh_5r5IcWHOnEUHiGGXtG74DFdSXbmhw
Message-ID: <CACF_fqmWwtuF_7+OJ2rUPvDJzs4ubJO6XCf6N9cW2-AABSx_NQ@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Fix error checking for FFA_VERSION
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bartlomiej Grzesik <bgrzesik@google.com>, Tomasz Nowicki <tnowicki@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_034922_480329_C356582E 
X-CRM114-Status: GOOD (  22.96  )
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

On Sat, Nov 22, 2025 at 12:36=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrot=
e:
>
> On Fri, 14 Nov 2025 11:11:53 +0000,
> "=3D?utf-8?q?Kornel_Dul=3DC4=3D99ba?=3D" <korneld@google.com> wrote:
> >
> > According to section 13.2 of the DEN0077 FF-A specification, when
> > firmware does not support the requested version, it should reply with
> > FFA_RET_NOT_SUPPORTED(-1). Table 13.6 specifies the type of the error
> > code as int32.
> > Currently, the error checking logic compares the unsigned long return
> > value it got from the SMC layer, against a "-1" literal. This fails due
> > to a type mismatch: the literal is extended to 64 bits, whereas the
> > register contains only 32 bits of ones(0x00000000ffffffff).
> > Consequently, hyp_ffa_init misinterprets the "-1" return value as an
> > invalid FF-A version. This prevents pKVM initialization on devices wher=
e
> > FF-A is not supported in firmware.
>
> Is this statement accurate? I regularly boot KVM in protected mode in
> environments that really cannot be suspected of implementing FF-A
> (there is no EL3 to start with). And yet I don't see any failure of
> the sort.
>
> Please clarify the circumstances this is triggered.

I do have EL3 enabled, but the FF-A itself is not implemented.

Without this change kvm initialization fails with the following:

[    0.946776][    T1] kvm [1]: nv: 554 coarse grained trap handlers
[    0.952880][    T1] kvm [1]: nv: 669 fine grained trap handlers
[    0.958813][    T1] kvm [1]: IPA Size Limit: 44 bits
(...)
[    1.034089][    T1] kvm [1]: Failed to init hyp memory protection
[    1.041213][    T1] kvm [1]: error initializing Hyp mode: -95

I managed to narrow this down to the FFA version check by examining
all of the places in kvm initialization logic where -EOPNOTSUPP is
returned. Since printing anything in this part of the code is somewhat
problematic I replaced =E2=80=9Creturn -EOPNOTSUPP=E2=80=9D with =E2=80=9Cr=
eturn res.s0=E2=80=9D to
examine the problematic register value:

[1.041229][    T1] kvm [1]: error initializing Hyp mode: -1

Note that the return code itself is cast to int before being printed.
Then a colleague of mine recommended looking into the arm_ffa driver.
(=E2=80=9Cdrivers/firmware/arm_ffa/driver.c=E2=80=9D) There I found that in=
 the
ffa_version_check function, the return value from the SMC call is cast
to s32 before being checked for errors.
I did the same in the kvm initialization logic, which is how this
patch was created. Furthermore I also examined the FF-A
specification(DEN0077), where the error code value type is specified
as int32.
With this change applied I can now see that kvm is up and running:

[    0.946839][    T1] kvm [1]: nv: 554 coarse grained trap handlers
[    0.952940][    T1] kvm [1]: nv: 669 fine grained trap handlers
[    0.958867][    T1] kvm [1]: IPA Size Limit: 44 bits
(...)
[    1.061717][    T1] kvm [1]: Protected hVHE mode initialized successfull=
y

The /dev/kvm file is also there.

