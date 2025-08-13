Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78491CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 19:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dsYg9uVTT31vg0XjgaWQbCUWMl3ZH+Hy93R1PBOM/ME=; b=YxUTYLB6AhWqnQDYfh6dlioS+i
	WeCFbcm4V0CfJwJ/hz9NwReSXruuuIQp2VzPxtj5WeISQHREcr45nMVYOOqWaL03nwg8gI+Ztoytx
	7MxUPwKdDwGake4CEgjnYuwiGMAAuvtxz+UYZZMTAl2IVMIbs+cdJ9NVORi6AZcwvMWrCg/wN2Tps
	ye8lrESr8bte+Yg5IUvbkICw65oGNosw6dP/szkjjSjSXjuxGmiQVM3ljBnjzaCdmG8mGRlpV0VIV
	TO8nyqVXk2xMX+rIs4XcljfTpWv+Cc3sx2wWJqpULVwEQmWvAss/ZRgnGYpc9oaCKbq3AUXrMjh6x
	968pL4xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umHTD-0000000Esow-2xZi;
	Wed, 13 Aug 2025 19:49:13 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umGn8-0000000ElN0-2B6K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 19:05:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=dsYg9uVTT31vg0
	XjgaWQbCUWMl3ZH+Hy93R1PBOM/ME=; b=l2lpybtzBjreR2b6u3ViQ1/UyacbNF
	/9x2byoTVM+OIXRDhd/ePUPQsHzzQZgkr55wr7ZGx0FXKgRa3wKFss5LDkgSFcDO
	qB0dO+dkHBiAdTWmF7PXHENsWUg0ne7tI5tZNVh7VQA0Zwc7LD/OYnNOWba4QdWf
	MSeIom1ONHeAHWcTRoxbu2gglD9qzpOyPoFQT5OBZohUtw9xTxyijdEdizAmVChw
	pKuzewYY8aKdzIY4+RDg6Xg8ELsR8/TGNcyZ4aaGkEUBEqAE875W1hn5+QZ1G99d
	vsR+aGQMC4y3ps2wr+7sEIbOlqOmEdvf8dJpJALFQkIGktVAn59iWGzg==
Received: (qmail 732673 invoked from network); 13 Aug 2025 21:05:40 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Aug 2025 21:05:40 +0200
X-UD-Smtp-Session: l3s3148p1@hr6u10M8jtltKDDX
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-watchdog@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-arm-kernel@lists.infradead.org,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: [PATCH 0/3] watchdog: don't print superfluous errors
Date: Wed, 13 Aug 2025 21:05:08 +0200
Message-ID: <20250813190507.3408-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_120542_831789_B9382D58 
X-CRM114-Status: UNSURE (   6.85  )
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

I found this needless printout in the Renesas RZ drivers. Then, I
updated an existing coccinelle script to find more of these in the tree.

No dependencies, buildbot is happy, based on v6.17-rc1.


Wolfram Sang (3):
  watchdog: rzg2l_wdt: don't print superfluous errors
  watchdog: rzv2h_wdt: don't print superfluous errors
  watchdog: visconti: don't print superfluous errors

 drivers/watchdog/rzg2l_wdt.c    | 4 +---
 drivers/watchdog/rzv2h_wdt.c    | 4 +---
 drivers/watchdog/visconti_wdt.c | 5 +----
 3 files changed, 3 insertions(+), 10 deletions(-)

-- 
2.47.2


