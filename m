Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE7FC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 19:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BO7dqYJ0mFt6AruqzPFv+fb7G3WbK8VL0A3Owandm9g=; b=LxtFAGHmAlS0IZr2B6uogDOZKN
	ATuNjt2OgoGnysUtrPfWUDn+pt6S10qf7ePcoHvmei8YdfeiWAPEzhPEKRVW2IlFxQQpHrbJ/gcEA
	QHlmoMc15f+1iz6OByclpY2RbbKAkz2RQtW0TdddfXErPSnbGzh6lvSLuuegKCFkQn+EdQ50NgDc+
	OZ3pj9tK+vyipjz3TL2y/NcJ8z/XzywNpN2/UR5AirU/OS2yUpY4Ef4mS2NWuXqAYk0c2KIvPC7Bx
	PrP512CiobWJPm5eTcFPpAlTp9/IP9JGc5sWPyeiw4sSkvHG16YUubC22bqyxBcCIPqTpcF60y5f6
	gvkAxwYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Hk1-00000005RGs-3uRS;
	Sun, 06 Sep 2026 18:37:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Hjo-00000005Qyn-3JFG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 18:37:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C524B60A96;
	Sun,  6 Sep 2026 18:37:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62656C2BD04;
	Sun,  6 Sep 2026 18:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788719827;
	bh=HIg42Vsn0TNmV8kxJI54k7Wj89qIig0luyI+sG+agh8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JGiHzvVXZFi6R/WMjPm8By+ZLAS4DPhew68YEq0MAk2LAirDho3iepimJXWhURxA3
	 V62qZKppExPfR94QRzkGjK5YAa13dJ4IwNlvXrpZYlkWKC8S85Qyz4V5XD4kDKBvFn
	 8wvE8j3bnIIbjsveD+j4PaS2Ac8hRW8xwYxJ5GoE403cq9nlNBGJ+CH970PIlH94U0
	 0VprXoskBxjcGporkvMKTlBDgWMzbDI6fTNGEiZ/GRMKoVDK68/LsIfFxjlC+jG0Cd
	 YF2huZEMN9EkluMUAExncm8c+blPkrXOcb42FMdibaivvzYGFqBgjPakH0o2UnWwUO
	 myy/bVSrugypA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B241C79FA0;
	Sun,  6 Sep 2026 18:37:07 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 06 Sep 2026 20:36:26 +0200
Subject: [PATCH v2 03/22] usb: typec: tipd: Register a USB4 port mode for
 CD321x
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-b4-apple-soc-tbt-v2-3-1f80085f93fb@kernel.org>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2166; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=HIg42Vsn0TNmV8kxJI54k7Wj89qIig0luyI+sG+agh8=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9bcTbuX8HqzOHkmRlrHf5xS6rrOkaVksumZtuvWVtFin
 a+YGVw7SlkYxLgYZMUUWbbvtzd98vCN4NJNl97DzGFlAhnCwMUpABOx/c/wv3D+xkWzTmcX3Pkh
 YyHK7rVyCa+sQ3wqd9B7DmHh1MUWyxn+50apskv23p+/UJX9WOr+ggPHQkxWhbjsW2N49LqybqM
 lNwA=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
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

Register a USB4 mode next to the DP and Thunderbolt alternate modes so
that negotiated USB4 partner modes can be linked to the port. Identify
it using TYPEC_MODE_KIND_USB4 without an SVID or mode index.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/usb/typec/tipd/core.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index f76f563dc42b..8c7f93d4270e 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -211,6 +211,7 @@ struct cd321x {
 
 	struct typec_altmode *port_altmode_dp;
 	struct typec_altmode *port_altmode_tbt;
+	struct typec_altmode *port_altmode_usb4;
 
 	struct typec_mux *mux;
 	struct typec_mux_state state;
@@ -1312,6 +1313,18 @@ static int cd321x_register_port_altmodes(struct cd321x *cd321x)
 	}
 	cd321x->port_altmode_tbt = amode;
 
+	memset(&desc, 0, sizeof(desc));
+	desc.mode_kind = TYPEC_MODE_KIND_USB4;
+	amode = typec_port_register_altmode(cd321x->tps.port, &desc);
+	if (IS_ERR(amode)) {
+		typec_unregister_altmode(cd321x->port_altmode_dp);
+		typec_unregister_altmode(cd321x->port_altmode_tbt);
+		cd321x->port_altmode_dp = NULL;
+		cd321x->port_altmode_tbt = NULL;
+		return PTR_ERR(amode);
+	}
+	cd321x->port_altmode_usb4 = amode;
+
 	return 0;
 }
 
@@ -1347,8 +1360,10 @@ cd321x_register_port(struct tps6598x *tps, struct fwnode_handle *fwnode)
 err_unregister_altmodes:
 	typec_unregister_altmode(cd321x->port_altmode_dp);
 	typec_unregister_altmode(cd321x->port_altmode_tbt);
+	typec_unregister_altmode(cd321x->port_altmode_usb4);
 	cd321x->port_altmode_dp = NULL;
 	cd321x->port_altmode_tbt = NULL;
+	cd321x->port_altmode_usb4 = NULL;
 err_unregister_port:
 	typec_unregister_port(tps->port);
 	return ret;
@@ -1371,6 +1386,8 @@ cd321x_unregister_port(struct tps6598x *tps)
 	cd321x->port_altmode_dp = NULL;
 	typec_unregister_altmode(cd321x->port_altmode_tbt);
 	cd321x->port_altmode_tbt = NULL;
+	typec_unregister_altmode(cd321x->port_altmode_usb4);
+	cd321x->port_altmode_usb4 = NULL;
 	typec_unregister_port(tps->port);
 }
 

-- 
2.55.0



