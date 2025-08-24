Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682AECA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 03:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bygLAnRkgu/g1UeZjW8EqFSIAuIJuX3ZKve3EtD7HJ0=; b=KXQ/89oX0m2WBM0w4hseFCQtCj
	CQrbMrhCJW/KtcMVlZS/ydYm/gGaa4XlPfxSooUrHJDKjnbzRPgkl7/IktJN2iepjCL6e46pdJ4xE
	yvJu5xsAr+qEjIirP9axDUph0HCEtk4ANLVlrQdtMLLrueGG6tGMPN/lEV0bpptL9c7P7lSdcQI6n
	NhXUW3DrQbMnkMDScTeu5b5OynIIlu+SX7UbaIvPNxQupDNm6NWH4vAcU/KHTDwLuFzCPGjWXkCu0
	/mVvc3znAS7rBxXhioLvhnID1guvgpwb9kUPIAIBQeWgeOlde7ARQnqvvGMTmmKTXcidd/giTyj9s
	lAOQFWGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq0zB-00000005eAw-22q8;
	Sun, 24 Aug 2025 03:01:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq0u6-00000005dMC-2IKh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Aug 2025 02:56:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4661944EF1;
	Sun, 24 Aug 2025 02:56:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF6D0C116C6;
	Sun, 24 Aug 2025 02:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756004182;
	bh=7uCO5QGKPLdTmQRErw2/3WU/j0xuo3RdC6BhuqtSQas=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ILSLiQ9RZ2wki2fsvcet2zD73wakvdfxmfiqQqb4gagYaq8Lf08VVt2P9BxN8rPZA
	 BZ2OHFjkveMm+mUWZ512K4vfeKBaoAgKn4n08/1tAoCdW+A4oIUe8Jr9Uf4jePV6lk
	 nWzt9XbBj95XFD41WFZyRKV1WTXhFNyFhuwFBn9jwMkBusdBjfMDoxKEB/fGwY0V73
	 Nr2cob4J40vegAvAs2oqQJlQJEbychvwnVt0qklc43pyXHAH4ojFqsqGQ2hrEsVXmb
	 A/iNGLgO9/afoBhCP0VF9hGpSJ4BoFK31sPyCdjPvessks8MIhAnj0ip3mp7sf7lMn
	 y3LWWIQjjA3kg==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Takashi Iwai <tiwai@suse.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	Trevor Woerner <twoerner@gmail.com>
Subject: Re: [PATCH] ARM: defconfig: cleanup orphaned CONFIGs
Date: Sat, 23 Aug 2025 21:55:55 -0500
Message-ID: <175600415292.952266.3226011014636924307.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250819231652.15938-1-twoerner@gmail.com>
References: <20250819231652.15938-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_195622_604257_B89F1847 
X-CRM114-Status: UNSURE (   7.36  )
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


On Tue, 19 Aug 2025 19:16:30 -0400, Trevor Woerner wrote:
> Drop CONFIG_ARCH_MSM8X60 and CONFIG_ARCH_MSM8960 which were removed in
> commit 99497df59427 ("ARM: qcom: merge remaining subplatforms into sensible
> Kconfig entry").
> 
> Drop CONFIG_ARCH_MSM8916 and CONFIG_ARCH_MSM8974 which were removed in
> commit 85148df36835 ("ARM: qcom: drop most of 32-bit ARCH_QCOM subtypes").
> 
> [...]

Applied, thanks!

[1/1] ARM: defconfig: cleanup orphaned CONFIGs
      commit: bcafdbaff25930db6c8866056e0f4071dc71ca97

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

