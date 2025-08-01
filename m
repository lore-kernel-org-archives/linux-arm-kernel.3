Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203E8C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 09:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aOzsaXGRbHTCJm/fkLtI1bRP1MDJ9mJ9tPK5q2Dho2g=; b=BwffA9lT3FDdQrrUfJ+VUzRv4J
	5XrsyDKv8TIKXRn44rk0jUmkk3q5AyHCY6/ys9YgjIhnnZW4uxUPhvjj3neUDa+lBYldNCRq7jAkh
	Z8hAScIJ9gBnrdZa/9xXp37xO1q2r0RRxo3ow4ju7dW5B1pTwZ6Q8ZQ0KxGAf4GxuWjFRd3eE4oss
	8D/Jib392hdSTEle2eRLn3cfL9BNtIx69h6ojZOqxdg/A9EO3GoBljGWcPuf5a101iPMxg/fRsVps
	FM0o2VJDieFk7hiMcL+O4i2xjbuEfRwNhYOTYIqhltEvMHGg2+EvXMtUt7jNPcMGQ+EKDbwYIVMh4
	qSUaROAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhm5o-00000005N4F-41bA;
	Fri, 01 Aug 2025 09:30:24 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhm3D-00000005McG-3GXq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 09:27:44 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7682560a2f2so1949487b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Aug 2025 02:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754040463; x=1754645263; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aOzsaXGRbHTCJm/fkLtI1bRP1MDJ9mJ9tPK5q2Dho2g=;
        b=BYxv83gqhYKQaqaepSSqpnlCoI9QUQ3esTuO9wJ5XstzgUgDvi2wdFdevx6wIoG+vf
         65/xyT1PJDwPnj/oz7WCOkJ+I870eY1YGXlN5+toMu8l0nAxW5v4N33S20i0Ect+23Nk
         T8dYEbH+UwSAhf3GtXAirZflUuvXdn5YXTUZbOw6+02+VQhEy16hArd8fTAGghkVq2Jp
         YbAuq7R+QNGvnrovAuIdECK8h0FcJtahVmz/RGOn5Phcmej+S3D/PxkoUKVIp9Kso9Qg
         3fGsDssN5Xy7s6Ito6Mjqg97PRH/jfG5cj+VzD+DJ8amyR/E48aYryKA4HU7bADBjE6c
         2TcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754040463; x=1754645263;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aOzsaXGRbHTCJm/fkLtI1bRP1MDJ9mJ9tPK5q2Dho2g=;
        b=Js9MUJOPev9DPUu0VfqltbZihPlbY6iWmMe5BQ4lFKLGbXiHzisd0BI4568tc4P6c+
         VQXwoN/wnreETtsoxWf8ALSPMqwG4MgaT2S6L3Ms5tr3DTDTyMvlWMgBpO9P5DjNcd46
         43lLU8yqotdJFWOS1Dz9DnMsEhBe87V30nYRMFrsL7LyMuJK3Pj7vzkM1G0VFK5CXkWx
         9uD7omT0SzttCEQFI2+VT1upYJC5NIlPgeQBIIFkMd2wosxjzlFOyRQjTbimYdSav6I8
         lqkq/nEgq3RBlNMEi4MPwPlYPhVmfKcj62RiEFvclLXJl4RJCBoGwSYQ1MFgSQ+AO7XU
         CSVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAdFRhVXEf4eyaFvRQD54AUOOkgMlxTVoer29UaNK+YaKJNpjSpstuHjaAG+BZyildK8r3czo1rIGjLTHYaZ+k@lists.infradead.org
X-Gm-Message-State: AOJu0YywlkAj0NiJuMi8w2ohH8ElfMAmukCaNSORcqD+9H9fZKf1xnmj
	5NJePPHqNv3Ck7JUZ71EvS12D5DqMKoJwhp8+IuohAsvWwtvT+lJ8pVsWIjjyPncdA0Nuj/mcBA
	SSxUswM8g5sm3RqeH/MEy1FyyaaEz0BozWF5EzaS96A==
X-Gm-Gg: ASbGnctJBBKvh/2ZgezVnj0XaGu+g4X/wLk06NyJ/dFolQyLhpNeYSTsfG5TpYAN1ie
	q1b6M6yXAOk9zprjRmNOcy/m85bK8TAHu252EJDXhhclRDRxc4f8MRnKfhDFwoN96BTVsxnXXVV
	FOW0CvSbincupxcKGWafrMbU6EN0h9wp6yBTdDFKuv+QcuV/6b3A9PXPr59SGpnTM0EfaegBhF4
	R1ejA==
X-Google-Smtp-Source: AGHT+IHuKlUReo8BLBfNLWmArweL00LOxZR7uhUg6oyeIixMBD+kBAo6QhwVGBOeWx6hpJc7ym91L6wo5ave853cAD4=
X-Received: by 2002:a05:6a00:2485:b0:74a:d2a3:80dd with SMTP id
 d2e1a72fcca58-76bccff259dmr6577824b3a.3.1754040462719; Fri, 01 Aug 2025
 02:27:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250722081405.2947294-1-quic_jinlmao@quicinc.com>
 <20250722081405.2947294-2-quic_jinlmao@quicinc.com> <727fa9f4-fe25-495e-9d8d-48e504fbe6b0@arm.com>
 <20250722091425.GH3137075@e132581.arm.com> <CAJ9a7VhLLgAak_4FB=iW0izXprM4W+RsKfHUeo=XUHh9LwtUsA@mail.gmail.com>
 <20250722140659.GI3137075@e132581.arm.com> <CAJ9a7ViUoSMV_HHKKRMhcQX=isU+feJvwCaVhu-6EBK4QXJbVg@mail.gmail.com>
 <de702854-aca1-4c78-9555-f2139d5376af@quicinc.com> <CAJ9a7VjTYvFVz1fp2_hNkLrKBbBYkiHHyshgsVT98V8oB_bn8g@mail.gmail.com>
 <8d6a4c97-51a3-423f-9095-74347283d71b@quicinc.com>
In-Reply-To: <8d6a4c97-51a3-423f-9095-74347283d71b@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 1 Aug 2025 10:27:30 +0100
X-Gm-Features: Ac12FXxb0p9qM-DmIoa1tkbL88-z9uRmiixPI8Eab6j9wjkCgT_azXgWX96JPwI
Message-ID: <CAJ9a7VjYw5ExWV6DZBTTEWwmLmuhN0LZOFTiZq0xHekdAa41AA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250801_022743_830461_50E245EB 
X-CRM114-Status: GOOD (  36.41  )
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

On Thu, 31 Jul 2025 at 07:40, Jinlong Mao <quic_jinlmao@quicinc.com> wrote:
>
>
>
> On 7/28/2025 5:52 PM, Mike Leach wrote:
> > Hi,
> >
> > On Wed, 23 Jul 2025 at 03:58, Jinlong Mao <quic_jinlmao@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 7/22/2025 10:56 PM, Mike Leach wrote:
> >>> On Tue, 22 Jul 2025 at 15:07, Leo Yan <leo.yan@arm.com> wrote:
> >>>>
> >>>> On Tue, Jul 22, 2025 at 01:00:18PM +0100, Mike Leach wrote:
> >>>>
> >>>> [...]
> >>>>
> >>>>> For a change of this magnitude to a CS component, that the ID
> >>>>> registers will also have to change. This is a requirement of the
> >>>>> Visible Component Architecture in the CoreSight specification.
> >>>>> External tools cannot see the device tree.
> >>>>>
> >>>>> This is effectively no longer an ARM designed component, so the
> >>>>> CoreSight specification requires that the DEVARCH register change to
> >>>>> show qualcomm as the designer, and the architecture value change to
> >>>>> represent this component.
> >>>>> DEVID should be used to allow the driver to pick up parameters such as
> >>>>> number of triggers as per the existing CTI component.
> >>>>>
> >>>>> If this component is Coresight compliant then the driver can use the
> >>>>> ID registers to configure to the extended trigger architecture.
> >>>>>
> >>>>> With complete remapping of most of the registers, and the dropping of
> >>>>> claim tag compatibility - which appears to be a breach of the
> >>>>> CoreSight specification - it may be better to have a completely
> >>>>> separate driver for this component.
> >>>>
> >>>> Good point. I'd like to confirm with the Qualcomm team: apart from the
> >>>> differences in register offsets and claim bits, does this CTI module
> >>>> have exactly the same bit layout and usage as CTI standard
> >>>> implementation?
> >>>>
> >>>> If yes, then from a maintenance perspective, we probably don't want to
> >>>> have two CTI drivers with identical register settings. It seems plausible
> >>>> to encapsulate register access and claim logic into several functions.
> >>>>
> >>>>     void cti_reg_writel(u32 val, struct cti_drvdata *drvdata, bool relax);
> >>>>     u32 cti_reg_readl(struct cti_drvdata *drvdata, bool relax);
> >>>>     int cti_claim_device(struct cti_drvdata *drvdata);
> >>>>     int cti_disclaim_device(struct cti_drvdata *drvdata, bool unlocked);
> >>>>
> >>>> Thanks,
> >>>> Leo
> >>>
> >>> The CTI supports 128 triggers  - which means many more registers to
> >>> enable / connect etc.
> >>> I need to study the changes to determine if there are functional
> >>> differences too.
> >>>
> >>> It might be feasible to divide the code into a common file and a pair
> >>> of variants so some is reused.
> >>>
> >>> Mike
> >> Thanks Mike & Leo & Suzuki.
> >>
> >> There is no register to show the version ID to distinguish between ARM
> >> CTI and QCOM extended CTI.I will double confirm with internal HW team.
> >>
> >
> > Can you clarify here please.
> > The CID0-3, PID0-7, DEVARCH and DEVTYPE registers are part of the
> > CoreSight specification for component identification.
> > Can you confirm they are present on your component and the values they have.
> >
> > If they are present then the CoreSight specification requires that
> > they be different than the standard ARM CTI.
> >
> > Regards
> >
> > Mike
>
> Hi Mike,
>
> These registers are present. I checked they are same as standard ARM
> CTI. Like CIDR1(0xFF4), both are 0x90.
>
> Thanks
> Jinlong Mao
>

This is not permitted under the CoreSight specification as the
register mappings are different to the standard ARM CTI. Any tools
(external debug tools, userspace scripts etc.) that use the CoreSight
ID registers to identify components will fail to work on your device.

Regards

Mike

> >
> >> For extended CTI, only trigger number changes and claim logic. Other
> >> functions are the same as ARM CTI(bit layout of the register and usage)
> >>
> >> Thanks
> >> Jinlong Mao>
> >>
> >>
> >
> >
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

