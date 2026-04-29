Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DF0FF8864
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 03:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JCo4W17yGNJHr5uT0G56EQ6Zm1r/LAPTIa0A3S5ajik=; b=c0Cnhi1cz+HKBO0Lh+QNQYj/DR
	hOOYNR0Vwu+7dlDvnLnTfLFxodTcXvq1v1KiA8+Smk3LgIUjSXYjv4QNqGC8sS1hAh2DNWr15NCKA
	iKww9Lm3TzkyW7Fjseso06UdNkTS4BR6Us2iGE6LAo0IK4e3I8ebB1+v/IGHJlezsr055XWuHd4BC
	jAegRiC8w/3OES5/oaNDsqFfWXvbMydgZyNdweZgozy52NkwAMxzrHAgzqSrDH2lKlipE5NhPCevP
	FCIs9qgCxR54Sr05Mxil4BywOYOzk5qg6xWWNE4yYQ4B8LK8zTHSrTis21xf+KW1IDQ2QWDqROvvg
	cM/UY/TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHvsm-00000002rh1-17vl;
	Wed, 29 Apr 2026 03:46:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHvsj-00000002rgN-2V6U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 03:46:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7306D41530;
	Wed, 29 Apr 2026 03:46:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C2A8C19425;
	Wed, 29 Apr 2026 03:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777434396;
	bh=JCo4W17yGNJHr5uT0G56EQ6Zm1r/LAPTIa0A3S5ajik=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=rhDyBkuglDUdr17bfckZvaDzNWH8iutFm1MvIv0t2GXkauS07g1klRGLTJOMAoys1
	 oQdmGUCcpE4SO7+aqFUZED9IhEbmegs7RKGRUapcuJp1+yxvL0swbFNLm4+VVjaffY
	 OraKQT5km0aGs0P6r5RWVvc+VE2xMXfm8Xuz5XpRApASBBg4DhS5eLEwOogm24qmNk
	 Ni+MHf4+A2Kb0x/hKFUOfiRo26AeG5wRfCEiFSPdsDSK/1dEi8Aylsb1eypOWYwSBc
	 x77ASs2wP0bEEVOEljHPwCtOz1M00UvzHmXKDwH2poYnOcyrfvTKzGNF/O+vqAFpsD
	 WXSDUhYZHJkQw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260306032540.47815-1-rosenp@gmail.com>
References: <20260306032540.47815-1-rosenp@gmail.com>
Subject: Re: [PATCH] clk-lpc18xx-ccu: kzalloc + kcalloc to kzalloc_flex
From: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Vladimir Zapolskiy <vz@mleia.com>, Kees Cook <kees@kernel.org>, Gustavo A. R. Silva <gustavoars@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
To: Rosen Penev <rosenp@gmail.com>, linux-clk@vger.kernel.org
Date: Tue, 28 Apr 2026 20:46:34 -0700
Message-ID: <177743439425.5403.3623468674307849088@lazor>
User-Agent: alot/0.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_204637_654964_2DB1952D 
X-CRM114-Status: UNSURE (   6.14  )
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

Quoting Rosen Penev (2026-03-05 19:25:40)
> Simplifies allocation by using a flexible array member.
>=20
> Also allows using __counted_by for extra runtime analysis.
>=20
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to clk-next

