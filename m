Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6022E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 18:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vn5PAch7XdWTWHNIRarY/0lUl5EQINJyEEFjNVV3NLk=; b=WnX61KBXPVEmGGEERMlScad7mR
	lCecTYiI19q+AZsqeGhLmSI3Kfl3eifoD+XwpqM3aEN8XPi9SeqCpbwXG7QjJKAToSfJhDkIGj+09
	mI305Y0Cst7u8CEHGPjiEV6gibPxGkGPcR1jOn1N//VptsvwEmnsk6BwUtvc4giOhosHIPHPFxt/A
	tFRosJa0IHgWohjtjCYJDjeumXYIgGiCg/vgOLZoYSnDcGKkr0ITJGX/6EFlAYszL+WWht03foYso
	qgf0Lr8JGuj/Ni3BnFTy7hoME0SJ8Ap3l0IMSb7eoYsaJpIoN1fOsvR1jPr5+Ci2TobvNtW6s6w7V
	yqh9k7Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTmL8-0000000DhRa-0wZg;
	Fri, 03 Jan 2025 18:24:06 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTmED-0000000DgAf-0bRN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 18:16:58 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3a7d7db4d89so40014575ab.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jan 2025 10:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735928216; x=1736533016; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vn5PAch7XdWTWHNIRarY/0lUl5EQINJyEEFjNVV3NLk=;
        b=eDtaqMehIu6AzDdtWSVjD8cOMbJuNCJ2DqJb4WRm0CH1mC2iuglJGhQaVntLj9JvyQ
         k+3cUyu+/x/nQYNgsGSdfOFxr9MXjnNnKGKOjSGkQ1A4R7W2eg+75vifsloSCnLROG1W
         H6kXPyqhBYdJrmKBGTn0hZ1oqixiF4FIINDkZ/dYdSutvEDQgb7r6Ij3Cxv3/PjE2GYe
         3pAkxz8+MryXo6v4Aw0NT4q68qleR4fetAtcWa2TQ7uhBVPdtD/eUfYmMt0GrU9asNa1
         1kD1CKvQ5GV6+Ao2XcZiJo/yR9GG1vQX9t2xVQOSKIagR5k+WG8iz80K6W6bezbjHs0Q
         M3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735928216; x=1736533016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vn5PAch7XdWTWHNIRarY/0lUl5EQINJyEEFjNVV3NLk=;
        b=WnwM6yczIaCOu0+fVp4J0akEdpEnzr3gro3zwL6LwxvmXDOqKrPquDQvSy1gj1CWjE
         hGJmmJAXXcHulx4mT9S+6LpBFvIpRd4BctcVnfmj+dJYWAmgTWCrynru5exvAyhWLmRq
         nT07UAjDv3rvW9IaybUgO4dLG8XnGyHrciPOIPK2BsUlBCEeJ3lODVap9lR5FxpWwCYV
         x9xFnq897av/h6sIBedIcX2zJnpcNZcpmmuBucH3lLKqqRkCmlBFO2NWP3dA/Xq3U/uO
         7wLx/G4ZkUFk+mOA21TtRjImVB9psGBIyg0zBsYExVsmumZnKudtbJb4cMCzacNn7122
         2Oaw==
X-Forwarded-Encrypted: i=1; AJvYcCXXIlVvDNutUBox5QN5krWggXboo23Y9BrNBqVOHDHqtxEihE+DLQv0J8qzM21oZ3A3RQuts6+aFWBjr2CtAC0s@lists.infradead.org
X-Gm-Message-State: AOJu0YzgtmZaP55pXzT6DLlf9fvsWXVQ8T81Zczd3vSjmxLCBKZerIgz
	Mq8e6SMbsu5haiBbsPQr6t6cYeUAhVEPUtvHm1rAVP0e0GcthRm8wBwKcIEomcLUiITVKFa16nw
	o17BZdjWeikHtRou57BHQsG2RAbA=
X-Gm-Gg: ASbGncvS/sqi+Gh6M83x9BYmMg5MovLddIUsebUVOxGEZIdVtPlHamNGvnaeD1GX+IE
	kdTEkgIAHtDushx5fHR5UHI/Jtw9qOh7MvaYQoyuDItGK0w6OHUqautYxuAgwe33uT7SJ
X-Google-Smtp-Source: AGHT+IFkvWah3qxhzEMeR0lXa3avHR/olEfCKY9qWp0cniyQbDoTluhhzT5PfOFVB94chXa1QUUdUshg5EOLFdZeUdA=
X-Received: by 2002:a05:6e02:194a:b0:3a7:7124:bd2b with SMTP id
 e9e14a558f8ab-3c2d514f8e4mr434511105ab.15.1735928215590; Fri, 03 Jan 2025
 10:16:55 -0800 (PST)
MIME-Version: 1.0
References: <20241212151402.159102-1-quic_bibekkum@quicinc.com>
 <28bd756a-e0bc-49e7-9415-4c05d38c5e28@quicinc.com> <20250103153716.GE3816@willie-the-truck>
In-Reply-To: <20250103153716.GE3816@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 3 Jan 2025 10:16:43 -0800
Message-ID: <CAF6AEGua_WfLd2PQv42NK3R1oOgJ8wNf6yt6We4tH0GFkHPnoA@mail.gmail.com>
Subject: Re: [PATCH v18 0/5] iommu/arm-smmu: introduction of ACTLR
 implementation for Qualcomm SoCs
To: Will Deacon <will@kernel.org>
Cc: Bibek Kumar Patro <quic_bibekkum@quicinc.com>, robin.murphy@arm.com, joro@8bytes.org, 
	jgg@ziepe.ca, jsnitsel@redhat.com, robh@kernel.org, 
	krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com, 
	dmitry.baryshkov@linaro.org, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_101657_179723_CA491ADF 
X-CRM114-Status: GOOD (  18.76  )
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

On Fri, Jan 3, 2025 at 7:37=E2=80=AFAM Will Deacon <will@kernel.org> wrote:
>
> (please don't top-post...)
>
> On Mon, Dec 30, 2024 at 06:45:29PM +0530, Bibek Kumar Patro wrote:
> > On 12/12/2024 8:43 PM, Bibek Kumar Patro wrote:
> > > This patch series consist of six parts and covers the following:
> > >
> > > 1. Provide option to re-enable context caching to retain prefetcher
> > >     settings during reset and runtime suspend.
> > >
> > > 2. Remove cfg inside qcom_smmu structure and replace it with single
> > >     pointer to qcom_smmu_match_data avoiding replication of multiple
> > >     members from same.
> > >
> > > 3. Add support for ACTLR PRR bit setup via adreno-smmu-priv interface=
.
> > >
> > > 4. Introduce intital set of driver changes to implement ACTLR registe=
r
> > >     for custom prefetcher settings in Qualcomm SoCs.
> > >
> > > 5. Add ACTLR data and support for qcom_smmu_500.
> > >
> > > Changes in v18 from v17_RESEND:
> > >   - 1/5 : No changes
> > >   - 2/5 : No changes - reviewed-by tags collected
> > >   - 3/5 : Addition of
> > >     pm_runtime_resume_and_get()/pm_runtime_put_autosuspend()
> > >     around register access of PRR related private interfaces
> > >     as discussed in v17_RESEND.
> > >   - 4/5, 5/5 : No changes - reviewed-by tags collected
> > >   Link to v17_RESEND:
> > >   https://lore.kernel.org/all/20241114160721.1527934-1-quic_bibekkum@=
quicinc.com/
> >
> > Thought to follow up on this thread to highlight the latest version (v1=
8) of
> > this series, in case it was missed during the vacation period.
>
>
> I'm waiting for Rob (Clark) to ack the last patch, as he had comments on
> the previous version.

You mean 3/5?  The latest (v18) lgtm, a-b

