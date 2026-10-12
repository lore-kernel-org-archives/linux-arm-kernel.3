Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5669CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 10:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QsFlIlN5aWHHolsebxmqNtiQ5ET4xlEq6T+6IpWR2CU=; b=hj9iGvxaTLljucjWJ5ZFoALxLO
	REi7Mn01j+lSGvZzYzzMtJ2SN+3s0/d5g5az+bD6kpTJHYSw7ScPm/koGj/EP0Uf8WTbNwoPCZek1
	FxwK/Ww5oekOo7U7h7EcHWiw9FxIYLuyDkIcVZsBjXaXDUNbFUAWPLiFHqsOaYXCKb+p6imZ81VFd
	psj6eVCAp9EGt4Lo0OOQMfAx/szmf+wKHtUZPpDu2LrWEyTjxrV6tWSmDk1v81WX6P4jHM1Fyd+83
	y5hfNVNkUz7Ceg7GPoT/3PBG0hkgv9RfDMosY3BWLf07OnM/z1tp3WXgX3V3fnljg5PqygFLS0Hz3
	ARnL52kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCqm-0000000A9DA-39Sv;
	Mon, 12 Oct 2026 10:01:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCqj-0000000A9Bw-46Cg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 10:01:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C8DC1655;
	Mon, 12 Oct 2026 03:01:35 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AAFD93F882;
	Mon, 12 Oct 2026 03:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791799298; bh=ioxAD5NEefwHCH7m0022ZaZKRDDFOL0UF+08q7OYx5Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qxS42MyAin7q7dbLbP9d7IHPiEH86Nq81W40jF9iIYzNHUyBoljSr+qhFmjjPj8Ef
	 o/SfuKhtd8dL4Z6UW31sKmN1yOSjJXowxToSdUQxg66HMP9zK/Pcdl5v0QWtePN5kr
	 syt4hJ34mdOKUtJWS6ApJrs0jHLP1bPaso+hy0C4=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH] coresight: tnoc: Constify amba_id table
Date: Mon, 12 Oct 2026 11:01:29 +0100
Message-ID: <179179927012.2623661.5598266686499948785.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705171934.116425-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260705171934.116425-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_030142_055157_B735841D 
X-CRM114-Status: UNSURE (   6.10  )
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


On Sun, 05 Jul 2026 19:19:35 +0200, Krzysztof Kozlowski wrote:
> Static 'struct amba_id' table is not modified so can be changed to const
> for more safety.
> 
> 

Applied, thanks!

[1/1] coresight: tnoc: Constify amba_id table
      https://git.kernel.org/coresight/c/343cfcbb3ecf

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

