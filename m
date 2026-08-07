Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60180C2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 18:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=orOcx+0zIDpiRcc2SkmZHxzgzqfO3PwPkgxvWwLlRMg=; b=D1fnRq/snzC+vw7+Y2HOaLaE9t
	ejkVeL50b13tSzkn51FKSIERIL5YcaBsIUp4dwhkV9pJcsLF+oMgllj/Nu9kSia6LpUTDys+j6z33
	gx1gbquGp3eQOrfL+PXUgMyE32nxaq1jqZOnQtMo5SIPI893TOKaU0GT77KGTjDrvS8AaqR45/Ouv
	MsyxedT/7q5REcw1IJ78igYqJm1P3f0DaJuExNYUSu1WwQjT0IFphhjOWAwPlNAd3Gx8n/w0PqqEQ
	aZUwMFopybJMgryj1yvLUivR9SQbiG62nyD/xMMVToVbKB2mgZZrFu2ob2pHOWliURaexLkoE4q2b
	UhX3Dvww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsPHu-00000008bgG-3F2m;
	Fri, 07 Aug 2026 18:27:22 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsPHs-00000008bfW-17Yh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 18:27:21 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-47fe2d179e2so2388681f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 11:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786127238; x=1786732038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=orOcx+0zIDpiRcc2SkmZHxzgzqfO3PwPkgxvWwLlRMg=;
        b=j2nem/bmOrLCEYPGzh5mVqWr7mnpxZxCb1yjLc1v/HBuZIjMMEGytN9MsmSkWBaD2Y
         5yE3AZJFJK6Pr1JEGcLcg6pX6x/bAre1/BBW4tJwVuRODZ64JZ3gq91j5Uhm+38P3f03
         y3s5zCZ1aXprmFq2KOxi3DLH3AbPA6aTtj0kZERqkM2v7qMTSPd7JhTkr5DR7kwFsSqQ
         TONJ9AG218GmF1SbWerp1qBnxU8bZR7enYpd7tpKEbbzCPcMrMuGAznJjEfCsujUa0em
         xu2e7PB0zhcZu0mIH7IeEel960wPBNsQDmaBNTHxzDaIiJmFDa9o7qdNBG4XefRSqud6
         V0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786127238; x=1786732038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=orOcx+0zIDpiRcc2SkmZHxzgzqfO3PwPkgxvWwLlRMg=;
        b=Ug/2vAMzSDMP+6Ya+oB9W2RiBr3EcI3E16rQtTn+yDPVzCCBXCl3kheeVuGBuFuE/x
         Q8gVyzvZu9pqZ0xAHkxXMHfPrCYXRX0MimIwPVPJnennU094/eFJLHKKSNHCa0YKDgsK
         6ry87hhUeG1GqU5sq5Yq3AhgYIUazblskOBR5vAknRXa9dceIjgr6XmauVLiyB7WBSMs
         mfDA7WCjNKNmuAFe2hIztLg8rHpz8pQ3VU4w76qzFtIjpfuwMvUEEVJxH/ddVzSt+Mbv
         h6Y3ilfXPAGwOZ5TjZ1TDCq28rDONGTsoQFkck1eMDejP/ZPy9p3EhpU8L1vExBFr6wK
         JgOw==
X-Forwarded-Encrypted: i=1; AHgh+Rpn/jYvVlruzz7huVo/ZcEM3u65IdcDYWa2RZGXSrTUTsGBQ6DiFSkok1/96isvrGqLAJWJ91aoJqgW9hnhTONT@lists.infradead.org
X-Gm-Message-State: AOJu0YwbyUbhJY6wQXPcH6hG6F3jvFfu1jWRz6IoI/DfGCWFiZeQaImA
	SmDoYXL/vYkcGkveyZpJXD8/gMdPZgclozNTPYrmZsFVW+rWk3glywpI
X-Gm-Gg: AR+sD13vyvH/4HIO5N91DuxPRIFFsmzkh/Mw7KcroKPMcg/zcmed7Z6Xrb9qjYBrRKC
	mbCCHynwlFa48Js2y+oQg4R3SwTR+ZV9Om0J2Hfxx4rpD2f3R0PRxM9EvtLuZOSayJE1D4bdNN6
	6UZn+uRTMT2PBj5wp4TNzcZ0fHnBavMGlQ042Ju3s6G5xeaGOhzPBxY1EOYSUFIhb12TYA7Ks9r
	kaZ8oCc9rEYwFpLDLVHckKIOZWwH2KA+NzdpdVo3YRtoxIZRdoMkv05xdFANg7K2xt6LntMOP6J
	BoS1UX+MjYs6Erii0YYNMVAJWCk+h8Gd1yRtCoFbWdKmyQqAIxkr0N3ZlCw+6KwckTRMGXl1v66
	yfr0buLs9cGPOuIVDQQZeaoVJzoXDI5ZowpgSlWW703+uebXuO9ad4BcSoB4HNi6+VhbDBbUSOy
	R2bZizhxpz0WtrfCyBtKKEh94v5yg/PMx/cBuQz3atyUbioYHIK0071WAurv3eb19RK6OgTzX/9
	t3ZYqAERwjbRgWZdGl6LQRkoWGuwzBubackwdfGRhQ32Iqz2uYEVinMra0POtDJtUtC/JfDvE/A
X-Received: by 2002:a05:6000:29d8:b0:47f:95e8:2ebf with SMTP id ffacd0b85a97d-47fec51b693mr28900997f8f.12.1786127237757;
        Fri, 07 Aug 2026 11:27:17 -0700 (PDT)
Received: from localhost.localdomain ([176.222.12.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e7b3fsm8543886f8f.20.2026.08.07.11.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:27:17 -0700 (PDT)
From: Georgi Valkov <gvalkov@gmail.com>
To: briannorris@chromium.org,
	andrew@lunn.ch,
	chunfan.chen@gmail.com
Cc: francesco@dolcini.it,
	johannes.berg@intel.com,
	kees@kernel.org,
	miriam.rachel.korenblit@intel.com,
	wenst@chromium.org,
	rafael.beims@toradex.com,
	avraham.stern@intel.com,
	peddolla.reddy@oss.qualcomm.com,
	error27@gmail.com,
	s.kerkmann@pengutronix.de,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	stable@vger.kernel.org,
	gvalkov@gmail.com
Subject: [PATCH v3 1/2] wifi: mwifiex: ignore ROM regulatory hint on WRT3200ACM/WRT32x
Date: Fri,  7 Aug 2026 21:21:23 +0300
Message-ID: <20260807182124.41572-1-gvalkov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <anWWr80yAcOQaVVS@nxpwireless-Inspiron-14-Plus-7440>
References: <anWWr80yAcOQaVVS@nxpwireless-Inspiron-14-Plus-7440>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_112720_321291_8B3EFAF8 
X-CRM114-Status: GOOD (  17.41  )
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

WRT3200ACM and WRT32x routers always report a fixed US regulatory domain
from the mwifiex ROM, which conflicts with the platform regulatory
configuration on units sold outside the US market. For example:
- phy0 mwlwifi 5 GHz, hard-coded region 98 EU mapped to FR
- phy1 mwlwifi 2.4 GHz, hard-coded region 98 EU mapped to FR
- phy2 mwifiex 2.4 and 5 GHz, hard-coded region US

When the system boots, it detects a conflict between the user selected
region and the radios, e.g. BG FR US, and applies extreme restrictions,
preventing use of 5 GHz and DFS channels. This also affects phy0.

Implement a device-tree flag, which allows affected platforms to ignore
an incorrect regulatory hint in the ROM, so userspace can set the correct
platform regulatory domain. The radios in WRT3200ACM/WRT32x are locked to
the hard-coded configuration for which they are certified, so the only
impact is that the region conflict is avoided and the 5 GHz radios can
be used.

The change affects only platforms which explicitly define this flag, and
helps overcome the incorrect behaviour of proprietary radio firmware.

[1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
[2] https://github.com/openwrt/openwrt/issues/9956

Tested-on: WRT3200ACM, OpenWrt
Cc: stable@vger.kernel.org
Signed-off-by: Georgi Valkov <gvalkov@gmail.com>
---
Hi Jeff,
I did not consider the idea suggested by openwrt-ai, because I do not
understand it and I do not know how to implement it.
Any help is welcome!

v3:
I implemented and tested a better approach with no board specific code:
1. check for a device-tree flag in mwifiex_register_cfg80211in()
  !of_property_read_bool(of_root, "marvell,ignore-regulatory-hint")
2. add this flag to the root device tree of each affected board
Currently this affects only armada-385-linksys-rango.dts,
because Linux has no dts for venom. OpenWrt will take care of that.
This approach is more flexible and scalable, because the flag can
also be used in other drivers, e.g. mwlwifi (not part of Linux).

v2:
Replace the compatible device names, which are currently only available on
OpenWrt with board names which are available on both Linux and OpenWrt.

 drivers/net/wireless/marvell/mwifiex/cfg80211.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/marvell/mwifiex/cfg80211.c b/drivers/net/wireless/marvell/mwifiex/cfg80211.c
index abc703441c5d..0239b1c9214b 100644
--- a/drivers/net/wireless/marvell/mwifiex/cfg80211.c
+++ b/drivers/net/wireless/marvell/mwifiex/cfg80211.c
@@ -4899,7 +4899,14 @@ int mwifiex_register_cfg80211(struct mwifiex_adapter *adapter)
 				country_code =
 					mwifiex_11d_code_2_region(
 						adapter->region_code);
+
+				/* Allow platforms to ignore an incorrect
+				 * regulatory hint from ROM, so userspace
+				 * can set the correct regulatory domain.
+				 */
 				if (country_code &&
+				    !of_property_read_bool(of_root,
+							   "marvell,ignore-regulatory-hint") &&
 				    regulatory_hint(wiphy, country_code))
 					mwifiex_dbg(priv->adapter, ERROR,
 						    "regulatory_hint() failed\n");
-- 
2.55.0


