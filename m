Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 953E8C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 09:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9LozWTu8KuZwTBoDAKofTRfh40nSpSm6qy1uB6jmrPY=; b=TqlOqFquDt0qlYSmnd0dGtz9ct
	r9vPXD+sklU55uBYc6o2jfaRwAdFb7jbPNjjIPA0fDdUEHe+7AT5mVGYinIE3/1nO/9MKfEZfIemf
	M5DgAvEASwyyIVTKCua6FYqugdz01HD3Z7JSK/F5yTjfNw7f0wD81lN+kJo+YURK63x4QKCgpI0tm
	asSQR5S58d5sK4VK+qwPOpdckuaztxW+6lBG4OwXsO8jISbP+EM4TKWuGPg3qkGMJ0pNqTDUoCg0U
	Zk+UTjTxa8wiPonGkW3odK5E8eUOmAl8NNJG42eYs0fK7VqCxGWS/lgwA6T28Vp2UJn/hR6z/47yS
	cA/Q6CYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqU2D-0000000DiNs-0EK0;
	Fri, 07 Mar 2025 09:30:25 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqU0Z-0000000Di5u-0DnC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 09:28:44 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2239f8646f6so30087515ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 01:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741339722; x=1741944522; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9LozWTu8KuZwTBoDAKofTRfh40nSpSm6qy1uB6jmrPY=;
        b=W+BVxEyCA3WHDjp6c6/5Tl5Ks/XNh6oVon8+AF9PeYopGG+xEEXkG8iDO4TdrM/BKj
         QcFqd91hhfvvOTWxrdJY0Ate9GZDbY4WfzVi950nFPPJkFLKeUnswMheigJs5bMjzbmI
         uM3U2KMcTIFeAfWKPRg+h9CceQwgWpEPfAVm2I7RaaaPLYJxkSZLuTpkVplms9Ru/Dgn
         rcrWCV7obF/245cPu6e1BlyZX8UyaRJJbHl/kPHJJ4TxeoIcFnuAjd1xFJBn4VcMNzXE
         JSOyiLHXmC0PjzACPEAoLNB8Bt/RQnKqYgaS/n2vmdb+2lSjMtvOoljHibM38Cxuy0TD
         vrzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741339722; x=1741944522;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9LozWTu8KuZwTBoDAKofTRfh40nSpSm6qy1uB6jmrPY=;
        b=YkrSh4bnq0LCVo8vJLBjXIqxIyrucLzW4FFNpUskkMvOr/AUCleqLvxok0xb9yOQsE
         C+vKfaV1dupaJmlpoN47v58i4EE3ld9WAwn+J3jkuWsoj4ooo2eCC6M++pHn6k03k9Z5
         OkC96gMz+n5hm/2odDteBMJfZmaPNEuZ6NJXBCD76f4DxeBiG47E/TljDKWpWqOQO9Jr
         IyZvNMKDmzhmu6oNNTbDBMOyKd7rVF+PRO/+GaAXC7//E7gq4nKZBDreEoKbl3Wx71UC
         goWlZ5WddVulToBW3h/ZU8iGLtNDCRy6Lf+lQIWHHZeKx2pmE1auexoYiMSY263J0x3L
         bT3Q==
X-Forwarded-Encrypted: i=1; AJvYcCW6oeHKykAfmcij833rjlMHW2W/M7PbFFbIDt6cbOi+ftKES6a+cXyRolXOiJI/1VpajjhRD3+3gzfxE7WznsQV@lists.infradead.org
X-Gm-Message-State: AOJu0YxlQVPM9AhJFtu4KA2lxb7Pu0BmP75ltboe3lC9f49Jjxo6RbNJ
	+4RHDerllkg5gtA+yYFFv4eMwSavfRWJSI8szq9KHfKx1tn9Ch/GMz4Tp6ZIxMkmUUchXtuk79S
	1o9Qha9ktFL3A1ufo4C0ORWlTTAPoobVYCgK6nQ==
X-Gm-Gg: ASbGncveShsAbnUmW4Lk3ibqwG89b2PFE+NiSrjzHrAmkjDPDSEEgIlXRCmbtDSD8lo
	IaSKkDSllMcTQHOfXY1N0FbzQLtXlE6DoJ94hsex+bJrwcdMYPr0I9txcw2OQkjyHrianUAoAWd
	UZoTSqmWeY84rSJfNSv0YT3kpoRTA=
X-Google-Smtp-Source: AGHT+IEHRyep+CWHS6MMha8nUs8GPhmkNXh4lCyvkD09UFdn8zd5EhwUXs2EBs8mRJAWZqt2jvGg4lY4AfpwLNMYolA=
X-Received: by 2002:a05:6a00:4f90:b0:736:4a5b:7f08 with SMTP id
 d2e1a72fcca58-736aaae86d4mr3932036b3a.22.1741339721658; Fri, 07 Mar 2025
 01:28:41 -0800 (PST)
MIME-Version: 1.0
References: <20250227092640.2666894-1-quic_songchai@quicinc.com>
 <20250227092640.2666894-2-quic_songchai@quicinc.com> <20250304-certain-aboriginal-magpie-cade86@krzk-bin>
In-Reply-To: <20250304-certain-aboriginal-magpie-cade86@krzk-bin>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 7 Mar 2025 09:28:29 +0000
X-Gm-Features: AQ5f1JoxSZ1K86_Hd1c_UCyRuSfkTy9x4ZTGUItIE7TwPlDH-oNja8NI8CjlxzU
Message-ID: <CAJ9a7VjOU2d0tGjvbMBWwWtjKp38hj_NptVYFHDy9Zrs-sdOeg@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: arm: Add support for Coresight TGU trace
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: songchai <quic_songchai@quicinc.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	James Clark <james.clark@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_012843_105877_3CE1B500 
X-CRM114-Status: GOOD (  45.50  )
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

On Tue, 4 Mar 2025 at 08:05, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Thu, Feb 27, 2025 at 05:26:34PM +0800, songchai wrote:
> > From: Songwei Chai <quic_songchai@quicinc.com>
> >
> > The Trigger Generation Unit (TGU) is designed to detect patterns or
> > sequences within a specific region of the System on Chip (SoC). Once
> > configured and activated, it monitors sense inputs and can detect a
> > pre-programmed state or sequence across clock cycles, subsequently
> > producing a trigger.
> >
> >    TGU configuration space
> >         offset table
> >  x-------------------------x
> >  |                         |
> >  |                         |
> >  |                         |                           Step configuration
> >  |                         |                             space layout
> >  |   coresight management  |                           x-------------x
> >  |        registers        |                     |---> |             |
> >  |                         |                     |     |  reserve    |
> >  |                         |                     |     |             |
> >  |-------------------------|                     |     |-------------|
> >  |                         |                     |     | priority[3] |
> >  |         step[7]         |<--                  |     |-------------|
> >  |-------------------------|   |                 |     | priority[2] |
> >  |                         |   |                 |     |-------------|
> >  |           ...           |   |Steps region     |     | priority[1] |
> >  |                         |   |                 |     |-------------|
> >  |-------------------------|   |                 |     | priority[0] |
> >  |                         |<--                  |     |-------------|
> >  |         step[0]         |-------------------->      |             |
> >  |-------------------------|                           |  condition  |
> >  |                         |                           |             |
> >  |     control and status  |                           x-------------x
> >  |           space         |                           |             |
> >  x-------------------------x                           |Timer/Counter|
> >                                                        |             |
> >                                                      x-------------x
> > TGU Configuration in Hardware
> >
> > The TGU provides a step region for user configuration, similar
> > to a flow chart. Each step region consists of three register clusters:
> >
> > 1.Priority Region: Sets the required signals with priority.
> > 2.Condition Region: Defines specific requirements (e.g., signal A
> > reaches three times) and the subsequent action once the requirement is
> > met.
> > 3.Timer/Counter (Optional): Provides timing or counting functionality.
> >
> > Add a new coresight-tgu.yaml file to describe the bindings required to
> > define the TGU in the device trees.
> >
> > Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
> > Signed-off-by: songchai <quic_songchai@quicinc.com>
>
> Don't duplicate yourself.
>
> Anyway, this is marked as v3, I cannot find previous versions, no
> changelog, no references.
>
> What happened here in this binding?
>
> > ---
> >  .../bindings/arm/qcom,coresight-tgu.yaml      | 135 ++++++++++++++++++
> >  1 file changed, 135 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml
> > new file mode 100644
> > index 000000000000..a41ac68a4fe7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml
> > @@ -0,0 +1,135 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +# Copyright (c) 2023-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>
> 2023 and 2024? Where was it published in these years?
>
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/arm/qcom,coresight-tgu.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Trigger Generation Unit - TGU
> > +
> > +description: |
> > +  The Trigger Generation Unit (TGU) is a Data Engine which can be utilized
> > +  to sense a plurality of signals and create a trigger into the CTI or
> > +  generate interrupts to processors. The TGU is like the trigger circuit
> > +  of a Logic Analyzer. The corresponding trigger logic can be realized by
> > +  configuring the conditions for each step after sensing the signal.
> > +  Once setup and enabled, it will observe sense inputs and based upon
> > +  the activity of those inputs, even over clock cycles, may detect a
> > +  preprogrammed state/sequence and then produce a trigger or interrupt.
> > +
> > +  The primary use case of the TGU is to detect patterns or sequences on a
> > +  given set of signals within some region of the SoC.
> > +
> > +maintainers:
> > +  - Mao Jinlong <quic_jinlmao@quicinc.com>
> > +  - Sam Chai <quic_songchai@quicinc.com>
> > +
> > +# Need a custom select here or 'arm,primecell' will match on lots of nodes
> > +select:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> > +          - qcom,coresight-tgu
> > +  required:
> > +    - compatible
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: qcom,coresight-tgu
> > +      - const: arm,primecell
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    items:
> > +      - const: apb_pclk
> > +
> > +  qcom,tgu-steps:
> > +    description:
> > +      The trigger logic is realized by configuring each step after sensing
> > +      the signal. The parameter here is used to describe the maximum of steps
> > +      that could be configured in the current TGU.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 1
> > +    maximum: 8
> > +

Hardware features are usually defined by ID registers in coresight
devices. e.g. ETM has a number of ID registers that describe the
number of comparators / counters etc.
Does this device not have similar registers? Is there not a unique ID
for each hardware variant - hardware discoverablility is an
architecture requirement for coresight devices?

> > +  qcom,tgu-regs:
> > +    description:
> > +      There are some "groups" register clusters in each step, which are used to
> > +      configure the signal that we want to detect. Meanwhile, each group has its
> > +      own priority, and the priority increases with number of groups. For example,
> > +      group3 has a higher priority than group2, the signal configured in group3
> > +      will be sensed more preferentially than the signal which is configured in group2.
> > +      The parameter here is used to describe the signal number that each group
> > +      could be configured.
>
> And all groups are indexed by number? Or do they have names?
>
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 1
> > +    maximum: 18
> > +
> > +  qcom,tgu-conditions:
> > +    description:
> > +      A condition sets a specific requirement for a step and defines the subsequent
> > +      action once the requirement is met. For example, in step two, if signal A is
> > +      detected three times, the process jumps back to step one. The parameter describes
> > +      the register number for each functionality, whether it is setting a specific
> > +      requirement or defining a subsequent action.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 1
> > +    maximum: 4
> > +
> > +  qcom,tgu-timer-counters:
> > +    description:
> > +      TGU has timer and counter which are used to set some requirement on each step.
>
> Wrap according to Linux coding style, so at 80.
>
> > +      For example, we could use counter to create a trigger into CTI once TGU senses
> > +      the target signal three times.This parameter is used to describe the number of
> > +      Timers/Counters in TGU.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
>
> Drop
>
> > +    maximum: 2
> > +
> > +  in-ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      port:
> > +        description: AXI Slave connected to another Coresight component
>
> So this TGU can be connected to anything in coresight graph, no
> restrictions?
>


Coresight uses APB for register access and ATB for moving trace from
source to sink. The only use of AXI is on the ETR/CATU output saving
trace data into system memory.

> > +        $ref: /schemas/graph.yaml#/properties/port
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
>
> Most likely you miss also: in-ports
>
>
> Best regards,
> Krzysztof
>

Regards

Mike

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

