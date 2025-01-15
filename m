Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70341C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 23:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+v6KUQgir/lgW530jnyh5w9zw2n5D+uMgB/N437EbSI=; b=ejiW2VrtZc0TLW0RlgvAnfUwNY
	l7XiF/f2/pp4HIBcHkotwAgbpNhzEH4p497z34HG9Omjll5Oqj4E9tSytds5TjN1uaJHVPUxJnn3l
	V/3b9OPj7kwZ/eOKlQCXgtRxi6jbv6QQg1yI9vWe3q2DDSU/Xn74INGVJHPUg4dsm5u6M2xCY57MC
	3fIJ1XKy9OSwFfWaX3iQMAHYWlAQNAFEB8tIT9j10aig/YIdaH2yvNfmj5nSrRN5J3GQhZPd97qN2
	INsRH0R4XEuMG7PbD0euiiWqGlHg3W0OnizQMBGEc3FQGXocMR6uh0wzBxINpDaWOa+Dcm7oIXjqa
	chojsXDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYCdh-0000000DKcJ-1HcY;
	Wed, 15 Jan 2025 23:17:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYCcQ-0000000DKVB-2Dmx;
	Wed, 15 Jan 2025 23:16:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8580FA42643;
	Wed, 15 Jan 2025 23:14:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26B33C4CED1;
	Wed, 15 Jan 2025 23:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736982973;
	bh=3zIKod6x6p/3kPY13t63j93xA6NahssLaW2A/NKgW4I=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=iHehGmGFX02DEW3nQTnGkhXM3MgDB5BxaPXg/ZluMx1nwHpBdHNp7iK2MZSo2+G/h
	 fCmL/jNkHgrnqULTGDoiVwSZlH80YJhYETrtmNkpcxAkjl4xdsJxVkhq+wQEDNe0EV
	 6PYXvXBZKgB/LGGvnqQFA7y+TNGQpf/k0EPywX68pHReUY6FkjYGIAAgPNHanXDGSY
	 +yPJR7WV2E6d0NCaNXSf6dCPS07vGkeLyoweLNZ19XvqV1qF+MTyT9+hy30jloN4Vp
	 ZdpQvMRPaDnHexGYDqqfv44uLBzYQxfYlC2dsdpw2+fz8A7RSo519PFSaHSP3fOFOy
	 GwkUA7NphGP4g==
Message-ID: <848b4dad4f38dc6545b97f7c5007e514.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <91e2bd5b-71fa-402a-82cb-e68d3295804a@gmail.com>
References: <20250113-topic-spmi_node_breakage-v2-1-dd35a3a6daa6@oss.qualcomm.com> <5b139af8d639e20a14c8bd00e8e03a4a.sboyd@kernel.org> <58cb6c37-0ea0-4866-a2b1-92cb0f0391a7@gmail.com> <305d7cf5f0a66efc01181f24d3a288d3.sboyd@kernel.org> <91e2bd5b-71fa-402a-82cb-e68d3295804a@gmail.com>
Subject: Re: [PATCH v2] spmi: Fix controller->node != parent->node breakage
From: Stephen Boyd <sboyd@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan+linaro@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, Konrad Dybcio <konradybcio@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date: Wed, 15 Jan 2025 15:16:10 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_151614_639010_ABFFF771 
X-CRM114-Status: GOOD (  15.56  )
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

Quoting Konrad Dybcio (2025-01-14 12:37:20)
> On 1/14/25 19:30, Stephen Boyd wrote:
> >=20
> > Ok, I see that I was reading the already reverted state of the tree
> > where the 'ctrl->dev.of_node =3D node' assignment came back. So there's
> > nothing to do besides drop the patch in fixes, which I already did. We
> > can then apply this patch to drop the duplicate assignment as a cleanup
> > and to avoid a refcount bump on the of_node that isn't needed.
> >=20
> > ----8<---
> > diff --git a/drivers/spmi/hisi-spmi-controller.c b/drivers/spmi/hisi-sp=
mi-controller.c
> > index 3cafdf22c909..122140b97579 100644
> > --- a/drivers/spmi/hisi-spmi-controller.c
> > +++ b/drivers/spmi/hisi-spmi-controller.c
> > @@ -300,9 +300,6 @@ static int spmi_controller_probe(struct platform_de=
vice *pdev)
> >  =20
> >       spin_lock_init(&spmi_controller->lock);
> >  =20
> > -     ctrl->dev.parent =3D pdev->dev.parent;
> > -     ctrl->dev.of_node =3D of_node_get(pdev->dev.of_node);
> > -
> >       /* Callbacks */
> >       ctrl->read_cmd =3D spmi_read_cmd;
> >       ctrl->write_cmd =3D spmi_write_cmd;
>=20
> That works for me, thank you
>=20

Joe, care to send this patch to replace the one you sent previously?

