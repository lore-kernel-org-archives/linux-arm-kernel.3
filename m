Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3330FC5910
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 10:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s021WFuQ4aN5Za5roNFnQHL4/t2NgPbjyCfo2WOubSE=; b=oycBLKx1G3SqAqwwv/02uBQIKz
	XB90eL23TX9tDhykd6r2zNYirhCGIN07h4SoRrYf6k98j9Y9WaV5X6Cz44NeVba6XPu74YDH8VvXH
	vBqpMwPSSq5a5eHNpnvhxCfSXEF1VEciWMVRb31/c9anmdoLi20cfbp5gW4k8L9FocPBn3rauNcNq
	YdgtwOZ9ywlmhP4TAPY/1wrMQCPx0fAapVJ2M+gSl8z3SAhF4mzBKY8KvAw/YNx4hobwh/qIQM1q5
	SaflcB4VloiOzjHy5i/wmXCwU3sjUvycTPfaHp/hh4JtSNDjKW6Q5UbIDOlQGNF3oHJJb12lPe7uc
	VSJkDGzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYDg-00000005qvv-34Tf;
	Thu, 26 Feb 2026 10:03:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYDe-00000005qvZ-07Y5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 10:03:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BFCB91516;
	Thu, 26 Feb 2026 02:03:33 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DA97C3F7BD;
	Thu, 26 Feb 2026 02:03:38 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: ctcu: fix the spin_bug
Date: Thu, 26 Feb 2026 10:03:25 +0000
Message-ID: <177210018860.1370014.12776574224023445436.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219-fix-spin-lock-issue-v1-1-557f7d513d7e@oss.qualcomm.com>
References: <20260219-fix-spin-lock-issue-v1-1-557f7d513d7e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_020342_113131_6D15AB34 
X-CRM114-Status: UNSURE (   5.18  )
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


On Thu, 19 Feb 2026 22:46:57 +0800, Jie Gan wrote:
> Acquiring an uninitialized raw_spin_lock is invalid and may trigger
> unexpected behavior or spin_bug.
> 
> 

Applied, thanks!

[1/1] coresight: ctcu: fix the spin_bug
      https://git.kernel.org/coresight/c/36ffbbc2b387

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

