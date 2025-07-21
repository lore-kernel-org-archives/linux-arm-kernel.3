Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5372CC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 13:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qAEmz+dLc/EJoTZay46h7dAy1fU9ygDGJJ2OybZ9hsc=; b=Ut6h37OE+P36L1mrrBpudo2oTM
	JvNC6zwAf9ReaJhx81JehxpFvC7iHjTtBbF5KsBunFV/ih30U3iNdmJxa7HewGaOf++pz2xdTi4cx
	eVCP75CIFONhtJhfOh+HEihM3km54YyQJkYxA4kMkJzkLbRe7hspm9aEKwWLXs4eqy/7oTSqxPyc8
	uD/eNXUyiUrS6TEi1FEyHSspmeg76KO7ssrSvndQ8OjYX/CssRkEkvZbvUktWvR2no7Rb54xEnkHq
	rXtdFBShiUVQ8OAcC/FBQBAMpZqEGAiBGL1+9Jxp89v3ZQI3BSRC8rlIAzSXoTvB4U6hVMYcR743w
	OMctHMrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udqME-0000000HMQy-0zaz;
	Mon, 21 Jul 2025 13:15:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udocC-0000000H4us-0lpP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 11:23:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 619BE153B;
	Mon, 21 Jul 2025 04:23:21 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D595A3F6A8;
	Mon, 21 Jul 2025 04:23:25 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Leo Yan <leo.yan@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] coresight: Fix a NULL vs IS_ERR() bug in probe
Date: Mon, 21 Jul 2025 12:23:13 +0100
Message-ID: <175309697456.771946.4131106247005398198.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <7bd9fae8-a15f-412a-8800-ce47acf0b5ce@sabinyo.mountain>
References: <7bd9fae8-a15f-412a-8800-ce47acf0b5ce@sabinyo.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_042328_265561_577DBCF7 
X-CRM114-Status: UNSURE (   5.92  )
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


On Wed, 16 Jul 2025 14:38:30 -0500, Dan Carpenter wrote:
> The devm_ioremap_resource() function returns error pointers on error.
> It never returns NULL.  Update the error checking to match.
> 
> 

Applied, thanks!

[1/1] coresight: Fix a NULL vs IS_ERR() bug in probe
      https://git.kernel.org/coresight/c/f59b9437ac95

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

