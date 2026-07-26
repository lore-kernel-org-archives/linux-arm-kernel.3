Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FEDEC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 15:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zdDjMqnM3oFgUp2kRzfpfPyl+I1BcCySl7B8ZdZRJuM=; b=DnlGKrQWIEcF9/tJKEDv4lxLJ/
	w9j/MlxM7tibdjp2bEv/0OcAsGKyTMmV85amRITE3TH0BL4845E474Nd7LwVFPo3Xg7EaOJ2etmN7
	yu0F7T1ca+kE0FKiQ3Yjcn8RwjdyTkZUg0SXr5RBVagw5t9T53vOfxV+BOUznhmxsUH83YNsTUZuZ
	w4ZslZJcQQGFKjZGqKnNUANtjzXCdUivPyFbJK5ptAV1fHwZjz9NMjTKSdZNnhSd2+irmOlihR9vF
	XHHsY9I7uca/Ed3kzKhlO+MhODJ7FJL4xyslWchxqQh71bnEbeUrHg2R0kdwaaayfXzvN3+YUDivw
	J0vLAgzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo0MA-00000001Gso-22ZQ;
	Sun, 26 Jul 2026 15:01:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo0Ln-00000001Gnk-2vG7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 15:01:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3AFC6405DD;
	Sun, 26 Jul 2026 15:01:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72BD21F000E9;
	Sun, 26 Jul 2026 15:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785078071;
	bh=zdDjMqnM3oFgUp2kRzfpfPyl+I1BcCySl7B8ZdZRJuM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DzqNZ/kunhcNe59u1HCqZkNwtKwJw8CYq7CxYmoNJRPT0UMKup5Ps0grOgdhTUFpU
	 B5h7G+VjN3q8GaFjaJgl/O8I/aoJMO3N29Ew5lh0AIm+SDbz5g4+bd9qDJiWs/YxRf
	 asBsAsAR2aheA6rfzaRWQkKP/y8PX5wQufz1FFuLhhDMScfGmXVdIpDMDpTsO+MAUM
	 akB20iqo96jbfW8covXVkQ2QKgKoGbZ9aBin0X+IoVaugFvx9+nYW2SQ/iQUGsDPCO
	 ipUaZ9dSfmHhCUeFRQDKTGHNwtdIpHH+RFfFVy6hwIaKkYlG+RtF0Oa/qQpb+zdzCY
	 YVsEcNiST8XOw==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Kohei Enju <enju.kohei@fujitsu.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Gavin Shan <gshan@redhat.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1] arm64: RSI: fix field-spanning write warning in attestation token init
Date: Sun, 26 Jul 2026 16:00:52 +0100
Message-ID: <178507576692.3402407.12293153444311559996.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260715122907.8061-1-enju.kohei@fujitsu.com>
References: <20260715122907.8061-1-enju.kohei@fujitsu.com>
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

On Wed, 15 Jul 2026 21:28:50 +0900, Kohei Enju wrote:
> The challenge is passed in registers a1 through a8. However, copying to
> &regs.a1 makes FORTIFY treat the destination as the single a1 field,
> resulting in a field-spanning write warning. [1]
> 
> Overlay the SMCCC register structure with an RSI-specific argument
> layout and copy the challenge into an explicit 64-byte array. This keeps
> the existing a1-a8 argument encoding while giving the copy a correctly
> sized destination object.
> 
> [...]

Applied to arm64 (for-next/coco), thanks!

[1/1] arm64: RSI: fix field-spanning write warning in attestation token init
      https://git.kernel.org/arm64/c/221049874b6a

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

