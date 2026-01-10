Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB9DD277DA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 10:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FlMG56Wn54IzH1gkmm3fQcGRxT+ZlqXsS/H9t/iG+H0=; b=rAsaIwgybv46Yo7GBtiFn7/Qy0
	tXNEWfz5ww/SVMXwBh6w8LC1/d0nJaH+2IGbL7/Ok/gI+oWbfz2ZwYIqCRoQp8oYoycDx8UU6h1wr
	6T6bAXP5WkOGHCo/P35YDhUYt+4MJCOwr7ttElfDW8IGk4NcoU77q7ykUkE2VVYwDAQt5BShg9Ael
	NLSoi8NcLijBT21ORTZeSE6gT+PSUb7qfLK96CvKD8c9VRvcIcvGbnXfjV1pQjLR6kVGIkOPFEvL/
	R6JgtlmMGMP5AZEGMACydoZ0xt4xJyZsFkHa2HiCz2SFDBGNtsN7xwVoHBi6TIiCJwZH0tmeu2C3S
	WL2dGklA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veW7u-00000003OSf-1WGl;
	Sat, 10 Jan 2026 10:23:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veW7m-00000003OPb-1hIq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 10:23:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A9BB644387;
	Sat, 10 Jan 2026 10:23:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67503C16AAE;
	Sat, 10 Jan 2026 10:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768040591;
	bh=N3UMkFVCDtVmeRbXTdo2Nl9ogv3n9yOtKBTkaeAWGhU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VAbtghIZE65q86ZWR+0D58ouko1Ed+zlgQd3WZKqTebzDxRMikA06xdx0vUWkM129
	 P11O65bnfZ4qAalb6GZEtFrCbsnYPWCtQ1TkKYA2MOcAbj0w/yY1F1h+4RAMRIpX+f
	 beib+35gL3T+exMlX6XWkIfIAJT5tP1SUelDT2CttGuISJP9SWc9vRV+DXQL5VbBnZ
	 Kuu7020c2y3pZ4sS3xMoxgTi0DoaWahA7ilUGAJj29cTh4SoKEmuxn1YaFZW3kkCm/
	 wDvhcCYIZe3Yn4oypG61i/dpVMMxBeJlaRHa8wZ0kfaZWPMyUiCW6zHnsjfEhk+CL+
	 SatmICIf309TQ==
From: Oliver Upton <oupton@kernel.org>
To: kvmarm@lists.linux.dev,
	Will Deacon <will@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: (subset) [PATCH 01/30] KVM: arm64: Invert KVM_PGTABLE_WALK_HANDLE_FAULT to fix pKVM walkers
Date: Sat, 10 Jan 2026 02:22:48 -0800
Message-ID: <176804045762.916140.4830938298669479954.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260105154939.11041-2-will@kernel.org>
References: <20260105154939.11041-1-will@kernel.org> <20260105154939.11041-2-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_022314_463045_7B064673 
X-CRM114-Status: UNSURE (   7.91  )
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

On Mon, 05 Jan 2026 15:49:09 +0000, Will Deacon wrote:
> Commit ddcadb297ce5 ("KVM: arm64: Ignore EAGAIN for walks outside of a
> fault") introduced a new walker flag ('KVM_PGTABLE_WALK_HANDLE_FAULT')
> to KVM's page-table code. When set, the walk logic maintains its
> previous behaviour of terminating a walk as soon as the visitor callback
> returns an error. However, when the flag is clear, the walk will
> continue if the visitor returns -EAGAIN and the error is then suppressed
> and returned as zero to the caller.
> 
> [...]

Applied to fixes, thanks!

[01/30] KVM: arm64: Invert KVM_PGTABLE_WALK_HANDLE_FAULT to fix pKVM walkers
        https://git.kernel.org/kvmarm/kvmarm/c/19cffd16ed64

--
Best,
Oliver

