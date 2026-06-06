Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE9BCD8C88
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Jun 2026 20:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KICvSmr67GVRpflb7Bqnkr43eQwEX55VG2vB71Ne/XY=; b=2GJyXWdBMrNELA8aK5cGVl7JJF
	zslvUjNnXyjvZZEp5HTp3MnCBuR5FDkzNf+eXUA4oIUG8rn6p8WKcZgxuaDYouMMqpuldFLrBjacc
	n1DH1dmQd65foOribRSZ8Z1k13BPf/xsy2eUEmry1ZrYdB+F44TdqxF0e1Xmmr3AQ+UEmwYhkUJb2
	XIZFOa7XSEtR/SsUZ8rgknSxOAvJHLV1VvdOUkBKU0AThM+EItr5MHRtIZKepfFQoFtQuvZ/PblNO
	s1UatvJFg6VvQiRy+FY8STHKYTMlJhT/cmTyi7V+Sfu3NA5phGj3ZpGUSjmSXDY5wF9UILKDV9xmw
	agQChk0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVxyM-00000001p8B-1f5W;
	Sat, 06 Jun 2026 20:50:26 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVxyJ-00000001p7B-1tup
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Jun 2026 20:50:25 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-490c1915793so15939955e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Jun 2026 13:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780779021; x=1781383821; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KICvSmr67GVRpflb7Bqnkr43eQwEX55VG2vB71Ne/XY=;
        b=e2mN44uX4KmHFNqWWfbVXm+kuLtHNzLXHD0HgbEhObZcrcgbfdA0Dsd1If7OkXrbH1
         kJ2DoG0qgoF5rZ6GxmkbjUhM1yqAyKDPGTkoYKRRAmra/HvQMKauoPRFA3A73/aOU/Nj
         WFWR+AE6enxcc6HJSggCLGed0AqkULijrILXMy7HaJJwJTPdVcQN1+HCJ4pABjIraRR8
         SL2N8Uthj+XHQN+Qdw/hS9KST5OZJ8iZgcN80jioPove/Q/RQy0OnvryMg471zc924Hg
         0DHaPhDPkCfpypekWT+e4uKFcMcfYHAROuowLAOuYiNQJayFeNsyo9tq9EhhyNsLTWd3
         Pbyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780779021; x=1781383821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KICvSmr67GVRpflb7Bqnkr43eQwEX55VG2vB71Ne/XY=;
        b=h2VsvfznfSRoq3I1O0Fz6ekJM57D5PUX7QC7wxZLVbN6OP3/HlDGdYCNFEP2+2A4qd
         gw/028raxK2cWDlQht1xvaDykSSnTyuANs/WSYkUU+8jsAVNY01wpCr0oQ8Rnh9Mab+e
         pAN9za6LDVBfX9mhEC2Hspza8iQCHAGDiSEAcms1ADcZiFOkqXFQ9GshZm1v+dGmZQ9E
         3LSrXCiI36U9YxCg5SGn8UbcSTsKeqMIwDQNDxUqAU+cjUrF1yVVb8IE/kTfkrpx5mgw
         MvFGJRRQsiB7MUT5fFXOpXnqFJK4CsYOmuQK45Ci67Ck+i3+g3Por7LTy/SO3lZm0nO6
         c8ig==
X-Forwarded-Encrypted: i=1; AFNElJ/yndCX2Ue/hwPxyxpRT+qAGwsGiu/yaIcTCS/njgeKXvL1SCZiHKfNEdWE4sPLydxptGEVJBEH0EAr9xMffwWX@lists.infradead.org
X-Gm-Message-State: AOJu0YxONFW1ofO1+tLcDtbxBzUMXWyY9O78dzo6h7heWO7iOzfA9Mg/
	yqgcbms9bxTbWNd6X98juXFkaRKMhCRj1PrM2kwSfN+nCPlLT2c98kwQ
X-Gm-Gg: Acq92OFUI51/2ZPsm6tJB5/YipyiVW16KclhQ6oPX6nCibsCnafeLqmtNTFGKHRL0/Z
	BG3JaAfiprfigI9Cm8fTsgr+lXI4ohabWbJm8ueQzhDw2bn5DIVee6SUTeKr0fLPeUhEm+dKu8Y
	fQeD2wSWpFBhEw97XEoE+muBhjde/OG89z6HUKV2xhpZ73NHGKS4W8ZY5lSXR2Iuf2++Y6RnGX3
	H1ZY5+fn7mrOCufaWhI8VT2C7YztleVf6txc2hDziyyPZvwXGwnPyV0nT+b4fOXR/1l5Asu7Oix
	vt3aPWjdR+IXem9+EkB3J9ER0zw9tPAa4s5HPqTkZxFo47sxiZ23PkYhgZIsiEimXpzlVrIGu8U
	6hoNDxetu72NF7QT0iDMUKr3L1iEybXyUYEswaD8CU3SBOtkFaBi2kP+s6clMU02Wj5gdSJILqv
	5E/1LKkfDH5CwXkzySq77Bw7Ph7QNINsWM4+bzwPU4B3CvD+crE/umif9ujpOXBA5E89Cn1SxVl
	cELwz6IEDRal0eNcVMHnTjxXo4kNX4cPU2LQD6KQ7Dtz8fyjPG4O+goWHfXQ+ES5Gmk9d8=
X-Received: by 2002:a05:600c:4708:b0:48a:6fd4:d3d3 with SMTP id 5b1f17b1804b1-490c2604735mr151296265e9.20.1780779020992;
        Sat, 06 Jun 2026 13:50:20 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f4a:1a00:ac2e:7640:d3:7bd5? (p200300ea8f4a1a00ac2e764000d37bd5.dip0.t-ipconnect.de. [2003:ea:8f4a:1a00:ac2e:7640:d3:7bd5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3cbfe4sm259925885e9.7.2026.06.06.13.50.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jun 2026 13:50:20 -0700 (PDT)
Message-ID: <667f64e0-2b3e-41bf-9c97-3562696d3af7@gmail.com>
Date: Sat, 6 Jun 2026 22:50:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: net: add Realtek r8169 family PCIe
 Ethernet
To: Ricardo Pardini <ricardo@pardini.net>, nic_swsd@realtek.com,
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
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <26da1dfa-3408-4654-9046-36ed6d57059c@pardini.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260606_135023_520071_7080A941 
X-CRM114-Status: GOOD (  18.82  )
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

On 06.06.2026 07:03, Ricardo Pardini wrote:
> On 05/06/2026 17:48, Heiner Kallweit wrote:
>> On 05.06.2026 13:49, Ricardo Pardini via B4 Relay wrote:
>>> From: Ricardo Pardini <ricardo@pardini.net>
>>>
>>> Add a binding for fixed/soldered Realtek PCIe Ethernet controllers
>>> driven by the r8169 driver (RTL8125/8126/8127/8168 and variants).
>>>
>>> The "pciVVVV,DDDD" compatibles are the Open Firmware PCI Bus Binding
>>> spelling, auto-derived from PCI-SIG vendor/device IDs, but they still
>>> need a binding when used in a board DT - analogous to "usbVVVV,PPPP"
>>> compatibles documented in their own bindings (e.g. microchip,lan95xx)
>>> so board DTs attaching properties (fixed MAC, nvmem cell, ...) to
>>> these PCI function nodes can be validated.
>>>
>>
>> The of node seems to be created by of_pci_make_dev_node(). But this
>> function is called for bridges only in pci_bus_add_device().
>> So where is the node created in your case? Did you test node creation?
>>
> 
> Hi Heiner,
> 
> Seems to me of_pci_make_dev_node() is not at play here - that's the DT-synthesis path. For nodes already present in DT, the of_node is bound earlier, during pci_setup_device() -> pci_set_of_node() -> of_pci_find_child_device() via the 5-cell reg.
> 
I see, thanks. If the matching is done based on the reg property, then I just wonder
if and where the compatible string is used. Or would the logic also work with a
random compatible string?

> Ref testing: yes; with this series on a NanoPC-T6 I get, for example:
> /sys/bus/pci/devices/0004:41:00.0/of_node -> /sys/firmware/devicetree/base/pcie@fe190000/pcie@0,0/ethernet@0,0 and u-boot correctly adds local-mac-address property there which is correctly picked up kernel-side:
> 
> => setenv eth1addr 8e:b4:90:66:66:66
> => boot
> 
> ...
> 
> # readlink -f /sys/bus/pci/devices/0004:41:00.0/of_node
> /sys/firmware/devicetree/base/pcie@fe190000/pcie@0,0/ethernet@0,0
> 
> # xxd /sys/bus/pci/devices/0004:41:00.0/of_node/local-mac-address
> 00000000: 8eb4 9066 6666                           ...fff
> 
> # ip link show dev end1 | grep ether
>     link/ether 8e:b4:90:66:66:66 brd ff:ff:ff:ff:ff:ff
> 
> 
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - pci10ec,8125  # RTL8125 2.5GbE
>>> +      - pci10ec,8126  # RTL8126 5GbE
>>> +      - pci10ec,8127  # RTL8127
>>> +      - pci10ec,8161  # RTL8168 variant
>>> +      - pci10ec,8162  # RTL8168 variant
>>> +      - pci10ec,8168  # RTL8168/8111 GbE
>>
>> This list reflects just some of the PCI id's handled by r8169.
>> Any specific reason for this exact selection?
> I went for "chips likely to be soldered down on an SBC", but that was indeed speculative.
> 
> I guess I should trim to pci10ec,8125, which is all this series describes? (further IDs can be added by the patches that introduce boards using them)
> 
Yes, I'd prefer this approach. Considering that RTL8168 has been supported for
about 20yrs now, your use case seems to be exotic. Otherwise I would have
such a patch much earlier.

> -- 
> Regards,
> Ricardo
> 


