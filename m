Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12567CD8C88
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 01:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HqAMDji/Y/ZfDPdozsCR+NdaIZJxhg+V9OuE8Iuwqx0=; b=d+KI1UDvbNsf22DSweiWQz6Mi+
	9T87Fv2PnGyuKIbfNvcavEmcFkCGH8Z2mcLolwQVIvj3Fj7QuvdaD9teXMq3Jk82fWEeChuXFQNTb
	h2vM0PWp7nYWutrFXSXYJNNJEiX+4lrz1PJueaA2t+Tx58qhPYYMYXQpXBqDDiWA2dcNWObV0EwmC
	Khv6TKD9lZl1AxipG3ayKKkL6TV14z37VEyHUyXvK1oenDJbRtmXM+OVUC+dMAWUK3LXZuOAjL6G1
	4mS/jcROV/Fxt29/iQJp89rA9YByY1+ApAJI8rBIUPAmFBU/mj5mnBIGO6vzI+tT9GNh7pS0xjLVe
	np86Zi8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW1vD-00000001xrb-2XDt;
	Sun, 07 Jun 2026 01:03:27 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW1vA-00000001xqe-1iBX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Jun 2026 01:03:26 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-bf0170c80f7so520806966b.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Jun 2026 18:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pardini.net; s=google; t=1780794202; x=1781399002; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HqAMDji/Y/ZfDPdozsCR+NdaIZJxhg+V9OuE8Iuwqx0=;
        b=jP+u7nxUXrboAmvyPJc5eb1DN5bhE1H0Pd756Fzy3P6NR3qQXUJ6jsYf8Of3ZR6Ce3
         CtxkEYYwrTyFq+iWCtUmBtZ8wmU1fIKQgf2W4KAZ3SZ5Q3k2EIZW/Lhk3/fa0qBxuqq9
         /EDTLZySx2OAUw3tzuq3YYy0G3J1YSb170n2JrtSBLwfg9qihu+TU6WaW04OdbyYfxjL
         H/82dM3KDXsaOLjiXXmbj5eWpYSggAO+1HvbEouu3Vma9pV/tVml/JMHwdOb+5thdL1b
         3qoQJkAcnlw4W2Y4KvtwCpwNz3gpXi67XAOdatsBTLZlpBmk3g+baNAVpE+3UpH1uZLH
         rbAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780794202; x=1781399002;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HqAMDji/Y/ZfDPdozsCR+NdaIZJxhg+V9OuE8Iuwqx0=;
        b=oxMuuz3zr2UxxM7cPiM7CSZgXXCt1sytXnLuzHqrIgDTzHxJlopwO1uobMbSsHLq4E
         zHUdFnRzGBuSKTsA2oyp05uJ7xOgtKE/BgUKuW8QAj5HYznmWVhTIa8Nw8XwS5sIA6qM
         +i9O0oM40hrpdh13wkMjDD/nluPLXA6pW8mbPRgyC5pgnIhdjQB6jzjbzup9Uu//abRh
         i/6dR5ClJpF/Tn9r6YZ8WV+CXfWLRG4VZgGSSq7wM4ku5fXnqdX+G63IHqWrVhqpIOg5
         ea+UhlK86Jh++Mv8Yr1O8PPe5h/xTwmBq+ZdsSXkCn03iIaKPlU6pCKBzO6RGAqWzIp3
         vD7g==
X-Forwarded-Encrypted: i=1; AFNElJ/q9fXIN4k6dS8OOU4xOcdBNW3Eej3/doezTRYOO/6age52/vrQvqeNG7z7ZBhzoIf0jvpk8gBuiXDEg9jAYRql@lists.infradead.org
X-Gm-Message-State: AOJu0YyHJNMpR6S5toq9jgfWkBj3XYszdxCviGk08B0uJJsRhEzRmcf4
	PWNh2W1nrka8TbdsmYfJLjsMSjtx5AlWfKSVZYyQnch/za0CbXIi6H6LMe7+lc5prDe7s9ObmRT
	1LZ53dgqn
X-Gm-Gg: Acq92OFHvTV35k7HHIJRTu65kQV+wuzIpMhEjdBDJPWX1c8t5HFAarD8eg9kQmJpVYL
	HcmJ05q9fdh/PzVUmWcWOhPxExWgwGX2dDnO62XxchAGwSRYo/dliuL6jNxtJK8COCSbRmPLGa8
	ngqXegAH8ZjZMDkllPjREX3mib5kfBcWsaSdfy97RZJtDflpQnE33Kzv29TQmKkgOthICqym6QG
	/cTyXVFVObXNKvj6Ssy2n1s87fvYc4h5mIcKhD7gPHEM+wSqiRcIeclxTGkKJnhZJEufkSpXrrD
	1eE/aGi8WXeHmXz//SFiFU1UBijwzL/ovkz8zFbtN5IlFeeF/kMyOZHZQuWuIGq1Juw0Zg9mLOE
	wRgRnED2aOjg+IKilgYQXTnJPhvICKvBCeYdfXkNTnps6gJ2Pvno6MHR0PETExtR98dWEoBesKI
	HBCSarcrgjbW6nejmPsAZfP5Z7PW2b/b+tA0u73sHjtk2QMy/widTv2STYm9KHmKHZHMCiaMnci
	qkSASk0udg9LCYbkXLeVZZeEUTtGsnz/IN3CIAGnkEFqSynThv+DAmhSHLoeYxWxilVOhRXkWnQ
	vm1+
X-Received: by 2002:a17:906:6a01:b0:bed:87c:b24e with SMTP id a640c23a62f3a-bf3721513damr453039466b.29.1780794201771;
        Sat, 06 Jun 2026 18:03:21 -0700 (PDT)
Received: from ?IPV6:2a02:a466:4d7a:0:9569:75b0:b281:a338? (2a02-a466-4d7a-0-9569-75b0-b281-a338.fixed6.kpn.net. [2a02:a466:4d7a:0:9569:75b0:b281:a338])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e0280asm654743666b.33.2026.06.06.18.03.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jun 2026 18:03:20 -0700 (PDT)
Message-ID: <04ef65b1-e28f-42fd-b054-d1843205f67d@pardini.net>
Date: Sun, 7 Jun 2026 03:03:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: net: add Realtek r8169 family PCIe
 Ethernet
To: Heiner Kallweit <hkallweit1@gmail.com>, nic_swsd@realtek.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20260605-rk3588-dts-rtl-eth-describe-dt-alias-v3-0-8a8857b39daf@pardini.net>
 <20260605-rk3588-dts-rtl-eth-describe-dt-alias-v3-1-8a8857b39daf@pardini.net>
 <b7cc8eba-ff6e-417d-8e74-b3bb24e08a26@gmail.com>
 <26da1dfa-3408-4654-9046-36ed6d57059c@pardini.net>
 <667f64e0-2b3e-41bf-9c97-3562696d3af7@gmail.com>
Content-Language: en-US
From: Ricardo Pardini <ricardo@pardini.net>
In-Reply-To: <667f64e0-2b3e-41bf-9c97-3562696d3af7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260606_180324_506046_D949EAF8 
X-CRM114-Status: GOOD (  20.84  )
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

On 06/06/2026 22:50, Heiner Kallweit wrote:
> On 06.06.2026 07:03, Ricardo Pardini wrote:
>> On 05/06/2026 17:48, Heiner Kallweit wrote:
>>> On 05.06.2026 13:49, Ricardo Pardini via B4 Relay wrote:
>>>> From: Ricardo Pardini <ricardo@pardini.net>
>>>>
>>>> Add a binding for fixed/soldered Realtek PCIe Ethernet controllers
>>>> driven by the r8169 driver (RTL8125/8126/8127/8168 and variants).
>>>>
>>>> The "pciVVVV,DDDD" compatibles are the Open Firmware PCI Bus Binding
>>>> spelling, auto-derived from PCI-SIG vendor/device IDs, but they still
>>>> need a binding when used in a board DT - analogous to "usbVVVV,PPPP"
>>>> compatibles documented in their own bindings (e.g. microchip,lan95xx)
>>>> so board DTs attaching properties (fixed MAC, nvmem cell, ...) to
>>>> these PCI function nodes can be validated.
>>>
>>> The of node seems to be created by of_pci_make_dev_node(). But this
>>> function is called for bridges only in pci_bus_add_device().
>>> So where is the node created in your case? Did you test node creation?
>>
>> Seems to me of_pci_make_dev_node() is not at play here - that's the DT-synthesis path. For nodes already present in DT, the of_node is bound earlier, during pci_setup_device() -> pci_set_of_node() -> of_pci_find_child_device() via the 5-cell reg.
>>
> I see, thanks. If the matching is done based on the reg property, then I just wonder
> if and where the compatible string is used. Or would the logic also work with a
> random compatible string?

Thanks, Heiner. It seems the compatible is not involved in the kernel 
runtime matching at all (and u-boot simply patches DT via the ethernetN 
alias).

I guess DT-wise, specifying compatible (although not strictly required) 
makes sense since DT describes the hardware; "there's an RTL8125 at 
0x410000" sounds better than "there's a PCIe device that needs a MAC 
address at 0x410000", and having the binding opens up usages of 
non-generic properties, although that would be future-looking.

At this stage I've to ask the devicetree folks: should I simply drop the 
compatible from the DT patches (and the whole binding)? dtbs_check 
passes without it, and it also avoids the checkpatch.pl 
vendor-prefix-undocumented warning. There's precedent: at least on some 
Apple Silicon (2022, t600x-j375) and NVIDIA (2019, tegra210-p3450-0000). 
On Rockchip there's quite a few (10?) boards using the same RTL chip we 
might want to describe.

> [...]
>>> This list reflects just some of the PCI id's handled by r8169.
>>> Any specific reason for this exact selection?
>> I went for "chips likely to be soldered down on an SBC", but that was indeed speculative.
>>
>> I guess I should trim to pci10ec,8125, which is all this series describes? (further IDs can be added by the patches that introduce boards using them)
>>
> Yes, I'd prefer this approach. Considering that RTL8168 has been supported for
> about 20yrs now, your use case seems to be exotic. Otherwise I would have
> such a patch much earlier.
The Tegra Jetson Nano has an RTL8111 described in DT for this exact use 
case (without compatible) for about 7 years now -- I just couldn't find 
it until now.

I'll wait for people to chime in, and later send a v4 either dropping 
the binding, or trimming it to only the 8125. Sashiko seems to have nice 
suggestions [1] on the YAML too, in case we decide to keep the binding.

--
Regards,
Ricardo

[1] 
https://sashiko.dev/#/patchset/20260605-rk3588-dts-rtl-eth-describe-dt-alias-v3-0-8a8857b39daf%40pardini.net


