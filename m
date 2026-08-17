Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5797C5DF74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 21:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:References:
	In-Reply-To:CC:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7HAQgr7W1Px6oodKSFEqrJXQ5YZXceMvyj/wLnrYFcQ=; b=esLPE4qvIW9l0qxYI4siWqXEzw
	0ndEN4NoSnHiupuSpINOOOJCL/kmQueVd8KZXbd4DG26spubN0kxP3wf3p4EC+K/Pteq5eTUKInvS
	oQu90U1ZX0Uw6aUH+wUD7fqxd2QtWPOIWk2xpl//iXOmzizZ0RxlXbWbdAId88FvU7AzrivheoI4a
	3bibTjIZ+CQOVlamDjKTYRYbG7gz8nVz7lsNmgyOH2MMm/IaOrxRX32dcVJVNv+CRwfsQV49gtyxs
	lxaWG4ZjRzfQYc2l4+3zWRROY/pZ3FUaZU+BtC8ui2J8RN48p253uH8c8D1mKcGMvgaUNMLOlpV4J
	DAKfVnow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww4tB-00000006qM4-1VDK;
	Mon, 17 Aug 2026 21:29:01 +0000
Received: from pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.42.203.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww4t8-00000006qLi-10dX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 21:28:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1787002138; x=1818538138;
  h=mime-version:content-transfer-encoding:subject:from:to:
   cc:in-reply-to:references:date:message-id;
  bh=7HAQgr7W1Px6oodKSFEqrJXQ5YZXceMvyj/wLnrYFcQ=;
  b=HE6bI+/fcVf4nGpSeANRWm4u1902/D5THxAzl1IAKAon2kgRnZaYfy1W
   PfXVVKHiDV6XDyffEcGNd/X8S+tp2buMJVyA4BDpWnQa2eR86rz6WqRfn
   U15GRmALcwHYZR+OKOo9L6gjvLcSGtH2l7UegNBmdRowicUk8MuAgzKjH
   O/04Sx9Y9utiOnfASkYwv9WjxOEYyA83vpY08K2D4VUs4UWHOVn3puE29
   7W2Zp+hkXM6MvJJjbehlmEFnF3lY9P6XCprTxm3tS3e5sDrGmd3dMHcsm
   kOJpQRRYfYV3DyHR259NjxkW6AW/CUkL/CRTrFGxI6A6KHDIom1CRG5jx
   Q==;
X-CSE-ConnectionGUID: xqkOYIIoS5iXSHPq31YmEg==
X-CSE-MsgGUID: siGmvPlBSnSUzy7Vob9ogQ==
X-IronPort-AV: E=Sophos;i="6.25,229,1779148800"; 
   d="scan'208";a="26237258"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 21:27:47 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:13272]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.54.183:2525] with esmtp (Farcaster)
 id 05c9af25-051b-43f7-8f28-ec338ccbac36; Mon, 17 Aug 2026 21:27:47 +0000 (UTC)
X-Farcaster-Flow-ID: 05c9af25-051b-43f7-8f28-ec338ccbac36
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Mon, 17 Aug 2026 21:27:47 +0000
Received: from u34cccd802f2d52.ant.amazon.com (10.106.178.24) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Mon, 17 Aug 2026 21:27:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v14 13/15] arm64/delay: enable testing
 smp_cond_load_relaxed_timeout()
From: Haris Okanovic <harisokn@amazon.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
CC: Will Deacon <will@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arch@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-pm@vger.kernel.org>, <bpf@vger.kernel.org>, <arnd@arndb.de>,
	<catalin.marinas@arm.com>, <peterz@infradead.org>,
	<akpm@linux-foundation.org>, <mark.rutland@arm.com>, <harisokn@amazon.com>,
	<cl@gentwo.org>, <ast@kernel.org>, <rafael@kernel.org>,
	<daniel.lezcano@linaro.org>, <memxor@gmail.com>, <zhenglifeng1@huawei.com>,
	<xueshuai@linux.alibaba.com>, <rdunlap@infradead.org>,
	<david.laight.linux@gmail.com>, <broonie@kernel.org>,
	<joao.m.martins@oracle.com>, <boris.ostrovsky@oracle.com>,
	<konrad.wilk@oracle.com>, <ashok.bhat@arm.com>
In-Reply-To: <87tspi7lzk.fsf@oracle.com>
References: <20260714073041.40250-1-ankur.a.arora@oracle.com>
 <20260714073041.40250-14-ankur.a.arora@oracle.com>
 <amiUWpsL1QGf929i@willie-the-truck> <87tspi7lzk.fsf@oracle.com>
Date: Mon, 17 Aug 2026 16:27:29 -0500
Message-ID: <178700204950.2504314.3914062953110867251.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Originating-IP: [10.106.178.24]
X-ClientProxiedBy: EX19D038UWC001.ant.amazon.com (10.13.139.213) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_142858_357629_BCA8291C 
X-CRM114-Status: GOOD (  14.59  )
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

Hi Ankur,

On 2026-07-28 16:06 -0700, Ankur Arora wrote:
> 
> Will Deacon <will@kernel.org> writes:
> 
> > Hello, Ankur,
> >
> > On Tue, Jul 14, 2026 at 12:30:39AM -0700, Ankur Arora wrote:
> >> This enables the barrier tests to be built as a module.
> >>
> >> Cc: Catalin Marinas <catalin.marinas@arm.com>
> >> Cc: Will Deacon <will@kernel.org>
> >> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
> >> ---
> >>  arch/arm64/lib/delay.c               | 2 ++
> >>  drivers/clocksource/arm_arch_timer.c | 2 ++
> >>  2 files changed, 4 insertions(+)
> >
> > Acked-by: Will Deacon <will@kernel.org>
> 
> Thanks Will.
> 
> > I think this is looking good from the arm64 side now (and appears to have
> > all the relevant Acks). What's the plan to get this series merged?
> 
> Let me ask Andrew if he can pick this up via nonmm.

Any progress on merging this?

> 
> --
> ankur
> 



