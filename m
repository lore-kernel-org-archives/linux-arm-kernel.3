Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2819C98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 18:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UudnOHzH5gND/ZKP9GlDKbtsX8UUCMuh8MThvvDSe6M=; b=eU38FZkWjbgJwEps+POzosVood
	D3gGiEqVnqR/h2CTzIjmX8Wyq311xhxIotXpKNX+Mx/6c/Lma/xWcsCGWD50LCc5R3GDaKFYyA3T0
	ZRE2Nhoxp5TZdBKLq5DKzZRcHWkhJND1aIg7izAywqG8z+3GIOfe7lPZhkfvStqFleq2ScEJmAUBm
	pQpgKAKMudrGZjZk4Td5S3x1niJwATDDvmDOgurrleZDAeBcxc75Ch3UyxTgwFXeCMOs5RCwpwEtL
	n9hLZ3zYi3jwf9/uU5Tmt9EcASa46LZhBdGjgv9Wn5P+DY7HUTWHV0bzYOQvdGLXAUqsudPtW2IM3
	Lg0Ul51Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9RaH-00000009AV9-1qhK;
	Wed, 23 Sep 2026 18:20:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9RZr-00000009APZ-3XNM
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 18:20:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UudnOHzH5gND/ZKP9GlDKbtsX8UUCMuh8MThvvDSe6M=; b=pmEhB/TH3g5JUpxPnNPtFMlFZ5
	2dM4AqphRZ93UvqiQ8bTt/Y1Qtg2jA5k5yc5zng3+IF6kIpFVR+hdo3odWr6nNltUyNH/EkUhIRSe
	7dsjaPtywjrFCNDtep47vqSWDvEg0H1H8sGrDbGvsmJFOBminK6lnhp9ncpomhSQf+hA25QgoDkmj
	2BbGVEx3o5IXa4ZC4w//cb2aAta3DRW//K7LV9B9BkspBeDTDKPASoxtyyMoU71Km7xOWaE3lk0JQ
	KYJoWyIxoQPtCCu4kVuaFbwnVM+8Xh85sRUIYcGrAccZgCilcWwa2AuQ17Sz7f8fW+55Bd5wZYP5v
	TpOLsKrw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9RZo-0000000F8xi-2Nej
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 18:20:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 939901476;
	Wed, 23 Sep 2026 11:20:10 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37F1D3F632;
	Wed, 23 Sep 2026 11:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790187614; bh=psx0TQLmyNiIJ+VNgwp2iGjiCL84o25TIX5Ofh7gPno=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P3CkPstYF/b4U9ELIC85YU4fOQq6/1a/cDCQmDHYi6iOHmRA8cj8RBFHrIlRs73b4
	 4rHPrudj0xVH/owEs4JGTGJRojIb3lzEHtXaXvNDckAxnfTuN9oS75+MxkdQbw26gt
	 g0PeeP/4mwTpMjnYdzLwzwYLblqP39dI063/zhEA=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>,
	james.morse@arm.com,
	maz@kernel.org
Subject: Re: [PATCH 0/2] arm64: alternative: Remove optional 'cfg' parameter
Date: Wed, 23 Sep 2026 19:20:04 +0100
Message-ID: <179018757672.2942904.11161685932352017769.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260902113232.314831-1-mark.rutland@arm.com>
References: <20260902113232.314831-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_192016_837697_131D5AE6 
X-CRM114-Status: UNSURE (   9.20  )
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

On Wed, 02 Sep 2026 12:32:30 +0100, Mark Rutland wrote:
> These patches remove the optional 'cfg' parameter from alternative
> macros.
> 
> Use of the 'cfg' parameter is less clear than ifdeffery or IS_ENABLED()
> checks, and also doesn't allow the compiler to elide asm() blocks when
> 'cfg' is not selected, so it's preferable to avoid it.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/2] arm64: mte-kasan: Use IS_ENABLED() rather than ALTERNATIVE() 'cfg' parameter
      https://git.kernel.org/arm64/c/228718f6babd
[2/2] arm64: alternative: Remove 'cfg' parameter
      https://git.kernel.org/arm64/c/0406e2e71daf

