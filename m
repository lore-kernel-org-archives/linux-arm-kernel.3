Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E5FE77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 08:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4NciFRRoGn6D2XlVHSYt3WE5Tr/WBuHB/hCa+auTFK8=; b=JLao1YAZSYWv38f648rTClhtUm
	UhrCPSumcVmQMBrwtDKGpwbUUvt6iolbPySexXdbMUuX5cwy30GEb6wQ3yWHWibLLDxsdMBYS2Jfz
	lhNoJ7kaDp61GBlrrVSpV9ckynOOXkedF0SblyVfTiC8arLzJ404SA2S4FSi4/Ps3AtbL4hphMnf5
	j/aIhhZYh4UdwNJM1m1VdcL4k76G7YS6P8zUaWx/AbFGls2pMrYL78aFmyEy6zWH2jWqe9zFOY7VB
	7T/ELmtXHeAJ/K7pKdSnrbBg02bK26Ms6miAObvyzZVi7qSOdaVAtP3mGNFbMpJtMCtRjXYCdZSSW
	0ah5Esqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYvJ-00000006roS-0CfB;
	Mon, 09 Dec 2024 08:15:21 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYsU-00000006rHb-3RV8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 08:12:27 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-434fa6bf6e4so22435e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 00:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733731945; x=1734336745; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4NciFRRoGn6D2XlVHSYt3WE5Tr/WBuHB/hCa+auTFK8=;
        b=RO4xda9eDgup6Xr9veqqG2dK78AfbBzfGC0/2yJcmdyhjaM/GQeIhBkiWCk0n230QG
         ywORj9AnYwIeQPv3G+EIkegL7H6Jth0WrYson/EEoKsW4nzH7COJtEujG0CwF+ni5rk/
         936Gm/S8FsYTLby+5NITgL/ijbvPVL65kwgaPGUz52Qjzqxa1f12Kp8mYBoGZdAC7a68
         PptIOlo/ZJGKjGu6sOGuGthsIGupR8nNzJDaq5FWwafHU/S9opUmnpEScfiJnnMJpxbd
         VXzmQWRTY0nKGu3ErD+HM7qW2nQHwVkmvaErgohuNLlZP27VQF8yKgdRmRXH+gDJIT0+
         D+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733731945; x=1734336745;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4NciFRRoGn6D2XlVHSYt3WE5Tr/WBuHB/hCa+auTFK8=;
        b=o3UHbxtcg0AiZFfCQkEd6yNUjquoGUBVQkjedJG6CX2aekUTP0wr1/JTJc50mS+W4K
         1GuoNRU+ce7oZi8U4xeSSbhUyNEeWxg3qgxaBknZc4sFrbEMVFmVfjudmibxjVE1ieT4
         IocymcsL3bC/45KupMXF8o9ghuSf66QgIGVw3yRH/kYW6PNupGoaHRe+z32F+EsXAb2C
         T1n/qw7WT7uD/u8/LvrLy3awerEMQa5OEtJszCRl9shoLMuonnAqZecm6Go+C3FdC5vR
         bw7CO+ZWygnVQ1D34RYRNiUnZ9s37FI49EJ36H7gK9IG6aMnNTSb5lCv4chpivbzvvHI
         XDUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVixdPQiXbT+BFPiaWa3s0SX+2Pi6k1zmvd8MlPRg1jesFDjBWLkHSxY1Zm0QjF57L4fgToyjRXml+f0H9ZnPDw@lists.infradead.org
X-Gm-Message-State: AOJu0YwkxniZdJ0I0JWm9bFm1pOr6lzBuGKVXF9FCvFHAHkZW7VwITs0
	XR8Wh8SWU1H/uF8MEJETU9XDESQ6o4+diAEsDljhVewTM4IjAUL3K2bUINLLExmFGp8Gr9tRz2Q
	qGlI/QFswaJ2XjS5l3PvVVaLaY2qQbXdUB3Zx
X-Gm-Gg: ASbGncslxRoYLNDhAMF8zKjb8EOeN4pJh8RuMV9UZLKYnBTn45BCyo3Ljn7xIMIAcVo
	7UxOB9tNxadAuNMCs1FzJv0kn1B2C9w==
X-Google-Smtp-Source: AGHT+IFdVhh7qM5pFXOICqgM0O7MUeIFhVrQjqgHLd5tsYdNifpK22oNMUZtWMNgXZXQSPq85vrS0iUacvhsHRyHJcw=
X-Received: by 2002:a05:600c:2246:b0:431:416b:9ecf with SMTP id
 5b1f17b1804b1-434e83ab555mr2569925e9.6.1733731944790; Mon, 09 Dec 2024
 00:12:24 -0800 (PST)
MIME-Version: 1.0
References: <20241202154742.3611749-1-tabba@google.com> <20241202154742.3611749-7-tabba@google.com>
 <Z1M1DYbvuqAEU5c-@google.com> <70992791-af72-43ed-88cc-1bb5a8acaf9a@sirena.org.uk>
 <868qssu0wf.wl-maz@kernel.org>
In-Reply-To: <868qssu0wf.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 9 Dec 2024 08:11:48 +0000
Message-ID: <CA+EHjTwc8VWVtU+2GArE8a8TwoZsqmaBNYuLyjqn8JpszxXqjA@mail.gmail.com>
Subject: Re: [PATCH v4 06/14] KVM: arm64: Set protected VM traps based on its
 view of feature registers
To: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Quentin Perret <qperret@google.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev, 
	james.clark@linaro.org, will@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	kristina.martsenko@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_001226_862750_9660157A 
X-CRM114-Status: GOOD (  19.15  )
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

Hi,

On Fri, 6 Dec 2024 at 18:22, Marc Zyngier <maz@kernel.org> wrote:
>
> On Fri, 06 Dec 2024 17:43:42 +0000,
> Mark Brown <broonie@kernel.org> wrote:
> >
> > On Fri, Dec 06, 2024 at 05:31:57PM +0000, Quentin Perret wrote:
> > > On Monday 02 Dec 2024 at 15:47:33 (+0000), Fuad Tabba wrote:
> >
> > > > - if (FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_RAS), id_aa64pfr0) <
> > > > -     ID_AA64PFR0_EL1_RAS_V1P1) {
> > > > + if (!kvm_has_feat(kvm, ID_AA64PFR0_EL1, RAS, IMP)) {
> >
> > > I'm admittedly getting a bit lost in the kvm_has_feat() macro maze, but
> > > should this be:
> >
> > >     if (!kvm_has_feat(kvm, ID_AA64PFR0_EL1, RAS, V1P1))
> >
> > > to replicate the existing check?
> >
> > kvm_has_feat() checks for a value <= the supplied constant while the
>
> Not quite:
>
> #define kvm_has_feat(kvm, id, fld, limit)                               \
>         kvm_cmp_feat(kvm, id, fld, >=, limit)
>
> > existing check is just < and the values for the field are:
> >
> > UnsignedEnum  31:28   RAS
> >       0b0000  NI
> >       0b0001  IMP
> >       0b0010  V1P1
> > EndEnum
> >
> > so they're both checking for the same thing.
>
> Evidently not. The original code is checking for RASv1p1, while the
> change turns that into a check for the original RAS spec.

Marc is right. This change was intentional, since the goal is to trap
if RAS isn't implemented/supported by the guest. I should comment on
this change in the commit message.

Thanks,
/fuad


>         M.
>
> --
> Without deviation from the norm, progress is not possible.

