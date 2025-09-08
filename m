Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A715CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/2CCwIzjqLQqY7DIoO/AOOHSykrEgWWjGr2uC6CkQgo=; b=fwMykRT4XL409TxaLlFMS4zUgC
	S00C800yWYZwB8+pJHn6uQPgq9sTachNVFs8WuAdO7BKw/io4/r7VM2Az45UpeD9Ya35vzVirhFM9
	MeCgo0LnsHKCYQOyJsP0DKWbyvXez4HKEMxD+t80V13/VZl3P9Il7Usp9zX3xUYhFXGdG9Lkn10kp
	cK8aaya4X1NdQ1K37rSAelTyKg5B55QnpqaXXkUxc3B4ju8im45IweCO1i/XUne9T6pRSiF/wvyOf
	sYVQkxTnsLhTuKJweSrE4dvZp6oy+Es0kMSaDl4GvfJXpJaLohQ9KghCCzCOBWgtbd+KwwU4xHqL/
	iUNLg6vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfXf-00000001APq-1dre;
	Mon, 08 Sep 2025 17:20:35 +0000
Received: from [90.154.21.10] (helo=mx01.omp.ru)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvcys-000000009Rp-1imH;
	Mon, 08 Sep 2025 14:36:32 +0000
Received: from [192.168.2.102] (213.87.154.55) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Mon, 8 Sep
 2025 17:36:13 +0300
Message-ID: <6cb84280-9290-4cf1-91cf-ccece1a0bb27@omp.ru>
Date: Mon, 8 Sep 2025 17:36:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: rockchip: fix NULL ptr deref in
 rockchip_pinctrl_parse_groups()
To: <wens@kernel.org>, Heiko Stuebner <heiko@sntech.de>
CC: Linus Walleij <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-rockchip@lists.infradead.org>
References: <179c9e8c-8760-41e6-aad7-7a128df60984@omp.ru>
 <6789547.RUnXabflUD@phil>
 <CAGb2v67ihFehEwSc-rX=U-KJdvao_588G8iVEoSXuJ_-gnd50w@mail.gmail.com>
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
In-Reply-To: <CAGb2v67ihFehEwSc-rX=U-KJdvao_588G8iVEoSXuJ_-gnd50w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [213.87.154.55]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 09/08/2025 14:22:47
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 19
X-KSE-AntiSpam-Info: Lua profiles 196099 [Sep 08 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.11
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 66 0.3.66
 fc5dda3b6b70d34b3701db39319eece2aeb510fb
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 213.87.154.55 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: {Tracking_ip_hunter}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.154.55
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 19
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 09/08/2025 14:26:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 9/8/2025 12:29:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_073630_455204_D5FE26E4 
X-CRM114-Status: GOOD (  10.52  )
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

On 9/8/25 8:53 AM, Chen-Yu Tsai wrote:
[...]

>> Am Mittwoch, 3. September 2025, 21:48:54 Mitteleuropäische Sommerzeit schrieb Sergey Shtylyov:
>>> In the Rockchip driver, rockchip_pinctrl_parse_groups() assumes that the
>>> "rockchip,pins" property will always be present in the DT node it parses
>>> and so doesn't check the result of of_get_property() for NULL. If the DT
>>> passed to the kernel happens to have such property missing, then we will
>>> get a kernel oops when the pointer is dereferenced in the *for* loop just
>>> a few lines after the call.  I think it's better to play safe by checking
>>> the list variable for NULL (and reporting error if so), like we check the
>>> size variable for validity further down...
>>>
>>> Found by Linux Verification Center (linuxtesting.org) with the Svace static
>>> analysis tool.
>>>
>>> Fixes: d3e5116119bd ("pinctrl: add pinctrl driver for Rockchip SoCs")
>>> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>>
>> Assuming that the DT is our friend, really is a bad assumption :-) .
> 
> If this is invalid, perhaps you should make the "rockchip,pins" property
> required in the binding?

   Looking at Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
in 5.10.y, it was marked as required. The modern YAML bindings don't seem to
say that, at least explicitly...

[...]

MBR, Sergey


