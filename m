Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5B4CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 21:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B/ZiYOUmPHLHotUhywFnn0yHtujDN/WsHiPkrIyT5HU=; b=JIa6PQIXo9bIf1JsKNa24DhcHm
	tkCT4Iv+cg4zKKw7TD5RkQDDaR3WhLGWJ+OZ0Fp1tbvNUY3/HPWjar23CWAJcHXNfadru0fWFnENZ
	OOopyPnZU8M7AoI42a86/d5sgcrG4kVPoMhHSZP/vbo3LZ+h8QRKxhQnc03yRQ/6L50Mkgd6FpObg
	RTGEkPN7iXWCsLPf51k7umWDmfJBXMoiIma2eTVLWviftNrzXFyxKp9gYGQQ61PbCX7xXy06LmC/F
	iNXpQCD1YHuj5qsRBHT77Y9LZ0ln0aw3uKM9B8u0vm38G9FeyizyZoONgKGlv24BcemlcVQKaH72w
	atCSlaHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUsnl-0000000FpYA-3F8T;
	Wed, 03 Jun 2026 21:07:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUsnk-0000000FpXV-1XxJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 21:07:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CE3D060136;
	Wed,  3 Jun 2026 21:06:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A8031F0089A;
	Wed,  3 Jun 2026 21:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780520819;
	bh=B/ZiYOUmPHLHotUhywFnn0yHtujDN/WsHiPkrIyT5HU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XGWVLIPrusBg+AxlTpZAVvbBCe2NVCNbSxKfPFXbCfwMg/BLF/2/Qfvvdupj1YZsO
	 eT8lmp0GQaE8KLvstEgFds/qDHgODLFRBaCDi9HiRRIz53hqVMOlTTCe3XW+tndGvv
	 WxaQ9yVAh3wQaNdZNqH9d3/TKnE9aiVuKvS117JHH1KomybnZhQ1TpSxAumVXYy1sk
	 xX6A0U9oVRG+QxwoSzZ+38kiX/kFxRir9nCgAsWy7Z/3W3Z/MDTejLdO5mQB7Q7h6X
	 8t82f737DAK+juS4tLBQnw5P/uMHe5IqeD1nUxOSQgwc8ma30SrK1MvwzUbcuBcNKS
	 mYHcOi0QN71IQ==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Thorsten Blum <thorsten.blum@linux.dev>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: patching: replace min_t with min in __text_poke
Date: Wed,  3 Jun 2026 22:06:30 +0100
Message-ID: <178051772459.443326.10117872015673922438.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260531220817.738904-2-thorsten.blum@linux.dev>
References: <20260531220817.738904-2-thorsten.blum@linux.dev>
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

On Mon, 01 Jun 2026 00:08:16 +0200, Thorsten Blum wrote:
> Use the simpler min() macro since both values are unsigned and
> compatible.
> 
> 

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: patching: replace min_t with min in __text_poke
      https://git.kernel.org/arm64/c/6c2ccb4979b2

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

