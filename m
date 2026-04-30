Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7733DFF8873
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 15:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=boh2FGqR0WpDSM6dhSTP3kihWh+3GkokB90DFYaafvo=; b=REHlayyzKPOnjziG7aBWjTiPgx
	+9kxsTHrVcvTVpGP0BSr3E84UwITOq9K/zmlTlSR0VqYluVSC0/MMVWf0ulHdduUZ8ATD4c+ULAkc
	Or/PIVTIEIXhaedaumfda43zMJumWXOUEc5qDhIiazaZZ9lCPm8r1jsy5CGOuLj1Ybwl4w7R00WaP
	QZOl2U+q1bGZvCebKT2zSPoGMitwaadGzC8XPt14iD6EdDh/JXO1lycqqLHDOjW26jOvxKM5DBBe9
	nL7PcOqzdVoNXBivwSo131QEO8Pp1kSg+fSJwiZnWBSDptRAaWjR6lOiGkRG1+22tXsYwzxwBwXc5
	xKb8+9hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITSD-00000005fQG-3wX7;
	Thu, 30 Apr 2026 15:37:29 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITSB-00000005fPa-3JBj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 15:37:29 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-488ad135063so9962035e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 08:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777563446; x=1778168246; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=boh2FGqR0WpDSM6dhSTP3kihWh+3GkokB90DFYaafvo=;
        b=qh07+YpHcQ/jDn3QroWReaMSwTBrckiesnIlOV7yttxfAwF2l7NA2JwSOP6aZJZTWK
         6676pu0cEd96WEmLH9QerawGTu6QcyFpW8HvCQ9QMW2dHevAfdJiIHTeShxxElWfgf8W
         447pKYsvk/313MpKUgRKOxUGOKk6+v7ORzkq4XGkovKHMwLf3LTztkSEE0kIbK9hYPnb
         PC6km7ZPRY8fLMXgW+9OPKqi8nZk3aKg44ow379wErXfbUONpaTAwOjGXR/EOJboOntz
         weJPr9Jyqfb4O1NktLtoRfpkF/Hv3yDOoZpDxI2GPahuDgiRkdwFaOfocuRNVrQD7VFb
         nz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777563446; x=1778168246;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=boh2FGqR0WpDSM6dhSTP3kihWh+3GkokB90DFYaafvo=;
        b=hfbdHeswcm9jGeOsydxVEG7SPBp15fHpci4+xHGngSk5WWVBanIpHGal/xL4GhZwov
         dIIKeT3XHERgpjPrwBJJlUP3Ls45nvWoMXBWB5OFaVUAWXgTnt9e/Qr68dwm+1+KOorg
         OadjCvHwrNgjOJKRQ9bjGTqFdDMEwOf03I+apxH6MX7YvCjsU704x+MuSC9OJckZcwln
         5hNLw7AFVD6PDSO5A2+tMG3T5uiEJg5H4NZpvrVmeyQLsmPkHO6fSBspjeGQG46yVqwr
         lvMA5gWLWnxqANEtBgv3zrWUsQLTTW6fHXXc1EGXWadTSDRGA/70wNYnD9LL3r53Jim4
         Y9hw==
X-Forwarded-Encrypted: i=1; AFNElJ/B71BkfMD3hMOVE/DlKgIimY3fz6t+OqHrUIwY4jSrxquGG8XZiCCBtAD61gEdj1/JBtgQMXIbJ2MQusoP2AeA@lists.infradead.org
X-Gm-Message-State: AOJu0YzsO5pJ3zxB83fmcESR7iegrKfgyIkklDuqc0/fSJj4n9At39km
	RHfVodF/z+J2Iy2trKMMZDkB+CjM+FKZ4Gweob33/XVmW3uLj0RYvm8k3hwl5W/S+f4=
X-Gm-Gg: AeBDietWC9WYyqKB7q1BBSmxg+wGhIjpN3jvcVIbhgtRb/mo8mnf4Ih7CrxXlqa5ar2
	i4OZY+WKS1drBSlhAjrzwGKwbjN5g8PNeRnFXHizLdCmKvfv3oRfDPP8uxzJ5dzlbRTTX/cWGYD
	uzHBipZvDTkAD/ilMWnzk6kx2MVI4YRL9dAvFl/CBWiVUeG3HB7FAR6zhW+FGDPYKyuWtnNJfwM
	TehBLRcBz1LMSTdDXZwqDwyMmq4hgPLL1l/1opBXaW/e6G5E5uY5RuTF66ksPEXXcwuOnfGGcjS
	EMqC3217LGCwkukAJxbzMDyzUMGTn1qWMk0JFV0Kbepf2wMtcQTW87nfFFM9Io/yUYXUzHA+WZ+
	zHqlJXU4Cn+XGUvbRzIl0KZbxmeY0Qa8y8s0ssFAkpxsLH5zYoK33gobDz4EUXqbCKp6AVOGKPT
	7kBrmPNGujH6jxb6q21sUUss0FK606kb3lNAYtXzF1HGysqTvaTRw7k1BTYVVfgp1b5KtXAgsa6
	BJIl+UM/ZknHCznjsrWSRQxhg==
X-Received: by 2002:a05:600c:c058:b0:488:ac01:72de with SMTP id 5b1f17b1804b1-48a83d6a890mr42190595e9.5.1777563445839;
        Thu, 30 Apr 2026 08:37:25 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:b0e1:a8:4337:b2a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b912869sm46165045e9.6.2026.04.30.08.37.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 08:37:25 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Apr 2026 16:37:24 +0100
Message-Id: <DI6LNH2F0DP5.H1ZM8MTSDQJR@linaro.org>
Subject: Re: [PATCH] arm64: dts: exynos850: Add SRAM node
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>, "Alim
 Akhtar" <alim.akhtar@samsung.com>
X-Mailer: aerc 0.20.0
References: <20260413-exynos850_sram-v1-1-7fda5b7fb7d4@linaro.org>
 <2ff077e1-8983-4a41-bb21-5e4140545aa3@kernel.org>
 <DHSR70EGYY4N.2EA2HWIXJR7QR@linaro.org>
 <4c6a92e0-15a1-4f82-afc9-542f5ad9d2df@kernel.org>
In-Reply-To: <4c6a92e0-15a1-4f82-afc9-542f5ad9d2df@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_083727_846764_196F23CA 
X-CRM114-Status: GOOD (  18.40  )
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

On Tue Apr 14, 2026 at 10:08 AM BST, Krzysztof Kozlowski wrote:
> On 14/04/2026 11:00, Alexey Klimov wrote:
>> On Mon Apr 13, 2026 at 4:23 PM BST, Krzysztof Kozlowski wrote:
>>> On 13/04/2026 16:52, Alexey Klimov wrote:
>>>> SRAM is used by the ACPM protocol to retrieve the ACPM channels
>>>> information and configuration data. Add the SRAM node.
>>>>
>>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>>> ---
>>>>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 8 ++++++++
>>>>  1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/bo=
ot/dts/exynos/exynos850.dtsi
>>>> index cb55015c8dce..cf4a6168846c 100644
>>>> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
>>>> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>>>> @@ -910,6 +910,14 @@ spi_2: spi@11d20000 {
>>>>  			};
>>>>  		};
>>>>  	};
>>>> +
>>>> +	apm_sram: sram@2039000 {
>>>> +		compatible =3D "mmio-sram";
>>>> +		reg =3D <0x0 0x2039000 0x40000>;
>>>> +		#address-cells =3D <1>;
>>>> +		#size-cells =3D <1>;
>>>> +		ranges =3D <0x0 0x0 0x2039000 0x40000>;
>>>
>>> You miss here children.
>>=20
>> Thank you! I guess I should convert it to smth like this:
>>=20
>> apm_sram: sram@2039000 {
>> 		compatible =3D "mmio-sram";
>> 		reg =3D <0x0 0x2039000 0x40000>;
>> 		ranges =3D <0x0 0x0 0x2039000 0x40000>;
>> 		#address-cells =3D <1>;
>> 		#size-cells =3D <1>;
>>=20
>> 		acpm_sram_region: sram-section@0 {
>> 			reg =3D <0x0 0x40000>;
>
> This covers entire block, so feels pointless. Maybe requirement of
> children should be dropped. What's the point of having children? Why
> does the driver need them?

Thinking further about this. I was looking at the schema file and
different commits and it the right approach could be:

- add separate compatible for mmio-sram region for this case. Similar
to scmi and scpi, i'd say it should be "exynos,acpm-sram" or
"samsung,acpm-sram";

- update schema sram.yaml to exclude requirement for having child nodes
and properties like ranges, address and size cells
Similar like in commit, for instance, git show d0fe6491ddd22
(or git show 2d4a22e79a5fd).

- then this addition becomes:

	apm_sram: sram@2039000 {
		compatible =3D "exynos,acpm-sram";
		reg =3D <0x0 0x2039000 0x40000>;
	};

and will be consumed as a whole region (also as Tudor mentioned in the
other email).
And then we should update gs101 dts as well. Thoughts?

I honestly don't know why be default schema requires child nodes unless
it is specifically excluded. Could be a good question to Rob?
Or maybe we should really drop a requirement for having children from
schema.


>> And then later reference shmem =3D &acpm_sram_region from acpm node.
>>=20
>>> Also, 'ranges' should be after 'reg'.
>>=20
>> Thanks, will fix this.
>>=20
>> FWIW this commit is a copy of commit 48e7821b26904
>> https://lore.kernel.org/r/20250207-gs101-acpm-dt-v4-1-230ba8663a2d@linar=
o.org
>
>
> Huh, we should fix that one as well.

Best regardss,
Alexey

