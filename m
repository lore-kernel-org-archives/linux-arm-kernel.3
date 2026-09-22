Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E65DC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 17:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y0RaZjhg7p918DG4B83V3Lyvof2PLvieks4Sm8hX9pg=; b=aZr4C8iow24BUcyy6dbXohVgT7
	ZnsHMnR0Q7CHZ/azd1ALj7+3DcOFZDTfe5JUD9lKgHHWpmAjBV+V+6Vx4Ak5z72HA2QNDp0J3+4VR
	tLHeNrFtTckAdsq2K9bFAFZzB3nAyK5gHDjuw+clEJrDAaLOQDX6Pm01KCp7tLBPY5cN+A6xXBfdp
	RnVFn+g4weKiJunC5Tl8xF9JJPMZnSA9WEaNo5IAi+nW0BpKD6ty+jGzo+hPJ2iwamHurxg7B/0Li
	RbTlGR5m/RFQa5gNAXPS1Bir7I4Br26a6ii6AwVO1b4iERZtmWsV+RaQNMAmoQRGt7mMNnizO0gOv
	bZ0ZE6SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93vY-0000000691X-3mTQ;
	Tue, 22 Sep 2026 17:05:08 +0000
Received: from out-131.mta1.migadu.com ([2001:41d0:203:375::83] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93vV-000000068zx-2k9y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 17:05:07 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Y0RaZjhg7p918DG4B83V3Lyvof2PLvieks4Sm8hX9pg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790096702; v=1; x=1790701502;
 b=h93VQnMqqSdogkSW7EqkkRsk3uxkx23YeJc4jSptg6s4nRqntm4xlaVXqJku/323A0EPtUli
 KU+E8yF8Bk7FwTSyY95nNyxN5E8dlonOSajlUtPOfm/4rG7N5uI5GM8V5pw2jBnikpaudh6Tmgj
 4mNaAU2pu1VxrMCDCeIhDv0I=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 405ad137f488e4a9;
	Tue, 22 Sep 2026 17:05:01 +0000
X-Mizu-Trace-ID: 405ad137f488e4a9
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: Yuchao Zhang <ndaugoing@gmail.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v3 0/1] KVM: arm64: vgic: Drop last_lr_irq and serialize overflow EOI replay
Date: Tue, 22 Sep 2026 18:05:00 +0100
Message-Id: <20260922170500.3210708-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <87bj9r4h9z.wl-maz@kernel.org>
References: <20260918040214.85580-1-ndaugoing@gmail.com> <20260920014911.58616-1-ndaugoing@gmail.com> <87bj9r4h9z.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_100505_845612_D497919B 
X-CRM114-Status: UNSURE (   7.80  )
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

Hi Marc,

On Mon, 21 Sep 2026 00:47:20 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> I only boot tested a small nested guest (L1 + L2) with lockdep on my
> laptop, and nothing caught fire. Please give it a go.

FWIW, looks good to me. Tested on QEMU (VHE and nVHE hosts, KASAN and
lockdep on) and on an M4 (pKVM nVHE host on Apple's nested virt): the
pKVM guest boots are fine and Yuchao's selftest passes, though the
selftest passes on plain rc3 as well, so it doesn't exercise the fix
yet. I'll reply on the selftest thread with why.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad


