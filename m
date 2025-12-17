Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF52D6407A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 12:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LrvfmBmzDcA3GwDRV7f9xZnGQTMmRHRy9Ho1m8R+Wok=; b=UpyYE3DXqJaJC89uN+n+f0b98J
	6oCnVwlR5xahPVcgpYLHwOOvDx3IKt10O/pUXb8wAt+RZs3dQjIdy7E2sIq7V087S3PbztneZWGn/
	d72LL15XKqKy03vyfkea65CaDmWVlTHyytRQcH5z1A7PBf137CU5CVrxzpgpiAjklDFs6zZwu+ydi
	vqvAuQrTfx0ClasE3jgYINfu1G+8b7fJZ5ZfN08zONoUKCDCTnOU4P663xIdRIcAOKfRKhgFfhNiH
	fgenlZI/Qv+zFREFB8xBLG2jNG5ZgWaBtrxWvjtQSHydPH25bifnV3BtKPX5iS66+UAvqnAFGc75/
	dzNUBRjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVr6T-00000006pC2-37H0;
	Wed, 17 Dec 2025 12:58:05 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVr6S-00000006pBY-01DS;
	Wed, 17 Dec 2025 12:58:05 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1765976272; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FoqdNb4g5Gtkd8jGGwm/maHLrre5WN7i25q/udEcMHPG48TC9bLlCuMRzI/R2OL3+rZ5wyKhHhUFtGYvFGHyO7iOVxPzUsmzICdTrehXVXBXpZwAhTbhMad58FSf8ph3Bz/MCwLEsuNAGxWP8a6P7SFuBa/i9PVoaKWyF9m+u7Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765976272; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LrvfmBmzDcA3GwDRV7f9xZnGQTMmRHRy9Ho1m8R+Wok=; 
	b=eh9MgmX/bEjXh147aGbIug8Y9zOvoJ6XmSyCwjAocNyXKnExbeCLAO4y7axvDxOwHbLzV1/iK57cBwhIJFU5mBUo1VpdlrXK1PlMiyxSi/ZnbGjMy9nwanRPOh506t0BoGAc+xxaq+GVaKVFIcpUNpk4WEX/CsfNeoxDcz3fwos=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765976272;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=LrvfmBmzDcA3GwDRV7f9xZnGQTMmRHRy9Ho1m8R+Wok=;
	b=foeIRv8TCls/G5ux4frn10VOXe7im29PLKscuAUx8H/eXtXbu12qaJwIrkzY+Bw8
	SK5/4DflcoPyCMD0aCdHI8guUqFPK2B1uCoirliEZxH8z1JCp4A+T9DcnN3RlGPnVzt
	iTidSd6zWY1Ti8lK+kar6VvLQCR3nLR4mS7Dc/lI=
Received: by mx.zohomail.com with SMTPS id 1765976271997185.16439333799497;
	Wed, 17 Dec 2025 04:57:51 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heiko Stuebner <heiko@sntech.de>, kernel@collabora.com,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: input: adc-keys: allow linux,input-type
 property
Date: Wed, 17 Dec 2025 13:57:46 +0100
Message-ID: <6778765.lOV4Wx5bFT@workhorse>
In-Reply-To: <20251217-tough-ultra-junglefowl-f1a9ae@quoll>
References: <20251215-rock4d-audio-v2-0-82a61de39b4c@collabora.com>
 <20251215-rock4d-audio-v2-1-82a61de39b4c@collabora.com>
 <20251217-tough-ultra-junglefowl-f1a9ae@quoll>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_045804_097794_BFFCB7D3 
X-CRM114-Status: GOOD (  14.64  )
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

On Wednesday, 17 December 2025 09:31:15 Central European Standard Time Krzy=
sztof Kozlowski wrote:
> On Mon, Dec 15, 2025 at 01:29:29PM +0100, Nicolas Frattaroli wrote:
> > adc-keys, unlike gpio-keys, does not allow linux,input-type as a valid
> > property. This makes it impossible to model devices that have ADC inputs
> > that should generate switch events.
>=20
> The solution is to use unevaluatedProps instead, which also allows
> dropping other properties.
>=20
> Best regards,
> Krzysztof
>=20
>=20

Hi Krzysztof,

to understand the motivation behind this suggestion correctly:
are the "linux," vendor prefixed properties, especially with regards
to key codes, generally a bit of a thorn in the side of DT bindings
maintainers?

I'd imagine so since they technically tie the DT to a specific OS
kernel (though of course, others are free to translate those key
codes). And the whole idea of configuring which code is emitted
from something is basically abusing DT for configuring software
rather than describing hardware.

I'm mainly interested because this is a thought that has been in
the back of my mind for a while now, and I'm curious if the DT
binding maintainers happen to have arrived at the same impass=C3=A9,
where linux,input-type et al abuse the DT model for something we
would tell any other vendor not to abuse it for, but no better
solution exists right now to achieve the same thing.

Kind regards,
Nicolas Frattaroli




