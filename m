Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9E8CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 06:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G/pspHAOG8bM/eVN42fbNVCl71EeErqhE9ZBZ4j/TXY=; b=Z0dm9/aMa45zex1IwW7XEbX1a1
	LnrbyY3bgZLxjdKZ+I0k1tA18+HgAyIeGcriJwdMToE5/Iax9ImcROagQAAfDT6AdRauuS+wJ3TeU
	c9D0UiPKez15SzOQwcd8KbP0q+0+AlduKuiMLj2M3L097ckZ97psh+guJXIyIcDVIRTVXAH9MyN29
	EdAG4snmMiItrxOkLTc5cSXWXSnvgBw5z5GaOmqbHE4W40j2OtKfHjWxQ+oyvMsPZ4jkTGSnZf3xm
	/BENE+Ihi8OHIksH/AYjmHUM/OfdoF61gn4saZg6Bab3uRVMZTw2iP0h92IaVNPdU3waI1sb3n2W0
	q6brRV+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTDbC-00000008Us0-38yd;
	Sat, 30 May 2026 06:55:10 +0000
Received: from mail.lysator.liu.se ([130.236.254.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTDb8-00000008Ura-49Yv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 06:55:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1780124100;
	bh=VZFuFh7AcIhBfBW691fSrA8ioZDjxFI473ZYQP5DxLA=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=uvaR19CTpfg61dUMRgyESFWEiE8UFoNgDOVgR/8Iwgzx5kl6Oeg9rrxgnTYlSPM3w
	 DBplsUEb8EVhEcjJ8wNGlKYQlwSC4Pj34GxFCYXypKVf7nlyROqramHTtXlJsEz2Oe
	 GZ3AjKrjDEl8RMsn8lpnZzapknK3y2DVJx88MdAzVdPns1C6OauQudKYMyWVe5dqUR
	 3AiYbJtUKEa1hL4J28Six+snfTo0kqXX/Hf6Gq+a0KYI5NxEQ6cDtjRc6FWiJd8D8r
	 dkWli41iSSfYL5VcsCnSoYigm8jxXlSj9l93QNqwvWIogWlKf6cWTvCVWyp+nLsrT+
	 i6giRDQm3x7Rg==
Received: from mail.lysator.liu.se (localhost [127.0.0.1])
	by mail.lysator.liu.se (Postfix) with ESMTP id F03CCE26F
	for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 08:54:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1780124099;
	bh=VZFuFh7AcIhBfBW691fSrA8ioZDjxFI473ZYQP5DxLA=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=HCK3fv32O5g7L1x9HKrIg7HVMWUqDtq2uP0uS4v3fiITLZ8qIebcCubvZYkjKfOoR
	 ZmC0+qeaaEe28J2CMkmr0v5udxlckMLpXHiQm6cwzZYYgTL95/Nb25Bd/yeuc1UpHN
	 B36AyJV/cmAabUdnQBWhx1tqZodZco4fFpNo7vuRbp0RV3HfrWAdVkiGMIkqfIuGZE
	 u1t2KCf04ldP3sWQfwWFWA3ulMTCxk+uazId+A1cqCFdpUQF+QPPI8LYO/7QP4d7mi
	 aUkwS6XJsLLKW/B8EjIyYhqXlstZG7IFDCvKcayReXGutYcEEB/iKRD4mysf73w46x
	 uDZr+8pDbWmWw==
Received: by mail.lysator.liu.se (Postfix, from userid 1004)
	id C52B5E2DF; Sat, 30 May 2026 08:54:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1780124093;
	bh=VZFuFh7AcIhBfBW691fSrA8ioZDjxFI473ZYQP5DxLA=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=AGzQV5J5yV2XTtNXt05MMVmqAE5jfejNZMi4PYyCillCvaj/A6ehca3Eu4zSwexPq
	 UgHD0Jo5l3KBD/mhqn1oFyiPmabe6Ai9g0zJxwn+QFVQzv+CtjN45IMUFW8Kg5dXZz
	 RBkcI/E3ODxuUagVVJATMc47ysPj2XwTiIOYBpHhsuWN6S4dMA2wuDHrpdtFqoplVY
	 Vr4eHjG5V3lyn0sq3krh5IV18ZEmZQfYvVWYPH1AxUzF5+UN/vw98bGscX+0QH7w3w
	 YOGz3dkEOfvbm1pmEm+Zi3IEU9Vq+r2OwMMQCjTWQeM9xYiyHTRmX2RTuXthDJU9Fr
	 /OhJc0LcwQ/EA==
Received: from [192.168.2.172] (81-225-28-11-no2391.tbcn.telia.com [81.225.28.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by mail.lysator.liu.se (Postfix) with ESMTPSA id 83030E268;
	Sat, 30 May 2026 08:54:52 +0200 (CEST)
Message-ID: <776cefab-fa6c-4092-8b95-236a3eaac729@lysator.liu.se>
Date: Sat, 30 May 2026 08:54:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Peter Rosin <peda@lysator.liu.se>
Subject: Re: [PATCH v9 5/5] docs: i2c: i2c-topology: add section about bus
 speed
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260324-i2c-mux-v9-0-5292b0608243@gmail.com>
 <20260324-i2c-mux-v9-5-5292b0608243@gmail.com> <ahX4_WaqodYt3PmD@shikoro>
Content-Language: en-US, sv-SE
In-Reply-To: <ahX4_WaqodYt3PmD@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_235507_684517_F547FCF4 
X-CRM114-Status: GOOD (  23.53  )
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

Hi all,

First off, sorry for being so incredibly slow in getting to this
series.

On 2026-05-26 21:48, Wolfram Sang wrote:
> 
>> +Multiple muxes in series
>> +--------------------------
>> +
>> +When multiple muxes are used in series the same rules applies.
>> +
>> +Transfers to D3 may interleave between select-transfer-deselect to D1, which
>> +results that the bus speed to D2 or D3 will be at 100KHz.
>> +
>> +Transfers to D2 may interleave between select-transfer-deselect to D1, which
>> +results in that the bus speed to D1 may be at 400kHz as the transfer to D2
>> +will set the bus speed to before the transfer to D1 starts.
>> +
>> +This is probably a bad topology ::
> 
> In documentation, we probably shouldn't say "probably" ;)

What makes the topology bad is D2. Without that device, it should
be OK. So, the question is which is more important?
1. protect ignorant system designers from creating a topology
    that includes problematic devices like D2
2. allow multi-level mux-locked muxes with variable bus-speed at all

Checking the rules at run-time feels complicated to me, as devices
may come and go. Also, naming people "ignorant" over a mistake such
as the above in 1 is perhaps not all that fair. But, it feels sad
to disallow things that in fact do work.

>> +
>> +                     .----------. 400kHz .----------. 100kHz .--------.
>> +    .--------.400kHz |   mux-   |--------|   mux-   |--------| dev D1 |
>> +    |  root  |--+----|  locked  | 400kHz |  locked  |        '--------'
>> +    '--------'  |    |  mux M1  |--.     |  mux M2  |
>> +                |    '----------'  |     '----------'
>> +                |  .--------.      |  .--------.
>> +                '--| dev D3 |      '--| dev D2 |
>> +                   '--------'         '--------'
> 
> 400kHz leaking to a 100kHz device is bad. I guess we cannot do much
> about it here because the bus speed is a board specific parameter...
> 
>> +Idle state
>> +-----------
>> +
>> +Muxes have an idle state, which is the state the channels are put into when no channel
>> +is active. The state is typically one of the following:
>> +
>> +- All channels are disconnected
>> +- The last selected channel is left as-is
>> +- A predefined channel is selected
>> +
>> +Muxes that support an idle state where all channels are disconnected are preferred when using
>> +different bus speeds. Otherwise high bus speeds may "leak" through to devices that
>> +may not support that higher speed.
>> +
>> +Consider the following example: ::
>> +
>> +                          .----------. 100kHz .--------.
>> +        .--------. 400kHz |   mux-   |--------| dev D1 |
>> +        |  root  |--+-----|  locked  |        '--------'
>> +        '--------'  |     |  mux M1  |--. 400kHz .--------.
>> +                    |     '----------'  '--------| dev D2 |
>> +                    |  .--------.                '--------'
>> +                    '--| dev D3 |
>> +                       '--------'
>> +
>> +If the idle state of M1 is:
>> +
>> +- All channels disconnected: No problem, D1 and D2 are not affected by communication
>> +  to D3.
>> +- Last selected channel: Problem if D1 was the last selected channel. High speed
>> +  communication to D3 will be "leaked" to D1.
>> +- Predefined channel: Problem if the predefined channel D1. Set predefined channel
>> +  to D2 as D2 may handle 400kHz.
> 
> ... unlike here. We have MUX_IDLE_AS_IS and MUX_IDLE_DISCONNECT defined
> already. And I'd think we should only allow bus speed switching for
> MUX_IDLE_DISCONNECT to avoid out-of-spec scenarios. Opinions?

It is probably not unwise to disallow MUX_IDLE_AS_IS in this context,
at least until someone actually needs it. Which does not seem all that
likely?

However, it seems like it should be fairly OK to allow a predefined
idle channel, as long as that channel is not lowering the bus speed
compared to the parent. But maybe supporting that can also wait for
an actual user?

>> +Supported controllers
>> +-----------------------
>> +
>> +Not all I2C controllers support setting the bus speed dynamically.
>> +At the time of writing, the following controllers have support:
>> +
>> +============================   =============================================
>> +i2c-davinci                    Supports dynamic bus speed
>> +============================   =============================================
> 
> This paragaph is easy to get outdated. We can document that only
> controller drivers with the callback function implemented will work.
> People then can find out if that applies for their driver...

There are other such hard-to-maintain lists elsewhere in the text.
Not saying that this makes neither those nor this list a good idea,
but it is an explanation for adding one more.

Cheers,
Peter

> There are some grammar correction in the Sashiko-review[1]. Most of them
> look correct to me. Can you have a look at these, too, please?
> 
> [1] https://sashiko.dev/#/patchset/20260324-i2c-mux-v9-0-5292b0608243%40gmail.com


