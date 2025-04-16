Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3626C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 16:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7mjX6S6nwKL93viEmqfJKmGCE5/AcWUsW4QnO7589Ow=; b=d7Hp5S6K70oXLJMhQkYMedL2rq
	H8hLYIEMlD6W2kRppjrnuR5ehw4fkYkMhppnExvMFp23FPS0itEw7JXjvgcFNs94br+QeUEUID+E5
	3TJDtkvAnHVbDBu4213VUb0GaQi+R/MnVEkZMJm1Oq+y0VePIiK/1mUzMQ2M7aPZqOIjFN/+fRtSU
	VKjoSOJI2GsPX8zSzGy3nKZowSKbZXbp4zqg5Kw3hJoVqQVXRCCj3RA7LklNAdMHqx71DSVZNb+8C
	0y7vpaDOAZPAJvwkbg0jeXukqO6H0Am7wbQ1dOYpmTcTCl2lnicA2yRI8lV2YYatry/51zCvUeaNv
	1rbiLyTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u566n-0000000ALbK-3vS6;
	Wed, 16 Apr 2025 16:59:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55Mi-0000000ACck-3JEh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 16:11:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EDD035C0FE3;
	Wed, 16 Apr 2025 16:09:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4031C4CEE2;
	Wed, 16 Apr 2025 16:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744819915;
	bh=sWaORZRshemWzFZsKcditOWZrjblebMb5oMGJ741IuE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WJOu70q+hUr+FrrsYKfyAYk2FRTygiV3pqZrHh3duEgpxfDeMCiEocwS3ZzGbpGzB
	 ttvf24I0+PRyGcvM2vRAcvD1Fy9qGq1nLXAeTlhDAtFgpvT44uqsuEJSksnk1RL83l
	 YgkEBNcTXkJpDG/O7YEtDJy08ieOYkYqraRntir8y+ApmSslGrTFUTKZaTyqkJToq4
	 50sadUVwjRZkjILE3URn1slF4omwTnJP1B1kkQ6ZOpeSbMs4IOvgZKpjoJ5+p5Ewzo
	 aVYvKIeUVuXCiMRpTSh0etKXMR+R4CVR77h0/PxxzdNaK98otjOxFSO4S3XyFdH7a8
	 3whu3KtDMiJAA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u55Mf-000000007Pv-3BLb;
	Wed, 16 Apr 2025 18:11:54 +0200
Date: Wed, 16 Apr 2025 18:11:53 +0200
From: Johan Hovold <johan@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, peng.fan@oss.nxp.com,
	michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, maz@kernel.org
Subject: Re: [PATCH 4/4] [NOT FOR UPSTREAM] firmware: arm_scmi: quirk: Ignore
 FC bit in attributes
Message-ID: <Z__WyYWhelFwt-rQ@hovoldconsulting.com>
References: <20250415142933.1746249-1-cristian.marussi@arm.com>
 <20250415142933.1746249-5-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415142933.1746249-5-cristian.marussi@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_091156_878683_63F78C57 
X-CRM114-Status: GOOD (  14.40  )
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

On Tue, Apr 15, 2025 at 03:29:33PM +0100, Cristian Marussi wrote:
> Some platform misreported the support of FastChannel when queried: ignore
> that bit on selected platforms.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> Match features has to be set-up properly before upstreaming this.
> Ideally the out-of-spec firmware should be matched with a quirk matching
> pattern based on Vendor/SubVendor/ImplVersion....but it is NOT clear if the
> platform at hand will ship with future fixed firmwares where the ImplVersion
> field is properly handled.
> If we cannot be sure about that, we should fallback to a compatible match.
> 
> RFC->V1
> - fix QUIRKS conditions

This looks good to me now and works as intended after updating the
vendor name:

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>

Interestingly, I'm no longer seeing the crash on x1e without the quirk
enabled with 6.14 and 6.15-rc2.

I still hit it immediately with 6.12 and 6.13 when accessing the cpufreq
sysfs attributes (with patch 1/4 applied):

	[   30.663577] arm-scmi arm-scmi.0.auto: timed out in resp(caller: do_xfer+0x164/0x564)

So presumably something changed in 6.14 that masks the earlier issue
when falling back to regular messaging.

Any ideas what could have caused this, Sibi?

Johan

