Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF99CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 16:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z+FTNcI1ZVOGKwAwbJoRaB+RsZ8LwvDolH15T9JS/r0=; b=dvq9JLpesRb/UxhoSywANHvNlx
	84xClubsuRiJhUxoyuKL0R4JRcMeD7JBtRNY9XIR/sRKQoAsscDN3oqhPCM2hjCDvMn0DngD6P0as
	BcN6c400CgdNxCoh/oJ3YJifVwam6uahFfTRVHrqKblQLBNl8VOaahiUVKdVEyaFPw7mGSrup8vqj
	B+yOMTZLLoBU/O6uajlCApZD39BCqFOoODamb4iTqOeAQGHM9YRYykjiNKcO/IgvBoOMeKQp3lSNB
	Vuumw/AriV/kFfKG/Jml/8kb033J4F7g2DgqfLatQpKtSHnmJ8PP0ib6szG01pQYxHEAipRTAfIoz
	s81X68hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDoH-00000000xx6-1zJT;
	Mon, 28 Sep 2026 16:02:33 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDoD-00000000xwk-3Cga
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 16:02:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 33ECE1A0FDE;
	Mon, 28 Sep 2026 16:02:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 05597601BD;
	Mon, 28 Sep 2026 16:02:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2C436103295A7;
	Mon, 28 Sep 2026 18:02:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790611340; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=z+FTNcI1ZVOGKwAwbJoRaB+RsZ8LwvDolH15T9JS/r0=;
	b=k1kmipKcbgZK4+GJAxsjcIf58jtCIK8Ge5m2VLrsc5Ogh51sBKvy57GnvRupbQn/aowVH2
	fOZWSMGi/T29Rq3hzIXs3g4wpdEXw/wRKJnRbqcBGGHbCNHV96L/dj3wcE0IL47TJ4v0Xb
	xdMqzefAm1ro38v6E4yIyy7npBFsltDigNYgMXI+MHxvIKkvcG1f2sued4say67tUtepFn
	f0hyPinq8oEPPnPg7iossaiTuyf5ByO1x+gWYi11ELovX+eZlhvBig0Zy9iTgB3iWkQhqW
	NYGugVv040UixzMO5+G0wm3W39CO4fPWo520T9ocP2ddYAJeM6E11rffaUMMcQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>,  Shan-Chun Hung
 <schung@nuvoton.com>,  Michael Turquette <mturquette@baylibre.com>,
  Stephen Boyd <sboyd@kernel.org>,  Richard Cochran
 <richardcochran@gmail.com>,  Arnd Bergmann <arnd@arndb.de>,  Brian Masney
 <bmasney+clk@redhat.com>,  Jerome Brunet <jbrunet+clk@baylibre.com>,  Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-arm-kernel@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-kernel@vger.kernel.org,  Krzysztof Kozlowski <krzk@kernel.org>,
  devicetree@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH v4 5/6] clk: nuvoton: ma35d1: Use clk_hw pointers as mux
 parents
In-Reply-To: <1jeceeaaug.fsf@starbuckisacylon.baylibre.com> (Jerome Brunet's
	message of "Sun, 27 Sep 2026 19:00:07 +0200")
References: <20260925-perso-ma35d1-upstream-clk-v4-0-f3697553391f@bootlin.com>
	<20260925-perso-ma35d1-upstream-clk-v4-5-f3697553391f@bootlin.com>
	<1jeceeaaug.fsf@starbuckisacylon.baylibre.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 28 Sep 2026 18:02:12 +0200
Message-ID: <87h5j974aj.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_090230_093631_3BACD25C 
X-CRM114-Status: GOOD (  29.33  )
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

On 27/09/2026 at 19:00:07 +02, Jerome Brunet <jbrunet@baylibre.com> wrote:

> On ven. 25 sept. 2026 at 17:10, Miquel Raynal <miquel.raynal@bootlin.com>=
 wrote:
>
>> The MA35D1 clock provider registers its muxes with parent data
>> structures filling .fw_name. This is not the ideal approach since that
>> would require a massive amount of internal clock names declaration in
>> the DT. Since the DT does not play the game of exposing all these names,
>> none of the parent lookups performed when instantiating the muxes
>> succeed. As a result, these muxes get registered as root clocks, leading
>> to a sadly flat clock tree and no frequency assigned to most of the
>> peripheral clocks:
>>
>>                                  enable  prepare  protect
>>    clock                          count    count    count        rate
>>
>>  usbphy1                             0       0        0        480000000
>>  usbphy0                             0       0        0        480000000
>>     husbh1_gate                      0       0        0        480000000
>>     husbh0_gate                      0       0        0        480000000
>>     usbh_gate                        0       0        0        480000000
>>     usbd_gate                        0       0        0        480000000
>>  syspll                              0       0        0        180000000
>>  lirc                                0       0        0        32000
>>     lirc_gate                        0       0        0        32000
>>  hirc                                0       0        0        12000000
>>     gtmr_gate                        0       0        0        12000000
>>     hirc_gate                        0       0        0        12000000
>>  lxt                                 0       0        0        32768
>>     rtc_gate                         0       0        0        32768
>>     lxt_gate                         0       0        0        32768
>>  hxt                                 0       0        0        24000000
>>     vpll                             0       0        0        1224000000
>>        dcup_div                      0       0        0        612000000
>>     epll                             0       0        0        6000000000
>>        epll_div8                     0       0        0        750000000
>>
>>        epll_div4                     0       0        0        1500000000
>>        epll_div2                     0       0        0        3000000000
>>           emac1_gate                 0       0        0        3000000000
>>
>>           emac0_gate                 0       0        0        3000000000
>>
>>     apll                             0       0        0        6048000000
>>     ddrpll                           0       0        0        266460000
>>        ddr_gate                      0       0        0        266460000
>>        ddr6_gate                     0       0        0        266460000
>>        ddr0_gate                     0       0        0        266460000
>>     capll                            0       0        0        2400000000
>>     hxt_gate                         0       0        0        24000000
>>  clk_hxt                             0       0        0        24000000
>>  spi3_mux                            0       0        0        0
>>     spi3_gate                        0       0        0        0
>>  spi2_mux                            0       0        0        0
>>     spi2_gate                        0       0        0        0
>>  spi1_mux                            0       0        0        0
>>     spi1_gate                        0       0        0        0
>>  spi0_mux                            0       0        0        0
>>     spi0_gate                        0       0        0        0
>>  i2s1_mux                            0       0        0        0
>>     i2s1_gate                        0       0        0        0
>>  i2s0_mux                            0       0        0        0
>>     i2s0_gate                        0       0        0        0
>> ...
>>
>> Apart from the wrong clock tree representation, it means that none of
>> the device drivers (spi & i2c in the excerpt above) can actually query
>> their clock rate, or they would get 0Hz.
>>
>> Instead of declaring the parents in the clk_parent_data structure, use
>> the actual HW clocks to lookup the parents directly: parents are
>> described by an array of indices into the controller's main clock table
>> (like in other clock controller drivers), which the "new" mux helper now
>> resolves.
>>
>> The WDT and WWDT muxes list the /4096 children of PCLK3 and PCLK4 among
>> their possible parents. Those two clocks are now registered by the
>> previous commit, so their entries in the parent tables are restored
>> instead of being turned into invalid slots.
>>
>>                                  enable  prepare  protect
>>    clock                          count    count    count        rate
>>
>>  usbphy1                             0       0        0        480000000
>>  usbphy0                             0       0        0        480000000
>>     husbh1_gate                      0       0        0        480000000
>>     husbh0_gate                      0       0        0        480000000
>>     usbh_gate                        0       0        0        480000000
>>     usbd_gate                        0       0        0        480000000
>>  syspll                              1       1        0        180000000
>>     dbg_mux                          0       0        0        180000000
>>     sdh1_mux                         0       0        0        180000000
>>        sdh1_gate                     0       0        0        180000000
>>     sdh0_mux                         0       0        0        180000000
>>        sdh0_gate                     0       0        0        180000000
>>     sysclk1_mux                      2       2        0        180000000
>>        pclk4                         0       0        0        90000000
>>        pclk3                         0       0        0        90000000
>>           sspcc_gate                 0       0        0        90000000
>>           ssmcc_gate                 0       0        0        90000000
>>        hclk3                         0       0        0        90000000
>>        pclk2                         0       0        0        180000000
>>           eadc_div                   0       0        0        90000000
>>              eadc_gate               0       0        0        90000000
>>           qei1_gate                  0       0        0        180000000
>>           ecap1_gate                 0       0        0        180000000
>>           spi3_mux                   0       0        0        180000000
>>              spi3_gate               0       0        0        180000000
>>           spi1_mux                   0       0        0        180000000
>>              spi1_gate               0       0        0        180000000
>>           epwm1_gate                 0       0        0        180000000
>>           i2c5_gate                  0       0        0        180000000
>>           i2c2_gate                  0       0        0        180000000
>>        pclk1                         0       0        0        180000000
>>           qei2_gate                  0       0        0        180000000
>>           qei0_gate                  0       0        0        180000000
>>           ecap2_gate                 0       0        0        180000000
>>           ecap0_gate                 0       0        0        180000000
>>           spi2_mux                   0       0        0        180000000
>>              spi2_gate               0       0        0        180000000
>>           spi0_mux                   0       0        0        180000000
>>              spi0_gate               0       0        0        180000000
>>           epwm2_gate                 0       0        0        180000000
>>           epwm0_gate                 0       0        0        180000000
>>           i2c4_gate                  0       0        0        180000000
>>           i2c1_gate                  0       0        0        180000000
>>        pclk0                         1       1        0        180000000
>>           adc_div                    0       0        0        90000000
>>              adc_gate                0       0        0        90000000
>>           qspi1_mux                  0       0        0        180000000
>>              qspi1_gate              0       0        0        180000000
>>           qspi0_mux                  1       1        0        180000000
>>              qspi0_gate              1       1        0        180000000
>>
>>           i2c3_gate                  0       0        0        180000000
>>           i2c0_gate                  0       0        0        180000000
>>
>> Fixes: f50a000b4219 ("clk: nuvoton: Use clk_parent_data instead of strin=
g for parent clock")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>> ---
>>  drivers/clk/nuvoton/clk-ma35d1.c | 626 +++++++++++---------------------=
-------
>>  1 file changed, 177 insertions(+), 449 deletions(-)
>>
>> diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-=
ma35d1.c
>> index c914079cee2d..1a857f28310f 100644
>> --- a/drivers/clk/nuvoton/clk-ma35d1.c
>> +++ b/drivers/clk/nuvoton/clk-ma35d1.c
>> @@ -63,300 +63,49 @@ static DEFINE_SPINLOCK(ma35d1_lock);
>>  #define PLL_MODE_FRAC           1
>>  #define PLL_MODE_SS             2
>>=20=20
>> -static const struct clk_parent_data ca35clk_sel_clks[] =3D {
>> -	{ .fw_name =3D "hxt", },
>> -	{ .fw_name =3D "capll", },
>> -	{ .fw_name =3D "ddrpll", },
>> -};
>> +#define MA35D1_MUX_MAX_PARENTS	10
>
> I'm bit puzzled how this was supposed to work before. Most of those
> inputs are not present in binding doc. The controller was supposed get
> clocks from itself through DT ???

No idea why it has been written like that. Just to keep things clear, my
re-write is a fix, not a cleanup. Without it, the SPI controller does
not probe and I care about the SPI controller being fixed in this cycle.

> There is one input documented though. It seems to be hxt, so you should
> probably continue to use fw_name for this one at least.

"documented" is maybe a bit strong. There is one reference to a phandle
named clk_hxt, that's it? I don't think it qualifies as a validated
binding :)

> That being said, the bindings doc seems wrong. Looking at the driver you
> should have 4 inputs (hxt, lxt, hirc, lirc), unless those are actually
> generated on SoC ? Since there is already a DT using these, I suppose it
> is too late for the last 3 and you'll be stuck pretending they are
> generated in this controller :/

The TRM identifies:
- HXT and LXT as external crystal oscillators
- HIRC and LIRC as internal RC oscillators
So we want an accurate description, HXT/LXT are worth declaring, but not
HIRC/LIRC.

There is no way to fix this without a breaking change.

My approach for these clocks:
- Describe lxt like hxt in the DT. In the driver, I will take it from
  DT, or fallback to a known base rate otherwise (so no breaking
  change). This is possible since the TRM itself forces the rate of the
  two oscillators. I will also ask for clock names in the binding.
- Fix the name of the output clocks to match the driver (use "hxt"
  instead of "clk_hxt" in the DT). I could fix the driver instead, but
  all other clocks would be named differently, which would be
  strange. So since we anyway *need* a DT update, let's go for a clean
  naming.

The other patches can still go like they are.

Thanks,
Miqu=C3=A8l

