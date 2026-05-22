Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594B2CD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 18:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M4PmzvF6nlBnEMOtRWeCObVf1eL+GsaKEjpgyfGL3s4=; b=hxTY+YvDx8D+0OuS/+2AEiBt/1
	eQQ6Qs/GGV8pVBu53LpuJeBLUI+hrzQ78/mc0VIszYzl17CH3SH8yR0tvmBZt+KWBovNWBZ5xoJGg
	SjiElt1IltZhW1IHW+akvvccR8e7XQ+Pg7Y10qTsjCLjexKqL4kxv1+81t7WiB4ZXC1f3pD5u3lxP
	2HO/gFiNbPH7855PjbFoU9L9TCHY31kwKFRBZoPtSLI9FLha6YSX2Wi4u6UO1fuAsizfYHJ3LXwIG
	tbcQMDLxqeBWF95RvmK/9Yb03fz5g0dg8H4FWKIcXesP2qBYt6XuA81oSNF8n7KvTIZQ0iwYKE9Od
	SKgsISoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQUXm-0000000BfUO-0KTY;
	Fri, 22 May 2026 18:24:22 +0000
Received: from mta.al2klimov.de ([2a01:4f8:c0c:a5b1::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQUXj-0000000BfT8-0J5C;
	Fri, 22 May 2026 18:24:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=default; bh=VvRB/CZVyfgR
	i3CPvAk07yCVsYInTTzv//7utAKYt4g=; h=in-reply-to:from:references:cc:to:
	subject:date; d=al2klimov.de; b=WjHYTMg5K6oJALOvYQfhNJMvrwkegwisSQsKT+
	o9XGUhW8z/8gny9WF5sMUv2tNyvBc5dHbrl9tWs4/22XlalKDWdjNoP2+E5Qjtg/KxZUX9
	cRXDlim5AANKJi7kND51ejbOvALwbIJol11XuKVrzKtiR5jlkhxpqnddqZTv99gKuivVQd
	SNqjP2g30rN8aG3LaNiVq9fbIMYFWAs8lw79uWWC5WT/k8VjeFwgNqSTdPkjGBvxhRkWRn
	Zro97picpJSz5WHuV9uyZgMrOBjEG8tTIVkNEMpZe8uPKxCRRJJpOQvgsWqOR5s9nHLvIu
	Z3fSg8A8FTGj6fSKnobezwww==
Received: from [IPV6:2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5] (2a02-2455-18e9-e011-4d8a-aad2-c25c-50e5.dyn6.pyur.net [2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5])
	by mta.al2klimov.de (OpenSMTPD) with ESMTPSA id 98861728 (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO);
	Fri, 22 May 2026 18:24:13 +0000 (UTC)
Message-ID: <fe494c36-04e9-4714-ab49-5f05bed66c9e@al2klimov.de>
Date: Fri, 22 May 2026 20:20:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource/drivers/owl: fix refcount leak
To: Markus Elfring <Markus.Elfring@web.de>,
 linux-actions@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20260521041901.542964-1-grandmaster@al2klimov.de>
 <c1aba09f-0a74-485c-b787-59b215a3bd88@web.de>
Content-Language: en-US
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
In-Reply-To: <c1aba09f-0a74-485c-b787-59b215a3bd88@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_112419_473318_DC86A230 
X-CRM114-Status: UNSURE (   8.66  )
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



On 5/21/26 14:10, Markus Elfring wrote:
>> Every value returned from of_clk_get() is supposed to be cleaned up
>> via clk_put() once not needed anymore.
> 
> How do you think about to add a wording like “Thus add a missing function call.”?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v7.1-rc4#n94
> 
> Would the application of another guard become helpful?

TIL (from you) there's DEFINE_FREE.
This seems pretty cool on its own.
I think I can apply it here, but I'd have to recompile.
This takes long.

Or we just fix this leak with the oneliner
I already compiled, booted and submitted.

I'll wait what maintainers decide...

> 
> How will chances evolve to adjust variable scopes accordingly?

Is this even a thing in Linux?
I mean specifying C variables anywhere ex. at function begin.

