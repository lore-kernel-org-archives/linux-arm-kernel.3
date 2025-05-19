Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C057C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 16:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c9+MVoVuKsWqAtYpnzD1CwBAlGOa2SeRMa5cvBapTOY=; b=A+tZC+6bt6rzkzY8sEYdarSor/
	9XOOLzWDArpTkfV++1iCiK1JYjAjjIaCZLpTII+xlgNTynYNoJmJunzFetC6Dc0N5IM3bw7snZlHi
	+qInrSgHjFD/8y8ZoegLGMpJLDZvQ074i1YG/sQNmFf8oSG+PSqr2lrb6vVlRGrFOyscVGlRWQlyi
	fg5OHpQoaBP39FX7R3iziXzd+MM0/X3FegWgqJbNiIi2YWiZkfBkSvWlTNs3uD9r2RMz+d822QziZ
	axDT4GPdHMppWCCGOVdGE2OXwQ85DPG4cIs5t4BYCaYk8wA9W4U+lkb9oolTa0DTpXsV9LFj+vFmg
	OQti48XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH3Jb-00000009nyB-0JkC;
	Mon, 19 May 2025 16:26:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH2Ji-00000009b9N-2Nqx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 15:22:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 04395629C7;
	Mon, 19 May 2025 15:22:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE869C4CEE4;
	Mon, 19 May 2025 15:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747668133;
	bh=s9dzKebIdZy4b9g1q/MYH+pyp2xnRZ2ePgm1nnvc1FY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CkmnGYOKI83Z98Kd1zCEKTEDbu8XrjAGeMJnSeRccWybQnf2T81+uewEttmwAi5J+
	 roGXHAtdCXeFi4HW+8VaHH//TQZUTv0p2ZHJ5JpOt0+icn104qKs8IHXSOfnEgg+T5
	 Nc4BX77308W6VWIVSXkTp5KdSNgVyVf1nzOvj9vvZQBgP/HVPyk02Tc5EVIJjohk1i
	 7z+7sxYZOaF29dbIS8JJWt5zwl6MgNbk+MxOl7qXPhnO+mV68W2wAZn685nOefHwIo
	 6abFYzFPw94Tsor4xCIzM2OOeNhOnt9zXtHU8NENjR7z3/ggg7avxqhE+r+xR5m6i+
	 djotxESeXZ0Mg==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	mark.rutland@arm.com,
	ilkka@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] perf/arm-cmn: Add CMN S3 ACPI binding
Date: Mon, 19 May 2025 16:22:08 +0100
Message-Id: <174765431517.1659777.133438662977545374.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <7dafe147f186423020af49d7037552ee59c60e97.1747652164.git.robin.murphy@arm.com>
References: <7dafe147f186423020af49d7037552ee59c60e97.1747652164.git.robin.murphy@arm.com>
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

On Mon, 19 May 2025 11:56:04 +0100, Robin Murphy wrote:
> An ACPI binding for CMN S3 was not yet finalised when the driver support
> was originally written, but v1.2 of DEN0093 "ACPI for Arm Components"
> has at last been published; support ACPI systems using the proper HID.
> 
> 

Applied to will (for-next/perf), thanks!

[1/1] perf/arm-cmn: Add CMN S3 ACPI binding
      https://git.kernel.org/will/c/8c138a189f6d

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

