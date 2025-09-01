Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0493BCA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 09:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cPLbjAvQn0E2rMIx0xgjNyYjUFJLwi35g9A0s0bGBYk=; b=LmNMHBHM4fpVM0arvW7Coeeln1
	WkX922BPy/M/+drgKQTj4BAOfIMfhHe+WybQOrB0v78rQkdcZlXfzakWeETaDqyDOKAEXx/oVdlrV
	KRq9BgkrdmRW0OjZfEN5qsT/n0jYp8ZEVDeIO7YN6dp0oOKyaGCpIZnBmRqbvO/raFnsTSSAARuo0
	ZYDv/NyyqNWHUqSUlnXYcghaNNeiCBpP6IAdmdHQxn4Of/oAyoYoiDnpV1GPqglfyLu6SBzKDjYSS
	Gy+KHbnWGPToLCqu+b5FgbKfbKBzOrISpT4qWem3bglWv1Lb94RhzpNZJP3xcSV7Tj1SCrf310CJu
	KDHQx/jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut0bm-0000000BiE6-0nrV;
	Mon, 01 Sep 2025 09:13:50 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut0Cx-0000000BdGP-3BBU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 08:48:13 +0000
Received: by mail-ed1-x541.google.com with SMTP id 4fb4d7f45d1cf-61caf8fc422so7271380a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 01:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756716490; x=1757321290; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cPLbjAvQn0E2rMIx0xgjNyYjUFJLwi35g9A0s0bGBYk=;
        b=B6jZ5SfN2YbsMZ0txjadNHMxYz1i5nio+MZVg7oFC/DY8G9IudSiVWE95G1gejWI23
         f5hzRLxfUWUqT0EajaOevcfV8ixhuO9cXABqgfuxYWO3U+E7oHcjooWVi4+lQmwBBdnJ
         AQNZvVNtcNLY4glhY4rZOGT0mI4Pq46KSXVBoOw1Idjb2rOp+2iPDVbA0wW6ckTZ6B0e
         6UB9GvAkJWOdc4SLvs4tAJ0KfC8HM2qKc00Tlpi/hYvr+kqqLAy9WvaN515yigFZcA3r
         +HA9bVyQiGqFC5Hw/+f3eqZ7OS3hnzfegCMEddo+7+7jv/p0+y70qyU96j0//+1FpJFC
         atpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756716490; x=1757321290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPLbjAvQn0E2rMIx0xgjNyYjUFJLwi35g9A0s0bGBYk=;
        b=kp35x0iIedW88gwws1LvU8TrsV7s22R8ZxTHv2mBv1Jmkypl5F05zvs5E01qjCt6jU
         epS7lFzKjeHGecY0HjNxJFziuENlaIRLasYUwMpR13pJKzG36jjilsPToH35aU1CNTTr
         i0Dm6BKwAsW2z8evGRjC/ChiF9K8LTsXqTrwVoBym6O9GX9BymcJ7IENoa4aLxQZsSCG
         OKj0sDkiL4VScF89eoS+Luzx04WiZ8t6odbcRQz2GhCokTtHkoaqs49JieihObsG1r2n
         xMXkNNSOZOda6ES7V6GoGG5O2zsq8Ip1TbKyCJGjOsqhHjhRMhaTtpqqc5p9ZJyDWkMo
         Qnxg==
X-Forwarded-Encrypted: i=1; AJvYcCUXKEW0VrVFn6FPczyRD7jz7vmWJ9iiucWH7P0ZUtPHKbA0Fk61eoWvNFYQf2vAz+D7TcRz3EtVlK7TeEpgqUPJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo5Cam9mEwDtBeY/04vcGznQKEOR72R8bq7UJxOWX2Bti952aJ
	k6AimemnfLzZ7kkdlNPKd3F5w4BxU8VElZ7kHHebz6lMpJyXF8GAxvBQfIbO6jL/19c=
X-Gm-Gg: ASbGncsm1GShGYX4wG8hWsRmFvapTp0uS430nd6QHCCpY+WJnROobGUTkR2UqNLws4x
	fjALr8Pgn09o+ClBEhy2YTOdoaKeNUMxOOqBwRONJ1M5Lc11DPSYTzivKFgCQ/HvMxkA68R40iJ
	7k4PxkumAiKXQWNAUXJqcfAxcXvwUgPktPQRTNPxdknw9ec16MNDblFMKUErlEoVIqASBiNf0zw
	4hm2wWrIhAcheynBFXIBFVGNwFcs2phPlTRNDJ2CuikMxM3FFPkVRdT2Ms0nQQHhJNEGBnDyMfh
	CloFjzIfz13fz16gW2yfTdkv3Plv6MITJpxjB/DXBdpNVJ0ti2jPe4avktOo6ZQlbr8tzcu6TYf
	hwpgSc3ZXo8UkP3ZyKXAU7Y++4GhHFDeL4JjLgDup4iU7RFR+oFUp+DVd7M04meF9tpiqqlTGlo
	aj3WL4MhWc4ZMxqYXtNtRIV7SfOzM=
X-Google-Smtp-Source: AGHT+IEQBUXzLByR1LDYkZW1JXKHq8+bGwyDWqHROpCdMH+jh7ytpsNxmNwRf7WbZfZJa0YLFDJJBA==
X-Received: by 2002:a17:906:7d9:b0:b04:1b84:923c with SMTP id a640c23a62f3a-b041b85025emr362763666b.51.1756716490047;
        Mon, 01 Sep 2025 01:48:10 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b04189de5b5sm345647166b.10.2025.09.01.01.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 01:48:09 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 1 Sep 2025 10:50:05 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>, kwilczynski@kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, iivanov@suse.de, svarbanov@suse.de,
	mbrugger@suse.com, Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] dt-bindings: pci: brcmstb: Add rp1-nexus node to fix DTC
 warning
Message-ID: <aLVePQRfU4IB1zK8@apocalypse>
References: <20250812085037.13517-1-andrea.porta@suse.com>
 <4fee3870-f9d5-48e3-a5be-6df581d3e296@kernel.org>
 <aKc5nMT1xXpY03ip@apocalypse>
 <e7875f70-2b79-48e0-a63b-caf6f1fd287b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7875f70-2b79-48e0-a63b-caf6f1fd287b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_014811_800547_74AFB3F8 
X-CRM114-Status: GOOD (  37.97  )
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

Hi Krzysztof,

On 08:50 Fri 22 Aug     , Krzysztof Kozlowski wrote:
> On 21/08/2025 17:22, Andrea della Porta wrote:
> > Hi Krzysztof,
> > 
> > On 10:55 Tue 12 Aug     , Krzysztof Kozlowski wrote:
> >> On 12/08/2025 10:50, Andrea della Porta wrote:
> >>> The devicetree compiler is complaining as follows:
> >>>
> >>> arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi:3.11-14.3: Warning (unit_address_vs_reg): /axi/pcie@1000120000/rp1_nexus: node has a reg or ranges property, but no unit name
> >>> /home/andrea/linux-torvalds/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: pcie@1000120000: Unevaluated properties are not allowed ('rp1_nexus' was unexpected)
> >>
> >> Please trim the paths.
> > 
> > Ack.
> > 
> >>
> >>>
> >>> Add the optional node that fix this to the DT binding.
> >>>
> >>> Reported-by: kernel test robot <lkp@intel.com>
> >>> Closes: https://lore.kernel.org/oe-kbuild-all/202506041952.baJDYBT4-lkp@intel.com/
> >>> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> >>> ---
> >>>  Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml | 9 +++++++++
> >>>  1 file changed, 9 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
> >>> index 812ef5957cfc..7d8ba920b652 100644
> >>> --- a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
> >>> +++ b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
> >>> @@ -126,6 +126,15 @@ required:
> >>>  allOf:
> >>>    - $ref: /schemas/pci/pci-host-bridge.yaml#
> >>>    - $ref: /schemas/interrupt-controller/msi-controller.yaml#
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          contains:
> >>> +            const: brcm,bcm2712-pcie
> >>> +    then:
> >>> +      properties:
> >>> +        rp1_nexus:
> >>
> >> No, you cannot document post-factum... This does not follow DTS coding
> >> style.
> > 
> > I think I didn't catch what you mean here: would that mean that
> > we cannot resolve that warning since we cannot add anything to the
> > binding?
> 
> I meant, you cannot use a warning from the code you recently introduced
> as a reason to use incorrect style.
> 
> Fixing warning is of course fine and correct, but for the code recently
> introduced and which bypassed ABI review it is basically like new review
> of new ABI.
> 
> This needs standard review practice, so you need to document WHY you
> need such node. Warning is not the reason here why you are doing. If
> this was part of original patchset, like it should have been, you would
> not use some imaginary warning as reason, right?
> 
> So provide reason why you need here this dedicated child, what is that
> child representing.

Ack.

> 
> Otherwise I can suggest: drop the child and DTSO, this also solves the
> warning...

This would not fix the issue: it's the non overlay that needs the specific
node. But I got the point, and we have a solution for that (see below).

> 
> > 
> > Regarding rp1_nexus, you're right I guess it should be
> > rp1-nexus as per DTS coding style.
> > 
> >>
> >> Also:
> >>
> >> Node names should be generic. See also an explanation and list of
> >> examples (not exhaustive) in DT specification:
> >> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> > 
> > In this case it could be difficult: we need to search for a DT node
> 
> Search like in driver? That's wrong, you should be searching by compatible.

Thanks for the hint. Searching by compatble is the solution.

> 
> > starting from the DT root and using generic names like pci@0,0 or
> > dev@0,0 could possibly led to conflicts with other peripherals.
> > That's why I chose a specific name.
> 
> Dunno, depends what can be there, but you do not get a specific
> (non-generic) device node name for a generic PCI device or endpoint.

I would use 'port' instead of rp1-nexus. Would it work for you?

Many thanks,
Andrea

> 
> 
> 
> Best regards,
> Krzysztof

