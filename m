Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD6BCE8E6E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 12:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=49BR+Vn1lZ2yPsVgGV8fM4Apw3a0jqYsx9R52cWC0gk=; b=NwXXxyehOJajpl/ZBv28+LixYR
	lUFSk4Xo4zA/6+SwHOwX6R1ZLtsitukVBII7b4Y6toNPYWdoDbdAuyltXi/h58HbdfBtxLl0I69lp
	Jwx1GAxcRR3JSTVWR0NAAbecVbeXMdONdodzqNGVON1U+0U014ZOgBYTxvyROejnz+AsiHgrO/DT/
	jvF9gg7Ai8EPIk+BxOFAs7p747wT8XOZSr5Khfi2AxOCJpXBU7YNece+eONE0cP8pGSr7R70ifcr/
	2vr2Ma4IyhGR7oBlbnt3Nv0oPE/JuZQZVDglnKWnyCb6IhUFBSA7cyEpFnek/ROvTXKMQLSTVL4zh
	UBJ2OjaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3xFF-00000000Oa0-3oCv;
	Thu, 24 Oct 2024 12:47:17 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3xDh-00000000OHC-0SNe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 12:45:42 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-20cdb889222so6883075ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 05:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729773939; x=1730378739; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=49BR+Vn1lZ2yPsVgGV8fM4Apw3a0jqYsx9R52cWC0gk=;
        b=sluOVdE2n1UTkW8OWGtPKdJ2KD99NlBv4XTI+UDH2di02o837I32nt9fiTEqYDTxUK
         3c/oMynY0DE6BF2H6eQuoMzG6MNpK0CRGj/9qGXmgxx7aRH+b7dn7L7ZVtOhEwtBFZFQ
         aFVZoFvsiX5P/oHc7WPIkcORk2DWVXU66tW2Mtzzi3Fzt/NLzYmWYuMak1Bq4bFvgh0D
         nM+7j79chVrZoYWJOHK7gWi/pUjDdbO932RV1fglo0h3JpZiGc77blPK+QQs5GK5Ka4z
         Coz2oR9Znin1d8DybXpMtnli0bpXNPTHttjmh8TfKg8IkZhdllo54GEm2SgLRxb0kVrW
         D46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729773939; x=1730378739;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=49BR+Vn1lZ2yPsVgGV8fM4Apw3a0jqYsx9R52cWC0gk=;
        b=lj+DgXAYEHk64LIOCF+i84m03fnO+7T4xyyFrCboqWfIKu5XjvqWlYs2mq93N/DLQ9
         h+eS4DCPci36jdhRbgG7LajfgQmdr4mKIRoxjEKxphv/sJi3P9SM9sSnWBA/YxJI2r6o
         K9+bJT1PLpn4hs2mqvEc5ve1KAKHN3eoH2UBytOVMFadMDPr3QkASWY8FrUL2QLR3UZ2
         1DyyLB16gfpbqD3t/7+Lm56lTsIPoC4w+2rGF6GsF1aUj/97pgUfnZseO32TYhfTo+yy
         BsJq0D3LK8hY7ebabBHN3vtN/n45qetsQNsK/KMM8wJ0JtlywcbqavHSDG8FPp6XRHtx
         abtg==
X-Forwarded-Encrypted: i=1; AJvYcCWSzZK5xrBpDGnwS+Phy2n7RdIQmRP5O4PbvyT1Dza9qJLGlDV7Euel3XjEdPhcCmPY+fHwiEupFKoY2TrbCpIq@lists.infradead.org
X-Gm-Message-State: AOJu0YyM26DvQV/h09o0As2sHk/GG4OWooUMT2zFvA/7wGcEQIIOEw4C
	TQ4LjCS4/GwOR50DJCoUwaEuOgmh8VN2PLZKRE2kZraPBrRKGgCa8eTSL+II+9XriuEf9EmO83z
	7hhFRbDAyVMdbpkHOdd83LiPtlJY2tKhXMHicYw==
X-Google-Smtp-Source: AGHT+IFe+ta9STpkqwpAT33j7DGORkD4TFwOCBP77UQdvEM+lYJD0OgUJfn7cMV48jXyjJnegQj3vqocsAlLcFZQyuE=
X-Received: by 2002:a05:6a20:d805:b0:1d9:2018:9e24 with SMTP id
 adf61e73a8af0-1d978aead30mr7286554637.10.1729773939355; Thu, 24 Oct 2024
 05:45:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240703122340.26864-1-quic_jinlmao@quicinc.com>
 <CAJ9a7VhwD6kFHPTgrfs+7fNx4nXZPqXTLK0ObmJM3A6mQfmuyQ@mail.gmail.com> <5dcce78a-d7e5-4a61-a165-05b9efe11052@quicinc.com>
In-Reply-To: <5dcce78a-d7e5-4a61-a165-05b9efe11052@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 24 Oct 2024 13:45:27 +0100
Message-ID: <CAJ9a7Vi5q-ren_PSCHLLvD3qd=WMONi2RNuZ6xc9=4Uv+UdQ-g@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] coresight: core: Add device name support
To: Jinlong Mao <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Tingwei Zhang <quic_tingweiz@quicinc.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
	Tao Zhang <quic_taozha@quicinc.com>, songchai <quic_songchai@quicinc.com>, 
	Jie Gan <quic_jiegan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_054541_177184_27AE1A28 
X-CRM114-Status: GOOD (  29.29  )
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

Hi Jinlong

I was suggesting using the label property - see p44, table 4.3 of the
devicetree specification.

e.g.

node_name@node_address {
        label = "text description of this device instance";
}

Then use the normal of_xxxx functions to extract the string value from "label".

Regards

Mike

On Fri, 18 Oct 2024 at 09:42, Jinlong Mao <quic_jinlmao@quicinc.com> wrote:
>
>
>
> On 2024/7/31 23:15, Mike Leach wrote:
> > Hi,
> >
> > 1) As per Krzysztof comment - use the standard "label" property
> >
> > 2) Do not use the label string as the node name - there is no
> > guarantee of uniqueness which will cause issues. Please add the label
> > as a sysfs file to the standard node.
> > This uses the existing standard names, allowing any scripting based on
> > this to continue to work, and will not cause issues with uniqueness
> >
> > e.g.
> > This will allow :
> >
> > cat cti_cpu0/label
> >
> > to extract the additional hardware context information that you need.
> >
> > Thanks
> >
> > Mike
>
> Hi Mike,
>
> I tried to get the label in the driver code. But I don't find any
> function for it. Do you know the function to get the label of the device
> tree node ?
>
> label: node_name@node_address
>
> Thanks
> Jinlong Mao
>
> >
> >
> > On Wed, 3 Jul 2024 at 13:24, Mao Jinlong <quic_jinlmao@quicinc.com> wrote:
> >>
> >> With current design, the name of the non-cpu bounded coresight
> >> component is the device type with the number. And with 'ls' command
> >> we can get the register address of the component. But from these
> >> information, we can't know what the HW or system the component belongs
> >> to. Add device-name in DT to support it.
> >>
> >> cti_sys0 -> ../../../devices/platform/soc@0/138f0000.cti/cti_sys0
> >> cti_sys1 -> ../../../devices/platform/soc@0/13900000.cti/cti_sys1
> >> tpdm0 -> ../../../devices/platform/soc@0/10b0d000.tpdm/tpdm0
> >> tpdm1 -> ../../../devices/platform/soc@0/10c28000.tpdm/tpdm1
> >> tpdm2 -> ../../../devices/platform/soc@0/10c29000.tpdm/tpdm2
> >>
> >> Change since V3:
> >> 1. Change device-name to arm,cs-dev-name.
> >> 2. Add arm,cs-dev-name to only CTI and sources' dt-binding.
> >>
> >> Change since V2:
> >> 1. Fix the error in coresight core.
> >> drivers/hwtracing/coresight/coresight-core.c:1775:7: error: assigning to 'char *' from 'const char *' discards qualifiers
> >>
> >> 2. Fix the warning when run dtbinding check.
> >> Documentation/devicetree/bindings/arm/arm,coresight-cpu-debug.yaml: device-name: missing type definition
> >>
> >> Change since V1:
> >> 1. Change coresight-name to device name.
> >> 2. Add the device-name in coresight dt bindings.
> >>
> >>
> >> Mao Jinlong (2):
> >>    coresight: core: Add device name support
> >>    dt-bindings: arm: Add device-name in the coresight components
> >>
> >>   .../bindings/arm/arm,coresight-catu.yaml      |  6 +++
> >>   .../bindings/arm/arm,coresight-cpu-debug.yaml |  6 +++
> >>   .../bindings/arm/arm,coresight-cti.yaml       |  6 +++
> >>   .../arm/arm,coresight-dummy-sink.yaml         |  6 +++
> >>   .../arm/arm,coresight-dummy-source.yaml       |  6 +++
> >>   .../arm/arm,coresight-dynamic-funnel.yaml     |  6 +++
> >>   .../arm/arm,coresight-dynamic-replicator.yaml |  6 +++
> >>   .../bindings/arm/arm,coresight-etb10.yaml     |  6 +++
> >>   .../bindings/arm/arm,coresight-etm.yaml       |  6 +++
> >>   .../arm/arm,coresight-static-funnel.yaml      |  6 +++
> >>   .../arm/arm,coresight-static-replicator.yaml  |  6 +++
> >>   .../bindings/arm/arm,coresight-stm.yaml       |  6 +++
> >>   .../bindings/arm/arm,coresight-tmc.yaml       |  6 +++
> >>   .../bindings/arm/arm,coresight-tpiu.yaml      |  6 +++
> >>   .../bindings/arm/qcom,coresight-tpda.yaml     |  6 +++
> >>   .../bindings/arm/qcom,coresight-tpdm.yaml     |  6 +++
> >>   drivers/hwtracing/coresight/coresight-core.c  | 37 ++++++++++---------
> >>   .../hwtracing/coresight/coresight-platform.c  | 31 ++++++++++++++++
> >>   include/linux/coresight.h                     |  3 +-
> >>   19 files changed, 149 insertions(+), 18 deletions(-)
> >>
> >> Mao Jinlong (2):
> >>    dt-bindings: arm: Add device-name in the coresight components
> >>    coresight: core: Add device name support
> >>
> >>   .../bindings/arm/arm,coresight-cti.yaml       |  6 +++
> >>   .../arm/arm,coresight-dummy-source.yaml       |  6 +++
> >>   .../bindings/arm/arm,coresight-stm.yaml       |  6 +++
> >>   .../bindings/arm/qcom,coresight-tpdm.yaml     |  6 +++
> >>   drivers/hwtracing/coresight/coresight-core.c  | 37 ++++++++++---------
> >>   .../hwtracing/coresight/coresight-platform.c  | 30 +++++++++++++++
> >>   include/linux/coresight.h                     |  3 +-
> >>   7 files changed, 76 insertions(+), 18 deletions(-)
> >>
> >> --
> >> 2.41.0
> >>
> >
> >
> > --
> > Mike Leach
> > Principal Engineer, ARM Ltd.
> > Manchester Design Centre. UK
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

