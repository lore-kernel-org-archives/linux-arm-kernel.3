Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A39ED3177F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 18:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PyKcGEXb1boVL67P/iqRrnkjibAaY0whRvJpd8Laamw=; b=Qk21Tqv+4l5VtSomBWfhzyWEH9
	2AI+umnVNW4miVxJghyylrxEccnUP16r2mOxs/wmWJ9yKptRcs6HHyFllDRnYzr80Osk+Bza1fgsM
	FulNwxb0FwJKwviHE4rJQK4AJLNU0KZxeX7HKcIyxPbx71o+jiRt00j1idg/OnuLyQ986nvH8ZaAh
	L+8y1PH9nEwvJ4dx40Z5oS5rOlEF5gT4PTXXULsg3BXirihn6MOczCbO0jE5CCL9v7Bcif+p1Uede
	nMr5ugQi8BRR6ms8683dCsPBK2if7IBlEFpegC5fCRS8/ymi/qYJE0+3b6PYlz05SCBs0pQLZ/NYe
	Djlmy+CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8OMX-00000000Nof-0qnb;
	Tue, 05 Nov 2024 18:33:09 +0000
Received: from smtp-fw-33001.amazon.com ([207.171.190.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8OKl-00000000NJ6-1YnM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 18:31:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1730831480; x=1762367480;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PyKcGEXb1boVL67P/iqRrnkjibAaY0whRvJpd8Laamw=;
  b=M2/0bLP6BqEkU0ceL82rMVIs/PovxxMY/VfTq1CRhF+IMYORlXtaXT9e
   UScncrEYO31rD7lmAmNen8QT8N0JRdEa5i8whckUjEUKlE/VQVgBa9ktV
   atsF1ibdypqO5TC1Zr6/EriGzSZ8vDpsr/uPm7u5ZrFQYCc37EW0kGPC9
   o=;
X-IronPort-AV: E=Sophos;i="6.11,260,1725321600"; 
   d="scan'208";a="382672584"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-33001.sea14.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 18:31:16 +0000
Received: from EX19MTAUWB001.ant.amazon.com [10.0.38.20:19380]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.3.16:2525] with esmtp (Farcaster)
 id 88fb91fb-2fb9-4573-83ff-78e8c1de0dfe; Tue, 5 Nov 2024 18:31:15 +0000 (UTC)
X-Farcaster-Flow-ID: 88fb91fb-2fb9-4573-83ff-78e8c1de0dfe
Received: from EX19D001UWA003.ant.amazon.com (10.13.138.211) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Tue, 5 Nov 2024 18:31:15 +0000
Received: from u34cccd802f2d52.amazon.com (10.106.239.17) by
 EX19D001UWA003.ant.amazon.com (10.13.138.211) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.35;
 Tue, 5 Nov 2024 18:31:09 +0000
From: Haris Okanovic <harisokn@amazon.com>
To: <ankur.a.arora@oracle.com>, <catalin.marinas@arm.com>
CC: <linux-pm@vger.kernel.org>, <kvm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<will@kernel.org>, <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
	<pbonzini@redhat.com>, <wanpengli@tencent.com>, <vkuznets@redhat.com>,
	<rafael@kernel.org>, <daniel.lezcano@linaro.org>, <peterz@infradead.org>,
	<arnd@arndb.de>, <lenb@kernel.org>, <mark.rutland@arm.com>,
	<harisokn@amazon.com>, <mtosatti@redhat.com>, <sudeep.holla@arm.com>,
	<cl@gentwo.org>, <misono.tomohiro@fujitsu.com>, <maobibo@loongson.cn>,
	<joao.m.martins@oracle.com>, <boris.ostrovsky@oracle.com>,
	<konrad.wilk@oracle.com>
Subject: Re: [PATCH v8 00/11] Enable haltpoll on arm64
Date: Tue, 5 Nov 2024 12:30:36 -0600
Message-ID: <20241105183041.1531976-1-harisokn@amazon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240925232425.2763385-1-ankur.a.arora@oracle.com>
References: <20240925232425.2763385-1-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.106.239.17]
X-ClientProxiedBy: EX19D033UWA004.ant.amazon.com (10.13.139.85) To
 EX19D001UWA003.ant.amazon.com (10.13.138.211)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_103119_494231_859A9F74 
X-CRM114-Status: UNSURE (   5.22  )
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

Hi Ankur, Catalin,

How about the following series based on a refactor of arm64's delay()?
Does it address your earlier concerns?

delay() already implements wfet() and falls back to wfe() w/ evstream
or a cpu_relax loop. I refactored it to poll an address, and wrapped in
a new platform-agnostic smp_vcond_load_relaxed() macro. More details in
the following commit log.

Regards,
Haris Okanovic
AWS Graviton Software


