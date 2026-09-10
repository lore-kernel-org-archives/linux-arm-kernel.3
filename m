Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A0FC88E41
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 23:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:References:
	In-Reply-To:CC:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IOsxt71KzjuvZPnWRLz+Zt819tnVf/OX6nBy2DXTBZw=; b=d45Kwh33XJmm7o06KMSjQ3L9rN
	Y7uGITrKFkGcKT7UgzrNefvX8k3tvZ+z2FWaVfJqXVJe35LB/5g2qTKM5Gbz5qf+/AC4WVsp2UvCY
	1SYn4BNmNUvNG68HmvDfTR4uh36DjPMcqcl86nsTL5ZzmCTpqpIM/DVXiyudTdMvVlsZPrry8GGpp
	DKBEwyGUnP6/P4F+dod0WxoB0e+8uUlRNEQgFJQK0YNnIN8S05rDPDHgJ1tnCkV/S8PYkCOnJNBVp
	pJNFgIWJV41StOl4AafM7LyooJIeg9PQWSoxGGjB7lwVESWp+1Bn0BmPMYe6l5XvjDzVm1Au8mf1c
	YZX8vNWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4npE-0000000FVn5-1rJ2;
	Thu, 10 Sep 2026 23:05:00 +0000
Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.162.73.231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4npC-0000000FVl4-2pss
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 23:04:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1789081498; x=1820617498;
  h=mime-version:content-transfer-encoding:subject:from:to:
   cc:in-reply-to:references:date:message-id;
  bh=IOsxt71KzjuvZPnWRLz+Zt819tnVf/OX6nBy2DXTBZw=;
  b=jEdYidEmEOAEAq64DH+3Fa2+cfIL2zj5db34V2I7PvZ6XqH20lNRM0/O
   FdogPfwiIOQ+YH6/SwAVIbRqpW2g1EscU+o186zbOfTFPCH9VxwhHk9uY
   eroGJJ9cFS/OtojRJkkAnIz6HEUWERCMGk1ePQANOLHsiMvbY2ql+SalX
   OZFDhKItyVhadNC/nCiRj1ALIZq9mCeM5cOJjgYgu8kIant8jnKwdJCBj
   fkHaJRMSqNNPZ5OC4JtmyX5kJyWsJyU4Z1+REEc6VW2RpPTFdyFKVmbCk
   AaCEnTtrW429Lv3UyZPUhN+6duBj5cqriubG++6aeh+dPo6gP71lznUYk
   A==;
X-CSE-ConnectionGUID: b7E1F3vDSUuMCM84df39YQ==
X-CSE-MsgGUID: 5KMnDUnCQjmoC2958yP+VA==
X-IronPort-AV: E=Sophos;i="6.27,96,1787011200"; 
   d="scan'208";a="28174146"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 23:04:58 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:6383]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.37.160:2525] with esmtp (Farcaster)
 id d5404f53-ad6a-4991-8fbd-b62fddfbd916; Thu, 10 Sep 2026 23:04:58 +0000 (UTC)
X-Farcaster-Flow-ID: d5404f53-ad6a-4991-8fbd-b62fddfbd916
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Thu, 10 Sep 2026 23:04:57 +0000
Received: from u34cccd802f2d52.ant.amazon.com (10.106.178.32) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46;
 Thu, 10 Sep 2026 23:04:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v15 16/16] barrier: timeout validity checks for
 smp_cond_load_acquire_timeout()
From: Haris Okanovic <harisokn@amazon.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<bpf@vger.kernel.org>, <arnd@arndb.de>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <peterz@infradead.org>, <akpm@linux-foundation.org>,
	<mark.rutland@arm.com>, <harisokn@amazon.com>, <cl@gentwo.org>,
	<ast@kernel.org>, <rafael@kernel.org>, <daniel.lezcano@linaro.org>,
	<memxor@gmail.com>, <zhenglifeng1@huawei.com>, <xueshuai@linux.alibaba.com>,
	<rdunlap@infradead.org>, <david.laight.linux@gmail.com>,
	<broonie@kernel.org>, <joao.m.martins@oracle.com>,
	<boris.ostrovsky@oracle.com>, <konrad.wilk@oracle.com>, <ashok.bhat@arm.com>
In-Reply-To: <20260831202251.305046-17-ankur.a.arora@oracle.com>
References: <20260831202251.305046-1-ankur.a.arora@oracle.com>
 <20260831202251.305046-17-ankur.a.arora@oracle.com>
Date: Thu, 10 Sep 2026 18:04:27 -0500
Message-ID: <178908146779.2725577.4332112514491271355.b4-review@b4>
X-Mailer: b4 0.15.2
X-Originating-IP: [10.106.178.32]
X-ClientProxiedBy: EX19D033UWA002.ant.amazon.com (10.13.139.10) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_160458_779518_7EBA9C6D 
X-CRM114-Status: UNSURE (   7.11  )
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

On Mon, 31 Aug 2026 13:22:51 -0700, Ankur Arora <ankur.a.arora@oracle.com> wrote:
> Extend timeout tests in smp_cond_expiry_params to also test
> smp_cond_load_acquire_timeout().
> 
> The interface supports clocks that can return error on timeout.
> These are used by rqspinlock. Test that by using a similar clock
> that starts returning error past timeout.
> 
> [...]

Tested-by: Haris Okanovic <harisokn@amazon.com>

-- 
Haris Okanovic
AWS Graviton


