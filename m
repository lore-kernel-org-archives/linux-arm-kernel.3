Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4EA106F306
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 08:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=16+VF+5NHe0xa6HKIQJNpMGjFD6+6C6+LsFOsle4G8I=; b=wvHDJux9cigV2UifOT7zpuuWrI
	s6ScoK4dBQHkROgTp7OLsPBxdnOdKP19MrRVNDRSnVnd7VceSs8Z8wAltJjBqYFCfjUbOpuQBGqCo
	mKcjr9UkU8QSsCYTuukhq8UEwyUkSzTUBM647rnyU8UOdbX+P5dZ7JNFTHhx4rHF8eOfM9M33aEI0
	fkx4g0HrlffK5Wm90ZEIeZvCmBmO6m2oVoWZccxJ8FmQN8rtEMWuvqVS/S/i8UJzUZABFnQ42nAK2
	CW6AWkvfKjSJ5OqU39szokMZy5n8+u/WQ20L33F/78ZvZS0w2X2jyUNKo1lz0ny3S8wzQi5A0XPjW
	43MZl6rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gV4-000000054oF-2B5q;
	Thu, 26 Mar 2026 08:55:34 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gV1-000000054ng-3I0l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 08:55:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=16+VF+5NHe0xa6HKIQJNpMGjFD6+6C6+LsFOsle4G8I=; b=iEAGnl2VulXKw6ECzvCLf8JTFu
	tXygYWgoPUrKW0tfgmjj4Tw+qE0vUIKYTj7zEwbGhXAPicnyPggeBdLeOXbL2hnVllkggz8WvMqNY
	WOMACd0OLcDD8f9uIBq4/PcVKPe5xU+HH80+sUn09sBlfI9TaSpo8t5tSvBrftoq7qvE1YKu89xmG
	oZBw2yfgr4WknsgL5VXZfcifqg1hBtnd884r4B2L9Ycm85ZKB1ADkpWA24h+fhIsIkU7YOS5I9ERh
	bfY70C36/SRc83nVdCfPoZzSVfwHyb4shU/+k/iUhyPRuiz3eKUx4UlQYJVoOrfQ0vXevMcYmUVEY
	tcYob3vw==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w5gUq-000Lpa-1r;
	Thu, 26 Mar 2026 09:55:20 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w5gUp-0005Ky-2v;
	Thu, 26 Mar 2026 09:55:19 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Cristian Marussi <cristian.marussi@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 sudeep.holla@arm.com, philip.radford@arm.com, james.quinlan@broadcom.com,
 f.fainelli@gmail.com, vincent.guittot@linaro.org,
 etienne.carriere@foss.st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
 dan.carpenter@linaro.org, geert+renesas@glider.be,
 kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
Subject: Re: [PATCH v2 08/13] firmware: arm_scmi: Harden clock protocol initialization
Date: Thu, 26 Mar 2026 09:55:18 +0100
Message-ID: <5980695.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <acPUxJ3N0QptmtlJ@pluto>
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <9b574ac5-09fa-4e7a-b2bb-a339fbb319bc@samsung.com> <acPUxJ3N0QptmtlJ@pluto>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27952/Thu Mar 26 07:24:52 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_015532_447240_8555E206 
X-CRM114-Status: GOOD (  20.46  )
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

Am Mittwoch, 25. M=E4rz 2026, 13:27:48 CET schrieb Cristian Marussi:
> On Wed, Mar 25, 2026 at 12:02:41PM +0100, Marek Szyprowski wrote:
> > On 10.03.2026 19:40, Cristian Marussi wrote:
> > > Add proper error handling on failure to enumerate clocks features or
> > > rates.
> > >
> > > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> >=20
>=20
> Hi Marek,
>=20
> > This patch landed yesterday in linux-next as commit 0d8b0c8068a8=20
> > ("firmware: arm_scmi: Harden clock protocol initialization"). In my=20
> > tests I found that it causes a regression on RK3568 Odroid-M1 board=20
> > (arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts), cpufreq and GPU=20
> > device are not probed properly:
> >=20
> > # dmesg | grep scmi
> > scmi_core: SCMI protocol bus registered
> > arm-scmi arm-scmi.0.auto: Using scmi_smc_transport
> > arm-scmi arm-scmi.0.auto: SCMI max-rx-timeout: 30ms / max-msg-size:=20
> > 104bytes / max-msg: 20
> > scmi_protocol scmi_dev.1: Enabled polling mode TX channel - prot_id:16
> > arm-scmi arm-scmi.0.auto: SCMI Notifications - Core Enabled.
> > arm-scmi arm-scmi.0.auto: Malformed reply - real_sz:8 calc_sz:4 =20
> > (loop_num_ret:1)
> > arm-scmi arm-scmi.0.auto: SCMI Protocol v2.0 'rockchip:' Firmware=20
> > version 0x0
> > arm-scmi arm-scmi.0.auto: Enabling SCMI Quirk=20
> > [quirk_clock_rates_triplet_out_of_spec]
> > scmi-clocks scmi_dev.3: probe with driver scmi-clocks failed with error=
 -22
> >=20
>=20
> Yes there are multiple reports of issues on this hardening, the series
> is on hold and wont go into v7.1 as of now...it needs some basic fixes
> and various quirks probably to address non-compliant firmwares...
>=20
> It will be pushed to next again with a few more fixes in the coming
> days and then we'll need to figure out how many quirks will be needed on
> top of that and if it is acceptable at all...

Just for the records: imx95 (maybe imx94 as well) is also affected by this.
My board doesn't boot at all, because all the clocks are provided by SCMI.

With this diff I can see it's the 'ext' clock
=2D->8---
=2D-- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -1253,8 +1253,11 @@ static int scmi_clock_protocol_init(const struct scm=
i_protocol_handle *ph)
        for (clkid =3D 0; clkid < cinfo->num_clocks; clkid++) {
                cinfo->clkds[clkid].id =3D clkid;
                ret =3D scmi_clock_attributes_get(ph, clkid, cinfo);
=2D               if (ret)
+               if (ret) {
+                       dev_warn(ph->dev, "scmi_clock_attributes_get failed=
 for '%s': %d\n",
+                                cinfo->clkds->info.name, ret);
                        return ret;
+               }
=20
                ret =3D scmi_clock_describe_rates_get(ph, clkid, cinfo);
                if (ret)
=2D->8---
> arm-scmi arm-scmi.0.auto: scmi_clock_attributes_get failed for 'ext': -2
> scmi-clocks scmi_dev.6: probe with driver scmi-clocks failed with error -2

What's the idea of how to proceeed as apparently several platforms are
affected?

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



