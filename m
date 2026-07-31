Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3091BC5516D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 12:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qeYDLVJO6z9LXain17/mTHxd8Oy2iz9/kyAW2nqshBE=; b=PWKhR2S5tZKlknE5dVOCGNA43l
	g8pV5et6aJ3k/VmNQKw6oR62xGKOrmUBIaHxQV8ESS3DaIdX7dAAY22OoCCsxLRMm/LaPloj7gg7Q
	XIczyakX+VPL6Ygjhot+IO83sDoArAlHnuWYYYyQJ0erodts2AFW5fN+dKos8M+vSlgbTGhKXFvTs
	4LAfCSbJOLedUzHqiU5CzvATMsKaGFWoZ3IwSXp5YjuW9kJfLEDJPD0anIGjmmxkMoC0tPFPYr2q3
	187wRonVJYXZgu4rv3H79I0WGNIukoC9JWTjvs4f9nNchsI1tyakrcL+0W79DjJiv1JhCszq68ZMN
	vOHU6y/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpmdk-0000000CWJZ-1jNT;
	Fri, 31 Jul 2026 12:47:04 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpmdh-0000000CWIr-2QKq;
	Fri, 31 Jul 2026 12:47:02 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1785502007; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OeH5Dy/FYVuYCKeZD7ETFLym30115pEeQHUK8EFerm9DGeQ17QG6HLRwLQqPxqj32SPgKoZjuEemD17T+fT8YwMt4uLYGB/RFRjCt5DZdV9ZfiXxsKXoyhw6XqMkH/TBjml+F3pqDCWKbcTxYU/99tFhYOpOMwsXa/suuQPa3iQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785502007; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qeYDLVJO6z9LXain17/mTHxd8Oy2iz9/kyAW2nqshBE=; 
	b=Ewia+hWSrcN8nuTb2/KWmsMrseOsS8uwlr/2pd4T1kd8bKpYrGL5QVZVPWTz3pNEvtRYNlBu/fzbDDuc18v8Z6+COCd+SvtydRNkOSHUPwzOsx1gGdnzqsSAJ3yNVyIDGLK7zTJn2LbWX6Up3sHTsb0dpmx9yIoRwz1CdRG450U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785502007;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=qeYDLVJO6z9LXain17/mTHxd8Oy2iz9/kyAW2nqshBE=;
	b=cFa/IwnbXsJs2SNpbXMcCYy/c9CCBJ5GGG7KgygXugBTT+QfT+3K3tPs/6FtIeNh
	rJ+d15WgPKIbO11Gw7GCMP9ONxaJ6bDwYiaMN+Ulp4rwcqH/yvAGLT9Y0Vdb6t+Gy5q
	1ZWqSl/sP13YAKfJkrrMuJLZ/3dfszRocuxjggbY=
Received: by mx.zohomail.com with SMTPS id 178550200445654.5554775503316;
	Fri, 31 Jul 2026 05:46:44 -0700 (PDT)
Message-ID: <86c8b2ba77f109b77f93b74b13dc1fa995b7d4f7.camel@collabora.com>
Subject: Re: [PATCH v10 03/26] dt-bindings: ufs: mediatek,ufs: Add mt8196
 variant
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
Date: Fri, 31 Jul 2026 14:46:36 +0200
In-Reply-To: <20260731-fanatic-zealous-inchworm-ddfe0b@quoll>
References: <20260730-mt8196-ufs-v10-0-bc5ecef202dc@collabora.com>
	 <20260730-mt8196-ufs-v10-3-bc5ecef202dc@collabora.com>
	 <20260731-fanatic-zealous-inchworm-ddfe0b@quoll>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_054701_671169_C75C38F6 
X-CRM114-Status: UNSURE (   9.82  )
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

Hi Krzysztof,

On Fri, 2026-07-31 at 10:27 +0200, Krzysztof Kozlowski wrote:
> On Thu, Jul 30, 2026 at 11:48:59AM +0200, Louis-Alexis Eyraud wrote:
> > =C2=A0
> > =C2=A0examples:
> > =C2=A0=C2=A0 - |
> > @@ -177,3 +192,33 @@ examples:
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mediatek,ufs-disable-m=
cq;
> > =C2=A0=C2=A0=C2=A0=C2=A0 };
> > +=C2=A0 - |
> > +=C2=A0=C2=A0=C2=A0 #include <dt-bindings/reset/mediatek,mt8196-resets.=
h>
> > +=C2=A0=C2=A0=C2=A0 #include <dt-bindings/interrupt-controller/arm-gic.=
h>
> > +
> > +=C2=A0=C2=A0=C2=A0 ufshci@16810000 {
>=20
> You already added second example. That's enough.
>=20
I'll drop it.

> Sashiko reports are valid.
>=20
the reports are indeed right about the missing supply description for
AVDD09_UFS_1 pin.

The MT8196 and MT88894 SoC datasheets do confirm they are different
supplies, so I'll add its description and also its handling in the
driver (in an additional patch) in the next revision.

I'll fix the typo (present since v3) as well.

Best regards,
Louis-Alexis


> Best regards,
> Krzysztof
>=20

