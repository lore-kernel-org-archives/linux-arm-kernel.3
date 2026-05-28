Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D232CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 14:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zYIYIOb0xNPiHQPY3klF2TjCpn0LMUpmB3GaKKWcY7E=; b=T9Y8Bj8jn8P0BYu3+VShJFZrTw
	tUJbZ8bZ1l4KSpfgmx6NtTCxgItWy0PyR1ZDDVgJ4XJQxCykC8V7UXUfTVjqtFuVr4W+0S7RJhAKf
	zRMy0SkY4EaAzHKB6cTYB8XIeK1RWFqi4m4BQuMPOigG5lUl37qn6kT0tIgqbNy88cQsMF0J66K5T
	z/8iLiSjRA+Tsn9lNYo2DL4ae+Ljnj7Gj8dTPGI/6pZWXcI+UDIXT9N3tYMbGsN/UOKV4KWwddH2X
	2yMrIfGnOlsVbbJWT7Cd/iPRD0CnCSk2+SFN7m5g3Z2RZK0dMfr7MdS8JLwI664mawW/GGaxuJzWP
	peosclCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyPg-00000007XfD-085r;
	Fri, 29 May 2026 14:42:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyPe-00000007Xek-2iPT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 14:42:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A1908605D2;
	Fri, 29 May 2026 14:42:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F25871F00893;
	Fri, 29 May 2026 14:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780065733;
	bh=zYIYIOb0xNPiHQPY3klF2TjCpn0LMUpmB3GaKKWcY7E=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=Mn5SpiNc/GRxlhmvQM5FPIBW3DshGhg0TwzTd8cBJ4GUIhi1FnKwPyVxszBfQ+64A
	 dusUUWs+O6y01GZ3EhrRQzkI3iaDNSE2oEqeSUHdMfRUzezjvA8dIcNXYKKT+l936Z
	 jwAwuVgqdSeBE8qleuzZmVoA8QDhpmgKKWdlJFMYSqLJu3WqQukDR/e1AJl7f1YYhl
	 fLzqchjaGRIsGDLwCJDElKY8ADq9uG8R41Jur9fR5El8Li8pZL3Kff731YQZoYvcwR
	 vVZOiKdGADNZanc8JR23iitPYWpX99AaY1mXrg6WnkDPbfl/Mx3EcZ+WBFa1KD1D3Y
	 sFpxX7BlGwt5w==
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Jaroslav Kysela <perex@perex.cz>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <878q942wce.wl-kuninori.morimoto.gx@renesas.com>
References: <878q942wce.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2] ASoC: soc-card: add
 snd_soc_card_set_topology_name()
Message-Id: <177996722359.8579.3270107698198416645.b4-ty@b4>
Date: Thu, 28 May 2026 12:20:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127; i=broonie@kernel.org;
 h=from:subject:message-id; bh=KW64H8qcj+BI/trQntXPk7bJYYrLZACRng6FgUd666Y=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhizJpQc1u/056zzb2uxdPy9m7jG+PUX5HYeHdFJxTgdzm
 n5l0NZORmMWBkYuBlkxRZa1zzJWpYdLbJ3/aP4rmEGsTCBTGLg4BWAiTLXsf3idWrx31bGkBLdL
 il2clsVrN3nFd2dW1WUbAv/fEDDgPZWrYbSyoLNj33+GPyq5AdmvxPfVRjGG6ea5hQm36DkeNjC
 ISrHN+f+Z5/t0XcMz0cZq6dZCz9hDFi+95rvVVXuna0zYLf1pT1jcPkZKvDPI0lgk3x3Fm7ht2n
 +OwmWVtjz6p37NiPDaIsP2+dbz5w3bn67a9fLnnjY5swOPLbcd5mrfrf5iboPqQynBz9nb7lRxz
 Y9kXxsbG6TDFcmiw260QKbsA2NYBEOXr+aRxCtrziz3dQ4q+5hiKGdi11R++q9g37WeK9e/LOvP
 sfk6zWViNJPran2u6bnyuXXz5Z2VP8t4nvOOUI0/kAUA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

On Thu, 28 May 2026 00:48:01 +0000, Kuninori Morimoto wrote:
> ASoC: soc-card: add snd_soc_card_set_topology_name()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: soc-card: add snd_soc_card_set_topology_name()
      https://git.kernel.org/broonie/sound/c/ec4489c43efe

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


