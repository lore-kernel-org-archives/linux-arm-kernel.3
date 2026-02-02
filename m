Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7916AE63C8C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 19:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7uEx9VgfdjgwYROqUMQFza98mDrih8nCYBKA+muYRBQ=; b=O4TqMqpYqN0V+DiCLK9krlQ0D2
	HSy6qw+TymobEO9rDIiFJmm1VSzqpw6A/Vr6xjykT7Fgux6QzCMLJydm8kavLyNcxEjvpxNRQrnfI
	GaNYp43g2OT1+y28vBZNXbHdsbkfrE3HxAkmSojRxocM/e7wzJgazzlpGX3xKt5spddk2LT7AXyBe
	v6Fl5CZvLcRKSwAOyP5gkL8JOGmFl39G+1WgiG1ugI3SpuOtuc7xEhW89divGF030FKM/PB9NaYoy
	Qm/UrBP4OUqxbLSzOGhfBdKB98UgFjoQG4K9ubtiF4uX/ZKkPVIGHvDe5SBmdRVprLd0P7mNhllVL
	2sFpE4hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmzM5-00000005UT3-3epi;
	Mon, 02 Feb 2026 19:13:01 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmzM3-00000005USX-2pK3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 19:13:00 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-502b0aa36feso596731cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 11:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1770059578; x=1770664378; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7uEx9VgfdjgwYROqUMQFza98mDrih8nCYBKA+muYRBQ=;
        b=Xhhskqn34RKcOLWN3Vp+Kzale3/7Btlf/LYKCyPeGeoN1yczsSpCvXiejo+NTFXHry
         5dPmAgOe6+FbcojXLyBMGsbxhgbzpO+55d7YBcWZ75l3YVkb52wZVbFYXJ23/M1iZIb1
         w635ZI0z6pIrsoecsCcENeSK3uVi1qmwnLug4kH0AMOLqjiFqXzDs1dfqbv4o0hbDPnV
         +SvheLeB8YM+Cph8D6cLvMRVjIUXz37q1PVPuvEgymmM+sTJ1C4/EdMLD3300H4yVBLr
         BzxSlBCgf8wa3hz/WLYeUr8qAvmb11swye+y5q5gtg70v/zeIZbBvr7cO6bJFpItG7xA
         /rRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770059578; x=1770664378;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7uEx9VgfdjgwYROqUMQFza98mDrih8nCYBKA+muYRBQ=;
        b=UV1rGb9NzmYpfnafUuaJbO2hiNm0r4zXxsEt4UDIWwucZhu4Pmtj/Y3nWH9ySbgUsT
         NxdswqSrYaIZr+seyug3Eg7aNN5Q0wBzyzlwVezwDSU7c5Irmd5Xwn+QWJls5oreK5cD
         44bNxg4YGvdqsSOr7iBGiaejTStGiuN3AkdLEZ1/z3zHhh7dJCYnThb+ZzL1/kEUm+Ct
         mQGRp/l3TdYm3n0vbUaAujWK8A75IGS4WigLW744R9aJ3GY30JFYN+9glZNECr51bhc+
         ueE0tmyPnJjWMpjw3xYVohDw3Ly+R3ZQOppm4XgYtkEpzmGqWTPbytQhzDsjO5CSGd/6
         99Jg==
X-Forwarded-Encrypted: i=1; AJvYcCWGQjDr4JVLLQj+sKlIBC3j043lFXQKfHDTRyCfsjKHwPOvDDTwhvOFMdENWQkz0NRkBZ0fTJViJZ99encR+upE@lists.infradead.org
X-Gm-Message-State: AOJu0YwNvnthzabI76OiiawWkHw898aRtmwEmmNOSSmvOIDeksJlE2xB
	ghKZXAsmB4AGoshE1Xalg7A8MwLeIXAx/VoFAcD+2jh5+Zi9Tps1WOKWczyZbrNae2A=
X-Gm-Gg: AZuq6aIEfN8/rV0eC0AVsfsNH2u6+yJQpneinrjtW7CFZ/xi7gFjHkvQZGiYFlcjNSk
	hFh+0v+Swbb4p2OvwBYAyPg5w7ACzo094ot7fxJtxhsCpX8s+jELvvEQCVnuG5FVWaSE9250Q4b
	AbSVVGVzAgCmO40wyKXiryUgvWOn+rgWG54Dc9IGwWQcpuI/jJz+TmtQPMXJVfCwjYH6s3Zk3tp
	oFYqDzcEHv/KKsTl+F1PKCCgFwst43u2PFPz8E1X04q3+TNZzj6cfmy2fPniMWocoZbOScnx/oS
	qc8KvAUzMgSNhQTUjL2QVUZ0SKBpbSJItx1F2dG3xqwvJWXAhHIYTgTi/fs/fAb7+NRKyh50lvN
	sl7bpwJzp7+Vhv+EyFT/pShQyeU4ujfJWjFiIsH5dJMmHd7nL9JkJo2YKeLVTRerkuJmB2QxIIY
	qJsPOGz3zOxraW5fA9
X-Received: by 2002:ac8:5fd6:0:b0:4ed:70d7:aa5a with SMTP id d75a77b69052e-506092c7e40mr6181511cf.25.1770059578134;
        Mon, 02 Feb 2026 11:12:58 -0800 (PST)
Received: from ?IPv6:2606:6d00:15:210e::5ac? ([2606:6d00:15:210e::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50337ba3997sm110411631cf.17.2026.02.02.11.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 11:12:56 -0800 (PST)
Message-ID: <5e3431c69da07557edb20a252c4759be8c857f08.camel@ndufresne.ca>
Subject: Re: [PATCH] arm64: dts: imx8mq: Restore VPU G2 clock to 600MHz for
 4K60fps decoding
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	benjamin.gaignard@collabora.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de,
 sebastian.fricke@collabora.com, 	shawnguo@kernel.org,
 ulf.hansson@linaro.org, s.hauer@pengutronix.de, 	kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, 	l.stach@pengutronix.de,
 Frank.li@nxp.com, peng.fan@nxp.com, eagle.zhou@nxp.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Mon, 02 Feb 2026 14:12:54 -0500
In-Reply-To: <169eba79e8e1f906b1a0b59e22a531dfc7e57a1f.camel@ndufresne.ca>
References: <20260130084133.2159-1-ming.qian@oss.nxp.com>
		 <df8d5d5f28870752e77ec74f34fea7ceb6e97286.camel@ndufresne.ca>
		 <0b24716b-438c-4185-8a93-3a3879147c24@oss.nxp.com>
	 <169eba79e8e1f906b1a0b59e22a531dfc7e57a1f.camel@ndufresne.ca>
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
	protocol="application/pgp-signature"; boundary="=-LAOjFPzcyPbpnKVdmA5V"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_111259_728102_A287D0B5 
X-CRM114-Status: GOOD (  18.31  )
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


--=-LAOjFPzcyPbpnKVdmA5V
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 02 f=C3=A9vrier 2026 =C3=A0 13:44 -0500, Nicolas Dufresne a =C3=A9=
crit=C2=A0:
> > This doesn't sound like just a VPU issue; it's related to the display o=
r=20
> > DDR.
> > If not displayed, do the fluster test cases yield different results at=
=20
> > 600MHz and 300MHz?
>=20
> Didn't you run these tests before sending ? I can try again, but in my
> internal
> notes, I wrote:
>=20
> =C2=A0 > Tested that, and everything becomes unstable
>=20
> That was before I figure-out the IRQ handler didn't handle exception bits=
 that
> didn't stop the decoder (or dry IRQ, which strangely is common from the G=
2).

Ran some fluster tests now. With this patch the results is not consistent
anymore. Then I ran it with weston being started, and in the middle of the =
test
the display turned black. Matches my past observation. We did reproduce thi=
s on
BSP kernel too. When the display goes black, the recent hantro drivers repo=
rts:

[  827.581586] hantro-vpu 38310000.video-codec: frame decode timed out.
[  827.720201] hantro-vpu 38310000.video-codec: not all macroblocks were
decoded.


I have local patches to reduce the cascade of errors, so it likely survived
longer then last time. I will send these patches soon. The "not all macrobl=
ocks
were decoded." is triggered by a bit in the status register that is not
documented in NXP TRM. I found that bit in some VC8000D documentation (the
sucessor of G2). I concluded it was the same meaning after looking at the f=
ailed
buffer visually, it is indeed missing couple of macroblocks near th end. Ea=
ch
time we see this error, the DCSS gives up and turn either black, or sometim=
es
other color. The second case has been tracked to a DCSS Scaler underrun, th=
e
first we don't know.

Fluster command ran (two threads, never completes):

./fluster.py run -d GStreamer-H.265-V4L2SL-Gst1.0 -ts JCT-VC-HEVC_V1 -j2 -t=
90

Nicolas

--=-LAOjFPzcyPbpnKVdmA5V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaYD3NgAKCRDZQZRRKWBy
9IfHAP4rQUDUDbBIhNcS34h3qHt/x8THSc1WpgWBmUlwFmTckgEAs9XuoGSBAa2w
7zD1Mvo6hkReZD5SmiJWAnGAjRbhvQ4=
=BWBL
-----END PGP SIGNATURE-----

--=-LAOjFPzcyPbpnKVdmA5V--

