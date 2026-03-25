Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2445F106B53F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 13:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hA/RcDLnfM70e9u18PcuMcikLc3YOOmToizAbJtUCjw=; b=HoRc8xuYsyCh+wMeGHtEL0u9fS
	BchW0BkssmPI1ucVrJj7MMZnd4wN6/mouf1ylrJXpwAXoZWgrFYQyAzEhNBxZL1Ui2ItBPTStjRrV
	XrsvgWnomEvRloOTCb9TI22Hohg/T6xwmspqQUlkADUVTtkgK0vXXpcLkze8dMWdaVPWFUHfC4XVe
	KI1LjcRhwaI6yBVzH23D2cf4OHUdF0y5I2+GsBMUkuF9OWVbhftmvO+OYty86QkxMaMsTehb6jWs/
	FB5aDsshtM/RfSqgowZQSz9Jv8/yDCoB5kOQTmNxhs1ZJiKAve02L7oZ4Pk7txP+y7WxRutnKO/uc
	ITHKsqEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5OgM-00000003VHO-0Jjz;
	Wed, 25 Mar 2026 13:54:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5OgJ-00000003VGS-27X8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 13:54:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA21E1CDD;
	Wed, 25 Mar 2026 06:53:50 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 712F83F836;
	Wed, 25 Mar 2026 06:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774446836; bh=rTpz50E+4PJ6RioGt1JBhmHx0qMuH5Sl7wjDXLEJHn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F3S2AixyqhIuvb8mv8t2FHXLeYL9B2PwbydxQJsk+j50mWFPm3DNRdGMWKQ16/2k6
	 weCqqFChyZQPX537W7n5cnvAWcGK9jd+cQdtzw8wzA9Eh5HfC5UyqLTWEbBLh/76EH
	 xjaFdyHFtCq85BBXLQ7eZIVbpTx5hrKWok8PXOv8=
Date: Wed, 25 Mar 2026 13:53:50 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Ankur Arora <ankur.a.arora@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	bpf@vger.kernel.org, arnd@arndb.de, will@kernel.org,
	peterz@infradead.org, mark.rutland@arm.com, harisokn@amazon.com,
	cl@gentwo.org, ast@kernel.org, rafael@kernel.org,
	daniel.lezcano@linaro.org, memxor@gmail.com,
	zhenglifeng1@huawei.com, xueshuai@linux.alibaba.com,
	rdunlap@infradead.org, joao.m.martins@oracle.com,
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Subject: Re: [PATCH v10 00/12] barrier: Add
 smp_cond_load_{relaxed,acquire}_timeout()
Message-ID: <acPo7l_pd5rnHpSX@arm.com>
References: <20260316013651.3225328-1-ankur.a.arora@oracle.com>
 <20260315184925.b6f93386e918ca79614843e3@linux-foundation.org>
 <874imftol4.fsf@oracle.com>
 <20260316233712.7cbfac27@pumpkin>
 <87ms07rlp9.fsf@oracle.com>
 <20260317091705.5a64fc56@pumpkin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317091705.5a64fc56@pumpkin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_065359_584256_7B25BB8A 
X-CRM114-Status: GOOD (  12.85  )
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

On Tue, Mar 17, 2026 at 09:17:05AM +0000, David Laight wrote:
> On Mon, 16 Mar 2026 23:53:22 -0700
> Ankur Arora <ankur.a.arora@oracle.com> wrote:
> > David Laight <david.laight.linux@gmail.com> writes:
> > > On arm64 I think you could use explicit sev and wfe - but that will wake all
> > > 'sleeping' cpu; and you may not want the 'thundering herd'.  
> > 
> > Wouldn't we still have the same narrow window where the CPU disregards the IPI?
> 
> You need a 'sevl' in the interrupt exit path.

No need to, see the rule below in
https://developer.arm.com/documentation/ddi0487/maa/2983-beijhbbd:

R_XRZRK
  The Event Register for a PE is set by any of the following:
  [...]
  - An exception return.

-- 
Catalin

