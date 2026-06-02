Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B86CD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 19:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:
	Date:In-Reply-To:From:Subject:Mime-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S0zzvbfZAvOScRpX547nrGje+Bx4UMfhVoNGg/gjqDE=; b=p5vlMLPdPFBfAm/6b7B3FNwD39
	wBpEJsrnMeAtjYtkQfNN0nourL720nGaYLGSjPm9yYLfZdQkyqJCOdqgmvLJSNtHlkFxEHQwZoVtG
	rA4lK7Wjx9C+D0LcPB/lhiVuASeE2V/ih4ZUBkF/eCL535r3ymhrMSxfdX77X0CYBF7ZECUBkOXFZ
	0cD3rpvgMXL0uxxzzZXyJUFFYkU3F43gzwUQNyjLiiFl+5Ex3ID/kUBZsk/XIWUUiXlIDhS+i1Fu+
	+pW+T4H6DDrjHq/JwhQPrvL/fXAidaWfHrYlxZScAhYzxAAXADwZ8pGTZlVQxlg5ZtT/12o1yN3sQ
	KwEb142A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUUVQ-0000000Dg0g-0mUW;
	Tue, 02 Jun 2026 19:10:28 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUUVN-0000000Dg0K-42Bk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 19:10:27 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso27861715e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 12:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780427424; x=1781032224; darn=lists.infradead.org;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S0zzvbfZAvOScRpX547nrGje+Bx4UMfhVoNGg/gjqDE=;
        b=s7Il8a+0Vn47BSeQg5ckYSoC0Jg1FvAxGXi60+fOczGDYt2Y3oLBwQrOh00pujZggC
         q4aDiSf3Tgzr19lwdtWXje0LG7R4s8c+VrNt1dJUeadfcFqQO2FMjQf2BjolvrxikdL7
         MD0pG9xJixyIlEYMPdBDff1rkoOBVn4nCdya4EixZcJ+eP+mbeVWUocy+RlzcEP0PCmH
         ffqnrWF9hUGHTBodVgMGeJLZJoFuirDa9Dys+fneCNTvHRRPQ2NgXqo8zfW3pdCHMQD7
         nvavo8+f6SpSo7ZrZRf78rnDk9rDMgJ8hLFWWD37ZRfXzbP6ID4oWzjW5SPUKHmLGBXa
         FDVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780427424; x=1781032224;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0zzvbfZAvOScRpX547nrGje+Bx4UMfhVoNGg/gjqDE=;
        b=TJSPZev/fbmalagNpcgCAc1lvVrrdHKiRHMFGnTCfsw3LM8k9JNlkMvaq8xSFCISDN
         bFvIIwcgM8dbspahaxg1Y50G1yigXKqSnICOeWy6IBvh/TqY/GQm7mTWknUaYULryjbf
         9kQBNT+4Gr642SpSkK9GbCovf1GqF8Ui7xfDIVpgNLF/ULDOho7mnGl9hrbq+vrQEJ/G
         O3NAzIER8i1WH30m24tByRub4Suca4deORcESLoYe/A7Rt3hoQ5GEEtP4MMNnJMT/neg
         loyS/uIzMbSXg14+AZDXYPIiCctDX3TYsIwt3eW61DnNzNXdnMAixaaEzpxd3ukJXXy5
         x6LQ==
X-Forwarded-Encrypted: i=1; AFNElJ+6xXKylO3u8eycgNzHSBwU2ndISoNM57tvGuY1+CYxGFfsx6zVMKz27RWqpTJjgtcp+ROwFkmgHPjBAE85MOge@lists.infradead.org
X-Gm-Message-State: AOJu0YzI70bznZXwq1V/Q+ePfBpv2kcga2aXZ5gjVZCT7W+mrUE/Xx4o
	FN/QzQ/UUjhjHOlVkspHXoZRjBCfUPf750zM3AbsU8+ZrPfXYP5g4Ptc
X-Gm-Gg: Acq92OFVO4+9DgjZWslPsrdLwq97dctfXerxLeWegPrvGl5KuC4r6Qlfbj5wiNOaBxu
	iKPFkFJaprq/p8kw/e2EvXAnPmXFzNQRsGC6Uq33pLLdcABzKE2af9/d5bhiy68TBElAIZFHGfN
	fJ0I5Z/1DiJEmTcD9lGqLjPoeDE2zFh0y9M0+UA4LH7FN597yYifbEWoL0uKera1f9NJ8xyH6wl
	0GjmEnktGgWO1XUvlAqJB0fMgQxHq5sImS9b96RFmSmOcLHkBSvDSOngbChVmfCOscBYw56bF/A
	z6Q4Fi+4NgI3nVIoAjUMPzXjriq+waJj025omh8tBijk1GFHKghzK6E7yYyPIBTG/bJNKboo0de
	59ON47WwjCNbqNohl3KL6vZ+LWcT7oJ8wEvhW5YWYtHdjaHBohSwl2dTE/wZKvRHzG2Yuq8Wsk0
	22gFVObJ6OMHUUZEsfsJOE120Km16FrZHuMNozkNAev4oV0IHyjDtCnwVw9g8=
X-Received: by 2002:a05:600c:46ce:b0:490:b4e5:ce7e with SMTP id 5b1f17b1804b1-490b5edcbe3mr1787645e9.25.1780427423575;
        Tue, 02 Jun 2026 12:10:23 -0700 (PDT)
Received: from smtpclient.apple ([197.250.226.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35f2e6sm1277361f8f.32.2026.06.02.12.10.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jun 2026 12:10:22 -0700 (PDT)
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E0943733-4F8A-4BC2-B622-410231B14464";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH RFC v3 1/5] dt-bindings: clk: zte: Add zx297520v3 top
 clock and reset bindings.
From: =?utf-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
In-Reply-To: <20260529-multiply-engraved-aab583ea4519@spud>
Date: Tue, 2 Jun 2026 22:09:57 +0300
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Brian Masney <bmasney@redhat.com>,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <B8509E97-D235-4373-B29F-B7C79B96FB93@gmail.com>
References: <20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com>
 <20260529-zx29clk-v3-1-c7fe54ea388f@gmail.com>
 <20260529-multiply-engraved-aab583ea4519@spud>
To: Conor Dooley <conor@kernel.org>
X-Mailer: Apple Mail (2.3864.600.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_121026_040093_880E16C2 
X-CRM114-Status: GOOD (  12.64  )
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


--Apple-Mail=_E0943733-4F8A-4BC2-B622-410231B14464
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hello Conor,

Thanks for the review!

> Am 29.05.2026 um 19:48 schrieb Conor Dooley <conor@kernel.org>:
>=20
> These are not permitted in bindings, please remove them.
> Half the time they end up changing because people find other clocks, =
and
> they never actually get used in a dts. If you need the definitions, =
add
> them to the driver.

I changed the drivers to derive the number of clocks from the clock =
tables in the driver, as seen e.g. in mediatek clocks.

Before I resend with your suggestions and more Sashiko findings (that =
thing is good!): Do you have any advice on the questions I raised in my =
cover letter?

Cheers,
Stefan


--Apple-Mail=_E0943733-4F8A-4BC2-B622-410231B14464
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmofKoUACgkQPRO8yFRP
GiJLRQ/8DWvBJEkB0pj1TwBA6vRKN/gVM52XaK0fq+1i0LHKwHDmbsuLsZ/e80kV
MboPf7EdrxD4yx9eQcgVuANC2Vc8IhEIeFmFyxGqta2IXDf+I8r77pSX1/a3vRLb
SA8wMnAh32+w6uvB4VWb11tvunPhxMEcYcEaNEbQHDAf3kQGOyZM+Panu+OwpY0i
0TL/2fERKEaj0zJFYQ0Nd7E7tZ+7Gw+AoUgWz9sN5aFEBVzL1hYNEN3XG4Oae5Z8
sq+3U6i8SS5WPXPYBimzY9Adku1/wLmM/iBUf3+Lw/QuIiPk+KNhLp1v7ZvUzTDL
mHob0PZcdnszCzmrE8Adv7TdBkiW1E38ZWt1/znTDp2uv1WW2nbiAjvcrAOhB3D5
IT4l3o6q4trEWePt0IzzLST9Dx+KPsThJDVdYe1bSCQWn/HM7re8yunOp1WOhy/x
hZncx+6x+eVp1mV8fxl2ULbKVfL6oezFKz9hqLurmo2NHsKq39lqK3Q4ARdc0cLn
lS/Nc/bTYANuxQ2XRYZ7mIlpJ1jqBL5Hnmj4K77ziPhHJK/SnCJvTIXrn37jTB2W
0ex8RhmtoVpaO2eoNsyzuk+Ki+fqVI/rEOjI61l3U3t02mV+lcH0jhJhcxxYcbhk
NWLTHZHVslsuAJGxus5syoDzlF+fSJXTY7VWrDe2gWo4iFY+A7c=
=hxh9
-----END PGP SIGNATURE-----

--Apple-Mail=_E0943733-4F8A-4BC2-B622-410231B14464--

