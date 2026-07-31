Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E012C5516D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 12:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zAhwrWMY6PvLC/P8M84L7525EvKre07drBqR9LRCx8A=; b=WAL94ZRpiRjskZ3G2n6UG91aKl
	rSzOvt4LXFf2fCdwrS81GdFlRCc4XRE98a/WbHoTu3jShsEifY0Oi46VD7edRgB8jyFmL9nmGYi30
	pOpwvZN1wlpeu/KD1iPQsb/jNmIfEezWO+1Hwi01rSYzFo4G92KSeHjHTiT8m4bf3c2ylRaEzEKLx
	ukTzzI/+q9UEWSEBvy40rSHjCuemhb9I21M5gSdh/2CC7146p05h+MsRV0nwW660nmZC0st9oQgz8
	oMePKl1INqr+7k6hDdD2Cj9WAbBCXnk3LKujZ4XslPPY2iLcMDosOCR/F9UlaZgfORVBdT/+ehwhC
	5yFf1gtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpmmC-0000000CWiZ-4BRa;
	Fri, 31 Jul 2026 12:55:49 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpmmA-0000000CWi4-2Ff6;
	Fri, 31 Jul 2026 12:55:47 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1785502536; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NAceC1nZ03Z8OJtT3c/AkcqWZgr6iyrkBVJVptqz1VI1XwcNZa5DUKJu2CuJO8K/6aH+uUpXT8xMYH0MA0kYdHATwK7tlzsgyozc/uiGdQYHzU71iVpB32hC91kPKVKU08a6HR2iZZnug91O2geOadZ7E65Uc7zB2Iy1jRwaCNc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785502536; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zAhwrWMY6PvLC/P8M84L7525EvKre07drBqR9LRCx8A=; 
	b=ex6DKoFlliJOmgcPdpT8RNRN+jpjfYz+mbeqTHrF3BFMyXYN2691fJROBKkKZaW5LOS0Xq34KSoe1b5HJkWtoW7LQ21D+v8L+xJg8pR5G0L2WFPZ0xAm6b5E38EDijVKIzNBZPe1F2uQnbiPI3agEnbkcLR8y1KrwkNkOpF8NX0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785502536;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=zAhwrWMY6PvLC/P8M84L7525EvKre07drBqR9LRCx8A=;
	b=E5hGGX8nJlFV4riMFbzQfwVYLjS+jFZyeZtpkU8eqm8AHTNUVc3Nk5lYPYk/G20m
	uRZPT2CBMnSHVw4riWDfmAw3RHLX3ib58YjKzTibCNPgZlbdWvLIL4bMUMnwZ1B+9zs
	w8BEK0diuqrVdbbMbZVulLYAM9BLKWAdGxBaaG0U=
Received: by mx.zohomail.com with SMTPS id 1785502535132267.4450717048104;
	Fri, 31 Jul 2026 05:55:35 -0700 (PDT)
Message-ID: <d418ce620a6128d7dac0c8e56f2a07653e5d035e.camel@collabora.com>
Subject: Re: [PATCH v10 24/26] arm64: dts: mediatek: mt8195: Align ufshci
 node to dt-bindings changes
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
  Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger	 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>,
 Peter Wang <peter.wang@mediatek.com>,  Chaotian Jing
 <chaotian.jing@mediatek.com>, Alim Akhtar <alim.akhtar@samsung.com>, Avri
 Altman	 <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>,
 Stanley Jhu	 <chu.stanley@gmail.com>, "James E.J. Bottomley"	
 <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen"	
 <martin.petersen@oracle.com>, Philipp Zabel <p.zabel@pengutronix.de>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 kernel@collabora.com, 	linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, 	linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, Nicolas Frattaroli	
 <nicolas.frattaroli@collabora.com>
Date: Fri, 31 Jul 2026 14:55:28 +0200
In-Reply-To: <20260731-curious-unnatural-octopus-cef3e9@quoll>
References: <20260730-mt8196-ufs-v10-0-bc5ecef202dc@collabora.com>
	 <20260730-mt8196-ufs-v10-24-bc5ecef202dc@collabora.com>
	 <20260731-curious-unnatural-octopus-cef3e9@quoll>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_055546_646242_93291320 
X-CRM114-Status: GOOD (  17.37  )
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

Hi Krzysztof,

On Fri, 2026-07-31 at 10:28 +0200, Krzysztof Kozlowski wrote:
> On Thu, Jul 30, 2026 at 11:49:20AM +0200, Louis-Alexis Eyraud wrote:
> > The MT8195 UFS host controller dt bindings now describe several
> > extra
> > required clocks that were previously missing from clock description
> > and deprecates the freq-table-hz property use in favour of
> > operating-points-v2 instead.
> >=20
> > Currently, the ufshci node declares the freq-table-hz property but
> > all
> > values contained in the array are zero, thus converting it to an
> > OPP
> > table is not needed.
> >=20
> > So, add in ufshci node the rx_symbol clocks in clock list and
> > remove
> > freq-table-hz property.
> > Also reorder properties in node.
> >=20
> > Signed-off-by: Louis-Alexis Eyraud
> > <louisalexis.eyraud@collabora.com>
> > ---
> > =C2=A0arch/arm64/boot/dts/mediatek/mt8195.dtsi | 21 ++++++++++---------=
-
> > -
> > =C2=A01 file changed, 10 insertions(+), 11 deletions(-)
>=20
> DTS must not be combined with patchset targetting SCSI/UFS, because
> UFS
> folks were grabbing entire thread. Please follow the same rules as
> when
> submitting to USB, serial etc.
>=20
Ack.
I'll drop the 3 devicetree patches in the next revision and send them
in a new series.

Best regards,
Louis-Alexis

> Best regards,
> Krzysztof
>=20

