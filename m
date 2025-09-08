Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A16ACAC58C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=40U/JwkNhbsZHZiHuydqGbPDLeGHS8HCU5gpBRM8kIw=; b=tuAq1WFw8RvVoX197BSByd7GbQ
	1rdiG5F94cktpg4KgP378zVUhwOa8NAmYfG/xXNQkciwari8T+YRO8Fknlwxd0wBnuIJOu3sR8jIb
	oxibzfS7Erzdk7UVxfXDwX6WhTpyeKWV3TGmcgYtbnplGcKUhyEYkMveLFo4C/m8rhgSu2RA8h2nt
	MZNGoNJ1swFdewxUB2FZbB1ASlIcXRB+OJWAHQkz6dNZbtJIBDYrN+KA8KDXzPJrHrzXx/Q/TFkkP
	sSOckSybNNJPvgOIer1yKlc79nQw3GKeD01qR9OcRE4nA+wwyDOuUk3BGd9JMuKyEsuR+tkQv2TrS
	PgEcvPQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsBS-00000004oYT-1Es5;
	Tue, 09 Sep 2025 06:50:30 +0000
Received: from mx01.omp.ru ([90.154.21.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvhiL-00000001wrz-3zgv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 19:39:47 +0000
Received: from [192.168.2.102] (213.87.154.55) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Mon, 8 Sep
 2025 22:39:36 +0300
Message-ID: <877641ca-aadb-4510-9ed7-cc23cf666653@omp.ru>
Date: Mon, 8 Sep 2025 22:39:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: prevent division by 0 in
 stmmac_init_tstamp_counter()
To: Andrew Lunn <andrew@lunn.ch>
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	<netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <58116e65-1bca-4d87-b165-78989e1aa195@omp.ru>
 <c3183a23-21da-435d-b599-7003ae7ba79b@lunn.ch>
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
In-Reply-To: <c3183a23-21da-435d-b599-7003ae7ba79b@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [213.87.154.55]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 09/08/2025 18:59:50
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 196103 [Sep 08 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.11
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 66 0.3.66
 fc5dda3b6b70d34b3701db39319eece2aeb510fb
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: omp.ru:7.1.1;127.0.0.199:7.1.2;www.kernel.org:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: {Tracking_ip_hunter}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.154.55
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 09/08/2025 19:03:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 9/8/2025 5:23:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_123945_994680_A7ADBF76 
X-CRM114-Status: GOOD (  20.56  )
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

On 9/8/25 7:47 PM, Andrew Lunn wrote:

>> In stmmac_init_tstamp_counter(), the sec_inc variable is initialized to 0,
>> and if stmmac_config_sub_second_increment() fails to set it to some non-0
>> value, the following div_u64() call would cause a kernel oops (because of
>> the divide error exception).  Let's check sec_inc for 0 before dividing by
>> it and just return -EINVAL if so...
>>
>> Found by Linux Verification Center (linuxtesting.org) with the Svace static
>> analysis tool.
>>
>> Fixes: df103170854e ("net: stmmac: Avoid sometimes uninitialized Clang warnings")
>> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>>
>> ---
>> The patch is against the master branch of Linus Torvalds' linux.git repo.
> 
> Wrong tree. Please see:
> 
> https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

   Well, formerly being a reviewer for the Renesas drivers (before Greg KH
threw me out of MAINTAINERS last year), I kinda know this! :-)
   The real problem is that I've lost the ability to pull from git.kernel.org
(first using git:// protocol and later using https:// as well)... Sometimes
the ability used to return (along with Facebook/LinkedIn -- which are actually
blocked in .ru) but that hasn't happened for more than a week now. I can now
pull from Linus' tree at github. I strongly suspect some interaction between
the .ru blocking and the Anubis program that is now used on git.kernel.org --
I've also lost access to lore.kernel.org (sometimes it works -- but not now)
and also elixir.bootlin.com, both of which seem to use the darn Anubis as
well... :-(

> This also needs reviewing by somebody who know the STMMAC
> hardware. There is a comment:
> 
> 	/* For GMAC3.x, 4.x versions, in "fine adjustement mode" set sub-second
                                               ^ Look, a typo! :-)

> 	 * increment to twice the number of nanoseconds of a clock cycle.
> 	 * The calculation of the default_addend value by the caller will set it
> 	 * to mid-range = 2^31 when the remainder of this division is zero,
> 	 * which will make the accumulator overflow once every 2 ptp_clock
> 	 * cycles, adding twice the number of nanoseconds of a clock cycle :
> 	 * 2000000000ULL / ptp_clock.
> 
> So i'm wondering if the subsecond adjustment is sufficient, the
> sec_inc might be zero, and rather than returning an error, the
> hardware just needs programming differently?

   Sorry, I don't readily see how the data var in config_sub_second_increment()
can wrap to 0. I agree that a look of a more knowledgeable person would be good
though... :-)

>     Andrew

[...]

MBR, Sergey


