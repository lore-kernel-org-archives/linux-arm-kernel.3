Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 963EDCD6E74
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 11:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F927iQO2yHy5r4ReVfNbFmhFmycUVmgAeB7fBG6rev8=; b=aHl/vYAt3CtDomoKylYu4tsTvU
	7t156pYQBpdXqaY1in+Vyz36aL1kS35WKOUkIfICEDeLnWzCl+lAfVDNAX5I78g1t77LFR6AterFc
	B1RDgT3M4DzaLgL30tn9lsMI0OSw8GmqUSDjLSaLmLk+pMsUfbegdx1SIjeiBcoqTuSKlFaj/Kgb2
	Abw/oxueI3QL9kJflHtGx5Q700wcux2WTzplwB67FKQv1pZHDKBuzFLQebYMt8vEOdJMH3LPUmgrq
	vqH1OqG5cJBjD9O/jMRzu6j3g26EB//JzKZfuJQu+ZtZhOHou60TajmxRFxcVUoZQStRLU8iweRZz
	JsMyZZbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSr6-00000000YSC-16vt;
	Fri, 05 Jun 2026 11:36:53 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSr2-00000000YRT-2gNA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 11:36:50 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-qw7b.prod.antispam.mailspamprotection.com; s=arckey; t=1780659408;
	 b=J4gZUv7pavbYTPt+jrdhrYYBV6E0W0d8Xv+YUkZXO97HQP3NgD1TCqymULvsRuOTmpjTFOA1GV
	  Cc9N1Nx0isUI3/IV9tvgz0P3nq87aqt3j/Wt67ozpkTpqQUwxRVit40IrKamk80JrE+Mf++n8X
	  0Qa1bA0OQLhBPtJq4F9LD7Wk0aa5bW6lGcv2Q/Z6/+vldT2Oie4b0BPB8lV70d6bpP28hdBOwW
	  OH+lGzdGeIYqcQbLFiz3898NqLmbREUDXT/LChDhap/nnoOmSEFMw/vnXRYNFm/lMOcQDFTVq9
	  900DV566WvDTlb8XIyDAdavqWGBPqqJLLJ2Ke/QcDncVqQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-qw7b.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-qw7b.prod.antispam.mailspamprotection.com; s=arckey; t=1780659408;
	bh=XNHtznNb9YuK+Ys5xRmERxuX6qwUALEMw5FejOZwa8M=;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	  Message-ID:Date:Subject:Cc:To:From:DKIM-Signature:DKIM-Signature;
	b=Gih1lCB+GJmUIfmTcPo0sfdR8kWyy9oPTZptJtJLOArfSnEG9U6JXJ8gsQgzIPQ+UefawEcQFg
	  fDTvZ5go7t8yD2edxqFOnMP/65v8WeENsv77dZiAsTuXfL0tcvCD8DOGjKa7cWfGoFDUttSdsw
	  puxil9L14cqHXxH5P7mUAw9hQLYvh+v/Jy6PmoISn/90Q9zSfq8cc1xsNpIbmngJhpsMv5/QGu
	  GW6I/q2hwyGiVVufeaMPFpHEMa/oWork3WQoGpx3aGcy5m0uXoB7amQDcon+3ZEN/26sejoFbW
	  FFdUKL/McZH46lQscjzXsRhYp48lvb61jS6+7Z8Qjkil5Q==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Reply-To:List-Unsubscribe;
	bh=F927iQO2yHy5r4ReVfNbFmhFmycUVmgAeB7fBG6rev8=; b=lALx/Q29I0TF72XcmS4ulSYECN
	fcMWUDcChruDngL5c4cZRcakk/sFIsxivrTTxijf8/qNh4FkTw7iqnq4OaJj5XNdqLeGTbQ/eeZSw
	65o23Bl4sQShUjmIfoJfBfawPsq16T37b6AImRn1BaGtcbRUMW6Tf9MLO2l7r07r0mFU=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-qw7b.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <francesco@valla.it>)
	id 1wVSqt-00000008aEk-3xmI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 11:36:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Subject:Cc:To:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=F927iQO2yHy5r4ReVfNbFmhFmycUVmgAeB7fBG6rev8=; b=hWWMhmjpCi3qq3Fr1kFkjljgGg
	Vj11SCwNaX7NdXLQ3qtQU0cIeMp5zUEHjseLafSbXct8roL3XC0mULS233X6ryPzSD3EvxZNa3D6Z
	4wc4QhGzrtSUV1P56thuHX00CZKOx2WPSbw7LmpqnTIcF/4mX+jvQKGyYGzMmdtsRT5o=;
Received: from [95.248.69.182] (port=62513 helo=bywater.localnet)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.3)
	(envelope-from <francesco@valla.it>)
	id 1wVSqb-00000000Bzf-1M8X;
	Fri, 05 Jun 2026 11:36:21 +0000
From: Francesco Valla <francesco@valla.it>
To: Joseph Guo <qijian.guo@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 steven.yang@nxp.com
Subject: Re: [PATCH] arm64: dts: imx93-11x11-frdm: enable additional devices
Date: Fri, 05 Jun 2026 13:36:20 +0200
Message-ID: <_j4Ik3AsS5yfKb4Y7cSB1w@valla.it>
In-Reply-To: <aiKP3EgdrCbqtUH0@lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com>
References: <20260115-imx93_devices-v1-1-b2c840cafa2e@valla.it>
 <aiKP3EgdrCbqtUH0@lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 61a2b9b03f406512cacfd9e40296e269
X-AntiAbuse: ID - 61a2b9b03f406512cacfd9e40296e269
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1wVSqt-00000008aEk-3xmI-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-qw7b.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_043648_946530_3D10750F 
X-CRM114-Status: GOOD (  11.46  )
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

Hi Joseph,

On venerd=C3=AC 5 giugno 2026 10:59:08 Ora legale dell=E2=80=99Europa centr=
ale Joseph Guo=20
wrote:
> On Thu, Jan 15, 2026 at 06:11:34PM +0100, Francesco Valla wrote:
> > Enable additional devices on the i.MX93 FRDM board:
> >   - CAN port and associated transceiver
> >   - Bluetooth portion of the IW612 chipset
> >   - WiFi SDIO port
> >   - user buttons
> >=20
> > The WiFi portion of the on-board IW612 chipset is still not supported
> > upstream, but since SDIO is a discoverable bus it will be probed once it
> > is.
> >=20
> > Signed-off-by: Francesco Valla <francesco@valla.it>
> > ---
[...]

>=20
> Hi Francesco,
>=20
> Do you ever tried bluetooth feature? The bluetooth failed to scan with
> 'device-wakeup-gpios' property.
>=20
> Regards,
> Joseph
>

Yes, Bluetooth was tested using bluetoothctl, I just briefly re-tested it
with latest master branch (7.1.0-rc6).

Can you clarify what you mean with "The bluetooth failed to scan
with 'device-wakeup-gpios' property."?

Thank you

Regards,

=46rancesco



