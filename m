Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5193CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 12:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BZXz+xk759zPv/VLZPRnNX9kRrlEZgEOWXXiOzKQHdU=; b=qMUJAxa0Oskgw2xZyJ++MTp1g4
	EYX7G4rh/g9QBayGS6yfsd12iTILVSGMmEGeWqFW84yhCFTu2HVStEe1X1pseEfLgULPC7OJgJY80
	ENZ7dxW869/yzs3pXmF4KNQPeBOaEhWYqDQA8E8gkehPYnqOyssiK82fgEH1jBq0b6/1JSiBTk2SW
	iZexd8k2M74TJ2OtbsopbFBtKCQdGIM4hk1nTSAKvsdRfBPTVCXbAkm1xIkJ3yF4P/Sr5Vy+aJl09
	NWorDGVb1oGSFjj6i8RnvZJl8F77qHspSmESSimQMFTFvkTjA1PbYRfVvfBKTse3k7ILK27ZsGKtG
	/DFzAUOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmUh-00000006N7A-2XtC;
	Wed, 03 Sep 2025 12:21:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utlKV-00000006BAF-3Haw;
	Wed, 03 Sep 2025 11:07:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 09A04444B8;
	Wed,  3 Sep 2025 11:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F797C4CEF0;
	Wed,  3 Sep 2025 11:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756897626;
	bh=virt440YX1VkOxJaTmEr80xjwMryJlZsQui9kt/izTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X8WNaEN/VwOhZmnWe6N6MP7x5vfstlLdgDw2eZrZCeb3sK1BIcrWgrADCpGviGRw8
	 9eXvp6RGfYqzwQ3VPiDQd1B0QvXzi2heoZ6QyApM39eJFhuewyi6wxiMUciaaG9Gtl
	 ySaWqYLyotZFWePjR8RceMk+5F4IfB4wX7CeIOfoFScC9w4l8RLBt534eUcMHkCOt7
	 DX47DcrOhsixkweNukJ8QvVSuquvQ0MAr/z2JRSSosFemG4LpXfRE/5tOgHWF6DyYM
	 +s7K/ZK1BTWNET730nOALste8EyPz7s8CKPbsVudE05b7jj44zK/1ERrqX5vQoyh+C
	 V1+KewudYEZXA==
Date: Wed, 3 Sep 2025 12:06:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-mm@kvack.org,
	imx@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 16/16] pinctrl: qcom: make the pinmuxing strict
Message-ID: <8a54bbbd-2b7a-482f-9ab5-eac83264b1f6@sirena.org.uk>
References: <20250902-pinctrl-gpio-pinfuncs-v7-16-bb091daedc52@linaro.org>
 <aLcBcjvMbrxoDYoC@smile.fi.intel.com>
 <CAMRc=MfcFMgkNqWNZV5o0NxkAvxBTjC3vv56Cr98n0R2CkxuPw@mail.gmail.com>
 <CAHp75VcgaqnDrPH27wxfgyK6zz4RAKJQB0r7G2vbTONTxkEzTw@mail.gmail.com>
 <CAMRc=MfhhX2NJ0fhhX8u+7=sdyUy0G27n7caGf9=TpHxUDJVxg@mail.gmail.com>
 <aLgW7J-j4nn0u8uo@smile.fi.intel.com>
 <CAMRc=MdA21fwnamymG6YhqBjKDso_nJs_4xefPNONQNfEcPHXA@mail.gmail.com>
 <aLgaoivmBUgoeO6B@smile.fi.intel.com>
 <CAMRc=Me84OX=UEmAXxmwE8oOH=1UBsyHe-7XmU0c8a2gG9JnCA@mail.gmail.com>
 <aLgeDNLABpmkShIU@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/BwkSBKy/i3w/XmA"
Content-Disposition: inline
In-Reply-To: <aLgeDNLABpmkShIU@smile.fi.intel.com>
X-Cookie: You were s'posed to laugh!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_040707_858011_7132882D 
X-CRM114-Status: GOOD (  14.94  )
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


--/BwkSBKy/i3w/XmA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 03, 2025 at 01:53:00PM +0300, Andy Shevchenko wrote:

> (Not sure, but SPI DesignWare requires programming SPI native chip selects even
>  if the GPIO is used for that, this might have also some implications, but here
>  it's for real 'purely speculative'.)

It is very common for SPI controllers to absolutely require setting a
chip select in order to do a transfer, when using GPIO chip selects with
such controllers the standard practice is to just not mux out the chip
select signal from the controller and do everything in software.  The IP
will be doing it's thing with it's chip select signal but that signal is
never actually connected to anything.

--/BwkSBKy/i3w/XmA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmi4IU4ACgkQJNaLcl1U
h9AQfAf/cIyTMUWIKvnzF/bbQpaevTEUa1OBu/7ZBFg8nC5nbLhvhVdYli97003E
aKUauEzD22LQFP4msSIUEmLifRDXBb4pRIP4hVwWteB+GakiyOdtVyAxV7uySCKT
95KpISbIE8ooH7RkAXe8N1iYnqwy9VRmdjYa2FdzpLuCPCawD0+YiYWzPPLLVtgA
quzmvAfna367i9/zeuRw6JPL7bZOm3lq0EAs4Y/xEDQVXW2aVcW5K8mzJqoBJot+
gjs2B5fH1gVJxjLMx5QO/i7tktneqkpdo3YQhL8m9VKl7/DAuBacjsHoBN7exY4u
23ENTRMf7dNs8GE3wrhuLAFBjmihdw==
=ZPrJ
-----END PGP SIGNATURE-----

--/BwkSBKy/i3w/XmA--

