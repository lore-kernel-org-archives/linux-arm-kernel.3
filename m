Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635DEC4452B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 14:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rIUH7Om9TP2+of2IvSjo/klnvZLvL7VmTwo2Br+NlKo=; b=ayvKMXG74kwa5wWFIyzcbtZyHU
	g8IRrLiY+ir0gVqB9dPoqW/QaJHossxPjDZu9hV6gr+G4hzaPn8JRFvho5VES9xMm9rQNctoTAOTK
	juE/3Nk/OAOxsNlLdefovCHiN7bcfCaaTiCTb+Dt26S6BOuHUbLj8GLsyGoYF2f+EF8GUPlCE/8n9
	0ogZl3I21RTgkcBXfWuW5H6kv7M+47aUGFIhS0iPdhqaewFAPyKW0tmnwCJG/dqNpy0d7VjZxrwMi
	Py+M0fXnrPdIh74yV686oIiP1J9JcTs0er449AyK8z4OQdwyWOXiFiHgrktrTmAHSrJlh2idOWYXW
	Kvg04yxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wloZn-00000006tm3-0Jf4;
	Mon, 20 Jul 2026 14:02:35 +0000
Received: from mail-106101.protonmail.ch ([79.135.106.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wloZe-00000006tiE-2Zj0;
	Mon, 20 Jul 2026 14:02:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1784556142; x=1784815342;
	bh=rIUH7Om9TP2+of2IvSjo/klnvZLvL7VmTwo2Br+NlKo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=hwEE0MCsp7FnCerQellLJy8FpDFGVQXkX4vQTSxjrPXlncsc5q2SalY289x8k9coU
	 Sq985az+qLP64nhKhah3CKZh9bXBpJDtWHq448LfjvW/WbVaJ4xa4csjupjS0lF6N+
	 J3SFsgpUrxrXmew/xT7y17M3+3IuN08/YK/FDOKjtbf8p6R6/hEIWk6JiKEsxFK8YC
	 F8yWwhZFM8CAn8W2N7+eN3ld7FbRZQLi9RgUbpAayiocNUIgD4zUfMVXgm2Wa99bNn
	 +lcRzSk/gvxeOETXA7oAkzqBSTyae8bRZqDfxbPBB1dXl18A36/p6tK8IBpEQnEXit
	 m0R/6BqSv5uzg==
Date: Mon, 20 Jul 2026 14:02:16 +0000
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Lala Lin <lala.lin@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] nvmem: mtk-efuse: add support for 32-bit aligned reads
Message-ID: <fjbTxmhINpeE9M-4eyCFuhueFEH1J4fJBRN90DeIFMEfvxbwx8XeTLnkLsSDq2nchJJFFZxUe_SUNQuGWUDiB4taXJ5lRkLUhT1C_i3L8Rw=@protonmail.com>
In-Reply-To: <c2b85740-4372-4609-a9fa-930010f5296a@collabora.com>
References: <20260715-6572-nvmem-v1-0-9c13be99d077@protonmail.com> <20260715-6572-nvmem-v1-2-9c13be99d077@protonmail.com> <c2b85740-4372-4609-a9fa-930010f5296a@collabora.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 3ea465e119018711fb21346ca626e34fdfdfec16
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_070226_813521_C9D09304 
X-CRM114-Status: GOOD (  10.99  )
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

On Monday, July 20th, 2026 at 3:48 PM, AngeloGioacchino Del Regno <angelogi=
oacchino.delregno@collabora.com> wrote:

> On 7/15/26 16:27, Roman Vivchar via B4 Relay wrote:

...
=20
> it's easier at this point if you simply do
>=20
> =09if (pdata->needs_aligned_read) {
> =09=09econfig.stride =3D 4;
> =09=09econfig.reg_read =3D mtk_reg_read_aligned;
> =09} else {
> =09=09econfig.stride =3D 1;
> =09=09econfig.reg_read =3D mtk_reg_read;
> =09}
>=20
> and you avoid touching mtk_reg_read entirely.

stride =3D 4 means we can't do something like reg =3D <0x1 0x1>;
For example, CPU speedbin is sitting at 0x181, but we can model that as
0x180.
cpu_speedbin: cpu-speedbin@180 {
    /* This is technically reg =3D <0x181 0x1> and bits =3D <0 2> */
    reg =3D <0x180 0x4>;
    bits =3D <8 2>;
};

I'm not sure what are mediatek preferences in the devicetree since
things change quite frequently... Downstream never triggers this hw bug
because it uses readl everywhere for each efuse.

I would keep the stride =3D 1 so we don't need workarounds in the DT, but
the reg_read indeed sounds better :)

Let me know if you have any objections.

Best regards,
Roman

