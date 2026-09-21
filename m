Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B5A3C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 00:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bMAwtCxGCGY6D0JArwPVVoRyTsw+poPi/tmNRvMJqUI=; b=mUZtsfbkoTqnYD+ydMejgzjDP4
	zi8psT0S0Qiy4S9YYplmnau7IlHKZm3MX13Y64gI6CyVViBfQvVyKxsyshk8Gdcuqmf6owJpANHaf
	i2ympOE5vxjeHdwAS8jWZTmjatu0vvqNFxRsRMU/z+eI4fvmo20LQ9+1idly7UivoeaFJuuDsBLxJ
	jtDuHbaS+KvXrhRHGu/EzhVmBcZaGdtjmlc0QzPiHbRorSXmDGZRxdgvKbbwLx7ihkZjMWcbTVzDu
	As/ctiM74unlTbCFtmCg8MMuMwvtNjqn0nT2w3c6CPEgOJ8slUWdT74rd+My0EcfpNkRqXJfA0XNC
	azxuQ6Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8RnU-00000000cz0-42On;
	Mon, 21 Sep 2026 00:22:16 +0000
Received: from mail-oo2-x06.google.com ([2607:f8b0:4864:31::6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8RnS-00000000cyC-3WOx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 00:22:16 +0000
Received: by mail-oo2-x06.google.com with SMTP id 006d021491bc7-6aafac56856so1182980eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 17:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789950134; x=1790554934; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bMAwtCxGCGY6D0JArwPVVoRyTsw+poPi/tmNRvMJqUI=;
        b=UcXnEOlon45zqYAvqQDzBUKJGtS+BtcaWaqcMLj7MtV4p7mc8m14XF55m7hgF9ZCST
         uavNIDPlU5YmTUEBpLpsKrx8Mv6BTdIENb4zC5IhREbgQ9j2C2AbMaRouBCWwM1bFcK4
         URl5X7HtLRKyhusxvkR0+RSaOrLcKMA0EQKlIaEBsneDh7KHu3n2cC6lxTUi8M4N3TdR
         mp97gYN/kDAim4yw8JXXW4sDnDvsFaiNRKICuCLhumcK45wJsnJdHpc6dqHKfHQ4bOZt
         Ka7mnE6LL75gNM+C/rU+kXbWxO+QF9LI81e7r3GfmU7Niytjqnv6rTxobu9Y4NeV2aOa
         g+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789950134; x=1790554934;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bMAwtCxGCGY6D0JArwPVVoRyTsw+poPi/tmNRvMJqUI=;
        b=XxplGgQzdGgYCe+jeE3pBPV9zmVqXWotCDuWSH6F0f57KBVa+1+GBAjnULgBmbLNiK
         H2goW0gnQKl36vPT3Vb7brY+7xovXcsBJracMcHBfGIXcu3TSnn1Tsv7gHDmEOqO/2il
         EeFd35THk0s3AOzvijues0736bfU7qxYDTUT+Qj5mfpXv130+nO4bHVJxGMttQse+rAY
         hCewr+o9FGgmSG8t4DQNIdwIRkrljtoKZCjVFsC5YUyQBHFGmhh2dJu9vkI35XURLbrn
         HLgEdFa98TTFfiYrJ/3g8JIK0G6ZXuNoyVFnB0H9KiWoRqeRT6kmNDPJIBC7TrrzDhis
         4l+w==
X-Forwarded-Encrypted: i=1; AKwUvBzBvj+ffeBEHMaNz2wLJTbZkOjypbKRrsIJh0UpIGosM7w3tzPtKGj3PIgIpVqBRwguVxkrgY2CcXcr3ybh69oL@lists.infradead.org
X-Gm-Message-State: AFuF++mn5HajLAM7E+/bvNHFkuP7shyuP5jkIc8uxeXnGCkw7hjdDmZD
	tQa1+BXxjj4fjeQ3gudYU4r6h2x/zOpwZkI2dyzqSRyiAmrti5V43dfN
X-Gm-Gg: AYBFou2ErrHz0y3cWqwIMMLww7Lu/GL+HqA+u8MjV6BhdZ8NH7/nItH9qGgUVeuFoj/
	t7frwBHuic4gyOGX2SaEYsntDAnJcM3+wzUT0uXHlGk5Y/s6piwL9zsmherPir20cBTeW6hyqqq
	TtY7ktgYJ8mYkYZWgITGWcpLyR2Igb86pr+r/TUWQg1dGuZPTfZ7xZ9552Ul5G04RYKeePDNa1i
	xbEZk4pppgIpSsLBPo06ql1FO0cKt+V2RupBfYWzwGEWzX7BD0KcwfuF3I7dckEvHvJU97PE6pR
	qZAb4ou86JxQUwZW6e665gBoqL99BPbLo9LytolI4xLjGQNKQB5RUEnRk/CdL7dp4OGGhbYaGK7
	Nrn/urVUyo6K796YHHIKgXJUi6t/m0jTCk82rUE7dhjfVg+x7Jlu7g94oIyQzaH+q3gp7W5rh3R
	5FnIAi9Y6AKN6ysXrceb0abExpBRFoWcfpv7YAvzr32gOYjEdsRuSKl50aVql2LFTFWB5OtIRPz
	PMenHVGCOyITUE=
X-Received: by 2002:a05:6820:1f04:b0:6c2:1018:3f7 with SMTP id 006d021491bc7-6ca9aa4245emr7824820eaf.23.1789950133885;
        Sun, 20 Sep 2026 17:22:13 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::2620? ([2600:8804:5716:d800::2620])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6cd34b3101esm7471632eaf.6.2026.09.20.17.22.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 17:22:12 -0700 (PDT)
Message-ID: <41503126-2f2b-4ac9-bb9a-610686be4729@gmail.com>
Date: Sun, 20 Sep 2026 19:22:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] iio: adc: add mt6397 PMIC AUXADC support
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 mfd@lists.linux.dev, Roman Vivchar <rva333@protonmail.com>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-0-c00edacbee64@gmail.com>
 <20260921001702.3a208780@jic23-hlaptop>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20260921001702.3a208780@jic23-hlaptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_172214_926215_88ABFFA7 
X-CRM114-Status: GOOD (  13.12  )
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

On 9/20/26 6:17 PM, Jonathan Cameron wrote:
> On Sun, 20 Sep 2026 00:31:50 -0500
> Ryan Brue <ryanbrue.dev@gmail.com> wrote:
>
>> The MediaTek mt6397 PMIC has a 10-bit AUXADC that nothing in-tree can
>> reach. On boards built around it that ADC is the only path to the battery:
>> the SoC's AUXADC is wired to board thermistors, and the charger ICs these
>> boards use have no ADC at all, so without it there is no pack voltage and
>> no state of charge.
> Hi Ryan,
>
> Please slow down between new versions.  Unless a maintainer is specifically
> asking for a quick turn around (sometimes happen very late in a series) at
> least a week is typical time to allow multiple reviews to come in
> and hence save on effort all round.
>
> Jonathan
Hi Jonathan,

Got it, thanks for being patient with me while I'm learning the kernel 
workflow. I'm sure you guys get a lot of newcomers not knowing the ins 
and outs. Won't happen again.

Best regards,
Ryan Brue

