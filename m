Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E599DCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 16:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DrfGKIeyY4VV6HtGnp4FKIxytz8xo/bAXQmJCIlvsw8=; b=nU+sZIHJOUV9urTRhdDtX/nrYB
	J/Sd4sRyqAmN8vt9IiQkmX/wtxMyBGpuV8xWVRTa9WJnK3kE9I3XEQdXalNcfusehtPPct4q6zX+7
	ZMYpEB0YQKFP0AIE1fb82g3DayLZHmDN0dKjKbEKUCnJjW7vqmo0Ujc01JWkY8Ny5UaW+lzU9n3Eb
	dWcHTFnRcTMpIOj8F7ZXpblMd7F6VJUJShBWMU1ELZ1jkHl1WE7GSLbuerfXQt0kBJSgfTy9xt1NR
	QdCssNtVNYo4Z3CdsJmJUm/UXaYgJPTM82qqr8twdwX8XLZNK5YJWlsSoHzmvtIxebEmgg7xD7pCh
	nEGUb3rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIuv-0000000Gwf9-3twy;
	Tue, 05 May 2026 16:46:41 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIur-0000000GweH-3loP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 16:46:40 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-7bd5e373d07so49328527b3.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 09:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777999597; x=1778604397; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DrfGKIeyY4VV6HtGnp4FKIxytz8xo/bAXQmJCIlvsw8=;
        b=nCO4As9t6zoyvorRMXUjRjWj3V0iTq3D9ofpWRYZjcgZ2OIEUMVmcvEhuhq8WVC2+W
         Z1deiKUnccU8Ct65SzMJh9UMcV0yLQ3OASD4M9u5anskYG5+IdIB3WuHvPP/oni7qAL4
         ONXDGvI+cwlt4/nfgb+wI4mU5NyTse0q9wNx7Ri37ExrBYQTWg7Cjn7SzKKsIxzLtSQ+
         J5Xo7zQFIPUom10zIVfXIeCOWN4gCqRKhpw8luGETgFdp9bpIlAGa3XunSZZBdU/+eya
         nr3CWR18zalRupzq4PdhWjgfR2hxuQAxgbHx6YFblFMHm9rs+BKTtFnpgweqIGcPQvGZ
         Qj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777999597; x=1778604397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DrfGKIeyY4VV6HtGnp4FKIxytz8xo/bAXQmJCIlvsw8=;
        b=RovC462KwI89UVAk7n2Ep/lmauvOEgDyv0aVgBzsJqyL+hIPJMJZC3H2/g4fqZGmhU
         jJPMz1Pzwr2O90CKKLqjvQr4DPUzutFxDt4X4+XhsgqLdMR1PSHxxjOO41gn/c+IF4mI
         F13BcprRs3rSDee26jjqvqADrkngO5KGHaK/FCePseBet+2zWIikn5orc7mzXYg0eViz
         UQXkbcoASvoc3ttUUQVbWkcKZL5nnTfGYiEw4xLf+WBhKQd8mvLlSeZCMnAgZQEZ05p5
         rxIo6G7PxCV8unqukgPPDTV+A8K8pDQ2c6Zh0LhSK5jN4tmNjRNlRu1vWiLul5vVKB8f
         3TFw==
X-Forwarded-Encrypted: i=1; AFNElJ+zp+m7J6kkJ628DbEckj+1VMNmuG2Ylg3SLpOa3VOrcxOWUUQuWrk204KX0BBJmc55vx8wJPnUfvqCWmouBTHz@lists.infradead.org
X-Gm-Message-State: AOJu0YwNXzh3vhJc/4QMOPSOc5KXSdoqN88umgBYekxqyHYvG9kBqlCO
	melYUsx9IkafO2dj4JwWPB3jNszvbn2ioBgT/9k91hzBf5uTxuUTC9CazN0a1MaFB68=
X-Gm-Gg: AeBDietAQ0wDpQSDodkCPB0jliXtfOEJsmgDqS76W9CdZ00VjkTDCge3jZdVmUu3Hbx
	avBGnXDcSQEAo0IuBrnNVHjHNlEf/ETxxQES+tQK1o99cxvcwwANVNoZ27tsf7w3KBoQ3QjCoHG
	kQUgqEaTReaeLBpY0jCghrEg3C9mgHw9kUlwg5YCAz2V0DYLWyt6iUB/OTq5RVhTGX7QQARUW2n
	cuQFMZzFqIWyI9PHNfGkeNJFAczV6+jPHpaYRuNtEuSjlDVXRcP7S4M1NPyxqCf5y5zeNWCIlk/
	s+8A+0lemtz3crI85gmxWQVYSL79WVoZvfImROFWNcGUG0rery0dGoIulpMqIq1/HSaPYxdDaQG
	xBcuiS5Vgq5HhllmSDWL6647+NvKpG0TQXJTObs5fyr50cyQ2pLIzsUFvA9Eu2OQwUlGoMbbE4Y
	LHK7uw+MH6FoAFYXLMnZvnkWquZd87T8p0eyQAJ4FT0f/QCKIkhZ2imKNTcC/BTK2aJl/cbxYB7
	Q==
X-Received: by 2002:a05:690c:60c4:b0:7bd:8cb2:4fa4 with SMTP id 00721157ae682-7bdac5ffe89mr42184327b3.39.1777999596609;
        Tue, 05 May 2026 09:46:36 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd66558f35sm66666507b3.15.2026.05.05.09.46.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 09:46:36 -0700 (PDT)
Message-ID: <c716efe3-1b60-4a82-8fcf-1928c0233d64@riscstar.com>
Date: Tue, 5 May 2026 11:46:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 12/12] arm64: dts: qcom: qcs6490-rb3gen2: enable
 TC9564 with a single QCS8081 phy
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 Daniel Thompson <daniel@riscstar.com>, a0987203069@gmail.com,
 alexandre.torgue@foss.st.com, ast@kernel.org, boon.khai.ng@altera.com,
 chenchuangyu@xiaomi.com, chenhuacai@kernel.org, daniel@iogearbox.net,
 hawk@kernel.org, hkallweit1@gmail.com, inochiama@gmail.com,
 john.fastabend@gmail.com, julianbraha@gmail.com, livelycarpet87@gmail.com,
 matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-13-elder@riscstar.com>
 <afod8ot7xb+g0wzN@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <afod8ot7xb+g0wzN@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_094637_952661_7DB3DA78 
X-CRM114-Status: GOOD (  13.42  )
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

On 5/5/26 11:42 AM, Mohd Ayaan Anwar wrote:
> Hi Alex,
> On Fri, May 01, 2026 at 10:54:20AM -0500, Alex Elder wrote:
>> From: Daniel Thompson <daniel@riscstar.com>
>>
>> The QCS6490 RB3Gen2 includes a Toshiba TC9564 (a.k.a. Qualcomm QPS615).
>> TC9564 is an twin Ethernet-AVB/TSN bridge with an integrated PCIe switch.
>>
>> There are multiple builds of RB3Gen2 with components included/excluded.
>> That means whether or not there is a phy attached to eMAC0 depends on
>> the exact board. However all versions include a TC9564 combined with a
>> single QCS8081 attached to eMAC1.
>>
>> Add properties to the existing PCI nodes to describe how the TC9564 and
>> QCS8081 are connected to each other (and to the host SoC).
>>
>> (Note: "pci1179,0220" is documented in the "net/toshiba,tc956x-dwmac.yaml"
>> binding, but checkpatch.pl doesn't recognize that.)
>>
>> Co-developed-by: Alex Elder <elder@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> 
> There's a minor typo in the PHY name - QCS8081 instead of QCA8081.

OK, I'll fix that too.  Thanks a lot Ayaan.

					-Alex

> 
> 	Ayaan


