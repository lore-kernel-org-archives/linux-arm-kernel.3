Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4C4CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 15:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MNIYDGmtqhOIDwyNnLm1xd0jyY5t28O+6Qy95KyNsj8=; b=txDC/LDS9pYmQds02vAnztlzn8
	ZSdeoFny1EbPqrsfgivgYQ3zq0dd4epOiUbOCbA8z6L3VUJrsYl8E2T8qWnUH7C1cjDRCE/fKjujs
	ByJmR4+U07DtQJU2gYO5CFIPcECxI+fT4MIkS9hX8xFszW9PQI2crL3ZpTKqkTpEI7ZwdQ41I+O9L
	wLY9UbdVE4nv1YFTQ6VWhyxaVSf4P//esA94D5hT/QAYdefg9tW4RC5FaFUwSKfMPfbofvrwbFVAV
	Na7AGA9PgITZIkAMmIT94Ld3CZsWKsgDpPHJJTD0jhdG/QtfGAB1NjAuj0v84WZYwCmpgF2QKJUc9
	wl4fHqkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHyu-0000000Gi5N-31dN;
	Tue, 05 May 2026 15:46:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHyq-0000000Gi3h-1buu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 15:46:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1208A409F3;
	Tue,  5 May 2026 15:46:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E04BBC4AF63;
	Tue,  5 May 2026 15:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777995999;
	bh=DI8b9BQ7TcVhg5qEuSxU1/ZlGThOcIFxs7PwN0uw9Kc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GkNuaMgg3UhIsvHXbV3F/GPRhDpfyey4upsUS+cqU/OZIN1uhlwZgo1Wj5n2zQrEO
	 4zGQmnnc+Tgs5Ic89P0oF++qrnRHH2dkqiKsthcJl5BqO9Vv60D2rIWjm4+m9ZSd8e
	 yctzEY3EcffLJZ1+OwVVR8GKydaJqWNCMxLoDNF8yYiJCYJIbvXIBy1+0PGuiSgXgR
	 npiEbTDJq9Juq0+Y5VzvwF99y03ydb/rug9sR40X+ZP9DgUqJK3iv9M/kJowUrdg0n
	 f6inx58mthXgHsBeUXrA0MNk0+CIe8GaiRSJL4QxnMWNNRGRUp7GFD0PgVUwtGHkEA
	 ng2o5MfXCNa4Q==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	Sebastian Ene <sebastianene@google.com>
Subject: Re: [PATCH v2 00/11] firmware: arm_ffa: Fix cleanup, notification, and discovery paths
Date: Tue,  5 May 2026 16:46:33 +0100
Message-ID: <177799593688.2900098.12239077076770020908.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260428-ffa_fixes-v2-0-8595ae450034@kernel.org>
References: <20260428-ffa_fixes-v2-0-8595ae450034@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_084640_974505_9A9299E0 
X-CRM114-Status: UNSURE (   8.25  )
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

On Tue, 28 Apr 2026 19:33:24 +0100, Sudeep Holla wrote:
> This series fixes a set of issues in the FF-A driver around init
> cleanup, framework notification handling, v1.0 notifier lifetime, and
> partition discovery.
> 
> The fixes are all small and localized, but together they tighten a few
> important paths:
> 
> [...]

Applied to sudeep.holla/linux (for-next/ffa/fixes), thanks!

[01/11] firmware: arm_ffa: Check for NULL FF-A ID table while driver registration
        https://git.kernel.org/sudeep.holla/c/0a5e695095c5
[02/11] firmware: arm_ffa: Skip free_pages on RX buffer alloc failure
        https://git.kernel.org/sudeep.holla/c/09527e2c5349
[03/11] firmware: arm_ffa: Avoid collapsing NPI work from different CPUs
        https://git.kernel.org/sudeep.holla/c/9b5597af8bc5
[04/11] firmware: arm_ffa: Fix per-vcpu self notifications handling in workqueue
        https://git.kernel.org/sudeep.holla/c/9985d5357ed9
[05/11] firmware: arm_ffa: Unregister bus notifier on teardown for FF-A v1.0
        https://git.kernel.org/sudeep.holla/c/6d3daa9b8d31
[06/11] firmware: arm_ffa: Bound PARTITION_INFO_GET_REGS copies
        https://git.kernel.org/sudeep.holla/c/3974ea193840
[07/11] firmware: arm_ffa: Keep framework RX release under lock
        https://git.kernel.org/sudeep.holla/c/2af18f8e36b2
[08/11] firmware: arm_ffa: Validate framework notification message layout
        https://git.kernel.org/sudeep.holla/c/4a1cc9e96b31
[09/11] firmware: arm_ffa: Align RxTx buffer size before mapping
        https://git.kernel.org/sudeep.holla/c/0399e3f872ca
[10/11] firmware: arm_ffa: Snapshot notifier callbacks under lock
        https://git.kernel.org/sudeep.holla/c/38290b180a4d
[11/11] firmware: arm_ffa: Fix sched-recv callback partition lookup
        https://git.kernel.org/sudeep.holla/c/a6848a50404e

--
Regards,
Sudeep


