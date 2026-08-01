Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F86C55171
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 00:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aQl6TGVfL3NmtSfkueFsekee+G6Sceu8i+KIbKRPfTs=; b=mZX1RBGekZtZFd6qnhOd76X3Ru
	fLV5csjkY+ZSlIZ5MnIGD+xo7sYEjmcYH8REI+8r5mjAh2vAUVH+Zqt1hSiPRCHj4c9ulyR3hWcF6
	LanTp/eLfgRXXEsCrd1eHdQp2FIW5lXQek6FbJwL4nYgJDCzZ9u1gf2rTD7Ts5Vlpbl40JFgGfJaz
	COpbF1BcFOkcQm87RBTTJmZwggX/94SDb6br3H4Bo5FO7BGZp6XyIvW9ARxT964Y968984a8bBeXa
	oqzzaEEDQAL/rry0HG3CgqRna9eB84kJk6jQHoReg3tadJjyTRJnVknnXF753jFpQnrm35hMXRdU8
	1/rj4OCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpy0U-0000000Dmm7-2U30;
	Sat, 01 Aug 2026 00:55:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpy0T-0000000Dmly-1ckN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 00:55:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 27D00600DA;
	Sat,  1 Aug 2026 00:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B5D91F00AC4;
	Sat,  1 Aug 2026 00:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785545715;
	bh=aQl6TGVfL3NmtSfkueFsekee+G6Sceu8i+KIbKRPfTs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=NfRwkO2ZJwjlk+XbyQE2kPYa49m7PSS+Jq4DR9RQ6Qy3HnRQBP/UH7a8yfKK3mctn
	 /G5AScBQB93Wm9gdFFFmZDiuXT2aap8pzxgeTmzIhnKdaPlYw0LL/njOprOh3GmpgX
	 LkOKjh3WzjO/f8fLcFtVnNeNNb4Bbh/OE+Vdm7rBE5L/3EiTyaL2IsGUl8eXtLk/gC
	 JAeafbcx76ivYOTRjQnpCPn34qmGhUQ0CNPUg7Ur5x8a9ThvCv8FjYqdxT6D/aAfGE
	 AYhkMyPktd7gV3C7SqAMlkpzOq7DYl9PcWpYSjUBhiqGEzHJwaxnhWDg9v9h08/PGc
	 EbSQMa+gkxnpA==
Date: Fri, 31 Jul 2026 17:55:15 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: muhammad.nazim.amirul.nazle.asmade@altera.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 3/3] net: stmmac: fpe: Move fprq configuration
 to stmmac_fpe_configure_pmac()
Message-ID: <20260731175515.10e5eb2d@kernel.org>
In-Reply-To: <07c55657-cc7e-433c-89e9-a21688ee8ba6@bootlin.com>
References: <20260729015247.25774-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
	<20260729015247.25774-4-muhammad.nazim.amirul.nazle.asmade@altera.com>
	<07c55657-cc7e-433c-89e9-a21688ee8ba6@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 29 Jul 2026 08:31:39 +0200 Maxime Chevallier wrote:
> Not a bit fan of the writel(u32_replace(readl(...))) but I don't feel str=
ong
> enough about that to warrant a resend=20

Most definitely +1.

Please fix, respin will be needed because this patch triggers:

include/linux/bitfield.h:221:17: error: call to =E2=80=98__bad_mask=E2=80=
=99 declared with attribute error: bad bitfield mask
  221 |                 __bad_mask();
      |                 ^~~~~~~~~~~~

on x86 builds.

