Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E0DC98311
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 18:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uksp8NEMMONI77zNPQYkgJlajaAnPtQHDaqlgAf0/EA=; b=hO7hnTmtUSdCx2AbYslT5w91Ma
	z+7KxmyuPVgz9oQKJoq1dtuxQ4CxjKtjECcWF8aqAISHbMMKWcFx3BELUf9/Xmv5Fr97nu7sHr0Tj
	K3JSp/fjk05uvpdJ1Ruz0GyNMRQodQ5uyamTBDADYHcssntv3Y6TyRgO7dPyH9F+MQ4fPpCJGzARt
	v2WhXtHKLvYTH91kkS1yBx6YbgCj0UAUKg7mF5SY12hIQhkN9LDZwexQDodZb4j+s74cy7pm/JJYd
	vG0ywDL3te+r+qmMw+TYkcs0zwSRrt4kuccrVKkkuyTtiUiz5nOAKQ42ObnwIWs6O+CZ1KgaUF9f4
	KbS1YcgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9RvU-00000009Fcz-3U8f;
	Wed, 23 Sep 2026 18:42:40 +0000
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9RvR-00000009Fbj-0qOc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 18:42:38 +0000
Received: by mail-ed2-x10.google.com with SMTP id 4fb4d7f45d1cf-6a9adea43b6so1848373a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 11:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pardini.net; s=google; t=1790188955; x=1790793755; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uksp8NEMMONI77zNPQYkgJlajaAnPtQHDaqlgAf0/EA=;
        b=EjzjAhF94ToCJEs5I3SzHWZhIAYdPeGZwmj7BOz/OjGONMshKc/FROU/VVhxVQnZ5E
         vyDss0lAkQn4sjEG9qk9mRHkx0RKine6fB/VnHrwDh1lBcubhxqN71AWDtgeXUpNdJaQ
         lpLpQW6RRcapxBL6ZV/qKdKso4dfrwNDIcCg5cw/wdrC8E2wiyFF/Mfi3zIMkhyzE0v1
         FC1ApTE9qwGNTP79SHmDhH59/QfQXvN4Va1eK271P2uargrzROV0EXWtw7rgaSVCe/5H
         D4irG3HCOGAew3a4biQ99nWfmaQniCtY140eZzzhUiPgBwD6sbfVePRDBqjRx/WJZioE
         d7xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790188955; x=1790793755;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uksp8NEMMONI77zNPQYkgJlajaAnPtQHDaqlgAf0/EA=;
        b=x3GwFI63smlwcGpfLfIbpeYHhOVBZ09uiV9YzEd+dQ3e6BMGlrag8SsYVgS5sAhu5+
         fqxRG5pyWvrTNKaxwKSiF5pJ92GRvZioWtjXy4tBBjFldf4KPqvchmbSB81yh/2TnxZL
         jBlrykK/+g0rn+fsWPAVjP1iK41oX/rDuIZNrQ62H2ltjkljdVtJHXT8LyUG7xaahzWq
         KOdYoNPVbFGhmMBP2daib3ZTuUXcNrtnarabmUsvQY93MBPmw3bBle8ETGEOLCcjnZWd
         pwT7j7fpQNb+sRM9/258BAFrGG0DR6ei8kkABp22UtAjAfm4gwVYQMMlVJ/veVR7NNqv
         S2eQ==
X-Forwarded-Encrypted: i=1; AKwUvByKJEokJ5vMFW0fnzqN/jfPdoGRwm+umX0NkxulD6jelifBBDcwLMmseIa1XLB3RNMxGoKKuvCUpqPqpBlCtYYF@lists.infradead.org
X-Gm-Message-State: AFuF++lsR7x+iF1KQoSF6/347zTw3nh5ensxhbDtOmIW1Ls5OVgo/r2h
	RsWYzehYob3Pgjl3JJAuPG6SC+kyFgUf6bNfmmMucwif8K3LlN6ka8JcrfnbZ7FbKQ==
X-Gm-Gg: AYBFou2BvuVBGRMFtiO+TJzIJUHdZJ1ssWlwevrPjeaRP1qOsmDwtQbKoN2Ks6ITBGZ
	Iz81NEAn95KlQdnCscOjBXzJPYQG+XjNXnV35jBftu8+wcAuhBdUNK/C+6PMMCbImAbT7qBTzOy
	DzZ66HDadC308XRhviREWFupsP+J/ZKMiZL7HL6JJsoTtQLtwO+sUnqTiOT/mq3dmKfIdGEiH0G
	iyMN8etcILDDc9tda1r4M59d7+KI2NtUDN2OPiyjUa/7zxeTPRexiIPo+bVyn5MpfGU8bGYeNAW
	LGjeDNOWe5o0Q8sJI8NK+BrlXD03kn+8Q4Wk/oqwtKVDSOCjKa0Lg23qsvmj95Aul0e4/LHxhAX
	NmXnf9KRPLEULNklMsriDks6nLqgiUxHl6pRAI1q9Hh3trKWK4IwxSIYovkLkToSUGuYHNOUXxC
	iWEHrEeUgCYR8m2nG6Lfsp6sN1EZeEZJan5N+5Mt1jmmJQflYM2FqI4Wbnc+oG/fkiNonOjThXs
	tHBGJ7NWxExuJotPWRqBLEBCrMxtKbrePtKg9kH979o0Oj9SFJ65LnDWdjkh2+HYZXzwkR+95dC
	XearBJ0b82Z3qJtwJK3NFblqjBFtQS6eWiuzZZVl64ioCA==
X-Received: by 2002:a05:6402:13ce:b0:6aa:c767:ab47 with SMTP id 4fb4d7f45d1cf-6aac90b04ebmr66607a12.35.1790188955272;
        Wed, 23 Sep 2026 11:42:35 -0700 (PDT)
Received: from ?IPV6:2a02:a466:4d7a:0:1072:bb1c:c0f3:280f? (2a02-a466-4d7a-0-1072-bb1c-c0f3-280f.fixed6.kpn.net. [2a02:a466:4d7a:0:1072:bb1c:c0f3:280f])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab37eaab7sm2367557a12.4.2026.09.23.11.42.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 11:42:34 -0700 (PDT)
Message-ID: <e166f6e2-05b3-4f36-a1c3-b75861618c75@pardini.net>
Date: Wed, 23 Sep 2026 20:42:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] describe RTL8125 PCIe NICs on Rockchip boards (and
 add DT binding)
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, nic_swsd@realtek.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-0-c1b9e5f10cd6@pardini.net>
 <CAMuHMdXMjxgj+pT5A=jd_A5BVQctHXJqeiU4EhPA_ZSANZAAmQ@mail.gmail.com>
Content-Language: en-US
From: Ricardo Pardini <ricardo@pardini.net>
In-Reply-To: <CAMuHMdXMjxgj+pT5A=jd_A5BVQctHXJqeiU4EhPA_ZSANZAAmQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_114237_250016_9F15AD80 
X-CRM114-Status: GOOD (  21.61  )
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

On 22/09/2026 11:17, Geert Uytterhoeven wrote:
> Hi Ricardo,
> 
> On Thu, 10 Sept 2026 at 22:08, Ricardo Pardini via B4 Relay
> <devnull+ricardo.pardini.net@kernel.org> wrote:
>> Several Rockchip rk35xx boards carry on-board Realtek RTL8125 2.5GbE
>> NICs whose PCI function nodes are not described in the DT. Describing
>> them allows for stable ethernetN aliases (matching the GMAC alias
>> convention on these boards) and lets U-Boot's fdt_fixup_ethernet()
>> inject mac-address properties from its ethaddr/ethNaddr env, so MACs
>> stay stable across boots and U-Boot and kernel MAC match.
>>
>> Tested on a NanoPC-T6: /sys/bus/pci/devices/0004:41:00.0/of_node ->
>> /sys/firmware/devicetree/base/pcie@fe190000/pcie@0,0/ethernet@0,0 and
>> u-boot correctly adds local-mac-address property there which is
>> correctly picked up kernel-side:
> 
> Have you tested this at 2.5Gbps? With which firmware?
> I am asking because I have problems at 2.5Gbps using the firmware from
> linux-firmware (on a different platform, though)
> https://lore.kernel.org/CAMuHMdXPAeHoeaQbM9rXbXukoMbFV+0k28n6sRMw8XF8720WUA@mail.gmail.com

Hi Geert, yes, the RTL8125's on those boards work at 2.5gbps just fine 
(both with and without the fixed-function nodes in this series). They do 
get quite warm at 2.5gbps. I'm using one of those el-cheapo 8-port 
2.5gbps switches.

Currently:

[    3.254450] r8169 0002:21:00.0 eth0: RTL8125B, 8e:b4:90:97:32:30, XID 
641, IRQ 124
...
[   10.480872] r8169 0002:21:00.0 end0: Link is Up - 2.5Gbps/Full - flow 
control rx/tx

# sensors r8169_2_2100:00-mdio-0
r8169_2_2100:00-mdio-0
Adapter: MDIO adapter
temp1:        +52.0°C  (high = +120.0°C)

I'm using whatever is in Armbian's armbian-firmware package:

# ethtool -i end0 | grep -i firmware
firmware-version: rtl8125b-2_0.0.2 07/13/20

# sha256sum /lib/firmware/rtl_nic/rtl8125b-2.fw
529bf1c25c97ff52b401090d00ff89cc22351012336e5a0c9662728a3ee909ef 
/lib/firmware/rtl_nic/rtl8125b-2.fw


mvg,
Ricardo

> 
> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds


