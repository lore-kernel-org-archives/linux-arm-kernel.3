Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904A2CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 18:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=poRJPGt/tQVP3cq5GkCmpkVOZhsjuIUoSdSevhNUZGA=; b=4hWWD5BR00zcA//JJN5Wa/0XUW
	7Z1fhcN+szuEHZd1XnMqrXnzNWHfmWQxshHRjQNz3yhjpPgSOEHw3A4mhuUAjvSEdRKYIKEJRoGRv
	DC10StVMK7ki+YpK2kfg/Mr2KRhUqJxwjj8UZSRxLkpPQGidCfRCjbvL7dg55kpXQzeCGZ3UMD37E
	wFHbKPrKprS6Ob7wVZntas1+heULJOolkc4ZFMd3QgQ28WcTaKp556F/qfcKrUCKvFv+lCK+w7+Bh
	jLKu/opLoMOH7ct/qxkCpOvehDPP+s1lMAyKAzAtFqAHscZwIYmJo1mp4XUCmdGjehZs0fGDoaxdY
	Hw8ESY+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHmuD-00000003i3R-0ZGw;
	Fri, 16 Oct 2026 18:43:49 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHmu1-00000003hsH-3moG;
	Fri, 16 Oct 2026 18:43:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792176214;
	bh=u1NJ7iPwSqksBo4kmNU/fQeqoWOdC3qmPcDydleD2LU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jFY8T34OoEmseB2CcfM4AMThycPAjSyWjXL+CYEvSmUDlMz/wrGZr5MkDo6xuKo3p
	 3u90BGGOwBuGGL+xSYRil0NqW7OR/SwxhvvkgJgGHTf1eNZLRjm2tdDa5WC0/LNgmx
	 V0hGpfD986ev+W+3W+6Q6y3w40rBkRZTEFwnUbyXs6PeDhRfPEoHciUaWY2K1b1DFb
	 HWSDD8+8Hftgn8J1CVGg4KvTQL2lDmC8cQto5EDzVnxy+8vXMmbWooDiHnhyik2lSr
	 kz6CdguoPk6YJTgH/GLxkGkYucGDCWH309m/u++rpag/6Tm2aXQMHJP61HyOZpqszW
	 gZoKwLzRX60ag==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AE73317E142F;
	Fri, 16 Oct 2026 20:43:34 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 659FE480031; Fri, 16 Oct 2026 20:43:34 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 16 Oct 2026 20:43:20 +0200
Subject: [PATCH v17 4/7] usb: dwc3: core: add post PHY registration hook
 for platform glue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-b4-rockchip-dwc3-rockchip-glue-v17-4-876f96893e2f@collabora.com>
References: <20261016-b4-rockchip-dwc3-rockchip-glue-v17-0-876f96893e2f@collabora.com>
In-Reply-To: <20261016-b4-rockchip-dwc3-rockchip-glue-v17-0-876f96893e2f@collabora.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Igor Paunovic <royalnet026@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2142;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=u1NJ7iPwSqksBo4kmNU/fQeqoWOdC3qmPcDydleD2LU=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrScFaMBVUE9wtc4lIDEBce3ZzSkHe7LF8Mj
 maEpr0E2aj5AokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq0nBWAAoJENju1/PI
 O/qaHcAP/2gUzpAqxA+EJEqvViGGk1bo38n1+QJ0ulGoowOzXTOf/QruXeXlojDpFUxZsEfEiN7
 qrJTzDUDEhbULxl09qXjIH79G03J/6I2HkqjZXmvEjvLxcbTIZosQMClTCkIAzj7a1zMg8CL1iv
 ME9tMPqQszs57xY2IQDHr1Euk4+rK/TRbu7Kcx8ksWMuFVyFxNA0TSx3vFHW+mz+OJ3PIgg3fYM
 o8X0rjYajFHeylCn3D+1v8IR4G79DB6ihXO2c/33Sr6EyYxK+pHCeQnrXXblwgdIDBxH4vA1TPx
 HpwV4Oy1QQjfAPyM7ISjOJL6xirma1nIEUPJK+ZYkc6SaFOxtVwOpZCGB3YaKIMrebzwuX76J/I
 Zc2ZbJu5wek/wImfK3OfLWL/dac4tQL3Yw1iAuLZUAmfd/0I+lxy6VbW1WWVrwr4Nt3FmYrfvAW
 wYIiZrTHIBwXsUrWJvMtxsCNfcgCh4TdxMWigUyX3x665lngXMKaPawQgMhGmS0Of09boAt/NNk
 OwLW/KvuCboXf7/BDj6VOXIVtfsMHX7bLR+6J+UnsJydyfonfoa8rTJgKqBWG0UqXi4VnJtBNPZ
 1r+Pu2JvnTLL405je+N0J6G9OwLZ2AZRx7BJU/3UzFSZQgO56ueZxPrLQG0qZVDwsiKt/X+Ezhd
 ri/tuvasEhQE2ngKCXiw4Jw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_114338_124711_D5CDBAE7 
X-CRM114-Status: GOOD (  13.45  )
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

Add support for custom PHY handling steps in platform glue code
by adding a post registration hook. This will be used for handling
PHY reset notifications on the Rockchip platform.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Reviewed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/usb/dwc3/core.c | 2 +-
 drivers/usb/dwc3/core.h | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 4b7132887a03..daf5aec07fbf 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1613,7 +1613,7 @@ static int dwc3_core_get_phy(struct dwc3 *dwc)
 		}
 	}
 
-	return 0;
+	return dwc3_post_phy_registration(dwc);
 }
 
 static int dwc3_core_init_mode(struct dwc3 *dwc)
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 608daeb7ef10..e9d8df0a298e 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -995,10 +995,12 @@ struct dwc3_scratchpad_array {
  *				need to be passed on to glue layer
  * @pre_set_role: Notify glue of role switch notifications
  * @pre_run_stop: Notify run stop enable/disable information to glue
+ * @post_phy_registration: Called directly after PHY got registered
  */
 struct dwc3_glue_ops {
 	void	(*pre_set_role)(struct dwc3 *dwc, enum usb_role role);
 	void	(*pre_run_stop)(struct dwc3 *dwc, bool is_on);
+	int	(*post_phy_registration)(struct dwc3 *dwc);
 };
 
 /**
@@ -1655,6 +1657,13 @@ static inline void dwc3_pre_run_stop(struct dwc3 *dwc, bool is_on)
 		dwc->glue_ops->pre_run_stop(dwc, is_on);
 }
 
+static inline int dwc3_post_phy_registration(struct dwc3 *dwc)
+{
+	if (dwc->glue_ops && dwc->glue_ops->post_phy_registration)
+		return dwc->glue_ops->post_phy_registration(dwc);
+	return 0;
+}
+
 #if IS_ENABLED(CONFIG_USB_DWC3_HOST) || IS_ENABLED(CONFIG_USB_DWC3_DUAL_ROLE)
 int dwc3_host_init(struct dwc3 *dwc);
 void dwc3_host_exit(struct dwc3 *dwc);

-- 
2.53.0


