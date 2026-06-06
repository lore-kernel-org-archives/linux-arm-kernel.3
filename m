Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7FD5CD8C8C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Jun 2026 05:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ad3Risuri9Oy23ttuXXObF+tJAD6dYgEl+kDhesPP88=; b=zcq5jvfATrEh8NjTZU9Y6QaZk0
	5vCCmbc6s5onsbF2kBVToiZUPeqv6O0wXlit5zj69q4I3CIOa7DAlubbsiZunfHB90wv4U/avrhUj
	gA2yHR9AUigE/EOKW875U6RuyY79XHTjwIB3cv5UTSCI3etCobaOdB4bdBZUSolm+xgJMxIQHXHFo
	dAWFLwyiz23qZg+dQG7h6V6/8aCpx/BEM9snVx6w1oyJ4v/pDp6k/bv5CHi6iuXnYgdWF/2QvJgst
	l03JSsfdCv94i3R2c3KmEOOj2KtYuIcEzzK+JED+c2OWWKDK8Xxh3XVWMJLG/2ZOT1zFjWMuQLGNB
	NIN5Mw/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVjCZ-00000001SHn-0hMh;
	Sat, 06 Jun 2026 05:04:07 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVjCW-00000001SH6-0jif
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Jun 2026 05:04:05 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6914a658115so716267a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 22:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pardini.net; s=google; t=1780722242; x=1781327042; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ad3Risuri9Oy23ttuXXObF+tJAD6dYgEl+kDhesPP88=;
        b=fhJzi3b4acBqOFSq3Mf/wRsp7AGZYsE4yi8KeNKMldG7u7SraPDT2WdEfIUATmpcwZ
         0CCe0S7F7QhWJ5PwKNcEWLSsIBHwRipUJ4DyTdnPJCrplDmamc8pIaHOt5MwJySSF21B
         RZK7IJ587q2xnRgOsRDk0/pnam5tCNPoNAFYksudHMDV+E8aCXb9Af1ec8xE0EPmxafl
         verKAW733pGurIpmokyyu14vzrfsJ5f3cqQF7fPf+L+FWGPJ28TjZfQwfmijphnJkUiv
         dzIanCUswOHuLoJUXONmPa0R+n4fldy0dUH6qbiOmCrDKlCGtBLd2zwXBRwDSU5+V3Pf
         pBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780722242; x=1781327042;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ad3Risuri9Oy23ttuXXObF+tJAD6dYgEl+kDhesPP88=;
        b=eRkJfeTo155IXyvOGctEwHMJRtSf+Um5YgPA+eexdyKspMRSGXRHHqEyjxLGYizAZo
         bc+0E0RiXfQetHAbROaN21G0XLGPF50WlpSPArXw0NWwZbZfYW4x1xgaSpf7lVKEFBnD
         4lmzOhfXl2VJEWFlzwb3I3jhMsQf7j4y262kX6RsZYwgmkHKTP4Pd5e+htCsXOlwHRJf
         PVZWSbJRwv+OXX4fSCveMSXWjnLAfOXoQ97qhTJDFRme47DoN10j2z9Z30qENEjP8GWD
         KXY8KsicYKDBCEL6HV06Iix9sfEOe9YJuV/EFh+gFmHyQmQbv4fa0TV1732tVCCtPA3/
         TKtw==
X-Forwarded-Encrypted: i=1; AFNElJ8+ZBrLy8BiHNa+UBDnoNmT8d5c/JwFFvEIrwPXtCKDdiBcwpqVItajQulVFCsIvFV0kauzSladxPEKO2G+EaaW@lists.infradead.org
X-Gm-Message-State: AOJu0YwjPrgXmpug9pO6ykjhNeidH23OOsMl3zqq40AOPnUTeHk/0i2j
	2nlAI8e2Rtsvz1lJyYfT2prpdi846M/MYYvPE41naVZW2lM6Oc5t6s4sYPZmZBMnlA==
X-Gm-Gg: Acq92OG8FQAnlL5V8dKtiiAMOvKvwMPA/nCER5Sv2jRAp8ypRR8SUuheD2Y/oRGizAI
	KWbx0teghZb3+nYtNunRWsH0OWpNR0CoifCPcC+MbHVFGeN/IldFAJrc7SsexHgdeRuPCVVMhCz
	ikRkqfw05T+sAhyCeC16FOFlf3ySkMJ0xxONOFT3NjHqyRwdlzOYOmaR73sad0Zn71dftxiJTRu
	F7OTk2lNxfXwG6CBFCckk3eC5vEZNtwgZuNYMVGPw+QkMZIQ37MFjO7IZdY52ohvlGwb50RO5lc
	HbVRihEALcBA8oPVmBfVhB3EQXW8qJPD8D0QghrXGxIFk57mTwQ5ALXL4KyEhpe/zXnWjmmsQHi
	aOnVXKWT5+2pVyPwsBU7iSTK80mStVvssVf2iXBsGPvoLzOlX1NKeWmmlVdsw9KiQmVMzf/xqKZ
	/0T0XMLarwLSE4po7wJ32HQ35wfPfdnek5xEAZnmyLUSLsTISrUPmqug2zAZmB60Bz5sU+nNkwO
	D5ImYUrKyqZdcEUv+HWsU29mmJOUSz9Ex0DK3V8gD6Iy7cuSWHTdWfRq1bb7aG0F2DTECZ4yOl3
X-Received: by 2002:a05:6402:268f:b0:68e:4c0:f599 with SMTP id 4fb4d7f45d1cf-68fa4c16b80mr3088882a12.5.1780722241268;
        Fri, 05 Jun 2026 22:04:01 -0700 (PDT)
Received: from ?IPV6:2a02:a466:4d7a:0:c439:8cdb:ad2:c0fb? (2a02-a466-4d7a-0-c439-8cdb-ad2-c0fb.fixed6.kpn.net. [2a02:a466:4d7a:0:c439:8cdb:ad2:c0fb])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6915a637180sm421874a12.26.2026.06.05.22.03.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 22:04:00 -0700 (PDT)
Message-ID: <26da1dfa-3408-4654-9046-36ed6d57059c@pardini.net>
Date: Sat, 6 Jun 2026 07:03:59 +0200
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
Content-Language: en-US
From: Ricardo Pardini <ricardo@pardini.net>
In-Reply-To: <b7cc8eba-ff6e-417d-8e74-b3bb24e08a26@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_220404_225041_B7A6ADD8 
X-CRM114-Status: GOOD (  15.62  )
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

On 05/06/2026 17:48, Heiner Kallweit wrote:
> On 05.06.2026 13:49, Ricardo Pardini via B4 Relay wrote:
>> From: Ricardo Pardini <ricardo@pardini.net>
>>
>> Add a binding for fixed/soldered Realtek PCIe Ethernet controllers
>> driven by the r8169 driver (RTL8125/8126/8127/8168 and variants).
>>
>> The "pciVVVV,DDDD" compatibles are the Open Firmware PCI Bus Binding
>> spelling, auto-derived from PCI-SIG vendor/device IDs, but they still
>> need a binding when used in a board DT - analogous to "usbVVVV,PPPP"
>> compatibles documented in their own bindings (e.g. microchip,lan95xx)
>> so board DTs attaching properties (fixed MAC, nvmem cell, ...) to
>> these PCI function nodes can be validated.
>>
> 
> The of node seems to be created by of_pci_make_dev_node(). But this
> function is called for bridges only in pci_bus_add_device().
> So where is the node created in your case? Did you test node creation?
> 

Hi Heiner,

Seems to me of_pci_make_dev_node() is not at play here - that's the 
DT-synthesis path. For nodes already present in DT, the of_node is bound 
earlier, during pci_setup_device() -> pci_set_of_node() -> 
of_pci_find_child_device() via the 5-cell reg.

Ref testing: yes; with this series on a NanoPC-T6 I get, for example:
/sys/bus/pci/devices/0004:41:00.0/of_node -> 
/sys/firmware/devicetree/base/pcie@fe190000/pcie@0,0/ethernet@0,0 and 
u-boot correctly adds local-mac-address property there which is 
correctly picked up kernel-side:

=> setenv eth1addr 8e:b4:90:66:66:66
=> boot

...

# readlink -f /sys/bus/pci/devices/0004:41:00.0/of_node
/sys/firmware/devicetree/base/pcie@fe190000/pcie@0,0/ethernet@0,0

# xxd /sys/bus/pci/devices/0004:41:00.0/of_node/local-mac-address
00000000: 8eb4 9066 6666                           ...fff

# ip link show dev end1 | grep ether
     link/ether 8e:b4:90:66:66:66 brd ff:ff:ff:ff:ff:ff


>> +properties:
>> +  compatible:
>> +    enum:
>> +      - pci10ec,8125  # RTL8125 2.5GbE
>> +      - pci10ec,8126  # RTL8126 5GbE
>> +      - pci10ec,8127  # RTL8127
>> +      - pci10ec,8161  # RTL8168 variant
>> +      - pci10ec,8162  # RTL8168 variant
>> +      - pci10ec,8168  # RTL8168/8111 GbE
> 
> This list reflects just some of the PCI id's handled by r8169.
> Any specific reason for this exact selection?
I went for "chips likely to be soldered down on an SBC", but that was 
indeed speculative.

I guess I should trim to pci10ec,8125, which is all this series 
describes? (further IDs can be added by the patches that introduce 
boards using them)

--
Regards,
Ricardo


