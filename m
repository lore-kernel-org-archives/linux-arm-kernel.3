Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97EB2D41D72
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 09:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nqTjLk1zD6oeEo+651Nbriswu6CCF85fypmhG0chddQ=; b=vz7JGJh7wPWTpas39MVmTp2nV7
	9t0o7s74JyM74MBJs34dykPhBbgi3mQbgWL7khrkYNP8kppgaKkJ9vB55JF7wZbIidRZp3n9hPK8x
	m9cKaF3HaPrTT6SAOZkg5oYQ7i0O4Z75OkMnFnjXQ7yOd6H747ANuRzlaCgSZ7HfbgaNEagIzv/BX
	Ht+TGChJuxeQphLo9QRqeNhvCF3+qUVSWUVskGzkeiT9xfYM5soxfS/2gY+MDB/95cZvVxcSEEI5S
	RGmEUX3Ba3ARV1rje+GeY1rqy8O42ocRjae70Wtr8PWdT1pGB9rZA3UBubyTl46b2TO2wyd59G+OR
	62Ps1K3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAn6s-00000002no6-0PsR;
	Tue, 12 Nov 2024 09:22:54 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAn54-00000002nV4-21Z5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 09:21:04 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 8714F1FA05;
	Tue, 12 Nov 2024 10:20:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1731403259;
	bh=nqTjLk1zD6oeEo+651Nbriswu6CCF85fypmhG0chddQ=; h=From:To:Subject;
	b=NSPJ3oVXgNMobw7T+l2Hku9TkGxCiTqJdgAI4bhJFLR+/7GBaNWzVcJc2OHxi+jhd
	 eS5NBfYRXfeB/c4L1T8+1iI7/DOR0QzWps2Dar7yw/mR8VebEwukyu+zKkKLy/a19Y
	 lj4ISO32bml8ylATCB8ThOn2GRpHZoPqiFjxohKUFRseWRksJWfZDlif7iIl/+nW0u
	 UdpbMzg+paTWriTKQw+FePelFAPwZ6WO0BG5+DqbD1qxvovo4EtrsFGo3HTZw1EyCD
	 D55R9dwj/KQaeCimXmeqqjDxWoFRN15B9HJelZY5soybi4pkkq0Jh1URdKnU731rgm
	 TXWjYwdLln1SQ==
Date: Tue, 12 Nov 2024 10:20:54 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, abelvesa@kernel.org,
	peng.fan@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-imx@nxp.com, shengjiu.wang@gmail.com,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	Adam Ford <aford173@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Mark Brown <broonie@kernel.org>, ulf.hansson@linaro.org
Subject: Re: clk_imx8mp_audiomix_runtime_resume Kernel panic regression on
 v6.12
Message-ID: <20241112092054.GA18139@francesco-nb>
References: <20241007132555.GA53279@francesco-nb>
 <20241112075958.GA8092@francesco-nb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112075958.GA8092@francesco-nb>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_012102_730003_9CD1A592 
X-CRM114-Status: GOOD (  15.40  )
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

On Tue, Nov 12, 2024 at 08:59:58AM +0100, Francesco Dolcini wrote:
> On Mon, Oct 07, 2024 at 03:25:55PM +0200, Francesco Dolcini wrote:
> > it seems that an old regression is back on v6.12, reproduced on -rc2
> > (not sure about rc1).
> > 
> > The original report is from https://lore.kernel.org/all/20240424164725.GA18760@francesco-nb/
> > and it was fixed with https://lore.kernel.org/all/1715396125-3724-1-git-send-email-shengjiu.wang@nxp.com/.
> > 
> > Is it now back?
> 
> I was able to reproduce this issue once more, this time with 6.11.7.
> As I wrote in another email the issue is not systematic as it used to
> be.
> 
> Any idea?

Frank, Shengjiu, could it be that the udelay(5) in imx_pgc_power_up() is
too short and therefore we have such non-systematic failures?

Francesco


