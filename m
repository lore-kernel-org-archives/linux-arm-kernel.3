Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255ACC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 08:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IHU/rHaWAnHrQHTyQDKx7kPnbPYY+Sdsp8i6aehtSQI=; b=QvZFnBPj+kMylvCVOdfIjD26xB
	qmo6X2oerXZzYc0ruLgcFxUGAjo6XcLQOdvPAv4Ri58zoJ2gmXlLMkzi7LBQVfk9E812Bi3o5uV+/
	NNk4W6QGi11fb9hhACiKhhE7YR7IQbObZ8zymddAS7jF5ztSd4tnhpbp4AvzsWxVhVCHHkJ/7vaAm
	4emGuMy/JCVrMiVOL1CAQ11bvLH4zGqVKRxGmoI5+H+A22ByY2JQYLrg6NyIz16iuthXgC07Qbg8F
	7vXO4Lkay65rJAv/wtMuScD1HGbow+uCRbJkarpLw2Qi+e5tLlkd5dika7DLIoaHWyGpg/5QZEh6J
	6ZUHXwLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUha8-0000000AsrJ-0FbA;
	Thu, 26 Jun 2025 08:03:40 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhQL-0000000Aray-3D4c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 07:53:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 08D0EA4F05B;
	Thu, 26 Jun 2025 07:53:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8940C4CEEB;
	Thu, 26 Jun 2025 07:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750924412;
	bh=Lt9OFHu6pgL3Xmje4MpYWTnla2Hs12OXB8URktFGWC8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vRQYzUlGmrZKYw+vT8bqUwSltgIAm5Ma1MAHXXJoWSNaZh8J69G6zYAI6IN4FEwc7
	 aUSJiTKI3+lVhWPzOfKjg3knt1l+dJsVEGTAilByPXGsPP98XmcmrwMqlx7d1kmnYc
	 CIAGEvr+S3GQ4CRc4Pmtz3rVxxlGMuKXUX2U5FeHQgv0/JjA68SFHnbQOMHV+VS5/7
	 4YTDjYryN+mx6ycDO6uNfpbSmPk4xaL6mlQPaKjS9m0+wFHhhHo6q0q/mWM20lLWJK
	 nQ/fCHwoMYYvyIIHkVnHnYvOP1D9o5en4Oi4zf9LqfuDmxDRAOkkhwbo1RiMQv9NtL
	 9ZrLKj4XofnPw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uUhQI-00A8hT-Je;
	Thu, 26 Jun 2025 08:53:30 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Mostafa Saleh <smostafa@google.com>
Cc: oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	qperret@google.com
Subject: Re: [PATCH v2] KVM: arm64: Fix error path in init_hyp_mode()
Date: Thu, 26 Jun 2025 08:53:27 +0100
Message-Id: <175092440336.8068.17654803423983782262.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250625123058.875179-1-smostafa@google.com>
References: <20250625123058.875179-1-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, smostafa@google.com, oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, qperret@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_005333_926737_5E09C59D 
X-CRM114-Status: UNSURE (   9.03  )
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

On Wed, 25 Jun 2025 12:30:58 +0000, Mostafa Saleh wrote:
> In the unlikely case pKVM failed to allocate carveout, the error path
> tries to access NULL ptr when it de-reference the SVE state from the
> uninitialized nVHE per-cpu base.
> 
> [    1.575420] pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
> [    1.576010] pc : teardown_hyp_mode+0xe4/0x180
> [    1.576920] lr : teardown_hyp_mode+0xd0/0x180
> [    1.577308] sp : ffff8000826fb9d0
> [    1.577600] x29: ffff8000826fb9d0 x28: 0000000000000000 x27: ffff80008209b000
> [    1.578383] x26: ffff800081dde000 x25: ffff8000820493c0 x24: ffff80008209eb00
> [    1.579180] x23: 0000000000000040 x22: 0000000000000001 x21: 0000000000000000
> [    1.579881] x20: 0000000000000002 x19: ffff800081d540b8 x18: 0000000000000000
> [    1.580544] x17: ffff800081205230 x16: 0000000000000152 x15: 00000000fffffff8
> [    1.581183] x14: 0000000000000008 x13: fff00000ff7f6880 x12: 000000000000003e
> [    1.581813] x11: 0000000000000002 x10: 00000000000000ff x9 : 0000000000000000
> [    1.582503] x8 : 0000000000000000 x7 : 7f7f7f7f7f7f7f7f x6 : 43485e525851ff30
> [    1.583140] x5 : fff00000ff6e9030 x4 : fff00000ff6e8f80 x3 : 0000000000000000
> [    1.583780] x2 : 0000000000000000 x1 : 0000000000000002 x0 : 0000000000000000
> [    1.584526] Call trace:
> [    1.584945]  teardown_hyp_mode+0xe4/0x180 (P)
> [    1.585578]  init_hyp_mode+0x920/0x994
> [    1.586005]  kvm_arm_init+0xb4/0x25c
> [    1.586387]  do_one_initcall+0xe0/0x258
> [    1.586819]  do_initcall_level+0xa0/0xd4
> [    1.587224]  do_initcalls+0x54/0x94
> [    1.587606]  do_basic_setup+0x1c/0x28
> [    1.587998]  kernel_init_freeable+0xc8/0x130
> [    1.588409]  kernel_init+0x20/0x1a4
> [    1.588768]  ret_from_fork+0x10/0x20
> [    1.589568] Code: f875db48 8b1c0109 f100011f 9a8903e8 (f9463100)
> [    1.590332] ---[ end trace 0000000000000000 ]---
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Fix error path in init_hyp_mode()
      commit: 9a2b9416fd1d18d97ce1b737a11fcbc521140e5d

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



