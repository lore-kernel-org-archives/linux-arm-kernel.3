Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4731EC982C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 21:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hmKfVCLen13baZ+o0Le6d7BN5zcAvr0TjZzOdGbyQ1o=; b=cHp61o6kDr/FS+OcfaCAr20LW+
	DuM6BBjyIAfH5qjJ512NED+f57fJ5VOjK08G8OIbdfElbTJ7gUXbme58IX363zZJ1tcGERrfSTBz3
	cSYiPdxLh3rnXpLmTk5lpX0XAn/DXYTRrG5pSv/w3hFDXGIxjJMNquehp6lUPfedmvZ4J1VFDd029
	/ZCtjrlRxVU5ygUf1Pq64ORj1JCxaEmkNQu/ZUgTCwx3i8nkK2GXvOycm+rxUDp2WIqOlG1TWw7KW
	8VvNpzpD3iKHUOmx8P8l6BDljbfJKAt3BM4jr5jfaqHm8UZGQvjXPzPqgDNhzCXJQ0iUro7sQU6z8
	dXJOjwLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6x86-0000000A94B-1PWM;
	Wed, 16 Sep 2026 21:25:22 +0000
Received: from out-34.mta0.migadu.com ([2001:41d0:1004:224b::22] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6x83-0000000A93Z-3rz4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 21:25:21 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=hmKfVCLen13baZ+o0Le6d7BN5zcAvr0TjZzOdGbyQ1o=;
 c=simple/simple; d=jimenezcarrero.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789593917; v=1; x=1790198717;
 b=KOnT0/gU98JSnvnA855IUEQ9iqQafxrHbA/uLbGbck5GKZFKeL6YKO89padINqo6OzWA3VDz
 zXRJj+86vLsqp7rrMLBdWPuaxbu0bh1kHgl7ckjxsYTFBTm9ntiaBQBjK6wFKMRf10bDbRDwMQP
 UYwAVdjhcWyt73WNYnfArrFK2b8iJ0zsJ4yNmay93HUebrhH1muKqJg3SA1cBjhxTIYv41mT2Ee
 fgxGsyQKElysYvBidYQA4m5wc3TvqG+BtiR3r6I1HUvOWLMLyjCc2JdBQzhSn5Q7AmNp68TLgeZ
 9NhDVnOPAt0jWiVaX/zzEEg+CArfk4j/1338fejI0L0Gw==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 3a560847db53b00c;
	Wed, 16 Sep 2026 21:25:17 +0000
X-Mizu-Trace-ID: 3a560847db53b00c
X-Migadu-Flow: FLOW_OUT
From: Juan Jimenez Carrero <juan@jimenezcarrero.com>
To: khalilst@gmail.com
Cc: khalil@rentman.nl,
	rf@opensource.cirrus.com,
	broonie@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	patches@opensource.cirrus.com,
	linux-spi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	daniel@zonque.org,
	haojian.zhuang@gmail.com,
	robert.jarzmik@free.fr
Subject: Re: [PATCH v3 3/3] spi: pxa2xx: Handle clock gating for GPIO chip select devices
Date: Wed, 16 Sep 2026 23:24:28 +0200
Message-ID: <20260916212428.7293-1-juan@jimenezcarrero.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901192625.1497791-4-khalil@rentman.nl>
References: <20260901192625.1497791-4-khalil@rentman.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_142520_099738_D665930D 
X-CRM114-Status: UNSURE (   4.32  )
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

On Tue, 1 Sep 2026 21:26:25 +0200, Khalil wrote:
> On Intel LPSS SPI controllers (Cannon Lake and later) with dynamic

Tested on an HP EliteBook 8 G1i 14 inch (DMI board 8D8A) with 2x
CS35L54, together with 2/3 and without 1/3. Details in my reply to the
cover letter.

Tested-by: Juan Jimenez Carrero <juan@jimenezcarrero.com>

