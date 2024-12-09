Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D73EE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 20:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=haXy6Pn/YyEod3vhtpY5A5WC+w3IxFAK0ooQa7nKgHo=; b=c4UrTbIiMlP1EKNmm+53Vwq2CC
	P6baIl+B9jZV+fyNGgcicZg1PZQvEKzAsqEBCanU9Xzt80ukLWZoBqhkFT1meJHkV56Z2YBOsa0l+
	nmX+lAudS7PFhg4OCIFkKEPKNKn6p5q7ehZ9oyo2AFz47CEzZdsyzVub8/ZIBiJWhZxUBWxjscGXJ
	lWpUxLtWg+e/WRNmhGFQAd+QHFN7AsL5rxKNfh93kF538V9Iba0rgl08w0wjL7Tiyme+h4NO13w3r
	Kw/9rmokS8095529dDNeD1b4kOj+65qSY/RmZjafRstA4rKnZs/y8QZV35idM3Y33g47rWCoghrRJ
	Z2+kfWww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKk3Q-000000098oV-3W7G;
	Mon, 09 Dec 2024 20:08:28 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKk2E-000000098bc-3qpW;
	Mon, 09 Dec 2024 20:07:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733774832;
	bh=XHeeybhj5u2b8BHEtLKC3hKJSOqzRrrU3o97MCDUjaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nyw7V+wJ6jSPe9lIbRvVSihwC0AUWedhKPy2iBGsL6d971k2Cv/6CqVfA/rn9pXks
	 GBLlqwLP+A+/gTn2Jlcep+CcN23rMmWU59KIeTpaDotz36jkfIzLUCetGU3u8pbAkH
	 qEbiY/V9XJzWNyRKgF7flBQzbgxX0IVSycXr8NuBSqy5s4Nu+Ckud/8es/Fo2XZXrj
	 FdHnxO72b+zm+J0v+pY7g8efUsCJqg2IIL+B56F5EvmlqmviWYfnvXIk+M9ZdJ+sMx
	 JohnjPIyfrrjjCdyMglpioyR3Cjm4axQZ0pNNoXvTV/A7WkaW7ua0Uo20pFpZfkUDx
	 XIBVs/9OzxmpQ==
Received: from notapiano (unknown [IPv6:2804:14c:1a9:53ee::1002])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E0F5A17E3780;
	Mon,  9 Dec 2024 21:07:09 +0100 (CET)
Date: Mon, 9 Dec 2024 17:07:07 -0300
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Trevor Wu =?utf-8?B?KOWQs+aWh+iJryk=?= <Trevor.Wu@mediatek.com>
Cc: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"perex@perex.cz" <perex@perex.cz>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kernel@collabora.com" <kernel@collabora.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] ASoC: mediatek: mt8188: Enable apll1 clock during reg rw
 to prevent hang
Message-ID: <108d4187-26af-43f6-8b1e-0e48516524a4@notapiano>
References: <20241203-mt8188-afe-fix-hang-disabled-apll1-clk-v1-1-07cdd7760834@collabora.com>
 <a10dbdf265194e77a69b6e40afa3df9636b3ab14.camel@mediatek.com>
 <a70a0521-985d-43a4-a1fa-36eb733d5ca9@collabora.com>
 <1d2ee55dde84bcab6f777525042c6789b9f2c1fc.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1d2ee55dde84bcab6f777525042c6789b9f2c1fc.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_120715_112477_BD020C66 
X-CRM114-Status: GOOD (  48.82  )
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

On Fri, Dec 06, 2024 at 06:57:00AM +0000, Trevor Wu (吳文良) wrote:
> On Thu, 2024-12-05 at 13:51 +0100, AngeloGioacchino Del Regno wrote:
> > 
> > 
> > Il 04/12/24 13:17, Trevor Wu (吳文良) ha scritto:
> > > On Tue, 2024-12-03 at 17:07 -0300, Nícolas F. R. A. Prado wrote:
> > > 
> > > > 
> > > > Currently, booting the Genio 700 EVK board with the MT8188 sound
> > > > platform driver configured as a module (CONFIG_SND_SOC_MT8188=m)
> > > > results
> > > > in a system hang right when the HW registers for the audio
> > > > controller
> > > > are read:
> > > > 
> > > >    mt8188-audio 10b10000.audio-controller: No cache defaults,
> > > > reading
> > > > back from HW
> > > > 
> > > > The hang doesn't occur with the driver configured as builtin as
> > > > then
> > > > the
> > > > unused clocks are still enabled.
> > > > 
> > > > Enable the apll1 clock during register read/write to prevent the
> > > > hang.
> > > > 
> > > > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > > > ---
> > > >   sound/soc/mediatek/mt8188/mt8188-afe-clk.c | 4 ++++
> > > >   1 file changed, 4 insertions(+)
> > > > 
> > > > diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
> > > > b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
> > > > index
> > > > e69c1bb2cb239596dee50b166c20192d5408be10..fb8cf286df3f02ac076528b
> > > > 898f
> > > > d0d7a708ec1ea 100644
> > > > --- a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
> > > > +++ b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
> > > > @@ -587,6 +587,8 @@ int mt8188_afe_enable_reg_rw_clk(struct
> > > > mtk_base_afe *afe)
> > > >          mt8188_afe_enable_clk(afe, afe_priv-
> > > > > clk[MT8188_CLK_AUD_A1SYS_HP]);
> > > > 
> > > >          mt8188_afe_enable_clk(afe, afe_priv-
> > > > > clk[MT8188_CLK_AUD_A1SYS]);
> > > > 
> > > > +       mt8188_afe_enable_clk(afe, afe_priv-
> > > > > clk[MT8188_CLK_APMIXED_APLL1]);
> > > > 
> > > > +
> > > >          return 0;
> > > >   }
> > > 
> > > Hi Nicolas,
> > > 
> > > If I understand correctly, APLL1 should be the parent clock of
> > > AUD_A1SYS_HP and AUD_A1SYS, so it should be enabled automatically
> > > by
> > > CCF.
> > > 
> > > I'm not sure why you resolved the hang issue after enabling APLL1.
> > > Could you share more details about the solution?
> > > 
> > 
> > Hmm. Now I see what's happening here...
> > 
> > Nicolas, Trevor,
> > 
> > Possible parents for top_a1sys_hp are:
> >   - clk26m
> >   - apll1_d4
> > 
> > ...what's happening here most probably is that after the clock gets
> > disabled as
> > unused, it gets parented to clk26m by default as that is parent index
> > 0... and
> > something else in AFE needs APLL1 to feed a clock to .. something ..
> > to allow
> > register access.
> > 
> > Trevor, do you know why is this IP unaccessible when A1SYS is
> > parented to clk26m?
> 
> Hi Angelo,
> 
> As far as I know, it should work even though the clock is parented to
> clk26m.
> 
> Unfortunately, I have no idea about why APLL1 enabling can resolve the
> hang issue. I'm also curious about how Nicolas found the solution to
> resolve the problem.
> 
> From the description, it seems that the problem is related to register
> r/w hang. If I remembered correctly, when the mtcmos of ADSP_INFRA is
> ON, register r/w won't cause the cpu to hang. However, ADSP_INFRA has
> been configured as ALWAYS_ON in the driver. I'm not sure if it doesn't
> work correctly when the driver is configured as a module. Maybe Nicolas
> can also check this.

Indeed, as suggested by Angelo, adding 

  assigned-clocks = <&topckgen CLK_TOP_A1SYS_HP>;
  assigned-clock-parents = <&topckgen CLK_TOP_APLL1_D4>;

to the afe node also fixes this issue. 

In mt8188.dtsi, we currently have

  afe: audio-controller@10b10000 {
  	...
  	assigned-clocks = <&topckgen CLK_TOP_A1SYS_HP>;
  	assigned-clock-parents =  <&clk26m>;

So the question is, do other MT8188 platforms need clk26m to be the parent of
a1sys_hp? Depending on that I can either update the parent on the common
mt8188.dtsi or on the genio700-evk.dts, which is where I observed the issue. I
don't have access to other mt8188 platforms. Trevor, do you know?

As for how I identified this issue, I noticed that when booting with the
platform driver as a module the system would hang, and that passing
clk_ignore_unused avoided the issue. Then I selectively ignored some unused
clocks until I narrowed down to ignoring unused only the apll1 clock, meaning
the apll1 clock needed to be left on during the platform driver probe for the
system to not hang.

Thanks,
Nícolas

> 
> Thanks,
> Trevor
> 
> > 
> > That might give Nicolas a definitive hint about how to resolve this
> > issue.
> > 
> > Cheers,
> > Angelo
> > 
> > > Thanks,
> > > Trevor
> > > 
> > > > 
> > > > @@ -594,6 +596,8 @@ int mt8188_afe_disable_reg_rw_clk(struct
> > > > mtk_base_afe *afe)
> > > >   {
> > > >          struct mt8188_afe_private *afe_priv = afe-
> > > > >platform_priv;
> > > > 
> > > > +       mt8188_afe_disable_clk(afe, afe_priv-
> > > > > clk[MT8188_CLK_APMIXED_APLL1]);
> > > > 
> > > > +
> > > >          mt8188_afe_disable_clk(afe, afe_priv-
> > > > > clk[MT8188_CLK_AUD_A1SYS]);
> > > > 
> > > >          mt8188_afe_disable_clk(afe, afe_priv-
> > > > > clk[MT8188_CLK_AUD_A1SYS_HP]);
> > > > 
> > > >          mt8188_afe_disable_clk(afe, afe_priv-
> > > > > clk[MT8188_CLK_AUD_AFE]);
> > > > 
> > > > ---
> > > > base-commit: b852e1e7a0389ed6168ef1d38eb0bad71a6b11e8
> > > > change-id: 20241203-mt8188-afe-fix-hang-disabled-apll1-clk-
> > > > b3c11782cbaf
> > > > 
> > > > Best regards,
> > > > --
> > > > Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > > > 
> > > > 
> > 
> > 

