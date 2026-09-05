Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5A9C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 16:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=McZeKmb8S8b/EC01Rk3flMGccUxy2bR+WNWnXJHZ6iI=; b=oz00fmETWs2kd97X+djDrSlEiq
	MLctQqte6gOWN2+feodSemKIsws8IDmk4FgU8IKi/tng1A4LMZDIeFDvp4fftJg7oJxTPbGvX5JSz
	bCdZUjlTZXBxQ+dYotrJeqjxbAK4x6JrV+AK38YSbNmMkmOAIFD340cqkb4nt3bGA6HxQeZVCyvl2
	zflX03YU99CJIEA7+nEthjsegFlgTD8v870LCHlVaxEOzUjyPXtxSkCxi2v0hi9rc/ykmpzmw+xCu
	J8tVqpsVbUUWy5yz6yaofa5+WddpWXkxGz6rxYrNyMsuNoXsyl6WxHwg2HzjtB5vEVobhx9oUo5bI
	C5aRHcIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2t8Q-00000004FoA-0DRn;
	Sat, 05 Sep 2026 16:20:54 +0000
Received: from ms.lwn.net ([2600:3c01:e000:3a1::42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2t8N-00000004Fnq-2NDq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 16:20:52 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2BC38408FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1788625246; bh=McZeKmb8S8b/EC01Rk3flMGccUxy2bR+WNWnXJHZ6iI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bUAoDXsdmYjhQ1V6sI70RhBEPUxCMVFN6mewCFcVJeyG7A/+u2qfYBxoH7asY6VfX
	 um+dCoRUF3bO4UoWaAAEvUtoS8SpEFi24ATL/58iyj82oF4wSoEH2lksYAutczozDM
	 JHDNKg0BH3s/Xx46Jl8YSXDQE7DKj7MvKvOKI3cdLTrCot2NniSV0Z1dRsNKO3cFJO
	 oVfy0VBdIrB//r2zOd6OJIj8w1hJXhOjF1ew/LB0n0aPwY4LvlyBWfVwzxl2LVmRN4
	 s/Wq1x85OD6YJPnXRQIMiuA9dMtwgx4Ro959cZSs9xLNr37TWo/mtJUR1dO2uXTZto
	 XIorzXF6YXxbw==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2BC38408FF;
	Sat,  5 Sep 2026 16:20:46 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Borislav Petkov <bp@alien8.de>, Karl Mehltretter <kmehltretter@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org,
 linux-doc@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, Randy
 Dunlap <rdunlap@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Steve Wahl <steve.wahl@hpe.com>, Dimitri Sivanich
 <dimitri.sivanich@hpe.com>, Mike Travis <mike.travis@hpe.com>, Tony Luck
 <tony.luck@intel.com>, linux-edac@vger.kernel.org, Krzysztof Kozlowski
 <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Tony Lindgren <tony@atomide.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-omap@vger.kernel.org, Dominik Brodowski
 <linux@dominikbrodowski.net>, Damien Le Moal <dlemoal@kernel.org>, Niklas
 Cassel <cassel@kernel.org>, linux-ide@vger.kernel.org, Ethan Nelson-Moore
 <enelsonmoore@gmail.com>, Michael Schmitz <schmitzmic@gmail.com>, Andreas
 Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH v2 3/9] docs: kernel-parameters: Drop the edac_report=
 entry
In-Reply-To: <20260905153336.GBapw2UFa7Sdc0ve_A@fat_crate.local>
References: <20260905094649.41996-1-kmehltretter@gmail.com>
 <20260905094649.41996-4-kmehltretter@gmail.com>
 <20260905151345.GAapwxqT93wPWHF7u4@fat_crate.local>
 <apwzmSr6b0WEkW86@gmail.com>
 <20260905153336.GBapw2UFa7Sdc0ve_A@fat_crate.local>
Date: Sat, 05 Sep 2026 10:20:45 -0600
Message-ID: <871pb7zn36.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_092051_609362_2F4E0AF8 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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

Borislav Petkov <bp@alien8.de> writes:

> On Sat, Sep 05, 2026 at 05:22:33PM +0200, Karl Mehltretter wrote:
>> Good catch! I will send a v3.
>
> Just don't send it immediately but wait a couple of days to gather review
> feedback first.

I would like to emphasize this - slow down a bit and maybe you won't
overwhelm the system entirely.

Thanks,

jon

