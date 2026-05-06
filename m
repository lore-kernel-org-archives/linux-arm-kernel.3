Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EFCBCD3442
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 16:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hxh1fW9CZ1sDkvcshULqmAQW+u/m404RsrvMegNyZeQ=; b=c0Xqgp1ILia+XUZYEWKc3dmwM+
	/OtJeZrkvNSgmhTpG8LEfbtKaUm6bXse6y7kynAKMlgh5ztwkNZA7WgxupygTxt6/hWW79Gay3ugk
	gbXYJbk8BUNh2hp8MhBRgrvdx8wlcbHKEvv8OuoQBqtYlKwhlS+621QyZ9vXv6LaMdG5fxFiWrR+K
	BVUMpMHS5qLONvWnKm/4esCd4TdQAo3yJwwiwAdb9A5oyqKTbxEF8bXCdtzpAd6Y085zOnq24waP0
	6jV3wwk7lkAn3Wig29Y5Mgji9gZZtG5AvR2Va5p+QAgfiwTNjdnVJ3MmbIN4rWg3EJHA7wlh585oy
	oQLo8azA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKetb-00000001T76-06B4;
	Wed, 06 May 2026 16:14:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKetY-00000001T5S-2Dme
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 16:14:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 461BA43E15;
	Wed,  6 May 2026 16:14:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26122C2BCB0;
	Wed,  6 May 2026 16:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778084084;
	bh=p4+NUlHRcOu5P2zipShb0qY76fjH/71ZYiZBLp82jYo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WxYjBi5OXUCGKu+En+S22iqTJt9058js756VEeEAmR4oTGD2eFOF++cRFGgQxn5dc
	 8k+7lehNNWppFImmmhsMbA1oe97CfisyW/KD3H/nSkJ62lS4diiTDdNZtDSDSgZctJ
	 vkKTu9671xOjZOJi81L2szjn7wpiUxwtTmwaKSpL5bopdnezVe+Cp25tTvTeJTQHgL
	 7QlSfa/TXz9oFUY0cOUHahSizXCKJCiBTbGX4cAgZ+jta3zQ5Ze6sbf7W0AxdVjCH1
	 xG4my8s8pLB4AkV2p+gsB6ecCZDvBFTzJ1IebKRhgt+gBAh2VdGA//Sgbss1Hp5BNt
	 gQytwPCI4lnuQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wKetW-00000000MIY-0Lm2;
	Wed, 06 May 2026 16:14:42 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	Mostafa Saleh <smostafa@google.com>
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	vdonnefort@google.com,
	tabba@google.com,
	Oliver Upton <oupton@kernel.org>
Subject: Re: [PATCH] KVM: arm64: Harden clock for nvhe/pKVM
Date: Wed,  6 May 2026 17:14:39 +0100
Message-ID: <177808404898.2712489.96941803949912620.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260430103724.2151625-1-smostafa@google.com>
References: <20260430103724.2151625-1-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, smostafa@google.com, catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, vdonnefort@google.com, tabba@google.com, oupton@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_091445_003513_3DD29037 
X-CRM114-Status: GOOD (  10.45  )
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

On Thu, 30 Apr 2026 10:37:24 +0000, Mostafa Saleh wrote:
> Sashiko(locally) reports possiblity of division by zero and
> out-of-bounds bitwise shift in trace_clock_update().
> 
> Although the clock update is untrusted, we should at least have some
> basic checks to avoid the clock value getting out of sync if the host
> is buggy.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Harden clock for nvhe/pKVM
      commit: 9a624ea3f26f40c76bd2c7f77cde30659d42efbd

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



