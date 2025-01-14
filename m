Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FD2E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 18:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3f1LwfpsuxGFM6Ddbf631zkX1gdyIWY+1JlKXodGmk0=; b=TsFwjgnGtsP6CARI/UZQKnlT4x
	mrtHX6sj7RwDahsskEsIhFA+JOYZvC0i6v+qxdQfDBKqFQ4CMxtp0ghta9uvCG46/bb6/jZ+tgzI9
	uOiD8up6uqnb6C1bHsuY3EYqjKOVA/x77csx2MmUCTvdBlSyuLsEN5HoAPTf1Y79LsKOVs2LdYWPm
	Eaek0gZP31TnS7oqGb1lZwMqQ2vSQSwm+urcONdRLd0VcsbNptPCI59vzREJv0PQ90ngOEi1364c+
	G8XV+SB+ECIz9xlBGqew5FQR6+2gSqeswMvDQkBD72WWGjBYzoVVR2iyGqhVf4qm0P2lvEEX72Oge
	k1yfmDCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlhZ-00000009QpW-3Rut;
	Tue, 14 Jan 2025 18:31:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlgH-00000009Qgg-2alH;
	Tue, 14 Jan 2025 18:30:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:To:Cc:From:Subject:References:
	In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3f1LwfpsuxGFM6Ddbf631zkX1gdyIWY+1JlKXodGmk0=; b=JDDWdfM/1iwnjOrHfU7DCmY6xR
	0jML6oUo9S02lyrZN47TWA86koklDpQc8MckCKAJWnhc7adFfX6FYafKqActhfgOFXMFWGvfrSQfU
	21jvqqOSUgM24muuvAuoToyUF30biHGfeq9/xfBOJr98GgIcY/nYelMGLsnikWTB3MSD2Wn8svAVn
	z010VRplpTWDFK9jd5l06H8dmTTHqTINFR/yOUKUpPUKoF3XRBtor4DPnoEpBXCxY0izGbURE+yOQ
	w7P9A6Q91+5Qbeds00D8csPq6yJXhnLGnbz8lH6lx2imqCXsAji5CyK9OkmKBHlQBv1CsyR4tXhLW
	0auUkkiw==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlgE-0000000AY14-3PHA;
	Tue, 14 Jan 2025 18:30:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4029BA41B50;
	Tue, 14 Jan 2025 18:28:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED529C4CEDD;
	Tue, 14 Jan 2025 18:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736879419;
	bh=Q6ym6NiTLX94Js/7c4QLFam1iJe5mEF/nkdB0iOKssw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=YN+FKONNKlXuatiYAuftdvXRxbCPQSv4up3Z4rbgCr5xQXIQ5x2T7y6KECjevJsDG
	 M8Dz9i8yNyMoCU18t9kqDtHSoE6O0oOVwopYMIWkTY9cPmGvYooaG7uMUXG6whA51D
	 7030/sVD7z7dsL7DzzfePua7d/EKFX/GfZG32wMzZ+UiKIqDOJQjh1HkywCrFyhhCh
	 C4XvPgW51gSd8x30LWGvoMd+rEW/GJFpfbIHVl7UCiKC5wRu5ecOm7reg2FlQ6gN6C
	 M5yjc7OxX/4YsghbuW5UpZ44IPY3c6qvBD3pIuBbRqV+ymVUmNd4qH9UH6i4UAik1Z
	 vz/arfe4cXuNg==
Message-ID: <305d7cf5f0a66efc01181f24d3a288d3.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <58cb6c37-0ea0-4866-a2b1-92cb0f0391a7@gmail.com>
References: <20250113-topic-spmi_node_breakage-v2-1-dd35a3a6daa6@oss.qualcomm.com> <5b139af8d639e20a14c8bd00e8e03a4a.sboyd@kernel.org> <58cb6c37-0ea0-4866-a2b1-92cb0f0391a7@gmail.com>
Subject: Re: [PATCH v2] spmi: Fix controller->node != parent->node breakage
From: Stephen Boyd <sboyd@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan+linaro@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, Konrad Dybcio <konradybcio@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date: Tue, 14 Jan 2025 10:30:16 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_183023_101549_52AAE04F 
X-CRM114-Status: GOOD (  24.20  )
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

Quoting Konrad Dybcio (2025-01-13 14:12:28)
>=20
> On 1/13/25 22:52, Stephen Boyd wrote:
> > Quoting Konrad Dybcio (2025-01-13 05:02:58)
> >>
> >> Make controller->node specifiable to both benefit from Joe's refcount
> >> improvements and un-break the aforementioned platforms.
> >=20
> > How is it broken? I see spmi_pmic_arb_bus_init() calls
> > devm_spmi_controller_alloc() which sets the of_node to the parent device
> > and then spmi_pmic_arb_bus_init() overwrites that with
> > 'ctrl->dev.of_node =3D node' later on in the same function. That will
> > cause one more of_node_put() than is expected. I don't see that removed
> > in this patch though, so the leak is still there?
> >=20
> >>
> >> Fixes: 821b07853e32 ("spmi: hisi-spmi-controller: manage the OF node r=
eference in device initialization and cleanup")
> >=20
> > I've dropped this patch from my queue. I don't know if we're really
> > doing anything better by managing the of_node lifetime in that function
> > vs. letting the callers assign the node they want and manage the
> > lifetime themselves. Maybe we don't need to do anything? Presumably the
> > parent device driver will unregister the controller anyway, so the
> > lifetime of the of_node will be ensured regardless. For subnodes like
> > qcom SPMI, the subnodes are child nodes of the parent device so they
> > won't be removed. If they are dynamic nodes, then the caller can manage
> > the lifetime.
>=20
> Stephen, the wrong node gets assigned in the qcom driver with
> multi-master controllers, resulting in probe failures.
>=20
> Since the introduction of the commit referenced in fixes,
> of_spmi_register_devices() sees the controller's subnodes
> (which describe each of the two masters) as slave devices
> - meaning no "real" devices ever get to probe
>=20

Ok, I see that I was reading the already reverted state of the tree
where the 'ctrl->dev.of_node =3D node' assignment came back. So there's
nothing to do besides drop the patch in fixes, which I already did. We
can then apply this patch to drop the duplicate assignment as a cleanup
and to avoid a refcount bump on the of_node that isn't needed.

----8<---
diff --git a/drivers/spmi/hisi-spmi-controller.c b/drivers/spmi/hisi-spmi-c=
ontroller.c
index 3cafdf22c909..122140b97579 100644
--- a/drivers/spmi/hisi-spmi-controller.c
+++ b/drivers/spmi/hisi-spmi-controller.c
@@ -300,9 +300,6 @@ static int spmi_controller_probe(struct platform_device=
 *pdev)
=20
 	spin_lock_init(&spmi_controller->lock);
=20
-	ctrl->dev.parent =3D pdev->dev.parent;
-	ctrl->dev.of_node =3D of_node_get(pdev->dev.of_node);
-
 	/* Callbacks */
 	ctrl->read_cmd =3D spmi_read_cmd;
 	ctrl->write_cmd =3D spmi_write_cmd;

