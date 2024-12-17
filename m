Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99820E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 17:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LJ3/rj8MSIuFYxAR18wpWJvFAuiJssmI8OXnoxCnfwo=; b=RNzjAQMxr4wJY8eVVH5o2UbPV6
	C/pWnsCN5ylBK1KcLswjCtZwu/1wfco/+he8qVhW0rUoeDMt4QKNHlobiEdT5J7zOw2Ash+mQ/CSS
	ErsxOumlc3UaeJyJwf60ihFgkKFTdeACNcGNoaf1ZLF9bcSmX7o2mpiP8b7kqQS3fcL5YocTRE6LN
	e/ctpsUajrholmv8cLaJNbUWXyMoONWyLiqm6D5fCkZi1fZotbCg04SLmbDiHHQqRrvAPJTYZ0GOT
	8c2JcEFt7WtS2sDhl0s7HqLJWMQdYENN8DFFbTTFxXvvp1/GSLu3prHGSlU1bYv3lDr4p7aLCzc8Q
	cfjQWDeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNazc-0000000EH1N-1R49;
	Tue, 17 Dec 2024 17:04:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNayU-0000000EGlw-0zm7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 17:03:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A04255C6539
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 17:02:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A2F9C4CED7
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 17:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734454989;
	bh=y4rvd2i45ul2OIU5/nJesQGlmoS4ZWQ/I/mmlz+Q+ow=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=i3A/LYSqFumD5PYmmp1gUpj+0qB+2xkRxXi2l7E/ripxz9fZlHVcmj9lsU0HxzRn+
	 QIMV4RbqDd6Tu3z16J+OVDrfXm3Uxmh17biZLf/xWBqmE6dMMTgkuO8uIY14maKNEh
	 SezSLO9l7KNVKfJZ+bxBU+u34gVl1pwJb0vdDevX/hCV4MzgzXRLYIzT7a9LERiyvo
	 YBImUV+TW740F6GnGi1LQQqLkDEGSN2BdjOR89EhfsxhX/aOlCpYjmsFN54iRL52Rp
	 RwuVUqtXEhMrph6yYSdO7cUrB3H1BNp9VcVu9068jW3oEMa5F2eBR0DLQQtuzZPeG9
	 FWAiFeBIcdnZg==
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e3dace03a73so3517164276.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 09:03:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWku9rlYYnk1LyOkFTYldgcHF9Sem7PpIgz7V2EJUH6S1YLz2phYcysPE6+vLH6grs3nvtLD8k6U97nNsrvIABW@lists.infradead.org
X-Gm-Message-State: AOJu0YyC9xHwCnOgDzis4V+xpyEtrvY4o0gU9j1m2/5/mH8a46wMf8Yw
	Os2dx6URcXzn5SQcC5ZPU03+qVrC3yYjnRSpWbxAfbVS2fBL8q8o0fSfbvn2owXE44z/XWHkmU7
	NzZvm1ewGQCmXNU6z2nDg1VhO/g==
X-Google-Smtp-Source: AGHT+IGKvG8I/im/k/IPybn045bPPxXVEzIGxeaZoFQYWf7CnT275gjzpCkuXW1FxOqOUlHA0uA3p6+cPeXvMyJJp6Q=
X-Received: by 2002:a05:6902:2681:b0:e4b:b2bd:5fa0 with SMTP id
 3f1490d57ef6-e53606627d2mr320097276.20.1734454988345; Tue, 17 Dec 2024
 09:03:08 -0800 (PST)
MIME-Version: 1.0
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
 <20241210055311.780688-19-anshuman.khandual@arm.com> <20241216231505.GA601635-robh@kernel.org>
 <a442bca4-d1c0-4f3e-ae13-4836caec2da9@sirena.org.uk>
In-Reply-To: <a442bca4-d1c0-4f3e-ae13-4836caec2da9@sirena.org.uk>
From: Rob Herring <robh@kernel.org>
Date: Tue, 17 Dec 2024 11:02:57 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+45YNGNEcDVFvKH3Tiwtz0HF9_O4tPfQH0dbXra2bcRQ@mail.gmail.com>
Message-ID: <CAL_Jsq+45YNGNEcDVFvKH3Tiwtz0HF9_O4tPfQH0dbXra2bcRQ@mail.gmail.com>
Subject: Re: [PATCH V2 18/46] arm64/sysreg: Add register fields for PMUACR_EL1
To: Mark Brown <broonie@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, maz@kernel.org, 
	ryan.roberts@arm.com, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_090310_316769_33F7DC23 
X-CRM114-Status: GOOD (  13.30  )
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

On Tue, Dec 17, 2024 at 9:30=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Mon, Dec 16, 2024 at 05:15:05PM -0600, Rob Herring wrote:
> > On Tue, Dec 10, 2024 at 11:22:43AM +0530, Anshuman Khandual wrote:
>
> > > +Sysreg     PMUACR_EL1      3       0       9       14      4
>
> > I already added this and various other PMUv3.9 registers you've added
> > here in v6.12 and v6.13. So are you on an old base or the tool allows
> > multiple definitions? If the latter, that should be fixed.
>
> The tool is written in awk and hence *really* dumb so it's not going to
> notice this, and so long as the resulting definitions are identical the
> compiler won't either.  It would indeed be nice if the tooling were able
> to detect this.

Something like this should work:

git grep -h '^Sysreg\s' arch/arm64/tools/sysreg | tr -s ' \t' ' ' |
sort | uniq -c | sort -n | grep -E '^\s+([2-9]|1[0-9])'

No duplicates currently.

Rob

