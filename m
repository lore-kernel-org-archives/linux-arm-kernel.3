Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3159C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 09:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FXctHXJiprQ+nYxGUG/ZEb1ybwSH4GdemqONLKI8ZTU=; b=kA5dMnDVYLDGSwJsRgZ+ffiNfd
	G1ae/pLQuNxFQ6QV45hK88E9nidb5ncLHbXQ8k54OtsTFKiphqn775ZH5dI32YxxKztzise6vxTfW
	hGo7AkEJULnWbl76EwAXy3TOfB0boCh3LYsXpFaZE9QWdXDObDfTPOYSRkoun46ol80Rvktmfxjzl
	3cIcEF4syzL6ArnwP4F07BjvS7wuni6EZEKi08sSRsamtKPq0MYlwhz52dk6h0JdNA0akciPj1cjg
	OFL6FhPsY3+tnj7bweEv+xT8iArd//0osoCyzSwgcxZikpahvIfnKLisMy/w0575deP9SteVtt8a0
	RAx3ZRLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKZx-0000000EArX-23a9;
	Mon, 28 Jul 2025 09:55:33 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKXQ-0000000EAVE-02hc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 09:52:59 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7494999de5cso2832299b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 02:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753696375; x=1754301175; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FXctHXJiprQ+nYxGUG/ZEb1ybwSH4GdemqONLKI8ZTU=;
        b=WGg56wPD10aNfy60x6PWfaDCUyhaW82VjZYxhy70YEyPBTtf9mN/h15ivCJ4Zz4cCA
         kZsZZCPz5a5mbUV+NSxItmCD/6bVOIqjYZaMPmik0CzBiMJbwX4e0Q4P3MyCp8U44YTh
         XLcC8ssuDu/bPcU8axpNuZWM4Fb+3nYuE/EkW0058wudGpFv5Pkzocb2yX+R4ThNhx4P
         i4l6Gpg6nJd44JDtc00Fv1AvS/W0syh0/i5igupju9i1LJ17Z4LshIETbjMTAjZfiMAf
         vQen8Kg2W97X0WQgGlyeGwN81f3ENVDOlTkHkiIuBimcmuqfdEg8tCoLVUU3k0G/Mkeh
         s3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753696375; x=1754301175;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FXctHXJiprQ+nYxGUG/ZEb1ybwSH4GdemqONLKI8ZTU=;
        b=ACYNIzobshfmUNcpp4kRE7AvEfM6EUmwbgo6xfhBijEFBJF6Q5JzxXaUsow7PgsDNx
         NP6Wp1NzX0fBw2p7E580X75EksUpV9B4j7qeGhCStH6zKvy+AyD9vu8NppNO/TFkAAMU
         f04xZgMM72y9duotHBTN3Ql/NTe4AImAO37gX3iWqqrUOeG1X3OrqMivfGVmOEAgCrX9
         4ROyJMsBMVrgk0/bnKAayHB3WciCrIkY2WrXK71l7o/mRgBbSU1Jrf2FBKCywkxwXhYn
         Rm+tjm2+z/a1wqadAp4JB4OGYTkznZtwWwRP0dT1pEHFedGHb22IaYrFdCHJi28e0x04
         PoFA==
X-Forwarded-Encrypted: i=1; AJvYcCWw3B1tDCnBE7gFWlfVJo368/mcL1MGZkISIs1pzo+seNyLhMc/8Bdii7tbecsvByr9DTKKSFSFUUrVCiHvJsq9@lists.infradead.org
X-Gm-Message-State: AOJu0YxI5H1qAfRaIjptVjTmW+3JisEU1f9kuqILSCZbsISNdOrat6M4
	yA6Wr6gkz1oi25HGlGrr6vBQpsxs+4B6frMYYuBE624mC214Q232BlVQGBZWfVmJKXg68hAcg9v
	2uAfwMnIEtbaOwqFDL39sHE7e3XP4/PGjp1TzUC58xQ==
X-Gm-Gg: ASbGncuUoE99s20nolNbdRB8dENU1MzG49M8GUGLnvqZfUU80Yh2QdCvSlQTFGR1jW1
	B7c4v6CAK+yODawJvM+umgyzOKfnwN5bkXWBHtIrtHcv1On5hEMzUy+x3hqKugab9nxoQCleJWV
	AouURZ97abO3UoZwcyj7FMUaEdfOe1yfip0uU2KGq4HU7Fk14pHWd9b9xX5jr1kDXbN0Ziuhu6U
	J+2XRnV
X-Google-Smtp-Source: AGHT+IEgzkAE3PwKwwLXoiUp2BYY6zf+o5Yb3xVeHDX/6yVmfx6aoJxFSQ+FxTGFP4MlReYfbAv61lzV2Ktp2KRQnEY=
X-Received: by 2002:a05:6a00:22d6:b0:759:5208:59e with SMTP id
 d2e1a72fcca58-7633693f70cmr14865264b3a.7.1753696374766; Mon, 28 Jul 2025
 02:52:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250722081405.2947294-1-quic_jinlmao@quicinc.com>
 <20250722081405.2947294-2-quic_jinlmao@quicinc.com> <727fa9f4-fe25-495e-9d8d-48e504fbe6b0@arm.com>
 <20250722091425.GH3137075@e132581.arm.com> <CAJ9a7VhLLgAak_4FB=iW0izXprM4W+RsKfHUeo=XUHh9LwtUsA@mail.gmail.com>
 <20250722140659.GI3137075@e132581.arm.com> <CAJ9a7ViUoSMV_HHKKRMhcQX=isU+feJvwCaVhu-6EBK4QXJbVg@mail.gmail.com>
 <de702854-aca1-4c78-9555-f2139d5376af@quicinc.com>
In-Reply-To: <de702854-aca1-4c78-9555-f2139d5376af@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Mon, 28 Jul 2025 10:52:44 +0100
X-Gm-Features: Ac12FXyvdjPfrN4L2Hgk5dVubMk4o7GnaQ5Xk_Mfd_dD-y0plpjHVgB4QmAHYGo
Message-ID: <CAJ9a7VjTYvFVz1fp2_hNkLrKBbBYkiHHyshgsVT98V8oB_bn8g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: Add Qualcomm extended CTI
To: Jinlong Mao <quic_jinlmao@quicinc.com>
Cc: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Yingchao Deng <quic_yingdeng@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_025256_054087_F58C7C50 
X-CRM114-Status: GOOD (  32.74  )
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

On Wed, 23 Jul 2025 at 03:58, Jinlong Mao <quic_jinlmao@quicinc.com> wrote:
>
>
>
> On 7/22/2025 10:56 PM, Mike Leach wrote:
> > On Tue, 22 Jul 2025 at 15:07, Leo Yan <leo.yan@arm.com> wrote:
> >>
> >> On Tue, Jul 22, 2025 at 01:00:18PM +0100, Mike Leach wrote:
> >>
> >> [...]
> >>
> >>> For a change of this magnitude to a CS component, that the ID
> >>> registers will also have to change. This is a requirement of the
> >>> Visible Component Architecture in the CoreSight specification.
> >>> External tools cannot see the device tree.
> >>>
> >>> This is effectively no longer an ARM designed component, so the
> >>> CoreSight specification requires that the DEVARCH register change to
> >>> show qualcomm as the designer, and the architecture value change to
> >>> represent this component.
> >>> DEVID should be used to allow the driver to pick up parameters such as
> >>> number of triggers as per the existing CTI component.
> >>>
> >>> If this component is Coresight compliant then the driver can use the
> >>> ID registers to configure to the extended trigger architecture.
> >>>
> >>> With complete remapping of most of the registers, and the dropping of
> >>> claim tag compatibility - which appears to be a breach of the
> >>> CoreSight specification - it may be better to have a completely
> >>> separate driver for this component.
> >>
> >> Good point. I'd like to confirm with the Qualcomm team: apart from the
> >> differences in register offsets and claim bits, does this CTI module
> >> have exactly the same bit layout and usage as CTI standard
> >> implementation?
> >>
> >> If yes, then from a maintenance perspective, we probably don't want to
> >> have two CTI drivers with identical register settings. It seems plausible
> >> to encapsulate register access and claim logic into several functions.
> >>
> >>    void cti_reg_writel(u32 val, struct cti_drvdata *drvdata, bool relax);
> >>    u32 cti_reg_readl(struct cti_drvdata *drvdata, bool relax);
> >>    int cti_claim_device(struct cti_drvdata *drvdata);
> >>    int cti_disclaim_device(struct cti_drvdata *drvdata, bool unlocked);
> >>
> >> Thanks,
> >> Leo
> >
> > The CTI supports 128 triggers  - which means many more registers to
> > enable / connect etc.
> > I need to study the changes to determine if there are functional
> > differences too.
> >
> > It might be feasible to divide the code into a common file and a pair
> > of variants so some is reused.
> >
> > Mike
> Thanks Mike & Leo & Suzuki.
>
> There is no register to show the version ID to distinguish between ARM
> CTI and QCOM extended CTI.I will double confirm with internal HW team.
>

Can you clarify here please.
The CID0-3, PID0-7, DEVARCH and DEVTYPE registers are part of the
CoreSight specification for component identification.
Can you confirm they are present on your component and the values they have.

If they are present then the CoreSight specification requires that
they be different than the standard ARM CTI.

Regards

Mike

> For extended CTI, only trigger number changes and claim logic. Other
> functions are the same as ARM CTI(bit layout of the register and usage)
>
> Thanks
> Jinlong Mao>
>
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

