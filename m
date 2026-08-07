Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFE1C5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 07:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vE88xC9qkqtMD4KoFRH8UYH0K1SgGXydZFsBBt1JieY=; b=cGJYgyVSopxfAfvT77s4WvdcyZ
	it2k+Mbie92cmkyjlzOQ8mk9kTW18VAIVEXjcaoRqPF9yC9DLIT31T1cUuYk3chlZEa9yzGmZG8T+
	nMibu0dQ2q1MGgmtSrsPWnU/+LPJ4hqAKvClovm7Fkuorw5o7/UCo/7QzLob5RJNp4/wCJNa9CTZv
	7Xp7iAp8agGCgrbsDEB3kbJHE6Rc9SQxHd9MOSR+8em+D0/5lknN1zo0tJC6bZLUrdJUxSdQeqVkI
	pKh+O+0CjoUDFd1RUQd1tvNXQg6Snn7/HhJQkkgnCxkngGSg4RWw75G4b2JrlTxq9lRcYCIUXmtZo
	4+cJ7wpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFDW-00000007Gwo-41Qj;
	Fri, 07 Aug 2026 07:42:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFDV-00000007Gus-2PwO
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Aug 2026 07:42:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vE88xC9qkqtMD4KoFRH8UYH0K1SgGXydZFsBBt1JieY=; b=kx6yR/sBMSilkQEY8YE0J7eg3/
	JDKwmbYDnv58sL7ptCUUatPOV70L5NqD8d9ooXA9HNrF0mz6feI0E2tAXKYH8mNjdRobUOZ9wC1Xj
	cXNmYweaAf5rc3IeUbgePOm7zCgHrVPddO5X+FIthQUNrRV5ygZjO8scmxDVMg1l5itMy9X1/Sucy
	feLwAlMZUpkSXLtETOVcWlEopmotB8oQXbOckMqxDVnxB5+Hrigyv9DqouGCmhylKkZcZpRANL6Fx
	n9HGoM2YjFDfaXLe1Bu6lLa3b+nJ6KeG7xEr6DBszxK7Kuq8bnjMMaWQhBUMXaJ56b3WqXvPhs7Ac
	5YSBch4w==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsFDR-0000000C9HZ-0Rzc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 07:42:08 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso30217615e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 00:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1786088522; x=1786693322; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vE88xC9qkqtMD4KoFRH8UYH0K1SgGXydZFsBBt1JieY=;
        b=hnISjNQ3mu0c6IffEfVMOhhwaBUg/Edk08NNqEVWhTsXIah2ev2DaTTeywgjZQc8Fv
         n4YfEUMbTHQB2ZMJQ5W0gfiC+EwfiJdmDvapSdCtbKKmZqcJManPk3aE0MW+Ogbwv/vI
         rtHjD8vVVFIDhXg2heaHv3rWKVKtWtz6QPBsVcjDVWuFjVX9Dnd8a0pZ6qzk7PrmCzMj
         SM3+UJ7TAUZ8vjWqybwNLTuGbA2WateVqEUGxQdhIyo0E3PDPf6thezHBcUWqHI0fbxb
         ibh1hoM3aDsgHVnBW7LYPk7/mBjlSlPKBLIZQdk9p7t3/z3oLScmWAS9Dnczu2U+YXaA
         dQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088522; x=1786693322;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vE88xC9qkqtMD4KoFRH8UYH0K1SgGXydZFsBBt1JieY=;
        b=Kspjr1I0mSYsWkn8h4Dq7I+FCW+9YGOCuQ5BBkvo1CM0xayM1+o1NJOAIdcYvsUuoS
         NqTbX0ytMYnaUtXr4ki5Gw05g+BDLAD/sAemy7x+YPkEm4FXyvm/ye/qLBWx362N6lzq
         O2SwgvjGAs7dibcdiRfIYlPu9Z8LrLSU38WKIwPTE0pGJM6BWhUPQ7vIHb+AX1/k5zN8
         bFxtLZN/3YUtnSuMI4Z0HqcsT3R9913a3LxREG8ckX/axam3gpJdcl7IXTug/lpMRx/s
         UgHnuMiB3WysrBBE+SANNfa34KJqfaC0veVld85+CfK/jb3kWFMW0jof2BcgdIJOpfR7
         vOWA==
X-Forwarded-Encrypted: i=1; AHgh+RpXCHi0SwfInvAIUtnwaOV5vxOEc33ZuGumun6tsKMQZ+hcAIDu7XfztHudJqAfPQfmkYwXNUC75N79S27UUNty@lists.infradead.org
X-Gm-Message-State: AOJu0YwPAgRpKl2VbwQExK5K3MikFuMg0R+F6G0bmHAyVplDKMdLe+nm
	fHocA79e9Hl4fAvAfy0MvcfmI46nkBGEaIY3Nf24mw80n17UkgvaKWM/aFJE3IlTFODD
X-Gm-Gg: AR+sD13bOCPPx3fo6iAF0JW3Uk+TNfZGz9r3ra8HVBy4aTw6rD0UUOqPbojDSnxY/y3
	J0oX+FPdkxLo40j2dBMueiEIyJ1f6KLSnqCDtTkel83VKgJxsItG714XMVn2O7LkXN3b6w3LytQ
	iJPZHDFeZdQhD7jnkqguDk5F5roZrhKYqMDkcornpbpdElzn+gkZMNlKg5iGSVlLY8L1kkSB3cC
	YoXKE9ug6upOI0BW8L4DHQkJgSxZGFiFcjtaSChYHjs5WXyE8MXu5yx7P3KhgcPW70tGP0oO99b
	F568FwPIUZ9tQ8bEHMENwbrK4UIi3QgtRofbSpKkDhSbXlV1fOAmWa8dP9O7NgPIpgycpRV9WS0
	fvXIQzG4s1Tcc3dZAXtgCTDbrEeHfnCk7sU7BFXGuYX9AbkeezUdO/nUmcqdUsPm71T+waCQ1Lj
	qlAukUA45Gr5qi1l2yQDi5IqCbtvwJ7AJSeedjKkhHTtjcHcXEFR/H13RE/B4OqS8226okSjdao
	wpoc2DwYrnQcyHFthI7k5a7rN61uBImuqlQrWomp4LPyg==
X-Received: by 2002:a05:600c:22ca:b0:498:ee7:e40a with SMTP id 5b1f17b1804b1-4994e7d2c19mr225748665e9.16.1786088521733;
        Fri, 07 Aug 2026 00:42:01 -0700 (PDT)
Received: from ?IPV6:2001:8a0:f59c:a900:2600:fba1:8d1e:1692? ([2001:8a0:f59c:a900:2600:fba1:8d1e:1692])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995e9e702dsm20226525e9.3.2026.08.07.00.41.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 00:42:00 -0700 (PDT)
Message-ID: <a42446a5-ec45-4323-b35c-34d882b86a74@osyx.tech>
Date: Fri, 7 Aug 2026 08:41:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Jo=C3=A3o_Peixoto?= <jpeixoto@osyx.tech>
Subject: Re: [PATCH 1/6] dt-bindings: Add Bao IPC shared memory driver binding
To: Krzysztof Kozlowski <krzk@kernel.org>, joaopeixoto@osyx.tech,
 linux-kernel@vger.kernel.org
Cc: ajd@linux.ibm.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
 bagasdotme@gmail.com, catalin.marinas@arm.com, conor+dt@kernel.org,
 corbet@lwn.net, dan.j.williams@intel.com, davidmcerdeira@osyx.tech,
 devicetree@vger.kernel.org, dev@kael-k.io, gregkh@linuxfoundation.org,
 haren@linux.ibm.com, heiko@sntech.de, jose@osyx.tech,
 kever.yang@rock-chips.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, maddy@linux.ibm.com, mani@kernel.org,
 nathan@kernel.org, neil.armstrong@linaro.org, palmer@dabbelt.com,
 pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org,
 will@kernel.org
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-2-joaopeixoto@osyx.tech>
 <8a1a9ebf-a3ed-4077-aa07-48cc98e071f9@kernel.org>
Content-Language: en-US
In-Reply-To: <8a1a9ebf-a3ed-4077-aa07-48cc98e071f9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_084206_347954_46800116 
X-CRM114-Status: GOOD (  33.49  )
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


On 1/7/26 16:46, Krzysztof Kozlowski wrote:
> On 07/01/2026 17:28,joaopeixoto@osyx.tech wrote:
>> From: João Peixoto<joaopeixoto@osyx.tech>
>>
>> This patch introduces a device tree binding for the Bao IPC Shared Memory
>> device, which enables communication between Bao hypervisor guests through
>> dedicated shared-memory regions.
>>
>> Signed-off-by: João Peixoto<joaopeixoto@osyx.tech>
> Respond to feedback instead of ignoring it. I don't see any changelog
> either.
>
> Last posting was LLM junk so I will not spend much time on this.

Apologies. v2 was sent without a changelog and, worse, threaded onto the v1
thread. Both are fixed: v3 is its own thread with a changelog in the cover
letter and under each patch's --- line. I have also gone back through every
comment from v1 and v2 and addressed them one by one; each is answered in
this thread and summarised in the cover letter.

> A nit, subject: drop second/last, redundant "binding". The "dt-bindings"
> prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
Done. The subject is now "dt-bindings: bao: add IPC shared-memory device".

> Do not attach (thread) your patchsets to some other threads (unrelated
> or older versions). This buries them deep in the mailbox and might
> interfere with applying entire sets. See also:
> https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/submitting-patches.rst#L830
>
Understood, sorry. v3 is a fresh thread, not a reply to the previous 
version.

>> ---
>>   .../devicetree/bindings/bao/bao,ipcshmem.yaml | 82 +++++++++++++++++++
>>   .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>>   2 files changed, 84 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/bao/bao,ipcshmem.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/bao/bao,ipcshmem.yaml b/Documentation/devicetree/bindings/bao/bao,ipcshmem.yaml
>> new file mode 100644
>> index 000000000000..fa91800db99a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/bao/bao,ipcshmem.yaml
>> @@ -0,0 +1,82 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id:http://devicetree.org/schemas/bao/bao,ipcshmem.yaml#
>> +$schema:http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Bao IPC Shared Memory Device
> Nothing here is suitable for bindings, really. Simplified node for
> establishing channel of communication to hypervisor would be allowed.
> But multiple devices for that? No point. Develop proper interface with
> your hypervisor for all this.
>
>> +
>> +maintainers:
>> +  - José Martins<jose@osyx.tech>
>> +  - David Cerdeira<davidmcerdeira@osyx.tech>
>> +  - João Peixoto<joaopeixoto@osyx.tech>
>> +
>> +description: |
>> +  Shared memory based communication device for Bao hypervisor guests.
>> +
>> +  The device describes a set of shared-memory regions used for
>> +  communication between Bao guests. Each guest instantiating this
>> +  device uses one region for reading data produced by a peer guest
>> +  and another region for writing data consumed by that peer.
>> +
>> +properties:
>> +  compatible:
>> +    const: bao,ipcshmem
>> +
>> +  reg:
>> +    description:
>> +      Shared memory region used for IPC.
>> +    minItems: 2
>> +    maxItems: 2
> Look at other bindings.
>
>> +
>> +  read-channel:
>> +    description: |
>> +      Shared-memory sub-region that this guest reads from.
>> +
>> +      This region is written by the peer Bao guest and read by the
>> +      guest instantiating this device.
>> +
>> +      Consists of two cells:
>> +        - offset into the shared-memory region defined by `reg`
>> +        - size in bytes
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 2
>> +    maxItems: 2
> Drop property, reg defines it.
>
>> +
>> +  write-channel:
> Drop property, reg defines it.
>
>
>> +    description: |
>> +      Shared-memory sub-region that this guest writes to.
>> +
>> +      This region is written by the guest instantiating this device and
>> +      read by the peer Bao guest.
>> +
>> +      Consists of two cells:
>> +        - offset into the shared-memory region defined by `reg`
>> +        - size in bytes
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 2
>> +    maxItems: 2
Reworked exactly as you suggested. The two channels are now described by reg
itself instead of by separate offset/size properties:

   reg = <0xf0000000 0x2000>,   /* region this guest reads from  */
         <0xf0002000 0x2000>;   /* region this guest writes to  */
   reg-names = "read", "write";

read-channel and write-channel are gone; the driver derives both regions 
from
reg/reg-names.
>> +
>> +  id:
>> +    description:
>> +      Driver instance ID.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
> NAK, not allowed. Read writing bindings.
The bare "id" is dropped. The one value the driver still needs is the
hypervisor-assigned channel number it passes to the notify hypercall - that
is part of the guest<->hypervisor ABI, not a Linux instance number. It 
is now
a vendor property, "bao,id", documented as "must match the identifier
configured for the channel in the hypervisor". If you would prefer this
expressed differently (e.g. derived from an alias), I am happy to change it,
please let me know.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - read-channel
>> +  - write-channel
>> +  - id
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    bao-ipc@f0000000 {
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> If you cannot find a name matching your device, please check in kernel
> sources for similar cases or you can grow the spec (via pull request to
> DT spec repo).
The example node is now generic: "shmem@f0000000".

>> +        compatible = "bao,ipcshmem";
>> +        reg = <0x0 0xf0000000 0x0 0x00010000>;
>> +        read-channel = <0x0 0x2000>;
>> +        write-channel = <0x2000 0x2000>;
>> +        id = <0>;
>> +    };
>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> index c7591b2aec2a..c047fbd6b91a 100644
>> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> @@ -223,6 +223,8 @@ patternProperties:
>>       description: Shenzhen AZW Technology Co., Ltd.
>>     "^baikal,.*":
>>       description: BAIKAL ELECTRONICS, JSC
>> +  "^bao,.*":
>> +    description: Bao Hypervisor
> Vendor prefixes are for companies. What is the company here? What is
> stock ticker or website?
>
>
>>     "^bananapi,.*":
>>       description: BIPAI KEJI LIMITED
>>     "^beacon,.*":
"bao" is the Bao Project, an open-source static-partitioning hypervisor
(https://github.com/bao-project), not a single company - analogous to the
existing "qemu" and "virtio" prefixes, which likewise name a software
interface rather than a vendor. I have updated the vendor-prefixes entry
accordingly. If you would rather namespace this under the maintaining 
company
(https://www.osyx.tech/) instead of the project, say the word and I will 
switch it.
> Best regards,
> Krzysztof

