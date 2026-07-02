Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48ECC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 08:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1dNbnc7I3V0np/7O7HHdon4jY6kgmFpDewM16mS+RD8=; b=rx+T4FXVkq+t+ByqgHWrYLme+5
	HgK4eppuaFGsvb0aP3rKGfG3PoUA4+6rzzHHA20ppERDseb9zUtfbQlzjUr0O0Eqp7IZWN8BiEF7v
	Xi/aAKHxE0XO4aq7e3P5Y0x+0/LxPHvGxqAb450iG0FuLKYam1AhfBBSWPtruiKgmc1TXZ42k+bdj
	THT8kCf3MgV7etdxOy+r6Xj0WWbQujopMoV/KiWDd/xv1HHTxP6TimIUk3j8KoqHUNcR2ZFuRhF5M
	169zuDbi0sI5+wg8HW1i6ANLyEp267wapxkVOCE0Cdq5PlmXWtufImrkhmay3tkAHV4ro2fSR2gnu
	LJAjPiZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCou-00000003sUa-3R96;
	Thu, 02 Jul 2026 08:30:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCos-00000003sUC-2ui5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 08:30:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E903C356E;
	Thu,  2 Jul 2026 01:30:44 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D3CD33F905;
	Thu,  2 Jul 2026 01:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782981049; bh=53jutx2nIBzi+bUTAuyz0F7HM/xhqBvW1Nmp6N/44cA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l1TZHRdjkb+IHGGvGNcnY5wUsqIdpI8pryAhBDq70IaVbGy8A5eDX6bcZQQoMK9gr
	 UmcmKcgZjI/QayHK7oBUslWYa2ud8MnRTVnYwTE7BsQf2Bo0lTSiX9oP+8UAwG80u2
	 fS5wj6/3h0TTQWODYboLTB3QuTDe3kLL0SSxWpbA=
Date: Thu, 2 Jul 2026 09:30:46 +0100
From: Leo Yan <leo.yan@arm.com>
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Al Grant <al.grant@arm.com>,
	Paschalis Mpeis <paschalis.mpeis@arm.com>,
	Amir Ayupov <aaupov@fb.com>, linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org, linux-perf-users@vger.kernel.org,
	Leo Yan <leo.yan@linux.dev>
Subject: Re: [PATCH v10 0/9] perf cs-etm: Support thread stack and callchain
Message-ID: <20260702083046.GI1812158@e132581.arm.com>
References: <20260617-b4-arm_cs_callchain_support_v1-v10-0-e8b6e5d63db5@arm.com>
 <akMPoLNBbAEyNU64@google.com>
 <20260630082310.GE1812158@e132581.arm.com>
 <akRX7gwfDh01AD4-@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akRX7gwfDh01AD4-@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_013050_795469_8B99CC9B 
X-CRM114-Status: UNSURE (   7.80  )
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

On Tue, Jun 30, 2026 at 04:57:34PM -0700, Namhyung Kim wrote:

[...]

> Hmm.. it's not applying anymore..  Please rebase.

Thanks for reminding. I'll rebase it and resend today.

