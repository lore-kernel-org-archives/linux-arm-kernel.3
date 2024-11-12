Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A323D597B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 22:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XE3qHbQ/6Rh3/Pc7HQvwkwEyGTvaxNXx85ePqo9ghJg=; b=RG4TGSEx0L+pBvSV6OdLQyhOZI
	wzagOvO8YALJlxKbEJwim7cSaF7Ni8qHlGMwUFcwORe77ThEj6gkiMuJn8mvnW6y7zZ/R+a75wdUh
	ccpgM5YxkaDUoBP5U6WzXeyjvg0u4ob7K3MCsCTodvVgGXLiFWL8BuPswYNAec4ssFxChWqmMk1jt
	kSMO+a+QGN3QnDX//vLEZ89GjARLx6+Ywe6Ctx4u5uH5U5wa3Z81Mhwnu+mRp1iRFuScRqjaJBeO9
	hBd2rq9fuxxZ8ON42vqA5SJ8oTDZwXBDm9xbD5V1HatmPn9T7DC+16lfpqbEBXYwD54NyUg6426xw
	ygf9FTiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAzmf-00000005COE-2XHG;
	Tue, 12 Nov 2024 22:54:53 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAzkq-00000005C6C-3dhv;
	Tue, 12 Nov 2024 22:53:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 73804A4180A;
	Tue, 12 Nov 2024 22:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DD5BC4CECD;
	Tue, 12 Nov 2024 22:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731451979;
	bh=sYaUEV3H1VTX7CowzyJ4T2l9DFFG2LL8+sAb7eAQO/w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qs2uub72yqFPNWjy5n3myGlvtouRTlXqnBl/a/WEGH1HUgjIqViDXTVkezWkDXZ4z
	 zLKkZxzq4rSER3qmT+NhX3wc+ECWK7esjBR2SmF0MIOgebXauGfrcktPhHS9xFMF4g
	 MzdYdg5WeUURgIf/blV8rJOtmHY8Sh/ggQ11ftCVHhuPrwJjFZ6BZOw0gSMOc+YQCi
	 tBMmZDlU/lp+Xl7upsI0GBy0lTuBZHB8/CGBx6bihhluTN0lPOFpyLJ0vy3eeHGCNQ
	 cdUHkDMoRBCGB4+dORhZ8nvfWyLyAfObI/oWOOnIkNPTex54x5mD9+YRRAl1w4qHeL
	 i07OSYdlUQtAQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE153809A80;
	Tue, 12 Nov 2024 22:53:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH -fixes] drivers: perf: Fix wrong put_cpu() placement
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173145198951.701548.549721495064478963.git-patchwork-notify@kernel.org>
Date: Tue, 12 Nov 2024 22:53:09 +0000
References: <20241112113422.617954-1-alexghiti@rivosinc.com>
In-Reply-To: <20241112113422.617954-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, atishp@atishpatra.org,
 anup@brainfault.org, will@kernel.org, mark.rutland@arm.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 atishp@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_145301_010932_97709ED3 
X-CRM114-Status: UNSURE (   9.31  )
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

Hello:

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue, 12 Nov 2024 12:34:22 +0100 you wrote:
> Unfortunately, the wrong patch version was merged which places the
> put_cpu() after enabling a static key, which is not safe as pointed by
> Will [1], so move put_cpu() before to avoid this.
> 
> Fixes: 2840dadf0dde ("drivers: perf: Fix smp_processor_id() use in preemptible code")
> Reported-by: Atish Patra <atishp@rivosinc.com>
> Link: https://lore.kernel.org/all/20240827125335.GD4772@willie-the-truck/ [1]
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - [-fixes] drivers: perf: Fix wrong put_cpu() placement
    https://git.kernel.org/riscv/c/57f7c7dc78cd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



