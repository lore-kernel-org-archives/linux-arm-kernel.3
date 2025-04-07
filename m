Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E525C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 23:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9oTobucNxZBnnaHJr2q/bBWyBUwheP9SkD87IsXEz1s=; b=Ki+TSKeXPt+/D5VrKznx9YBoQW
	qo1KSdUcRm4LJD0ijUujDGqNROvU3r/Ggc0o9NIecdZVYgUasuiQHx+rrDqT49iVvF+ojqOydGb0u
	fd+SHucT5rDO2PPOQ3qaTTIU8j304hTqtetAsX1ne8Uw1G4I+DeYgvJ7ao/dGztgusL+TozBtJOKE
	VLfzf0esTG4PEd0smz4idGHYUrlyKG/e1AVW+dWKHf0J3HxqPwcImd/2R7wxvAWkRaUuEgUCCyr4x
	Vr9WoHXV0opc028QMRC47syreNGcskIWIQ0NXqLp1fFqnY4MidS55XAINAfhGe59DcQFBmlGb9AND
	gq1QvfoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1w3g-00000002JmR-1LX5;
	Mon, 07 Apr 2025 23:39:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1w0M-00000002JFP-3yDx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 23:35:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B08AD43584;
	Mon,  7 Apr 2025 23:35:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EDA7C4CEE8;
	Mon,  7 Apr 2025 23:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744068950;
	bh=kIGTdKOcIKeSee4uGP8IJJetxDtK8tWm0G2YfHRLlyI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UBfCMlIIUDxDJQkGrdwj9v5UZI80REtdGLVp5mcMVxWK99nz2pjK0NoVl2nwA3aeF
	 b21xwjy/KNWiJELcQZ9VSzH3sNO2NJOV+Rz6WucvZWG/6z5K0yDgW+3uYRm9sA+CQf
	 F0oGf3+PZ4iZ0FyT60RskOXBWNRiSJ+hECgxCOgtRFnPoeDtLH5/Pfpeimrap+pCH5
	 HJxvO5qKb1Kgnm6uA+k+4TE1F38G5/MtiQtSepfoEcUKOOkE3VhN8kk6XoRvrlK+Vz
	 PyITa5YoqynyF1e4ZjzH0KnX2jkBxsk+v0LQhSqE9r5h7BQOOAS2oGr8TnTZijKt/X
	 EDEA2OZ9ewu4g==
From: Mark Brown <broonie@kernel.org>
To: olivier.moysan@foss.st.com, shao.mingyin@zte.com.cn
Cc: arnaud.pouliquen@foss.st.com, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 yang.yang29@zte.com.cn, xu.xin16@zte.com.cn, ye.xingchen@zte.com.cn, 
 zhang.enpei@zte.com.cn
In-Reply-To: <20250403154142936Po-soX8Bifyvw_eWSbddT@zte.com.cn>
References: <20250403154142936Po-soX8Bifyvw_eWSbddT@zte.com.cn>
Subject: Re: [PATCH] sound: soc: stm: stm32_sai: Use dev_err_probe()
Message-Id: <174406894704.1337819.6120750262182718363.b4-ty@kernel.org>
Date: Tue, 08 Apr 2025 00:35:47 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_163551_007148_FE808108 
X-CRM114-Status: UNSURE (   9.96  )
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

On Thu, 03 Apr 2025 15:41:42 +0800, shao.mingyin@zte.com.cn wrote:
> Replace the open-code with dev_err_probe() to simplify the code.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] sound: soc: stm: stm32_sai: Use dev_err_probe()
      commit: d01131e3ce14f9837884aef1f3e463a3a492291f

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


