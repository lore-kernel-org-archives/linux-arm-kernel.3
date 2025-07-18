Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76475C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 11:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3BbJt3R+qU+ADebZO7TwQrN6GPJxUsIHJ1I8ydh0wcI=; b=wtuTDVQBV9/uYZ
	mYrevIFQFhqA/UAxGEtwL7vJwy2ia2de4dqymDAdQ73dHUAtX3fuZ4IZtrzBMiD2Lv/Ek6XrQA0bD
	Ngm2/QWDbJL0/hbebtT3hSFqEx9kqFizkUHBGm4HML1jEVukaR+x75PT1Dg/XPc3HGOHAJB6VBx5U
	0+Z2dwPu9jDH/kWcHWBBohSP8HW9dwGeGzsaS+/iuvvCidzRLMgLeeNFiTGmS6+9dzE/QkOrRAOoW
	QuOhyCLBldpWibu2UXC1y+4WrNytiAgfeQLEQ31Ta4JxosfZ/MkuOu9F2bKU/DdW89o3qMYZYVV1V
	lHas4ltHph+b59u29w8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucji5-0000000CWg2-2RT2;
	Fri, 18 Jul 2025 11:57:05 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucidC-0000000CLFt-0iV4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 10:47:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=3BbJt3R+qU+ADebZO7TwQrN6GPJxUsIHJ1I8ydh0wcI=; b=yExcoxNZKWTTIZhnRXAYAHso3s
	OudtLAvDcTsZineRvyQLm8Mk3LEk7dmswSd0DrMJpXqs4zO5baOI9sx511zUkjbG3PpU+DcJHHJGb
	qtnay2HzS/ObM3zpT689qXRGpiqSIBgSPa+5bOiytoDBv31zNK5GNtr5/pKvcNq3uHvrPiuC9JYQR
	N4g2kWbIRz4sjdmI+60ZePfIr2IF9ye7OrzE8l2T3plcXOLwW2xQmjF7PtVErns62UraaCYVqWoAe
	y1fBPB8TYE7z7k5u/FQ7/2quuWsMPxLHIhmVO0NKly1wZ4l86J02YhPyRKeGRXZmjNmrTF+nL1IQF
	X2T8nAHg==;
Received: from [122.175.9.182] (port=63508 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1ucicT-00000001fpB-3Gd5;
	Fri, 18 Jul 2025 06:47:14 -0400
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 5381C1783FF6;
	Fri, 18 Jul 2025 16:17:06 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 3796017823F8;
	Fri, 18 Jul 2025 16:17:06 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id cWEBUX0fp7Qx; Fri, 18 Jul 2025 16:17:06 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id EF0841782069;
	Fri, 18 Jul 2025 16:17:05 +0530 (IST)
Date: Fri, 18 Jul 2025 16:17:05 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: kuba <kuba@kernel.org>
Message-ID: <3177386.41994.1752835625751.JavaMail.zimbra@couthit.local>
In-Reply-To: <20250716140926.3aa10894@kernel.org>
References: <20250702140633.1612269-1-parvathi@couthit.com> <20250702151756.1656470-5-parvathi@couthit.com> <20250708180107.7886ea41@kernel.org> <723330733.1712525.1752237188810.JavaMail.zimbra@couthit.local> <1616453705.30524.1752671471644.JavaMail.zimbra@couthit.local> <20250716140926.3aa10894@kernel.org>
Subject: Re: [PATCH net-next v10 04/11] net: ti: prueth: Adds link
 detection, RX and TX support.
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - GC138 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds link detection, RX and TX support.
Thread-Index: WD2ZZiR+YZPLg2Mi+QxyCOGhb2V2/w==
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.couthit.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.couthit.com: authenticated_id: smtp@couthit.com
X-Authenticated-Sender: server.couthit.com: smtp@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_034758_292271_A16B071D 
X-CRM114-Status: GOOD (  14.28  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, edumazet <edumazet@google.com>, glaroque <glaroque@baylibre.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, robh <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, saikrishnag <saikrishnag@marvell.com>, m-karicheri2 <m-karicheri2@ti.com>, jacob e keller <jacob.e.keller@intel.com>, pabeni <pabeni@redhat.com>, richardcochran <richardcochran@gmail.com>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, mohan <mohan@couthit.com>, s hauer <s.hauer@pengutronix.de>, Prajith Jayarajan <prajith@ti.com>, rogerq <rogerq@kernel.org>, basharath <basharath@couthit.com>, ssantosh <ssantosh@kernel.org>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, pratheesh <pratheesh@ti.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, horms <horms@kernel.org>, krishna <krishna@couthit.com>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

> On Wed, 16 Jul 2025 18:41:11 +0530 (IST) Parvathi Pudi wrote:
>> >> Something needs to stop the queue, right? Otherwise the stack will
>> >> send the frame right back to the driver.
>> >=20
>> > Yes, we will notify upper layer with =E2=80=9Cnetif_tx_stop_queue()=E2=
=80=9D when returning
>> > =E2=80=9CNETDEV_TX_BUSY=E2=80=9D to not push again immediately.
>>=20
>> We reviewed the flow and found that the reason for NETDEV_TX_BUSY being
>> notified to the upper layers is due lack of support for reliably detecti=
ng
>> the TX completion event.
>>=20
>> In case of ICSSM PRU Ethernet, we do not have support for TX complete
>> notification back to the driver from firmware and its like store and
>> forget approach. So it will be tricky to enable back/resume the queue
>> if we stop it when we see busy status.
>=20
> IIUC this is all implemented in SW / FW. You either need to add
> the notification or use a timer to unblock the queue.

We tried out a "hrtimer" based TX queue resume logic whenever
the driver finds that the queue is busy. The results look good.

Now the driver notifies the upper layer to stop re-queuing and
a timeout of HR_TIMER_TX_DELAY_US microseconds is used to
resume the queuing. Currently HR_TIMER_TX_DELAY_US is set as
100us as the PRU can approximately drain a maximum packet size
in this window.

Soon after timer expiry, the driver will notify the upper
layers to resume the queuing by invoking netif_tx_wake_queue().

This helps to avoid the stack from sending the frame right
back to the driver.

With these changes we have performed throughput tests for
various packet lengths using "iperf" and there is no
degradation in throughput for AM57x, AM437x and AM335x.

Below are the "hrtimer" changes for reference. We will post
the next version of patch series with reduced number of patches
and with this hrtimer logic.

We appreciate any feedback in the meantime.

diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c b/drivers/net/eth=
ernet/ti/icssm/icssm_prueth.c
index a263df1fa511..9582246b1d87 100644
--- a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
+++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
@@ -36,6 +36,7 @@
=20
 #define TX_START_DELAY=09=090x40
 #define TX_CLK_DELAY_100M=090x6
+#define HR_TIMER_TX_DELAY_US=09100
=20
 static void icssm_prueth_write_reg(struct prueth *prueth,
 =09=09=09=09   enum prueth_mem region,
@@ -1022,6 +1023,7 @@ static int icssm_emac_ndo_stop(struct net_device *nde=
v)
 =09phy_stop(emac->phydev);
=20
 =09napi_disable(&emac->napi);
+=09hrtimer_cancel(&emac->tx_hrtimer);
=20
 =09/* stop the PRU */
 =09rproc_shutdown(emac->pru);
@@ -1109,6 +1111,9 @@ static enum netdev_tx icssm_emac_ndo_start_xmit(struc=
t sk_buff *skb,
=20
 fail_tx:
 =09if (ret =3D=3D -ENOBUFS) {
+=09=09netif_stop_queue(ndev);
+=09=09hrtimer_start(&emac->tx_hrtimer, us_to_ktime(HR_TIMER_TX_DELAY_US),
+=09=09=09      HRTIMER_MODE_REL_PINNED);
 =09=09ret =3D NETDEV_TX_BUSY;
 =09} else {
 =09=09/* error */
@@ -1161,6 +1166,17 @@ static int icssm_prueth_node_mac(struct device_node =
*eth_node)
 =09=09return PRUETH_MAC_INVALID;
 }
=20
+static enum hrtimer_restart icssm_emac_tx_timer_callback(struct hrtimer *t=
imer)
+{
+        struct prueth_emac *emac =3D
+                        container_of(timer, struct prueth_emac, tx_hrtimer=
);
+
+=09if (netif_queue_stopped(emac->ndev))
+=09=09netif_wake_queue(emac->ndev);
+
+=09return HRTIMER_NORESTART;
+}
+
 static int icssm_prueth_netdev_init(struct prueth *prueth,
 =09=09=09=09    struct device_node *eth_node)
 {
@@ -1254,6 +1270,9 @@ static int icssm_prueth_netdev_init(struct prueth *pr=
ueth,
=20
 =09netif_napi_add(ndev, &emac->napi, icssm_emac_napi_poll);
=20
+=09hrtimer_setup(&emac->tx_hrtimer, &icssm_emac_tx_timer_callback,
+=09=09      CLOCK_MONOTONIC, HRTIMER_MODE_REL_PINNED);
+
 =09return 0;
 free:
 =09emac->ndev =3D NULL;
diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.h b/drivers/net/eth=
ernet/ti/icssm/icssm_prueth.h
index 01586e6dbb66..c3f9c59ac6ff 100644
--- a/drivers/net/ethernet/ti/icssm/icssm_prueth.h
+++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.h
@@ -221,6 +221,8 @@ struct prueth_emac {
 =09 * during link configuration
 =09 */
 =09spinlock_t lock;
+
+=09struct hrtimer tx_hrtimer;
 };
=20
 struct prueth {


Thanks and Regards,
Parvathi.

