Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA7FD277DA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 10:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ItRItMTQZvjITONlvNBtof5ZyT3kiw9ajI66kjrwa90=; b=SPNixaypgX9zQuzz6Ll/tVFWdW
	WYZjGqkdEfyo4jLLcyy5VoD9LgFEvdilGO05Sf0KwEVFgfzdOiOD1iR1QIgfUh1uLeGjvgg0QzNh6
	d+5ZYXFqmQm7s0zHvH35Z0lUT1sZTbpbcmBYo+KHUePmwMnFJmuw5slmUs5mbG+qcO23jO2Ud9ljX
	5LXBmgC/hCo8CZPauYvBy/Iz1sqrbRiMlT9TLQL3MCPcUCS6QgL5A8tHe5B+0ZigwG349ynOjLTkC
	GVDVkBeBRKJt5PC21jeuTqeKWq4LBJqf2JL6JcX3xfCNKk7Fv1aRVyiEI+YxhsIlzJXzwhrZ7h0gN
	ajZ+CotQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veW7o-00000003OQL-0agQ;
	Sat, 10 Jan 2026 10:23:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veW7k-00000003OOV-3SxH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 10:23:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6AF7344364;
	Sat, 10 Jan 2026 10:23:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A371C4CEF1;
	Sat, 10 Jan 2026 10:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768040591;
	bh=x1R2CiJTofSGb1wbzQo0MhyOntomIAOg6p8X4Rkq9nI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EGM0X+L2lyQXal7rgHv5aZjdWukK/d3VbSx1D7lO+CfwKF10GOgUAFD+fv7xyQI9O
	 zCTQVjCSQYitpSwSW/xMX8vOl3YSImaV9L0Vv2HeIYvwsqV0e0s84Q1vHK556zvwks
	 Y3s49PWTyGnbT1bqP5f0G7pCbZSd/tBa903Mag6rxLi8jH5NTf6viNuFbVNGMP6zPC
	 avL4/q+UqIhntPjhuYn1ZFvhvoEeV5oA4n+PJbykKrVkdBG6IAKb4tDS+UOMgGGE/V
	 m/M3M7ggKh45wUhWEwQ/KP/FlT4Vlp40K5V2zP5Sr3OaUDWSTRU9VnV0Lc7ZOH/2+F
	 n88AmbgZssUkg==
From: Oliver Upton <oupton@kernel.org>
To: maz@kernel.org,
	yuzenghui@huawei.com,
	Dongxu Sun <sundongxu1024@163.com>
Cc: Oliver Upton <oupton@kernel.org>,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] KVM: arm64: Remove unused vcpu_{clear,set}_wfx_traps()
Date: Sat, 10 Jan 2026 02:22:47 -0800
Message-ID: <176804045758.916140.10135951232843494446.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260109080226.761107-1-sundongxu1024@163.com>
References: <20260109080226.761107-1-sundongxu1024@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_022312_893234_A3D87B41 
X-CRM114-Status: UNSURE (   5.63  )
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

On Fri, 09 Jan 2026 16:02:26 +0800, Dongxu Sun wrote:
> Function vcpu_{clear,set}_wfx_traps() are unused since
> commit 0b5afe05377d7 ("KVM: arm64: Add early_param to
> control WFx trapping").
> Remove it.
> 
> 

Applied to fixes, thanks!

[1/1] KVM: arm64: Remove unused vcpu_{clear,set}_wfx_traps()
      https://git.kernel.org/kvmarm/kvmarm/c/9cb2c20f06c3

--
Best,
Oliver

