Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80300D10C1E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 10:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8iAjfp3IZqNtfjG5p6rBm4nIaaA6IIY8fzarf/jnTV4=; b=0vSNzDOf2+LDOjpICsZ2q25mL9
	ZZwKIVkens25RwaW8IpY3riUuYeDVFC97iRkPCOiwgDMSuu1YJbvOueMrLmNO4pfJq1DmgT/8OkgM
	G3+fSzAiwdrkzv2Oqv+I3nKl5oB6gXWAWbCEXxJYg/uNll96cLn0H/Fy86QpToUqpIxTYRd8OQaS3
	hhGzqbgo4rA2mzKMLypO0MbrPy0Sy2/RKuIhylgchqF7a5r2MyVls86LvoDOpYYsZDhzKz0rXWKyJ
	SDXquHYIrmrg25nT/L0sw5n9cMyWoCNiSffCzjRNw6d1OPYMHR+8ASiua3U6pSSOmf89byFd1hiz/
	/RxnezyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t50ve-00000008485-0I4y;
	Sun, 27 Oct 2024 10:55:26 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t50u3-000000083yT-2bLY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Oct 2024 10:53:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1730026407; x=1730631207; i=wahrenst@gmx.net;
	bh=8iAjfp3IZqNtfjG5p6rBm4nIaaA6IIY8fzarf/jnTV4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=qsjma/KTfsBWZ7Ay0WZgqTunCSgisy+6kN9qVfz+DzCiDhtoZaiwYXR0PBuSQLZI
	 LTcGNadO1hsqJrvYnDVEEvnTUNrzICYJgEZgIxy5/bmuCiZr1OI6xldizRh8neAQe
	 6/y9NNqZA/eNco07S9qn6afmTLQJMqYVOWV9J3iQydK/SF9MMuPLVdst8Q5ZNw5V3
	 8ZMbKtiYf+2X08s0tUtMA8abk1ytBrGeKmXJw/mF4RNSzcffyqJCD1w+Y212CQ3/T
	 uLiOTHZPADaiJxGTpNtYtc17ncppc5oLscNriP3aIpM8tZeOSObmDMwsr0cqil+Qx
	 Zs32fuUPKrc0A9aWsA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N2mBa-1u1XtS3BFs-016h5e; Sun, 27
 Oct 2024 11:53:26 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Alice Guo <alice.guo@nxp.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 0/2] watchdog: imx7ulp_wdt: Improve readability
Date: Sun, 27 Oct 2024 11:53:21 +0100
Message-Id: <20241027105323.93699-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dPMOiJ9GJbaXK0x2k4K4y1HnNpBHzzvVLoB1lJKuePVd/q9fADX
 TyKyqzplLk7c0AKBNDqqWC+M23hqCBv7KwT9+45WH+mghrTP9GBuUrKEusG8Y0KoxtgAmCf
 e+eY8a47yfZ8cW2ChV8n/kWCdwrHRhHXc9F1JZ6xZEcFp8yKxDcpGYY/52y7EQJqMvZaphm
 chQpfT08ZBHK6Zbv0bOJg==
UI-OutboundReport: notjunk:1;M01:P0:UEX/VUDuIUs=;bxPMBdSJ3TZO+ouRniI5660LoTs
 GqRd24na/MuaoH4sCc/dM1+K5nymLZtjK+7lRtb2JQydUdb+c3CSWxMjiA0BW6UB14Wel0giM
 ibobIedPDP2m/YVKF4qGXwTLB/rKypn4YWUsYeuhuJvE7qD/gxLBHosFw2UphfuETMlXmrqwp
 yFpIAYqD6ajVA3tF6BivzjRLpnqpCtYbqiIQospQmOvmAIVqDfEfqcIi6yFUpSphkOoq3PxOk
 9fJ5eRddGyjWZnBljSz+RXc7Q8qtWnhvvvpFoqxh9QS0GDAUL4JAzcnRqJgOD9KT9DYDiS/Q0
 nAdgoLj9tot/YA5SfnWA3IyLwWeoucZAu2sbo9w5GdfAbp+ZoEOz+cwZ6/kcGJ3RdFs0EqaEH
 njuZzy0SCU/pEq/iAKjKKJwwJZ1XADBItrOBrtQU45AT4VIEtBAVAxlfkya4i8wwrnxPbg3XK
 0xNRWalhhe4AGxIHGUOiXs23z1OQEiksAJbfAroekor1c9xH+U8qfBLstJRrSdPI9XBJ24x7J
 3qgCK8LMVgOEdZDiThD5Mb2UHmF1nYneuU3B58jl9f/wG/XRUn2LWgzMHYsxoshrhwY3w4GpW
 773LCndWzqCR+h3X5mnixVd00y36LMAL7iY8M1D07u7S3RWWKnUCSvRS6mykXxjP0WEHouDTX
 93vOa53mmT1pWCzuOYiZX9IMlrmOVOifnZPQN60Ue3OirrPeXKVzHTj+lCJC3h+FiDCHYDboz
 YN4fc9kpydtiCTr7FzS/YDPVXo5gI3gm67ZEaQkRvza1c6nrZ79yMlbTJ94wezLNWBQhn5S0O
 9dt2jq7r9Iu//TV6/VrS2pTQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_035348_041321_F04B3231 
X-CRM114-Status: UNSURE (   7.36  )
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

This small series tries to improve the readability of imx7ulp_wdt.
For someone who didn't read the reference manual, some parts of
the watchdog driver are not clear.

Stefan Wahren (2):
  watchdog: imx7ulp_wdt: Clarify timing units
  watchdog: imx7ulp_wdt: Add TOVAL range check

 drivers/watchdog/imx7ulp_wdt.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

=2D-
2.34.1


