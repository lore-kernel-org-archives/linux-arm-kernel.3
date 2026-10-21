Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1830E606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 18:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r3ha1u8z;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=jUzWPHj/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=poRJPGt/tQVP3cq5GkCmpkVOZhsjuIUoSdSevhNUZGA=; b=r3ha1u8zjgx2/M+Xdqz8z58n48
	+hfiZjhojmQJXxR1f3jzCdMWDMT+EqPNxakTxdQ7Es1VV9abpvmeTDLkKuqYbvBv3HLMm+6iwuPmk
	oydAp8l2bZEKXBMXdL9jU7cFXQMzVpVFpjXewwjTepe0wYd/PuBuwyfy73diJHKHkvRIF/33h62b2
	2CrUsau2rFqgOUPTMPEp4Cia9u8wVLPWjwYGfImzDPyK6VCM9qPiisl+QKwyGbFNZEms8NszvUwDL
	IurDAJ7XzDSLds8ejaAgvY3Vhrvx4B+O33HtAgdgjXMQ+F63v+iyG925KCXy31V1EVTr0jtjCo22v
	RXoMCK0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJahB-0000000Cc3L-2US3;
	Wed, 21 Oct 2026 18:05:49 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJah9-0000000Cc1O-0zKD;
	Wed, 21 Oct 2026 18:05:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792605943;
	bh=u1NJ7iPwSqksBo4kmNU/fQeqoWOdC3qmPcDydleD2LU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jUzWPHj/puEpbnunz3zzRwWZh1q40d7fEYPIsxDw8bIkkoidCGw6w/OY7ohmNSZT3
	 esYWOwmaZULu13KNMbdThmwu0JvPlBrc7N2UTHV80NOncgkDvejqGvtCNW5dFb//5v
	 99x8eHe35MTV2L4Y4hlo9NZXBSEanBAbVK8pLkmPaHQQnk33MGP9IGMaEDqYe9ua9y
	 npsnUKq32mTESwFMZh9CDTxI/aiHslRLs37L0CQUcgG6Xx5WpEP4ZxYbIDvrUNUCNP
	 jh4ju5oaNCPsbz8quOp8K6GaGWz9wubbS6nNGCUhbMlMkG/WoHFBD1VUiZIb8vmCtX
	 03lGT5Sr9ERzA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A45AF17E0928;
	Wed, 21 Oct 2026 20:05:43 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 66D8A480031; Wed, 21 Oct 2026 20:05:43 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Wed, 21 Oct 2026 20:05:29 +0200
Subject: [PATCH v18 4/7] usb: dwc3: core: add post PHY registration hook
 for platform glue
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-4-60000d03fca2@collabora.com>
References: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
In-Reply-To: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
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
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrY/vedIG+V8B/ZmgJaGZ8GI+lWufmYtxAe9
 +lCbg0mG1JNNIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq2P73AAoJENju1/PI
 O/qa9pcQAKDlfDbyLeOyeNn8M8VfKsd5z2isXeI2HZwm+L7XH4k1t9TzAf3ZlQ3oFlx+uAM+We6
 XK+9Bu8aAyUCGHLeTvBPY0I9x0LY+pPUM5re2P0JNTi9UBwMtJ7xwywf1kYG6MYSuegTiLl/1pm
 NqY5OVDOZ8CcDKDGbzYFHwim4+k4xbWc1eX4fqWArgiZExNHSnDjRd4qnFBKxYyIwan61gfrFa7
 oxRlaZO1AFiz00Xxt7sz92eu49iPmvTLlj+RKN2POJtshGG9cuq+L1tqJ1sX1zannLcsvOMv9AS
 bFgb7r8C+1XXmsmuTAZ/Qc/J9YlPAyzk8tY7E15OUsMoDkGiNNAM9k+IqhmYNRyflzICj4jW7D/
 eolqOZotoK3CYKpgR8GepiQysA9JC4QJdzXZ/4Pf6S8MYaPb1kTYjGNBkblTrqU5O4oKyAWhWds
 aF9rQ2r1rL6viGAsXKl2RIz3Ddj2H2myeNBNLllqYJzpsU7htUPZ8ZBdxx8qLKsdEQlZjGuicD8
 5NOx9CyhRgaUhHWJn+WDXAU9sUG/byh0MsQhpe1F9qv6JRSG2JQUurarTa0hR06+wZN+vh/mhYD
 uhtT7u8lUnMmCA31zD2JUHHYEIERWY1NMNvwueZ/cYJHtbUVD3tHb6n/4/kOTHOIksz0Jp2J6wI
 0jYCECLXihtRRdrBIf0A1UQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_110547_427034_E12CFEA2 
X-CRM114-Status: GOOD (  13.78  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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


