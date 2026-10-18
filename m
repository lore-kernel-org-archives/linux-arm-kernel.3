Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6EFCCA490
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 12:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WMNkipMcwPMTP7cNA2CPWIUSwQ0qxyWJjxciMxCkqng=; b=GP6psR4AOTyjfc4OpImJiCxjXl
	F4PjjHZuF0zmj5Qos7xDkxHy+sXItnsY22Z/wSEP2azWQdGiL8P3fof6Eh7OiYp+Wll/yIwAbKNBf
	WAhQfk1qGNwVuUivPcuM7vH4zpiHS62UhluUvhU108n/NibSxjIE/emy2+EBlJ8K19gviPYqt85iU
	MMxZ2MUkT7HDgrrXcC7Aj36j6oIxkWVU/gyDpElfI6t9WyCuxnPb/oxWEeqI5xKhykNRN1/TQex1w
	Oc7iCN/acAH+QdKucWK7Kn5qVBQkTn/RoDjm6K78F6s69AgpIcQhQt8qYUNwaOPoDuIkMT6zjaadA
	60zz3G0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIQEX-00000005rkD-45lI;
	Sun, 18 Oct 2026 12:43:26 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIQEU-00000005rjZ-3yq7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 12:43:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=WMNkipMcwPMTP7cNA2CPWIUSwQ0qxyWJjxciMxCkqng=;
	b=bA/dyefOAdLU4Vyq/EAH0tER0OuFcZuUW6gEJyj8Po6nRZkJ1R4dtcDNE97wm2
	5k7Wgvt9xX08Vl6ucS+gSoX5V5idtKURK524ymH6p+UGIIMgM9GET/ZsLhJMr1WL
	ZhI/DveznijksLSFKrnkRhAdqMhC4tlyet7QPg5vMi+QE=
Received: from [IPV6:2409:8a62:3e8:8320:6021:18bb:3ec8:2069] (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD338SqvtRqvbUHBA--.4070S2;
	Sun, 18 Oct 2026 20:42:20 +0800 (CST)
Message-ID: <202f3cb0-a599-44e4-8048-8cbe22b9eaa2@163.com>
Date: Sun, 18 Oct 2026 20:42:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] pinctrl: stm32: fix hwspinlock timeout and EXTI
 mux locking
To: Linus Walleij <linusw@kernel.org>
Cc: antonio.borneo@foss.st.com, bigeasy@linutronix.de,
 alexandre.torgue@foss.st.com, arnd@arndb.de, clrkwllms@kernel.org,
 lee@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 mcoquelin.stm32@gmail.com, mfd@lists.linux.dev, rostedt@goodmis.org,
 u.kleine-koenig@pengutronix.de
References: <20261014160917.139241-2-junan76@163.com>
 <CAD++jLk9Rga0OuaKyojE2ViT9cBcmD_Ow-pMth-qJbTfHgcybA@mail.gmail.com>
Content-Language: en-US
From: Ju Nan <junan76@163.com>
In-Reply-To: <CAD++jLk9Rga0OuaKyojE2ViT9cBcmD_Ow-pMth-qJbTfHgcybA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD338SqvtRqvbUHBA--.4070S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jr43Zw4xCF1UGw15GFyfJFb_yoWDWFc_ua
	ykZa4kCw45Z3W7Ja12yr12kFyS9FZ7tryUJ395W3ZFvr9IvrZrZa95GrZ7tF4Fya95A3Wf
	Jr9aqryIv342kjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRdWFUUUUUU==
X-Originating-IP: [2409:8a62:3e8:8320:6021:18bb:3ec8:2069]
X-CM-SenderInfo: pmxqt0ixw6il2tof0z/xtbC9QyqXGrUvqzLgwAA3r
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_054323_469243_BEE62F15 
X-CRM114-Status: GOOD (  15.08  )
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



On 10/16/26 9:19 PM, Linus Walleij wrote:
> Hi Ju,
> 
> On Wed, Oct 14, 2026 at 6:10 PM Ju Nan <junan76@163.com> wrote:
> 
>> This series fixes two problems around the hwspinlock-protected EXTI mux
>> and pin configuration accesses in the STM32 pinctrl driver.
> 
> Patches applied for v7.4.
> 
> There are still complaints from Sashiko, but Sashiko always
> complains so I'd say at this point we are close to the merge
> window so it is better to follow up with separate fixes
> if there are more issues.
> 

Thank you for applying the series.

Many thanks also to Antonio and Sebastian for taking the time to
review the patches; your feedback helped improve the series a lot.

> As maintainer I kind of have to decide whether to wait for
> the perfect patch or if perfect is the enemy of good and
> just merge the patch so the baseline looks better, so I
> decided for the latter here.
> 
> Yours,
> Linus Walleij

I've looked through the remaining Sashiko comments. I'll keep an
eye on it and send fixes if anything comes up.

Yours,
Ju Nan


