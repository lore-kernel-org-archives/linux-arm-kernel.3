Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354D8C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 08:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:
	Date:In-Reply-To:From:Subject:Mime-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3p5N3pSY7f2AmTP0/oS5IDt21osoKJvAm5wj7AjOhYY=; b=DCDw+DTbuZVAoX5YrBe/ndSPd7
	G3HNBbhAkePbDyHHu2ytWFwe3l5PiTj34OjzEr8+s33uzy02ZP5qHl+cLPMftfoCWj2vfI/4Xew1s
	nbhwu1ljffsCYL8x9TjaYULhVagIOwTJe24K1Y1wR7q+WHLoZJ0l78HzglQtrUcTrQnN+Qcvj3/o8
	ZBZE44KDVRvre+zm+wG693IGfj8bvwq00VbcxtXJKnPeRa2rH/tlOOMiZw9uVfkFiLNPDnzxIgm6F
	E1mlB3LOZa/4DOFkP4xsSbjgxzjJshfBRfSa1NshhxudDWNRfL6Tg7YiBkN/Eh9rePsPqolFsaqPK
	cLyrNSHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUEF-0000000GJhZ-1Jmk;
	Tue, 30 Jun 2026 08:54:03 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUED-0000000GJfy-0m6Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 08:54:02 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4924593f45dso54445945e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 01:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782809639; x=1783414439; darn=lists.infradead.org;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3p5N3pSY7f2AmTP0/oS5IDt21osoKJvAm5wj7AjOhYY=;
        b=r2HTs5+mGxy1vHvw8ZxFtge0d8FSwXZ88yUZTzAsvFfrOZkaz4BxYMzrhp0HxtQQax
         FELHy9e+Y39U21oqosgreE5zD0DaDwauV6WNig49uCcVOMvBy278ynGqFH9xDez9gmb0
         DpofQZF94QePGPSbwXP6NHD+2i9qun9ti8h/CqsWMsvUciu7UttcMvEm5a5sgZj9Aa4F
         LMUTz43R4l3a0oJ9WwXfyXdgalaF7jHDQ8cKAX00OJf3RT7YOz75BZS4eb4hZlQeL/oQ
         wT7Yt8H3uc7SsBO71xHPOy9cZzZiIPgN/PeNvHAsfSu7QBTGG8f33eVh6WK8qvBBIGuj
         6Jjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782809639; x=1783414439;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3p5N3pSY7f2AmTP0/oS5IDt21osoKJvAm5wj7AjOhYY=;
        b=sl4uRBbx2f4+iMnSfndY6SfeaQp05lkvIHIdVyHijAyS8cykJnrmbsMaAaDcfiXllA
         f6mZttVyjQhPBkh023QV6opmc3XGSxbjioslaCKtc8aPO7fa7Fse+SQEim3Qs7pu5PJ/
         RXT9h7eFLohbJYrggQyqRwBog/PYO0EOeOKbY+SZ6UO8f84Dub8c7qonzvhtiPQwx/VL
         V5Qvvqm9+p3XhH9DzMCNegnVov9szrQzsFcxSgcAumgVWPUgFDTQ7IzileasJVG4q2a7
         YRG43kkDkVMXjZwH4E364nVS0aSqNnhUQhZ13PZC41Z0Fp/Ck6SFPlm68PNhxXWsAhZg
         84nA==
X-Forwarded-Encrypted: i=1; AFNElJ+uDkI/Q4wdGJGAbtwq0wNhkI84DktubsSgS/SHwZUoIDT2+fkxRA4loWtrlU2q+2mWbJBqViYTyB588cVpir+w@lists.infradead.org
X-Gm-Message-State: AOJu0YyZYDQumKHrBHV7W/WCB7pYeSTTrlrmOQM9cE81nQQaMEMLIYUA
	PL80CecV+88AvWjhmcJtaxqeJExGQJi1yPOj/qz3DKEL6osgNIzmlUBv
X-Gm-Gg: AfdE7ckufweSYJzAtBl72ywuoooNafZGBXQTzpoJDxv7KnmbhHH5tiXPbZJuN3dxB4C
	xNst88XDIbwd1xkNJdfALQVOHDC+ovQmfTLpn9r/qYrPSgFkYtj2UHcoW7OdKqEDHpX/GPbq/5X
	let/5DnVs/Z1XEt6EXJQhzNPhqFPwOly0assVcQMGHXmT46TVTrQqt213u1TMc7NTIGX3ccStwJ
	ssRgXfZUPd/cIv6tnpWmItmeKW58D3triNXFOOc9jZCj1Kcr/r213j1hALew67Vllk3NGQGnPkR
	0WUlP/iwv6jn7yfeJSFMWWVw7DVrRDvfZ5iuWnHTryWxOQBEIS+lWCyR7z+e95ni+dQ6gA/TWdm
	ec9QFTm4JYg5wrFQC8vqDe1DFrtOshw26SvyP27uxfhRkqq4gVhKttJKVmUlVw9GTusMy+xh+QW
	5h2mDIawspAHhRbEEqmTZHYfmLGivQ1byUS6oWC1vdOPf/sjq1QFKd
X-Received: by 2002:a05:600c:c11a:b0:492:3da4:81ef with SMTP id 5b1f17b1804b1-493b82b0e50mr36934455e9.18.1782809638753;
        Tue, 30 Jun 2026 01:53:58 -0700 (PDT)
Received: from smtpclient.apple ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bc7aca88sm46787785e9.0.2026.06.30.01.53.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jun 2026 01:53:57 -0700 (PDT)
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E2D32867-FDC8-4398-8E1A-361442408B27";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH RFC v5 05/12] clk: zte: Add Clock registration
 infrastructure.
From: =?utf-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
In-Reply-To: <c59fab242716c80250a66707d7ccaaf243a85aac.camel@pengutronix.de>
Date: Tue, 30 Jun 2026 11:53:41 +0300
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Brian Masney <bmasney@redhat.com>,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <84C4450E-7355-48CD-BCBB-CF619C27EBED@gmail.com>
References: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
 <20260628-zx29clk-v5-5-79ff044e4192@gmail.com>
 <c59fab242716c80250a66707d7ccaaf243a85aac.camel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: Apple Mail (2.3864.600.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_015401_251742_524B5FC7 
X-CRM114-Status: GOOD (  12.80  )
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


--Apple-Mail=_E2D32867-FDC8-4398-8E1A-361442408B27
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi Philipp,

> Am 30.06.2026 um 11:27 schrieb Philipp Zabel <p.zabel@pengutronix.de>:
>=20
> I think the MFD driver is unnecessary overhead. Can't you just keep =
the
> reset controllers as auxdev and use of_platform_populate() to create
> devices for clock-controller child nodes such as syscon-reboot?

MFD for top and matrix was the suggestion of Conor:

=
https://lore.kernel.org/linux-arm-kernel/20260618-fantasy-estimate-6c52edb=
c6890@spud/

To quote:

> I think aux bus makes perfect sense when you have a clock/reset
> controller, but once you start expanding past that and you have reboot
> or hwmon or hwspinlock then mfd starts to make sense.

I can go either way. To me aux vs mfd seems like a distinction without a =
difference.


--Apple-Mail=_E2D32867-FDC8-4398-8E1A-361442408B27
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmpDhBUACgkQPRO8yFRP
GiLDTA//XuiFvq2hvcqMHFcgqCiOzfN6Ejynlaa1U0fpgCupiwkoTk7x7V2F9fNC
GDJKF2tdhcs7CpooAxYbSMwhLT4UlSuCWBz+Op6qj4ANOJi0L/kMelslIMoZG5qc
XgAKSrho7pZxbYl1BPd6iNZn7fU6ejh9B346spNmR6Kjk8o+7giGQS527j2Qlnfr
Lgk0fnGiCcg5uKdkynAcTArHAJN7Pt9TjBHQ3SxjC424lnbUqeAHZ3MVb+nMbM0L
vbSSXmozV0xj2RPFVor0EUYhXWT8jsF1t6TfZCycP/DWL4oVMa8nzBtYRM1E6D7M
Sz+Yc59noQ0NgNeCzoTDR7iBR/QkZdsq8WB6Q5cO8TMVcDxXUOTIU0cyVoFLimjG
y8cNXWjGqhYXYbAT/7W/Y/MlTT2Ss20ssTNTTP3WYoORsMjVrBUtAiyI7FXpaZIC
7u272rGUcIf/EyhIBuIOtukt1F+YwWytOoPqDXzfvUX3OyU/VdzlV63Ee30HlnOT
JNjndlqVVL4aX7BgJIBKkP4gEd815JCX6I44nlSbLWs9375U1uwYmkWgqhKFLx/S
gm0fMw/AxcXSP+XbtrCnbIMSeWSWtlW9y+itnxhISdD9rgx00WhjxnoX99ywfat9
ugTXugS0oIxmoGGxLvMBTUdKcXQjk0V/smaau8JmSbdZujZ0lr8=
=DWLi
-----END PGP SIGNATURE-----

--Apple-Mail=_E2D32867-FDC8-4398-8E1A-361442408B27--

