Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FE0C88E45
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 23:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:References:
	In-Reply-To:CC:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zNgSNTNR480O9vDPDU7zC5Px0iicu4f1bsiOB9344YU=; b=rov+uFWBZ0vDgNVeVZjo2fPoc2
	s4oxJJhLickxNJhoOwyMXTKfu7ZUQ+qyOEcp6Grnek04ngc6Wgpo11zVHQH394T+WIcDij6hyjYJz
	aBygwFrodk+agS3027VCWOioV+K99xIkd6XsmvdkKR+2DkACyBFGauzK2Zl99nWk6+UX2PHLAUYgx
	mKzZmX/T4ehCAyBLENOaz/+/nVHAsNz9YabyvepFvNlqtWpTMPPu9pd0HkuSZyoSIseRVgc/Dmcgs
	ErTAqRwooy+c0nNqhKuaqVdK8P10BsEWMNJWxAL42NQsH9+kyavME82k9MRpdvaJ9NxImGZBYbNCX
	ZI8QGLIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4npE-0000000FVmk-1Oal;
	Thu, 10 Sep 2026 23:05:00 +0000
Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.162.73.231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4np8-0000000FVl4-3UEm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 23:04:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1789081494; x=1820617494;
  h=mime-version:content-transfer-encoding:subject:from:to:
   cc:in-reply-to:references:date:message-id;
  bh=zNgSNTNR480O9vDPDU7zC5Px0iicu4f1bsiOB9344YU=;
  b=S2lldGPH5pT41raI8oE0KuyQMWtVgyp663vizXBdiM04ECWV8oKemW/Y
   EqYNNzHulLdcV8pdb9qmyqSmbV/7WpEGv3WZl1oJ+TbbxmIfjYi6SY8rx
   UYAln2jbVN/B6u1CoqilnnPTbMcG4QSC0apIBU8ups+rDWb+C9xsFlDId
   MCcekSzXXAX8uyK/BJFwR0dFa0JndBeXkl/TPZGp6x1q6zJw4dDCnO3RZ
   2idRGKshKihJVZx/Ph9ifEqBheE9481wgLKtLedMKywxeDj48edLn/qwm
   Z2jo1+6b2spTzRVf83q5ZtYt23WktLSAIVzLD7PJYkZUdMGWWrVFNL8cM
   A==;
X-CSE-ConnectionGUID: TbvrUZYeROSbPZZjBOSTuA==
X-CSE-MsgGUID: CWtiIfh7SySJRPaM6/vy7Q==
X-IronPort-AV: E=Sophos;i="6.27,96,1787011200"; 
   d="scan'208";a="28174137"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 23:04:52 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.48:18934]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.37.160:2525] with esmtp (Farcaster)
 id 7a1acc50-bba7-4809-926f-d08daac21daa; Thu, 10 Sep 2026 23:04:52 +0000 (UTC)
X-Farcaster-Flow-ID: 7a1acc50-bba7-4809-926f-d08daac21daa
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Thu, 10 Sep 2026 23:04:51 +0000
Received: from u34cccd802f2d52.ant.amazon.com (10.106.178.32) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46;
 Thu, 10 Sep 2026 23:04:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v15 14/16] barrier: add tests for
 smp_cond_load_*_timeout()
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
	<boris.ostrovsky@oracle.com>, <konrad.wilk@oracle.com>, <ashok.bhat@arm.com>,
	Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260831202251.305046-15-ankur.a.arora@oracle.com>
References: <20260831202251.305046-1-ankur.a.arora@oracle.com>
 <20260831202251.305046-15-ankur.a.arora@oracle.com>
Date: Thu, 10 Sep 2026 18:04:27 -0500
Message-ID: <178908146777.2725577.14495389857776220340.b4-review@b4>
X-Mailer: b4 0.15.2
X-Originating-IP: [10.106.178.32]
X-ClientProxiedBy: EX19D033UWA002.ant.amazon.com (10.13.139.10) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_160454_950982_E7EE1C51 
X-CRM114-Status: UNSURE (   6.57  )
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

On Mon, 31 Aug 2026 13:22:49 -0700, Ankur Arora <ankur.a.arora@oracle.com> wrote:
> Add success and failure case tests for smp_cond_load_*_timeout().
> 
> Success or failure cases depend on the expected bit being set (or not).
> Additionally in failure cases smp_cond_load_*_timeout() cannot return
> before timeout.
> 
> 
> [...]

Tested-by: Haris Okanovic <harisokn@amazon.com>

-- 
Haris Okanovic
AWS Graviton


