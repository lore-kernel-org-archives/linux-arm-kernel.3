Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F03C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 12:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Or8Pe5n7HzA1l8ZLw2yh+GPLSY54zl2fflrMNfqw04=; b=Cp8+tf2W9vHflhwphOKiDmBAWC
	ds/PngIxfiE6vEU2i1E47mgB/SjP1GQN2AewOgAGlhvPy9f0z0DPimqwfK+zeKDJVGeURuCzKT+0S
	n762AXhBRL0uUGC+C0aLHsdJyy3yQNgbTOhL0cTRBSoh0sWW/JHSyQ0kJ8yF3uv5CN7FsmM55svta
	/aCFj5z5JfgHk8AxCmJqUNHWcVZoA+YmB76JEen74yERRMwpMigz9TS707z+JqpxGx09ZH1tScKkV
	OLcKlAD5TVRl/uhrKaAnbZ7NchPE3rN4ZFQbu3CLx06n/N3M5prW28VM9+aK6ezUid0/TF7A9cw7Z
	eotG7jcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFts4-00000003KiV-3C01;
	Fri, 16 May 2025 12:09:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFtq2-00000003KVb-0g6S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 12:06:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A49349E62;
	Fri, 16 May 2025 12:06:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35145C4CEE4;
	Fri, 16 May 2025 12:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747397213;
	bh=YVC5S9ZL3DJBFupA3JCCgZgdIfQCsHEqHZ600McfhKo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RX6+G9yCD2cqcY4Ffqv68F3AHQI1luiKN1nyR39iy7FK/dqfN6dyIykaBFIPIbu8Z
	 TZew2gR9Jaw5f8lLGS4im/wCCP+a7obSfnE285H0ZuuPF/qaSRdPAtaJsk5htiS/Q8
	 YlvOaP0135woHv4kqXZoaT8mR/1nlrCkJkFMOMUcc0GVHjbW+OLp5/5MYWYKyBhDRJ
	 0VTzyCbZZdGGl2eJ3rQrrk3f/v0OSVBn40qM3izXoR5XGi+p2deUNSanBeyVv8rpu2
	 THi/JvbD+lFYxDUW+36YALf8h6aZFNGr//O5Cz4VVZjlnYI40G2tw8IVpot9sMObTm
	 pktOP2UHrgu0A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uFtpz-00FXq5-0g;
	Fri, 16 May 2025 13:06:51 +0100
From: Marc Zyngier <maz@kernel.org>
To: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jintack Lim <jintack@cs.columbia.edu>,
	Christoffer Dall <christoffer.dall@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: nv: Remove clearing of ICH_LR<n>.EOI if ICH_LR<n>.HW == 1
Date: Fri, 16 May 2025 13:06:47 +0100
Message-Id: <174739720148.2525124.8020669410674069519.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250512133223.866999-1-r09922117@csie.ntu.edu.tw>
References: <20250512133223.866999-1-r09922117@csie.ntu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: r09922117@csie.ntu.edu.tw, oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, jintack@cs.columbia.edu, christoffer.dall@arm.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_050654_221838_A743BFA3 
X-CRM114-Status: UNSURE (   9.23  )
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

On Mon, 12 May 2025 21:32:23 +0800, Wei-Lin Chang wrote:
> In the case of ICH_LR<n>.HW == 1, bit 41 of LR is just a part of pINTID
> without EOI meaning, and bit 41 will be zeroed by the subsequent clearing
> of ICH_LR_PHYS_ID_MASK anyway.
> No functional changes intended.
> 
> 

Applied to next, thanks!

[1/1] KVM: arm64: nv: Remove clearing of ICH_LR<n>.EOI if ICH_LR<n>.HW == 1
      commit: 92c749e4aa90cd684d87cb5bde6a9d51e83fe6e3

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



