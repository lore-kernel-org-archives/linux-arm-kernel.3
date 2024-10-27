Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FFBD10C1E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 10:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=amR7q2oyVDCPTD+JFf82ITSsa06XHfywxM0dpjUf838=; b=sfGWAPjeuT9BxkkZDH/w6s1XX8
	QdBUZonDiNpMO9BPfpDAMm5YZfB3BEt2jLYxhKtaJLkBUY3WXseXcGduFUXKrBzFTk5Pu8Fn/uSc7
	eHzYSQh7Up3Ab+JwVnm4J4moGrs6RBf/Qp2jkyYJ05Wb6/0NffNuAqhTS8yN0A4ADnwbdi+pjoGKd
	4njY61ElZ4pfzPmy0w+DlJcTUDOGcZnvo7hQC8L5e6E3N6RbZ/fICF8MyylyhE22pPTZcRLqJGUfJ
	ck7DbAb3wTpVjtaeZKQC6l9kp2oe3UBe0PRaKSWqFqe3aCHN7EdXSoZINQBc4SBiWNZcuIBGublrQ
	diX2mZfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t50yk-000000084WT-0D6J;
	Sun, 27 Oct 2024 10:58:38 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t50u3-000000083z4-3XXe
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Oct 2024 10:53:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1730026407; x=1730631207; i=wahrenst@gmx.net;
	bh=amR7q2oyVDCPTD+JFf82ITSsa06XHfywxM0dpjUf838=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ZBX1YAGKM2Q/ODHSMEsAPVCDNJKQoTGDrkCrMBmmxNoEpGSo9yVS62oaOLZo1CzP
	 R4A3NMBYSNKFNSfP7ScX7Uhwic1XSDBHWMVBYJhrVFbXsKPlMOlO6e2fRJSc5V/An
	 p4PAATukfbWlLPzIDbjH5XCwqB7qki2ykfdAfdcmDIa7mVZ/nFO+HNN43uJXgO+ik
	 fNr34Rjl3dKUQmYmaBbIMT1ZgsWFc8kqtCc4D9BQ7Mu5a4zoY5EqHHV/BtVnbeARh
	 Ezls6bTTIM4CoBejkt0BuYdFDUDEwXJY50TWkCQPAkxqL3+sZdskUfu3jjo+X2+l7
	 2BR7TpudzDK+Y1M8eg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MBUqL-1tAGU433Tr-00Fy6z; Sun, 27
 Oct 2024 11:53:27 +0100
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
Subject: [PATCH 2/2] watchdog: imx7ulp_wdt: Add TOVAL range check
Date: Sun, 27 Oct 2024 11:53:23 +0100
Message-Id: <20241027105323.93699-3-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241027105323.93699-1-wahrenst@gmx.net>
References: <20241027105323.93699-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ixQ/x90mo5PXTNYv1EsxxaUkhBxYLnesal3lNThiz4oNmP4n7fx
 5QKMtzxeA9Pt/dQjRqqtPkMj6oFihuqlT4eqwLUY4cIQUvi3nNkrTVidnHvScU7UrW9ajTk
 AKr/P/rMT8MpbipfOXACjic48sCCjJygKbGBO77Q2qOrm74IG0bwjyShZ2ZKzlLUnXiu/pu
 4bnWGW7HsupuDzudeU10w==
UI-OutboundReport: notjunk:1;M01:P0:pS39l6IyZ+0=;YaLHbpVjVmMlZS4hLYsRGTYNuMC
 oh1uaH0n7KWLYHXQwFxe58i6SwePAWsvzD1aRDpKyHa/C0QeSKBSzDuA8GA4D0GMod7fDRyhs
 N5jY0yusM52G0xSaljoxt1oJEaNztN/lO15yOt/sVmoblyfswdA6gmeRjnyYgIxCIqwsM/JhN
 MGIIapPHs+pCsntIYdXj3hY2lqB0079/oc1N+j9lnc0JEBUp2nW5a6HsmKjfIwTCEqo+OW+bX
 M6ygEWveXIm3EkX5VYzuH1MZAIHOrGrEFsZDoSn+yJB92PimNIkAm2LfcKRKuS208khHNUokf
 J0iGcjX/ZFmNt607Nuv+atmPd0o+QYc34rNkSwfrqx5kjtv9PRLu1Ze99uZDoDdYBGCwXVuGW
 hSyamM90b2anO/CiYctB10tuaEDhry7qfcpxSjY/DoFUzML7FlPkp7CQM4kk3K0cuMnVTjRdz
 iixarDdcDiUDcCjgYxaNKR0WLv1ToEHdEq2EBmdFZMo0e3vVeF+VQnd9AoPROuE1YrS2N8RAS
 K8elx+HT/hZ76nFVKzNe7009Kp1b7Uv0VudHLH+Id1Nodq64TzsM+UMw6I5UruWhuo0hu7DJv
 k64Mh91nXHkYyKf2Z7ROnJTRTC1w8sb9flrVPub73gVpUN+juJhXRWCVDYNLO/x8f9Zqt5oO7
 Dpdl+P2ItlI8IKSkFAlE54G7Pgeuw/ELdU+ocdexywQsUHOCUDKn0B1FJtsqqz5eQjwRW4Yiv
 dImIBpwarPvp0/uy/38acPAtB/kgwMprFuZPvuIn/9K2it9HoSUM5yIiPmdfVrOOiLpDtN1mo
 IGTbHeamI4OKEha2gm3NTeCQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_035348_196436_1B2AAFE6 
X-CRM114-Status: GOOD (  10.48  )
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

The WDOG Timeout Value (TOVAL) is a 16 bit value, which is stored
at the beginning of a 32 bit register. So add a range check to
prevent writing in the reserved register area.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/watchdog/imx7ulp_wdt.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt=
.c
index 0f92d2217088..a7574f9c9150 100644
=2D-- a/drivers/watchdog/imx7ulp_wdt.c
+++ b/drivers/watchdog/imx7ulp_wdt.c
@@ -48,6 +48,8 @@

 #define RETRY_MAX 5

+#define TOVAL_MAX	0xFFFF
+
 static bool nowayout =3D WATCHDOG_NOWAYOUT;
 module_param(nowayout, bool, 0000);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (defa=
ult=3D"
@@ -192,6 +194,9 @@ static int imx7ulp_wdt_set_timeout(struct watchdog_dev=
ice *wdog,
 	int ret;
 	u32 loop =3D RETRY_MAX;

+	if (toval > TOVAL_MAX)
+		return -EINVAL;
+
 	do {
 		ret =3D _imx7ulp_wdt_set_timeout(wdt, toval);
 		val =3D readl(wdt->base + WDOG_TOVAL);
@@ -286,6 +291,9 @@ static int imx7ulp_wdt_init(struct imx7ulp_wdt_device =
*wdt,
 	int ret;
 	u32 loop =3D RETRY_MAX;

+	if (timeout_clks > TOVAL_MAX)
+		return -EINVAL;
+
 	if (wdt->hw->prescaler_enable)
 		val |=3D WDOG_CS_PRES;

=2D-
2.34.1


