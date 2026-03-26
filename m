Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D967A10AB827
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 20:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uwxYm6b4gzNXkghMb09qSf9ltTkLFWhWb7e84RMEH2o=; b=rfm4RouZBITo80ic6zkDnQ7YHi
	wj0QUtl1R4vd3//Euipc87NAHa9SJx96xTzyQjymSdAK5rjhCjt3c/NM6ExRhHvfbvrWOvGOm11Ti
	T+xdbHItma6jbRBE9Jblf5RLv5eBzhgy/Ins2DwWRa2BI3VW7m9da0Z661VABvrKSmAup/PNBBY26
	xBTmXR+lpH2KydKOHkziBfaqWfdqcB3psHdfKcyPMBuT6bhjqKybMxHmqrKrA4UmMxocRA3XwJ4L5
	MFF5Xe/iO8Oogx+UiamAPLu6dlzAOfezG9eK8IBTBs+UeKCrVgWTHHy6uQfUCI+mzyJGvEU7ivzEz
	gjpZW+dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5rVJ-00000006BXu-1ujL;
	Thu, 26 Mar 2026 20:40:33 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5rVG-00000006BX0-3ZyA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 20:40:32 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fhbJ328wGz9thj;
	Thu, 26 Mar 2026 21:40:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774557619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uwxYm6b4gzNXkghMb09qSf9ltTkLFWhWb7e84RMEH2o=;
	b=inGwPJKw2ZKqtUghNNDNo6RahTUjv/uTihaDUEYunKvzDJDN8WOwg70KoHFie69cErA0Pp
	YFkNhzhhjKLU+9itkgtq5XtATM0LmIBuowW8Q4GU2ajZdtEuptVxe9K4bOQ/hNGj6eyq76
	F6A3z3C2HBYlfBzVW80BVJsf2j1xzPxJy0PUKYHmt+vwTchy6FKt5ThfkxGgVnOTM/HN2R
	tOOirLoTgGbWtYmyEaKagH7ly4/zhbczFOu5FEHBywS6r6t3CP75nKDhgdyT7uBO72cP9u
	NrpXXSqtauvlNh83MmeACzUGEdhKF4tVFfulLwMrUSXPCs0P+4+Q6lFGEMoNaA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=XQZqfJv0;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <2ad69ee6-9170-46dc-a963-71f327192bad@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774557617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uwxYm6b4gzNXkghMb09qSf9ltTkLFWhWb7e84RMEH2o=;
	b=XQZqfJv0+w8bL27DFlE4QIYWHH7et3lrMK9NYA9rLMj5SDvU44KwxfTVX3P5peYsLneBZD
	l3jIXSuIguZVXhGfdVHGIt3Zm9QEOMPWgAopx9IzOEmC2ZoWnhJRcaG4g77ly1T13DNnSN
	woa/UXmguaYmbzkJEx313N3toGxk0PGk92AdLf6BqH7goiyTeekfBt72XzdZxOgeexbHeN
	hm0sKruiiUhec58jvjAdfB9K5RD0odIKAL4JEoO+0vUm3tGzCJOBPYvqMmgSvSh/oMkozi
	q4pyvNnwFDw9YdSAhbgC3v5tASUoCAtl6/tnpdLR8hB6BTD/0ncsKScQ+9HDzA==
Date: Thu, 26 Mar 2026 13:49:34 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] arm64: dts: renesas: Fix missing cells and reg
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdVtea9q1Yoaq1sEquxEAnQ-armLRdO1cMtJnp2K2mYtOg@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdVtea9q1Yoaq1sEquxEAnQ-armLRdO1cMtJnp2K2mYtOg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: s3nhmh9fqayeirbex9kzm9hxj798zp68
X-MBO-RS-ID: b89e9bfb6c652140b90
X-Rspamd-Queue-Id: 4fhbJ328wGz9thj
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_134031_077827_508113CB 
X-CRM114-Status: GOOD (  10.70  )
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

On 3/26/26 11:07 AM, Geert Uytterhoeven wrote:

Hello Geert,

> Thanks for your series!
> 
> On Thu, 26 Mar 2026 at 05:24, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
>> Add missing cells and reg DT property into DTOs to fix warnings like this:
>>
>> "
>> arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso:30.10-34.5: Warning (unit_address_vs_reg): /fragment@2/__overlay__/ports/port@1: node has a unit name, but no reg or ranges property
>> "
> 
> All of these are dtc W=1 warnings, right?

Yes, I slowly started linting and validating the various DTs we have to 
remove leftover warnings.

-- 
Best regards,
Marek Vasut

