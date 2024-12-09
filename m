Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A0BE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 18:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RcHXb9K/TGVBbw8RVftChP1LaekfCfm+IU704FJmEBY=; b=wFk81ZzqkTnyFw9qZtHeg0+9Fe
	2V2HKmMmhb23dHteLviJtbeFcLWheKwocW3GOSrpSbJguybtSWT0H+Dshq6WmLEBJdszMnRTwHjL6
	HSl8fKdcDpzLnNtGG3yHnuagH9zcEKrFKW0rIUlZU/82gN5qYrxoUOitOIK8fUn4J6Za2Dj9p31UF
	uSr2ED5KJCZWmV+xeN2xRCeqNGLnniUu2Vt4PmQOlB8I+/6p6OINJmd6bdh0lQrkC9p8usQuOW8Jq
	VBt73MVVsGbQ3yBUQ9I7lFnEogRtuHnxv4k6DQoiV5PJ6W4PYJKScmXqv3rXCIdF30z85E76ugF85
	kjSpAblw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKilx-00000008v5U-2z4o;
	Mon, 09 Dec 2024 18:46:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKiix-00000008udR-3xL0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 18:43:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E087E5C5FC6;
	Mon,  9 Dec 2024 18:42:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C97D5C4CEE0;
	Mon,  9 Dec 2024 18:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733769795;
	bh=oidCVoBY0zjgPWvYnf0lrXH8tzAXlscQHGGvf0VyRRE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OhIjm9b8V3uwZoGM9Z5C1oceZArVlNvZeiuYjFsATerVU3Fnu3xg04UlebQYS2T2y
	 egJaFuX9+EedqhbL90l+5iXWIb5VQDTUmL/DC1rJO/GmdpPAHB5mpXLkkAwsEVHnZo
	 e51ZILSCURsCdnEgYDEJnL0cl2+MvgMLai7D5/BHlGnLvmbC8uqMM1ChSCSh8OlBGV
	 OSAEhNGzyvXiC5wwlfArFOHS3f82BZ7aQAbVAPPEThC8BGPDHnFndXS+Z/UZDtf50P
	 WbtUVNoctf/rbkoejEX0lC+7XIA0mNoLKe2/Bo9ivQuK3JusU2OK1ouZ4bQ5Kx23/M
	 oX5V0eBWHk7bA==
From: Will Deacon <will@kernel.org>
To: Shuai Xue <xueshuai@linux.alibaba.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/2] perf/dwc_pcie: Fix the swapped event numbers as well as the documentation
Date: Mon,  9 Dec 2024 18:43:03 +0000
Message-Id: <173375912254.1125785.1872820731502163004.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241205061914.5568-1-ilkka@os.amperecomputing.com>
References: <20241205061914.5568-1-ilkka@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_104316_023944_303AD372 
X-CRM114-Status: UNSURE (   9.06  )
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

On Thu, 05 Dec 2024 06:19:12 +0000, Ilkka Koskinen wrote:
> According to the versions of Designware Cores PCI Express Controller Databook
> I found, the eventid for "L1 aux" is 0x08 and "TX L0s and RX L0S" is 0x09.
> 
> Shuai and Jing, could you verify that your document matches ours and the events
> are indeed swapped in the driver at the moment?
> 
> Cheers, Ilkka
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/2] perf/dwc_pcie: Fix the event numbers
      https://git.kernel.org/will/c/e64c22cc2e61
[2/2] Documentation: dwc_pcie_pmu: Fix the mnemonics and eventid
      https://git.kernel.org/will/c/8632306e093c

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

