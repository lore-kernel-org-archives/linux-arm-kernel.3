Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 674B4C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 15:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7h3OZgOFOWka6Sh7FDs0lzIp/bOpR21bNansrj8i0UI=; b=V4vfvObPgYPAtGuB8LZ99GelD/
	gal4fL+sFEapFJp/MpKpPhJsgl5CHHNG3S33WM50WNzfyRuFEET97QYdMJPJ6ge0dnbl0eSyIO2uY
	gvn1EQDgdfTujNeKGM+B0CN+8qzVOQxuPMXf+rPO6MJEKCg4GOlCIAg5yRC4NFQ2xBI1m0uF29Isp
	CkhOj1lQwaoYtbZVNMvsFPcD1/5w4ba2/BxrwPbefFsO71f+c2m4CytLJqhSxqXqfQGcCNbN9cDwG
	RmtsrbeWNWo+5XNtqpsD8PZ/01o0lJbqnyru/TxNC06MSFL9YGD1Uat9m1/IDyLsUwctFYpQOI5Nv
	Bv0Z3b5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFO5-00000002w6d-3jN9;
	Tue, 22 Jul 2025 15:58:41 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueEPr-00000002n1e-1Ngo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 14:56:28 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-313910f392dso4528382a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 07:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753196186; x=1753800986; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7h3OZgOFOWka6Sh7FDs0lzIp/bOpR21bNansrj8i0UI=;
        b=LBt4iqdPv71S20rkYKAGtcF42/J3tnbj/6Om3/7T3vtwdI+DPNHsoGJzkdI9cO1aXb
         llI+8LgLPhpDOobpSOdiirDj1fzAGM6/LkNHCZUw4/qlnsaOPIgRu6uAZwPiQhKf4beT
         wgFyQB7Le8m8f7N711dCec6iZfEw1cXcn3RYi0EHkCZOSHtpefKIqN4csMR+A+JszpKI
         JSX85L+iGXnYP/0bE/AtkG3y+ikGMHJKY/IHVZ8Z9nXYGLTMAmsVgDP7OGnS2x8kaSan
         BpSXJjS6kloqTvX9NntZF3VnyKUoFfQtDZdaLh9cFPkhcCE0M97JzsZSmyw5d34mD1l9
         vCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753196186; x=1753800986;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7h3OZgOFOWka6Sh7FDs0lzIp/bOpR21bNansrj8i0UI=;
        b=Q30K2qdI6mOCa8OxoqqdnU1r5fdPH/QqXQcqJe7xKA2f7y/8dCqiMkpbwSlqVNnEiL
         hK/qpmrdluFiZiA5kLNlMyfcLcPckz/3OO5XYLGBfaFF6Gn4qD7n6VgPXmyrDOL8Evem
         q+mjV1DLIqJow7ofcQCYxOHY3V3o/9DdOhypIIWeAHSJQ4YOGTciUn8fmZRksdSGgSuI
         ndpsLARIHsUPzNMwCIYIxljlQqTONcL8VLUgaiiMFLgt77R6D3ZLI12BSb/fhT2mGD4f
         PdQyxCFUZlzda1crNicsPP3F3paNzOO/Sb9PvMdJgZkX8AIHM7lhW0LBv1BZ1mBDxPop
         yD6g==
X-Forwarded-Encrypted: i=1; AJvYcCXb9aVcGODIr0VoSuzsRTdfClpvYz+khfqTi9dQvfDFoXXUT18i5DL5aWWnt3JHEPUc11ksf8TkAqngQqyJ6tfN@lists.infradead.org
X-Gm-Message-State: AOJu0Yxg+N7eV5zTe/B5PyLRw1oXkiH4pOVUVaNZre6YGOCu7oGh2YRp
	/lVnIGpyL0O97b5IWxBWH0Xuis2ACpsenIBOHaIEZSJcSbbLdh47yNavkwyWyqpMi/chWxTfw6Q
	EoMSkMpEOQfNF9hm9y+rbhkvT2r0T7StK1W3k90p5yrZtWyx8oW5u
X-Gm-Gg: ASbGncv61y3Qsej+6fX62B/NxB7mokN94/9BjxFPWgSZKLgoZBtGRtazOHVNBN1Ug8V
	6ZQCgt8MA2n2Nbe7K2Q/N3QFTmTtsKPShENdXnABSoHYuFPDlEIhVQ6QMy/60t+5BWji8fKnmal
	vQ8mfIQpGJKmeRGDH+Fm+69hwk9n27DHpF8jboI6EvynDwbvCUGztHg0QD9LhYqPtSwUzg1MF/q
	Vps0voX0DVLIASqDog=
X-Google-Smtp-Source: AGHT+IEtP/5IDxeEhazTc4DWcg8EKlmHm0Tqj8Htda07oJVKsZ40WoeXfhlC2Cn75AZLmjlrFZm0wdgsuvPCCu8Lrro=
X-Received: by 2002:a17:90b:1cc5:b0:312:e731:5a6b with SMTP id
 98e67ed59e1d1-31c9f4dfc33mr29080180a91.32.1753196186503; Tue, 22 Jul 2025
 07:56:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250722081405.2947294-1-quic_jinlmao@quicinc.com>
 <20250722081405.2947294-2-quic_jinlmao@quicinc.com> <727fa9f4-fe25-495e-9d8d-48e504fbe6b0@arm.com>
 <20250722091425.GH3137075@e132581.arm.com> <CAJ9a7VhLLgAak_4FB=iW0izXprM4W+RsKfHUeo=XUHh9LwtUsA@mail.gmail.com>
 <20250722140659.GI3137075@e132581.arm.com>
In-Reply-To: <20250722140659.GI3137075@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 22 Jul 2025 15:56:15 +0100
X-Gm-Features: Ac12FXws7BfWiZMqb7msBA7EUd24M1rUoi_ExDpG7uyl5EzW-3UU03wnPpGedF8
Message-ID: <CAJ9a7ViUoSMV_HHKKRMhcQX=isU+feJvwCaVhu-6EBK4QXJbVg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: Add Qualcomm extended CTI
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mao Jinlong <quic_jinlmao@quicinc.com>, 
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Yingchao Deng <quic_yingdeng@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_075627_380137_6261E102 
X-CRM114-Status: GOOD (  28.63  )
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

On Tue, 22 Jul 2025 at 15:07, Leo Yan <leo.yan@arm.com> wrote:
>
> On Tue, Jul 22, 2025 at 01:00:18PM +0100, Mike Leach wrote:
>
> [...]
>
> > For a change of this magnitude to a CS component, that the ID
> > registers will also have to change. This is a requirement of the
> > Visible Component Architecture in the CoreSight specification.
> > External tools cannot see the device tree.
> >
> > This is effectively no longer an ARM designed component, so the
> > CoreSight specification requires that the DEVARCH register change to
> > show qualcomm as the designer, and the architecture value change to
> > represent this component.
> > DEVID should be used to allow the driver to pick up parameters such as
> > number of triggers as per the existing CTI component.
> >
> > If this component is Coresight compliant then the driver can use the
> > ID registers to configure to the extended trigger architecture.
> >
> > With complete remapping of most of the registers, and the dropping of
> > claim tag compatibility - which appears to be a breach of the
> > CoreSight specification - it may be better to have a completely
> > separate driver for this component.
>
> Good point. I'd like to confirm with the Qualcomm team: apart from the
> differences in register offsets and claim bits, does this CTI module
> have exactly the same bit layout and usage as CTI standard
> implementation?
>
> If yes, then from a maintenance perspective, we probably don't want to
> have two CTI drivers with identical register settings. It seems plausible
> to encapsulate register access and claim logic into several functions.
>
>   void cti_reg_writel(u32 val, struct cti_drvdata *drvdata, bool relax);
>   u32 cti_reg_readl(struct cti_drvdata *drvdata, bool relax);
>   int cti_claim_device(struct cti_drvdata *drvdata);
>   int cti_disclaim_device(struct cti_drvdata *drvdata, bool unlocked);
>
> Thanks,
> Leo

The CTI supports 128 triggers  - which means many more registers to
enable / connect etc.
I need to study the changes to determine if there are functional
differences too.

It might be feasible to divide the code into a common file and a pair
of variants so some is reused.

Mike

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

