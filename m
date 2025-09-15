Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F91CCAC598
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 09:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ZaILaYfbJ8GDRoZ7gL3Tu9ugKxR1JKb/or6/5DZvqo=; b=OW7lY/OCiIHsihs24tQJWZ1wDn
	j8TrcH7u3/rYEXv8Bo8jJrv1HZWKusw5LTNGZsCNuXosh8j96XPqfXU7D6hUYC1SuDaB0d/dOYp4/
	8l9IXc3RmVKGsj5DqNcCiH1ip6CUN0MGAJIjo56zWgBh9uTkoIAuYEkKWaqgKkGtgb1QqUbZAg/xm
	7icF2g5ODJzT/yN6BMulX9ofXJN+7ziRdXruFgDu8qOByzxRi8IkLwIbDW5dHpHGfVVjVz6VVRISz
	bhkcgbr2vY271eafcQIVXFcHdQNmctHNPs2j7Rsi8hPbazFmMnXh4IkUyEaie7jqPsAQe+GNcRlRP
	btfGGqqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5tk-00000003XHo-2VaP;
	Mon, 15 Sep 2025 09:53:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5ti-00000003XHZ-39hR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 09:53:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 30DEC60195;
	Mon, 15 Sep 2025 09:53:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE44EC4CEFD;
	Mon, 15 Sep 2025 09:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757930001;
	bh=VExY4NPjfZpQJf4u88T+AAZWTi12kWN4VPC1o7qUEXw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RES8IUpKVfB5x16IQm0LsH7FrmzAiJ9MaEDjeyYnhqxUaoFMiK0ThEZjsKxZKt74N
	 aVk8YTlUo8EdOQn2ZYfbWndt+xwj5VNKDvkIcEr/KHFzLLTwaed5LbIRXNR9ycLMo2
	 kLdS2sRjlSo+57MYDpf4r7COwQwh9+Q43U2miybm581sJtWtn/AFo8IAP+25hbJnmR
	 E5OFPVOWKgSuF/BCb6xXS1qGh8u9RG5F16/UvLYd64fjURUNuXfKLXS1bmdI52gxtw
	 D1xoT8jaUZRp3fG5qZbSdMxkZyH2C6VXJJN6Bl0u9vhVuGh+LyX3de5uxujrFrMhTR
	 HpI8L/uUnLLPw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uy5tf-00000006JZO-2xh4;
	Mon, 15 Sep 2025 09:53:19 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Per Larsen <perlarsen@google.com>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ahomescu@google.com,
	armellel@google.com,
	arve@android.com,
	ayrton@google.com,
	qperret@google.com,
	sebastianene@google.com,
	qwandor@google.com
Subject: Re: [PATCH v11 0/6] KVM: arm64: Support FF-A 1.2
Date: Mon, 15 Sep 2025 10:53:15 +0100
Message-Id: <175792995612.521593.7894673693279210618.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250820-virtio-msg-ffa-v11-0-497ef43550a3@google.com>
References: <20250820-virtio-msg-ffa-v11-0-497ef43550a3@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, sudeep.holla@arm.com, perlarsen@google.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, ahomescu@google.com, armellel@google.com, arve@android.com, ayrton@google.com, qperret@google.com, sebastianene@google.com, qwandor@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

On Wed, 20 Aug 2025 01:10:04 +0000, Per Larsen wrote:
> The FF-A 1.2 specification introduces a new SEND_DIRECT2 ABI which
> allows registers x4-x17 to be used for the message payload. This patch
> set prevents the host from using a lower FF-A version than what has
> already been negotiated with the hypervisor. This is necessary because
> the hypervisor does not have the necessary compatibility paths to
> translate from the hypervisor FF-A version to a previous version.
> 
> [...]

Applied to next, thanks!

[1/6] KVM: arm64: Correct return value on host version downgrade attempt
      commit: f414269392443f666bd8bef0cb3f0b53d5147be3
[2/6] KVM: arm64: Use SMCCC 1.2 for FF-A initialization and in host handler
      commit: 6f4c348b1d5c08f1105e645700962cc4353a8ac9
[3/6] KVM: arm64: Mark FFA_NOTIFICATION_* calls as unsupported
      commit: 79195f342417ff773048515964707aba3bfe0e41
[4/6] KVM: arm64: Mark optional FF-A 1.2 interfaces as unsupported
      commit: 8d24683e3e0f93b4bfdb558df50923514042817b
[5/6] KVM: arm64: Mask response to FFA_FEATURE call
      commit: 3f5952917498e7bb9d227812d4349668f62c413b
[6/6] KVM: arm64: Bump the supported version of FF-A to 1.2
      commit: 162190f2ccdc5964efa2a26e9fc3e56cf80fc29b

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



