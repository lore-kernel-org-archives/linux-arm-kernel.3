Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D88C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 11:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JHDNbmOk6IeK+fJ4GGkS3gEg17jUkRH0OkVSzRfGV0w=; b=0pbCt2pwBTIMDM/9fJ0xngmdvw
	QeZZ3ajGhsTa035q3ZrohIvHfKHjdtCSUWtp7/oY2esCoFfsSEJYiZJnPl6tTr9uCfwIwfMZd1Bb5
	weF55fy7FJ05gJhbv1gnbU8mj5tPssIKy24F2uLVe5OnB4lKa9Aoe0XoPN6KCMNqYeOy1bJoP/qLw
	Dph8L7ZGMATYvt6w0sAXCxYj3R1bhjbRkvaryIu5EwjdPvK+bD+RKEIGQUVRjyR5Gdh9svSJ/xX1k
	9Hb/R5zROxDzkOeDHxT29LbZhaslOedt9tDtVX4Dwke1l3JDHZdGpithWmOVOPImbThkY02a/nUw2
	OgpAwPWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujFaC-0000000CZgn-2jmj;
	Tue, 05 Aug 2025 11:11:52 +0000
Received: from ni.piap.pl ([195.187.100.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujFO6-0000000CYB1-0msy;
	Tue, 05 Aug 2025 10:59:24 +0000
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 31BA4C3EEAC9;
	Tue,  5 Aug 2025 12:58:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 31BA4C3EEAC9
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,  Heiko Stuebner <heiko@sntech.de>,
  Paul Elder <paul.elder@ideasonboard.com>,  Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>,  Ondrej Jirman <megi@xff.cz>,
  linux-media@vger.kernel.org,  linux-rockchip@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: FYI: i.MX8MP ISP (RKISP1) MI registers corruption
In-Reply-To: <m3cy9futcj.fsf@t19.piap.pl> ("Krzysztof =?utf-8?Q?Ha=C5=82as?=
 =?utf-8?Q?a=22's?= message of
	"Fri, 01 Aug 2025 14:19:56 +0200")
References: <m3h5zbxkc6.fsf@t19.piap.pl> <m38qknx939.fsf@t19.piap.pl>
	<175308758352.3134829.9472501038683860006@localhost>
	<m31pq9y98z.fsf@t19.piap.pl>
	<175326599663.2811177.16620980968274114885@localhost>
	<m3h5z2vw12.fsf@t19.piap.pl>
	<175344176070.2811177.10693943493658922992@localhost>
	<m3qzxyug1s.fsf@t19.piap.pl> <m3cy9futcj.fsf@t19.piap.pl>
Date: Tue, 05 Aug 2025 12:57:07 +0200
Message-ID: <m34iumujcs.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_035922_394219_9FFECC99 
X-CRM114-Status: UNSURE (   5.58  )
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

Hi,

just in case someone finds it helpful:

SError Interrupt on CPU3, code 0x00000000bf000002 -- SError
CPU: 3 UID: 0 PID: 40083 Comm: devmem Not tainted 6.15+ PREEMPT
pstate: 60000000 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
Kernel panic - not syncing: Asynchronous SError Interrupt

What did i do? Wrote 32-bit value to an ISP register (0x32E22E2E4C =3D
a histogram-64 register) while repeatedly reading other ISP
registers (in userspace). The video stream was active.

This ISP apparently has its own problems.
--
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

