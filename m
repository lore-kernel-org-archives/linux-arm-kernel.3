Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A55C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 11:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XCkz49E19Etc5iFn8o8j43bZJGIh6w14Def27S1kOQQ=; b=YBhNExG/UtySNhMX7Ql8PTiJEm
	XykUw6kazFXXtRwb+Z2cV/5NiorhavHcrnGZFOlo0sWlzBC1w24126GSAQxVqWT57uo1WqWwKtjNl
	xPZbVBQCK/BC7ebTWgD+l9fhGJ4mQCPH1wk5mqBYdoM3r2P5ig40Kcv8kHTrsIJmw3OlYguqZjj4I
	QbkxULr3Ts4CuyqYIK8h63M9OsYw3d0R22MCnEZV02wuS4VprfZ8Wj5m3e5MapqTM2NuMwb8mESwX
	g3vX/AYEB9aXwhtSXrx6EADrAKmHTKBSGcdkJcwpVDKK3cAQbRbZ3WUnvC+73F5YARLIG8YP0/THW
	XOIm1/kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfG3B-00000004MjE-19mC;
	Thu, 02 Jul 2026 11:57:49 +0000
Received: from pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.26.1.71])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfG39-00000004Miq-1m04
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 11:57:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1782993467; x=1814529467;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XCkz49E19Etc5iFn8o8j43bZJGIh6w14Def27S1kOQQ=;
  b=bLVZTPqOo9nMVDRVdv+931tq/sbpfOjuQ+BxWZnihA7GjWpj0OYH8XhF
   Gd142lpMH8le6XdEXTfot3bwi99Qm146XBS/qEpzsdhgJFkFeCpBXb0ZB
   4iWgE1YCxP3N8/78YXGtQu9lVk2kVrF5OlWI+Zk/owwaRfXRo5rjJ9+It
   lyIR39D+YJi+U9SqWDGt9pJcBL50k4N5ak4FxkwRlnA0PwDCARhlwxzfJ
   A8hwrSFxZJ4LG5zlJMixrE9ExS9XJ3HNWZh0uBR5y1U4JIKYF+7WLkis0
   2W5dDs92GzRTYgBptQrOF7e0pG56V91lJkcTYZ8P7xlmLArdF4BfMfcPu
   g==;
X-CSE-ConnectionGUID: 4ejd4uzNSGqN+sH0hbni0g==
X-CSE-MsgGUID: C7kalaF1TD2ohysTFS7eCQ==
X-IronPort-AV: E=Sophos;i="6.25,143,1779148800"; 
   d="scan'208";a="22945047"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 11:57:42 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:3682]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.43.112:2525] with esmtp (Farcaster)
 id 73beebf7-0d64-45e3-9112-7eb54854c385; Thu, 2 Jul 2026 11:57:42 +0000 (UTC)
X-Farcaster-Flow-ID: 73beebf7-0d64-45e3-9112-7eb54854c385
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Thu, 2 Jul 2026 11:57:41 +0000
Received: from dev-dsk-doebel-1a-7b355d76.us-east-1.amazon.com (10.169.119.5)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Thu, 2 Jul 2026 11:57:40 +0000
From: Bjoern Doebel <doebel@amazon.de>
To: <stable@vger.kernel.org>, Marc Zyngier <maz@kernel.org>, Thomas Gleixner
	<tglx@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, David Woodhouse <dwmw@amazon.co.uk>, "Ali
 Saidi" <alisaidi@amazon.com>, David Arinzon <darinzon@amazon.com>, "Zeev
 Zilberman" <zeev@amazon.com>
CC: Bjoern Doebel <doebel@amazon.de>
Subject: Re: [PATCH] irqchip/gic-v3-its: Reconfigure ITS from software state on resume
Date: Thu, 2 Jul 2026 11:57:15 +0000
Message-ID: <akZPM6SeJiM8th0N@amazon.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260507183102.1897629-1-doebel@amazon.de>
References: <20260507183102.1897629-1-doebel@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-Originating-IP: [10.169.119.5]
X-ClientProxiedBy: EX19D033UWC003.ant.amazon.com (10.13.139.217) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_045747_574314_1C30ED1B 
X-CRM114-Status: GOOD (  10.70  )
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

Hi all,

gentle ping on this one.

Since the original posting I've re-validated the fix against current
mainline:

  - It still applies cleanly to v7.2-rc1 (and to v7.1.0).

  - I reproduced the original failure on *stock* v7.2-rc1. On EC2
    Graviton instances, hibernation resume fails 100% of the time: the
    ITS comes back reset, MAPD/MAPTI are never replayed, and the ENA
    NIC silently loses its LPIs:

      ena 0000:00:05.0: ... didn't receive a MSI-X interrupt (cmd 3)
      ena 0000:00:05.0: Failed to create IO CQ. error: -62

    The instance then has no networking after resume.

  - With this patch applied, the same kernel survives hibernate/resume
    cleanly: 9/9 cycles with zero failures, across all three Graviton
    generations (Graviton 2/3/4, i.e. Neoverse N1/V1/V2), networking
    fully restored on every resume.

As described in the previous message, this is the fallout from 713335b6ee29
("irqchip/gic-v3-its: Implement .msi_teardown() callback"): device
teardown no longer happens across a suspend/resume that keeps the MSI
domain, so the ITS is never reprogrammed and drops interrupts after the
hardware has been reset.

Could you take a look when you get a chance?

Thanks,
Bjoern




Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christof Hellmis, Andreas Stieger
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597


