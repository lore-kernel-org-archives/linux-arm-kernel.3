Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514AACCF2EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 11:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kvTh6Iu0yvmhjLLnuDRjPupynu2IkaDjhMNyPAZHLNY=; b=Fb9spVAOGeKkTliwXIo5NXeqOF
	NevKxzJ8ry9yWbWCg/px6ps+WqzFuGVCJge8nbScFf1HjElLrkNg9SeQL+sE5DZKp6+YDZ//rZTL7
	ZBOe6KzuUsOegtfdkGRYE7n3uM5qGlKbcZ4AmRoNC7WDMHRqoPFdW0g0sEtZJE1s6jc38OKhn+pAq
	XS0a8XnhsfRanQCiyoYZEi0o3dJzyxy7KBy12rLwVApy7TKRFUHxAb0FHLTXONxf9fGvdHm9HkKtS
	vNk6JzK64FqMBG/6SNdiweSHs0Tv3Tg8jDCPfXwpRd+dzHS6za9ri07zAQ+4ba5mSVE8jFP167v0M
	V3kMSE7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnpi-00000001vJG-1IoW;
	Mon, 19 Jan 2026 11:54:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnpN-00000001vFm-3cb7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 11:53:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C383E1517;
	Mon, 19 Jan 2026 03:53:39 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 670523F632;
	Mon, 19 Jan 2026 03:53:44 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tingwei Zhang <quic_tingwei@quicinc.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Kim Phillips <kim.phillips@arm.com>,
	Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
	coresight@lists.linaro.org,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] coresight: etm3x: Fix cpulocked warning on cpuhp
Date: Mon, 19 Jan 2026 11:53:30 +0000
Message-ID: <176882354697.1800388.2817378483525119566.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260108152427.357379-1-antonio.borneo@foss.st.com>
References: <20260108152427.357379-1-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_035349_972275_0004E250 
X-CRM114-Status: GOOD (  10.11  )
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


On Thu, 08 Jan 2026 16:24:27 +0100, Antonio Borneo wrote:
> When changes [1] and [2] have been applied to the driver etm4x, the
> same modifications have been also collapsed in [3] and applied in
> one shot to the driver etm3x.
> While doing this, the driver etm3x has not been aligned to etm4x on
> the use of non cpuslocked version of cpuhp callback setup APIs.
> 
> The current code triggers two run-time warnings when the kernel is
> compiled with CONFIG_PROVE_LOCKING=y.
> 
> [...]

Applied, thanks!

[1/1] coresight: etm3x: Fix cpulocked warning on cpuhp
      https://git.kernel.org/coresight/c/1feb0377b9b8

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

