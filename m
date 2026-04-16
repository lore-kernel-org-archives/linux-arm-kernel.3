Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DADF8D75B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 15:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CyPmSGyK816MUuWcKPWra66rWlqz/gSBtKUFepuyfsQ=; b=2WvuXmfzELOSUQbC49b4F/QYf6
	pzmSvmBb4bcDs8uvF/lX+7fkLX8paDS77r4XZBrb79DjON+VuxAf1+Ia4lStq8J0iFnJ/SxydyROr
	r0QdV0yg1yiYAHKalUmev4gVoYu1EdMckiDX/ugdnQD8VO6ThXZDnWREVq7DnEqDsESo2YR7uLZ5m
	x0tJY1auck+8ruySvC7hauxZu0GsFmOre/LbSDRBWzm/gu+nQSI/0ODoIOTi+snSffzpIw5vKdqe3
	Ntwg8o5P6Hr8DiswtBrc2yZGyZZD59WlVhRPVhyMbROmMAj/4/ZxnD9RjsVwWYqoikmbRSMbLiiBL
	c19GP5IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDOv0-00000002dTn-2QRW;
	Thu, 16 Apr 2026 15:46:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDOuy-00000002dTR-1L5i;
	Thu, 16 Apr 2026 15:46:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DDD8443860;
	Thu, 16 Apr 2026 15:46:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16150C2BCAF;
	Thu, 16 Apr 2026 15:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776354370;
	bh=fZETXYu0oWCsWiHimS0OA/TAWz0pKdtdcNhYZKxuwdQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ho9Truf9ExiGsv2biQrqDWEdZ3vfKdwLsLgn6qcAq0yRfny/3O+OCgJfKh+RAetrx
	 Dhb9qdBUb/9bjbHdP9LmUY+NkuHR8Dm1JG+qCBLWRRctmPEIKxvM0WgY3oo1wYJ8QY
	 zVAhIfQchi930aM5q8WF34gDm7Ke3ecjmH3siJ7V12K7DuOpR1i3QxxU08/HDZ8HHo
	 050hHfMyQDux65WsVE0ZQoi8qR7lkVzu/92zM8NW66ktpXC+M5/xTo9wYy/FPXircA
	 InugFvlU3Lk0STI/an1ejUHhVMwbooR2juvR/b2Et+loAjvSLLYDM3GIO/2W0uJIqf
	 kyePIWT4ZHh4A==
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>, Felix Gu <ustc.gu@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20260416-mtk-snfi-v2-1-3f487689dacb@gmail.com>
References: <20260416-mtk-snfi-v2-1-3f487689dacb@gmail.com>
Subject: Re: [PATCH v2] spi: mtk-snfi: fix memory leak in probe
Message-Id: <177635127007.43536.11128592640404935803.b4-ty@b4>
Date: Thu, 16 Apr 2026 15:54:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088; i=broonie@kernel.org;
 h=from:subject:message-id; bh=fZETXYu0oWCsWiHimS0OA/TAWz0pKdtdcNhYZKxuwdQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp4QRALDdqFpSWntj953+kCEe/VleFyxyWZA5MS
 nBVKNSokdKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaeEEQAAKCRAk1otyXVSH
 0FifB/9XMPkENhGcZcoP0IMp2qLmCOAxnJR28C+LRnrKISS01bhd/THZdf+sg08r/TC/SRM1dIl
 bnmrWNcHji0BDMZGNzGxqkjx7y7pFjenjr0duKNMpw2kIpyDIfcd81EPJ+p1jwMdLImels0Kc9q
 8OVODeNGdCRC33VgQfBId4erOzbwpGr1XisGMuvj9Qp9RSWkHfhBiGvcl2gUGn6lpl9ZxGairbL
 pnvy0yz4vscFJx3EW1PgNWOrF1ZQSSFtOtkXc2BcYrfsF9ionXHSofv3z8fs4aXz/B0KSNZhak8
 t3J6scRq8IcjCA5Pq6MlCo8X+x3EsbJoW7hX6HyPU9MKAWHY
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_084612_390923_B1ABAE9B 
X-CRM114-Status: UNSURE (   9.49  )
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

On Thu, 16 Apr 2026 21:00:08 +0800, Felix Gu wrote:
> spi: mtk-snfi: fix memory leak in probe

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.1

Thanks!

[1/1] spi: mtk-snfi: fix memory leak in probe
      https://git.kernel.org/broonie/spi/c/51942b77f443

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


