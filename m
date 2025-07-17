Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC5CC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 12:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zdYamypvTxAx3Ku7DHfPuZb9WEnEeHrJk3VSFs/401A=; b=j5yKftNezK+sqMhiIAi2Zvr7sp
	kFnsQbkZyxcWHAtcqG/QoysB8H8roOq6xuJM2Uo/ER2vkGAQvOEPSXBbbiVp8V4467gO86/YVxdq6
	/JGxiuWbJ7lRhc1a8VHB3pM5EZew1VSj61P9Nn+LoRz3md1gbrF9MmeL5duwuFmLpGBGr40Hg0avg
	QU9TaGVuXTL2fuemBZ/6sHfPD4GwISo1jJ5/BLfFwjP3MowqRl+aYzvt+aiBPu+g4Q07Dmyfq+uJH
	FZbRNergMrmo/XlIayiPT1HjjlBtsBN1eXmutp3xkhFp+VXbl5h215VOvW7TqukXm1V0eDDEreuur
	XevQCv1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucNaX-0000000A685-11fB;
	Thu, 17 Jul 2025 12:19:49 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucM8E-00000009t3V-0JJI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 10:46:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6265FA57853;
	Thu, 17 Jul 2025 10:46:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCAE2C4CEF0;
	Thu, 17 Jul 2025 10:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752749189;
	bh=BPQRhJu4WuTyEH2d/mXKogr4/Dl2oBnBFlU/tk2u1YI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qT+QkDG5FL0haJPJ6DU3Jxayt9PLHcnpuSZX8OsXHGX/nFNEKukRsi/NSbThXsfHX
	 XW80y2LwnngWFYDAKhNhP6FHDqW7r+TV/p1nb9ZbF7QZp6zUo0liO9b/n6GQ+TPPzW
	 VhbkkajrXlUTKdCYVl3YL/Qj+76CuHHfHaL2v7l6rK5rakEPS51e5/usEjkgrR997I
	 kNYFgUqG4fUCoIqJ1V2a27RV59ta1UDiayakhGGEX1G1aj14UhMn++ERnfcJxyZWjw
	 +6sVO3Hn6LIun+FrHEXbA9oeHNIO5bi6QNtcJ08BEjqSF4jgH5F3a8eXjJFNi1xhnc
	 JW7bmaAd56X6w==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64/gcs: Don't call gcs_free() when releasing task_struct
Date: Thu, 17 Jul 2025 11:46:17 +0100
Message-Id: <175258790439.3684657.2697022341807842240.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250714-arm64-gcs-release-task-v2-1-8a83cadfc846@kernel.org>
References: <20250714-arm64-gcs-release-task-v2-1-8a83cadfc846@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_034630_183849_5CAA729E 
X-CRM114-Status: GOOD (  12.24  )
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

On Mon, 14 Jul 2025 12:21:27 +0100, Mark Brown wrote:
> Currently we call gcs_free() when releasing task_struct but this is
> redundant, it attempts to deallocate any kernel managed userspace GCS
> which should no longer be relevant and resets values in the struct we're
> in the process of freeing.
> 
> By the time arch_release_task_struct() is called the mm will have been
> disassociated from the task so the check for a mm in gcs_free() will
> always be false, for threads that are exiting leaving the mm active
> deactivate_mm() will have been called previously and freed any kernel
> managed GCS.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64/gcs: Don't call gcs_free() when releasing task_struct
      https://git.kernel.org/arm64/c/75fdf823f94b

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

