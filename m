Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC67CD6E6E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 01:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d7RcozIfkgTb1ceMrXgVzxfNf3AdsB7YSa91tWGMELg=; b=WPdQX30UEjkJCT1rYWMpwxbIIF
	2ej+e6Tyxx6OGw3jSJxxauN2fWt/6jYCF20lTvmGNBzny8hLLtGQFkwXJDeEGrkq6+N1uv9JOHKIM
	6o9P3RIVkiHRPqWaIvxsb9A+Gfyjw1Vnfo3BWw5qYQYadeXsAhFf7ntsVi6orpaw9Sv5xcgqY2v3T
	weYr08AmyOhadqZTzglRW6SSuJmP0aUOIXVsTTcE+FUKSEp31A2KDytQcZokv5cBesgKT1sVHMbGx
	0I65yMekoV3vkaMeNyjkwknFAs3eufwtPNYaCRQji5mrkQ4JTHaoa1Jx1yeA5dvj4CGby4FG1tRRw
	JObUN/dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVIvX-0000000HThZ-0ulv;
	Fri, 05 Jun 2026 01:00:47 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVIvU-0000000HTfC-3T8e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 01:00:46 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-4854d5cc708so851978b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 18:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780621244; x=1781226044; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7RcozIfkgTb1ceMrXgVzxfNf3AdsB7YSa91tWGMELg=;
        b=BHiL12/wavN1Ek4UUd77OSD/+stbL6Zf30oON+rAXTQ7x4QtYRk8dzV6wfYmcCxE6U
         DHQrE6Q/FtGvJZk8UnMWDkt7ykHo7LQvutnEM/vSZBDlaogYqdMAjyKUWUsyZoQLxUjw
         BgTBtVkbquj5nQglzeg0QgvjHgJP6xqPq+oTbmVQE0BlvxNJSdg01fzraQGroeWcp3oj
         c91H2qZfJHChIoKmxM21xtN4OKOEtV4ni9KjSq3VfETgmiTxYusJti+geuyE1Sglf7SI
         W2WdYSnQ5a/3A83vvPdxC0ouDbT8JthkSpTVKefIPjvF+3UYQlHoaXrmvw96g0d//NY/
         8qgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780621244; x=1781226044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d7RcozIfkgTb1ceMrXgVzxfNf3AdsB7YSa91tWGMELg=;
        b=jxdimV1rtdBYdGoz52Bv41YsDaLZ1XuBgNP470lkFnB2fupcgs+W11PI7VVMKcFXX3
         F5K0nqhIlrEiMyBwsb3L3/yY8MANj2DLTEyDw3paJAZrJ9IPpFpBcXO2TYgUZt0s7c/c
         BsMtS2C0RYvJsX0U9apAnyr9jutJpNyWn7iOMuUsbnF1nuCVeA6HQ5SluV2hOPc62YN0
         ODwNjvhNq4p2mWhFB5feU/mq/rsII9HQkAVul0oW+ezmmSxMr7yYhCxk+1gX1aYb7zdE
         Nm2r0YJ7DfWl525qX8i6+DJNKjOkeTbUdIFrRR5+KlpGZFcFqGZWmsfROtWhWCqvJH6b
         C1Jw==
X-Forwarded-Encrypted: i=1; AFNElJ+VWCIvP6CQkDlteb8EmJVvFcMlFb50jX3i1tDm0CwooAUd49FA4q25JWHWyrQ+GJXjpH3O2TbvkPpPUVBmECpF@lists.infradead.org
X-Gm-Message-State: AOJu0Yxra7c58kcHnwhykPNrQ0gBDgNlD3308zS7MK+8dMkPR7K6JG3c
	W6t9XZblw3Zjsjc5wf7rbxjp5LNr4F5WWTgRcfOzzJKu/fNKNk1E+DDjdoWsGKlu2hI=
X-Gm-Gg: Acq92OF1sr03FsdkyMN/kuxr3NCoZddOCUsNHnJI+YBMSb+6siC2Kyzvq+MeFsXKsHW
	/etMWSj9Sdt+TIJnRrJKsA9gNPGARJyHwQeN2h7HnroUI0JL/zLGI2BqpQOEI4gWBb+VLhz9QtA
	jsmVum8ntQ1Nur6MmvjZFv2dg3TkdYc4cU78ZnUFwnh7UVZHDVy0z+viFBReI3m7OQOyPzEE/YP
	RNn0v2wJYfkX7p8EisTiumumXgjT9NkNPMmSJvL2kov6DoZOxVem31qXAVTvCuEzbV84clAkKse
	kOlv4TaWndHx1fGVZBh8O5GhRarDI3jq96Mu12TijmYqlVy5i3QdoEgPrPK+DdRKD2u1nFzdzaB
	AVJHii5yKM3UsFITCnlEhRAMuZhTJC1DQSPoEY9iL36yEesQ9Y2CLJpzJwbutBieli+M9VACMNy
	GR/OdyoVTBnT8pMvZTltJ/bQyFT54BtBAV9fSGoA==
X-Received: by 2002:a05:6808:a599:10b0:485:a99c:cfe3 with SMTP id 5614622812f47-4868df4dd74mr546927b6e.42.1780621243759;
        Thu, 04 Jun 2026 18:00:43 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b6ec694sm5544631b6e.5.2026.06.04.18.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 18:00:43 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: Daniel Thompson <daniel@riscstar.com>,
	elder@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	a0987203069@gmail.com,
	alexandre.torgue@foss.st.com,
	ast@kernel.org,
	boon.khai.ng@altera.com,
	chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	hkallweit1@gmail.com,
	inochiama@gmail.com,
	john.fastabend@gmail.com,
	julianbraha@gmail.com,
	livelycarpet87@gmail.com,
	mcoquelin.stm32@gmail.com,
	me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	richardcochran@gmail.com,
	rohan.g.thomas@altera.com,
	sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn,
	weishangjuan@eswincomputing.com,
	wens@kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 05/14] net: pcs: pcs-xpcs: select operating mode for 10G-baseR capable PCS
Date: Thu,  4 Jun 2026 20:00:12 -0500
Message-ID: <20260605010022.968612-6-elder@riscstar.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260605010022.968612-1-elder@riscstar.com>
References: <20260605010022.968612-1-elder@riscstar.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_180044_900876_ECE30272 
X-CRM114-Status: GOOD (  22.06  )
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

From: Daniel Thompson <daniel@riscstar.com>

Currently the XPCS found on Toshiba TC9564 (a.k.a. Qualcomm QPS615)
is unable to operate at 2500base-X and slower with a PHY connected
using SGMII/2500base-X (in our case a Qualcomm QCA8081).

The problem arises because this XPCS supports 10Gbase-R. That means that
the reset value of SR_XS_PCS_CTRL2:PCS_TYPE_SEL (0) is valid and this
suppresses the modal switching based on bit 13 of SR_PMA_CTRL1 or
SR_XS_PCS_CTRL1.

A fix for this behaviour is already implemented by
txgbe_xpcs_switch_mode() as part of the quirks for WangXun devices.

Rather than introduce another quirk for TC956x let's attempt so solve
this generically by setting SR_XS_PCS_CTRL2:PCS_TYPE_SEL to a reserved
value when we detect the right we detect the right combination of phy
interface and XPCS feature support.

The generic strategy adopted requires the default value of PCS_TYPE_SEL
to be 0 on devices that support 10Gbase-R. Based on TC9564 documentation
and the logic already implemented for WangXun I believe this is likely
to be the case for currently supported XPCS devices. Sadly I don't have
access to generic XPCS docs to confirm. However I think the benefits
of avoiding a cargo culted quirk outweights the risk of regression.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/net/pcs/pcs-xpcs.c | 39 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 76c04372b5b50..e58103ae8dadd 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -705,10 +705,49 @@ static void xpcs_get_interfaces(struct dw_xpcs *xpcs, unsigned long *interfaces)
 static int xpcs_switch_interface_mode(struct dw_xpcs *xpcs,
 				      phy_interface_t interface)
 {
+	int mdio_stat2, ret;
+
 	/* Wangxun provides a full alternative implementation to handle quirks */
 	if (xpcs->info.pma == WX_TXGBE_XPCS_PMA_10G_ID)
 		return txgbe_xpcs_switch_mode(xpcs, interface);
 
+	mdio_stat2 = xpcs_read(xpcs, MDIO_MMD_PCS, MDIO_STAT2);
+	if (mdio_stat2 < 0)
+		return mdio_stat2;
+
+	/*
+	 * If this XPCS supports 10Gbase-R then that will be the default
+	 * operating mode. There are several interface modes where this default
+	 * is unhelpful. Change the operating mode for interfaces were we know
+	 * the default is wrong, and restore the default otherwise.
+	 */
+	if (mdio_stat2 & MDIO_PCS_STAT2_10GBR) {
+		switch (interface) {
+		case PHY_INTERFACE_MODE_SGMII:
+		case PHY_INTERFACE_MODE_1000BASEX:
+		case PHY_INTERFACE_MODE_2500BASEX:
+			/*
+			 * Why are we writing MDIO_PCS_CTRL2_TYPE + 1? We want
+			 * the modal behaviour that comes when we pick a
+			 * reserved value. XPCS allocates extra bits to this
+			 * field and allocates values from 15 down so
+			 * MDIO_PCS_CTRL2_TYPE + 1 is the value likely to be
+			 * allocated last (and hopefully never).
+			 */
+			ret = xpcs_write(xpcs, MDIO_MMD_PCS, MDIO_CTRL2,
+					 MDIO_PCS_CTRL2_TYPE + 1);
+			if (ret < 0)
+				return ret;
+			break;
+		default:
+			ret = xpcs_write(xpcs, MDIO_MMD_PCS, MDIO_CTRL2,
+					 MDIO_PCS_CTRL2_10GBR);
+			if (ret < 0)
+				return ret;
+			break;
+		}
+	}
+
 	xpcs->interface = interface;
 
 	return 0;
-- 
2.51.0


