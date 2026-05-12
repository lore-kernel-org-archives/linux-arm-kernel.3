Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DDECD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 13:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4qZUPICcL2SqDibVA/1E3uKAtRLts6kMoCRLGyFkOb4=; b=I8R2YGotzb1QokvyeYcAjX2dD6
	UWtWhMwSPibuOLnrCrlveubKL1hiU4fdH6mLHBBw2MEpeBSOziK+C84W5yEKgQu3W9UHFth54341s
	wEJNhB51vcCU19cTnJ94EMM2M6sm+NDovW1yuAPDiTgIMIg8AqWzEKs2h+0bHEq75cPLuWCmIx9Cu
	9lQJ8/RpCVz0mXaUO8dJx+ES7lkqKkPJ9nxHCi67GbQFSxEDwJkQmfqGCzR4vAus9dbvw6bSndtGu
	6F4f62znp4VXSYWYwGvITZ5wa8uGRKveaojBXP5lS4wgxDo4fO6UQcSkDpd6908Hu6IdxH11LypUv
	aooJ4VFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnd1-0000000Gve6-1sji;
	Tue, 12 May 2026 13:58:31 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMncy-0000000Gvcx-2Q4X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 13:58:30 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-479dc6d26e3so3154640b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 06:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778594307; x=1779199107; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4qZUPICcL2SqDibVA/1E3uKAtRLts6kMoCRLGyFkOb4=;
        b=boPD2Ojf+Y+g2r6UY3ybsbpnjyTnMfQ0bWU9idVqMWoJf2mxd1MuGt97oTmPI0prGB
         q0vS/wRTFIXCGledB+Ysbcg4tfAh5YelkwvEsi2qG+c9KZPailphv/sjMgvuVJYIcvLy
         cFIGMY3sFnKSNLtp/DI1pDwyrAuf1yXA9+5jcP11pl9doIcKztfkISEJb/vTC1yMR67o
         /SMgkLhGler876aLCnh7L2z2LQCRl+geHvtvE1PcSTGBy2Ztu/d/cxmaC3+pt/bkWtQm
         WUcZfPjbuTc0xEddSt7YAG2DCP5bUm+13NF/8g/Ztk+v5aXU/BWJS95C7iGQGO83GMvO
         vhMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778594307; x=1779199107;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4qZUPICcL2SqDibVA/1E3uKAtRLts6kMoCRLGyFkOb4=;
        b=gTjvk3kVxJbtAe7waya111IcYzaUqwFnAD57PLfQF1cJFC8v6/E0QhZpL3hULhscdN
         bt8hwckVMtXITaORTjZZu8HxYYqEEqEK6W5hfLI8or7VpZYKPs55ftAs+K7xjYag5YoQ
         vNbr+IB+FmQ3bMoNubawSNGCijdIQc8MmQxifTEzkQaCiw1fTQSkJyIBNZGOg6Q/uncy
         tAJoafMPOondrjcwiFqf6ijzFZ3MOFtbq5MnROCFotIIs9nPGgQGVTG0Txule96dFHzw
         iDXZt40+3g8tPYhr4uLFxbHKafv/irNXhSPW8AFYjhdbOGcjkDH6BrAwhYGCARBHt499
         0aOw==
X-Forwarded-Encrypted: i=1; AFNElJ9y4Bhs+yJvyX1AzG+s1P2d6vnueIvR7pQl3ny+K/0Tl3RhKUENoSjfufoFEWIioCQDs2xC0zzUK9/FiTwiWxSU@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0cEfG80ol7yoxnP6MYErwS1q3YVDOfiawRWcdyy/QJEjUs0Ys
	klkz/t3IsM9NWZEeY44xXeLWJCvtBBzkjG/FURuTBCi9ikb9xdn4UuMKsUwh/IVuiMo=
X-Gm-Gg: Acq92OHSMKVmRTw8VBYlEaRt0ACZfOY84bA3FlNIaAVmy2Zo1UD4vlnMwJx7pbNPtSn
	Frl6B2Zj471LRwe1IjnUB6E5gWRYLM0sr/SQHFDyX+lMLtE/GHdOiLyis4MhEvB2yeKsWmk4en1
	I7q3euOuwsE5MU4OzxFFPKlLudzmiynOr/f8Ens9ZlWjI4fyO+xnHgErq9qhGNh8Qghiu8Ih0gh
	JAZVXPjcVvLAVJ77CksPc+OaBAwKUrFKm9gQfrTY/LL3dtTDI6Db04Z+2Qn3UbdJ8yl5HfYLsif
	uF2eVY0x24H9Qw/FX5N5d/eJnwM093y/lplmMPs2gUSLXwUKrOHjSbpq/nTbXI/uU0G2bQvXUNS
	B0RJ4tOWLyj2IZPMZ+ej7zCcZDKETuo8lbciqtZCyu0/F/7aaIGfh6U3Pg51xkHl2oRv7IP0msf
	Kdz+GZLzSvhHEfU4MxnaKxXlLE5t+/D5wHFK8dcswacvStVumlEbqlYpk6ROYDpHVcWfOjZzHGr
	g==
X-Received: by 2002:a05:6808:508b:b0:467:23e2:5097 with SMTP id 5614622812f47-480424a4bc1mr18863086b6e.37.1778594307354;
        Tue, 12 May 2026 06:58:27 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:baa4:f7fb:528a:2457? ([2600:8803:e7e4:500:baa4:f7fb:528a:2457])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-47c763b33c1sm22558261b6e.1.2026.05.12.06.58.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 06:58:26 -0700 (PDT)
Message-ID: <a4ecfb27-5ef4-4682-b87c-24917f81b4f0@baylibre.com>
Date: Tue, 12 May 2026 08:58:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: iio: adc: Convert xilinx-xadc bindings to
 YAML schema
To: Rob Herring <robh@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Pramod Maurya <pramod.nexgen@gmail.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260510083219.70224-1-pramod.nexgen@gmail.com>
 <20260510120141.118057-1-pramod.nexgen@gmail.com>
 <20260511171554.6541042b@jic23-huawei>
 <7baf9ca5-50ff-4131-995b-70ee094ed247@baylibre.com>
 <CAL_JsqLxtWLR+jxRXt7Uz6dcF-90NYmfyGWYQk9um9TYHSWbTw@mail.gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <CAL_JsqLxtWLR+jxRXt7Uz6dcF-90NYmfyGWYQk9um9TYHSWbTw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_065828_882861_403F17F8 
X-CRM114-Status: GOOD (  16.31  )
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

On 5/12/26 7:14 AM, Rob Herring wrote:
> On Mon, May 11, 2026 at 11:24 AM David Lechner <dlechner@baylibre.com> wrote:
>>
>> On 5/11/26 11:15 AM, Jonathan Cameron wrote:
>>> On Sun, 10 May 2026 08:01:36 -0400
>>> Pramod Maurya <pramod.nexgen@gmail.com> wrote:
>>>
>>>> Convert the Xilinx XADC and UltraScale System Monitor device tree binding
>>>> from the legacy plain-text format to a YAML schema, enabling automated
>>>> validation with dt-schema.
>>>>
>>>> The new binding covers the same hardware and compatible strings:
>>>>   - xlnx,zynq-xadc-1.00.a (ZYNQ hardmacro)
>>>>   - xlnx,axi-xadc-1.00.a  (AXI softmacro)
>>>>   - xlnx,system-management-wiz-1.3 (UltraScale System Management Wizard)
>>>>
>>>> Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
>>> Hi Pramod,
>>>
>>> Something went wrong with your sending of v3. I have two versions sent
>>> half a day apart and no idea how they are related.
>>>
>>> Anyhow one of them got feedback from Rob's bot so I'll assume we are
>>> getting a v4 and wait for that.
>>>
>>> Jonathan
>>
>> I think Rob will have to fix the bot to make an exception for the
>> legacy bindings. This should have been called out in the commit message
>> as requested in a previous revision.
> 
> The bot is not the problem. It just runs validation. The schemas will
> have to either drop this check (comma's in nodenames) or exclude just
> this property.
> 
> 
> Rob

Even though this is an existing text-based schema that has been around
for 12 years with this name already? Changing it could be a breaking
change to existing users. Although there aren't any in any .dts in the
kernel source.

