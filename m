Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605A6CCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 16:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tIixtti18FxXl7wjKKBq9lzfPp4dJm0StESipiKw1lo=; b=P629K6wOg2cSI8K/tWMXo5TRws
	qtvgykA8PT5XA0s3QEyzMnBosnxE6kOzZzPOfa0Q2YCsFliQnjqKu6zKJc1/tT7zp+xvEcs2Rr+eB
	f5tlS5N/V4TXa0+2BjCj4vwmfOS15Fz03T6uvd+mnZrj1PYhcUjfkHPqNVzs5db9OkLroBF3HLQFU
	yZSvNjZYA+PZrbb4H5OvUrHMneihSJ4VEog3SP3OiDYwikW1asrIe9DH/sPPTHjco2gijip81o+9X
	sa8iiv8grPW/RxUSbmK3mDQ2PhtSASWIywiAnlshD55Kr4+BOz5iug7NofMX3ViV/gBJ8k4ShnRKc
	diywadaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGg8n-0000000E28T-1wSc;
	Wed, 05 Nov 2025 16:13:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGg8k-0000000E27O-2XQU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 16:13:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75BE5169C;
	Wed,  5 Nov 2025 08:13:33 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EBEB63F694;
	Wed,  5 Nov 2025 08:13:39 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Linu Cherian <lcherian@marvell.com>,
	Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3] coresight: ETR: Fix ETR buffer use-after-free issue
Date: Wed,  5 Nov 2025 16:13:30 +0000
Message-ID: <176235893222.387743.2128022832743502879.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251021-fix_etr_issue-v3-1-99a2d066fee2@oss.qualcomm.com>
References: <20251021-fix_etr_issue-v3-1-99a2d066fee2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_081342_680967_2D3C236E 
X-CRM114-Status: UNSURE (   9.11  )
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


On Tue, 21 Oct 2025 16:45:25 +0800, Xiaoqi Zhuang wrote:
> When ETR is enabled as CS_MODE_SYSFS, if the buffer size is changed
> and enabled again, currently sysfs_buf will point to the newly
> allocated memory(buf_new) and free the old memory(buf_old). But the
> etr_buf that is being used by the ETR remains pointed to buf_old, not
> updated to buf_new. In this case, it will result in a memory
> use-after-free issue.
> 
> [...]

Applied, thanks!

[1/1] coresight: ETR: Fix ETR buffer use-after-free issue
      https://git.kernel.org/coresight/c/35501ac3c7d4

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

