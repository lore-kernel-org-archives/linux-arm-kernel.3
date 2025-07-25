Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6CADC87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 11:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DD9a8m0nnLeBvtdQn9yRpVCKbVg6ku18qIQ0e2NYX2I=; b=PJI2LkIWMafRFWLNiRu3+HQ2tm
	X/eFbEMNwPbr7fG0STjQqfkRV6pdcPydAyAZX4I98PpUmQnz1IYWuj3PQWU9ZWQD1DX+2vbW9xro/
	57BLlHxYsTkxwGeN4gbH8Vmp9AjqQJRobnFw3UHaO09/R6zDMFuaOpZNTDdjeywDoL1AaKEJcGxRQ
	G8hSfE2L9IK9LUkwyE5ldi0zL95ljMz/VqLGpnHPs0brj+d1k8P29tvTd8SYVCGzA6pGHi7o9QHQv
	c53XkOE2Rrt2HPn+8w32/fNNCip+J2JH6/8Kzt9KBYARP4KrbQ9vqEvBHYgAThR8oa4O1TThJR3CA
	3Kn1hWQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufGpH-00000009jyo-2umo;
	Fri, 25 Jul 2025 11:42:59 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufGIo-00000009fz4-3R47;
	Fri, 25 Jul 2025 11:09:28 +0000
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:42d3:9d3c:5909:7714])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 35B929CA;
	Fri, 25 Jul 2025 13:08:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753441724;
	bh=DD9a8m0nnLeBvtdQn9yRpVCKbVg6ku18qIQ0e2NYX2I=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Yfra4dTYCpYEurSs1VX9mxKAISYSLd25+1s+GwCAYMqTn76AoJYXfEbtmXtzuTeWZ
	 I7JOnIekZMKHCjgjn36xQWfr9TNV3VE/Su5J+WUnDWTCf0sZrJwW0ol0hkl3xupo4/
	 O2rufElKrQMkQGE/7HCl9k5ZYhEWdFEygTGdKlfY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <m3h5z2vw12.fsf@t19.piap.pl>
References: <m3h5zbxkc6.fsf@t19.piap.pl> <m38qknx939.fsf@t19.piap.pl> <175308758352.3134829.9472501038683860006@localhost> <m31pq9y98z.fsf@t19.piap.pl> <175326599663.2811177.16620980968274114885@localhost> <m3h5z2vw12.fsf@t19.piap.pl>
Subject: Re: FYI: i.MX8MP ISP (RKISP1) MI registers corruption
From: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Heiko Stuebner <heiko@sntech.de>, Paul Elder <paul.elder@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Ondrej Jirman <megi@xff.cz>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Krzysztof =?utf-8?q?Ha=C5=82asa?= <khalasa@piap.pl>
Date: Fri, 25 Jul 2025 13:09:20 +0200
Message-ID: <175344176070.2811177.10693943493658922992@localhost>
User-Agent: alot/0.12.dev8+g2c003385c862.d20250602
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_040926_992741_F3F98C98 
X-CRM114-Status: UNSURE (   9.97  )
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

Hi Krzysztof,

Quoting Krzysztof Ha=C5=82asa (2025-07-24 10:21:45)
> Hi Stefan,
>=20
> > Just a quick heads up. I ran the tester and so far no unexpected
> > results. I'll run it from time to time after a reboot to see if I ever
> > hit that condition.
>=20
> Is your camera(s) connected to the first CSI?
> I cannot reproduce the problem on csi0, it seems only csi1 is
> affected. It would be consistent with NXP's workaround commit text.

Yes in that case it is connected to csi0. I sometimes have cases where
one is connected to csi1. I'll rerun the test when I use tha device
again.

Best regards,
Stefan

> --=20
> Krzysztof "Chris" Ha=C5=82asa
>=20
> Sie=C4=87 Badawcza =C5=81ukasiewicz
> Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
> Al. Jerozolimskie 202, 02-486 Warszawa

