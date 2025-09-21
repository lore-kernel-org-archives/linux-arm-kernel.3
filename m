Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C4FCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 16:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+wOJ9zBIdL0LDwVoPG6QMW/VZ5MaBHiB6tG1R3tmdg=; b=d01LKAHDeoObQo5ohSK0DQ1JVd
	Nzd6Q+/J/57A+P2knbE5mRsnmFoi5QML5edJARd4rhsPtozsmoLb44IpgvGLECcT/rGZ0iNv+aOPq
	t5CjfvT9kQWr+qz0aDesYx+UExDNvsTaLm0b1HtVUDbZ43FWrZ8gcdVXFcP03NetkPm7TllI1nbSu
	2n75YjGuFveQMPV5ss4OUYHFg9CLD4g2c8nSGBpP2iLyJ7Y+l1r/qu3F29iTjxxnlmg5uliPWNgth
	FAbeK8EZeYfhL2bq+LO0tm+utJPP7GVASiM8FAlHmLktmo61V7GQ64JjoLZe1o+Xac7kD4+5kJT/+
	uFcpRYqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NJU-00000007p74-0dUA;
	Sun, 21 Sep 2025 16:53:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NJQ-00000007p4D-0sVx;
	Sun, 21 Sep 2025 16:53:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D916543687;
	Sun, 21 Sep 2025 16:53:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A353C4CEF7;
	Sun, 21 Sep 2025 16:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758473599;
	bh=5+wOJ9zBIdL0LDwVoPG6QMW/VZ5MaBHiB6tG1R3tmdg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ekyQ5I5LiucYo4A1u5UC58kUOLEWhGBuFqguA8oXDzcgsX06/VlSJe3iaPkqw1amI
	 D52+T7wZaZkWbN6KakUTVvKt4FJmmY76EEP7Nr5g8iD441D0KcPV0XjwfdUD2w3Gj2
	 dHJAjdHv6TM5YRoQcR5U1BzFTGoAWhvvbBiRK71n9bm3Lr7jEJ9YiAt41E47ogx+Kc
	 szmxTxQlD5L4Exr6j5iIS6H+k5qiUWfBKYt/zOIOYd2zgr4fy7I5BL2f6P7rXkChOm
	 nMphi3qZm7GlW1tDlYfMyWiD9ZdaeGD1PZ/KSVsCjHVAxm9tbSYe1aT2Htejj0ZPJQ
	 lDBXoRqV9NGGQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250915151947.277983-4-laura.nao@collabora.com>
References: <20250915151947.277983-1-laura.nao@collabora.com> <20250915151947.277983-4-laura.nao@collabora.com>
Subject: Re: [PATCH v6 03/27] clk: mediatek: clk-mux: Add ops for mux gates with set/clr/upd and FENC
From: Stephen Boyd <sboyd@kernel.org>
Cc: guangjie.song@mediatek.com, wenst@chromium.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, kernel@collabora.com, Laura Nao <laura.nao@collabora.com>, =?utf-8?q?N=C3=ADcolas?= F . R . A . Prado <nfraprado@collabora.com>
To: Laura Nao <laura.nao@collabora.com>, angelogioacchino.delregno@collabora.com, conor+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, richardcochran@gmail.com, robh@kernel.org
Date: Sun, 21 Sep 2025 09:53:18 -0700
Message-ID: <175847359824.4354.6608148269345464225@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_095320_272974_73C9094F 
X-CRM114-Status: UNSURE (   6.55  )
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

Quoting Laura Nao (2025-09-15 08:19:23)
> MT8196 uses set/clr/upd registers for mux gate enable/disable control,
> along with a FENC bit to check the status. Add new set of mux gate
> clock operations with support for set/clr/upd and FENC status logic.
>=20
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---

Applied to clk-next

