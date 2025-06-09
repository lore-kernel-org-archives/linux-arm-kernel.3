Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66F8C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 11:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qtUzeGCmU1rtJYoe2mYnBQu/3uiITeey2Z4kyiks/pI=; b=ocdxDx2Cn/dXNMxzAreju34NJ1
	LuHPg3Z2O+ogfMJsrihTqaJosqTVSecjkEpPPQcJZtOLZuWZ1xP6wouyDFDGdR81Ol9ibyb9FNhzH
	UQvMJnvDLXUmUHcdbS/wi9FDL5Kxzrq6z2RcRvnSq/h0JY7eBGwesn5jshuE//LvwW5yQA9WLcO5U
	MezM7uq40Alvd28KFqui+XjbV/+Br29wWdnCQYwa/BBcseoPv9+2+bPIaf8LslPomZ60KNU6GrjEL
	1rW29fyzyW2J0JBFZ0scpGlpruSR8PucLsq4WwEq5xJnoEF9gCZ0ASBWSZENNMBTgbGDU84gnv88t
	UfPmuJgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOaMI-00000003zAx-1lL1;
	Mon, 09 Jun 2025 11:08:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOZoy-00000003uww-2Kzg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 10:33:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 49C46150C;
	Mon,  9 Jun 2025 03:33:21 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C8AB03F673;
	Mon,  9 Jun 2025 03:33:38 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bill Mills <bill.mills@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_ffa: Fix struct ffa_indirect_msg_hdr
Date: Mon,  9 Jun 2025 11:33:31 +0100
Message-Id: <174946516044.1179265.589690012016225965.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <28a624fbf416975de4fbe08cfbf7c2db89cb630e.1748948911.git.viresh.kumar@linaro.org>
References: <28a624fbf416975de4fbe08cfbf7c2db89cb630e.1748948911.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_033340_647450_E5A87A62 
X-CRM114-Status: UNSURE (   5.65  )
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

On Tue, 03 Jun 2025 16:38:53 +0530, Viresh Kumar wrote:
> As per the spec, one 32 bit reserved entry is missing here, add it.
>

Applied to sudeep.holla/linux (for-next/ffa/fixes), thanks!

[1/1] firmware: arm_ffa: Fix struct ffa_indirect_msg_hdr
      https://git.kernel.org/sudeep.holla/c/4c46a471be12
--
Regards,
Sudeep


