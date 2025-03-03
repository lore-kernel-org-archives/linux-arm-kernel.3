Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC57FC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 16:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=twx69VzhzMKVyfuR913R2hrjEeZ/X9uwz4PmTmDFGig=; b=Ss/s/6e1R3B8LsXF91v2c4nTlR
	BxMacSoyGlcS/rZGSLf7uKS3S4tspCix6pd/uHlC4mksMdpyGAYAt0BZME/e4qOzVqMQdsLPZRsv4
	ZIIsb0r9PkXQRSewpC/dYOQQUZxCfawW8sCqheMhSZtyRyIGv0hYtFTT8cn4jNirwbpttumydsz2g
	THMh50TQS4W4wF1EHe47hNhPr7lljIRwXLF/8HR8lJdI/RcFydDM+KXZYpfddLND9XRE9IT0+wClf
	S4KO5pD91EgJR5iyWtWy2u2bXQeHDq7xHkix0Jg0oBeMd7nmRY9pstz7KgG2EC9e5piGkKx9zGndx
	6jWjAUKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp8wl-00000001bSF-3AqC;
	Mon, 03 Mar 2025 16:47:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp8uB-00000001ahM-0paZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 16:44:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 891895C5A56
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Mar 2025 16:42:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 182A9C4CEE9
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Mar 2025 16:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741020274;
	bh=xihpcD+p6hJonkzJT3Ob5VMeFACGeyJ+HMFQWEbE3co=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LqGlCvl9p9p8PhByHtBGN13f43XGlifacot+vZvS3pHIT046+NGn6uP4qMc5VhxYW
	 FdDLx312La6TUDQogZoHr1zYrG9yeg8bbI4jBo0EJIO/zjFHmEMFshF4XCdbaW89QU
	 hBfhXKkuQ1OpoUWXsrNeZ55/WyijVzOT1lvWDzybN7DJIkAf+DvQbmVHhYLcWNNhOr
	 YA2q3BrMSYKWqZJM7P0pBaeYRLw5fKUOS3ZjKrZQHc6zOkuYEIIQogk2OetMH0RVDZ
	 dIdvy2Xazn2X2YddXWXl9rWCACiHN5fTIzHWQj0qcVCZbuqDhns7jUjmWwkkJd99yq
	 XrB7Qn1ZwDTvg==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-abf628d653eso282468366b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 08:44:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX/pVot6LAlkcazLtKtncAByHYpzcTeT4Sme8YdyKa+Pw+iExNHCSBzxdWr+o5A7Ul1gXXj0qPPdbLpxokdM2kj@lists.infradead.org
X-Gm-Message-State: AOJu0YzzyvEqS3K5O6hL5YgffDITpBE/eV4Czf99gFrES9aRzDymSFIQ
	N6U5GjagFxmV1e3lYWjWm/qqi8SzlCX5psvGco+fQ0SNUNRxwCpE5BIcl4CHvoZQpz1P5g2QucY
	yS+ljXkP1LM4Hnf75vxOUhxF6dA==
X-Google-Smtp-Source: AGHT+IFs3AxR8k5eF3cLqq0Jy6YcBJKsznbiFF0lDq6kRV8nU05db493Qg3NVLNrVPLfT0m9I9tnp+vPUCeMeelwMrk=
X-Received: by 2002:a17:907:da5:b0:abf:7a26:c46a with SMTP id
 a640c23a62f3a-abf7a26c5d8mr394234266b.50.1741020272581; Mon, 03 Mar 2025
 08:44:32 -0800 (PST)
MIME-Version: 1.0
References: <20250218-arm-brbe-v19-v20-0-4e9922fc2e8e@kernel.org> <174080569248.3208873.17639032755999041028.b4-ty@kernel.org>
In-Reply-To: <174080569248.3208873.17639032755999041028.b4-ty@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 3 Mar 2025 10:44:21 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLijFG1PFkqKk7hXzC=aj70OLQsXwC280QsCO=PnCVZYg@mail.gmail.com>
X-Gm-Features: AQ5f1JqS2WChjdYpf1hur2V7GzhdVdMY_80V1LgU_ZsJaDcMPJ5xdVGvREIXSNM
Message-ID: <CAL_JsqLijFG1PFkqKk7hXzC=aj70OLQsXwC280QsCO=PnCVZYg@mail.gmail.com>
Subject: Re: [PATCH v20 00/11] arm64/perf: Enable branch stack sampling
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, James Clark <james.clark@linaro.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Leo Yan <leo.yan@arm.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_084435_348890_E7EA86AE 
X-CRM114-Status: GOOD (  14.23  )
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

On Sat, Mar 1, 2025 at 1:05=E2=80=AFAM Will Deacon <will@kernel.org> wrote:
>
> On Tue, 18 Feb 2025 14:39:55 -0600, Rob Herring (Arm) wrote:
> > This series enables perf branch stack sampling support on arm64 via a
> > v9.2 arch feature called Branch Record Buffer Extension (BRBE). Details
> > on BRBE can be found in the Arm ARM[1] chapter D18.
> >
> > I've picked up this series from Anshuman. v19 and v20 versions have bee=
n
> > reworked quite a bit by Mark and myself. The bulk of those changes are
> > in patch 11.
> >
> > [...]
>
> Applied cleanups to will (for-next/perf), thanks!
>
> [01/11] perf: arm_pmuv3: Call kvm_vcpu_pmu_resync_el0() before enabling c=
ounters
>         https://git.kernel.org/will/c/04bd15c4cbc3
> [02/11] perf: arm_pmu: Don't disable counter in armpmu_add()
>         https://git.kernel.org/will/c/dcca27bc1ecc
> [03/11] perf: arm_pmuv3: Don't disable counter in armv8pmu_enable_event()
>         https://git.kernel.org/will/c/4b0567ad0be5
> [04/11] perf: arm_v7_pmu: Drop obvious comments for enabling/disabling co=
unters and interrupts
>         https://git.kernel.org/will/c/7a5387748215
> [05/11] perf: arm_v7_pmu: Don't disable counter in (armv7|krait_|scorpion=
_)pmu_enable_event()
>         https://git.kernel.org/will/c/7bf1001e0d91
> [06/11] perf: apple_m1: Don't disable counter in m1_pmu_enable_event()
>         https://git.kernel.org/will/c/c2e793da59fc
> [07/11] perf: arm_pmu: Move PMUv3-specific data
>         https://git.kernel.org/will/c/dc4d58a752ea

I don't know if you looked at the thread on patch 11 and said "long
discussion, I'll assume a new version is coming. Next!" because that's
what I would do. In this case though, there's not any changes.

Rob

