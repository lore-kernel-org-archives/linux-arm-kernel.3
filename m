Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0976CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 17:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2BCKvOlbYBUFxDBTkJrNq531h+6de55ai82FTlmjyZY=; b=M6HE3jXPwmQZe0x8pSydNFN3mL
	SyUNz2Yu+bMtxhKMD9JUMX/6ApZ82t2sTssK66ZIW9eM9asQjylsQ8j2gxuAYwdbYECzNOMEs4Yfi
	PEcFivhYqml4DMJ+SnxP2wF1H/xeZNtrDkISEmMH+n6OExE89wW8r6LfmqONcjz//PW7ZsinPOVzc
	uOYMjZI7pzZkTvNrgxORCfR+Mke/2xNncEyTgeBHXxxuZ3Q2XkBva43PeD1vuF66MYXKH4RWyd1or
	bRFYhzsBP5VxP/qsPsj5Q9iRzgxZGhsGToymr4TXliWDKD081rfyyPFYCQvwGfGSz1kOo4FWQ5lrl
	OrqVZBtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDnLh-0000000GOnG-1n3T;
	Tue, 28 Oct 2025 17:19:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDnLg-0000000GOn8-1ERb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 17:19:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5896360560;
	Tue, 28 Oct 2025 17:19:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9158C4CEE7;
	Tue, 28 Oct 2025 17:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761671947;
	bh=6EGaNiihiDB64A0I9Mnu2VyM4of6JeXngApmLp18WOU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=e/3fpnz0tW8xBXZn7F/pXs2OLRKBi1VWbu0DKxq2mO1YvR3CSRqN60SMDj/1f0DC6
	 sNbvBSPY9sVQW3FeuCXgxWBTo3uKj1PsEYiD9xcgvsvVRelMxVy73+iuaibzY9Lver
	 kxVxrdKW6ur+FbtQskktMbwIc+An1aC01UkXBZ0+sAfXiWkU0fgeD4rndGejD9pyhI
	 zFbEhRVWutW+FyNTaRf+cSZ++rNdJfgASss/DVNnTwVOT1YP9Q5aGuq2YrKF3c6jOD
	 vN+06GciBvpVmdmIBnRSn2WI4X/MweWbzF86vUJy/6EQP76nSI5b8IiITOq5yycHYb
	 MgxDxD+mfZ0Bw==
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id E391A5FC7E;
	Wed, 29 Oct 2025 01:19:03 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: linux-arm-kernel@lists.infradead.org, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-sunxi@lists.linux.dev
In-Reply-To: <20251027133359.392984-1-sakari.ailus@linux.intel.com>
References: <20251027133359.392984-1-sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 1/1] bus: sunxi-rsb: Remove redundant
 pm_runtime_mark_last_busy() calls
Message-Id: <176167194385.1176535.2348442738028214787.b4-ty@kernel.org>
Date: Wed, 29 Oct 2025 01:19:03 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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

On Mon, 27 Oct 2025 15:33:59 +0200, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> 

Applied to sunxi/drivers-for-6.19 in sunxi/linux.git, thanks!

[1/1] bus: sunxi-rsb: Remove redundant pm_runtime_mark_last_busy() calls
      https://git.kernel.org/sunxi/linux/c/122df8416e7f

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


