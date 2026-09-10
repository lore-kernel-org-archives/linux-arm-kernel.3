Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49C0C88E41
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 23:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:References:
	In-Reply-To:CC:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j7l7z1mpmxbRfASwFkI/gOw9Q15D1cjZKLx46DX6Ups=; b=mZrhdDZReFynkA6apSsfH0pOre
	G2xEt6QF0tBIuUOYQGto/+pFqKjW0UPWvNGI0WP/fyoEjNWjNHYgjJ4L5o+PM7HTaIbYpUzdQFTRx
	sVhD8nv9qz8uKhr7G66r5n+JJ+tls9GlFl9wdwmyH1o/A5opOGOzbCp99R5kSze9t9OGXB7ExBOkD
	0f3wCRtWhg0GyprebpWz4YTP25xO0FBL1VEKRuT63IlVMf6dDNX2qMsM469G7s0eKQA9W11thiMOa
	z9sq48AB0FgTfhumC0xf+4Lbdo3DBxoxP+VEacohej/7xgbk9i8AHmcb69YcJJZr2jDnogvGLYRob
	1Dvf+pWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4npL-0000000FVqO-2MDe;
	Thu, 10 Sep 2026 23:05:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4npI-0000000FVov-0SLb
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 23:05:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:Date:References:In-Reply-To
	:CC:To:From:Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=j7l7z1mpmxbRfASwFkI/gOw9Q15D1cjZKLx46DX6Ups=; b=lLAbqYVzPs1hU67ROxoKigQQUF
	wJK8OSLa7kvOGPurM2t2fVRc+sDz1TO/pqoF1V+XUo1Qxf68GSI+BXnkwBwkCxNOi5v2KjjVPjOjd
	xqmfG4Zdl7qV49jejjEykubr8vGh9SaaMP2BCpPaosivnOvdP0lxNuzDkMFp/VfRmFCFT3/uoOQTa
	eRanEVIaphaVwKdUaYExz1jDBgVNYcK3B4sChYt2sHkBtGB0NKB2tvZd5BiDSlJ6w4CjgnalzvziG
	BI8eH993u8j4g45b3t7LOpqnyclNfaCW/K9jGxp89XQZWDORA1Zen2li81pcicyWQisSW9CC6zxm0
	8RVdUNrQ==;
Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.13.214.179])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4npE-000000031vD-0iyX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 23:05:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1789081500; x=1820617500;
  h=mime-version:content-transfer-encoding:subject:from:to:
   cc:in-reply-to:references:date:message-id;
  bh=j7l7z1mpmxbRfASwFkI/gOw9Q15D1cjZKLx46DX6Ups=;
  b=RBATJyx70PEfy6B/LM1A4I6U7vPeqewBnLcq1nJMPE9MKuBSe/ohhsOy
   hPtMn2jRD1ujjqY93r0HpR4SzZZXdItaUr6xZWxtSEHELL0+JXApR+NDK
   uRQ5dK44yii0GlKUEdbaNh2tMEt9j2D+vU6I+XvGtn4mWg3Fh3JD/LJzS
   BKjp1xmBbdXboXHeMGzlAy21UpKpI/3gOxalVkDwG8YwLuTuRUv7JlDVP
   pAaXwtnA8nIQkXTRjTd7Dk0ctTXxZCq6fBmzo8RIc7w7rXc4Ohwj1l4AK
   hkVmiHG9ZRDv//W7+uCQsne156jkhoJ8x9afs9UFZtXhNiwigsWqx92a9
   Q==;
X-CSE-ConnectionGUID: EaITWzvPTnqWhJn1j//q6Q==
X-CSE-MsgGUID: uu1cUFSCQ+qcv21O108oPA==
X-IronPort-AV: E=Sophos;i="6.27,96,1787011200"; 
   d="scan'208";a="28351480"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 23:04:55 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:7707]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.22.113:2525] with esmtp (Farcaster)
 id ba131792-6492-4a10-a6fc-dc6b9d93c693; Thu, 10 Sep 2026 23:04:55 +0000 (UTC)
X-Farcaster-Flow-ID: ba131792-6492-4a10-a6fc-dc6b9d93c693
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Thu, 10 Sep 2026 23:04:54 +0000
Received: from u34cccd802f2d52.ant.amazon.com (10.106.178.32) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46;
 Thu, 10 Sep 2026 23:04:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v15 15/16] barrier: timeout validity checks for
 smp_cond_load_relaxed_timeout()
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
In-Reply-To: <20260831202251.305046-16-ankur.a.arora@oracle.com>
References: <20260831202251.305046-1-ankur.a.arora@oracle.com>
 <20260831202251.305046-16-ankur.a.arora@oracle.com>
Date: Thu, 10 Sep 2026 18:04:27 -0500
Message-ID: <178908146778.2725577.4108944992215893353.b4-review@b4>
X-Mailer: b4 0.15.2
X-Originating-IP: [10.106.178.32]
X-ClientProxiedBy: EX19D033UWA002.ant.amazon.com (10.13.139.10) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_000500_815219_451B6ED1 
X-CRM114-Status: UNSURE (   5.03  )
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

On Mon, 31 Aug 2026 13:22:50 -0700, Ankur Arora <ankur.a.arora@oracle.com> wrote:
> Add timeout tests for smp_cond_load_relaxed_timeout().  These check
> that the implementation returns early on invalid timeout values and
> handles edge cases sanely.

Tested-by: Haris Okanovic <harisokn@amazon.com>

-- 
Haris Okanovic
AWS Graviton


