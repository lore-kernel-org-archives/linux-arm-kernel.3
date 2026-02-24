Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D85E9B24D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 11:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xNOstNU/LoXPbiPBMZ5TS+sK3wIHcDh7uayqfpO8Q1U=; b=tQcUSiYilGfylvKzSzmHvIwtTc
	PuCRzjpqk+VF77/XFvNZWOhIw4CkpWd6ZiprGo1gGiWP+lFhAlZJ+em583QRf3LwvtsfJx5hbMTDA
	2WsByo5kk+9G0lLvIiJq1Zqn6/gKTw5qWXi3bDONF+HkuJkYa9hJCMThy4TOVJhSAIHm5i6V8i425
	rPsdCR4wpc9XtuHLBR9/bp16mRBJTDCBuU0/Pyp0hChXvOJShL/Si3WSyE5Wed4sI8aWTTRLhG52U
	eNX4QCicVB9esjJXeOBzM711gr2TiO95wH8Mxe+3POpditR/yniU8BAvq3yZDQJUko/vg/D9XcxR2
	P6CeKqSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuqFt-00000001wGT-3eOp;
	Tue, 24 Feb 2026 11:07:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuqFr-00000001wG9-2oNU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 11:07:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C35D7339;
	Tue, 24 Feb 2026 03:06:55 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C3FF3F59E;
	Tue, 24 Feb 2026 03:07:01 -0800 (PST)
Date: Tue, 24 Feb 2026 11:06:59 +0000
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Mao Jinlong <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/8] coresight: Fix device registration and
 unregistration
Message-ID: <20260224110659.GA4184494@e132581.arm.com>
References: <20260209-arm_coresight_refactor_dev_register-v4-0-62d6042f76f7@arm.com>
 <ad38ffc4-eb0b-4430-8d5e-898a2e66977b@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad38ffc4-eb0b-4430-8d5e-898a2e66977b@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_030703_750510_AB6611B4 
X-CRM114-Status: UNSURE (   8.02  )
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

On Mon, Feb 23, 2026 at 01:28:03PM +0000, Suzuki K Poulose wrote:

[...]

> [  827.216924]  Possible unsafe locking scenario:
> [  827.216924]
> [  827.222849]        CPU0                    CPU1
> [  827.227380]        ----                    ----
> [  827.231912]   lock(coresight_mutex);
> [  827.235491]                                lock(ect_mutex);
> [  827.241073]                                lock(coresight_mutex);
> [  827.247176]   lock(ect_mutex);
> [  827.250233]
> [  827.250233]  *** DEADLOCK ***

Thanks for the test, Suzuki.

I have sent a refactor patch to dismiss locking chain:
https://lore.kernel.org/linux-arm-kernel/20260224-arm_coresight_refactor_cti_resource_release-v1-1-ff1b2bca9176@arm.com/T/#u

For recording, I enabled the following configs to reproduce the lockdep
report:

  CONFIG_LOCKUP_DETECTOR
  CONFIG_PROVE_LOCKING

Thanks,
Leo

