Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554FFC02185
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 19:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FDDXVu9yWbKIpPhiaAvUkWJ+c90gS7PXkQFl/32wnw4=; b=xiyQEmof18KlttiMcoE01+rgKs
	bURQPkxZ5o2BLX3sqObtNo8RTxN/6gWs5sfc+HD8g0/Qoo5kg0xSxzFGRYORadJ+xW7v/CtrHLu4G
	IRaxVSWPrw8qdR19cMJcOyiNeOOhluydQtMkNif6lRHpoiqoec5YWRxuYubpVl90JACwEaj2ulnXd
	LF+sYihkXVct8it6F6V1at9FwCh/GcYYWmiSlAaRi36BnK/N3csbqddJEDSmZ9a8G6I3j0m6LVAqF
	TihkOXMZvzV2cf1zxNa+2gecXhujKqFVW02zvgbH6+wa89b8ZK2Dz1ApTA2Rk8tcM+5e/rUUZlX2G
	cKQrNQ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmeI-00000009Y9R-1XjY;
	Tue, 14 Jan 2025 19:32:26 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlT1-00000009Nua-1wo8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 18:16:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6E901A41B27
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 18:14:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B95EC4CEEB
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 18:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736878602;
	bh=RKYfSmZK+kMBn4RgSfJDwulSLPDgEUTwy7dfVhaPYOA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=K/C5wTpfG4Rd2MWgb8z1Md/0zBuecYRLF4yjUTwNCzsEUwnYC9rfJP5HGvNKsdsQ7
	 DksaQp9opt+0DIrVX09XT+s8ubO47xlLZkLCkD/KuRE+zwQnWyGxyb+7hg50jCeVYQ
	 MeSGnhYI0UnCUJw3KsIejluh0FFTjHs2DLCw6O4dPSu5vm4Ebd5McmVPyh2Xcig58w
	 n+bUhXyND9d+xVWCKR+XpsqzHZhACxtKlTPou0UrFRcmGzPnV5pJPfotHIhxGHRKKD
	 WB1renVdw0E49qNEfSEP38+zjP0HUA1wF6xvenn95g9onngZ6NV/220m44HqWiGr3O
	 AeQ3N6RZWxzNA==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5401c52000dso5910408e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 10:16:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUY6d/DMMLEP8T8O197j8toGQmnOxlIPiF+q8sme9F+14mAveCBp1YKMXvwUBBoZYKj0DU8CWFSoVx5qDy4y/b4@lists.infradead.org
X-Gm-Message-State: AOJu0YyDEHRZwQxGjx1Tym7XfT0EhIH0jbpJ8v9nW4bRktJ+QDLNDlU+
	9sqN4BBF18KA7165vxp8IYuPRBy4F5HZA8jXkj9ldflOTDDsB2srkM1bgCiSGSA9lKs/urWZ9Da
	TjZklFU9ZY6BbfZnldbF+zEwgrw==
X-Google-Smtp-Source: AGHT+IGGOq29Ly0ZiReSsSG4zDCnevGMV01cjuVIyjShG009A/m7+eOZbOSwPYztyfDKw2UikdO/TdT9vSPsjA2CrSc=
X-Received: by 2002:a05:6512:ba5:b0:542:a73d:a39c with SMTP id
 2adb3069b0e04-542a73da516mr1491477e87.49.1736878600307; Tue, 14 Jan 2025
 10:16:40 -0800 (PST)
MIME-Version: 1.0
References: <20250107113252.260631-1-james.clark@linaro.org>
 <20250107113252.260631-5-james.clark@linaro.org> <87frloqjso.wl-maz@kernel.org>
 <760969b6-18b7-42ac-9524-2f1f845b3703@linaro.org> <86jzaywtea.wl-maz@kernel.org>
In-Reply-To: <86jzaywtea.wl-maz@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 14 Jan 2025 12:16:27 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJFgunOVqpXnj+0HQ_HYbbVrtjCTJ25KzJHhjay-0i5tQ@mail.gmail.com>
X-Gm-Features: AbW1kvYckisY3EJJj3cTSTGDYaoMGnLnDfmXedaqQOVtLizCHFObKT-9BYcwz9s
Message-ID: <CAL_JsqJFgunOVqpXnj+0HQ_HYbbVrtjCTJ25KzJHhjay-0i5tQ@mail.gmail.com>
Subject: Re: [PATCH v10 04/10] arm64/sysreg: Add a comment that the sysreg
 file should be sorted
To: Marc Zyngier <maz@kernel.org>
Cc: James Clark <james.clark@linaro.org>, Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev, 
	oliver.upton@linux.dev, suzuki.poulose@arm.com, coresight@lists.linaro.org, 
	James Clark <james.clark@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mike Leach <mike.leach@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Shiqi Liu <shiqiliu@hust.edu.cn>, 
	James Morse <james.morse@arm.com>, Fuad Tabba <tabba@google.com>, 
	Raghavendra Rao Ananta <rananta@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_101643_651298_062BCBC7 
X-CRM114-Status: GOOD (  29.21  )
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

On Mon, Jan 13, 2025 at 10:49=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrot=
e:
>
> On Mon, 13 Jan 2025 15:43:39 +0000,
> James Clark <james.clark@linaro.org> wrote:
> >
> >
> >
> > On 12/01/2025 12:49 pm, Marc Zyngier wrote:
> > > On Tue, 07 Jan 2025 11:32:41 +0000,
> > > James Clark <james.clark@linaro.org> wrote:
> > >>
> > >> From: James Clark <james.clark@arm.com>
> > >>
> > >> There are a few entries particularly at the end of the file that are=
n't
> > >> in order. To avoid confusion, add a comment that might help new entr=
ies
> > >> to be added in the right place.
> > >>
> > >> Reviewed-by: Mark Brown <broonie@kernel.org>
> > >> Signed-off-by: James Clark <james.clark@arm.com>
> > >> Signed-off-by: James Clark <james.clark@linaro.org>
> > >> ---
> > >>   arch/arm64/tools/sysreg | 2 ++
> > >>   1 file changed, 2 insertions(+)
> > >>
> > >> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> > >> index b081b54d6d22..4ba167089e2a 100644
> > >> --- a/arch/arm64/tools/sysreg
> > >> +++ b/arch/arm64/tools/sysreg
> > >> @@ -48,6 +48,8 @@
> > >>   # feature that introduces them (eg, FEAT_LS64_ACCDATA introduces e=
numeration
> > >>   # item ACCDATA) though it may be more taseful to do something else=
.
> > >>   +# Please try to keep entries in this file sorted by sysreg
> > >> encoding.
> > >> +
> > >>   Sysreg   OSDTRRX_EL1     2       0       0       0       2
> > >>   Res0     63:32
> > >>   Field    31:0    DTRRX
> > >
> > > "Do as I say, don't do as I do".
> > >
> > > I don't think this makes any sense if we don't actually sort the file
> > > the first place.
> > >
> > >     M.
> > >
> >
> > I think it's ok if it avoids review comments that new entries should
> > be sorted. Or maybe we do the opposite and the comment should say this
> > file is allowed to be unsorted...
>
> The better option would be to add the comment *and* sort the file.
> Leading by example has some value, it seems.

IME, it's better if documentation just states what the tools enforce.

Can't we add something like this to the header generation:

$ grep '^Sysreg\s' arch/arm64/tools/sysreg | sort -n -k3 -k4 -k5 -k6 -k7 -c
sort: -:22: disorder: Sysreg ID_MMFR4_EL1       3       0       0
 2       6

Rob

