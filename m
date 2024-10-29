Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21533D3A67B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 18:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gLOpqQS6Cx41E//gvW7g1h68ce0ylwRidb+H1v428L0=; b=oFsNYcTT7YFSYe2mIxxOr3ba1L
	LjK7PfARu6OKjJgcUGgnbe6Bo6rydQjxNLqW4+JsZPldcSsvd3r1+vw7VqLx4K4A5H82BhpbA3C1G
	n1V2s5aR0Y7gRkdh8/fJP6u408UeumKN2Ltqf4ZXj0uXYNdVyF5o3pJy4txDdlzxH2i0orE6Eawag
	K9Wgr/5ek3mEf2X2sVSwkep/B69vEbCNsa9dPMQrnzQnfhCHHQY/X6x9u5kKwN7Gc0xROskrES9gZ
	F1XP+dDAVQ+cTypkPGxRBCsxB1kCPzUgDx13wfzLXUd4iRuofniZO2n/j1xkwaRmJ94dpgC5wBRrY
	38GlX7Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5r0a-0000000FUik-0t0D;
	Tue, 29 Oct 2024 18:32:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5qyQ-0000000FUHV-421h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 18:29:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 734E35C5DF4;
	Tue, 29 Oct 2024 18:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA5FC4CEE4;
	Tue, 29 Oct 2024 18:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730226586;
	bh=UCgYXyHDHZOpF0R5/uphJySyNxle9b54Ia2xXewkD34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jp4sGmz1SNrfNmEKtpfI9Cw7nHUPYRkTBfI7Y6yZBLmKKwu0R5zPND37+UYPqRgPc
	 fFMOZQ4+lBYw2LyvxPefLMkQmEvnQN9UUD2yaKjx6IeaQF2KN2dhOraV0yGDR1miXl
	 YYdH7sCgOYHJXOFJCChfDzqqylJ7FCUcIuqRDXFCgrh3TwaCOGH2vknQiL1VhsnFNx
	 wTp51+SLiymnnpNAnOes/1NtsoIgEyzThK75Nl+n/pBpQqyXA5lztLHBFCLnI/sQDj
	 D82yT13hTG1vZvXtEqiKQXC31Hu/ecS8QLiiAPAs/zNtHcZ4Ku/5MxjykRc96wMRFs
	 8vDUo8HlRszCQ==
Date: Tue, 29 Oct 2024 11:29:44 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Frank.li@nxp.com, will@kernel.org, mark.rutland@arm.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, john.g.garry@oracle.com, james.clark@linaro.org,
	mike.leach@linaro.org, leo.yan@linux.dev, peterz@infradead.org,
	mingo@redhat.com, acme@kernel.org,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH 3/3] perf vendor events arm64: Add i.MX91 DDR Performance
 Monitor metrics
Message-ID: <ZyEpmC5yKBXR0JfN@google.com>
References: <20240924061251.3387850-1-xu.yang_2@nxp.com>
 <20240924061251.3387850-3-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240924061251.3387850-3-xu.yang_2@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_112947_065018_EBD01488 
X-CRM114-Status: UNSURE (   6.18  )
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

On Tue, Sep 24, 2024 at 02:12:51PM +0800, Xu Yang wrote:
> Add JSON metrics for i.MX91 DDR Performance Monitor.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Applied to perf-tools-next, thanks!

Best regards,
Namhyung

