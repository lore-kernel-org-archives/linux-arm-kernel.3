Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A0AC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 06:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zBUzUdqctRS3Kbs4jrLWahG8PDR6KJCN1AYI/hbRo98=; b=CMTjiXddoNall8rW2y7hJiyLts
	JLOcdKE2H+wL3TqQh4QLhUzHr3m7FbBDK10Vss4ZcPBuYzYDxYORcrrURexl9RZFiMKTuDJzHWngS
	/Q1WH6N8yORvGzMfA0FcVpw7Lvkw0myf1nwwfrXbIfC0UCzk220puZ5B+zOJ/ZIbQWXkqaHfBn2YZ
	Xb6hFSs3wv/VJmE8HUUmNF+D41IMSibSKxy4bWNICjPR1LJ19D3WY1MZkV0cAF4Lzvq+Q7CD/fLIQ
	QjWHEmwa5vaR9rSHY2vwNn0+FciM24MYbUGgC3NFxOi4INGCR6P85zp0pzfE5zimeqVmz+Y+UC3lO
	zdCuJT+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOVJ-00000007h1m-2Unh;
	Wed, 09 Jul 2025 06:42:05 +0000
Received: from mout.web.de ([212.227.17.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOSs-00000007gZI-3ukD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 06:39:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1752043158; x=1752647958;
	i=jan-david-voelkel@web.de;
	bh=zBUzUdqctRS3Kbs4jrLWahG8PDR6KJCN1AYI/hbRo98=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Wc7nGcMOVhuS6lLNr05rBgXge57LMSiMueLr/MVuPZwk3gW28L3pf9NgTyQSiA3B
	 wdhrNBOrKLIYXgzyl57/be7QHyz8yW8RKchekgE1m2LKg2G9+Rsi9Rp7lsjmq+yGj
	 1i3FSwsXHCkvrnX9cGwelJ5tHLk26FHlQeVMkpSBPJa9/Pca8C9YDBDrdifRjZP9a
	 ntg8Ft6MH9tc29/CjiQ/MDb/7IhgksBCf1CuItcqgSknQWOrgdhEAXo0EiMwEMpgD
	 Pt0P/YP2vxkaxVjAtGQF2xQLTl8MOpJKoBzIXIDshCopM/Pz2MfjY8IXrmxhfwGDl
	 ojrox60ufG2QtYT9cg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from MXODN22542.mvad.local ([95.112.233.210]) by smtp.web.de
 (mrweb105 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1N8Vsx-1un7tU42jZ-00xBwN; Wed, 09 Jul 2025 08:39:18 +0200
From: Jan-David Voelkel <jan-david-voelkel@web.de>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Janitawa <jan-david-voelkel@web.de>
Subject: [PATCH] i2c-imx: fix broken GPIO bus recovery due to missing recover_bus assignment
Date: Wed,  9 Jul 2025 08:39:04 +0200
Message-ID: <20250709063904.22055-1-jan-david-voelkel@web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XMtQhkgR34XjXAIEt/rXiyq2mhaNPCH75KNk+Ughr00A9KFjees
 Ce50fH9fo1DwIP1M6CCfq0B3+iQJUIzjhVP2il73nTIp7WMp2G7kRJQVox4xQApm6jFw4jP
 mH9X7GVe/+t3AbNwkugL4h5JXugu3E1xGSY8kO2c6laqOlDw3P3b6P7PqEtjXwiUjglHNwf
 k5GtLVTFuNBzA5cfiWiWg==
UI-OutboundReport: notjunk:1;M01:P0:vX5Dk7135jo=;VO8B/uyMo6AfXgqMmeneJcI8Yll
 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
 shiBiFfkOrRWIYnUKrbZj5g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_233935_421448_52F51EB6 
X-CRM114-Status: UNSURE (   8.09  )
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

From: Janitawa <jan-david-voelkel@web.de>

The transition to generic GPIO recovery support removed the
driver-specific bus recovery logic but failed to assign the
required recover_bus callback. This prevented the core from enabling
recovery, effectively disabling the feature.

This commit restores the assignment to ensure proper recovery
initialization.

Signed-off-by: Janitawa <jan-david-voelkel@web.de>
=2D--
 drivers/i2c/busses/i2c-imx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index c5224d43eea4..421f6da61f00 100644
=2D-- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1375,6 +1375,8 @@ static int i2c_imx_init_recovery_info(struct imx_i2c=
_struct *i2c_imx,
 	if (IS_ERR(bri->pinctrl))
 		return PTR_ERR(bri->pinctrl);
=20
+	bri->recover_bus =3D i2c_generic_scl_recovery;
+
 	i2c_imx->adapter.bus_recovery_info =3D bri;
=20
 	return 0;
=2D-=20
2.43.0


