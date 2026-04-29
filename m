Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2616FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 03:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IiZDEYd3G61roEvM82iRLsIal6Ch/P/n1ZmhGvjYTDw=; b=H4f0R5JHqpaXg3WOtBxnt3HvNb
	shytDDIB2kYhOL2rjXHa3w/2a2cPtl3Kza6I81pa5n6D2pBjvKnujs5abD7lvSPtUMF/BhpxUvexP
	cIlDJvTeHF4vLw1K99h+YRdsIJuk7YjamDYlq67PJoSdWvOAV/DKKKUoRhaLd282M5bhPJlJ5LdED
	DpGZQQqKXaVLPkBY1eB3rdiR1kPoTvupvRA1Kghkv7NAEfWJ8cnfzL4eHUGaBecMly5f1j17zdPPs
	4rNh4fswntFwHrGJLXPQVOXPHD7MB0j7leOk8LczEP80VF8eYCcQUPstLUmMsDKjtC4MvgM2+Iab6
	mydChkBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHw3f-00000002tK9-3jUj;
	Wed, 29 Apr 2026 03:57:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHw3d-00000002tJm-0dZ6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 03:57:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 873C140279;
	Wed, 29 Apr 2026 03:57:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53EF8C19425;
	Wed, 29 Apr 2026 03:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777435072;
	bh=IiZDEYd3G61roEvM82iRLsIal6Ch/P/n1ZmhGvjYTDw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ItCGFWpD2QdkMGgAOOfEqBEPyHdxHMWSPK5W9gUSAkzumDJgSp2UuWVMxKs5LCr6g
	 iHRNL3nUdwHMlZaepTB2yCLadReoPGH972UALJ/buLg2z5E27/sZeuXbBjbB0LBw5Q
	 H0wHHiOacPPWTSCunZbj5v6hZMMD5kvLsg/v4XEpiL/m18wV7HZZM3E8RZXuDDebX5
	 gzpDktsnvn2//N1pHFVc2J4qtOJW9XEpQqTF1WkPsJWdrmWp4Q3ejDSQnsLBWdBhLS
	 /oRK+s02HPU+NUZHtdvrfY/a+sRITFedGx5keKf2QjzGcZL57cxDrjRUkVF0U+qEPV
	 NRbPt6769I9ng==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260427-ti-sci-jacinto-s2r-restore-irq-v6-3-72c6468cb2ab@bootlin.com>
References: <20260427-ti-sci-jacinto-s2r-restore-irq-v6-0-72c6468cb2ab@bootlin.com> <20260427-ti-sci-jacinto-s2r-restore-irq-v6-3-72c6468cb2ab@bootlin.com>
Subject: Re: [PATCH v6 3/4] clk: keystone: sci-clk: add restore_context() operation
From: Stephen Boyd <sboyd@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, richard.genoud@bootlin.com, Udit Kumar <u-kumar1@ti.com>, Abhash Kumar <a-kumar2@ti.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, "Thomas Richard (TI)" <thomas.richard@bootlin.com>, Dhruva Gole <d-gole@ti.com>, Kendall Willis <k-willis@ti.com>
To: "Thomas Richard (TI)" <thomas.richard@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Tero Kristo <kristo@kernel.org>
Date: Tue, 28 Apr 2026 20:57:50 -0700
Message-ID: <177743507054.5403.221436011297776412@lazor>
User-Agent: alot/0.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_205753_221210_F9608288 
X-CRM114-Status: UNSURE (   8.86  )
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

Quoting Thomas Richard (TI) (2026-04-27 05:21:36)
> Implement the restore_context() operation to restore the clock rate and t=
he
> clock parent state. The clock rate is saved in sci_clk struct during
> set_rate() and recalc_rate() operations. The parent index is saved in
> sci_clk struct during set_parent() operation. During clock registration,
> the core retrieves each clock=E2=80=99s parent using get_parent() operati=
on to
> ensure the internal clock tree reflects the actual hardware state,
> including any configurations made by the bootloader. So we also save the
> parent index in get_parent().
>=20
> Reviewed-by: Dhruva Gole <d-gole@ti.com>
> Reviewed-by: Kendall Willis <k-willis@ti.com>
> Signed-off-by: Thomas Richard (TI) <thomas.richard@bootlin.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

