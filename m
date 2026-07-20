Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2946FC44527
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 10:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vck4YIp4wN9OE2k8mCGwpdVQNpG15Z8G4WE7ZLpSflI=; b=W+jWD70fzqUJ1w/rAA0woD916E
	PXGcFylvz1OMvKdDNXZj2l578j1Ugby0ND2PHoukSCgZwQ6Lh4XEFyF3LsK7eWNjB0p6xTyGBzbF5
	2h7jhhnqjKvPJuGgzHfeLUnGaD6Ugav73FH2iYlJyf/hljcJ7HTE7D+OYcj4DWzHRW6AiK6zCRLH2
	9G/0FkJejYSne4HL9QJGuVUf1vs0gF1J1ljVCabXoknzlz3xm5Sux+ZZ7cuML7TlQlAQPaBCmB93N
	4ALq5YnNhJ1bZeZe0x9I0YBnXdUItc81KCR4TJr+e6RvsBcKQ9rW5qcwo5aarEeuVhju+Bnwyep+x
	TiBg4cfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wllJd-00000006UcR-0Btl;
	Mon, 20 Jul 2026 10:33:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wllJc-00000006UcL-04mR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 10:33:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 733C0408DF;
	Mon, 20 Jul 2026 10:33:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 796B41F000E9;
	Mon, 20 Jul 2026 10:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784543619;
	bh=Vck4YIp4wN9OE2k8mCGwpdVQNpG15Z8G4WE7ZLpSflI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aw6MQclaCpFxlpAoUV/jnRQL7hh2YFwa9P4Z9ZutQuieku10gUKgeSRifW+HGzRoQ
	 QI9AHxkt4NTDS0N2SuaDWFRcm2E6GZrku4vSc5tGNqhG5ky8rQ4Q+KlByilJlv8IbC
	 uLYsQS0/LcQ3BYJloRH/H6/NU+aOAJ/T90f13M5d9a0Sojz7K10piM2KAnvUylXHlD
	 Vx2WzkOq60yZW6myk/qiGGZSNDF1A0VfuziHbCEXNnKjB4x98dXfIE4jGgU44VATA8
	 taCG3BOoy6/VudwlSQSyy0FcRFp/ZYzUkD04o/VmvvZAfM8Rr+BId0aUH5o1I8YG5Q
	 fuOeKtmnzZt9w==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>
Subject: Re: [PATCH v6 00/16] firmware: arm_scmi: Fix SCMI core cleanup paths
Date: Mon, 20 Jul 2026 11:33:30 +0100
Message-ID: <178454357814.1351639.7643602720515590905.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714-scmi_core_fixes-v6-0-3afe499d46e3@kernel.org>
References: <20260714-scmi_core_fixes-v6-0-3afe499d46e3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 14 Jul 2026 13:56:19 +0100, Sudeep Holla wrote:
> Most of these issues were found by Sashiko[1][2] while reviewing the
> ACPI SCMI PCC work[3]. They are posted separately because the problems
> are independent SCMI core, mailbox and SMC transport cleanup bugs, and do
> not depend on the ACPI PCC series.
> 
> The series fixes SCMI core and transport lifetime issues around channel
> setup, probe failure, notification teardown, protocol-device creation,
> driver binding and malformed firmware descriptions.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[01/16] firmware: arm_scmi: Publish channel state before callbacks
        https://git.kernel.org/sudeep.holla/c/0314900dcdde
[02/16] firmware: arm_scmi: Unregister device notifier before IDR teardown
        https://git.kernel.org/sudeep.holla/c/66a0bbf30cc1
[03/16] firmware: arm_scmi: Quiesce notifications before teardown
        https://git.kernel.org/sudeep.holla/c/8e49055d0d49
[04/16] firmware: arm_scmi: Clean up channels on setup failure
        https://git.kernel.org/sudeep.holla/c/687d67be3d87
[05/16] firmware: arm_scmi: Free transport channel on IDR failure
        https://git.kernel.org/sudeep.holla/c/d72e7e5f2468
[06/16] firmware: arm_scmi: Avoid IDR updates while cleaning channels
        https://git.kernel.org/sudeep.holla/c/c38b1e19485a
[07/16] firmware: arm_scmi: Reject out of range DT protocol IDs
        https://git.kernel.org/sudeep.holla/c/59407ccb5213
[08/16] firmware: arm_scmi: Use channel ID for transport teardown
        https://git.kernel.org/sudeep.holla/c/a71a3d4d8a6e
[09/16] firmware: arm_scmi: Protect device request lookup with RCU
        https://git.kernel.org/sudeep.holla/c/e6a0e7a49d83
[10/16] firmware: arm_scmi: Drop handle on protocol bind failures
        https://git.kernel.org/sudeep.holla/c/e3a5c30d233c
[11/16] firmware: arm_scmi: Clear SystemPower flag on create failure
        https://git.kernel.org/sudeep.holla/c/e4c16ae24ca0
[12/16] firmware: arm_scmi: Fix OF node reference handling
        https://git.kernel.org/sudeep.holla/c/659705f5eb37
[13/16] firmware: arm_scmi: Unwind TX receiver mailbox setup failure
        https://git.kernel.org/sudeep.holla/c/6f7c06744d53
[14/16] firmware: arm_scmi: Unwind P2A receiver mailbox setup failure
        https://git.kernel.org/sudeep.holla/c/f3e3773c4e5e
[15/16] firmware: arm_scmi: Fix SCMI device destroy lifetimes
        https://git.kernel.org/sudeep.holla/c/6abe8fe36b29
[16/16] firmware: arm_scmi: Fix transport device teardown lookup
        https://git.kernel.org/sudeep.holla/c/a14dd8fe0a95
-- 
Regards,
Sudeep


