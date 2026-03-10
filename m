Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D0E9FD4F03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 17:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mINwcZZQTmGEGHxfticOhxjLTWxBja6dcnyB4TNBAls=; b=2nnmfkT9rrLhlvok4SO3596uHU
	30t1dYV0daIDoENslnOSI65QjPqcgypcaIw1tWXjt8GzMKq4Grah2/EpeN6uVm8a+AYgt4cANsOvE
	7IcuBUyTZT6kTYeYGtfY8f1TSouq2lBiNmF8v+HzK5wj1/zjQLun0Sn5wk4vEXgsJWcIvaA4A8IWq
	9EygxS9t0EFQtpWfm/XaqeginnX06jaVjqgwuOeMWIE/c+UZOj+gnOTpKbrrLS42Bn2OVA9IzfbJw
	LgyG2RjFWbP8adPS+kNvio8U3WQgw+bFbsSbYDt3hQnHcy21IvLZNeYrjnGPt+5bg8ug5LczTZa9Q
	F5Mj70wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w00WV-00000009wnF-1Yoj;
	Tue, 10 Mar 2026 17:05:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w00WP-00000009wmg-0mUR;
	Tue, 10 Mar 2026 17:05:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B9B5241ABB;
	Tue, 10 Mar 2026 17:05:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 696D5C19423;
	Tue, 10 Mar 2026 17:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773162327;
	bh=8XCjPyMkbQAR6V06f2fG0uPF2MRjPbY71EQ3H3l08wc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qZ5/ht5ms3Ah+oFoR/5B9Dny7+sVYRd64j9tx0UbyLTN5ydGYKcqcc8UYVYZmdo9h
	 JculUWPgrSWBRgcKDmNLF4ARZwFYnylvvX9A0HBBAlTivNHNUgng7HGNn6NY08A199
	 fPaNHAIfOE8WxNzV1SvFrHZeMyp5u9rC234fMx66Ak+fG2xlF02u2be/gaz/CKPGss
	 T4YRI2hNojcq7tcDO5umYTA2VlMfcFrzrWnBxOth6JQ/nHHaI4EeMwA53uCNFERGHk
	 Bx4LUhkAPLjF4+vNZT4IyHVTcylZU8ZeCZUFSusapGeLId7xjxCmhrQ5Fx9hicI94B
	 kh+RHV00suSWA==
Date: Tue, 10 Mar 2026 07:05:26 -1000
Message-ID: <1e1412049d60bec19363c3121b19fd48@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Sebastian Reichel <sre@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Tobias Schrammm <t.schramm@manjaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Lee Jones <lee@kernel.org>,
 Dzmitry Sankouski <dsankouski@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benson Leung <bleung@chromium.org>,
 Tzung-Bi Shih <tzungbi@kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 driver-core@lists.linux.dev,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 chrome-platform@lists.linux.dev
Subject: Re: [PATCH v2 01/10] workqueue: devres: Add device-managed
 allocate workqueue
In-Reply-To: <9a9cb7f8-54cc-4c43-a5a0-f022394351eb@oss.qualcomm.com>
References: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
 <20260305-workqueue-devm-v2-1-66a38741c652@oss.qualcomm.com>
 <aapTSyrkqqZ8j_XL@slm.duckdns.org>
 <9a9cb7f8-54cc-4c43-a5a0-f022394351eb@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_100529_267102_0DC93FE3 
X-CRM114-Status: UNSURE (   5.01  )
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

Hello,

Applied the first patch to a dedicated branch. Please pull from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-7.1-devm-alloc-wq

Thanks.

--
tejun

