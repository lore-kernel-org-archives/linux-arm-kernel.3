Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D813CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 12:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/80zP38mWdJMadcaJPkmsc5KzpcVmRoyY7SEGcJC15U=; b=P1Ev3TXTtav91oF5ghzDqdSivq
	R7btS8gLQmSJ8LPlecYi+yNLta3z/Yo+jW8oPinqxk1eKocuogPtxaQI/ZDJgAxArmLYzdDo5QfxG
	gGds0MGRQtBRdwfUeJiscDtJCRACvcNCeqGaoFHzWqzLa+dIDBImHhqpP/lj+JqeDvLMUjYWX7HWC
	nNydglauIoiSIgysb61Nuj1LJcWhb7JsyuAwIsAq+jT5RLdxczGWOJhtyExoCyxi8BlPtWrrfPAIS
	pSp9AOmLYFIyocaOUp8e61nuKVfezY9ETGos68j/iQm2BwxSKqKmnaw7olkL82Tl71ii0zx6xxwMA
	9gI2pmjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v66s1-00000001z8w-0Jfg;
	Tue, 07 Oct 2025 12:32:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v66rz-00000001z8q-2WCm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 12:32:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D67826037B;
	Tue,  7 Oct 2025 12:32:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9C46C4CEF1;
	Tue,  7 Oct 2025 12:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759840362;
	bh=0OpRn6dVGYhKpaq+pw5bY3T5BROlnRo3ya60xdbIv1g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ulr4Amvs9BVUzN63T0gy0h03ZNTNmR1cjsz6JrsOwRrZMWM4UlY4bcqFnyN1j6Abh
	 g/lA6SACo7MzXea3SWubaWldh8GV5F1S3Wi4+M883+WUHc5MyDof2fPEMTfOSbNRdP
	 y0D/Gl89PyuU/COavEOfP4f9mxW6HDoG1Wk8wuBtqxf3imPjIejPiCshS+tnUjfW7c
	 msq3jxfzzVXxwp9qQim+H32GscD2ch1RXFufQbXRz4iW+tBhTi/gwngmnxuKQhXsfL
	 1O+zPjUzJdeQ6QBC5BSy9lm/I+PKTQl0f+PXY3rk7HA145XPm8oGYxgkn+jYOLdyyQ
	 WwU2E1Bs2x26w==
Message-ID: <e0632d6e-2e50-4fdd-890d-558cdf18bf2a@kernel.org>
Date: Tue, 7 Oct 2025 13:32:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>,
 Mika Westerberg <westeri@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andy@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <0b402bba-0399-4f93-873e-890a78570ff7@kernel.org>
 <5550fc25-b571-489c-9855-5a9b08822c0e@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <5550fc25-b571-489c-9855-5a9b08822c0e@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 10/6/25 1:19 PM, Mark Brown wrote:
> On Sat, Oct 04, 2025 at 02:31:16PM +0100, Srinivas Kandagatla wrote:
> 
>> Isn't the main issue here is about not using a correct framework around
>> to the gpios that driver uses. ex: the codec usecase that you are
>> refering in this is using gpio to reset the line, instead of using a
>> proper gpio-reset control. same with some of the gpio-muxes. the problem
>> is fixed once such direct users of gpio are move their correct frameworks.
> 
> It's common to have GPIO controls for other things, mutes for example.
Ofcourse, but this aggregation logic which is specific to the use-case
should not live in gpio subsystem which makes the whole solution fragile
and abused.



