Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C181DD277DD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 10:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n6JAwhTi5RjukwhCsRLxlmUS/uodwu4wu+PAL4X3v0o=; b=zkQWBsXOTRXjxso1fnesAJ4RLL
	xM7lGdTxqC3IE/xy97kKBjB/SXDXqV33PwrTz1NV3ekGIYfJ4u9CkDbg2CDuDsgRcE/l3vOUVDbSg
	c/7pQJA12k964Jsl2eksAD/YqyYmCXmeTC/pBK1cPZQKsLrTDUS4Rkc1BetkRHr/WHMg4O0JgMkQR
	xeTp1E9FDNJvU0omzlZMyInmcR2gukE5eKSrmMlDoXljfe3mkJ0yUK4hKIOVnjNYeNQiuAiSsyDH2
	rr8EHDY6IHf+Gx0dKI+fRHqG7yv37MxDp4Aj8AohNu0Jwh10WZIGIEVut9PUO48pZmnbSHZgUN+I4
	G7NdyXGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veW7t-00000003ORq-2La8;
	Sat, 10 Jan 2026 10:23:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veW7k-00000003OOU-3f0Z
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 10:23:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 27A6B443F1;
	Sat, 10 Jan 2026 10:23:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3A64C19424;
	Sat, 10 Jan 2026 10:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768040591;
	bh=85X+Dw7tcU6Dy3t2huC1qsEwwh+z3sypfGDQLubbMDo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bNk1s514y5QfuogV0MJ3zbFUlBmUOp01YXIdpt49P6i+okIJG5kervEmcMjjJSMXL
	 v58bLydG302mcuV3dzBJIXE2g4lkiWqUMpQesloyHDN2EF1r/tJBpQ548MRK4xN9/s
	 qmctipnW1cSdC0fYRybBlz+7RfmPgDAyaOOsiXvxEAbA8af2HWtTgiuQ6B50W3BNGo
	 BjaPS7UAbu7+37tOIkgC14sYPbNSIXx/jVlmuIKP+ooTCrjKrpPpWKPW8DQDIsJNjp
	 oWm/5egZ/nv6h4zexDDa2dGE6jNRudSBZgVzhrBUZv14j3Z3b3JekDTMFAZ7p/S+VD
	 PsKTyFUyGtIjg==
From: Oliver Upton <oupton@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: Oliver Upton <oupton@kernel.org>,
	nd <nd@arm.com>,
	maz@kernel.org,
	Joey Gouly <Joey.Gouly@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	yuzenghui@huawei.com
Subject: Re: [PATCH] KVM: arm64: gic: Check for vGICv3 when clearing TWI
Date: Sat, 10 Jan 2026 02:22:46 -0800
Message-ID: <176804045751.916140.10019376959151552249.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260106165154.3321753-1-sascha.bischoff@arm.com>
References: <20260106165154.3321753-1-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_022312_937919_789A5619 
X-CRM114-Status: UNSURE (   5.92  )
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

On Tue, 06 Jan 2026 16:52:10 +0000, Sascha Bischoff wrote:
> Explicitly check for the vgic being v3 when disabling TWI. Failure to
> check this can result in using the wrong view of the vgic CPU IF union
> causing undesirable/unexpected behaviour.
> 
> 

Applied to fixes, thanks!

[1/1] KVM: arm64: gic: Check for vGICv3 when clearing TWI
      https://git.kernel.org/kvmarm/kvmarm/c/5e8b511c39f3

--
Best,
Oliver

