Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342A3C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 14:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oP5DTTXb4wSGhK3u3trdFyzJiqQmhDfI04CcSMCneHw=; b=PIy44lY2/TuR9SkKc2CvmYJAyv
	PN7LXR6ZX6dc2NYsR5+v7LGIq8ZKTU0CBJNEMJWy5L8qlAUuTwaSfnlUmlzjeP8RSdopN9vTDrhho
	ZDKo1MF/l4AymP9dPCM5aDkM1i7ftY0nTv3aYEVFkNJ8RUxpowu7rMrCwrjB4JrBF+gfhe5yEgCSi
	9IOnfppHEmoLK331GIyOhjSkQBU3OLE3tVXgwAStSEsoQyfhDDDlWDK11zXo7wVRWx+fJU92SDKq9
	H89UD32Cj6YFZsr9mGkHH6QuZXgaoGesHkFjTLa1cH6j4/KQLbXBvvFXcradoSBu2T2rjkHJJVrbH
	iIrOyq2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QfW-0000000DP0i-2XG3;
	Thu, 17 Apr 2025 14:56:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QDP-0000000DJHd-11kT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 14:27:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A899F5C5578;
	Thu, 17 Apr 2025 14:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E478C4CEE4;
	Thu, 17 Apr 2025 14:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744900062;
	bh=VAD+DaKQjwY98GIPk9h72X9BL6VsYoPUJg6LiapYrC8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qRzfAcPclS4rD+PWwWhSgGpYwmRwnikG6bvVDqkN/kcr8nhesLVqHNmAQLxNx6aHa
	 1y8FXRbBzH9ZdIrEounQjLu0Nm5UUZaTrK58TaHorjifhPXyEUE46u4xMKNMIW7Yju
	 U8skOC3iip2OYZJdKo6Glw2UtNYLdHfOW7Dcgkpht3ugxU/W8vQnoATyZKd0TjC3BP
	 ut1TtWSfypRrN4MgME35RxqwlemZeSmncUNPlDgyzmhVGHTeJsPHjKcKgBb06MdVTc
	 wBBsMkA4H76BcuNaWyHQDlBCLWLOW6cbc3J1D5igIustT/xw75T9ac9qHxqga7SbQ0
	 3UDqjkQyHjyVQ==
From: Will Deacon <will@kernel.org>
To: robin.murphy@arm.com,
	Hongbo Yao <andy.xu@hj-micro.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	allen.wang@hj-micro.com,
	peter.du@hj-micro.com
Subject: Re: [PATCH] perf: arm-ni: Fix missing platform_set_drvdata()
Date: Thu, 17 Apr 2025 15:27:23 +0100
Message-Id: <174489645540.2697340.5524716778824476252.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250401054248.3985814-1-andy.xu@hj-micro.com>
References: <20250401054248.3985814-1-andy.xu@hj-micro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_072743_323757_C26C5CE9 
X-CRM114-Status: UNSURE (   5.39  )
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

On Tue, 01 Apr 2025 13:42:48 +0800, Hongbo Yao wrote:
> Add missing platform_set_drvdata in arm_ni_probe(), otherwise
> calling platform_get_drvdata() in remove returns NULL.
> 
> 

Applied to will (for-next/perf), thanks!

[1/1] perf: arm-ni: Fix missing platform_set_drvdata()
      https://git.kernel.org/will/c/fc5106088d6d

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

