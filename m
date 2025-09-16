Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17E9CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 08:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3DpbfjhNcYPny3opqvxM/G0alwk8XIxFrvBqhZGsL8g=; b=JEPqXEmKE3UtUZ4dQGvutjKi7x
	7AY6D2Kh6Mwp7s99Elv6aRIc75DMshu94LjuGbwSBoy6x3Cg82Ste2b5ncPCQy8v4pYr3AVE0Mj53
	+d6N5LjHrTTbcWKlNRnIMtbWrtmOFqWO4jhftSqhB8oxwYKZ6r5QFcx+C0YCLRvlli/a8pUaNfsTV
	ObrZQzfAX8XCQjpnkvWVkXXfWQgw/MwtO/d8ytSNz3eUg5Ms9bLZQFO4Z97LERUTGoylEW6nG8vMV
	6VBnqc0BG0JWPHhCCD5yDAcXOU4VoxcvIvwSunLmscSj3bGke5Or3PolX2+O9mXiAX+wFW7pntdBI
	N9KCzETw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyRWf-00000007Hap-1E5V;
	Tue, 16 Sep 2025 08:59:01 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyRWc-00000007HZP-0m6t;
	Tue, 16 Sep 2025 08:58:59 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758013129; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DlGRx1sHBM1VjFZpqb9GzXR45EgfBj1Alpk5uB/oOv1djKJcxWenWpKpt7+ZoxNMKIVPa6UoHsBtZFzwsZf3MYlZfjPqY2x9L1/lQqwKrHr7j1nx5Og0UfTtIVAMO1hhW3nQVoFPcIN+1WGOYjq0yaqBdRJjOahhvTAGX5QrdgI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758013129; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3DpbfjhNcYPny3opqvxM/G0alwk8XIxFrvBqhZGsL8g=; 
	b=g3OfcSn+hvsE6ovT+pY8HmViqNxCJqrCgdfr0k0I01HhvyNUkJcN7UMEODto/NSjt4zmSbku1VPnw3qK7xljqItoTGVvu7aTq0PnFV3p2C7opzPFb9TlRWezRxoFj4mecuJWGP9m8okQCXNb9SQx87ilotwjcGW6cz+KXyhzkOs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758013129;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=3DpbfjhNcYPny3opqvxM/G0alwk8XIxFrvBqhZGsL8g=;
	b=EKCJTAgEdkqU7Xe8Bg88E/fUzojbXLWOgtO1T9xuaGhnprD5noQ0A0/y2xKVzoXk
	Qqfp0RzbwKZsu48yBY9cXoQ1uc+7Xc52tt4uA7hrvBmsL4uvnDPnTb0IIrMUs/Jwn+l
	FAGYlOnUXncaxY9t0Y9Towffbv8lrrxU00c9ezEM=
Received: by mx.zohomail.com with SMTPS id 1758013127114512.6864936718232;
	Tue, 16 Sep 2025 01:58:47 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Conor Dooley <conor@kernel.org>, Chia-I Wu <olvaffe@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: gpu: mali-valhall-csf: add MediaTek MT8196
 compatible
Date: Tue, 16 Sep 2025 10:58:40 +0200
Message-ID: <6418135.lOV4Wx5bFT@workhorse>
In-Reply-To: <CAPaKu7TEjG3sWamy3k_YLig=208oXLPhMmbCvPOf96iEL0-uig@mail.gmail.com>
References: <20250913002155.1163908-1-olvaffe@gmail.com>
 <20250915-deodorize-proxy-b18e41fa8668@spud>
 <CAPaKu7TEjG3sWamy3k_YLig=208oXLPhMmbCvPOf96iEL0-uig@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_015858_294665_186F1A9D 
X-CRM114-Status: GOOD (  19.07  )
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

On Tuesday, 16 September 2025 06:21:10 Central European Summer Time Chia-I =
Wu wrote:
> On Mon, Sep 15, 2025 at 10:52=E2=80=AFAM Conor Dooley <conor@kernel.org> =
wrote:
> >
> > On Mon, Sep 15, 2025 at 06:51:16PM +0100, Conor Dooley wrote:
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> >
> > Hmm, actually there seems to be a more complete binding proposed here:
> > https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250912=
=2Dmt8196-gpufreq-v2-1-779a8a3729d9@collabora.com/
> Right. I tried to add the compatible to the binding (this patch)
> before adding it to the driver (next patch).
>=20
> If this patch is not a prerequisite for the driver change, I can drop
> this. Or perhaps there is a better way?
>=20

Depends on what you want to do with the driver change; I could pull it
into my patch series (I need it as a prerequisite now anyway, as v3
will get rid of the clocks for MT8196 in the binding, which means it
needs to have a flag for this in the soc_data struct you've added)

I think that would be the easiest solution so that we don't step on
each other's toes, as long as you think the driver change is
basically in its final form right now and does not need major
revisions you'd still like to make yourself without having to
coordinate submission through me.

Or, the most roundabout option: I split the bindings I submitted
into a separate series, and then we can both declare them as deps
for our driver changes. That might thoroughly confuse maintainers
though. But then you can declare a dep on the bindings series and
I can declare a dep on the bindings series and your patch.

Kind regards,
Nicolas Frattaroli



