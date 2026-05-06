Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9387FCD3439
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 22:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cYpEI+XfMfA1fnjJlUUXbcclTkGZqiM6qT8lT03dl1A=; b=gV7c2/4EYx48vPYdez+XEmWg25
	pYGwYnED8A0H2x0iFkOWuRIpToMtgi2kl9Bd02wt8VmWlM68sEOmZtc6op0NSCrdPkvwmr2LJU9cS
	ivbKwYlYUu39wBDqwT2jZn/Q7qh06wjVvitOFmr0IUZgLzA8raNC8TnAppdFI6EJi6Aa67tNa/M2e
	5Oi1m3Nj41T4BkYc85TJjZUPjotvrAzZ2+VbIP/4rHxjbLuxJnPsM9wYLD3jveIlPVLkwuCY9MwDt
	/83sbNABUPmqoIxcdNfdoyKA9fsTzWXdWdw0l6c/q9zE7A+3gjrezpIN7LYWyL10DAQaZ5xbpKMZW
	DVxihNxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKkw7-00000002Di3-3t06;
	Wed, 06 May 2026 22:41:47 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKkw6-00000002DhH-3boJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 22:41:47 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-8ee9ec26edaso26058385a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 15:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778107305; x=1778712105; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cYpEI+XfMfA1fnjJlUUXbcclTkGZqiM6qT8lT03dl1A=;
        b=OVpienrDAgu4LIXsygvgsZzqpgs7H8IHwBHMX3Jx3hCTqakz82kVPbGpdRwsaRZ8KL
         +OuENw1PNdwI+7UbaxGBP9FSQfyrbGYiY4cufYRRe/aJmxhiZDg/PXuUjf+2ZCL7mNDX
         v6Ay67MCNluw5+x4Lmw1BF6dm6Q9+xLcC6L6rjBiJVGx7hnInKJyy5FNWQl6rdIbave9
         FHqF/k5hAhZO5qkQs4igwnGZgch0a9z2+hjz9SWnKJLujwEuTN0Gugu4cJz9Z5yYeJ9w
         1j2HGWAV0Q+oiQwUZGwJZYRO7Q+rW+2gDulIMIzowNEiGK1t5Vv+YQqAkDBXCpPPLHxA
         WQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778107305; x=1778712105;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cYpEI+XfMfA1fnjJlUUXbcclTkGZqiM6qT8lT03dl1A=;
        b=JQDQ7C13KK4FDc822OkMTEweq9/IXtX0gQLesmQpki0xR9rq2fB/NbIS0vCkqHNHkC
         5aY1BG8NCRnTIS6HN5V2kqQtJjG3WH6ejRw4UyxK9l+BlitgH0C/5JkzK0JSIl3oNZQV
         9n3mXxMVtAz9smcutDh888q/qOUVP2IzjUS+6SBlECV4NTGyXDKU811i3bKsiHDlQ23I
         unSd0wplqvCFOiV0bab+VcHX4wyyqkb05C/wlot1mCQGiLLUShh2Meey8I+7Zm6ZVlds
         KryfIdNkv6p++ZX0a61rF7ebKfmQsYLPyaCt9fW7D8imE9ybaZl8ylZbzWZVTv/gGeGB
         +xEQ==
X-Forwarded-Encrypted: i=1; AFNElJ+FXgkRK9HRtRrLGa2A4pqZ15BNzXecZmC9N9Bz6CvoJZo0kBodAMu5p+g/pJexEQBWeiTKAf2w5lj8QsV9FGxO@lists.infradead.org
X-Gm-Message-State: AOJu0YyzPARiIzbIKFR7W+JaW+Ku7tiimHLPc1mbmhvo6LnRMhQO0sL5
	orDGlO3C6jGPbcMRao8PJMIzcdi5F5N9uPb0zTuw7vS1b7XYk9GMiEjY5OrnkohSSQk=
X-Gm-Gg: AeBDieu3ce9V3d8BCX8NMeIwKnUOFJLxtmJLlhNhXsoZd55nfaffZrx7MZozTNV1fZd
	NS9VTdz+NVTwVRr7vJ4xBnRsiztYPuqEyCCkKmFXPProdduUwRONpdkHKCaCdq5ZRWluXpNHzn7
	UC3H3rLGSJ4lTNWTI9snnDTlBuFTtaqJ8c9qBiuuGrZYU6soB2Tn6DKCg6rKDXG9NZZZVgKKDB6
	pfb/yUKwnnAXwfXVGpLZ3hy9LXHnXD7dEnZ9CA5IAGX2+1BYF16mcn1N4zCVyZ8sNVg4k7Q2HRW
	iEe19Cgv/GFJvLxvoErNc6ZGlvLdjXNl9PD+MaqHsk4LEjZIsz+ypIwwPMwwLnZxpuvVakMl8fy
	ll3Q4NjhlqGzW52oYAUyVrodtkA5vpNqvYh8d7QEctelKFs5esA1EXXWdLGO2TXrFNNkAK9SaNv
	5QszK/oGfxWh2tEaDoMTNfS+AbSrcJ7H8tPocz1o2kOyq32mnw821yERFgcAc3fwhpG6m3O390u
	8I++DzcSl+3
X-Received: by 2002:a05:620a:f0c:b0:8f1:9e59:220e with SMTP id af79cd13be357-904d63e7a90mr807845985a.39.1778107305508;
        Wed, 06 May 2026 15:41:45 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2cd06f16sm1787057085a.42.2026.05.06.15.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 15:41:45 -0700 (PDT)
Message-ID: <3e1b1859-2d02-41ce-838e-a0b7f4745d82@riscstar.com>
Date: Wed, 6 May 2026 17:41:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 09/12] gpio: tc956x: add TC956x/QPS615 support
To: Andrew Lunn <andrew@lunn.ch>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 daniel@riscstar.com, mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com,
 alexandre.torgue@foss.st.com, ast@kernel.org, boon.khai.ng@altera.com,
 chenchuangyu@xiaomi.com, chenhuacai@kernel.org, daniel@iogearbox.net,
 hawk@kernel.org, hkallweit1@gmail.com, inochiama@gmail.com,
 john.fastabend@gmail.com, julianbraha@gmail.com, livelycarpet87@gmail.com,
 mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-10-elder@riscstar.com>
 <736fb3b7-c88a-4ec4-96ad-d1b79cc48d30@lunn.ch>
 <30cec7dd-ac3c-47ab-896a-c29992bd5ba5@riscstar.com>
 <3666e3e6-e6f3-4cbf-b9fe-caa394fbab7c@lunn.ch>
 <0751a051-9894-45be-92d6-0d46f2c39293@riscstar.com>
 <7d7b6b89-3ef4-4891-a794-c8b11f39db34@lunn.ch>
 <79684efa-4ba9-4144-a99b-dab935007a2f@riscstar.com>
 <ec5765aa-b830-468b-8965-a95fbe020065@lunn.ch>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <ec5765aa-b830-468b-8965-a95fbe020065@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_154147_025066_535445E5 
X-CRM114-Status: GOOD (  24.83  )
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

On 5/6/26 4:43 PM, Andrew Lunn wrote:
>> To be clear, the reason you're asking is that you're suggesting
>> we might want to model the GPIO controller differently, correct?
> 
> Correct.
> 
>> I.e., model it as *not* associated with the embedded PCIe
>> functions.  Then we need to think about what its parent device
>> would be (the power control device, which I think somehow
>> duplicates the switch device?).
> 
> Logically, the GPIO controller cannot be part of a downstream
> function, if you need to use the GPIO controller to turn the
> downstream function on.

Yes you're right, though the PCIe power controller functions
before the PCIe switch is enabled, and uses I2C to communicate
with the host.

> Logically, the GPIO controller needs to be above the switch downstream
> end points. Where above, i don't know. Which is why i was asking about
> where it appears in the address spaces.

You are touching on an issue we have faced since we started on
this earlier in the year.  Our objective was to enable the eMACs,
but there was no device representing the "chip" (which holds the
switch and the GPIO controller, etc.).  The TC956x is more than
just a PCIe switch, and more than just two Ethernet MACs.  The
vendor code handles some of this between PCIe functions with
some reference counting and perhaps other things.

Eventually we settled on the model we have presented, which
creates a device for each function and lets one of them take
care of common "chip" things (including creating the GPIO
auxiliary device).  The function device driver creates a
new auxiliary device to represent the MAC for each function.

I also considered modeling the TC956x as a remoteproc, but have
been reluctant to really pursue that.

> But i also don't know too much about PCI, i'm used to SoCs with simple
> linear MMIO.

I'm no PCI expert either, but I'm learning.

>  From the little i know, it is more than what address space does the
> GPIO appear in. Its also, what enumerable entity does it appear in
> within the PCI bus. Because its the enumeration which is going to
> trigger a driver load, which can then drive the GPIO controller.
> 
> Or, something more radical, you make the PCIe power controller an MFD,
> instantiating both the power controller and a GPIO controller over the
> I2C bus. GPIO access will not be as fast, but is there anything here
> which needs to be fast?

I considered that, but opted not to mess with the PCIe power controller
driver.

It's only asserting resets in the RB3gen2, so I don't the speed is a
major factor.

					-Alex


> 
>        Andrew


