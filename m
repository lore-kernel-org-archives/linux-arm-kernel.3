Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA05BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 14:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4yOipLOM76yQ4J1l/AoGPxGOwmes2/QBhbkzUXSfv48=; b=Xu/xk/+iBbTlM1E1FgMxmySLit
	Ew5tUJD1rykh/ot1Q9339i6boCcowT+7ydC+APd1gdUpT9DFUc3eiMnyPUCB7akaL+FyVU6HZlYs+
	cYOAZAfazKvM0AqSb2q5W96pFOs9oKz0TUjmpXZqkD7/jCs+iemj07o7WeuvrZHqp8GDcIzVyynzi
	0RWc4LgNYtoDlPUtI2rZzErSZS2d4d/mbdzAlYq8vgYfND+r9d4FZEBCvYsgPcCmiuIucZsumo/bP
	OWVjEIyXcDzhEFL1wDgFsKNUsZaDLVXQBCvW1tQ/cMAjyIdLkWYnI7JyCFvQNnfyNVP5IsPlWSeWa
	p/Pc0REA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whndy-00000002Kh7-0Jw9;
	Thu, 09 Jul 2026 12:14:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whndw-00000002KaQ-1Ml0;
	Thu, 09 Jul 2026 12:14:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:To:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4yOipLOM76yQ4J1l/AoGPxGOwmes2/QBhbkzUXSfv48=; b=cxR2YObU8Z/iBrqZhLu/c4nkzh
	BS4CzBYetPFsi1yo0dwJ2HWaochSHiZcx/NDGbICQzrfxevPXVoi1Zz5q/LTpG4JdbgGTOrAQAwAc
	ofe6eZBvhf1ITH+WYRRT7h4fMohlbK3gHdnW/WwTkUB4T6qoTILaN2tkMtNgTlPZOV5r1id9pMkfD
	05XmiJ1DthY1OXtWJZK0XSTlNYgqaYX3vvsEutN78/PnXLA4iJLWK9/o4R0je6sxRUBgIGZsxQHKe
	lffGf97C8Tc178Vo6G655A7hDwxpdWBjPX3uxFMbECu+3FL42/roDITAnsIGO2xAuCp7cag/dGz89
	1VC0dMDw==;
Received: from mail-24429.protonmail.ch ([109.224.244.29])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1whndp-00000009Bkv-3gZz;
	Thu, 09 Jul 2026 12:14:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1783599240; x=1783858440;
	bh=4yOipLOM76yQ4J1l/AoGPxGOwmes2/QBhbkzUXSfv48=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=oaCgmtiJpF5ov1O6PcsF8Zf62ipzpbQ7Vm29b3b1i/u5dBmBJ6lHSwDHrGwmTIDa/
	 E2iG2FFJ0zDl6HKwKoyMoIjK9Utt6IBaLP91AE/SA3dxbssEz0e0Hf3kmY7nDB2H8M
	 tprFTDpyy/+Zf8wwthgArRQykZPbvRG3UglthMv5WhSo3h29Wkm9bSg5h7oR6S09F5
	 4vc6Q6g3I+QqdSBz7W1d2XpZfq4wtSkIiu6m+Zzw3EcKzGiVQ78xTLfpGHi5pw2srA
	 rIHtQWbFiwIN/1I51YXx6aefwBjFZVpIQKzUkZwrVCE1tGZa1Ce4fM/jILtV3sqFMB
	 l4S0DWe8OpXcw==
Date: Thu, 09 Jul 2026 12:12:55 +0000
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] i2c: mediatek: fix WRRD for SoCs without auto_restart option
Message-ID: <GOZtJ6Ys4Syt4VaGQyJvmYEIe6dx97flmTygat-nc_gMwsKVrDaDOQjP2ZbX1Qqwx5PYjWo6rJwo-8H32NQQAQi4Z7x6y9wpBNyYea9liZA=@protonmail.com>
In-Reply-To: <0eb85793-5995-4177-9b04-338246d6979e@collabora.com>
References: <20260624-6572-6595-i2c-v1-1-9155cebaae20@protonmail.com> <0eb85793-5995-4177-9b04-338246d6979e@collabora.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: fbbc57c64a4c608f23b74d2008055f4ccc372fd6
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_131410_102845_A4E80DB3 
X-CRM114-Status: GOOD (  16.58  )
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

Hi AngeloGioacchino,

On Thursday, July 9th, 2026 at 2:46 PM, AngeloGioacchino Del Regno <angelog=
ioacchino.delregno@collabora.com> wrote:

> On 6/23/26 23:40, Roman Vivchar via B4 Relay wrote:
> > From: Roman Vivchar <rva333@protonmail.com>
> >
> > MediaTek mt65xx family SoCs have no auto restart, however, they still
> > support the WRRD mode in the hardware. Because auto_restart is set to 0=
,
> > the WRRD mode will be never enabled, leading to read errors.
> >
> > Fix this by removing auto_restart check from the WRRD enable path.
> >
>=20
> Are you sure that MT6577 and MT6589 do support WRRD?

Yes, I have checked their downstream kernels[1][2] and they both mention
WRRD.

We also tested mt6589 (privately) and the i2c was working. To be fair,
it had some other fixes, but at worst this patch is no-op.

mt6577 is a tough one... I don't think there's any recent kernel with
it. I plan to make it work with upstream, but that's a TODO. Either way,
vendor code has WRRD support.

> If you're not 100% sure, or you want to be careful (which I would, in thi=
s case),
> please add a `unsigned char wrrd_supported:1` to struct mtk_i2c_compatibl=
e, set
> it to `1` on *all* of the SoCs that support auto_restart (as that's effec=
tively
> a different feature - it just happens that all the ones supporting this a=
lso do
> support that, up until today), and add a new one for your MT6572, declari=
ng no
> auto_restart but wrrd_supported.
>=20
> That would make me sure that you're not breaking anything, and would guar=
antee
> you a R-b.
>

As far as I know, there's no SoC without both auto restart and WRRD.
Adding wrrd_supported that always equals to true sounds redundant to
me.

Let me know if you still prefer having separate flag for the WRRD.

> Cheers,
> Angelo
>=20

[1]: https://github.com/GoldRenard/lenovo_A390_mt6577_uboot_kernel/blob/38e=
a59263984e26c0dd8e5891b22a35f61e60ed5/mediatek/platform/mt6577/kernel/drive=
rs/i2c/i2c.c#L963-L975
[2]: https://github.com/bq/aquaris-5/blob/bc1d0d0e35c969670e2d869001be944ad=
0c9c5e5/mediatek/platform/mt6589/kernel/drivers/i2c/i2c.c#L728

Best regards,
Roman

