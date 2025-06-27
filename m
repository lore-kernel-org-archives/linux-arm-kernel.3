Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F48C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 10:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Lh3qeZM7PsZzPc+0eG+xQUsmwFzsKXRX12z7mTsR20=; b=sgjPKtuJNBmAXcHQCvm6fi8/hP
	mcRoxur9u94Pv4sjXsLC7shzwiA4xJdD1qHldfUmy7S8WZg+9TYKqKDHzhba4qyAL0gkDKNCbmPVo
	uHG10+/NVkrtZ9pVj39g3oo052Hb/5iK6EEldWf9CFIMVpoZdqcW0DEnevztQoPPr4WJnBMIDx2Er
	CjxcELowwCe7mlCatZbnps3VC6YZ5WodGHDG2FsKETgnHTLknyn1HID9sMgIe8sPoCoT4SZBwfaBL
	UspKbrqUZVWjQRKYBkRNzXHrnJKFPTPY7cgZYFycBD2SjtXNHzMJwg6nvTYtfVTmxT3FBNjrXZiuC
	o9ii9vOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV5z1-0000000ECdD-00wJ;
	Fri, 27 Jun 2025 10:06:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV5tw-0000000EBuj-2stR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 10:01:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E422F1A00;
	Fri, 27 Jun 2025 03:01:26 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 232BC3F58B;
	Fri, 27 Jun 2025 03:01:41 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: cristian.marussi@arm.com,
	viresh.kumar@linaro.org,
	d-gole@ti.com,
	quic_mdtipton@quicinc.com,
	avajid@quicinc.com,
	Sibi Sankar <quic_sibis@quicinc.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Fix up turbo frequencies selection
Date: Fri, 27 Jun 2025 11:01:37 +0100
Message-Id: <175101845016.204664.16770138756754507753.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514214719.203607-1-quic_sibis@quicinc.com>
References: <20250514214719.203607-1-quic_sibis@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_030144_775024_F67E40E0 
X-CRM114-Status: UNSURE (   4.79  )
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

On Thu, 15 May 2025 03:17:19 +0530, Sibi Sankar wrote:
> Sustained frequency when greater than or equal to 4Ghz on 64-bit devices
> currently result in marking all frequencies as turbo. Address the turbo
> frequency selection bug by fixing the truncation.
> 
> 

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] firmware: arm_scmi: Fix up turbo frequencies selection
      https://git.kernel.org/sudeep.holla/c/ad28fc31dd70
--
Regards,
Sudeep


