Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C026FEC1104
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 16:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xFGXy7RUoIj2TU8ilBexqUam0p0XLvQKS5QTrNRdBHk=; b=WYn1kWuAwci9q3OD/excFMcVi3
	PTjUZwE2VOEW4S888EjkS433bs0LOkmwvmAdCsQfqcDcWGTDSsEL/bH6iBlG73413GNDMKZa8hUw3
	Q/Km1x6Xjvu0W9UMislnMRNs58ikfce8Lq6ThS9tKiaA+VUX6vyutxoRADWmpcgjJVdUYG23AyTI6
	vGj7QFgcpgi2cWzdE9K56pdCtRAKzgMgreojGRCc9zn4/CpvFIPpekX68PPjtxijAip3mrafOk5oR
	mN10rgfBYT0PRwV31YL3kFntaOli0ebqUTdHDtRMbW/BAHO6iRweBOkc2Hu429jEi4cX+M5Suz0Fi
	CX1DUsrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYq9-00000000gtj-2n8t;
	Mon, 23 Feb 2026 16:31:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYq7-00000000gtd-49N1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 16:31:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C1036111B;
	Mon, 23 Feb 2026 16:31:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32B6BC116D0;
	Mon, 23 Feb 2026 16:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771864279;
	bh=HbRaNni9Yhg7DH4GQw6rMyoMLa5GVOltpDIZsyjITfo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=asRbb96Ua4NG0E2vTwwn45Mp+N9/NnVxIj7wsMXzdKSyCpQSpXNrE1hjQRNEAI/TW
	 +uQ15DGvP7pjJ9JP4GpSc4l/fOn8I+ViJ8zfCFf/IZDP8bz6g1pjf4hBGdyZTCe2Uy
	 J1WZYwB+h/CVA/uRUDJQN7Zjo885WSQuNSv2h+eSp206Bkq2q22CN/z/vgD3K+2Use
	 QPXH4sf5eYMzpFAd7g+mfzVovY7W2tmFhgFegDKY7mKDf3vQkoOh1BhOAwDQcjJN7J
	 tTJxZny0W0j3M4pwHUFgnwW/yGoX3FFGVBin/iWg/5yD8riSrmd0XbBZYml82QMQtc
	 07hViK1gOUM+w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vuYq5-0000000D3s7-0ASY;
	Mon, 23 Feb 2026 16:31:17 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Quentin Perret <qperret@google.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Fix protected mode handling of pages larger than 4kB
Date: Mon, 23 Feb 2026 16:31:14 +0000
Message-ID: <177186426799.3533992.5872404007182314349.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260222141000.3084258-1-maz@kernel.org>
References: <20260222141000.3084258-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, maz@kernel.org, qperret@google.com, will@kernel.org, tabba@google.com, vdonnefort@google.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, stable@vger.kernel.org
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

On Sun, 22 Feb 2026 14:10:00 +0000, Marc Zyngier wrote:
> Since 3669ddd8fa8b5 ("KVM: arm64: Add a range to pkvm_mappings"),
> pKVM tracks the memory that has been mapped into a guest in a
> side data structure. Crucially, it uses it to find out whether
> a page has already been mapped, and therefore refuses to map it
> twice. So far, so good.
> 
> However, this very patch completely breaks non-4kB page support,
> with guests being unable to boot. The most obvious symptom is that
> we take the same fault repeatedly, and not making forward progress.
> A quick investigation shows that this is because of the above
> rejection code.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Fix protected mode handling of pages larger than 4kB
      commit: 08f97454b7fa39bfcf82524955c771d2d693d6fe

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



