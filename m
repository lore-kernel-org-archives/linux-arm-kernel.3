Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9080CA5FD9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 08:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=guSS/KYjl8+8j30rtfwxuibMm84o1LTrBp5a4oJHKrY=; b=Lx5qcz/TsvRvgdWr4Rkfc3FQ9J
	iodm22aZbuBPuxNHf4XfLkFcS6Od9+kyUsP6CYwpC3u+vSk5L724wtLRWyqXX5KIrAViJOBjZYNj4
	B+8bplpJm3Y7nyu4fNOjB1fOAGzUMuHBzNPtxLQpb8p8+CivUBNxvFdaPJDoFrM4CY26W+pj13f4M
	251CssoKysx0Ku5b3d4AdyR+VnEiEUNriRlJ5giLknaeVqNL7nw2IiMSgBTIvJfBOrzEHYnwbYkyS
	JxzPr2FF4raNK5SSoVDJVfU9qCactdAFuDRwMgeNLEXNvYMBZsLAoXbRNaK6jSi81MMZ/fZQSuajR
	pjA9oafw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYR8-0000000Axki-1xpO;
	Fri, 02 Oct 2026 08:16:10 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYR5-0000000Axju-3JBq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 08:16:09 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e79a408deso46151745e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 01:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790928966; x=1791533766; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=guSS/KYjl8+8j30rtfwxuibMm84o1LTrBp5a4oJHKrY=;
        b=hFKMN/2TMcHbB5dOCUOBdS85mIZbYXsPI1vZR38QF60w1RAQnAsfbecda+E3KqamxN
         UIoLsMFLDSg/wD3cM8tol6P0BQxSU/BIuQnOZtxw34eU2ydWnz0fe8qdu1EuArlRD0HY
         6wx0D+RmOVcp8EOKoCwGLjMVJqn+uO6dA+FXvVbE5YaWeqpu16eUAJ+YnegvV70f940E
         EumlGjvz3aLI1/ocO9nxZ8nblfbdb3AOBGktO9yg97gUydxAeUP8ffXkvCkxz3RG22eG
         irWTtGa3VL6XPsY4vOgd/z0pNOGML5c4w7jgnq3l2/vZN928itn1wMF2R9pJ2AdXP/dW
         RlSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790928966; x=1791533766;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=guSS/KYjl8+8j30rtfwxuibMm84o1LTrBp5a4oJHKrY=;
        b=VrqPx6+GP2Ges+QYqlAbuZFZCJt3rX/1Z2AllYWkjDNAVqAH0D1QMQ98Twr975aAPl
         Bwc1cSzLyzb70dhLUdj5bQgaMhYi9SVMgXKbUwYKSu6rF9FE8rmsitcO8/1PZE8qUfCV
         EnQ7LjkaBfgtIjucRT2p7i8BSGraYI7+VPoNUxIAujSVqPKDjQZzsrE8P7cO9nsw1DlX
         zo4k4kDTs3XIcxwcmfbZ5ZF9gK4L+tnxT+3buZYgbzQBBjW5i0gdyZCKmbeqy5fwt9ai
         J9J6dfCKZ1sJ3CHPAGjj/QFGV0J+PrI+OAn8M/uqSrOmBUPhyWahiDg7xPSG5R4wN5yv
         GkmQ==
X-Forwarded-Encrypted: i=1; AKwUvBwReBF24GWzfQRsHd578tZO+C2c5oNt+pdnVOzJFBo0cGIys783DflL+Z5dZcOgY3p/C6RFqiTsAkEhFs3FSm5Q@lists.infradead.org
X-Gm-Message-State: AFuF++nPX2Umf/yaYes/Zp3mFR6mj7jBMUafEshq/bsMHJwKDSR9Fhyy
	hzV2g4+Txp4klTKTWlnRvK4mwcCKjy/OVyiQt+QbB8L4YyQNKpjLNC6IkNBzJRKQUmw=
X-Gm-Gg: AYBFou0KHnZFuDK9d3oCmRcYlHJbvfGNIWoS+KF5v1szyJwmtgzwgaAl3Ak7iRUBSzm
	MFNr7J+ViB9Xo1SKEjzxnOBEVFRy7WBdoCOXch5N1ZjDS2FJ8vLcXIpnRnNhm8IiQs0AaAs+ilY
	nGYMA8SeiIa8pBKPEJzBRQjpu9tKsN+vq4TgLxUJ84EwO6t3IqBHf9S742MK8qPPtHk208OTH0F
	VNxIUoM2h9R5py6R+69ONkj6p9cdSYIENwQuCmAg4PbyrzDFc1GQc19PxvF6CmABw2DCfEnmeqL
	w7SzwWsl61nC2hW5+vP5dxUgTF6ng+k9jpc4yIHMZ6BAhJ7UF/0OWPwJB/tFcdFQ3EdT9fbvsTC
	eYmae2QXjqpv8De0sKDnCX8przhsn0D1P+k7Pa5qxzenmyMoC18Xbc55OUE8ytvUD1RBV3jsSRs
	IuOIyJEWvnWxDIqQzJOLvjHhOvDWKrLMc+dd3U1BlJ2jkXiL6tvX2ytGkvknRB/fx9sZapmVJ/S
	FI0h/bR37h11qjDAg==
X-Received: by 2002:a05:600c:1d15:b0:49f:e427:e88f with SMTP id 5b1f17b1804b1-4a027564ddemr35404475e9.21.1790928965827;
        Fri, 02 Oct 2026 01:16:05 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380fada5sm3689482f8f.24.2026.10.02.01.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 01:16:05 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, Arnd
 Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, Jerome
 Brunet <jbrunet+clk@baylibre.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Steam Lin <STLin2@winbond.com>,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 devicetree@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v6 08/12] clk: nuvoton: ma35d1: Retrieve HXT/LXT from DT
In-Reply-To: <87o6ddmmc2.fsf@bootlin.com>
References: <20260930-perso-ma35d1-upstream-clk-v6-0-48937ee6c9bb@bootlin.com>
 <20260930-perso-ma35d1-upstream-clk-v6-8-48937ee6c9bb@bootlin.com>
 <1j7bk13gpq.fsf@starbuckisacylon.baylibre.com>
 <87o6ddmmc2.fsf@bootlin.com>
Date: Fri, 02 Oct 2026 10:16:04 +0200
Message-ID: <1jy0cg1prv.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_011607_861260_1F68145E 
X-CRM114-Status: GOOD (  29.15  )
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

On jeu. 01 oct. 2026 at 18:12, Miquel Raynal <miquel.raynal@bootlin.com> wr=
ote:

> On 01/10/2026 at 11:36:33 +02, Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>> On mer. 30 sept. 2026 at 19:24, Miquel Raynal <miquel.raynal@bootlin.com=
> wrote:
>>
>>> HXT and LXT are crystal oscillator inputs of the clock controller, they
>>> are described in the DT, so retrieve them, in order, and store them in
>>> their respective HXT/LXT hw table entries.
>>>
>>> Since old DTs reference the HXT fixed-clock without naming it and do not
>>> describe LXT at all, we assume that HXT must be present, and fallback to
>>> creating a fixed clock for LXT if it is not described (for backward
>>> compatibility purposes).
>>>
>>> The downstream gate clocks can directly use the hw clocks as parents,
>>> instead of relying on string matching.
>>>
>>> Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock c=
ontroller")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>>> ---
>>>  drivers/clk/nuvoton/clk-ma35d1.c | 43 ++++++++++++++++++++++++++++++++=
--------
>>>  1 file changed, 35 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk=
-ma35d1.c
>>> index ceebcbd8c18b..d955d79abdd2 100644
>>> --- a/drivers/clk/nuvoton/clk-ma35d1.c
>>> +++ b/drivers/clk/nuvoton/clk-ma35d1.c
>>> @@ -4,6 +4,7 @@
>>>   * Author: Chi-Fang Li <cfli0@nuvoton.com>
>>>   */
>>>=20=20
>>> +#include <linux/clk.h>
>>>  #include <linux/clk-provider.h>
>>>  #include <linux/mfd/syscon.h>
>>>  #include <linux/module.h>
>>> @@ -191,6 +192,15 @@ static struct clk_hw *ma35d1_clk_gate(struct devic=
e *dev, const char *name, cons
>>>  				    reg, shift, 0, &ma35d1_lock);
>>>  }
>>>=20=20
>>> +static struct clk_hw *ma35d1_clk_gate_parent(struct device *dev, const=
 char *name,
>>> +					     struct clk_hw *parent,
>>> +					     void __iomem *reg, u8 shift)
>>> +{
>>> +	return devm_clk_hw_register_gate_parent_hw(dev, name, parent,
>>> +						   CLK_SET_RATE_PARENT,
>>> +						   reg, shift, 0, &ma35d1_lock);
>>> +}
>>> +
>>>  static int ma35d1_get_pll_setting(struct device_node *clk_node, u32 *p=
llmode)
>>>  {
>>>  	const char *of_str;
>>> @@ -215,10 +225,12 @@ static int ma35d1_clocks_probe(struct platform_de=
vice *pdev)
>>>  {
>>>  	struct device *dev =3D &pdev->dev;
>>>  	struct device_node *clk_node =3D pdev->dev.of_node;
>>> +	struct clk_bulk_data *clks;
>>>  	void __iomem *clk_base;
>>>  	static struct clk_hw **hws;
>>>  	static struct clk_hw_onecell_data *ma35d1_hw_data;
>>>  	u32 pllmode[PLL_MAX_NUM];
>>> +	int num_clks;
>>>  	int ret;
>>>=20=20
>>>  	ma35d1_hw_data =3D devm_kzalloc(dev,
>>> @@ -240,12 +252,27 @@ static int ma35d1_clocks_probe(struct platform_de=
vice *pdev)
>>>  		return -EINVAL;
>>>  	}
>>>=20=20
>>> -	hws[HXT] =3D ma35d1_clk_fixed("hxt", 24000000);
>>> -	hws[HXT_GATE] =3D ma35d1_clk_gate(dev, "hxt_gate", "hxt",
>>> -					clk_base + REG_CLK_PWRCTL, 0);
>>> -	hws[LXT] =3D ma35d1_clk_fixed("lxt", 32768);
>>> -	hws[LXT_GATE] =3D ma35d1_clk_gate(dev, "lxt_gate", "lxt",
>>> -					clk_base + REG_CLK_PWRCTL, 1);
>>> +	num_clks =3D devm_clk_bulk_get_all(dev, &clks);
>>> +	if (num_clks < 0)
>>> +		return num_clks;
>>> +
>>> +	if (!num_clks) {
>>> +		dev_err(dev, "missing crystal input clocks\n");
>>> +		return -ENODEV;
>>> +	}
>>> +
>>> +	hws[HXT] =3D __clk_get_hw(clks[0].clk);
>>
>> Don't open code it. use .fw_name
>
> Ok, if I understand your suggestion, I will go for the use of
>
>     devm_clk_hw_register_fixed_rate_parent_data()
>
> for these fixed clocks.
>
>>
>>> +
>>> +	if (num_clks > 1)
>>> +		hws[LXT] =3D __clk_get_hw(clks[1].clk);
>>> +	else
>>> +		/* Old DTs do not describe the low-speed crystal */
>>> +		hws[LXT] =3D ma35d1_clk_fixed("lxt", 32768);
>>
>> I'd give it another name so you can clearly see the difference between t=
he
>> DT one and the manually registered one.
>>
>>> +
>>
>> Don't need to open code this either.
>> provide both .fw_name and .name - CCF will fallback to the name.
>>
>> When you want to conditionally register the fixed is up to you.
>
> Ok, so if my understanding is correct, I should use parent data with:
> * .fw_name being the clock-names entry
> * .name being the name of the clock that will be created ex-nihilo
> Am I correct? And clock-output-names in that case has no importance at
> all (hence this strengthen my wish to get rid of it)?

Yes

>
> In the fallback case, what naming makes sense? I don't know. I would
> have preferred to just name it "hxt" (respectively "lxt") in both cases
> because we truly don't care about the name, except it would be nicer for
> the reader of clk_summary. Do you mind if I keep "hxt"/"lxt" for both?

Picking another name is merely a suggestion. I don't have a strong opinion
over this.

>
> Thanks a lot for the hints!
> Miqu=C3=A8l

--=20
Jerome

