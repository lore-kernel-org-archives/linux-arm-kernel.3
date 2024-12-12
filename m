Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1377E77186
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 19:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hGYkYSeYHQSD41XJ3zk1s2SoFkTdI6RXUUioHj73Rzw=; b=RnhZqEmurSCy6pxhuRICh184Q+
	KuKSe21Rg94/G6EORDZwJSHQdAFr2W4iH18qggoh1Ry1vyq3/FjF7gYjK06hWsCln/8sui7HrJfw6
	MQP9B8ifJAQr5e/surgUp/aQfXfQ7huBlo/szSGI32R5DXMM/rvPpdLU+aEMnmMJy4dR9Poq503jQ
	vktIyt63VfgIX92Www9wdfewV5qTjtXiVPqmqxKiDjeooNDeBmIrnHZV6EihjvavPF283azElV1t1
	CmWv5UxoiQDcd94Cc0jRIbc5pf1US/LX1K5+0ot83pAxgy4rjPYayYB9RUOnDyKvwxixiqnkkOxEg
	kVQ/qpUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLofQ-00000001aEh-1qnY;
	Thu, 12 Dec 2024 19:16:08 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnbc-00000001Kcj-2a15
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:08:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A1D34A42930;
	Thu, 12 Dec 2024 18:06:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16682C4CECE;
	Thu, 12 Dec 2024 18:08:05 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>,
	aishwarya.tcv@arm.com,
	kent.overstreet@linux.dev,
	peterz@infradead.org,
	Kees Cook <kees@kernel.org>
Subject: Re: [PATCH 0/2] arm64: stacktrace: Fixes
Date: Thu, 12 Dec 2024 18:08:03 +0000
Message-Id: <173402687928.3947168.7807121030690406216.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241211140704.2498712-1-mark.rutland@arm.com>
References: <20241211140704.2498712-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_100808_722350_2DC66747 
X-CRM114-Status: GOOD (  10.06  )
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

On Wed, 11 Dec 2024 14:07:02 +0000, Mark Rutland wrote:
> These patches fix a couple of issues in the arm64 stacktrace code. Both
> address some fallout from the recent changes to unwinding across
> exception boundaries, though the issue in the second patch has been
> latent in the code for a while.
> 
> The first patch was previously posted independently at:
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/2] arm64: stacktrace: Skip reporting LR at exception boundaries
      https://git.kernel.org/arm64/c/32ed1205682e
[2/2] arm64: stacktrace: Don't WARN when unwinding other tasks
      https://git.kernel.org/arm64/c/65ac33bed8b9

-- 
Catalin


