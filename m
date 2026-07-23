Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A38C531C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 11:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wdwFVAnarm94CRlFVdAITXHXoMEZm39JJ6RFIFm/OS0=; b=ngcprlMwS5c+254mbbdACfqM5/
	+HeSlNVHlMIRSZUXPJacKVbCzrS2eZvJkgm/9d7ax2aLl0h3ZFmfOZBTKpr4BkcigG+neismFlNM7
	FMCy8AOnrpS+MLFSCFp3v/NBm3QpaTXMkd5fVKBFSZ7tB1GnWKT8PELM40pFoFyune7580ObRRvVl
	JgUJnZi6UkERxoNLGNGJqzz2B6W/cQVMXf19SV6ma7O2eP5b/4scz80AlBUIfOPinAY/YO56+dFX4
	0rWtT95YR2p7uvyYH+XNn/yNRrV2+x944FAmfnOhggrXMy67ai9WFhOnZMasLqa7GFQMb3EMTmq/u
	mNskiKJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmrGC-0000000E7Tj-3IzS;
	Thu, 23 Jul 2026 11:06:40 +0000
Received: from mail.lysator.liu.se ([2001:6b0:17:f0a0::3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmrGA-0000000E7Ss-3AJA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 11:06:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1784804796;
	bh=iB+itzYWCHNZZ3o5cei/xxMrlYhVWL5HBHuf2Di68qk=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=oQyX64B3GRAFB7TjGdy4cgF9vohVHxcYNukFs+Nv0zWF8pp2ZA8BW1/UOy4/K8tC9
	 dvhf1XhAr/QTjz/TIVYv4QXUYDcEdKGdt6j4R3525BLg0neVmJw91pMwx+3ae419UQ
	 eR+/JXIRQgBh1RIfHkhMo4NBjoQGBcnvfiENyk5k8K6ZT2Kcn+VmhQCs1bVVf29U5+
	 cz3Y40u5Kl3n6FtNoaOBujy5gHKjJshHJ4JWJYPQFUqeM+AFgHiXjCAkMqZcLlh0Xt
	 ljPvMYypZIZtGx6s3jMFfICo4pBPSj2d6ZWqpB6fBlS6qhaSWBt+CI3okHkWGLlDbj
	 BPjQ0MY6G/MIg==
Received: from mail.lysator.liu.se (localhost [127.0.0.1])
	by mail.lysator.liu.se (Postfix) with ESMTP id C21CA1BA46
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 13:06:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1784804796;
	bh=iB+itzYWCHNZZ3o5cei/xxMrlYhVWL5HBHuf2Di68qk=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=oQyX64B3GRAFB7TjGdy4cgF9vohVHxcYNukFs+Nv0zWF8pp2ZA8BW1/UOy4/K8tC9
	 dvhf1XhAr/QTjz/TIVYv4QXUYDcEdKGdt6j4R3525BLg0neVmJw91pMwx+3ae419UQ
	 eR+/JXIRQgBh1RIfHkhMo4NBjoQGBcnvfiENyk5k8K6ZT2Kcn+VmhQCs1bVVf29U5+
	 cz3Y40u5Kl3n6FtNoaOBujy5gHKjJshHJ4JWJYPQFUqeM+AFgHiXjCAkMqZcLlh0Xt
	 ljPvMYypZIZtGx6s3jMFfICo4pBPSj2d6ZWqpB6fBlS6qhaSWBt+CI3okHkWGLlDbj
	 BPjQ0MY6G/MIg==
Received: by mail.lysator.liu.se (Postfix, from userid 1004)
	id A38221BAC2; Thu, 23 Jul 2026 13:06:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1784804792;
	bh=iB+itzYWCHNZZ3o5cei/xxMrlYhVWL5HBHuf2Di68qk=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=tL+WPGkBoq1qI5lFkvqLgDrdcBwy+Lr4ZmQpnsOSuzB1Q91fNGVAId+qZBFT9tNK2
	 CSMcgSmC1CtMrkOqFHTLNRLk3iAQmRDEf7aJ3u0ThRlPj+tN+B6voddpasZ1E8tq+q
	 0x5yEnpMzYr0rvbVeK5udzn3yuIjr98Tq2aOOuEEB441uhfTay5BT99jqve2MDsG8x
	 KTxBOXdTuseUteyqB1YYAmoMUso12+ZYk0v19NfTXEDLGf10s4uLtUgAe1Yx3Qmmtz
	 cM4zIkOm3f5Eeolu4zQgxv86Hq5UUQijKTxAXFmqMKV58NGmdJcVAiw5UqVadBLo3A
	 MAOIvC1tdijUA==
Received: from [192.168.2.172] (81-225-28-11-no2391.tbcn.telia.com [81.225.28.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by mail.lysator.liu.se (Postfix) with ESMTPSA id A31751BA45;
	Thu, 23 Jul 2026 13:06:32 +0200 (CEST)
Message-ID: <e0b9cafb-1aae-4ea9-ae9c-ccbcdcf08ff1@lysator.liu.se>
Date: Thu, 23 Jul 2026 13:06:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Peter Rosin <peda@lysator.liu.se>
Subject: Re: [PATCH v12 7/7] docs: i2c: i2c-topology: add section about bus
 speed
To: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260719-i2c-mux-v12-0-a5010d623a57@gmail.com>
 <20260719-i2c-mux-v12-7-a5010d623a57@gmail.com>
Content-Language: en-US, sv-SE
In-Reply-To: <20260719-i2c-mux-v12-7-a5010d623a57@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_040638_959158_B1BC9258 
X-CRM114-Status: GOOD (  32.66  )
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

Hi!

On 2026-07-19 16:59, Marcus Folkesson wrote:
> Describe what needs to be consideraed and taken into account

considered

> when using different bus speeds for different mux channels.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>   Documentation/i2c/i2c-topology.rst | 178 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 178 insertions(+)
> 
> diff --git a/Documentation/i2c/i2c-topology.rst b/Documentation/i2c/i2c-topology.rst
> index 48fce0f7491b..1ee0de6dbcb4 100644
> --- a/Documentation/i2c/i2c-topology.rst
> +++ b/Documentation/i2c/i2c-topology.rst
> @@ -367,6 +367,184 @@ When D1 or D2 are accessed, accesses to D3 and D4 are locked out while
>   accesses to D5 may interleave. When D3 or D4 are accessed, accesses to
>   all other devices are locked out.
>   
> +Bus Speed and I2C Multiplexers
> +================================

Too many equal signs.

> +
> +I2C bus multiplexers allow multiple downstream channels to be exposed
> +as separate I2C adapters which also could set their own bus speed.
> +
> +The multiplexer itself cannot change the bus speed as it uses the upstream
> +clock and data lines to communicate with the downstream devices. The speed
> +is therefore changed in the root adapter resulting in that the whole bus is
> +affected.
> +
> +This increases the complexity of the topology and some considerations must
> +be taken into account.
> +
> +Bus speed
> +----------

Too many dashes.

> +
> +Downstream channels of an I2C multiplexer can only operate at the same or
> +lower bus speed as the upstream bus. This is because the upstream bus may
> +have devices that cannot operate at higher speeds and those will be affected
> +by the speed change.
> +
> +The example below illustrates the problem.
> +The root adapter is operating at 100kHz. D2 can only operate with 100kHz,
> +but D1 can operate at 400kHz. When D1 is selected, the bus speed of the
> +root adapter would have to be set to 400kHz, a speed that D2 may not support.

would have been set

> +
> +This topology is therefore not allowed: ::
> +
> +                          .----------. 400kHz .--------.
> +        .--------. 100kHz |   mux-   |--------| dev D1 |
> +        |  root  |--+-----|  locked  |        '--------'
> +        '--------'  |     |  mux M1  |
> +                    |     '----------'
> +                    |  .--------.
> +                    '--| dev D2 |
> +                       '--------'
> +
> +
> +This topology is allowed: ::
> +
> +                          .----------. 100kHz .--------.
> +        .--------. 400kHz |   mux-   |--------| dev D2 |
> +        |  root  |--+-----|  locked  |        '--------'
> +        '--------'        |  mux M1  |--. 400kHz .--------.
> +                          '----------'  '--------| dev D1 |
> +                                                 '--------'
> +
> +Preferred topology
> +-------------------

Too many dashes.

> +
> +The preferred topology when using different bus speeds is to have the multiplexer

There are many over-long lines in this patch.

> +connected directly to the root adapter without any devices as siblings.
> +By this arrangement, the bus speed can be changed without affecting any other devices
> +and many of the caveats are avoided.
> +
> +Other multiplexers in parallel are still okay as those are locked out during transfers.
> +
> +This is the preferred topology: ::
> +
> +                          .----------. 100kHz .--------.
> +        .--------. 400kHz |   mux-   |--------| dev D2 |
> +        |  root  |--+-----|  locked  |        '--------'
> +        '--------'        |  mux M1  |--. 400kHz .--------.
> +                          '----------'  '--------| dev D1 |
> +                                                 '--------'
> +
> +Locking
> +--------

Too many dashes.

> +
> +If the multiplexer is mux-locked, transfers to D3 may interleave between the
> +select-transfer-deselect to D1 or D2.
> +This results in a situation where the bus speed to D3 may be lower than it
> +is supposed to be. This is usually not a problem.
> +
> +This topology is allowed but some transfers to D3 may be at 100kHz: ::
> +
> +                          .----------. 100kHz .--------.
> +        .--------. 400kHz |   mux-   |--------| dev D1 |
> +        |  root  |--+-----|  locked  |        '--------'
> +        '--------'  |     |  mux M1  |--. 400kHz .--------.
> +                    |     '----------'  '--------| dev D2 |
> +                    |  .--------.                '--------'
> +                    '--| dev D3 |
> +                       '--------'
> +
> +Multiple muxes in series
> +--------------------------

Too many dashes.

> +
> +When multiple muxes are used in series the same rules apply.
> +
> +Transfers to D3 may interleave between select-transfer-deselect to D1, which
> +results in that the bus speed to D2 or D3 will be at 100KHz.
> +
> +Transfers to D2 may interleave between select-transfer-deselect to D1, which
> +results in that the bus speed to D1 may be at 400kHz as the transfer to D2
> +will set the bus speed to before the transfer to D1 starts.

There is a missing word or something? I suggest this:

Transfers to D2 may interleave between select-transfer-deselect to D1,
which may result in a bus speed to D1 at 400kHz as the transfer to D2 may
clobber the bus speed before the transfer to D1 starts.

> +
> +This is probably a bad topology ::
> +
> +                     .----------. 400kHz .----------. 100kHz .--------.
> +    .--------.400kHz |   mux-   |--------|   mux-   |--------| dev D1 |
> +    |  root  |--+----|  locked  | 400kHz |  locked  |        '--------'
> +    '--------'  |    |  mux M1  |--.     |  mux M2  |
> +                |    '----------'  |     '----------'
> +                |  .--------.      |  .--------.
> +                '--| dev D3 |      '--| dev D2 |
> +                   '--------'         '--------'
> +
> +Multiple muxes in parallel
> +----------------------------

Too many dashes.

> +
> +When multiple muxes are used in parallel all access to other muxes are locked out
> +so this is not a problem.
> +
> +If the muxes are mux-locked, access to D3 may still interleave though.
> +
> +In the example below, D3 may not interleave between select-transfer-deselect for D1
> +or D2 as both muxes are parent-locked: ::
> +
> +
> +                   .----------. 100kHz   .--------.
> +                   |  parent- |----------| dev D1 |
> +                .--|  locked  |          '--------'
> +                |  |  mux M1  |
> +                |  '----------'
> +                |      .----------. 400KHz  .--------.
> +    .--------. 400kHz  |  parent- |---------| dev D2 |
> +    |  root  |--+------|  locked  |         '--------'
> +    '--------'  |      |  mux M2  |
> +                |      '----------'
> +                |  .--------.
> +                '--| dev D3 |
> +                   '--------'
> +
> +Idle state
> +-----------

Too many dashes.

> +
> +Muxes have an idle state, which is the state the channels are put into when no channel
> +is active. The state is typically one of the following:
> +
> +- All channels are disconnected
> +- The last selected channel is left as-is
> +- A predefined channel is selected
> +
> +Muxes that support an idle state where all channels are disconnected are preferred when using
> +different bus speeds. Otherwise high bus speeds may "leak" through to devices that
> +may not support that higher speed.
> +
> +Consider the following example: ::
> +
> +                          .----------. 100kHz .--------.
> +        .--------. 400kHz |   mux-   |--------| dev D1 |
> +        |  root  |--+-----|  locked  |        '--------'
> +        '--------'  |     |  mux M1  |--. 400kHz .--------.
> +                    |     '----------'  '--------| dev D2 |
> +                    |  .--------.                '--------'
> +                    '--| dev D3 |
> +                       '--------'
> +
> +If the idle state of M1 is:
> +
> +- All channels disconnected: No problem, D1 and D2 are not affected by communication
> +  to D3.
> +- Last selected channel: Problem if D1 was the last selected channel. High speed
> +  communication to D3 will be "leaked" to D1.
> +- Predefined channel: Problem if the predefined channel is D1. Set predefined channel
> +  to D2 as D2 may handle 400kHz.
> +
> +Supported controllers
> +-----------------------

Too many dashes.

Cheers,
Peter

> +
> +Not all I2C controllers support setting the bus speed dynamically.
> +At the time of writing, the following controllers have support:
> +
> +============================   =============================================
> +i2c-davinci                    Supports dynamic bus speed
> +============================   =============================================
>   
>   Mux type of existing device drivers
>   ===================================
> 


