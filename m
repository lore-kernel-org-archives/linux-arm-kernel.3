Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAAAC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RKDnp51m/COvv5+IfZcdloAqKtTMb40rJD0x+eX0ID8=; b=v84s9gRxZamzEGqsRvlFK03HiF
	OrqTUXnXdjJ1aqv7p7yGsOWqkmY03Ms07g8d7XTEc4Q/wc+L/a0KsCk1xFdARhVtHSw1iyXbLnJvM
	AIo9AJQQ/9Y32GSyaJnfJonUdoNMCHXRnBAeuuxnPo/7TQ3vNSgdsx27PF9mRpXJPi0CbHCKN6KCA
	O9MbcJUlXRIbOer5b8yUrUCPQifBaZde6ECaB1GLcAlwyxqfwes8h3tOSx94g1DnIZYreKNJ4UQnS
	YkWTO/ZwU2AojxB2+E4R1eJizCcfwW5KJAHZuPliC3p/GD03rLgBDDsluVA+sMjwKs+bgppyBTzfS
	Zkqt/bIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyWk-0000000EkKU-2iL6;
	Wed, 15 Jul 2026 12:15:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyWj-0000000EkKD-3uLn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 12:15:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6EB5741069
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 12:15:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52C6D1F01559
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 12:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784117749;
	bh=RKDnp51m/COvv5+IfZcdloAqKtTMb40rJD0x+eX0ID8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=obLTZAJfx4lImVTbXUB5pPXY26He5+Fc1vqFYT60SkAVloafptn6VGq/0NyAgC6I8
	 eOo5R4kqG7/jnfzjCv4J+M4pPR9Hm/iyx+axJVj8fnvaJhXzVc1i+zwlDm7j8Y4uKB
	 e841oUHJKarxoxWGINalhaLxsm9umQTT8+oVdOvdXDoNfYk7VYOIIZDgd+mfGpRdWr
	 APscYwaJNokzpfOkJ51g0CFlnwXS89SZjGbTsS9R5VTucmL43q0p9NiJKE5srZMFxj
	 Ni4sXGb/jLcWnswih2SsGxRi/QUF14zMvhcoFyVxKtB/S2nCyC7zLGsjoWhNc/m/eH
	 LscLf7fHjPVWg==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aeb5e85378so5726539e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 05:15:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqDlVY1vkqG5e/W7tou4cSzeXvxeMulZ5EHwhklRhIUEG7cLhjA4s1nP3spHW9mSP1S5yB8bo+5qPWkv2kd616m@lists.infradead.org
X-Gm-Message-State: AOJu0YwmPdwbwfK1sGkFXO6oQcyUVyc9eXAQ9ugOROhLdXBMroAVtnVC
	4QNG9BMH17aTziADfF6xhMw0bI0ycRG9hFS9yC/JreCjeVcE7kDEsJghpj205q72JPZ7Yupl8lN
	OKbIvTjF2+23lZegDbXLHD+MjzqNHBM2v0sxj6XuWrQ==
X-Received: by 2002:a05:6512:668c:20b0:5b0:1aa5:b869 with SMTP id
 2adb3069b0e04-5b159b6bd5bmr813218e87.25.1784117747953; Wed, 15 Jul 2026
 05:15:47 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 05:15:46 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 05:15:46 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <alX3PLGgoKTgSy_-@ashevche-desk.local>
MIME-Version: 1.0
References: <4c67cf0839ccf57db35a826df6d8fc779531509a.1783974733.git.daniel@makrotopia.org>
 <alX3PLGgoKTgSy_-@ashevche-desk.local>
Date: Wed, 15 Jul 2026 05:15:46 -0700
X-Gmail-Original-Message-ID: <CAMRc=MddZtuuZ-dOaCui8ngO4hnZzNZrPj+1Hutoecit9WdCmg@mail.gmail.com>
X-Gm-Features: AUfX_myIhBXpXPOWc6e4XKEkjqdGIsljv9t_WEO6AKgHBeBaw-_g1hKvslbVK7M
Message-ID: <CAMRc=MddZtuuZ-dOaCui8ngO4hnZzNZrPj+1Hutoecit9WdCmg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: tolerate gpio-hogs lacking a hogging state
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Golle <daniel@makrotopia.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Frank Wunderlich <frank-w@public-files.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 14 Jul 2026 10:45:48 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> On Tue, Jul 14, 2026 at 12:30:53AM +0100, Daniel Golle wrote:
>> Commit d1d564ec4992 ("gpio: move hogs into GPIO core") made
>> gpiochip_add_hog() return -EINVAL for hog nodes lacking any of the
>> 'input', 'output-low' or 'output-high' properties. The error is
>> propagated by gpiochip_hog_lines() and fails registration of the
>> whole GPIO chip.
>>
>> The previous OF-specific implementation tolerated such nodes:
>> of_parse_own_gpio() warned "no hogging state specified, bailing out"
>> and of_gpiochip_add_hog() stopped processing the node without failing
>> chip registration.
>>
>> Some boards deliberately ship hog nodes without a hogging state in
>> their base devicetree and supply the state via overlay, e.g. the PCIe
>> slot key selection hogs on the BananaPi R4 Pro added in
>> commit e309fa232d12 ("arm64: dts: mediatek: mt7988a-bpi-r4pro: rework
>> pcie gpio-hog handling"), as the polarity set in the base devicetree
>> could not be overridden from an overlay.
>>
>> Booting such a board without an overlay applied now fails to register
>> the gpiochip. On the BananaPi R4 Pro this means the MT7988A pinctrl
>> device fails to probe, all peripherals including the console UART
>> defer forever, and the board finally hangs when clk_disable_unused()
>> gates the clocks of the UART still in use by earlycon:
>>
>>   gpiochip_add_data_with_key: GPIOs 512..595 (pinctrl_moore) failed to register, -22
>>   mt7988-pinctrl 1001f000.pinctrl: error -EINVAL: Failed to add gpio_chip
>>   ...
>>   clk: Disabling unused clocks
>>   (hangs)
>>
>> Restore the previous behaviour by warning about hog nodes lacking a
>> hogging state and skipping them instead of failing the registration
>> of the whole GPIO chip.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> ...
>
>> -	if (fwnode_property_present(fwnode, "input"))
>> +	if (fwnode_property_present(fwnode, "input")) {
>>  		dflags |= GPIOD_IN;
>> -	else if (fwnode_property_present(fwnode, "output-low"))
>> +	} else if (fwnode_property_present(fwnode, "output-low")) {
>>  		dflags |= GPIOD_OUT_LOW;
>> -	else if (fwnode_property_present(fwnode, "output-high"))
>> +	} else if (fwnode_property_present(fwnode, "output-high")) {
>>  		dflags |= GPIOD_OUT_HIGH;
>
> For a fix I would make it less invasive and yes, break the style, by just
> replacing
>

Nah, this is fine as is, let me queue this and sorry for the trouble, thanks
for spotting and fixing it!

Bart

