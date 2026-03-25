Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85862FEA806
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 05:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0JPtoFP4tgxV1Qy/DmZtipgdUmV3id7ioCYvoKydIGo=; b=cx+mhmhcnZ+Vvy0fnwBgk1nP6M
	Wc6bzX715SdAGKwJpjoP1lrf6buArlH9ScACBPat4iVcfwWhk5K/N7iz/ibrIdtBTarc33bnwVXzp
	6ec9sAnWrD9uKdo2MyDZO3AeQurdz0tFT+9ruTObWHf1b2QZqzHi/WXZ0iDXwBgxYdUVGxoyz8Wn8
	ZunbYG33d4A7kRUXP3zvPnH/mBnb8IaPJK9DwsKrqa1Ia/p/Bku8k7YBsz449M9DT308b33K/etOK
	FuObft0kULC5DsvmTaPqoNJkmJA9Mm8YocLy+lTnqrSluBw+qIEEw7M5a3a4ca77GvJf4bZbfeVzw
	poVzi/FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5GWx-00000002hbF-3ma1;
	Wed, 25 Mar 2026 05:11:48 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5GWu-00000002hap-3oSt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 05:11:46 +0000
Received: from unknown (HELO iyokan3-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 25 Mar 2026 14:11:40 +0900
Received: from mail.mfilter.local (mail-arc01.css.socionext.com [10.213.46.36])
	by iyokan3-ex.css.socionext.com (Postfix) with ESMTP id A51672091483;
	Wed, 25 Mar 2026 14:11:40 +0900 (JST)
Received: from iyokan3.css.socionext.com ([172.31.9.53]) by m-FILTER with ESMTP; Wed, 25 Mar 2026 14:11:40 +0900
Received: from [10.212.247.82] (unknown [10.212.247.82])
	by iyokan3.css.socionext.com (Postfix) with ESMTP id EEF1410A0BE;
	Wed, 25 Mar 2026 14:11:39 +0900 (JST)
Message-ID: <09fc1857-e554-48ec-8862-54f0650b1c58@socionext.com>
Date: Wed, 25 Mar 2026 14:11:43 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: uniphier: mux: fix signedness bug in get_parent
To: Stephen Boyd <sboyd@kernel.org>, Anas Iqbal <mohd.abd.6602@gmail.com>,
 linux-clk@vger.kernel.org, mturquette@baylibre.com
Cc: mhiramat@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260318110251.2412-1-mohd.abd.6602@gmail.com>
 <177431305509.5403.15386021337517970667@lazor>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <177431305509.5403.15386021337517970667@lazor>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_221145_092086_81DCD52A 
X-CRM114-Status: GOOD (  14.26  )
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

Hi,

On 2026/03/24 9:44, Stephen Boyd wrote:
> Quoting Anas Iqbal (2026-03-18 04:02:51)
>> The uniphier_clk_mux_get_parent() function returns a u8, but
>> propagates negative error codes such as -EINVAL and regmap_read()
>> failures. These values are implicitly converted to large unsigned
>> integers, resulting in invalid parent indices.
>>
>> The clk_ops.get_parent() callback is expected to return a valid
>> parent index and does not support error codes. Fix this by returning
>> 0 as a safe fallback in error cases.
> 
> A large number will exceed the number of parents possible for the clk
> and turn into a failure to find the parent in the parent map. There's
> nothing to do here besides implement clk_ops::get_parent_hw()[1] and fix
> all the drivers.
> 
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/log/?h=clk-parent-rewrite

Certainly, the return value of .get_parent() is now u8, which doesn't
correctly detect an error in the function.

Some other implementations prevent .get_parent() from detecting regmap_read()
errors, but if it does, the read value is undefined.
If access to the parent fails, the only option is to propagate the error as
Stephen suggested, however, that affects all drivers, not just this one.

Thank you,

---
Best Regards
Kunihiko Hayashi

