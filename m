Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D72D43372
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 15:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=loj03VXQQxLxwh6a0siXAf9ODdSbPFsDWNgihY4G8Tc=; b=T5QBWREa3sbL9g71qACRhXyJjm
	u+Csk647WudngSdpMBeiRDqllckot0GOZr7taqgJMAv4q9LU6w8sFMXIYwIDa45t9f+Go2EVmY3bv
	Kjbp0fOYM86VxlISWDm1nkcfOtzCmR5UIiR1U6pIytnMdPpx49l/AjmS+g2RTHpchwjXJi8PYYDo7
	KLJrsS4UdAghf9vKOEfIuiH33K3CvlSleJ/w0RnGKND6LcRiyGnAs5brAuf4xt2WO1ShLWSnMX4Yv
	GZvt9drX012eIa34VaYLgom9QCEaEU0zUyphej6q+OmPDzaSMBNRvKR70QkVMS0eSgNfR93O2J5B5
	b9ICT2DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t94gG-00000007TYd-1yv2;
	Thu, 07 Nov 2024 15:44:20 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t94Xu-00000007SdF-3Fq8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 15:37:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E6B2AA447FC;
	Thu,  7 Nov 2024 15:33:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A73EDC4CECC;
	Thu,  7 Nov 2024 15:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730993741;
	bh=GyWaCebIJB2MBOnYngkj3Xcn9uP7TVQyYFsiEtrBw/s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=O0FdVTFC5osat40Kl8QsKEksm5KYhlIo5NrZMfDOCPV+33J80/w0sk1jN8WQLjdm2
	 2JEHzlQrUeXXnPuBQDTkIGdu+U8oPmjVOb6CtFO22CGrF1ZC7iF6DOcbf1kU/EG3kz
	 ezSLxJFz3mcmYwP4tN8TcR4Xdy6Ve+8aAWY6ydQv31RiO2sD+J7piuXZMWbm+sJ3Ao
	 fKXx09KCWPvrKc9YUbuAT5EEqi8cmZmXK21YH9J5bFyaj/ITJ00HNsSKXOaY9EQqM9
	 YA1chybHueuY1SurPPDGmfPFR1jdyo953Hf+8tDAFvR4S/ZV7pAIs+RjXF2xw2IcOX
	 Wr7u5As/3eo5Q==
From: Mark Brown <broonie@kernel.org>
To: olivier.moysan@foss.st.com, arnaud.pouliquen@foss.st.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Luo Yifan <luoyifan@cmss.chinamobile.com>
Cc: linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241106014654.206860-1-luoyifan@cmss.chinamobile.com>
References: <20241106014654.206860-1-luoyifan@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: stm: Prevent potential division by zero in
 stm32_sai_mclk_round_rate()
Message-Id: <173099373941.145735.10149404268306602537.b4-ty@kernel.org>
Date: Thu, 07 Nov 2024 15:35:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_073542_911391_5A345A1F 
X-CRM114-Status: GOOD (  11.21  )
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

On Wed, 06 Nov 2024 09:46:54 +0800, Luo Yifan wrote:
> This patch checks if div is less than or equal to zero (div <= 0). If
> div is zero or negative, the function returns -EINVAL, ensuring the
> division operation (*prate / div) is safe to perform.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: stm: Prevent potential division by zero in stm32_sai_mclk_round_rate()
      commit: 63c1c87993e0e5bb11bced3d8224446a2bc62338
[1/1] ASoC: stm: Prevent potential division by zero in stm32_sai_get_clk_div()
      commit: 23569c8b314925bdb70dd1a7b63cfe6100868315

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


