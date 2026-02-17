Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CEAE6814B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 09:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g3Lh3x5eN1+MwtWPxLGVQJB3/EkXY4ib2jrNj8kojNw=; b=Z0H8KTGykXTKGHaW6Ez+WUrxKl
	LSl2qrgR9YAAHQLW7rp/xM9EJr60glf/jTmtyjZpeED1PG5ewvXHSY3Kco0o0dHobtyUCoMLpFHN5
	ncTlAFiSDy2Fh/03aBHExhBrTFCz3Gk2swY5b7KDVw2dUSmRi8OLpLVu2iXcYIZmKeC8MNH2g/1lP
	KEvlHR9B6j/zTcqAa4nWLUeWhkkFZgw4BerZHL0WKTO516KTsu4inj9GHBLcHBzfpQyKwjFt0EWkq
	QSDT5vTDK2FBSwCKlTRnbGmYyWlIugYaGViFRNdGcKPy6NSQb2DVUoRsNDVVJrRHMYHJ42YYWh4BC
	4G9ntPjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsGvx-00000007tPq-07xu;
	Tue, 17 Feb 2026 08:59:53 +0000
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.84])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsGvt-00000007tJE-3iyP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 08:59:52 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1771318696; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=N5NKF5qAWVzJW+9JMfXCXbw2ItDwUYZWhfe7AU+TWofdBR4juLd4ArujgyYBtXMzNz
    UGOdeyRsoPTrWD0gqHdSAgdGQJ+5fiFogrgUBbrvOJFsD83wHCUEyDLTb19a39lrxSQC
    JFiE/pTxgQjKwxsAODL4rqv1U5+cGu4F1pZmrqxXPD2mPvlPup0SLI5umwi43HdEt0x5
    vF6APsjpehu525hHh7ylNtvhRcbEEQPQ7q4q0B9IzbWCZ/GLGxuWFKD60wGuukKuy8Aw
    p0sU02zt1ReA9lmmZgjzJdyPWoMnXvPVAHf8HnaZ6i4RujGP95+z64lQECQ+Kih01g/x
    pFzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1771318696;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=g3Lh3x5eN1+MwtWPxLGVQJB3/EkXY4ib2jrNj8kojNw=;
    b=QH+d/vpdbYmj9NK8PdjOhn+YiZ/9uEcQLREq0zZYXnfaWrGkFqEj2sAEWgs3QDMOuR
    zafahhwt3Xj/RIHUaagdkrSGzqx1wWNM7lO8cRt69uhu8TuCKMdRy1wtcT+9TRuhitYN
    OZMmxfLfmnVmlDdkQ/7OI8eqrbLgpZUt4PoOIou879y38ln8Vsa+bbgiyNeJB6oJS8bX
    VgKn7VB47Wb1bSYtgDpnths4v94RMLIeGjQEEb5v9K3KiDEgFh3qki26OSYdz9fZowxF
    uZ6DgvWj6n0biJHANTcxH1w4CGS0tJT5Y4ilI1NgUwfgbLAGuZLcD9qtx1tpqYDvahSz
    AEVg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1771318696;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=g3Lh3x5eN1+MwtWPxLGVQJB3/EkXY4ib2jrNj8kojNw=;
    b=ospiU61IeMuOvrYdBQ8qog14QOBf7+miFN95tjWj/dkts49K4qfjMKxiEEf+o6ntWl
    5zaYbNCej2WNzNX7Z1nt5QxglEnFt5lkuqm5c0nIiPwzJ+qS2cDMLKINNHLKdNJ6pFM5
    dGOLaYWHGeUk4D18bna2dud8J4ipcC1dgONJ3bp4kUm1xKN/VgjEHTb/9768FjpdK6qv
    zJnTaNUER4yBEi3ujslmN0VW5bB2jO+1hAeALgtFeupTdwi/7U3on13Vd9siIjp3yo7F
    Xa56YbfhvYXJH99uZWECkWw30WNAzRVTBNF0b4jSgCtBY4eg4rykA7uV3ver6LUl61al
    zJZg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1771318696;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=g3Lh3x5eN1+MwtWPxLGVQJB3/EkXY4ib2jrNj8kojNw=;
    b=kQ+nSb1NwmDiy76JK9jHniF2lNp/mbBDQQr+pP4XCihUEW3zVMwDH/Hk/vqTzzYn+I
    6IdIOOrDd7FiYy16vcBA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yeD0Z"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.0.1 DYNA|AUTH)
    with ESMTPSA id Q3a36b21H8wE9wS
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Tue, 17 Feb 2026 09:58:14 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: Re: [PATCH 1/5] ARM: dts: ti: Enable overlays for all DTB files
From: H. Nikolaus Schaller <hns@goldelico.com>
In-Reply-To: <20260216161155.09fae580@kmaincent-XPS-13-7390>
Date: Tue, 17 Feb 2026 09:58:04 +0100
Cc: Robert Nelson <robertcnelson@gmail.com>,
 Andreas Kemnade <andreas@kemnade.info>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>,
 Tony Lindgren <tony@atomide.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Bajjuri Praneeth <praneeth@ti.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <0EE0658D-56A7-480C-BF71-6B2EB81DC41C@goldelico.com>
References: <20260212-feature_bbge-v1-0-29014a212f35@bootlin.com>
 <20260212-feature_bbge-v1-1-29014a212f35@bootlin.com>
 <B3366A17-641F-4E02-A5D4-978F525E0A96@goldelico.com>
 <20260212174718.7daccb70@kemnade.info>
 <719BF710-26DF-49AB-A016-D2306F0389E2@goldelico.com>
 <20260212231907.6120a2e2@kemnade.info>
 <CAOCHtYicmeSzH5Q2_qTwAZw3s+__JRwUrXvz01+KCsJJHAznUw@mail.gmail.com>
 <20260216161155.09fae580@kmaincent-XPS-13-7390>
To: Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: Apple Mail (2.3826.700.81.1.4)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_005950_181525_D9B4EAC6 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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

Hi Kory,

> Am 16.02.2026 um 16:11 schrieb Kory Maincent =
<kory.maincent@bootlin.com>:
>=20
>>>>>=20
>>>>>>> Am 12.02.2026 um 16:26 schrieb Kory Maincent (TI)
>>>>>>> <kory.maincent@bootlin.com>:
>>>>>>>=20
>>>>>>> Allow overlays to be applied to any DTB. This adds around ~40% =
to the
>>>>>>> total size of the DTB files on average. =20
>=20
> Yes, I will move on to this solution for now to avoid too many =
complaints about
> the devicetree size increases.

I have done some experimentation with this patch (on top of v6.19 and =
our private defconfig)
but could not find any DTB size increase.

Does it require another patch or CONFIG change?

BR,
Nikolaus


