Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC2AC02183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 22:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KH6oO3HRjkRWsXJpPDLo/v6p0AF6PKyuV+iZaYo1IHk=; b=YUlMMlY/3y9bvi0locbskG6lG8
	p1GY/oe71YmZ7UiBzpUha2cnWb5U7xf8AyUhUtYoGFWcm6YFEh5ktpptbg31XnObgkizLtVovUrxX
	8AXZ/4Qt7v5OmMyRqXjuN43KQ4YOIAkWvkzcFag86rUQWCFXXSe94hg8zklXwRfrMM1cWwA9LoCpk
	8RPnke1FSjisBqIR12UDoBg29N9GbK4TAd3HVASQTYqC1cQeLDAZ25l2SHQChv4+PY7hODnRMtET3
	4ldkXQs4g5N/A0ewd38LFVT7M3tse6LcA7pCKAn6kufHRhFWF5eku26lL+RlW3TCCzCwKNmZp/A3B
	eNJ8KZsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXSXH-00000006lDe-0m9t;
	Mon, 13 Jan 2025 22:03:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXSMd-00000006jYh-44by;
	Mon, 13 Jan 2025 21:52:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7F7B65C53B6;
	Mon, 13 Jan 2025 21:52:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE709C4CED6;
	Mon, 13 Jan 2025 21:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736805171;
	bh=lqRXAoXBKW4gFS0Jtek0gypvT9cjk5SylvVOg20JUA4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=iVCJ5jPoWdQ8U4RVlbfiLnCP+Kmg2OM0YPEifRYUCun7oHE5IpE6zApYDve5HBkYe
	 CRqAene4BGmE5Mw2wi7fd59nJvan4sQ0NhNbj3+1KLFsaLHkJCsiW2A42r70ES3lNp
	 ch3x0z7PEwKxCfk4JLY+qBdgxwkSKacBUTFD0VkxPWnADdmKIMxTXeKUTX7HiA7g3G
	 s9hK/NzNNRYyS4gkKtpveiNl3GVklBxd3IaLN15jP2ZAOfM5CtSK4AwkNNj6XRgAm5
	 4l66FKAqVaAYmv5ZAvpgySwy5OHXWjELUklX1YogkNhZWRdQC5sSl5gAfzkftF0Ogv
	 a3kNXM3/OJyvQ==
Message-ID: <5b139af8d639e20a14c8bd00e8e03a4a.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250113-topic-spmi_node_breakage-v2-1-dd35a3a6daa6@oss.qualcomm.com>
References: <20250113-topic-spmi_node_breakage-v2-1-dd35a3a6daa6@oss.qualcomm.com>
Subject: Re: [PATCH v2] spmi: Fix controller->node != parent->node breakage
From: Stephen Boyd <sboyd@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan+linaro@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, Konrad Dybcio <konradybcio@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date: Mon, 13 Jan 2025 13:52:48 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_135252_054227_86C98482 
X-CRM114-Status: GOOD (  12.97  )
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

Quoting Konrad Dybcio (2025-01-13 05:02:58)
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>=20
> On some platforms, like recent Qualcomm SoCs with multi-bus SPMI
> arbiters, controller->node must be assigned to the individual buses'
> subnodes, as the slave devices are children of these, like so:
>=20
> arbiter@c400000
>         spmi@c42d000
>                 pmic@0
>=20
>         spmi@c432000
>                 pmic@0
>=20
> The commit referenced in Fixes changed that assignment, such that
> spmi_controller_alloc() always assumes the PMICs come directly under
> the arbiter node (which is true when there's only a single bus per
> controller).
>=20
> Make controller->node specifiable to both benefit from Joe's refcount
> improvements and un-break the aforementioned platforms.

How is it broken? I see spmi_pmic_arb_bus_init() calls
devm_spmi_controller_alloc() which sets the of_node to the parent device
and then spmi_pmic_arb_bus_init() overwrites that with
'ctrl->dev.of_node =3D node' later on in the same function. That will
cause one more of_node_put() than is expected. I don't see that removed
in this patch though, so the leak is still there?

>=20
> Fixes: 821b07853e32 ("spmi: hisi-spmi-controller: manage the OF node refe=
rence in device initialization and cleanup")

I've dropped this patch from my queue. I don't know if we're really
doing anything better by managing the of_node lifetime in that function
vs. letting the callers assign the node they want and manage the
lifetime themselves. Maybe we don't need to do anything? Presumably the
parent device driver will unregister the controller anyway, so the
lifetime of the of_node will be ensured regardless. For subnodes like
qcom SPMI, the subnodes are child nodes of the parent device so they
won't be removed. If they are dynamic nodes, then the caller can manage
the lifetime.

