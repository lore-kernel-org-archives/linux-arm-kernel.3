Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C2AC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 11:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ezAMBD29GkkB4e4t8a/2A1rSsnKm9LPumN4NESuMnWY=; b=UbGPpywfjcEDHE7Wzl7xITgvsM
	cSvKunRBZSYuFlTyQ195bDW0T/BiUfV4T6vxBWFf235gMHz5JC5W/lgx4VC7SuKzC4pXZPbswmchE
	WfLbt0xQpSa2Dataf4RMR0mRTBajcibQNLaGpqv75u5vr3h0xHWNt0OJC/D5/YPzYR97lbVhz+XMd
	n0dUwe1SYpT8MOzHRFi3hRqp/y68DrdKeBup9TkgI1t9dR/Q83Yc44/ejHuFST0rMxTuWmD2+VfU0
	zGXg+NU5/NeYNEVo0wIGG5BAakM7xj252CNks9lVWTTIMxsvswqLColdBGcBf8LesFur577CG62U0
	77VVsb+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdooz-0000000ASTr-11vp;
	Fri, 31 Jan 2025 11:04:25 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdonQ-0000000ASD6-1zOt;
	Fri, 31 Jan 2025 11:02:49 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1738321347; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Hkql+bgGsvPgUJbPyMiWHR3VvDrgD3/F2Fvco6ZqedgPxoNDct9nPoroK/UOC1kg8fiKi2MwL6CgzCAE9/gzg+T1Mk/Ly2GWJSHMUtmWzSIMwqycUrHJHMLwwhLw8iJbxWJN72z1lyC0zLymeHrPlQTegGctm93eEpsF9ka2wBY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738321347; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ezAMBD29GkkB4e4t8a/2A1rSsnKm9LPumN4NESuMnWY=; 
	b=WSkZ36BG4IYlZYIZSpBtsHGTfoBKrNrVDfaB0tSwC/7NfiFt6NlFho0ZcVElMwuh8Caup6iLzQ6Bd7JCBaCb5ufANpTjllZt+UWXOMFZ64xw9t7MYOmuL0aykqsGXOSd/1DClH6fhba/X4oX+gjFxdkVLeDDFRdnrXWke6jCCFk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738321347;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=ezAMBD29GkkB4e4t8a/2A1rSsnKm9LPumN4NESuMnWY=;
	b=AsPyoanPmBfmqtoZVvtj7k2FLUm21bkSi7HNPPMp6hR2oKm2q94Lfi7d+mr4lpz/
	dMn9S51J90ADF/Qj45pmfVL4/k7kCTjMGoR9DwKrOHHKj4EVM7qXoaT0Wnf13hXiPYZ
	wZ0BSVaw5ZheIl4LueSw73Y7ZVpWXx0WqFE+H7VU=
Received: by mx.zohomail.com with SMTPS id 1738321342354706.4067778296129;
	Fri, 31 Jan 2025 03:02:22 -0800 (PST)
Message-ID: <8b924147e03693d04e1800b19a65ac773b699365.camel@collabora.com>
Subject: Re: [PATCH 2/3] drm/panfrost: Add support for Mali on the MT8370 SoC
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard	
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Boris
 Brezillon <boris.brezillon@collabora.com>, Steven Price	
 <steven.price@arm.com>, kernel <kernel@collabora.com>, dri-devel	
 <dri-devel@lists.freedesktop.org>, devicetree <devicetree@vger.kernel.org>,
  linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>,  linux-mediatek
 <linux-mediatek@lists.infradead.org>
Date: Fri, 31 Jan 2025 12:01:51 +0100
In-Reply-To: <1003b393-770a-4e2b-b5ed-054f1f9072b4@kernel.org>
References: <20250116-mt8370-enable-gpu-v1-0-0a6b78e925c8@collabora.com>
	 <20250116-mt8370-enable-gpu-v1-2-0a6b78e925c8@collabora.com>
	 <20250118-meticulous-black-caracal-ec7f0d@krzk-bin>
	 <194b7237128.10f9923a41656565.5574753983898665940@collabora.com>
	 <1003b393-770a-4e2b-b5ed-054f1f9072b4@kernel.org>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_030248_564154_3D9DE6EE 
X-CRM114-Status: GOOD (  11.43  )
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

On Thu, 2025-01-30 at 14:21 +0100, Krzysztof Kozlowski wrote:
> On 30/01/2025 13:15, Louis-Alexis Eyraud wrote:
> > Hello,
> >=20
> > sorry for the delay,
>=20
> You gave yourself 12 days to respond, which is fine. But to me, you
> gave
> 15 minutes and immediately sent v2.
>=20
> So now your v2 will be still rejected.
>=20
> Best regards,
> Krzysztof

Hello Krzysztof,

my apologies if you felt offended I sent my v2 patchset too early after
replying on the mailing list.
I meant well.

As I felt your first remarks were appropriate and precise enough to me,
I've submitted a second version so that the modifications to review
could be available shortly after my reply.=20

I'll be more cautious next time.

Regards,
Louis-Alexis

