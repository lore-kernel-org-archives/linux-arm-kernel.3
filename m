Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B385F5A8BC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 22:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ePnXR9oVgHfNaZl1q2pbWUGaIpQt6S7zzmVozt9afiE=; b=qqrZYCsZPuUnPauvFU1TnQet2i
	WKN3evVgkzJgm1GCC0vAVX7WOFqZC4lJvA3i0bIOV5ciA9VlFBfdq29gaL4tu9JeqahsUvJfIFohq
	8cDFF6vDbF1f2uNZRiKFdfXfkouDA4kHBBRHb7/3XdAQqvff6Zgq/iFnqkxyqoc6a3OjQRPWupaAK
	6DcDWSb2JsLKzAxwz1gsxrW5M/yM6KeVJqAQvGqyOwnthzxAL0C60Ig12O0cB+E8LjmIQBgDOaVz6
	F6XBrQOgME6/TnWKzI4oTVBNzrzKmM3CO3BZ3zzZgbNaMuLv+PfLSxh8vHYV+IpgXgaZKc4nqW8sU
	TL1zaxCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wExMh-00000007nFF-3eyZ;
	Mon, 20 Apr 2026 22:45:15 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wExMg-00000007nEv-19gk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 22:45:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1776723173;
	bh=ePnXR9oVgHfNaZl1q2pbWUGaIpQt6S7zzmVozt9afiE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HiX3ActYmkJwOFo8O7Eswn5o9sPaOUzzLwpQHP3mEAOdooKWeldoE/th7uradOUzW
	 YsjhgyZFTiCxnyIHKkglDMlhQi6pwwYkCUHcaAFWVr+kpR8uA7BFvFzwr81RJ9K0d9
	 kWMBbhyfOaPvWJjXKNvuUF8Wrcrl6GczygLH0Q8w=
Received: by gentwo.org (Postfix, from userid 1003)
	id AC558402B1; Mon, 20 Apr 2026 15:12:53 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id AB0D74010E;
	Mon, 20 Apr 2026 15:12:53 -0700 (PDT)
Date: Mon, 20 Apr 2026 15:12:53 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: "Okanovic, Haris" <harisokn@amazon.com>
cc: "ankur.a.arora@oracle.com" <ankur.a.arora@oracle.com>, 
    "joao.m.martins@oracle.com" <joao.m.martins@oracle.com>, 
    "xueshuai@linux.alibaba.com" <xueshuai@linux.alibaba.com>, 
    "david.laight.linux@gmail.com" <david.laight.linux@gmail.com>, 
    "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, 
    "memxor@gmail.com" <memxor@gmail.com>, 
    "ashok.bhat@arm.com" <ashok.bhat@arm.com>, 
    "zhenglifeng1@huawei.com" <zhenglifeng1@huawei.com>, 
    "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, 
    "akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    "catalin.marinas@arm.com" <catalin.marinas@arm.com>, 
    "ast@kernel.org" <ast@kernel.org>, 
    "rdunlap@infradead.org" <rdunlap@infradead.org>, 
    "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, 
    "arnd@arndb.de" <arnd@arndb.de>, 
    "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, 
    "will@kernel.org" <will@kernel.org>, 
    "mark.rutland@arm.com" <mark.rutland@arm.com>, 
    "peterz@infradead.org" <peterz@infradead.org>, 
    "bpf@vger.kernel.org" <bpf@vger.kernel.org>, 
    "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
    "rafael@kernel.org" <rafael@kernel.org>, 
    "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Subject: Re: [PATCH v11 12/14] cpuidle/poll_state: Wait for need-resched via
 tif_need_resched_relaxed_wait()
In-Reply-To: <a374b23f8b03f850a874d46bc78411fb99483ca2.camel@amazon.com>
Message-ID: <02b88c74-4e7c-4f70-c49a-3e429b0e4abb@gentwo.org>
References: <20260408122538.3610871-1-ankur.a.arora@oracle.com>  <20260408122538.3610871-13-ankur.a.arora@oracle.com> <a374b23f8b03f850a874d46bc78411fb99483ca2.camel@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_154514_373197_514D47E3 
X-CRM114-Status: UNSURE (   5.51  )
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

On Mon, 20 Apr 2026, Okanovic, Haris wrote:

> I hope this series can merge soon. It's been stuck in review for more
> than 2 years.

3 years I believe

Lets move this forward.


