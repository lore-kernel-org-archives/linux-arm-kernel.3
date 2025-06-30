Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D688CC83030
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 20:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rBUTDTzHFfwcfiT7i6BHSGVXrToMoBPF9YjK4qz9/CM=; b=0P3rIpT3A/IYS2A4r4f4qsEFHT
	2BYJozQygBpHJA6w9g3Ye10rujJfP1Xzkr+M+/UBk81dKab0WoTzFYL4IKDPMCRWKTjdAnp97XbCy
	7FdiWvVdX+t9NrFP+hnbD8Awq374kgu8L2IM7J7dIoiUSppwseJFzd5rT07NCYG971RqEULTF8sy9
	vlbSVESRhQFkTbIZd8YGk53faQQ+B2ff8hFlhtlcWNXjjZ3V2FJSkVy+PTaNIouuhDRKbuUXweOe9
	MZ1pd6hLQQTSTM7OT9OGHBSRAIT2jA/mWMWyIIbRTxc7xQVfqPc51/WTLzQG+6O/5onlU6GsNHp00
	tPSnXotw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWKhw-00000003Luz-2y6e;
	Mon, 30 Jun 2025 20:02:28 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWKfc-00000003LiM-0P19;
	Mon, 30 Jun 2025 20:00:05 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1751313593; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=oIyis2lLopynTJij4VlBnmivGgF3rJiq5l0M9s4Gb9dTR0a4XO7JFS0I8PWuLEbP2Vqln/JcxEJadChK7k/WpviSiUJuKuEGxCYxL52r2rC7yRYgkDRiXq0hJv/EtX7oSoRZbwkzz2GaFLdDERDZc/89zdttry8CcTzA5qV3YZw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751313593; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rBUTDTzHFfwcfiT7i6BHSGVXrToMoBPF9YjK4qz9/CM=; 
	b=WCPdN3ntfbZw5YLGEYsETWBGt+VZpOrJpBG0FxQY4i+t2wIHE+2h3UEshYE1Sai8dYafsxRNkzBh9LBNdSHCyOUq2/gcKir9/GJAEZz3X0AB1aujzTk1DC5ScmbIRluUXi/K7TR7rASsTQdOh4Twp/ZhwPKT34clh5rY4VyPYQE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751313593;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=rBUTDTzHFfwcfiT7i6BHSGVXrToMoBPF9YjK4qz9/CM=;
	b=SWLqK6BwRQHFLSqizYCw1ukwzLPYtLySRrigRfm6BKHU+S7rphQY2YZhCXRBgIEl
	SaDeB4CiA/KP939AYQF1y+iv/PMgTpb8K8nbfrUErz8j5RGxnMEqJn465ZDEawpTg+4
	bFjQZGfMjthNskVrx4KrB7Uv9NhqrEUY6kmN2EZc=
Received: by mx.zohomail.com with SMTPS id 1751313591718941.3513556291028;
	Mon, 30 Jun 2025 12:59:51 -0700 (PDT)
Message-ID: <48f573941d64217240f4750534e17faf4af0e3f6.camel@collabora.com>
Subject: Re: [PATCH] Input: mtk-pmic-keys: Fix null pointer dereference when
 no compatible data
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, AngeloGioacchino Del Regno
	 <angelogioacchino.delregno@collabora.com>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, kernel@collabora.com,
 linux-input@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-mediatek@lists.infradead.org
Date: Mon, 30 Jun 2025 15:59:46 -0400
In-Reply-To: <d373gpdyqejppdysdbb4k6aat5i33epnqsebxdkjbrgfwsnqtm@43si4kmjvsmq>
References: <20250630-mtk-pmic-keys-fix-crash-v1-1-e47351fa9d1f@collabora.com>
	 <28111607-d5a2-4b54-964a-d010fb99193a@collabora.com>
	 <d373gpdyqejppdysdbb4k6aat5i33epnqsebxdkjbrgfwsnqtm@43si4kmjvsmq>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_130004_200532_977C05F3 
X-CRM114-Status: GOOD (  15.73  )
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

On Mon, 2025-06-30 at 08:25 -0700, Dmitry Torokhov wrote:
> On Mon, Jun 30, 2025 at 04:06:53PM +0200, AngeloGioacchino Del Regno
> wrote:
> > Il 30/06/25 16:03, Louis-Alexis Eyraud ha scritto:
>=20
> [... snip ...]
>=20
> > > @@ -316,6 +316,9 @@ static int mtk_pmic_keys_probe(struct
> > > platform_device *pdev)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const struct of_devic=
e_id *of_id =3D
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0of_match_device(of_mtk_pmic_keys_match_tbl,
> > > &pdev->dev);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!of_id)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
> >=20
> > Please, change this to `return -ENODEV;`
>=20
> No, this definitely should not be a "silent" error because it
> indicates
> there is something wrong with the kernel.
>=20
> Stepping back, why do we even enter mtk_pmic_keys_probe() if there is
> not a matching OF ID? Are there any other patches that are not
> upstream?

I'm guessing it's because the driver can be probed by a parent MFD
driver, drivers/mfd/mt6397-core.c, and the compatibles defined in the
MFD don't necessarily match the ones in the pmic-keys driver, for
instance 'mediatek,mt6359-keys' is only listed in the MFD. Adding the
missing compatibles to the pmic-keys driver should fix this.


--=20
Thanks,

N=C3=ADcolas

