Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDC4D6409C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 01:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+Mddxw0nycH3NL+gNk+Txaw/a5wM8smB6XZ54DJeqQ=; b=IQAexIjSpy9IgsW9uUy2sAlDXZ
	Gzh0sgZys9O9eY7OLsNxQBt1WCGSrZnvKic4WDVpngFlBht7GNrmHM3DToFW0pKTac/9+N7sdGxPU
	8YhojEsbgv6Cgbtqq0RM8v5U60MnntNJrex+A+JeMoZkPUILBUHAsHs2fmuKi/p47+NUvVgrQTkcB
	s6ybx4yvoY/Hs6dvCchV2NzPVygMJ0CAZgvvO7MwlP6WSAflG5tSMubtpBsmiArb9sTLrTvUEqewu
	PQ4FNuJxThKqD+lnF1lou5C97zfkCONkZ3m4gx59gveCBrlGFjhSGSBKu/0SuhAby1q7RpcnJKlp1
	DMq17NgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9aKX-0000000CRsN-3gia;
	Sat, 09 Nov 2024 01:32:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Yya-0000000CILD-2Hf3;
	Sat, 09 Nov 2024 00:05:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=c+Mddxw0nycH3NL+gNk+Txaw/a5wM8smB6XZ54DJeqQ=; b=TtMCBMFcQjQSW2xZE7aYwAcvvU
	OVSj90eVQOXERJywz2aNaXd+XUuuqm16LwbCszwvLxbszgWk75I483u5Hhsdo7vERKZyBGMx/HaNE
	xdxVVofVVbf9628hz7ECQgre2H+V1WkJPMwcP+tlnkvP174+9kVcHkyC2Ij7SMAzPDLNrcrtLiUoB
	JT7rw8IX1FrlVFHvqbau3itX2uNfMhptWKmjtPTwfId5mY+R15hqFCRKYWLhP6cjNKF1NxAnhijGr
	+Hp5yB2+zBQQvmePZe5M+36Qg8RfHIfiV8xDNAFwHWHNLKnbH3OcpZkd/l3fGZBPF1oqcLl4iMa7M
	vQTsWBdA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9YyW-0000000CP1H-1R2O;
	Sat, 09 Nov 2024 00:05:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1B4B85C59ED;
	Sat,  9 Nov 2024 00:04:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 780DAC4CECD;
	Sat,  9 Nov 2024 00:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731110706;
	bh=+4fxxGmLXgCRdQeWWK38mQCO3w85tyvAuFsjP1DNG7A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IWQEG8O+6qk2aUsaF4fKzZHzlRNZS7Z0mxte8F9Wcf6ugVTwQLoN72UEBiRC6gMGy
	 ZffpVQPnP+EL5hJkIp+mQURF5Xno0OqX5hfM/6hWsbSgH3G5LJYJa7XlpjRT8Qqqa2
	 rK4dFQ36MVTM0ZO0krYbo8LC859OYA35OuGBI1bT9y6KwrtvH23lEm9Y4bXSEFbqY3
	 kJe107rhcaoPX/me1mTCLuNpwtLZe6CGFg6xqCagifpuFEfFjSkAwhguVIGO83kjWd
	 afSr8aunRrm593AxsjJRYEwvuZOGnOuARcrqoyDqxDCsWnJL9qCaWLsTZLt2FI+0Gu
	 Ctt6SZv66LqLg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 Tang Bin <tangbin@cmss.chinamobile.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20241025090938.3480-1-tangbin@cmss.chinamobile.com>
References: <20241025090938.3480-1-tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8183: Remove unnecessary variable
 assignments
Message-Id: <173111070418.137066.13301486224854553399.b4-ty@kernel.org>
Date: Sat, 09 Nov 2024 00:05:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_000513_287686_F65C7E86 
X-CRM114-Status: UNSURE (   9.79  )
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

On Fri, 25 Oct 2024 17:09:38 +0800, Tang Bin wrote:
> In the function mt8183_dai_i2s_register, the variable
> 'ret' is redundant, thus remove it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8183: Remove unnecessary variable assignments
      commit: f3c889745cd3500bcbce6f6c8cb7e343f067ac18

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


