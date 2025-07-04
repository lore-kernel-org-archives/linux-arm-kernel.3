Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A76C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 17:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ScP1eKYZve2CS4BG0j4P6swtVCknjgpbXkSN+Qvan+0=; b=knchz/wnBQxkZVUlWNN9EnlvuG
	Ahyo8DefYmo7Z+I3GITbBTHBKo392SWSoS2WiL5gMR6Uji75L0b9yclmhSCOV2ohnZFeQyXeivXBw
	35Lu+8kPOu1+LhLReXbauTGFGSXmDwDhyNg6KJyhPWGXi0EOU+zgw8BNlm9YYpCnRKVlnFktw+eDN
	sUWd38Zt57rB48UacrB3d0ZwX96iiCypLh7fnvJDs8IL+5sBPRw00czfjAdcJpF+cZ+Jd+lIb5LKX
	iT7N6jZzK2RiqXRviQ8tmHXJB4ypXALvR4RVVW4JB/bKVTKaa7iJxsOwBbfBhof3WFlbcpVGl8H6g
	q9an0odg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXke7-0000000F9oe-1ZIL;
	Fri, 04 Jul 2025 17:56:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXkSc-0000000F8AF-1NgI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 17:44:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6B04961139;
	Fri,  4 Jul 2025 17:44:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E320EC4CEEE;
	Fri,  4 Jul 2025 17:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751651069;
	bh=4R+gLFsYL145ym9QlO7Qjg2ysOm0WxwoItLOPYmZBzQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U1ioyuv5OmuhabyJXKnquPYq4l93Owr1Kv7a5gSocD3mSP7JfF42sCu/aJuPGTmjy
	 mTgO1kG6XsDkWLBLhilORY9Fn2+fWE3mNL0nyU+j3C4Sxz7SGX1fkx2ItQda9FUBPV
	 lQ6m1u2Oy2dH7/OHfvRV45UWBido/EFHDnosO+iP0ZNDkbbk2TljlEYUoRTqZQP2w0
	 GPWby8D/ObpQcQITDRunWZAOp7LIk3+OPNh6ypGgKpbTO5o4P/vEAq8QE3YD7Iwb7X
	 IoyTphO04szaYhtGrmcuTfJ6oleabStxSoCTiZljifk/NNNgbU0a1Ebl2nx652+/gN
	 AeqaiTJBGuTPg==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Gavin Shan <gshan@redhat.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	James Morse <james.morse@arm.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: move smp_send_stop() cpu mask off stack
Date: Fri,  4 Jul 2025 18:44:09 +0100
Message-Id: <175164313641.1187522.9351949563130846501.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250620111045.3364827-1-arnd@kernel.org>
References: <20250620111045.3364827-1-arnd@kernel.org>
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

On Fri, 20 Jun 2025 13:10:41 +0200, Arnd Bergmann wrote:
> For really large values of CONFIG_NR_CPUS, a CPU mask value should
> not be put on the stack:
> 
> arch/arm64/kernel/smp.c:1188:1: error: the frame size of 8544 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]
> 
> This could be achieved using alloc_cpumask_var(), which makes it
> depend on CONFIG_CPUMASK_OFFSTACK, but as this function is already
> serialized and can only run on one CPU, making the variable 'static'
> is easier.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: move smp_send_stop() cpu mask off stack
      https://git.kernel.org/arm64/c/6c66bb655ca3

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

