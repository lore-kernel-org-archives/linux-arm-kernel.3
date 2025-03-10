Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CBB1C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 11:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uo5Nnr+2nk+OBTHh0fiAYUdvadokNlCOg6+bdfVktPM=; b=fc7ebJGAXcCXStko2Eu/hxCUJx
	Vbr/lIz5MYSrWnw2YpEiBczOvYgkVEdkwRxPEXJIXvTm4ml/A3gdwjwgdzNJxams8GcXS9WLnxBmV
	tpCNe14Vlv580yh2IULpksSIgAi0QjoS5T7qPXINhnIegARQo+vtjqOZMuuIpSkW4ingpNZaX3M6v
	xILfOL9TbAyEvue+1/xQqAMYZ4jv24eftx6PVZokGJvFfmJ7J3ASSA/Y21q/K9hzsBqnGOriZ8egm
	XPkPMqb3SiIxf8WOFTzES1Z3sarLsRGwKzPKnrQNENo4PZ3E6aCsR2nzxLJ8JmGX4dhyUQ4ca7OCJ
	vvWciSew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trbkF-00000002UjH-16H4;
	Mon, 10 Mar 2025 11:56:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trbNz-00000002RJT-2kmx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 11:33:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B7981516;
	Mon, 10 Mar 2025 04:33:42 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D93563F5A1;
	Mon, 10 Mar 2025 04:33:29 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jie Gan <quic_jiegan@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] coresight: add verification process for coresight_etm_get_trace_id
Date: Mon, 10 Mar 2025 11:33:17 +0000
Message-ID: <174160625281.2197960.2271358102397768915.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250310102724.2112905-1-quic_jiegan@quicinc.com>
References: <20250310102724.2112905-1-quic_jiegan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_043331_734447_77181E3F 
X-CRM114-Status: UNSURE (   5.93  )
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


On Mon, 10 Mar 2025 18:27:24 +0800, Jie Gan wrote:
> The coresight_etm_get_trace_id function is a global function. The
> verification process for 'csdev' is required prior to its usage.
> 
> 

Applied, thanks!

[1/1] coresight: add verification process for coresight_etm_get_trace_id
      https://git.kernel.org/coresight/c/ab37128a

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

