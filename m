Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E615B606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 20:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v2QGAPs0;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=U88cmBZ8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Qrq3FNW/0SEN44vJvKEC14nzqvJcKELdScbHaQ9C9/o=; b=v2QGAPs0/rjJEYGGMbA98gZ4gY
	gT8q8DMOhaHc4R+GSjaApxz+nGUiOqceGUG0I2PQDwZkVPCwRK3AWIlsrN9Gzhp8aL+4tPUzh2ReY
	hVbBXOeIuevh44DsLxXkpihTekRJ/wXAk1f6tzNOo/jFm98jgJXoVyGOwMwgQBIhMnV4am94Shd+Q
	MpNt+dUPWpOj2ORTPReKgtt4IMs+ETFCh/r3UaKki5+ZKGh/DKgHoktfhkXVYt+wY0zjneq706MGy
	1KQQynY3D+t52Hr11MXv1G1bKyrkmWgUMGJt6LGnTEnbo4H+2Ho4gFOoYuBENcz8uMYqq3a4n8uY7
	AyPp3img==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLRn4-00000003GCc-15N4;
	Mon, 26 Oct 2026 20:59:34 +0000
Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.68.102])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLRn1-00000003GC5-0wOH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 20:59:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1793048371; x=1824584371;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Qrq3FNW/0SEN44vJvKEC14nzqvJcKELdScbHaQ9C9/o=;
  b=U88cmBZ8kGd7/wi3g47FIP7+8zAAHv6GlY00AORSRh1kMn5zhu6sFXCp
   Cz++JJZkKM7X62GWfXqcvyLMOqKDwRAurt759Rn8eub59JIgitv8nD/hA
   cL7lLc+JW+3qB7IIgNzsjee2bPFDsthmod15jRx8rTf+po8okVERUCjnM
   +jSQr5QSNb9R6KVkGK2upc7yVM/2FcDbfYjmrsPQe8ZrwmuxGlGCYexIx
   T+MLo72MOmWCtqSPdCusMr/+uWaF1Y7gWy8uEC9qCR0p5p+8puHajU6hT
   xSn8lXVx/qF26e6HElqr7uDO612YE9eCaWIfqhP6WzrIK2CRgrTAIkxMu
   w==;
X-CSE-ConnectionGUID: T/lN1pTdSIKq7SWI0pE8qw==
X-CSE-MsgGUID: uyvTqbsmT1mmcWIkKx8aPA==
X-IronPort-AV: E=Sophos;i="6.27,180,1787011200"; 
   d="scan'208";a="32211838"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 20:59:26 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:31130]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.41.86:2525] with esmtp (Farcaster)
 id 2862e1d7-248b-4929-83d9-7d6defe956f7; Mon, 26 Oct 2026 20:59:26 +0000 (UTC)
X-Farcaster-Flow-ID: 2862e1d7-248b-4929-83d9-7d6defe956f7
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Mon, 26 Oct 2026 20:59:25 +0000
Received: from dev-dsk-patrzhan-2a-52a3f46b.us-west-2.amazon.com
 (172.22.91.11) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Mon, 26 Oct 2026
 20:59:25 +0000
From: Patrick Zhang <patrzhan@amazon.com>
To: <netdev-bot+sashiko@kernel.org>
CC: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol
	<mailhol@kernel.org>, <linux-can@vger.kernel.org>, Pavel Pisa
	<pisa@cmp.felk.cvut.cz>, Ondrej Ille <ondrej.ille@gmail.com>, Harini T
	<harini.t@amd.com>, Michal Simek <michal.simek@amd.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Jakub Kicinski" <kuba@kernel.org>
Subject: Re: [PATCH 3/3] can: ifi_canfd: enable NAPI before starting the controller
Date: Mon, 26 Oct 2026 20:58:55 +0000
Message-ID: <20261026205855.871681-1-patrzhan@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <179274950592.3130.11275892525697074934@kernel.org>
References: <179274950592.3130.11275892525697074934@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWA003.ant.amazon.com (10.13.139.47) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_135931_313976_260FED2F 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -11.9 (-----------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 23 Oct 2026 09:58, netdev-bot+sashiko wrote:
> With NAPI enabled before ifi_canfd_start(), can ifi_canfd_poll() now run
> against an IP that has not been reset yet? Can it also run alongside the
> reset and programming sequence in ifi_canfd_start()?

I think this is a valid point. Unlike ctucanfd and xilinx_can, which reset
the controller in open() before napi_enable(), ifi_canfd_open() does not
quiesce the IP first, the handler is registered with IRQF_SHARED, and the
ISR acts on the raw IFI_CANFD_INTERRUPT status. So on the first open after
boot or kexec, the poll can now be scheduled before or during
ifi_canfd_start().

In v2 I plan to call ifi_canfd_stop() in ifi_canfd_open() before
request_irq(), so the IP is reset, its interrupts are masked and pending
status is cleared before the handler is installed and NAPI is enabled.

The bus-off restart path through ifi_canfd_set_mode() already runs with
NAPI enabled. I will leave that alone in this series.

I will wait a few days for other comments on the series before sending v2.

pw-bot: cr

