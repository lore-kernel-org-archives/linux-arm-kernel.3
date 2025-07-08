Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B05C71130
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 02:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kN2rGg2gNBfzoLzarmFrc1jj2Kw72Baij/wc1vu6ems=; b=ML0xWSvMw+RyRJwC3zXcFuAzCl
	fT0bfe2N29m2Vy8okHDsNNZUIOP5UHD9AIfXlJUpgqR0+V0q6Ae84s4I7tvr31e2j8zdn9FpRW386
	lamYCDB5LIp9GJkM++5pyQMPMxWMPFYTbvTW6iZ+5jZ3QPRaXBPgeSsQX7ONaDBNNYU52mQEH4n45
	zheT/Ew0yfKy04grX66HLmomKB9GNugN/3osVxd4GtIKZHEsCieMoDf4MXW6/yy+VkuZUob+wND0c
	M1WP0Vg/gGUnIbofb3pEX8uFpN5rvWBd73Vk+IqL+r1j+jsjZlGBYCTumnhOyRIIA6M5ZADuhQuvB
	QUjPr59g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYxue-000000044IR-3uRk;
	Tue, 08 Jul 2025 02:18:28 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYxk8-000000042UU-1GZH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 02:07:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1751940454;
	bh=kN2rGg2gNBfzoLzarmFrc1jj2Kw72Baij/wc1vu6ems=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ha7WJgDe74gsOm+qeUSIHRg1ZoYq42zJfJfEFAdPLWCIehOh1LgUHY3Lu7ki+g3VL
	 ooAPifuT5592xzW4KaZw5xgMa4XxL+qNaTjlis5u+x1SQvCv4DDgpqdWMbB8KtLLGK
	 jnio7lHVl0gMqGHN9PhT+nK3TN9DTvVaTuzhQLh/TZCHrD66aSYjhqQ0vG5fLY0Q8E
	 YvldycIztxQPZQU5Ai8h/1FqPz4xXhaL8KMHFLLk7NMQdUPh82hUvV1Ggv3/9CauXB
	 05e+Rd10x9SxSsqfmnvkBTmJ111HvMq9x3VTctmTsiKdLUqq6+fjTFHyVQMqwl79va
	 luKLA74fgVsnQ==
Received: from [192.168.68.112] (unknown [180.150.112.153])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 148376ADE6;
	Tue,  8 Jul 2025 10:07:34 +0800 (AWST)
Message-ID: <24c957d3e63bf6dcd58b0807df79350d4b111926.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 10/10] soc: aspeed: lpc-snoop: Lift channel config to
 const structs
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-aspeed@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, Henry
 Martin <bsdhenrymartin@gmail.com>, Patrick Rudolph
 <patrick.rudolph@9elements.com>,  Andrew Geissler <geissonator@yahoo.com>,
 Ninad Palsule <ninad@linux.ibm.com>, Patrick Venture <venture@google.com>, 
 Robert Lippert <roblip@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Tue, 08 Jul 2025 11:37:33 +0930
In-Reply-To: <20250704182348.53808e0f@endymion>
References: <20250616-aspeed-lpc-snoop-fixes-v2-0-3cdd59c934d3@codeconstruct.com.au>
	 <20250616-aspeed-lpc-snoop-fixes-v2-10-3cdd59c934d3@codeconstruct.com.au>
	 <20250704182348.53808e0f@endymion>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_190736_546130_16A8D7E9 
X-CRM114-Status: GOOD (  22.44  )
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

Hi Jean,

On Fri, 2025-07-04 at 18:23 +0200, Jean Delvare wrote:
>=20
> > @@ -189,28 +215,27 @@ static int aspeed_lpc_snoop_config_irq(struct asp=
eed_lpc_snoop *lpc_snoop,
> > =C2=A0}
> > =C2=A0
> > =C2=A0__attribute__((nonnull))
> > -static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device *dev,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum aspeed_lpc_snoo=
p_index index, u16 lpc_port)
> > +static int aspeed_lpc_enable_snoop(struct device *dev,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct aspeed_=
lpc_snoop *lpc_snoop,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct aspeed_=
lpc_snoop_channel *channel,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct a=
speed_lpc_snoop_channel_cfg *cfg,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u16 lpc_port)
> > =C2=A0{
>=20
> I'm confused by this new calling convention. With lpc_snoop and index,
> you could already retrieve the aspeed_lpc_snoop_channel struct and the
> aspeed_lpc_snoop_channel_cfg struct. I can't see the benefit of the
> change.=C2=A0
>=20

My motivation for this choice was to isolate the association between
indexes into the arrays to the call-site of aspeed_lpc_enable_snoop(),
rather than have that information spread through the implementation.

I considered the approaches you outline next before posting v2, so
while they have their merits as well, I'm going to chalk this one up to
personal preference on my part.

> It even forces you to add an index field to struct
> aspeed_lpc_snoop_channel_cfg, which would otherwise not be needed.
>=20
> If you prefer to pass cfg instead of index as a parameter, that does
> not imply passing channel too. You can get the index from the cfg (if
> you decide to keep it in that struct), and then the channel from index.
>=20
> Or you could even pass only the channel (to be consistent with
> aspeed_lpc_disable_snoop), if you set channel->cfg before calling this
> function. Again this implies keeping index in struct
> aspeed_lpc_snoop_channel_cfg.

*snip*

>=20
> > -
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Enable LPC snoop channel =
at requested port */
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0regmap_update_bits(lpc_snoop=
->regmap, HICR5, hicr5_en, hicr5_en);
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0regmap_update_bits(lpc_snoop=
->regmap, SNPWADR, snpwadr_mask,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 lpc_port << snpwadr_shift);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0regmap_set_bits(lpc_snoop->r=
egmap, HICR5, cfg->hicr5_en);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0regmap_update_bits(lpc_snoop=
->regmap, SNPWADR, cfg->snpwadr_mask,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0lpc_port << cfg->snpwadr_shift);
>=20
> It is a good practice to align the second line on the opening
> parenthesis of the first line (as was done originally).

Thanks, I've fixed this up.

*snip*

> > =C2=A0
> > =C2=A0static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
> > @@ -339,6 +326,8 @@ static int aspeed_lpc_snoop_probe(struct platform_d=
evice *pdev)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (rc)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0return rc;
> > =C2=A0
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0static_assert(ARRAY_SIZE(cha=
nnel_cfgs) =3D=3D ARRAY_SIZE(lpc_snoop->chan),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0"Broken implementation assumption regarding cfg count"=
);
>=20
> Both also need to be equal to ASPEED_LPC_SNOOP_INDEX_MAX + 1, right?
> Otherwise the loop below would break. But it turns out that both arrays
> are now declared that way, so it just has to be true. This makes me
> believe that this static assert is no longer needed.

My intent was to convey that we require the arrays to be the same
length, as opposed to being declared such that they happen to have the
same length. It's a property of the design rather than the
implementation. All static_assert()s should be obviously true; IMO
their purpose is to communicate requirements and constrain change.

With the view to getting these patches applied I intend to keep it.

Thanks,

Andrew

