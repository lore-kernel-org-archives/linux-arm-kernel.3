Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E1DCC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 12:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Kh5SdlSvibikUKFhryXYDVTfus/r9Yk+xHdIRL6yqg=; b=qr0fdyQI42R8Tx+h6myyVSSyuQ
	st9saEi2F3P8rU8NAFbr8tUQqizpA3XlsgfnIlEUQCZK+ZSvCiXu8fKbW5Fmi9c3RByu6Pt8uZnR3
	moOS84rFo6X94Fb1gWqu88bfZniS/O22Ady3uY9qMd7PlyFx+PJnORxHaYZs/EnbJBgnOD03gWt2h
	uAMzlGWvWAYyR0JPKhW72QBy8b7JZyLK6v7r9sHJVd9Hg0U8D35jI61H8P8C5hdJZNexuAV9E7zK4
	PCxOsEpzG5ja+3RzztZsSU1aTI+ytSXUFlgFPbYqZBsuxsmoZFuA4QfZ8iy9aeATUlXxXmazj+mua
	Wol3BI2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhoy0-00000005z8V-07Dy;
	Fri, 01 Aug 2025 12:34:32 +0000
Received: from ni.piap.pl ([195.187.100.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhojz-00000005o6t-3QhM;
	Fri, 01 Aug 2025 12:20:05 +0000
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 8E5C3C3EEAC9;
	Fri,  1 Aug 2025 14:19:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 8E5C3C3EEAC9
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,  Heiko Stuebner <heiko@sntech.de>,
  Paul Elder <paul.elder@ideasonboard.com>,  Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>,  Ondrej Jirman <megi@xff.cz>,
  linux-media@vger.kernel.org,  linux-rockchip@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: FYI: i.MX8MP ISP (RKISP1) MI registers corruption
In-Reply-To: <m3qzxyug1s.fsf@t19.piap.pl> ("Krzysztof =?utf-8?Q?Ha=C5=82as?=
 =?utf-8?Q?a=22's?= message of
	"Wed, 30 Jul 2025 12:30:23 +0200")
References: <m3h5zbxkc6.fsf@t19.piap.pl> <m38qknx939.fsf@t19.piap.pl>
	<175308758352.3134829.9472501038683860006@localhost>
	<m31pq9y98z.fsf@t19.piap.pl>
	<175326599663.2811177.16620980968274114885@localhost>
	<m3h5z2vw12.fsf@t19.piap.pl>
	<175344176070.2811177.10693943493658922992@localhost>
	<m3qzxyug1s.fsf@t19.piap.pl>
Date: Fri, 01 Aug 2025 14:19:56 +0200
Message-ID: <m3cy9futcj.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_052004_024624_BEABD8D9 
X-CRM114-Status: UNSURE (   6.83  )
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

reporting from the field :-)

At this point I've something like the following:
- run camera apps in background (so the clocks etc. are up)
- while (analyze_mi -m1 -s10000000 -r -a 0x32E21400 shows errors) {
	change_clock 0x30388A80 3 3 # 50 MHz
        change_clock 0x30388A80 0 3 # 200 MHz - the original settings
}

It all takes a couple of seconds.
I guess I made some minor changes to analyze_mi.c, can post it
if needed.

where change_clock writes directly do the CCM registers
(MEDIA_APB_ROOT_CLK) and sets "PRE" and "POST" dividers (3 and 3 =3D
800 MHz / (3 + 1) / (3 + 1) =3D 50 Mhz and the same for 200 Mhz.

It appears to work. I'm getting (Connection closed =3D reboot):

MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 9,999,999
Register 0x32E21400 mi_ctrl value          0 count 1

MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 16 =3D 50 MHz
MEDIA_APB EN mux 2 pre 0 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 9,999,998
Register 0x32E21400 mi_ctrl value          0 count 1
Register 0x32E21400 mi_ctrl value 0x00010001 count 1

MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 16 =3D 50 MHz
MEDIA_APB EN mux 2 pre 0 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 9,999,988
Register 0x32E21400 mi_ctrl value          0 count 12

MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 16 =3D 50 MHz
MEDIA_APB EN mux 2 pre 0 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 9,999,781
Register 0x32E21400 mi_ctrl value          0 count 206
Register 0x32E21400 mi_ctrl value 0x3C380000 count 3
Register 0x32E21400 mi_ctrl value 0x000FD200 count 5
Register 0x32E21400 mi_ctrl value 0x3C440000 count 3
Register 0x32E21400 mi_ctrl value 0x3C140000 count 2

MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 16 =3D 50 MHz
MEDIA_APB EN mux 2 pre 0 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 9,999,999
Register 0x32E21400 mi_ctrl value          0 count 1

MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 16 =3D 50 MHz
MEDIA_APB EN mux 2 pre 0 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 9,999,752
Register 0x32E21400 mi_ctrl value          0 count 237
Register 0x32E21400 mi_ctrl value 0x3C140000 count 2
Register 0x32E21400 mi_ctrl value 0x000FD200 count 4
Register 0x32E21400 mi_ctrl value 0x3C380000 count 1
Register 0x32E21400 mi_ctrl value 0x3C440000 count 2
Register 0x32E21400 mi_ctrl value 0x3C2C0000 count 2

MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 16 =3D 50 MHz
MEDIA_APB EN mux 2 pre 0 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition

Connection to 10.0.9.123 closed by remote host.
MEDIA_APB EN mux 2 pre 3 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
Register 0x32E21400 mi_ctrl value 0x007A2001 count 10,000,000

Found possibly stable condition
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

