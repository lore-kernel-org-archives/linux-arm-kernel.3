Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFBCBCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 18:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YmfxbnauUmkzK854kmYOR4Xc0TjQJxYDT+OqVUV3in8=; b=BhqN9M5die3ub/ki8j7M9fbc6+
	ESEhZ8DWXM0Pyr9eNyI+3wluPwmBy73fIHhNlCPQQdJFjhAHZ9MJw3upm+aHNMsJgP/I5Z/xrXXAm
	CJnnqeuETPeNQLa5cnx93d3HckZZQsV0EdXCwdbrgnLP1eBq156LfeYQkOjH7RLDnQC74KjeNwKzc
	k9K+iEd1LtrF3+P6daPQkmc35ElxLNSfYf9ANpzQvRzOcM1973Mkdqlm2ySiKy0uxiAm+GxmIMjSv
	OSY0y0Tq4Lavb2CBUKhqCepBBm1JxzxqvzgaTbihvEwWT+dtoq6i+9L81BtXcuZXo6DeDT7g1ywfh
	6iNlbhHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRwlO-00000002s0g-1eV0;
	Tue, 26 May 2026 18:44:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRwlM-00000002rzj-1CgF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 18:44:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 429012BCA;
	Tue, 26 May 2026 11:44:17 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E84CC3F7B4;
	Tue, 26 May 2026 11:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779821062; bh=7/GKK9Xs5YFpcLA3j6qlOr9qtyCyn+LpUFftgBBUrUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MZMn8o66Lxhw2NGPpMnkeSQVR9oc3SNYuHEo7XiIIBjLBc5RvWALHojca6aGqBQm5
	 Cte3LnM0B70Q9IKkwKUwfyX1slBENOolIl3tyW0XIl4/02CcORuJccQ1z5b58ur8Az
	 a4gGoi6dqNOWup5LmEtMeVpnX+HRhqV+IE9Vi2eY=
Date: Tue, 26 May 2026 19:44:18 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Ben Horgan <ben.horgan@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v2 5/5] arm64: Convert __delay_cycles() to
 arch_timer_read_vcounter()
Message-ID: <ahXqAgZWOgzUDEel@arm.com>
References: <20260508094203.2913880-1-maz@kernel.org>
 <20260508094203.2913880-6-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508094203.2913880-6-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_114424_372779_CFD35535 
X-CRM114-Status: UNSURE (   9.24  )
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

On Fri, May 08, 2026 at 10:42:03AM +0100, Marc Zyngier wrote:
> Relax the need for disabling preemption in __delay_cycles() by
> using arch_timer_read_vcounter(), which will disable preemption
> only when this is actually required.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

