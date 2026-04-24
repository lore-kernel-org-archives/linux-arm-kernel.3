Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC26FED3EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 16:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ev80Y1N+Yc2MgVqXq57wb+bj6uRE54MiQqwpbvCkUrI=; b=2EYT1xR5Mn14R4k1w2KdYWU9Pl
	Sb/zBuOPj4CzN/mI57kJUrR4Z+vP5yih8ATLCsyjvB72dYiEz5lbZkekiOySkfnZlOc9odUo8AMJu
	UkMNyp77qkSwmXyZuxgXCS6DJB7Iw4VuFC98cDYbDigIYZheiUjFG5zR4sanqAq589Ta/eSgkPdVs
	g0kDf595l0FnshYIpTR2Q529npjOfECSHRFX0Slx5+GjDOLM3PFAlITvTwH7bB9GqItR5AzBD1Upe
	Er36P2qe7Trpta14JDzio+0TlsnlFvD3tMbCQbWheTyaoen6FloCoDgCqXYNc2vMVv4uP7cZX4XUD
	o0jE5hQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJ6a-0000000DR0J-0fk0;
	Fri, 24 Apr 2026 16:10:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJ6W-0000000DQzu-4AT4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 16:10:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4FA39402C7;
	Fri, 24 Apr 2026 16:10:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C24BC19425;
	Fri, 24 Apr 2026 16:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777047008;
	bh=601cB8DvX/sMTRCeJ5tft8T4kzWVDphwpc5xreOjr9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DsBCw9fGL1lmy/570MGacEaj15Tz/tgkHAXOraXAYkcMp2w+JuZoUieEKUtLqW/dV
	 tbDagWYVY+V62iqzgPbaZwDMQpq0+CLo2JYjB15VbrTObhUog+M9DOcduFKuGlv2Y/
	 TECFbW1JYp/MPpLa74OSrHGOdA0/B6jMXqPfOK0sx1gayM/heDHRjmi8qePhbodUKB
	 BzAO7roHWGKtb0PDIe3V8cKwEEm3FZeVPMn9AR7IISsj8Fgwn8yZlYYBK2wDORm0hH
	 3th9ZftEFWpFALlVq95YOgNzHvQ2XpiqFpaM02AAQob0z73jRtd0fkO9AidHx2de0+
	 m9iGCqd1BxDVA==
Date: Fri, 24 Apr 2026 17:09:59 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jonathan McDowell <noodles@earth.li>
Cc: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com,
	zohar@linux.ibm.com, roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com,
	jarkko@kernel.org, jgg@ziepe.ca, maz@kernel.org, oupton@kernel.org,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, noodles@meta.com,
	sebastianene@google.com, Yeoreum Yun <yeoreum.yun@arm.com>
Subject: Re: [RFC PATCH v3 4/4] Revert "firmware: arm_ffa: Change initcall
 level of ffa_init() to rootfs_initcall"
Message-ID: <20260424-pompous-eagle-of-poetry-e6dfe7@sudeepholla>
References: <cover.1777036497.git.noodles@meta.com>
 <2e7b4dc552b45ddf14cc43bc449cbebb4ade0027.1777036497.git.noodles@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e7b4dc552b45ddf14cc43bc449cbebb4ade0027.1777036497.git.noodles@meta.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_091009_081959_6340DBD0 
X-CRM114-Status: UNSURE (   9.82  )
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

On Fri, Apr 24, 2026 at 02:24:42PM +0100, Jonathan McDowell wrote:
> From: Yeoreum Yun <yeoreum.yun@arm.com>
> 
> This reverts commit 0e0546eabcd6c19765a8dbf5b5db3723e7b0ea75, which was
> added to address ordering issues with the IMA LSM initialisation where
> the TPM would not be fully ready by the time IMA wanted it. This has
> been resolved within IMA by retrying setup during late_initcall_sync if
> the TPM is not available at first.
> 

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>

-- 
Regards,
Sudeep

