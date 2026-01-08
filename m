Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B682DCF6A8B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 09:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bl8Y617sotQ73GVR2T1Q+Wa4KgXyXDvatmz5tMSVID0=; b=TyHF2OnZZaaiFJBIhVivt1ariL
	03X3pRki+qI7DNZQdJf4KMtOH8EYJYIIIx1Nt8lyoxF5U0K7fw7V6rE7skT3gkRfQURUIszVG3v3D
	pVggCR/gicb50c4Gws1b7gNPvrUFfdNvSHZYj9L3NuoRAlhQ737Xc2UaMDyLQ/BaLaWuxL2R6NfPc
	TFdnPAJFGLKkYDOek0FwkpPa3PNKTSUTrSiag5CB7uzbErLLuioT9k5iBCHRgmiOlWPwRPcdFLlD/
	aoKETapRNRCKQ7v7D7C8HMNRHruWZyiaXiCPOiiqijc1gvOjAJNi7t6rFCslT45oehiLKEdmJ6HOU
	BGoji7Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdmJt-0000000GSnl-08bl;
	Thu, 08 Jan 2026 09:28:41 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdmJr-0000000GSmn-0mjC;
	Thu, 08 Jan 2026 09:28:40 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1767864492; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cRYqTaLZu9/Cz2hhALQrG+OnVMloqPR07D0g1j0Oj9gkB4WLvXduBwrjy3/Wrhd7HTdNahdARXVh3jZkJXhrahAbGx2emEh0OkPisxok95vWOGzXFxQwP3XSRadmpuwr7ZYfUofpWWFfDgjjvvoAYNt7v0R8LFHb53fxacceiPA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1767864492; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Bl8Y617sotQ73GVR2T1Q+Wa4KgXyXDvatmz5tMSVID0=; 
	b=V2NJcv8cA0trLQndvEx48Dgk0YZc9ADKFw6EoIY0bseVk0qkxp4ze4zlhtsFMh1lQsxO7Rq6n5Jf31OvLVvRsYvmUpD8b9BOVpB63CuDVgkCWQRUuQnb+kztY7fbwZTxN8FiOE4MVob+48K6Z/EBH/Od85N0aIfALnHE8DAr2Oc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767864491;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=Bl8Y617sotQ73GVR2T1Q+Wa4KgXyXDvatmz5tMSVID0=;
	b=EMi4YlvrwckuoEXWDPE+n0476n6VI0HuybuzhMEgHluL/U0bj8xY8nYDWEvDWeqU
	DocuVYtiK0A/HWw/vhT9xhQ6ClQ+SJPEblKV28C7BZ2NuAmZT1L+tk9xXQqt7R/a7+k
	7F1/FjbybBegbC6pPGEQ6eT0VbpqCIHSzPEgsrS8=
Received: by mx.zohomail.com with SMTPS id 1767864489427365.0551721336526;
	Thu, 8 Jan 2026 01:28:09 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: "chu.stanley@gmail.com" <chu.stanley@gmail.com>,
 "robh@kernel.org" <robh@kernel.org>,
 Chunfeng Yun =?UTF-8?B?KOS6keaYpeWzsCk=?= <Chunfeng.Yun@mediatek.com>,
 "kishon@kernel.org" <kishon@kernel.org>,
 "James.Bottomley@HansenPartnership.com"
 <James.Bottomley@hansenpartnership.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 Chaotian Jing =?UTF-8?B?KOS6leacneWkqSk=?= <Chaotian.Jing@mediatek.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
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
Subject: Re: [PATCH v4 12/25] scsi: ufs: mediatek: Remove vendor kernel quirks cruft
Date: Thu, 08 Jan 2026 10:28:00 +0100
Message-ID: <13960383.uLZWGnKmhe@workhorse>
In-Reply-To: <1bbc263bafe14343b2d60a230ae6ce5dadffbf7c.camel@mediatek.com>
References: <20251218-mt8196-ufs-v4-0-ddec7a369dd2@collabora.com>
 <20251218-mt8196-ufs-v4-12-ddec7a369dd2@collabora.com>
 <1bbc263bafe14343b2d60a230ae6ce5dadffbf7c.camel@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_012839_277197_1F6F7A99 
X-CRM114-Status: GOOD (  15.08  )
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

On Tuesday, 6 January 2026 14:25:22 Central European Standard Time Peter Wa=
ng (=E7=8E=8B=E4=BF=A1=E5=8F=8B) wrote:
> On Thu, 2025-12-18 at 13:55 +0100, Nicolas Frattaroli wrote:
> >=20
> > Both ufs_mtk_vreg_fix_vcc and ufs_mtk_vreg_fix_vccqx look like they
> > are
> > vendor kernel hacks to work around existing downstream device trees.
> > Mainline does not need or want them, so remove them.
> >=20
>=20
> Hi Nicolas,
>=20
> This is a flexible approach to implement one software supporting
> multiple
> hardware configurations. Because you cannot guarantee that your SOC
> will=20
> always use UFS 2.0 or UFS 3.0, or that the PMIC you use will only have
> one set.

By "one software supporting multiple hardware configurations", do you
mean one device tree? Because if so, I don't think that's a good idea.
Device tree is meant to describe non-enumerable hardware.

Even if you want to make it easier for your customers to ship one image
for several SKUs, there's better ways to do this than having drivers
fix up individual DT nodes. The platform firmware like u-boot can choose
a DT based on differences it can probe. E.g. on Radxa ROCK 5B/5B+ boards,
we have u-boot choose between the 5B and 5B+ DT based on whether LPDDR5
is present, as 5B does not have LPDDR5, so as long as u-boot is told it's
either a ROCK 5B or ROCK 5B+, it can figure out which one specifically based
on that. Similarly, for whichever boards this is for, there may be
differences that can be probed to disambiguate between several SKUs of the
board as long as it's known it must be at least one of those SKUs.

>=20
> Thanks
> Peter
>=20
>=20
>=20





