Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0144DCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 14:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LPn9l+QoDiG2QhjIafrV6sGFlG1kFs7V/OcM6xzYO04=; b=Z9y9PRa/ntrL1aA3dE8squk6uY
	lTcNjlp3OKvpKJ4+FiP9rnbs2mI/Ue5cakzjyvWhSMZuaK7MitL1kbSEps3CzMv3auNUXw49gEAOz
	u3yLn7jbvSxZ7QdWSf9YMsntuejRVBTv5o+z3m41gGPGk0va5U2Ew2ylwp+cIi3X99ykLXDaXvup8
	u6w5vgcurUQBWbSSaeRMf72S6ppAX4kWr6aF2SntDM9lzJyT2YavUIoKekPjXIU3T0CgiJFaLmxQQ
	SUWz0acBKlma+4V3WdqDH4MGWs6uCqYOErVMIGBw1Dd9MTJ9YgwOCjvD4N9oOR5FC2sXVTbWNgXis
	SEJ2ryPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHjpU-00000003BfV-0izg;
	Sat, 08 Nov 2025 14:22:13 +0000
Received: from out-177.mta1.migadu.com ([2001:41d0:203:375::b1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHjpQ-00000003Bed-2Y8W
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 14:22:09 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1762611715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LPn9l+QoDiG2QhjIafrV6sGFlG1kFs7V/OcM6xzYO04=;
	b=P189H++3jsjVCo2N95hPxrfBzWWByQ0uwh1OJKldQ/RBEV/5VZAgdfHmvB5vYrtufQnceg
	WApyA74cMwLyug8RtetofDrFbjO4cC48jNDcwONMyeACAcv0mvZh7ZnQTHA9JWew3W9ZWi
	qBH+ZmcO65lYR1rqmc/zMYzcY+ePOGBzLlpkSJWEtQRFD0OlobZPINuSI/Pfa3N7E2WfWU
	nCCihzEoTb6LsqNm1+Vx+pUpNlYVm8rgximClhXyAVtwZVUFQ52C1a15J2j7sy2BtrbfAF
	ZkHAeduwh8nm7yQz1YlcwyV/AAcYiwU/LwmBbOs2Z5KjF5B6UsH8uTsBVDLE8Q==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 08 Nov 2025 15:21:45 +0100
Message-Id: <DE3DPAVIOGZP.7RW4SGB8HXUT@cknow-tech.com>
Cc: "FUKAUMI Naoki" <naoki@radxa.com>, "Damien Le Moal"
 <dlemoal@kernel.org>, "Anand Moon" <linux.amoon@gmail.com>,
 <linux-pci@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Dragan Simic" <dsimic@manjaro.org>, "Lorenzo Pieralisi"
 <lpieralisi@kernel.org>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?=
 <kw@linux.com>, "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org>,
 "Rob Herring" <robh@kernel.org>, "Bjorn Helgaas" <bhelgaas@google.com>,
 "Heiko Stuebner" <heiko@sntech.de>
Subject: Re: [PATCH] PCI: dw-rockchip: Skip waiting for link up
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Niklas Cassel" <cassel@kernel.org>, "Shawn Lin"
 <shawn.lin@rock-chips.com>
References: <20250113-rockchip-no-wait-v1-1-25417f37b92f@kernel.org>
 <1E8E4DB773970CB5+5a52c9e1-01b8-4872-99b7-021099f04031@radxa.com>
 <6e87b611-13ea-4d89-8dbf-85510dd86fa6@rock-chips.com>
 <aQ840q5BxNS1eIai@ryzen> <aQ9FWEuW47L8YOxC@ryzen>
In-Reply-To: <aQ9FWEuW47L8YOxC@ryzen>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_062208_782334_0FBEA2F5 
X-CRM114-Status: GOOD (  17.29  )
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

On Sat Nov 8, 2025 at 2:27 PM CET, Niklas Cassel wrote:
> On Sat, Nov 08, 2025 at 01:34:32PM +0100, Niklas Cassel wrote:
>>=20
>> The pcie-dw-rockchip.c driver is modelled after the qcom driver.
>> So if this is a problem when a ASM2806 switch is connected, I would
>> expect qcom platforms to have the same problem.
>
> Looking more closely at this, comparing the "good" kernel:

There's another thing that caught my eye ...

> [    1.868857] pci 0004:40:00.0: [1d87:3588] type 01 class 0x060400 PCIe =
Root Port
> [    1.869509] pci 0004:40:00.0: ROM [mem 0x00000000-0x0000ffff pref]
> ...
> [    1.879764] pci 0004:41:00.0: enabling Extended Tags
> [    1.880614] pci 0004:41:00.0: PME# supported from D0 D3hot D3cold
> [    1.881409] pci 0004:41:00.0: 2.000 Gb/s available PCIe bandwidth, lim=
ited by 2.5 GT/s PCIe x1 link at 0004:40:00.0 (capable of 15.752 Gb/s with =
8.0 GT/s PCIe x2 link)

... 2.000 Gb/s ...

> [    1.888729] pci 0004:41:00.0: bridge configuration invalid ([bus 00-00=
]), reconfiguring
> ...
>
>
> With the "bad" kernel:
> [    1.383075] pci 0004:40:00.0: [1d87:3588] type 01 class 0x060400 PCIe =
Root Port
> [    1.383738] pci 0004:40:00.0: ROM [mem 0x00000000-0x0000ffff pref]
> ...
> [    1.415746] pci 0004:41:00.0: enabling Extended Tags
> [    1.416465] pci 0004:41:00.0: PME# supported from D0 D3hot D3cold
> [    1.417181] pci 0004:41:00.0: 4.000 Gb/s available PCIe bandwidth, lim=
ited by 5.0 GT/s PCIe x1 link at 0004:40:00.0 (capable of 15.752 Gb/s with =
8.0 GT/s PCIe x2 link)

... 4.0000 Gb/s

I don't know if that's relevant or important, but wanted to mention it.

Cheers,
  Diederik

> [    1.423384] pci 0004:41:00.0: bridge configuration invalid ([bus 00-00=
]), reconfiguring
> ...
>
>
> We can see that the pcie-dw-rockchip.c driver detects the ASM2806 switch
> in both cases. So the problem is not really with enumerating the root por=
t.
>
> The problem seems to be that with the "bad" kernel, you get a lot of:
> [    1.464651] pci 0004:42:00.0: devices behind bridge are unusable becau=
se [bus 43] cannot be assigned for them
>
> Because the bus ends are different, and conflicts with each other.
> I don't know why this happens.
>
> Perhaps we could add a quirk for ASM2806 that does some extra sleep if th=
at
> switch is detected, if for some reason, the switch is not actually ready
> after the delays defined by the PCIe specification.
>
> (And btw. please test with the latest 6.18-rc, as, from experience, the
> ASPM problems in earlier RCs can result in some weird problems that are
> not immediately deduced to be caused by the ASPM enablement.)
>
>
> Kind regards,
> Niklas

