Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDFACA1016
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 02:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KBZSHyx9apIkaw7ShYo4VJfLB7XMr5QhEj/9f+kzjZI=; b=RgxsFIwoTlnlLFCQsc1CNOL9E7
	DVfSfZNVTg9T7gnL1pai3TdlQG5dU6wTZbON4tLDFSBZM9j8ByKbEbJP1Vl1jwKuo/BxFs+JV7AJD
	CTou3KQN8U+0P7wI6IkfcrVl6hoFjKrShmWw9SEMK7hYieQDLw/a2tB2n25N6ObiRqg6foa71D52a
	3zmWVjLSbtGJVPKwO1OrvMhyFXH0c7rAqzHaTZGPulFxIIXEdi4DuSdz4nHIg0QkiE4EdTakA8MiV
	cADHax9HzcC8QU9jZT7CGXi3cPbSN/939UEogKZzTqG8wH5ub1Lkaucytt4oNbFGVpYfwh0iEzK+E
	fjwTx9Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvo5x-00000003h7G-1Foy;
	Tue, 09 Sep 2025 02:28:33 +0000
Received: from mx01.omp.ru ([90.154.21.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvgqH-00000001dSD-0iOu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 18:43:54 +0000
Received: from [192.168.2.102] (213.87.154.55) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Mon, 8 Sep
 2025 21:43:49 +0300
Message-ID: <d5ba9af3-6e61-4206-9eb0-7d3349807d23@omp.ru>
Date: Mon, 8 Sep 2025 21:43:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: prevent division by 0 in
 stmmac_init_tstamp_counter()
From: Sergey Shtylyov <s.shtylyov@omp.ru>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, <netdev@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
CC: <linux-arm-kernel@lists.infradead.org>
References: <58116e65-1bca-4d87-b165-78989e1aa195@omp.ru>
 <a49cff49-3fe5-417d-8f71-7ec63a68112d@linux.dev>
 <d92071a9-471e-47f3-8dff-069f9dc6f10c@omp.ru>
Content-Language: en-US
Organization: Open Mobile Platform
In-Reply-To: <d92071a9-471e-47f3-8dff-069f9dc6f10c@omp.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [213.87.154.55]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 09/08/2025 18:17:41
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
X-KSE-AntiSpam-Info: omp.ru:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
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
X-KSE-Antiphishing-Bases: 09/08/2025 18:20:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 9/8/2025 5:23:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_114353_213829_C29700F8 
X-CRM114-Status: GOOD (  11.90  )
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

On 9/8/25 9:26 PM, Sergey Shtylyov wrote:
[...]

>>> In stmmac_init_tstamp_counter(), the sec_inc variable is initialized to 0,
>>> and if stmmac_config_sub_second_increment() fails to set it to some non-0
>>
>> How that can happen?
> 
>    Let's see what the commit in my Fixes tag said about the problem it fixed:
> 
> ---
> When building with -Wsometimes-uninitialized, Clang warns:
> 
> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:495:3: warning: variable 'ns' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:495:3: warning: variable 'ns' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:532:3: warning: variable 'ns' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:532:3: warning: variable 'ns' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:741:3: warning: variable 'sec_inc' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:741:3: warning: variable 'sec_inc' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
> 
> Clang is concerned with the use of stmmac_do_void_callback (which
> stmmac_get_timestamp and stmmac_config_sub_second_increment wrap),
> as it may fail to initialize these values if the if condition was ever
> false (meaning the callbacks don't exist). It's not wrong because the
> callbacks (get_timestamp and config_sub_second_increment respectively)
> are the ones that initialize the variables. While it's unlikely that the
> callbacks are ever going to disappear and make that condition false, we
> can easily avoid this warning by zero initialize the variables.
> ---
> 
>    I think the original commit was just somewhat incomplete, as (adding 0-
> initializer into picture) it missed to add checking of sec_inc for 0 before
> invoking do_div()...

   Oops, it was div_u64()! :-)

MBR, Sergey


