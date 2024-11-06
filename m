Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FF0D3E798
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 09:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OpOy08KQdbkAn1tEfGQ2NL81ZQBTD6zpxtaYDJwE/ro=; b=0cdubn/jHfSCBRfDHY9TBIJgKf
	JKNFRTyL1rGBqRTzNVPYTP7eLsrjJmGJ4TSwloAfdKWp0bkkRoWRZkkLwBDa4xVsSUxdIXvUEHH6p
	cDysZ2Vg2Es9wPj4xdaohkVz/ZR/Vx9+pHI8d4faJVS79scAfRPQ/I8ztcZI5P9Kehf4b5W8ZWpoX
	edkxB/Bgi8hNGYOkmsebGi1bL7VPr8SKRqXqdEpc6Qd54VgJERQdGy44ShzI1hYF93riV222HzzK6
	6hEEGvUabvwW3OfpSucYpsxpRVhYK2j2rkrpAHXohdXHnkKUC40U0lNFNbmnzo5++TwJoUrmfJA1C
	2vWrxrjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ckr-00000002dhh-2VM9;
	Wed, 06 Nov 2024 09:55:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cB2-00000002TaL-2QrL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 09:18:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1670A5C4114;
	Wed,  6 Nov 2024 09:17:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81BFFC4CED0;
	Wed,  6 Nov 2024 09:18:06 +0000 (UTC)
Date: Wed, 6 Nov 2024 09:18:04 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Haris Okanovic <harisokn@amazon.com>
Cc: ankur.a.arora@oracle.com, linux-pm@vger.kernel.org, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	will@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	pbonzini@redhat.com, wanpengli@tencent.com, vkuznets@redhat.com,
	rafael@kernel.org, daniel.lezcano@linaro.org, peterz@infradead.org,
	arnd@arndb.de, lenb@kernel.org, mark.rutland@arm.com,
	mtosatti@redhat.com, sudeep.holla@arm.com, cl@gentwo.org,
	misono.tomohiro@fujitsu.com, maobibo@loongson.cn,
	joao.m.martins@oracle.com, boris.ostrovsky@oracle.com,
	konrad.wilk@oracle.com
Subject: Re: [PATCH 3/5] arm64: refactor delay() to enable polling for value
Message-ID: <Zys0TAHZzqbGst93@arm.com>
References: <20240925232425.2763385-1-ankur.a.arora@oracle.com>
 <20241105183041.1531976-1-harisokn@amazon.com>
 <20241105183041.1531976-4-harisokn@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105183041.1531976-4-harisokn@amazon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_011812_695387_0D13CD5B 
X-CRM114-Status: UNSURE (   9.55  )
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

On Tue, Nov 05, 2024 at 12:30:39PM -0600, Haris Okanovic wrote:
> +		do {
> +			cur = __READ_ONCE_EX(*addr);
> +			if ((cur & mask) == val) {
> +				break;
> +			}
>  			wfet(end);

Constructs like this need to be entirely in assembly. The compiler may
spill 'cur' onto the stack and the write could clear the exclusive
monitor which makes the wfet return immediately. That's highly CPU
implementation specific but it's the reason we have functions like
__cmpwait() in assembly (or whatever else deals with exclusives). IOW,
we can't have other memory accesses between the LDXR and whatever is
consuming the exclusive monitor armed state (typically STXR but WFE/WFET
can be another).

-- 
Catalin

