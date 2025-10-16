Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7CACCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 09:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJKQOGchk4SDAuSAD4L7zp8YmKd2Wu9IefruSuf0v0k=; b=aZAKkhEC5pqU3I/cPqVB+tf93b
	24+BpFQwSBU8+C+YYHjdJzCZwDqKALkuF/umzJ4cnKahwhdh8/ubDENu9YqNwSYWb8n+DIXeIUPxI
	qTV2+y79uNdu6CfYRlu/1nsyDCop0aw0kw7KXpO8Z0nvFMYiEKTQyw9ehDYGk75G1GCIMSYLBYT7K
	hVALt5qeN156Rui5qb+rL6MRcf0MnCbSTE9ZW7SFtT+rbq+WNJ6HOaNeTfhGDLRrl9mI5ykljg9lJ
	pPGb0X44ATx+OCKIZmSzHMK3fLnwbS5WO4j61QqvKbAjH581EZLSFbM2RJBd8Bvc1BaKicVto1Mjr
	teSYXWkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9KIZ-00000004BrW-4825;
	Thu, 16 Oct 2025 09:29:28 +0000
Received: from mx01.omp.ru ([90.154.21.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9KIX-00000004BoN-1vhQ;
	Thu, 16 Oct 2025 09:29:26 +0000
Received: from [192.168.2.104] (213.87.135.100) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Thu, 16 Oct
 2025 12:29:05 +0300
Message-ID: <b0a06d38-74ea-4454-8b84-80f70442b8df@omp.ru>
Date: Thu, 16 Oct 2025 12:29:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [PATCH] pinctrl: rockchip: fix NULL ptr deref in
 rockchip_pinctrl_parse_groups()
To: Linus Walleij <linus.walleij@linaro.org>
CC: Heiko Stuebner <heiko@sntech.de>, <linux-gpio@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-rockchip@lists.infradead.org>
References: <179c9e8c-8760-41e6-aad7-7a128df60984@omp.ru>
 <CACRpkdbzEmZN=-FPvax4z_iq7u6pHyHGJ213QtpxqFL98-Ou5Q@mail.gmail.com>
Content-Language: en-US
Organization: Open Mobile Platform
In-Reply-To: <CACRpkdbzEmZN=-FPvax4z_iq7u6pHyHGJ213QtpxqFL98-Ou5Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [213.87.135.100]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 10/16/2025 09:13:52
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 19
X-KSE-AntiSpam-Info: Lua profiles 197127 [Oct 16 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.11
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 71 0.3.71
 ee78c3da48e828d2b9b16d6d0b31328b8b240a3c
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_arrow_text}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 213.87.135.100 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 213.87.135.100 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info: omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: {Tracking_ip_hunter}
X-KSE-AntiSpam-Info: {Tracking_References_header_contains_several_msgids}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.135.100
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 19
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 10/16/2025 09:16:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 10/16/2025 4:29:00 AM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_022925_507963_36679FB8 
X-CRM114-Status: UNSURE (   9.17  )
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

On 9/8/25 3:59 PM, Linus Walleij wrote:
[...]

>> In the Rockchip driver, rockchip_pinctrl_parse_groups() assumes that the
>> "rockchip,pins" property will always be present in the DT node it parses
>> and so doesn't check the result of of_get_property() for NULL. If the DT
>> passed to the kernel happens to have such property missing, then we will
>> get a kernel oops when the pointer is dereferenced in the *for* loop just
>> a few lines after the call.  I think it's better to play safe by checking
>> the list variable for NULL (and reporting error if so), like we check the
>> size variable for validity further down...
>>
>> Found by Linux Verification Center (linuxtesting.org) with the Svace static
>> analysis tool.
>>
>> Fixes: d3e5116119bd ("pinctrl: add pinctrl driver for Rockchip SoCs")
>> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
> Patch applied!

   Where? I'm not seeing it in any Linus' tree... :-/

> Yours,
> Linus Walleij

MBR, Sergey


