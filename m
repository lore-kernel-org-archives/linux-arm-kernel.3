Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98D2C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 14:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3LDQcD87Wri+XCeuQushsbc9uN7RNaVkwTY6s9v+ves=; b=YfnaaVFkSECdRHdcbHDtzpWEqQ
	moOE2O0EfGkGyR1m4UhRbF0B68H/brA8SBZGYU52uSkthfyQGWoohjtJXNhRZq02iI6dle9GjXBig
	VLa5O5NyJBJHVO3dyX3Av+/VZoupiGpjBcCXckwEKW9ciPVUgaZPQGhcQPbxCIfVnxY1br9dSs1Vo
	aPpRV2jLwugt2s1hT4u265HXOdzQUotejEB/YVXNa/ZARKYGd0h4Z4dvRPoMqZqubB9SzaD4SQNmF
	Bg07bpMVmX5Un7iU/4Y6QohpkJrn5TVm0dAUUNf9eZX1kabfn7roJZ/xCmwpsbN/we18KbVRCxzXQ
	LXDD0smQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4WR-00000005syZ-2U92;
	Tue, 24 Jun 2025 14:21:15 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU42j-00000005mPh-3T7S;
	Tue, 24 Jun 2025 13:50:35 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1750772999; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HLWWqkzJBSCO02jmpwtlHthMZkWiBpHDnf9cvDr3XP5JhIgB6ehWRY6etS5qQ3U2jqmFx34awjXzhso7eJFhX5EOhiqfJ5ZHmGnnra78heE07TXhd/wG+BEhJe5hzhKDNHPt3riYBEsBLtGJ9QZMfxmv2RLtAzE4AYibe1ZdM74=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750772999; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3LDQcD87Wri+XCeuQushsbc9uN7RNaVkwTY6s9v+ves=; 
	b=HXugNEJocg/1EDbe7DPsj2aiYUr7PPRE9V/OktHI8VLRCLiHt6ulZqwUXlKgCvC40ROmSVEekb39878ixPgRwXvU+XRpAIVHfoJvEIMHdQl6WcD5OnlNkPkT1alb0WVDbMFLkubaEO9/YPBiBnnPXE/Vm0m1kFZfB4xDIa4hIAg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750772999;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=3LDQcD87Wri+XCeuQushsbc9uN7RNaVkwTY6s9v+ves=;
	b=ASSplS6QQZVezYgDHp0gixP86wG7iGU3qlgQy9LSg316kfeJOzDAHHmJ77C+IPG4
	avXEF0Po3g0xyJmam+yzmlcU/Vu6RfmZYxRd9o41SfeVhbpRrHWzGSJj3E/eistQYDT
	y/I66yC7rRH7qlu2Zui/copKRLnoQL2WGKqCNH1k=
Received: by mx.zohomail.com with SMTPS id 175077299645558.67407326984835;
	Tue, 24 Jun 2025 06:49:56 -0700 (PDT)
Message-ID: <52bcdfcfe84db4be9eeb7b7ebe926e990e460c03.camel@collabora.com>
Subject: Re: [PATCH 0/3] Add MT8196 compatibles to bindings
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	devicetree@vger.kernel.org
Cc: qii.wang@mediatek.com, andi.shyti@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
 gregkh@linuxfoundation.org, jirislaby@kernel.org,
 daniel.lezcano@linaro.org,  tglx@linutronix.de, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,  linux-serial@vger.kernel.org,
 kernel@collabora.com
Date: Tue, 24 Jun 2025 09:49:24 -0400
In-Reply-To: <20250611110800.458164-1-angelogioacchino.delregno@collabora.com>
References: <20250611110800.458164-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_065033_966071_435B7BAB 
X-CRM114-Status: UNSURE (   6.32  )
X-CRM114-Notice: Please train this message.
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

On Wed, 2025-06-11 at 13:07 +0200, AngeloGioacchino Del Regno wrote:
> This series adds compatibles for MT8196 (Chromebooks) and MT6991
> (Smartphones) for HW that is fully compatible with older SoCs.
>=20
> AngeloGioacchino Del Regno (3):
> =C2=A0 dt-bindings: timer: mediatek,timer: Add MediaTek MT8196 compatible
> =C2=A0 dt-bindings: serial: mediatek,uart: Add compatible for MT8196
> =C2=A0 dt-bindings: i2c: i2c-mt65xx: Add MediaTek MT8196/6991 compatibles

For the whole series,

Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

--=20
Thanks,

N=C3=ADcolas

