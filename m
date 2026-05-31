Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E81CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 09:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4NHIT1ilJJCqNaudxFk22yjTTqDm0QouOPP1Hh+837g=; b=O1GkZVYUJxwbNopoEEXYeyHC4R
	JUTGDWvCZGZNKbPMx4FJQd/k8poIOLsg8IiieuAY6407dLeQvNYq6lE+qlA9qqQaxNawI9IUxDLRU
	ECrP11Cwvm9H31ZHWy2KQIS/0C/aDUingQ6JF0uAuI8Bzqfp9ubkFNXq888G+wnSgGkJaxL1/KnNr
	EV/yc53DWARZlMKXvZBytPaEboeZTf7+4WRgk2aRcy1tjh/v9eUN/M29WrBCutn14DSH5onKL0vpA
	KI9TSY5Q4klUcA6dD3OzFzw4qijw3Y/fmc2ocFCxx1dnXWdCAHECMYx8IaXauJzS0u7HLjMb6czut
	JvkmzItA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTcUW-00000009QXd-1VgZ;
	Sun, 31 May 2026 09:29:56 +0000
Received: from mta.al2klimov.de ([2a01:4f8:c0c:a5b1::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTcUT-00000009QWw-3Su7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 09:29:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=default; bh=Mw0rh43xOAuI
	SiAf/pF5q/1/WffFeCfnXIJl+eu1Xu8=; h=in-reply-to:from:references:to:
	subject:date; d=al2klimov.de; b=dYE3x9NkAUO2HLL2sZmqCX+/i0AtdXexhHV8Fm
	qrO8TvrNCfhx6Ap0e/4+LXvrXOIsQ3ry9eWyO11Woq58bJpGJkBe1hU5MkUurni6diEZ3f
	jfZMZz4JUAG5yvD+L4Q4f68qFYmrUNk6oTv9GFuW7QEnWsfIhZf0iffeHirfQlrAJfjTlr
	07IP74Jnm0ucvHI2alJX9SVUoqXiiD+TcVwYQAVt50aO/DV92k3t6Y/vu9UntWbFDD2ZXM
	ceuvH4c1xUCMNYJEwNi7XKc7rDqcqIpGfR3WzCxp+uIlJCgZOSUwrhiUICWHxNMuMA3HGc
	uu6mqOvIkEtU8h/y/3p74IIA==
Received: from [192.168.0.101] (88.215.123.80.dyn.pyur.net [88.215.123.80])
	by mta.al2klimov.de (OpenSMTPD) with ESMTPSA id 2f391762 (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO);
	Sun, 31 May 2026 09:29:48 +0000 (UTC)
Message-ID: <ae9d7e2f-05df-497d-9547-ce4722f5e7db@al2klimov.de>
Date: Sun, 31 May 2026 11:27:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: samsung: exynos5410: fix refcount leak
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 "open list:SAMSUNG SOC CLOCK DRIVERS" <linux-samsung-soc@vger.kernel.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260526061321.6123-1-grandmaster@al2klimov.de>
 <54284b18-e310-474e-9b64-63645804c1e0@kernel.org>
Content-Language: en-US
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
In-Reply-To: <54284b18-e310-474e-9b64-63645804c1e0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_022954_182173_1729BFB1 
X-CRM114-Status: UNSURE (   6.02  )
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



On 5/30/26 18:26, Krzysztof Kozlowski wrote:
> On 26/05/2026 08:13, Alexander A. Klimov wrote:
>> Every value returned from of_clk_get() is supposed to be cleaned up
>> via clk_put() once not needed anymore.
>>
>> Fixes: be95d2c7d918 ("clk: samsung: Add support for EPLL on exynos5410")
>> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> 
> 
> Does not apply - you messed somehow sending these.

Strange... copy&paste from
https://lore.kernel.org/all/20260526061321.6123-1-grandmaster@al2klimov.de/
(From: ... 2.54.0) applies to Linus' master.

Wait... ! Don't say because I fired all my compiled patches
at once via git-send-email(1), they assembled to one thread?
🙈

