Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A6BC982C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 21:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xs5HmIVrttwINsKb630tCSQ/nEHmOYxb9Ym6t3UCmkc=; b=ZUrh5yWAjJgLSPRf8OQ8EJcbAy
	bY1qMNXm/JJpm3cn7vq11Eg3ruzOlFzsD+W5GJiDC5nmSbP4UGoqzOZQdWNIJV7h0FTfARmHWZwRi
	hhu4reh+obaAO+aW0KDjGNAfOKz8TXtlkYR+IS0ME9EfczGq0mHpWjbJzDwM0CWTy5AD9cCYxmhe9
	fAmqCRBBb3uiteSFHTW397zZawFWGbPEsg4dnXAwqVfr5qEXtelC/5QzQv31NToVXh6Gt9og/abiS
	K2eZuOO7kpKXBmKhF0oeaoR6r1HxZ9a/AdTR0YClUGZjG6xtvAXO5UURV9Ad0kkQp0hyoF6mkMBaF
	FVFUMzmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6x7I-0000000A8vM-0pCS;
	Wed, 16 Sep 2026 21:24:32 +0000
Received: from out-252.mta0.migadu.com ([2001:41d0:1004:224b::fc] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6x7F-0000000A8u8-3hsd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 21:24:31 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Xs5HmIVrttwINsKb630tCSQ/nEHmOYxb9Ym6t3UCmkc=;
 c=simple/simple; d=jimenezcarrero.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789593868; v=1; x=1790198668;
 b=bKErcRzfYsVjuqPh+TtOxvSIylFyAjKfQNhw6UG/vZ2S0N+U50Pir5J6ecJiavuaWjiQhgL7
 gZ5CaBTzguUcsHDXs5O3clwBzjLlr5f/zuRhWvTwstn1s1qDc5pwBxxuHGMNyIgnsBPlKcjkbVh
 S49O6rCk6eBQSLIoQF7x/csp2VOcbKFwYmx6+iFpKscPUYSF+4j7KW2rpXqQCfmP98cQcwZanjH
 HYiHkUPwvqTjcTOF+577l6mUCImJEhLC0Hr+N48b6D70zZTx9rcg+E/8iG14RfFkmyE/1Jk+lpZ
 2bDOic6rwTHt3Z20JyF3BLy4jj9/twB+XYn3wnKCERUjA==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id bde3667cbddf0f0b;
	Wed, 16 Sep 2026 21:24:27 +0000
X-Mizu-Trace-ID: bde3667cbddf0f0b
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
Subject: Re: [PATCH v3 2/3] platform/x86: serial-multi-instantiate: Fix SPI chip select on platforms with incomplete ACPI cs-gpios
Date: Wed, 16 Sep 2026 23:24:09 +0200
Message-ID: <20260916212409.7255-1-juan@jimenezcarrero.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901192625.1497791-3-khalil@rentman.nl>
References: <20260901192625.1497791-3-khalil@rentman.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_142430_056478_99040BBB 
X-CRM114-Status: UNSURE (   4.51  )
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

On Tue, 1 Sep 2026 21:26:24 +0200, Khalil wrote:
> Some HP laptops with Intel Lunar Lake and dual Cirrus Logic CS35L56

Tested on an HP EliteBook 8 G1i 14 inch (DMI board 8D8A) with 2x
CS35L54, together with 3/3 and without 1/3. Details in my reply to the
cover letter.

Tested-by: Juan Jimenez Carrero <juan@jimenezcarrero.com>

