Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91226C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 09:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y7Wep/Ex4FCqkpNl8itbZHa4HzPYS0ZPyqV7jJZj6mE=; b=dOTABK1jMUtsiNqTgLZJRJxG5x
	J0tIoxFptIMco3C+xtaYPsJmb0Ji/bryPwKXceUGIh2PlOMnjkc1zlV1iK1ySy+Mig3La+NB62Sy0
	wlAPBy0K1ZI/2dOh9R6VzC5oGGQN9B/P7ILM7HWZV4IppU8TbMB6aB41cPmjveofH522nfehIEazw
	NMpa+XHcmyKfx81FShPaBYLmcSsrHCzmMTJgXVHLMZRnP0AtVKQSIeq+PsCMpLeLe89xBYUMU7Pk1
	woMLg/z+Jp210D9IYpL0qUWeu6cxb4SdL9nQh/HJGf/L1t8bstzJgXAalmqQJ6lnNJ9kW7SYs21mA
	pUPSqL5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ilU-0000000HByl-31Rt;
	Mon, 07 Apr 2025 09:27:36 +0000
Received: from mout.web.de ([212.227.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1iiv-0000000HBZ7-3cix
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 09:24:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1744017886; x=1744622686; i=markus.elfring@web.de;
	bh=Y7Wep/Ex4FCqkpNl8itbZHa4HzPYS0ZPyqV7jJZj6mE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ALjTthH5wW0M30q6hXCIj7OJtGa+JU2F6TkjCN/dm7W0ozIiQNLSq8CE6dFBSU7s
	 L+SLuE0uByBzoQEgd0kJJpVjln7qSMZRl6lbzoEeSQ54iOA9ql5kHIHGTqSpyBhws
	 LiCHlcNoieFdxtAhlmIv+CsnL0sOo8bTtay6LMl8U+PbMQSXDnY4huTk0MerGQUL0
	 EFBbG3fjnbHT07FYjBJyNFvqXiXCQeTwDi8PRbtRgOkgOa3TJc3Dwhz9IJy1BAll/
	 azBhmksdGzkaaQTafyW52nIq8QS1Zhnugb8sHeFTtibgwWy77qb26ujlIwUHb79xw
	 mx6YSa+Y3EaXmQrhiA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.4]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MnG2Q-1tKiwE1oKC-00am9q; Mon, 07
 Apr 2025 11:24:46 +0200
Message-ID: <46d19d22-bd7e-4bfb-8cd0-205d6cd55509@web.de>
Date: Mon, 7 Apr 2025 11:24:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Henry Martin <bsdhenrymartin@gmail.com>, linux-pm@vger.kernel.org,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Sudeep Holla
 <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
References: <20250405055447.73925-1-bsdhenrymartin@gmail.com>
Subject: Re: [PATCH] cpufreq: scmi: Fix null-ptr-deref in
 scmi_cpufreq_get_rate()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250405055447.73925-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zrwSZtb72r6Ymls6zRupndXyWr82t7wtXvEnv4NziLlT2xnmKdS
 zc2vwYBwvu3Fw9FUbEUysVQGROZq3g8tYELwiRhJpHansNTw7QoX68obh7R1GCnF89Km5K2
 RsnNTCo+nOui+SC9S5F4XMw7o6WJW4uL0MqqSN0W0XqpKX1UXMFFC8wceJfRYOZm3SsuVrx
 oYGJtZy/8gSCfqE1Kr0Vw==
UI-OutboundReport: notjunk:1;M01:P0:80qe5cnW1V8=;NckIWCSnzH9bSPLAp2QcPrOsMmY
 ipRzMR30Nx1/FOduRWLVuVLas06AEhR21RyMRp6TTM6LBmepA5cepKpyGn6n4aRYilimRAl6J
 Q9qENjJknwyfeTa19pgtE8B0kljVPY3lI6/KvGgPYhtHhuA7cOSDix6/s09IZvDhArLXPpNyH
 MQWoQBk6N9ZC0flAbLoL/2FvY6CPxjEOsIXaQ499/YUUhYT+iJQ8gI8956bE7LZ6XPo4Q9Oa8
 ZkhfD/rfQwPwhosiC6tE8TV/Z6+abm28pC75LUlI+QJe1vJY/a16t3s0iIpckLCkibOuVo2zd
 FJ2ORgwqj52EmopP1E4d2hHq+kWJQ5x5uWeLGr50n8IVxUdyIdbC4qQNnfdjHUTMfJkV9KLsE
 LRjDXI7Z6j7Y05viLVzW6edeIhmgjkjBqdyiJu2Ryyo7kXceA6ckb4JZzhq/dYU0dUmGLY+ho
 ZLQSXMcUZz+5VNE2tu01G8DQKOgh/lZqLwLuwi31X/QIaJ8ct5X7IJx9cW15UNyIqB/g7KOf8
 ywjtVJPgoeClsUjFa0iMFzbMgEFGOmIfy6p9/4Jw3QkQrGhsyN57Pvf1tYLhxGDXuJmodJsVw
 OfUUmMt/OaE81eiXwzkj2fA5Gr/crVonBtGjXTaqS6jmAWQOZMrVfL3xL1alN6QR/aR+u3Alg
 ri35pZPn6YOjaVm700nzB+wac/aJAI6xu4lPPjkagqqgx3PwPPFwYOogacOJz7S13cCSXJwkY
 bXUZ8iuBQfSNKDoJIhl55E1G05LUpAWQ8Qaj/DqalQDJIemQvwNHfu9JgxKiSb23ibCzrTEec
 uYCi9jYO4OY5ZYCtYxx2LgjVbaQGMhLCbEy4xxSdc8qBaD2c4/w9x993v6RkO4Z9VoaYS9qYE
 6HcISyHh1DdnNS8qqKYzfcSrm9fzPind3wpzVUnPDmNiOWl/hX5s7I+gWE/aTdzhG9aXK2y/v
 2tIaXj8h0RkJNME36RVMH9AFjjmDwiH9aEx1bFm+cwn312o/TKNeBheP4EZypef69VJC0E1gY
 wjbWG1MJNwF/glqsQcJG+jmXzVMcqBVLRLZ15ZEMj48OEgWFFbsspCrADwHyIKYMxEEp2dSae
 4Hst70TqNGIweaahd0bGMHa6NyXqOJ/RHYiEVetPWG5gX8BB4SFLVXoHROJ0+elVoGCDhzfMv
 z0VGR5N3j8NA9HJ7XTZ3L30JYGCMHGKiW+G6P9Ln7V4tfRapuvErg9/c9y8BWacOYBkug2drK
 N0FX1pKRqHCWruezIMLqMZsj1i1gXjSaLoIIywy/QPvu8n6DlFPycLGyua8BhmaGz31RVk5vK
 ml4nmSgY0zwSHXdo2X10x8sQ8o+2alUFHJGQmwcPOl7OuI9/E+qO/E2X7eA6Wc7di/WR1FZox
 T/6mhkVfB3euZYBdeH7KNtACPOi52tROhXYPvLEpoCaT5nGgDzewxxOpO1rIbzKGQVSOqgM5D
 GvyR6uyl9emyVu17tXU0gKRhCJ3URlBV/QAp1u4Bp5ZYjJ3ym
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_022458_216724_90BD4C53 
X-CRM114-Status: UNSURE (   3.11  )
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

=E2=80=A6
> Add NULL check after cpufreq_cpu_get_raw() to prevent this issue.

Can any other summary phrase variant become more desirable accordingly?

Regards,
Markus

