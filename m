Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284F0CA9EC7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 08:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L6/Gcz9E1F8bdFlSfEvQY7gKzPYBxHA9o0DW9D+1ZxQ=; b=kbWHFGm9uuRi3qA/Es9T7HGeCg
	uFDU0UkFF44F5peE1iv39e6zoF1W0GdHchTdYcgqIJs7e+QXVRw97SEPLGOZ/tod7OGNiqftbehZa
	lUlHvXGKq+viumj4CP4ALlxz7Pv5pNzrRfrHkQJWftI29sm1wAqaVyGDPy08wcF4qg3h933/JnK5N
	MQs5eoNSSUIjt7hGFFMvgpdwXHBC8anyvyL4TPnRJgqewZ3be5HjqkgFV8N1BH3+T6c+XiXrWidJJ
	W5s1nAXcgzxtTraOZhvwyO7Nbor2VydIfNKkrXWrtOaR5chVCh2f6WEfOlAW3lBlABnySV1jCTRkh
	gF9roHqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFpCv-00000008s2h-0EDH;
	Sun, 11 Oct 2026 08:47:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFpCr-00000008s2K-4BMg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 08:47:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1791708417; x=1823244417;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NFL1d+tnoc5IT5vRjBdw3J8nS66QldRxBGepGvo6Sqg=;
  b=Til4vhvxbX5AOfYNnN+rv0XktYaZ9/WMbctMWQskc2qjlH7BCydkxRq1
   EHsrbvToYLqs9vcx1P1qF5XgDu/orbymbwY1uOuQfwSGtP6BpbpSK1PMz
   4UJOUhX6/HB2ZDxriMDyw+rJ1C8ycJbBGZwNdYShG0SxI1OuYZGk6/wm8
   QEM5o+Q7r8hnvU7vl9sVv2ZuqnUcGqVpwkQ8OLbFS6mfv1atR+kFagPq1
   SWhlyzVyh3HQYKqK+4PaE2tIjHkHBQfDO7INJXbAK9dgxX4O9wdAA/0a6
   9N5wawVUHgfPAMOH/ndjqDtrq5QVnqEA02X9tsom8RgQn+DenPpTT8oBw
   w==;
X-CSE-ConnectionGUID: OFjkfmCJSja6H3ITLei1Jg==
X-CSE-MsgGUID: 4h5fsx6DSzucmxVQ2Pdjkg==
X-IronPort-AV: E=Sophos;i="6.27,151,1787036400"; 
   d="scan'208";a="231957431"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 01:46:56 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.49; Sun, 11 Oct 2026 01:46:55 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Sun, 11 Oct 2026 01:46:53 -0700
Date: Sun, 11 Oct 2026 10:46:52 +0200
From: Daniel Machon <daniel.machon@microchip.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: Sagi Maimon <maimon.sagi@gmail.com>, Joe Damato <joe@dama.to>,
	<netdev@vger.kernel.org>, <radhey.shyam.pandey@amd.com>,
	<michal.simek@amd.com>, <andrew+netdev@lunn.ch>, <davem@davemloft.net>,
	<edumazet@google.com>, <pabeni@redhat.com>, <daniel@iogearbox.net>,
	<jacob.e.keller@intel.com>, <suraj.gupta2@amd.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net v3] net: axienet: free outstanding TX buffers in
 axienet_dma_bd_release()
Message-ID: <20261011084652.c5y3zj7wzmj53ur4@DEN-DL-M70577>
References: <20261004083759.1016519-1-maimon.sagi@gmail.com>
 <asQ1pF9AAqOiEo3r@devvm20253.cco0.facebook.com>
 <CAMuE1bGXcNwKKX1firkq6eEzymkrDOp8PnnowMzz97SibtpoSQ@mail.gmail.com>
 <20261006180210.03a15e52@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261006180210.03a15e52@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_014658_319371_D275FAF1 
X-CRM114-Status: GOOD (  11.91  )
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

> On Tue, 6 Oct 2026 06:44:55 +0300 Sagi Maimon wrote:
> > Agreed on the helper.  As on v2, I kept the fix minimal for net, and
> > will send the helper to net-next once this has reached it, with both
> > axienet_dma_bd_release() and axienet_dma_err_handler() using it.
> 
> Let's do this now, trying to keep fixes small is a bit of 
> an anti-pattern

Out of curiosity, why is that an anti-pattern?

I'd think that small fixes are, in general, easier to backport to stable. Is this
more of procedural question - if the whole fix gets into net, it will get merged
into net-next by the end of the week anyway?

/Daniel


