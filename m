Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E34C5F9937D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 12:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LZ6eAskc0SjvK0cbtp0eTdGWooXU74WxP4QkBVjTPwI=; b=MHZ3wFQ4gkzglXOJ4Pr1KHitrQ
	rZ1VsQrX1vXT9EARVyZuZIgO8reaRwVI2ggVwx8YxLQwzu7dc4H1lh7tOKxNWAkUa9+/sdjBFw/i1
	2EQhP3HkWAvpmBcrlOmLdILdflg4kql5WMY1shqTDbXgr4l6+Ry4Vepu+7gAFg2eWs/Xj6x4HSzlH
	LpXcgHggBE0SSvwINgs8OywUxHPkN82aRyxCeaeXDDtO0ByhEKfE2HWL/CI7ZeRWCK/2FqJPbZ5MG
	+Q5O/zB3eZjsQsCG0y7V0SWsKqzVSPizs1v/cADjHwZmFUKt9+Q5TTL6bmDMJy8lDCGUPBoGql1hl
	Teh3JA2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFsn2-0000000Ba5M-2RWX;
	Thu, 23 Apr 2026 12:04:16 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFsmw-0000000Ba4y-1peD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 12:04:15 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4g1ZWW6cZVz9tcZ;
	Thu, 23 Apr 2026 14:04:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776945848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LZ6eAskc0SjvK0cbtp0eTdGWooXU74WxP4QkBVjTPwI=;
	b=vc22Ys8mO4lCpBbBJzWUZaYex6UVwP0T6b38CxYAUBXBy1ycKBsVEUcLQfjzQoFjIlaSA4
	NVyUCDNyn1agESjGVb6DGnkKVYYuVNJLRAAgdDPx0LBMksqpwD2iRgBcZ4Xy8vZT9nbmDD
	hvipyUkdNLwoiN6iUAxVROSnekzwM0cYD9fnerQvePRv/EHJX1MBNraw5vek7o0GWT+vK+
	h89kAtrdLgNKwxCA93NYsx0K8p4fhCDeN/pFaXa4ZA1pyiZsUi1e1sD5WgiTzYyWim3g5G
	kIqQqPKy7Tv3VjqNyLXXa5reis0mRBdzt4pORY8ie/0Wle9J+eKZB+vOfmePXg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=kAdSidQZ;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <c9ef9d73-6f1b-42ea-b5f0-09fcf904c78e@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776945844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LZ6eAskc0SjvK0cbtp0eTdGWooXU74WxP4QkBVjTPwI=;
	b=kAdSidQZWvcnIbb1jopdE6erSur+0eBatbUmq3GW3hrZTPo6OjuZfWqX2XEHQqOb6usqUa
	/MD4TaQxDGGLZaJqRT5DP89hYeLTjiKNoUf+CbT8TxUuOtOhpnlw3/WscfsmZ7USxl5ZKm
	XJsEI/2+5de+AWkHF3GdgJzQ1JZLAbYjbYNQiQdQmVa0L8oMSxjNdAzMODbvXGIqnao+MF
	Wfwyun1ZJT4S9DI5I9J+oKFJO2KNGi4CNdjx0QyYa5+9e92xKBuGrU6rYJPgyc5ApXQ5gm
	r4OF47Ej08WhwOaZBreJ+wdXLqMETVJan2nDB+0xopi2Essr/kRH7jme47w80A==
Date: Thu, 23 Apr 2026 12:00:01 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 3/4] ARM: dts: renesas: r8a7740: Add ZT/ZTR trace clock
 on R-Mobile A1
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
 Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260415233300.457892-1-marek.vasut+renesas@mailbox.org>
 <20260415233300.457892-4-marek.vasut+renesas@mailbox.org>
 <20260421-cherubic-urban-beluga-49ee00@quoll>
 <0f933506-c196-4503-844f-2a375e2cf690@mailbox.org>
 <161eb29f-2d07-455a-bd74-4f22061b5dfb@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <161eb29f-2d07-455a-bd74-4f22061b5dfb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 4rurf9ku7rt7u9f8jrock8stus9woi4h
X-MBO-RS-ID: 74424914be6ca4b683f
X-Rspamd-Queue-Id: 4g1ZWW6cZVz9tcZ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_050410_653457_ADD198A3 
X-CRM114-Status: GOOD (  12.07  )
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

On 4/23/26 11:26 AM, Krzysztof Kozlowski wrote:
> On 23/04/2026 01:33, Marek Vasut wrote:
>> On 4/21/26 10:02 AM, Krzysztof Kozlowski wrote:
>>> On Thu, Apr 16, 2026 at 01:31:40AM +0200, Marek Vasut wrote:
>>>> Add ZT trace bus and ZTR trace clock on the R-Mobile A1.
>>>>
>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>>> ---
>>>> Cc: Conor Dooley <conor+dt@kernel.org>
>>>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>>>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>>> Cc: Magnus Damm <magnus.damm@gmail.com>
>>>> Cc: Michael Turquette <mturquette@baylibre.com>
>>>> Cc: Rob Herring <robh@kernel.org>
>>>> Cc: Stephen Boyd <sboyd@kernel.org>
>>>> Cc: devicetree@vger.kernel.org
>>>> Cc: linux-clk@vger.kernel.org
>>>> Cc: linux-kernel@vger.kernel.org
>>>> Cc: linux-renesas-soc@vger.kernel.org
>>>> ---
>>>> V2: Add ztr/zt clock at the end of the list to match bindings
>>>> ---
>>>>    arch/arm/boot/dts/renesas/r8a7740.dtsi    | 2 +-
>>>
>>>>    include/dt-bindings/clock/r8a7740-clock.h | 2 ++
>>>
>>> This goes to the binding patch.
>>>
>>> Didn't you have also a checkpatch warning?
>> I only got this warning, but the docs 1/4 and includes 3/4 are a
>> separate patch in this series:
>>
>> "
>> WARNING: DT binding docs and includes should be a separate patch. See:
>> Documentation/devicetree/bindings/submitting-patches.rst
> 
> So you did not implement it... Include goes with the binding. Always.
> Look at other commits.
The warning says the exact opposite thing , does it not ?

Maybe the warning text needs to be updated ?

