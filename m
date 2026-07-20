Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 267D8C4452A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 14:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Tb8wqtR9ryTgh1xvi0oAMEHAbHL0B/dENMN0HrupOs=; b=gVdYqUAUjjAi79q2+B8GFMxyh3
	tvStMuI4OpdA8Ov9U0xB+PWt/PfXrE6LhSPIHDheRWIJNK9/mQ1XrFICaLkq+FSJ9U++pvYKIilNL
	dhM6wDXMeZWs/fsYdAHwCuK4SNRYSvtt3rqyOxVuHvxduNvZqc9UjSuF3T4wck+3M/yjG9x6DNV/a
	TxJR9DGqMULtnhf4XY8nItc7+bnLf0aaf1lvFVh9yfsug81f269VRGgtTJg4hDDJvMxYX2HjGeLir
	Y53otx3sfcA4wQtarUnrTqkF2LwQfdYBL1XbiT5+yuc/3wAnBsBLp/+twE8quMPgjM9FMMcl97f7v
	wp4dEHrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlp5B-00000006zGp-0vaW;
	Mon, 20 Jul 2026 14:35:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlp58-00000006zFa-30pA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 14:35:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 091DA143D;
	Mon, 20 Jul 2026 07:34:53 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 434DC3F99C;
	Mon, 20 Jul 2026 07:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784558097; bh=ZVkkZ18OLSNZOkiVP1mnO/iPf2y1oqZNLduNfGDfsQU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uKnkz66yIGd6UFYKjma27WX+h7RPQeiRRY0BIkl83q7LK9tzwmzAAWB3CpaLYSzSz
	 VAxrUqtdfHOxDU8UxXIgyQsQayXrfIiI6OfEhRpfdwO6iv7Qhs9TT/YU8rXJMUgOSF
	 KUIcW53yHOX72MUF2MwWNytURigfff8YrvkHQEak=
Message-ID: <c4abec80-2f8d-4070-aee4-76152f6f20cc@arm.com>
Date: Mon, 20 Jul 2026 15:34:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] iommu/fsl: use platform_device_set_fwnode()
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: driver-core@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 iommu@lists.linux.dev, netdev@vger.kernel.org, linux-pm@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 mfd@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Will Deacon <will@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Doug Berger <opendmb@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Ulf Hansson <ulfh@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Lee Jones <lee@kernel.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>
References: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
 <20260720-pdev-set-fwnode-instead-of-of-node-v1-3-2dee93f42c54@oss.qualcomm.com>
 <e4f9b266-8d9e-48fe-99c0-58b61e02c9bd@arm.com>
 <CAMRc=MefqCMgVv-o5hWoRwS2iXPQNs5nH2qHiz55+ew162LfSA@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <CAMRc=MefqCMgVv-o5hWoRwS2iXPQNs5nH2qHiz55+ew162LfSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_073458_940111_D3AC1601 
X-CRM114-Status: GOOD (  17.81  )
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

On 20/07/2026 2:39 pm, Bartosz Golaszewski wrote:
> On Mon, 20 Jul 2026 14:58:27 +0200, Robin Murphy <robin.murphy@arm.com> said:
>> On 20/07/2026 10:24 am, Bartosz Golaszewski wrote:
>>> Prefer the higher-level platform_device_set_fwnode() over the
>>> OF-specific platform_device_set_of_node() for dynamically allocated
>>> platform devices.
>>
>> This is very much non-portable code specific to OF-only platforms, but
>> if the intention is to remove platform_device_set_of_node() again
>> already, then FWIW,
>>
> 
> Providing platform_device_set_of_node() and using it was done to make the
> transision to expanding reference counting to all firmware nodes possible.
> I don't think we'll remove it just yet as it doesn't make sense to convert
> the code under drivers/of/ to using the fwnode variant.

OK, but in that case why convert these users either? If the OF helper 
does continue to exist then I'd imagine the static checker brigade will 
eventually end up sending patches to "simplify" these open-coded 
equivalents back to using it. And frankly, if drivers do know for sure 
they're exclusively dealing with of_nodes, rather than doing something 
conditional under an is_of_node() check, then I see little justification 
for them *not* using the dedicated helper.

If the complaint is that there are no *public* users to justify 
exporting platform_device_set_fwnode(), then as I say AFAICS that's much 
more neatly addressed with the static inline approach, such that we 
still get to unify the public APIs, actively eliminate something from 
the symbol table and save a bit of source and object code, but without 
any need to churn the truly OF-based callers at all.

Thanks,
Robin.

> 
>> Acked-by: Robin Murphy <robin.murphy@arm.com>
>>
>> (Although I'm slightly puzzled by the cover letter - AFAICS in -next,
>> platform_device_set_of_node() is itself very much a user of
>> platform_device_set_fwnode(), however in terms of symbol exports,
>> perhaps the former could now just be a static inline wrapper?)
>>
> 
> Sure that can be done independently later.
> 
> Bart


