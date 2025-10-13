Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23EB1CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 16:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vKeluWm2xGTmkkkmtrcVXoAc7gEoiSJl/DrqdKkO1DQ=; b=W9Hi05riurlATtpYkqkLN9RtLS
	qigEeH9rjYyem/9DXLULvW/kZSfWyNCTAyURbv9eUAg3vjDB/R5QDHEvpomfNj4XLSLCo6arAjpxp
	dHamLUlIi9eT/2fyPNtuwa81lOtklem/o7cuaw90UFJi4D4/qgpiW16Y+5R3DaMzsl4WoLb0xvpP8
	vXywQNKL7TujJwIQ5YxB/BLCPt62ok25mRKhKAyCHTD/P/TQERDFcYtsyBtsjEcl7fy1oew2eaCW/
	BoLEKfc15XDSCxkszobepFvTkAyj7fc6lWgMMm/CGftwLbQEZfr51CJWcbqwQmHZcejkU3ZBYieYR
	VoUt8VdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8LqN-0000000Dwbg-0z6I;
	Mon, 13 Oct 2025 16:56:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8LqL-0000000DwaR-1zln
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 16:56:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 15E5540564;
	Mon, 13 Oct 2025 16:56:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E88DBC4CEE7;
	Mon, 13 Oct 2025 16:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760374576;
	bh=KLfGOCVwkj6cLAhHYVXLE9hEZv8zCuONXlmlV9iauKE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XrMsX32LZTlMzKpNmGasGW0zCn3IU29cqzXBHQ+BAB2/YHt44WdwUqk/XY5YXaL2u
	 qp6cHXcmDxGNhEgQXv4ciVrn0eHYhG5rOrzfclI6rIl4mBduqg6XsSOPE/40hBkMVn
	 AMpZDvYsNEgfA2EiHsipBCRQ6Si+10CFGmths6l+i7NSy+oz3Gz8e5tjhrtD/eTy7C
	 8AbHeAxS62KiG/VhVlmf+RRw79qhTKHuhSKvn/eFemYpYRofxkKPT1zx/7tGs15/cx
	 VRuUL80jzyWhxSjCkpllz+RAxzIinuQEN72oiF9R8H7kYtYrp/cIU9rsOFgzl+gmxe
	 cKP2DWlNtWpOw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1v8LqI-0000000DaV2-3qkd;
	Mon, 13 Oct 2025 16:56:15 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: nd <nd@arm.com>,
	oliver.upton@linux.dev,
	Joey Gouly <Joey.Gouly@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	yuzenghui@huawei.com
Subject: Re: [PATCH] Documentation: KVM: Update GICv3 docs for GICv5 hosts
Date: Mon, 13 Oct 2025 17:56:12 +0100
Message-ID: <176037441181.969330.12749252247958777083.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251007154848.1640444-1-sascha.bischoff@arm.com>
References: <20251007154848.1640444-1-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, Sascha.Bischoff@arm.com, nd@arm.com, oliver.upton@linux.dev, Joey.Gouly@arm.com, Suzuki.Poulose@arm.com, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_095617_552445_CD0375AD 
X-CRM114-Status: UNSURE (   7.84  )
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

On Tue, 07 Oct 2025 15:48:54 +0000, Sascha Bischoff wrote:
> GICv5 hosts optionally include FEAT_GCIE_LEGACY, which allows them to
> execute GICv3-based VMs on GICv5 hardware. Update the GICv3
> documentation to reflect this now that GICv3 guests are supports on
> compatible GICv5 hosts.
> 
> 

Applied to fixes, thanks!

[1/1] Documentation: KVM: Update GICv3 docs for GICv5 hosts
      commit: 164ecbf73c3ea61455e07eefdad8050a7b569558

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



