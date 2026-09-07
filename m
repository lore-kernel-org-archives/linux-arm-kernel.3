Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93858C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 02:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5VMYlcO8U4/qNmG4mGd0OW5lpBLOv+y4jCjNoS5ouwc=; b=COMocINlXx9VLgVZuABo1Hw9xJ
	EdJV2KupZ3eGT2SNBBT8cW0WQ7AU2/tUpctIDUQGhgoAh+KK206/rmq0mbdQGHg8VyM1Q+f8w09ZO
	vzACAN1Wue+ZobOEECKXQq5mWzggy0XIxlbFoBhmOfayMoSIyLQyCPwg2s5IM5TY2nDQSwUR6nuTB
	fBMiSj53jZykQvI3vrZlXE5Nt+WBVL3KEJ5bPv+0YMFBDFHc6eUE8K5kGGlp1Z5VL3obafWoUjupM
	0pINNoQ4+ttbvH+QfFndJkgFblMJfHPMwHfq9eq4qNq95EnZOmK7VkfhgQB+/oOnQ5W5LmUWIpAVq
	FR2UIsUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Or0-00000005hPb-0AxT;
	Mon, 07 Sep 2026 02:13:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Oqz-00000005hPS-1qae
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 02:13:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2182F60052;
	Mon,  7 Sep 2026 02:13:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1192F1F00A3A;
	Mon,  7 Sep 2026 02:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788747179;
	bh=5VMYlcO8U4/qNmG4mGd0OW5lpBLOv+y4jCjNoS5ouwc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=avklq9QlZnzna0kuF+7ecUEfKfK8yhw/ueb8HBKr7OXDJAKN3wAlNS1Z7gnaLdeEU
	 oSEm4mT8UBEdxi9b2nFR6gfeC4CNwQhHEhTL7S1Zpk08kFh096UX/YoTRAAjIn4/ll
	 49dhumpFDFY1u0unprz8Cy7RDeqb5sro76mnoCNYit5VfNFZwIWYnFfEbP6qQwKnNT
	 tHwBMQ6t+dVyPrGNVcVRune5lCb42DjlGajWKbCqOI/49ABBVgZVpr7u2l7oCuzta1
	 m0fIdBYoTnvy/pETEsNdTxPYLglXihzBmGr0T5SeeSMoJXXTumXaC90rl8GTH/33kk
	 137ScGfZ3pOhg==
Message-ID: <c21aa9cb-0451-4c29-b64b-6bb39d430bb9@kernel.org>
Date: Mon, 7 Sep 2026 11:12:55 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ecard: use module_driver() to avoid repeated boilerplate
 code
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>, Kees Cook <kees@kernel.org>,
 linux-ide@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-serial@vger.kernel.org
Cc: Niklas Cassel <cassel@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <mkp@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
References: <20260906040153.105692-1-enelsonmoore@gmail.com>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20260906040153.105692-1-enelsonmoore@gmail.com>
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

On 9/6/26 13:01, Ethan Nelson-Moore wrote:
> Many Acorn expansion card drivers have module_init and module_exit
> functions that only call ecard_register_driver() and
> ecard_remove_driver(). The module_driver() macro automatically
> generates these functions given the register and unregister functions.
> Switch to it to simplify the code.
> 

Would be nice to have this separated into 4 different patches, one for each
subsystem modified.

Anyway, for the ATA bits,

Acked-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

