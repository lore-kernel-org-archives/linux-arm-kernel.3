Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C5DE87842
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 15:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2GolLxBI7M4FrQQ01gPdYp9MHSke1dJvpw9m0JW/AlM=; b=zTGTJwIie1Z9LMJ4ez7Agk3RV0
	T6SAEKbgRnZrLUFrsrCtuPvuWH0RYiM7XbquSRnVCKQZVTNPg2VLHnBwQ65vW3rXrJbuiQDgiXKVC
	ErDwHF54BRN8gSCikbrWIcTwhoWRkwnSIKO8VLdhz/nRKQLL7FAzApdnl93yOBM56f4ENot7dcyJe
	cvVx4wEWIluRemMCceLrjVY2Iow8TYP5GNAOw78oeEZi59Msx5saAd/5rzNGd6RfvgDzfk3AsOofk
	0SE4a+VpApme9sOzlw7/sQ4AwjZJ9FdKrSTPM5BQdVJIhSH8jBfudhGUwqPm319tOYWH00Avsn4ZJ
	Eq1vesaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnIWT-00000006qZu-2PBH;
	Tue, 03 Feb 2026 15:41:01 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnIWP-00000006qZP-31lM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 15:40:59 +0000
Received: by mail-qk1-x743.google.com with SMTP id af79cd13be357-8c5320536bfso601597585a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 07:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1770133256; x=1770738056; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2GolLxBI7M4FrQQ01gPdYp9MHSke1dJvpw9m0JW/AlM=;
        b=qZCutr7bxCxGtYrLOaEZBZdmN1HBIPs1dWa7ODNVVIPnsrVfs7bdiyoFXoPbtCFHxE
         FU0GRwpGHsRD2vegOgmWDYgJAjwA49Z2k6pT3XSNZRD+t3DTDMQUHpcjoPGLjSSH/pDY
         53FZGZ+MlhNfprj+2QZ7OmwvIlU6Vh/GFPeoV344AQPggjnofIjT3r69RR1+ztGy+led
         zSF8MO6Dp5fJONUy2dW0M4Bu8MdqqSvSTdDZBB8SOGQDTRBuAy1HOXQJ18KT6T/xC0e7
         7apHVsPni/l+4qtmmbYljWnIbfcuWI8bFumWjWFiUsOvbA8E3NREduY1eA6dBr4bqIpL
         qKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770133256; x=1770738056;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2GolLxBI7M4FrQQ01gPdYp9MHSke1dJvpw9m0JW/AlM=;
        b=S88aTuBIReRMnWxC2sNy8Tw59jGjkpfi9e3oKfZJSkGzsDh+rK4HX5aC0qMgapzYHs
         1Tzk8FJ3pi+BBcrrNGF/pnX015YAYM4PM7XbuXs1mRfHHawI3kODU5LiH7BP70YVMMj+
         Gyyw/0HBoIopWHkxR0UR8s2sHhKj7HQItGQAcpiH6iI+7sM30VCcYE2Z63enUjFZjFGu
         IO8SJwPNtdzkdSTpMPiwuUYQgsb81xt2hhjNk5m1ySI8ub1erVdDGrTfRLNTmhD7jLeJ
         KI+/XkOBWaWM7gbqt6qeHWiftHAv23GvVMBaWwbExkr2C8f5MFhRUbZXwBAXsxZVKv6v
         pucA==
X-Forwarded-Encrypted: i=1; AJvYcCVzhutUBRo2LzPKfGwt5I5dnvlWR6W0DNyqbpjfqG9knqAvXF0ci0EfxkOsdaCZew6UVGTGS1bh4KjOzAYjH+dU@lists.infradead.org
X-Gm-Message-State: AOJu0YxApT//VVxPcu1C39IB9KBOnYxsuesRzHRzMwDEp3DXirQPhmjW
	WkdGRfCkeS547fPOKeDw2LFKJEeKMatbtq9iCMTuADMUzxpNDwppm4BPbyoD73wErl4=
X-Gm-Gg: AZuq6aLdUrypSQ4udtqTP4eIxjPCMIgh6lKrt1Z0CpFW1heSrX4MfMGx6D5/RBYKOMg
	PAZAxl6Es/7Bv4TG5GXz57VaWi2lpQf/iypeq6kgEeip//Gc919RIpj94X+Kw0MBkwGmNFVedwA
	ZzpP/wOFFcQJoPPuKp6rAhxsQhFBm629HJAR9eaXLE0txrJcUR0AAIGakSF/J2BuM/SIBOLLCUK
	x84RjFqiq1Z0TK/varJ1w21hCWjFEfmU7PANHXk94l42fRuNF3pI5WG8WzthzBtERp656UEsHYn
	KgDmeEt9AIuKuEFXzS5WexuczqnU57IMjocfuXi6VCDbTo4xLX5g8PPwK3UYAQmWUQNEPMN+WEQ
	KUKlUX+P6T/zr5q2B+/y5Bry6MPVN0G3Gdd7xIJDLQyWXp9C2YczXCE7DbQFvBUH2JxoSfKpitA
	UzMrNplU+mXytsSlF92uevZlqvdSU=
X-Received: by 2002:a05:620a:7105:b0:8c6:d2ca:1d0e with SMTP id af79cd13be357-8c9eb2584c3mr2033310985a.11.1770133256006;
        Tue, 03 Feb 2026 07:40:56 -0800 (PST)
Received: from ?IPv6:2606:6d00:15:210e::5ac? ([2606:6d00:15:210e::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c711ba6c58sm1610151685a.23.2026.02.03.07.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 07:40:55 -0800 (PST)
Message-ID: <db9016a39f612cc93ee070c1eba4e4471a89a5cd.camel@ndufresne.ca>
Subject: Re: [PATCH] arm64: dts: imx8mq: Restore VPU G2 clock to 600MHz for
 4K60fps decoding
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>, Marco Felsch
	 <m.felsch@pengutronix.de>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev,
 ulf.hansson@linaro.org, 	Frank.li@nxp.com, peng.fan@nxp.com,
 festevam@gmail.com, robh@kernel.org, 	benjamin.gaignard@collabora.com,
 sebastian.fricke@collabora.com, 	linux-imx@nxp.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, 	p.zabel@pengutronix.de,
 linux-pm@vger.kernel.org, s.hauer@pengutronix.de, 	mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, eagle.zhou@nxp.com, 
	linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 hverkuil-cisco@xs4all.nl, 	krzk+dt@kernel.org, shawnguo@kernel.org,
 l.stach@pengutronix.de
Date: Tue, 03 Feb 2026 10:40:52 -0500
In-Reply-To: <cd07dc6e-1f19-4a59-8ee5-81a36d51bf1c@oss.nxp.com>
References: <20260130084133.2159-1-ming.qian@oss.nxp.com>
	 <df8d5d5f28870752e77ec74f34fea7ceb6e97286.camel@ndufresne.ca>
	 <0b24716b-438c-4185-8a93-3a3879147c24@oss.nxp.com>
	 <169eba79e8e1f906b1a0b59e22a531dfc7e57a1f.camel@ndufresne.ca>
	 <5e3431c69da07557edb20a252c4759be8c857f08.camel@ndufresne.ca>
	 <ca3a8042-1394-4925-9c61-dbfcbf4cf7d9@oss.nxp.com>
	 <20260203083110.woan3gmc3qdh7nmm@pengutronix.de>
	 <cd07dc6e-1f19-4a59-8ee5-81a36d51bf1c@oss.nxp.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-okkgKqsgZ+IV64MKbOhB"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_074057_916644_E7463547 
X-CRM114-Status: GOOD (  40.62  )
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


--=-okkgKqsgZ+IV64MKbOhB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 03 f=C3=A9vrier 2026 =C3=A0 16:53 +0800, Ming Qian(OSS) a =C3=A9cr=
it=C2=A0:
> Hi Marco,
>=20
> On 2/3/2026 4:31 PM, Marco Felsch wrote:
> > [You don't often get email from m.felsch@pengutronix.de. Learn why this=
 is important at https://aka.ms/LearnAboutSenderIdentification=C2=A0]
> >=20
> > Hi,
> >=20
> > sorry for jumping in.
> >=20
> > On 26-02-03, Ming Qian(OSS) wrote:
> > > Hi Nicolas,
> > >=20
> > > On 2/3/2026 3:12 AM, Nicolas Dufresne wrote:
> > > > Hi,
> > > >=20
> > > > Le lundi 02 f=C3=A9vrier 2026 =C3=A0 13:44 -0500, Nicolas Dufresne =
a =C3=A9crit :
> > > > > > This doesn't sound like just a VPU issue; it's related to the d=
isplay or
> > > > > > DDR.
> > > > > > If not displayed, do the fluster test cases yield different res=
ults at
> > > > > > 600MHz and 300MHz?
> > > > >=20
> > > > > Didn't you run these tests before sending ? I can try again, but =
in my
> > > > > internal
> > > > > notes, I wrote:
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0 > Tested that, and everything becomes unstable
> > > > >=20
> > > > > That was before I figure-out the IRQ handler didn't handle except=
ion bits that
> > > > > didn't stop the decoder (or dry IRQ, which strangely is common fr=
om the G2).
> > > >=20
> > > > Ran some fluster tests now. With this patch the results is not cons=
istent
> > > > anymore. Then I ran it with weston being started, and in the middle=
 of the test
> > > > the display turned black. Matches my past observation. We did repro=
duce this on
> > > > BSP kernel too. When the display goes black, the recent hantro driv=
ers reports:
> > > >=20
> > > > [=C2=A0 827.581586] hantro-vpu 38310000.video-codec: frame decode t=
imed out.
> > > > [=C2=A0 827.720201] hantro-vpu 38310000.video-codec: not all macrob=
locks were
> > > > decoded.
> > > >=20
> > > >=20
> > > > I have local patches to reduce the cascade of errors, so it likely =
survived
> > > > longer then last time. I will send these patches soon. The "not all=
 macroblocks
> > > > were decoded." is triggered by a bit in the status register that is=
 not
> > > > documented in NXP TRM. I found that bit in some VC8000D documentati=
on (the
> > > > sucessor of G2). I concluded it was the same meaning after looking =
at the failed
> > > > buffer visually, it is indeed missing couple of macroblocks near th=
 end. Each
> > > > time we see this error, the DCSS gives up and turn either black, or=
 sometimes
> > > > other color. The second case has been tracked to a DCSS Scaler unde=
rrun, the
> > > > first we don't know.
> > > >=20
> > > > Fluster command ran (two threads, never completes):
> > > >=20
> > > > ./fluster.py run -d GStreamer-H.265-V4L2SL-Gst1.0 -ts JCT-VC-HEVC_V=
1 -j2 -t90
> > > >=20
> > > > Nicolas
> > >=20
> > > My test results for fluster differ from yours.
> > > On my end, the results for JCT-VC-HEVC_V1 are consistent at both 300M=
Hz and
> > > 600MHz.
> > > And results remained unchanged after multiple tests.

After more testing, the fluster test is stable for NV12/NV15 tiled output f=
or me
too. I'm running the tests with linear NV12/P010, which imply an extra set =
of
buffer. I will check if I can give you a easy way to test the linear format=
s. I
also have couple of streams that systematically breaks at specific spot (hi=
gh
complexity scenes) with the provided patch. As most licensed content, this =
is
not sharable as-is. I will try and see if I can find a way to share somethi=
ng.

> > >=20
> > > I'm not sure what caused the differences between us.
> >=20
> > Once it comes to system stability, you need to ensure that your
> > bootstack is aligned e.g. same TF-A version and sometimes same
> > bootloader since there might be workarounds/erratum applied by the boot
> > firmware.
> >=20
> > Regards,
> > =C2=A0=C2=A0 Marco
> >=20
>=20
> Thanks for the reminder, and I agree.
> I think we need to align our board environment first.

I do likely have slightly different bootchain, and of course all the HDMI
component are downstream, but I can't really isolate the dramatic issue of =
this
overclock without a display component of some sort. Its a huge differentiat=
or in
the bandwidth consumption which is the main challenge on this SoC so far. 1=
0bit
videos makes things a lot worse fwiw.

We did review latest IMX vendor firmware package and can confirm we are run=
ning
the latest memory training blob and HDMI firmware.

Nicolas

> Regards,
> Ming
>=20
> > >=20
> > > Below are my test results:
> > >=20
> > > 600Mhz, 0.9v
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cat /sys/kernel/debug/regulator/=
regulator_summary=C2=A0 |grep SW1C
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SW1C=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=
=C2=A0=C2=A0=C2=A0 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 unknown=C2=A0=C2=A0 90=
0mV=C2=A0=C2=A0=C2=A0=C2=A0 0mA
> > > 825mV=C2=A0 1100mV
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cat /sys/kernel/debug/clk/vpu_g2=
/clk_rate
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 600000000
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ./fluster.py run -ts JCT-VC-HEVC=
_V1 -d GStreamer-H.265-V4L2SL-Gst1.0 -j2 -t
> > > 90
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ********************************=
********************************************************************
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Running test suite JCT-VC-HEVC_V=
1 with decoder
> > > GStreamer-H.265-V4L2SL-Gst1.0
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Using 2 parallel job(s)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ********************************=
********************************************************************
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ran 139/147 tests successfully=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 in 505.434 secs
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ran 139/147 tests successfully=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 in 505.350 secs
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ran 139/147 tests successfully=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 in 507.540 secs
> > >=20
> > > 600Mhz, 1.0v
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cat /sys/kernel/debug/regulator/=
regulator_summary=C2=A0 |grep SW1C
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SW1C=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=
=C2=A0=C2=A0=C2=A0 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 unknown=C2=A0 1000mV=
=C2=A0=C2=A0=C2=A0=C2=A0 0mA
> > > 825mV=C2=A0 1100mV
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cat /sys/kernel/debug/clk/vpu_g2=
/clk_rate
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 600000000
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ./fluster.py run -ts JCT-VC-HEVC=
_V1 -d GStreamer-H.265-V4L2SL-Gst1.0 -j2 -t
> > > 90
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ran 139/147 tests successfully=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 in 506.901 secs
> > >=20
> > > 300Mhz, 0.9v
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cat /sys/kernel/debug/regulator/=
regulator_summary=C2=A0 |grep SW1C
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SW1C=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=
=C2=A0=C2=A0=C2=A0 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 unknown=C2=A0=C2=A0 90=
0mV=C2=A0=C2=A0=C2=A0=C2=A0 0mA
> > > 825mV=C2=A0 1100mV
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cat /sys/kernel/debug/clk/vpu_g2=
/clk_rate
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 300000000
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ./fluster.py run -ts JCT-VC-HEVC=
_V1 -d GStreamer-H.265-V4L2SL-Gst1.0 -j2 -t
> > > 90
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ran 139/147 tests successfully=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 in 506.063 secs
> > >=20
> > > Downstream v4l2 driver
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cat /sys/kernel/debug/regulator/=
regulator_summary=C2=A0 |grep SW1C
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SW1C=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=
=C2=A0=C2=A0=C2=A0 2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 unknown=C2=A0 1000mV=
=C2=A0=C2=A0=C2=A0=C2=A0 0mA
> > > 825mV=C2=A0 1100mV
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cat /sys/kernel/debug/clk/vpu_g2=
/clk_rate
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 600000000
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ./fluster.py run -ts JCT-VC-HEVC=
_V1 -d GStreamer-H.265-V4L2-Gst1.0 -j2 -t
> > > 90
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ran 136/147 tests successfully=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 in 460.435 secs
> > >=20
> > > Regards,
> > > Ming
> > >=20
> > >=20
> >=20
> > --
> > #gernperDu
> > #CallMeByMyFirstName
> >=20
> > Pengutronix e.K.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> > Steuerwalder Str. 21=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | https://www.pengutronix.de/=C2=A0|
> > 31137 Hildesheim, Germany=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | Phone: +49-5121=
-206917-0=C2=A0=C2=A0=C2=A0 |
> > Amtsgericht Hildesheim, HRA 2686=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | Fax:=C2=A0=C2=A0 +49-5121-206917-9=C2=A0=C2=A0=C2=
=A0 |

--=-okkgKqsgZ+IV64MKbOhB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaYIXBQAKCRDZQZRRKWBy
9BdEAP91RCuQpeIs8WIAVqMpbGlTfJSJeLeq5HmQ5J1hZGuwXwD/WVhjnKNga4Pq
kYR1FIhai0zcA1k4q9wESua75qp+hQM=
=GTde
-----END PGP SIGNATURE-----

--=-okkgKqsgZ+IV64MKbOhB--

