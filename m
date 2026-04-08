Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8B610F995C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 18:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ErozVtMU0AJNOpcfX0vASa+H3gT0pQLgqnD0GGaeMwI=; b=hnOg7Mekh8saiyuzjLVtpp0YNX
	uc3xA1CJ8428ZlJV/+HhRahqhcoxyuSHkziaZIaxJ/R3mlCEIOzQerfV23fqi9m+cVgx6PfIAqwaa
	GL3x/HUUOl+PFBOGpha9VO36EUW/nAtndmH+0C4xOoLfFDgn9voh7J94GFsORCMZgR4GYB5zgy0gs
	pGw3yfoWeqqI6dCcVOjh6VVwg1cRKnl1m+N5iJwE0Rj7dwQIKHteQGQSkjT9TA9ChKj/0LDUSrhv3
	TnHSYSQV1QGybbU6XqkCBYU95nEPgoXUsrmOSuz34vbNZKPn6r8+3DuIC0UUUi1l1W2ebI5HZlyBR
	STHYDAag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAXI0-00000009El8-0bI6;
	Wed, 08 Apr 2026 18:06:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAXHw-00000009EkY-3EsK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 18:06:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4419040681;
	Wed,  8 Apr 2026 18:06:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE670C19421;
	Wed,  8 Apr 2026 18:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775671562;
	bh=D+1aJhA1fbMDBRhRQFskpkRYvACysKc5lAtrmzctoXo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mMksU3l9e2mfJEoUoqkPe9ANad0g/XLDqiCks0aajWsg4gxtiPVNnjHaAHhlwPYBJ
	 Vnj4jJA9B0KwoSNUG4DzEoOFbFRf65NVm5Zodq0mJwdJg1ik++sCDhndcN8XZH8DCD
	 +cePY84HgcHQA+LqQw41E457Z7BvCWSBhNNZMDIdt8dAR9MYNNT0RMf3FQhK3e8KaZ
	 WUxswVlzqg3YGRTEEAckEBYLU7kBnrTeoks6s4vcEGURhhkG5YNx7ym/bOU8bYIaQH
	 eCtN5xJ0u2tx4u0al+tUm0j+1br7vZuQxnT+WjhK/PHuM7dBki0YiGy/wrpn+YZpWP
	 pQNEDatt1IAEQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Tomasz Merta <tommerta@gmail.com>
Cc: olivier.moysan@foss.st.com, arnaud.pouliquen@foss.st.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Tomasz Merta <tomasz.merta@arrow.com>
In-Reply-To: <20260408084056.20588-1-tommerta@gmail.com>
References: <20260408084056.20588-1-tommerta@gmail.com>
Subject: Re: [PATCH] Subject: ASoC stm32_sai: fix incorrect BCLK polarity
 for DSP_A/B, LEFT_J
Message-Id: <177565110420.101848.2541520016618788420.b4-ty@b4>
Date: Wed, 08 Apr 2026 13:25:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1162; i=broonie@kernel.org;
 h=from:subject:message-id; bh=D+1aJhA1fbMDBRhRQFskpkRYvACysKc5lAtrmzctoXo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp1pkGAgVDFHAEDSi6lBJRIOX68cVzVmjV+y1BI
 7gKoAgxfjCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCadaZBgAKCRAk1otyXVSH
 0FjNB/45tntugNDNxCdID/5Lz5G2h8qJZdC0ODK5KmNYDnpHdFrxciiDud5HgoOP7IvECFJfbUW
 +31PfjaS17mDZWFaimJkEDxXV6Fa0Bw6XwY8VTJXKidpKjr68sUjNGEBJ29Unzrt22ZkRA4zzDk
 QnJIQWJpWmRCVbse7RMkQg3hLac/7H3DS/VUDp7ALXkTPVewWoqmGEpGG+ZHLR6/nUZASIQNBxA
 AdlrVbKikbiKjQSYeCVBT+UCf1g/LJTHiHtHqATapHlu2xZ3Uqr75MVyb5lm706hDTvrnqnEyC5
 Tfye2VruGcHRlnvHeAHjaBtrWoDNhmAed3ImAMpChI2Tp+8k
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_110604_853494_8985CC27 
X-CRM114-Status: UNSURE (   9.29  )
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

On Wed, 08 Apr 2026 10:40:56 +0200, Tomasz Merta wrote:
> Subject: ASoC stm32_sai: fix incorrect BCLK polarity for DSP_A/B, LEFT_J

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.0

Thanks!

[1/1] Subject: ASoC stm32_sai: fix incorrect BCLK polarity for DSP_A/B, LEFT_J
      https://git.kernel.org/broonie/sound/c/0669631dbccd

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


