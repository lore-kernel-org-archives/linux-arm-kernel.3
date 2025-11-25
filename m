Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6159D0EE3D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 21:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vC4aj3kCLNXbRff6PLDeuPhmA64+ANIj0RUWQ0Rdmuo=; b=a3g1kpEvB8aGzOkSMTZrpIcXt3
	6/s1Gi/tenfJcQ9ewve0lIc+C4IKvBMlSZt1I8QrbRRCG1BF0I1X13u0tS/0P09o8zFblV6J+eAwA
	vXefN+PntU4g//jajZOa/BdTcgSLC0N9jfSyywxgWPv6dLz5/7fJByF19w0r2LQv0h6L4iCZQcPIW
	7YxorS7mXI5118S5Ivwewa9cE/foNFfJ3yDCM7ykImNDCnt4TkXVpWqQ40zjdhuKKwrXRxlk2qbr6
	RwDv2za7gOUVLCO4LlbQTj+xQFPnIFO1ov0CIzWm9IPZ1P7HPKD7BQ0TGgcxPhw9bIqypZInvVXLf
	XazxdLag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO0Xy-0000000DxaS-1vQc;
	Tue, 25 Nov 2025 21:26:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO0Xw-0000000DxZy-3AGR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 21:26:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EA27560137;
	Tue, 25 Nov 2025 21:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 750B4C4CEF1;
	Tue, 25 Nov 2025 21:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764105959;
	bh=n5CbeK8jDmfr7XozFAqeBAw9k9v7rJ8GAcFjignIIHw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JiYzwwbWs6GsJDcQLfpHkUixgu90gQAntbPAxoHz5R+QD8CRJqTFAbv3zGTEh+SkI
	 xYyYACNja+jj4qWS08YDpbDHVGabTtd4wjwBCdANYSqMm3ziTIwmSQR0R/AS2AqCRJ
	 r3yE6Jd+kTygj9Xp5I5l2kvNsMG7ol573cjWnaRksbNAsf2rTKZLlXDghRs3jN+ZOD
	 35umsDShvWtxHLc1Avpz9/i1nX8gy6FQew7Os888cLjyjC6xFpMeQHMT1EpJSxa9Qx
	 l+OZA+CdDgEbgj3czy8YU3LuDzE+8Yoh+92UPFnNLZx9w7J/umCup9RrToXzAkWbBa
	 3cNlZCpPSopEA==
From: Oliver Upton <oupton@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] KVM: arm64: Don't use FIELD_PREP() in initialisers
Date: Tue, 25 Nov 2025 13:25:55 -0800
Message-ID: <176410594555.1756747.17127905148287939848.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251125201715.1133405-1-maz@kernel.org>
References: <20251125201715.1133405-1-maz@kernel.org>
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

On Tue, 25 Nov 2025 20:17:15 +0000, Marc Zyngier wrote:
> Nathan reports that compiling with CONFIG_PTDUMP_STAGE2_DEBUGFS
> results in a compilation failure, with the compiler moaning about
> "braced-group within expression allowed only inside a function"...
> 
> Replace FIELD_PREP() with its shifting primitive, which does the
> trick here.
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: Don't use FIELD_PREP() in initialisers
      https://git.kernel.org/kvmarm/kvmarm/c/5742f3650013

--
Best,
Oliver

