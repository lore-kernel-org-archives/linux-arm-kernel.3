Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89455C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 18:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DFiX/7Q48wo6L4d7tIX2yPIwJYCBwS0h6wyv/X0iH4c=; b=eH/zsYh2X4Pr7oaixuOjRxGSfz
	/Y8c/zLnWpX+bMHzI4KJOuWwGRSD4yPQJD2NUWBRy+Uo+zWRs+ttxRAdzD6gnCa5qS2S2t3KWAfkU
	cXyd/ii2vnGse4hvi20C8x/6or/K/gVRgP6PkbxBXtScrifuoAc6hX162LMMBuh6cpi6Qc5hmQ92y
	Pnh4jIF62FybisYxMLQhiPBYeyNa7fffumanartGU8yUDU2Cj2UDCE8VXRiMvZ9ADGxeMN+fZia10
	/+KDkZRhVC22ZVY1F94/S9IfPE333Fn1JP0Rsv03nqzN9Fuv4EBg3vUY29ByjnJ3dSd+i22lHd7kD
	WBD2WDOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsPCb-00000008b6T-0hC8;
	Fri, 07 Aug 2026 18:21:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsPCZ-00000008b5z-0kgZ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Aug 2026 18:21:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=DFiX/7Q48wo6L4d7tIX2yPIwJYCBwS0h6wyv/X0iH4c=; b=NGMVp6MCG5S1LB6PfJmHYnczct
	Tt/xp76vN0unwplG4XWl5jwNqqXoXLeikJdrHTUcoCSryOMJDM2GfWj6kw/0tlDB0sndgXR141Qvo
	GRH7gCFj//55dPYhI2dwZR9if7rbGncK7m33RSlvFm66VtXRLFfgL1P+uqBT4wasoWJWyg2q1WFya
	hV/wOZOyzr00PXcf3tmcwZFmLhZTABRqYjkJHVfRD/3qMu1ZDCmaiKJFiJ3Hl/TILeeooEdKoc7cm
	VUo8IJ5uTaNZ+bMFX2TfSm6MZie4Eddtc7CRx/xlQClRpuqw4dtXrfGYvDYV3yKnZhW/it1qqfGQC
	cWP6mNHA==;
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsPCW-0000000Caj2-0DWZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 18:21:50 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-51c10ed63c0so29421cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 11:21:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786126904; cv=none;
        d=google.com; s=arc-20260327;
        b=ET2is3WBwHGrbWreD3CbpGRWD/cyQLqUzOTwZTxs7Kor77yPbPzjQYc/huLMOX+3Kb
         AoVM9HOT9q+38ITKBmJjXOB/4Bs+rzjzVZ1avPICDCcP95JqZg8MpuIpoLc4xjUq3v44
         XW1xG0PnunPsi4M9avzOSw7P/VHXW0PFpJ+dnbi5Kr7ujsP3yMlq6stP2Y2ViMwLUup1
         YqyvidKPsxIWfXTwy5ums4ae23zqF/zwOyXu1k2Ez2hZNpJvbyVVkyhPtHSSBAVVhxwy
         ius6Qmqi78sR97aJda+PG2MXayN0J86Y3RndZdFshGHIXMTlD3Sx75A/Wh2M5WVLMnxK
         QocA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DFiX/7Q48wo6L4d7tIX2yPIwJYCBwS0h6wyv/X0iH4c=;
        fh=hT8kIQZaAgOkN8kH5DNDBYFmQLjIgN4/GMNZsPtlI8g=;
        b=l3+CFvMcbDizo/QDoUOD+/zCzlfir+N9axx2jXMPL3xIB3zcuTHICsdVRRfDtzcKjL
         uB29x9vFeJoqBYiFstdQY8ouzIyIBZTimoeQ0tuZOPEzPHUcIjiGpjaOM0K/w6AnomRl
         aQypyXk88M4ZMun89NGZNvBCfhJamNTukx3gdMkb8Rl8d+DwpOFbW1Wv9HB6f1o+u3qz
         IDt2kBC3l0Z6uqmGa5qNnBYSTe+2QsTwNdSmSV+jDaoJimAZspdd8OlaJW/AUHJSnoI7
         eoNZ4KJYRAHg3Tp+oR7qYZ4AFIgtG7ETNNAogUShXJ1xhMC31B/HAnGepUQNSnm7eoE1
         3KZQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786126904; x=1786731704; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DFiX/7Q48wo6L4d7tIX2yPIwJYCBwS0h6wyv/X0iH4c=;
        b=hZs8+M1BNYpnj5QeHXKw3rbJo8wMeoxbYfbGVmouThXlX+8JIEY3pF+vQr7b7ZNSJX
         58HS4KnYYFKSunETf/QGCCDpyX6wWIDC4PALWm4lg9+rE3CsrvHRpB4cEN9SI6os7Hwt
         Kw7+oiFecChErxrrPLB//8VCiq11tdKghPkcieLA8k3xwKmQYNvEuLLusf6OvV1hgcSc
         9OlZaMhDX0Bk0V5MsxR2g61IXc91C1k+YtLP3xm1IctapQVRqYveWDj9uiqPcUTJlzRr
         J3GrhxAa3hWyU0+ZxhlaOUgEUDd4B6dlxuesEm5nYF9KSZppcY8S4tH6Pw/tAxpE0J8z
         UgwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786126904; x=1786731704;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DFiX/7Q48wo6L4d7tIX2yPIwJYCBwS0h6wyv/X0iH4c=;
        b=V6j/th7bx4zVJG1RizeV0icpFEdqmpbsSVYJqQyGR58lI1AaNOUH3c5T85X+cOYkcX
         FZYBoxRkXt6C4uS2PqqR5yM83S2BueVLhcBIlu5Tkn/9kZsRG3uwWID4Jjtgm+2ea7FS
         UuffpBUsdk8FfE+oS/bthFFo+nYWDzSbjG1PlofJmPgcwnkOirk92Ko5mCWm+NuL4Tsc
         tWN9Qpyo+ofIwaeM1SBjbyD/c2VmLTcvSKue8Nd8T4KstNUhW3YYbpFEhdhVr0ifOM9h
         /D2lJJo0weZLWeg/X7fmdZuzVa2VJBt4JUENAVPjbccwz/Cl9kW0PglHRRm0GGDW4kBz
         g4PA==
X-Forwarded-Encrypted: i=1; AHgh+RpFc5MH0ZofziX/WzYLDrMaTVn6Mx89nVYdLOcQeapT59mz7CjSWd+FhOorhgre8sBqxEIR+2Wd3fecDxUjFJJA@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5ybSCGXBdYdZ7yPG870nvk7AMe535ly/Ucg5N0BJkXYjHDkxc
	/HQyWl2J/iY1z7RfR4Oqwyx/AqsLqWqn9cIEmOTyqevnp9Ev5+EHtBtpiFGi2F7z7wmvzvKBQuk
	bdEGXS/ubwWJB5Yjc+99RjzLNAL2FaA2VfCWkWzoX
X-Gm-Gg: AR+sD10ITMZmNLblzPKbTl5D5D83fxrJp6fzj3ufbrqlk4zoD/3KUdixmD6LVYGIU3W
	K/8ya0GeoDuM5coAkSsHWCNB9pZwtt3DGks07M4Ey5dl5hbbUCMc867MpoShgDJZdAw4NFa+afq
	C/K5Lz0WECDIHVjVLKT6K3dggrmLCxmd33SgSSVcPynJF6UHhnMqPtuyfK+t810/GbJtqmr0v8l
	rKc3vuSalGzO/r1iZuaiDqWq3o5g48BpUM2M+5z+bw7a6+4AML7Vd1cozg69roOesJLEQGpBU73
	93CFmHFu5Xi1SPtcEzE/oP6yfPS0p4nYbZ7rjqbmaw==
X-Received: by 2002:a05:622a:1b90:b0:50f:b69a:f4a8 with SMTP id
 d75a77b69052e-52d23e4c482mr1477201cf.7.1786126903631; Fri, 07 Aug 2026
 11:21:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260724-arm-smmu-v3-instcfg-override-v1-0-e7acf4a8a525@linaro.org>
 <amYIuhYenP4-qHyV@willie-the-truck> <0b7c0272-5506-4aee-82b3-76a78f2b39dc@arm.com>
 <CADrjBPqZFDvyLFpDy1YP9qrMNUCtZYtJhiaDd0iTnmB4ZYO8GQ@mail.gmail.com>
In-Reply-To: <CADrjBPqZFDvyLFpDy1YP9qrMNUCtZYtJhiaDd0iTnmB4ZYO8GQ@mail.gmail.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Fri, 7 Aug 2026 11:21:32 -0700
X-Gm-Features: AUfX_mwDnipayqqhz_vuvH-F5cw1FS42rqk5A6i8RcOd5oIHDgvQ1fDjMyBedVI
Message-ID: <CAE2F3rAHM2oTVM03ud0SQH2mjVXGU7Ns3gfc_YT4sTomNLjb_w@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add arm-smmu-v3 support for instcfg data override feature
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pranjal Shrivastava <praan@google.com>, Mostafa Saleh <smostafa@google.com>, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	willmcvicker@google.com, jyescas@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_192148_579036_8DF11297 
X-CRM114-Status: GOOD (  34.71  )
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

On Fri, Aug 7, 2026 at 8:25=E2=80=AFAM Peter Griffin <peter.griffin@linaro.=
org> wrote:
>
> Hi Will & Robin,
>
> Thank you both for your review feedback.
>
> On Mon, 27 Jul 2026 at 11:53, Robin Murphy <robin.murphy@arm.com> wrote:
> >
> > On 26/07/2026 2:16 pm, Will Deacon wrote:
> > > On Fri, Jul 24, 2026 at 01:39:41PM +0100, Peter Griffin wrote:
> > >> These two patches add support for a new "arm,instdata-override" DT p=
roperty
> > >> that enables the override of the instruction/data attribute of incom=
ing
> > >> traffic to Data by setting the INSTCFG override bits.
> > >>
> > >> It is intended to be specified when the smmu can't guarantee that th=
ese
> > >> attributes are provided correctly from the client device.
> > >
> > > This is going to need an in-tree user and a much more detailed
> > > description of what is being worked around before we consider this fo=
r
> > > inclusion.
>
> Regarding an in-tree user, I haven't sent the Device Tree (DT) patch
> yet for Laguna SoC which adds the smmu nodes and this property because
> 1) I want to land the initial SoC/board DT first
> 2) I want agreement on the DT property name. Currently I used
> "arm,instdata-override" which is what downstream used. However, since
> this is intended to work around silicon errata something like
> "google,lga-instcfg-data-override" might be more appropriate?
>
> For Laguna SoC the first in-tree user of this is the amb_smmu smmu
> instance which is used by the Synopsis dwc3 IP. The Laguna dwc3 glue
> driver is already upstream at drivers/usb/dwc3/dwc3-google.c
>
> > >
> > > In particular, if a particular client is emitting data reads as
> > > instructions, then a better work around would be to avoid mapping its
> > > domains using IOMMU_NOEXEC. But I can't tell what's going on from the
> > > limited description provided here.
> >
> > Unless it's also emitting the privileged bit and thus falling foul of
> > the implicit Unpriv-W -> Priv-XN rule, but then we also have the means
> > to deal with devices which actually do that themselves (hello pl330...)=
,
> > so that would seemingly only leave the case of some innocent piece of
> > AMBA-interfaced IP which doesn't expect to need special attributes, but
> > the system integrator has gone out of their way to tie the AxPROT bits
> > to some wacky value, which I would put in "erratum workaround" territor=
y.
> >
>
> You're correct Robin. It is an erratum workaround for the Laguna SoC
> due to some custom usage of the AxPROT bits which differs from the
> standard ARM SMMU handling for Privileged/Unprivileged and
> Instruction/Data transaction attributes. The effect is all
> transactions appear to the SMMU as "Privileged Instruction" accesses.
> The software workaround in this series enables the SMMU's INSTCFG
> override feature to ignore the incoming value and treat all SMMU
> transactions as "Data".

Due to the specific integration of the MMU-700 in this system,
AxPROT[2] is always 1 on all TBU subordinate interfaces, regardless of
whether the transaction is an instruction or data transaction.
Consequently, client devices have no control over AxPROT[2] on the
input side of SMMU. AxPROT[0] (privileged vs. unprivileged) remains
unaffected. As Robin suggested, the override is required to avoid
inadvertently triggering F_PERMISSION faults due to the VMSAv8-64
requirement that EL0-writable regions are treated as Privileged
Execute-Never (PXN)

Drivers are already avoiding IOMMU_NOEXEC. I prefer handling this via
the SMMU configuration rather than patching individual client drivers,
as this is an integration issue, not a client device issue.

