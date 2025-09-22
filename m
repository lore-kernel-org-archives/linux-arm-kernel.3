Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DA5CAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 08:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GR/k4CdxbzNXlgtzg6WF+sp82AuQUVvo9XEgqsrzlXw=; b=NCuxSdCTXJ3jB9Jm8KfOFUowdN
	tffjPbvNKm7KL3d6mXf2nH2sH7GDkxgq1h/56OsmRFExrMutBezdL1EosVCHMifMd62KlVT5sTd5g
	MR0EJTDUXpFTETftS8WGxFQmjGWzYauth14z+a+xuFPXpqX9tpLm+7zNGpwsDk6MVsicIWYLZ9rWV
	xBdoyqgCNWjRy0ix12fTFIpnjWWrNIvB3u1GaGpjiDG9hvtm76oBnOXq+C7gP61mBE89hOJYp/fCP
	t7HtSfZVVBh5uVvij5pz0MWBR1VCe5cNMXOqnyBIt/PJjQiv2eOHwQvzkG9dZmvQfudkBSfVHa30f
	kXO7hktA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0cBe-00000009n9m-2unP;
	Mon, 22 Sep 2025 08:46:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0cBc-00000009n9S-1sAB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 08:46:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19D0D150C;
	Mon, 22 Sep 2025 01:46:07 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E14303F66E;
	Mon, 22 Sep 2025 01:46:14 -0700 (PDT)
Date: Mon, 22 Sep 2025 09:46:13 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Carl Worth <carl@os.amperecomputing.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 3/3] coresight: change the sink_ops to accept
 coresight_path
Message-ID: <20250922084613.GD516577@e132581.arm.com>
References: <20250922-fix_helper_data-v1-0-905e8115a24e@oss.qualcomm.com>
 <20250922-fix_helper_data-v1-3-905e8115a24e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922-fix_helper_data-v1-3-905e8115a24e@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_014616_529356_A00D8A10 
X-CRM114-Status: UNSURE (   8.48  )
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

On Mon, Sep 22, 2025 at 03:31:41PM +0800, Jie Gan wrote:
> Update the sink_enable functions to accept coresight_path instead of
> a generic void *data, as coresight_path encapsulates all the necessary
> data required by devices along the path.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

Good refactoring for me, thanks!

Reviewed-by: Leo Yan <leo.yan@arm.com>

