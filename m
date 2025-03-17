Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFD8C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 10:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZCCMMvb4Ea+1IwFVDVZyBgZBjndTLQya76orrwhuGg=; b=OnDJQQzqSgAcSXrwV3wJRtNYKa
	FRSznm7Mbl77DWejfP5PwPBtBP6LVCSOGjMlgkdOeaelxnnX9b1xhvwHVbj6b7Q+RyLwd8U5HOWQA
	4ItwQjMmdQ/l3PvdLcrE4BVfl5cWyUKC/LGZmZltc4cvrw1qq4geaodNUUEmRnxNWWXBk3LBzG1SJ
	w7pA7gL4ctGb/JLQ5yo2xqVC34KjHM+HK0KBVnOqU0nX8Gw0A4nJTXwmSO3mKfhw1pImDSaAho3mo
	0AdCbqVOsjmCy1ASxA4tkxJGzi5CB2H7DpneyPnSoiZAblTp7fr4qFaedUDjcefI/mgtADj94AC45
	FE4+oPGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7RH-000000024jh-0UCI;
	Mon, 17 Mar 2025 10:11:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7OC-000000023qn-3Pg8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 10:08:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E3F313D5;
	Mon, 17 Mar 2025 03:08:15 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D944B3F673;
	Mon, 17 Mar 2025 03:08:04 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Jie Gan <quic_jiegan@quicinc.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] Coresight: Fix a NULL vs IS_ERR() bug in probe
Date: Mon, 17 Mar 2025 10:07:56 +0000
Message-ID: <174220604251.188899.14799232628969384481.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <dab039b9-d58a-41be-92f0-ff209cfabfe2@stanley.mountain>
References: <dab039b9-d58a-41be-92f0-ff209cfabfe2@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_030808_903978_BF834F20 
X-CRM114-Status: UNSURE (   5.07  )
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


On Fri, 14 Mar 2025 13:55:10 +0300, Dan Carpenter wrote:
> The devm_platform_get_and_ioremap_resource() function doesn't
> return NULL, it returns error pointers.  Update the checking to
> match.
> 
> 

Applied, thanks!

[1/1] Coresight: Fix a NULL vs IS_ERR() bug in probe
      (no commit info)

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

