Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B82FD0E3F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 20:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oz0QfbFcBfrCj5V4z1JU4JGAn69rg5zGFkOEbcFhIzA=; b=U3lyrHnPwAjcKKhY2cOXIOBxDj
	uctgrzlrqys8DIasrPu8L9BNRLIJOAfI5ujS3ysrZIWIXOMRS/JCLZj7RVpayyKkajIbMn1BbIr0Y
	5dvBVclWl5GaeuLFkrjSVsf4/WFybXxBYtP+HRUPhAmEjIVMjNvaj6nCOxRAd6afD/+vmE9LA0cZY
	y60Ns77f5MaCAqFPAL0/AHEHEzP+zQ0DkZACjnph3LSLkd1cPFO6k4tFcLLYXuVy8+AMJAUlo4rAq
	G2WQir923Ore9J3vXcx7ypgcx6N3sxJSA2bskvt7Ang1T2sAbGyMMLoOi7kzd1i3cDas5LUmitMS8
	fP/hxplw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t44IA-00000001iA8-0S9Z;
	Thu, 24 Oct 2024 20:18:46 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t43uS-00000001ecU-330J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 19:54:18 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2fb56cb61baso10854361fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 12:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729799655; x=1730404455; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oz0QfbFcBfrCj5V4z1JU4JGAn69rg5zGFkOEbcFhIzA=;
        b=VYfj+S8Rjq0H7Ip8M3poKnRia0mvLiM6Zf5GOtTAUMjd3AKWynF+P8WQM2EYDeSijO
         vkTylfUJUQGWEenxDftTTP13+3/e7QoyWkAktFoJ0y9D1WW9UdVJbYmjT5piWRtmaO1e
         /EdpCcRWKLrLxfrrOtQqW0vqilkTXwyipD2N2DyBPb4EFNbJ2ds/8ZIuVtm2xnf1L0Dg
         RwkrOckE2OlAq1FmOvN5nXyvAc0dtGLdeSRxGU+/xpV3/5iA+s4rP6b7Qs+iTuzW7DRm
         NKo/VyU+gcPg0iyQdyGlQ2YC/GI9HA9ABBNX8vMdwRnZJCt7/d5nMSnVsRi3umC4+j+0
         hpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729799655; x=1730404455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oz0QfbFcBfrCj5V4z1JU4JGAn69rg5zGFkOEbcFhIzA=;
        b=ZXppGfuBhP8q86SEeXNyx5OIqMCJmHyZPAHvNX0nTAOBdzqbF+HgOJB9aL5WHot4sx
         vqvBlgJFyfTuAgdjJ9pCQx924WI59Zl0ZE+odQukYwo+zmoTS0QqrZ47SnDEzhF9sywb
         aLNB5NgKpz/DdodkZyY5qaEIYZMhKnQfzvcx/6cMyhuOUv7Te1BI9r4K6KxzVjUeLuLt
         J8kxXUn+DAI9s16zT1yPp6gFLFEznz7xStdB7PDNNKxVF5AkT9Z+96FrU0dEIh+/y6vC
         Y3m9nox9yzLNT/tOjY4kWCzpd+tZE6uj+GhDPKdCnTT/xIaAaSirabEJcQ4pAMS4EOdy
         eNDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWc9qx805Sd3vylmOyAE27wdI79/LJUjYzHBge6v7XFJzkVJW/dfwRWI3CStYy6CTfIGgBFlPwfonQ0EjG0EpWV@lists.infradead.org
X-Gm-Message-State: AOJu0YwWzDeFFS/MrD2wBwBWIJN7ZW0h1mkMK9gfQxwdZPBHPidJvtyt
	pCQXi06aECEZ2n2jAk/7NMYBQPP0gSYXSdj20argspF1OnLOk/rCCgsGt8PRqzM=
X-Google-Smtp-Source: AGHT+IEetrpZ1w47TpL4hhnY+i6tZmfDQ45ZKhPS6dYa8I3PZ+1oN5tmmUCGsnRy/WGozI18HYbBig==
X-Received: by 2002:a2e:be26:0:b0:2fb:4bee:47ec with SMTP id 38308e7fff4ca-2fc9d59ef88mr43668801fa.33.1729799654447;
        Thu, 24 Oct 2024 12:54:14 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb9ad60d8asm14707751fa.38.2024.10.24.12.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 12:54:13 -0700 (PDT)
Date: Thu, 24 Oct 2024 22:54:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, andersson@kernel.org, 
	konrad.dybcio@linaro.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, quic_rgottimu@quicinc.com, quic_kshivnan@quicinc.com, 
	conor+dt@kernel.org, arm-scmi@vger.kernel.org
Subject: Re: [PATCH V4 1/5] dt-bindings: firmware: Document bindings for QCOM
 SCMI Generic Extension
Message-ID: <4kovyp7655kwkznnem5e4mg2yjroc2x76vsyp6w4bm5n7tn5xy@rrz2ih2u4p2x>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <20241007061023.1978380-2-quic_sibis@quicinc.com>
 <rqa7g5hfsxozw6m4ke3jygijz5rp3lwu2fmqsebrjq6hsgb7nm@mxaiaddvuijk>
 <911483df-ee09-033d-7fae-4090bf8a3713@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <911483df-ee09-033d-7fae-4090bf8a3713@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_125416_809444_0A17B27F 
X-CRM114-Status: GOOD (  49.38  )
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

On Tue, Oct 22, 2024 at 12:43:09PM +0530, Sibi Sankar wrote:
> 
> 
> On 10/7/24 23:36, Dmitry Baryshkov wrote:
> > On Mon, Oct 07, 2024 at 11:40:19AM GMT, Sibi Sankar wrote:
> > > Document the various memory buses that can be monitored and scaled by
> > > the memory latency governor hosted by the QCOM SCMI Generic Extension
> > > Protocol v1.0.
> > > 
> > > Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> 
> Hey Dmitry,
> 
> Thanks for taking time to review the series!
> 
> > > ---
> > > 
> > > v3:
> > > * Restructure the bindings to mimic IMX [Christian]
> > > 
> > >   .../bindings/firmware/arm,scmi.yaml           |   1 +
> > >   .../bindings/firmware/qcom,scmi-memlat.yaml   | 246 ++++++++++++++++++
> > >   .../dt-bindings/firmware/qcom,scmi-memlat.h   |  22 ++
> > >   3 files changed, 269 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/firmware/qcom,scmi-memlat.yaml
> > >   create mode 100644 include/dt-bindings/firmware/qcom,scmi-memlat.h
> > > 
> > > diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > > index 54d7d11bfed4..1d405f429168 100644
> > > --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > > +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > > @@ -24,6 +24,7 @@ description: |
> > >   anyOf:
> > >     - $ref: /schemas/firmware/nxp,imx95-scmi.yaml
> > > +  - $ref: /schemas/firmware/qcom,scmi-memlat.yaml
> > >   properties:
> > >     $nodename:
> > > diff --git a/Documentation/devicetree/bindings/firmware/qcom,scmi-memlat.yaml b/Documentation/devicetree/bindings/firmware/qcom,scmi-memlat.yaml
> > > new file mode 100644
> > > index 000000000000..0e8ea6dacd6a
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/firmware/qcom,scmi-memlat.yaml
> > > @@ -0,0 +1,246 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/firmware/qcom,scmi-memlat.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Qualcomm SCMI Memory Bus nodes
> > > +
> > > +maintainers:
> > > +  - Sibi Sankar <quic_sibis@quicinc.com>
> > > +
> > > +description:
> > > +  This binding describes the various memory buses that can be monitored and scaled
> > > +  by memory latency governor running on the CPU Control Processor (SCMI controller).
> > > +
> > > +properties:
> > > +  protocol@80:
> > > +    $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
> > > +    unevaluatedProperties: false
> > > +
> > > +    properties:
> > > +      reg:
> > > +        const: 0x80
> > > +
> > > +    patternProperties:
> > > +      '^memory-[0-9]$':
> > > +        type: object
> > > +        unevaluatedProperties: false
> > > +        description:
> > > +          The list of all memory buses that can be monitored and scaled by the
> > > +          memory latency governor running on the SCMI controller.
> > > +
> > > +        properties:
> > > +          qcom,memory-type:
> > > +            $ref: /schemas/types.yaml#/definitions/uint32
> > > +            enum: [0, 1, 2]
> > > +            description: |
> > > +              Memory Bus Identifier
> > > +              0 = QCOM_MEM_TYPE_DDR
> > > +              1 = QCOM_MEM_TYPE_LLCC
> > > +              2 = QCOM_MEM_TYPE_DDR_QOS
> > 
> > I'm sorry if this has been discussed and frowned upon, but can you
> > squash memory type into device node?
> 
> I don't think anyone had any strong opinions on how the
> nodes is to be named. We went with a generic node name since
> it could accomodate multiple instances of llcc or ddr in the
> future. We didn't want it be named ddr-0/ddr-1 and so on. So
> I'll continue to stick with the current naming unless you have
> a strong reason other than readability.

As I wrote in the other email, the memory types are not equal. They have
different properties, etc. Having non-generic names allows describing
that in schema.

Last, but not least, please consider how reserved memory nodes are
handled nowadays: they have non-generic names, each one describing the
purpose / kind.

> > protocol@80 {
> > 	ddr {
> > 	};
> > 
> > 	llcc {
> > 	};
> > 
> > 	ddr-qos {
> > 	};
> > };
> > 
> > > +
> > > +          freq-table-hz:
> > > +            items:
> > > +              items:
> > > +                - description: Minimum frequency of the memory bus in Hz
> > > +                - description: Maximum frequency of the memory bus in Hz
> > 
> > Does it make sense for the DDR-QOS type? Can we hardcode those values
> > and drop freq-table-hz from the DDR-QOS node?
> > 
> > Also, can we drop this completely by adding one extra OPP entry with the
> > minimum memory bus frequency?
> 
> the map table doesn't necessarily list all the supported
> frequencies. It was made that way so that the table is flexible
> enough that it doesn't have to be changed a lot across platforms.
> Hence a need for a separate property to list min/max freq.

Please use opp-supported-hw or other similar techniques to describe
supported frequencies.

> 
> > 
> > > +
> > > +        patternProperties:
> > > +          '^monitor-[0-9]$':
> > > +            type: object
> > > +            unevaluatedProperties: false
> > > +            description:
> > > +              The list of all monitors detecting the memory latency bound workloads using
> > > +              various counters.
> > > +
> > > +            properties:
> > > +              qcom,compute-type:
> > > +                description:
> > > +                  Monitors of type compute perform bus dvfs based on a rudimentary CPU
> > > +                  frequency to memory frequency map.
> > > +                type: boolean
> > 
> > This seems to be redundant. If there is no qcom,ipm-ceil property, then
> > it's qcom,compute-type, isn't it?
> 
> ack
> 
> > 
> > > +
> > > +              qcom,ipm-ceil:
> > > +                $ref: /schemas/types.yaml#/definitions/uint32
> > > +                description:
> > > +                  Monitors having this property perform bus dvfs based on the same
> > > +                  rudimentary table but the scaling is performed only if the calculated
> > > +                  IPM (Instruction Per Misses) exceeds the given ceiling.
> > > +
> > > +              cpus:
> > > +                $ref: /schemas/types.yaml#/definitions/phandle-array
> > > +                description:
> > > +                  Should be a list of phandles to CPU nodes (as described in
> > > +                  Documentation/devicetree/bindings/arm/cpus.yaml).
> > 
> > Which CPU nodes? I see that the examples list all CPUs here. Do we
> > really need them?
> 
> This observation is only valid for X1E where all the cpus have
> identical freq charecteristics. Even with this case we need to
> list them to handle cases where cpus gets disabled by the bootloader
> on lower cored X1E parts i.e. we use this to figure out the actual
> physical mask.

This should be a part of the description.

BTW, why do you need to remove bootloader-removed cores? Can you simply
ignore non-existing CPUs instead?

> 
> > 
> > > +
> > > +              operating-points-v2: true
> > > +              opp-table:
> > > +                type: object
> > > +
> > > +            required:
> > > +              - cpus
> > > +              - operating-points-v2
> > > +
> > > +            oneOf:
> > > +              - required: [ 'qcom,compute-type' ]
> > > +              - required: [ 'qcom,ipm-ceil' ]
> > > +
> > > +        required:
> > > +          - qcom,memory-type
> > > +          - freq-table-hz
> > > +
> > > +additionalProperties: true
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/firmware/qcom,scmi-memlat.h>
> > > +
> > > +    firmware {
> > > +        scmi {
> > > +            compatible = "arm,scmi";
> > > +            mboxes = <&cpucp_mbox 0>, <&cpucp_mbox 2>;
> > > +            mbox-names = "tx", "rx";
> > > +            shmem = <&cpu_scp_lpri0>, <&cpu_scp_lpri1>;
> > > +
> > > +            #address-cells = <1>;
> > > +            #size-cells = <0>;
> > > +
> > > +            protocol@80 {
> > > +                reg = <0x80>;
> > > +
> > > +                memory-0 {
> > > +                    qcom,memory-type = <QCOM_MEM_TYPE_DDR>;
> > > +                    freq-table-hz = /bits/ 64 <200000000 4224000000>;
> > > +
> > > +                    monitor-0 {
> > 
> > Hmm. Can we say that each memory type can have at most one IPM and one
> > compute aka "passive" memlat monitor? Does it make sense to use them as
> > node names and drop the extra monitor-M names?
> 
> Again this observation is valid only for X1E where the cpu freq
> across cpu's are identical across clusters and is not true for
> other mobile SoCs. So each memory can have more than 2 monitors
> i.e. atleast one active/passibe monitor for each cluster.

Description or commit message, please.

> 
> > 
> > > +                        qcom,ipm-ceil = <20000000>;
> > > +                        cpus = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6 &CPU7
> > > +                                &CPU8 &CPU9 &CPU10 &CPU11>;
> > 
> > Are CPU lists different between monitors? Can they be different? Can
> > they be different between different memory types?
> 
> same explanation.
> 
> > 
> > > +                        operating-points-v2 = <&memory0_monitor0_opp_table>;
> > > +
> > > +                        memory0_monitor0_opp_table: opp-table {
> > 
> > sensible names are better:
> 
> I think I just picked these names up from a cpufreq table upstream.

Doesn't mean that you can't be better than that :-D

> 
> > 
> > ddr_ipm_opp_table: opp-table {
> > };
> > 

-- 
With best wishes
Dmitry

