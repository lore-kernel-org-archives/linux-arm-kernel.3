Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5070EC0485
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 10:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hV7pmbruCuv2YT3GXeR/WB6MvDM5iYmpBJg+CzfkEy0=; b=Vop1AmdjZ1txLfQX+aZR+Iymfh
	zcSDdbLClP/jKu2EILdanGUAmOwZay9A5uwuCPDIhf2olFdhSZ3JKXA1zNu0fv7LiI4zVUAcwjqFu
	wOEwTpjnhS74nhvADA1Bl5z70rKDvoZoTw8W5P3X1EA8BeKt2rzO5lfnn9fSLgeyhgDvqTpd4J95X
	kwoTGeHFxpHyLoV0T4H5Gjb1Wbu0nNj/yj6lk4WUzPRNldKiqPFl0afbg4QAEGth0XIazDYyh7d8W
	yJ87UNBeFdXhZ200WZ2iB/hjJPqGe311/89F6GJjcrpOamh4DY/+r4r6ArH9QJ/yqrmErwKiCrryq
	/DQGoPww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxMnV-0000000EwyT-0nvp;
	Tue, 03 Mar 2026 10:16:13 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxMnT-0000000Ewxw-2V5n;
	Tue, 03 Mar 2026 10:16:12 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1772532960; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ld3WEFmDwMm4C8fsVqUW9jEYfexkJC1pErlxbI/bd/u9wIjtVtvEVj8KmR0gRsm98qMtTP6QY8zJumJp5cYAbNZWQ35InHNDLhk/8GhbAljJwLPwqVX4HhwIgZCxfoTb6rKos4yI3CDdMlV0qY8RELcbxWOIMcCzdIgBitH8UZQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772532960; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hV7pmbruCuv2YT3GXeR/WB6MvDM5iYmpBJg+CzfkEy0=; 
	b=JtfUa7LseAVWU3UlSAtrwverfSpUtmpCjPEyafLJjiAK3vZ00o/14AaNVB0IC70ImJhgp7ji1aDL4FQEazN6WfPdPiJdPZoBhN524W9lLhn7hANpCraR/BdYv3XF6P96rXwCvpIsHE6aZPmY1cRXTN3ltHcCNeu19Hcogp4glyY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772532960;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=hV7pmbruCuv2YT3GXeR/WB6MvDM5iYmpBJg+CzfkEy0=;
	b=F5qPoP+y66wlCndzg6MYVKVtavNrhdcVXA/icpMvQ4iG7XzaZ+AdmtKjIhnioEfD
	CCg27jDedafjWLNPBfBCXN9pwPOraOvLcdYQVMKXZobzVBaGUxoDNoAY8wYQgSKj33g
	tDgvFKaUVkCZ8FpdhOGOEpFy3i1HslBStZudJQac=
Received: by mx.zohomail.com with SMTPS id 1772532958810282.7970747621265;
	Tue, 3 Mar 2026 02:15:58 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: "chu.stanley@gmail.com" <chu.stanley@gmail.com>,
 "robh@kernel.org" <robh@kernel.org>,
 Chunfeng Yun =?UTF-8?B?KOS6keaYpeWzsCk=?= <Chunfeng.Yun@mediatek.com>,
 "kishon@kernel.org" <kishon@kernel.org>,
 "James.Bottomley@HansenPartnership.com"
 <James.Bottomley@hansenpartnership.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chaotian Jing =?UTF-8?B?KOS6leacneWkqSk=?= <Chaotian.Jing@mediatek.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 Peter Wang =?UTF-8?B?KOeOi+S/oeWPiyk=?= <peter.wang@mediatek.com>
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 "kernel@collabora.com" <kernel@collabora.com>
Subject: Re: [PATCH v7 20/23] scsi: ufs: mediatek: Back up idle timer in per-instance
 struct
Date: Tue, 03 Mar 2026 11:15:51 +0100
Message-ID: <3072176.mvXUDI8C0e@workhorse>
In-Reply-To: <0bef3e1592e64f74e6a6fd8ef59129ac71b307e4.camel@mediatek.com>
References: <20260216-mt8196-ufs-v7-0-b5f2907c6da7@collabora.com>
 <48e8f40b-f5f3-42b5-a97b-7a25d1dc0fb8@collabora.com>
 <0bef3e1592e64f74e6a6fd8ef59129ac71b307e4.camel@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_021611_689149_0428CD6A 
X-CRM114-Status: UNSURE (   8.79  )
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

On Tuesday, 3 March 2026 09:01:14 Central European Standard Time Peter Wang=
 (=E7=8E=8B=E4=BF=A1=E5=8F=8B) wrote:
> On Thu, 2026-02-26 at 11:36 +0100, AngeloGioacchino Del Regno wrote:
> >=20
> > Okay, does "saved_auto_hibern8_idle_tmr" sound good for you instead?
> >=20
> > Regards,
> > Angelo
> >=20
> >=20
>=20
> Hi AngeloGioacchino,
>=20
> I=E2=80=99m fine with saved_auto_hibern8_idle_tmr, but it is more=20
> verbose compared to saved_ahit.
>=20
> Thanks
> Peter
>=20

Yeah no I won't change this, this is pointless bikeshedding.



