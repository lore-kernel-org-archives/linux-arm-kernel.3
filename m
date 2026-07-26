Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4ECC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 15:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=90dRkqb4kzZkUYsbF32/LDqG/oAXO0WNorNYPH40nEk=; b=DStVfyqerzPRmhbLirUq7giPQa
	rGkB0XF0cUXYXF2Hfm9wS9lsj6L0JEHlHtbBIVilFFGITHAxD7+blmEfdEdFIf8N3nR5zTG2m9aiF
	kLue3vtT03xo+8ljX9RPTVyNG67fQOHjl8WzKBD9JyMZN/QO9Fb+L141x9ngzTDwbkdvvjuJ9/gAw
	YJ+3dbuIm9q4GcyqLMeoDjwCV+hHVb/5/5QbZoggPI97Ds1HbzoUPLaX3NFcxscpLmzZW4UOSoxDe
	m5qGbInTB/voo0XJl8IkPRkR3D2Y6+1PjyBY6uk+TxdOwgTVHn5A6Fq9bpTIqH2wn2SpvIPW9E8l2
	vyU4MAMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo0Lm-00000001GnQ-1Zix;
	Sun, 26 Jul 2026 15:01:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo0Ll-00000001GnK-3Vii
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 15:01:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0BB6843E6D;
	Sun, 26 Jul 2026 15:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD0E71F00A3A;
	Sun, 26 Jul 2026 15:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785078068;
	bh=90dRkqb4kzZkUYsbF32/LDqG/oAXO0WNorNYPH40nEk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=m0lor05ltBdMhQbkCNsw/qeBXNeKLp9OBtEehP1V0GvcpSWL/0xD2+KM4Lv/fXDB4
	 BftpQbEjsFL8MQa6l+nYBSoPb86UPbOjMO6e9KzyBXDIuz44ho3Wdwof1ouPxCyGzp
	 QMR3ImLIIxwgF5dZuTd6nLSQS6AM7sVnqVu0ROyf3aJuqPjHDgKJLbHjSQXkyULT5U
	 ihi1QXjSEBfNTgonWhsSVRBFI0DyRzuitJObr/D5nBYtsgZ/qyJn2RPKiMCgcjIig2
	 R4O7o82WsBmhRl4OLSK6lgxVeZYVLqvv6KcOAWwFquNClej3VoyeNrAgPyZMVDUKGI
	 uVh8ANiGRNYQg==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Joey Gouly <joey.gouly@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] arm64: Fixes and cleanups for cpu-feature-registers.rst
Date: Sun, 26 Jul 2026 16:00:51 +0100
Message-ID: <178507570719.3401780.18017279270109471777.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260702-arm64-cpu-ftr-regs-v2-0-fe0b78f1bd93@kernel.org>
References: <20260702-arm64-cpu-ftr-regs-v2-0-fe0b78f1bd93@kernel.org>
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

On Thu, 02 Jul 2026 20:11:15 +0100, Mark Brown wrote:
> Peter Maydell noticed some missing updates to cpu-feature-registers.rst,
> while looking at these a number of other other omissions and some
> maintainability problems were observed.  Several registers and many
> bitfields have not been added.
> 
> Following discussion with Catalin we remove the numbering of the
> registers in the first patch so that when we add the registers we can
> add them in a roughly sorted order, then fix up the missing
> documentation before sorting the existing entries in the file.
> 
> [...]

Applied to arm64 (for-next/cpufeature), thanks!

[1/4] arm64: Don't number registers in cpu-feature-registers.rst
      https://git.kernel.org/arm64/c/b6bd4d1a5b6c
[2/4] arm64: Document missing bitfields in cpu-feature-registers.rst
      https://git.kernel.org/arm64/c/4788adeca0e0
[3/4] arm64: Sort registers in cpu-feature-registers.rst
      https://git.kernel.org/arm64/c/21a2ca869edd
[4/4] arm64: Remove hidden bitfields from cpu-feature-registers.rst
      https://git.kernel.org/arm64/c/bc7f7ddc64df

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

