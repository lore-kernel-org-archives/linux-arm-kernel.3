Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F552C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 21:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3DnNZeV5dTm5XT0nY8Xl8RIuePYRWHmOqFgRlfswEg=; b=OBM9G3ohdKAxWuMAxoqgOM0p9m
	SmbMCC7WZ+SC2Vkj2Vpa+6c5yd0yD+OvBahkIN6v64GsnuVJzjy+s7QS/a42yrQKpTr6k8Fh0RlEo
	WcdY4nuvfBb23ws5eoieZQw//U89KscVeoDWD8A5+N8a/Xecgjtxuk4QGG4q3R813daPcrX36gVF2
	lbnqCiEv5OSwRNgzIPCH7z1+XcJcLlttgfVADQdxLXWPgmBjSvp7XfRrnGEKKqHmIzIi6xLkUdEbl
	uhlbuuYDZCFWOcj/hUKxf5AwBGTcUj2vM5mXW9uP3C1WWnvaG8juj2H41m8RPRKh2pEa9klwBqqvc
	pSkq5Faw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEaL1-0000000AhG3-2TXV;
	Mon, 12 May 2025 21:05:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEaHY-0000000Agt9-0fCD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 21:01:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36CAA150C;
	Mon, 12 May 2025 14:01:40 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DCB303F673;
	Mon, 12 May 2025 14:01:49 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH v4 0/7] Arm CoreSight: Support AUX pause and resume
Date: Mon, 12 May 2025 22:01:40 +0100
Message-ID: <174708367151.538896.17315293858076521324.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250401180708.385396-1-leo.yan@arm.com>
References: <20250401180708.385396-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_140152_244157_4D92A78B 
X-CRM114-Status: UNSURE (   8.50  )
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


On Tue, 01 Apr 2025 19:07:01 +0100, Leo Yan wrote:
> This series is to enable AUX pause and resume on Arm CoreSight.
> 
> The first patch extracts the trace unit controlling operations to two
> functions.  These two functions will be used by AUX pause and resume.
> 
> Patches 02 and 03 change the ETMv4 driver to prepare callback functions
> for AUX pause and resume.
> 
> [...]

Applied, thanks!

[1/7] coresight: etm4x: Extract the trace unit controlling
      https://git.kernel.org/coresight/c/242f5feb
[2/7] coresight: Introduce pause and resume APIs for source
      https://git.kernel.org/coresight/c/0b5fce04
[3/7] coresight: etm4x: Hook pause and resume callbacks
      https://git.kernel.org/coresight/c/e2dd46da
[4/7] coresight: perf: Support AUX trace pause and resume
      https://git.kernel.org/coresight/c/e2033fe3
[5/7] coresight: tmc: Re-enable sink after buffer update
      https://git.kernel.org/coresight/c/10b9a3bc
[6/7] coresight: perf: Update buffer on AUX pause
      https://git.kernel.org/coresight/c/54c02302
[7/7] Documentation: coresight: Document AUX pause and resume
      https://git.kernel.org/coresight/c/3b0b40d8

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

