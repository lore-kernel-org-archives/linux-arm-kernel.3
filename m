Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCDD8C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 13:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ANKFJL+4g3hT6rm4pjq+cXyt9Ea6eGkRY/USXwrE9rI=; b=yNHger9X3FFVNazi6R72HRlVYd
	/QDWnMnuIiNz9bHfd1mOalP067ct1RJfWYUMn5EL5QTJ0GBUjP6ePwLIFUR7d48GK3pabLtdqv23r
	Nq3fJTfuHv83Dyu8pCZBN35WIgZ2rWDAT8rOItqDhrxcii68upIC0jLEnJQ75mswFq9CU97T+sy2A
	Vz67Mm3sCv6ARQPiCvhgD+wBZhXffFu0kmISKFpxiu9dqCG2eoZJKluV1zPxHINfjDrSly/kQxIAp
	FbobDI3cg9HEF/9a2Z4ZYTxicWcBAy2YVsjoJ49CKSG/ylWimocuqju08M8E4iLreNSRcGHu601rQ
	+hegQUPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51k4-0000000Gpvv-2aPE;
	Fri, 11 Sep 2026 13:56:36 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51k1-0000000Gpua-18Cr;
	Fri, 11 Sep 2026 13:56:34 +0000
Received: from [192.168.1.182] (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F19D363C;
	Fri, 11 Sep 2026 15:54:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789134890;
	bh=YliyGa1zgtLzCslNtNy69+u4K26DzRw41YQWRHAfEEw=;
	h=From:Date:Subject:To:Cc:From;
	b=U7BpDuNlhRVM0K60TlVEkGHyUbgbrDvi+M2vv00ER96hmSlZKuOR5ahjEvqX6kIlS
	 LTFB5zkcol9L9eqmTEwO8k7rnpZi+jOwI38zDOg0yK1jZ3vFyzgE0+0A89uVzbPdUK
	 PiTpniUwFqBdC99PCv/AKUPAepWs6fbLXYOszp4Q=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 11 Sep 2026 15:56:19 +0200
Subject: [PATCH] media: rkisp1: Fix Bayer demosaicing bypass
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-imx8mp-demosaicing-bypass-v1-1-5568a7a560a6@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBA0auUWTuQBCmtVxEXyWSsIyQNGZVK6
 d0b6/It/l9BuQorXLoVKn9EZc4N9tQBPXyeGCU2gzOuN6O1KGkZUsHIaVYvJHnC8C1eFUNwwzm
 ORL430PpS+S7L8b7e/tZ3eDK9fkPYth0U3IppfQAAAA==
X-Change-ID: 20260911-imx8mp-demosaicing-bypass-bb284d9cca60
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Paul Elder <paul.elder@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2230;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=YliyGa1zgtLzCslNtNy69+u4K26DzRw41YQWRHAfEEw=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBqpAiLYotbsXztTLtL3Y62JssWfvgaG33MhwjZL
 p3pkjDgG7qJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaqQIiwAKCRByNAaPFqFW
 PGW8EACrl1v7ZaaUem+zDs0hBnvGm+Aruh7c2kHnj93EfLP8sJtTLacTiNEpSxNUVh+NSaCFkO5
 BHbyY2t9ZFGU4elfVaZpRJ9JIJhbwLIzWMi8G1u0WdzHWCTMng1BAsFOK3yNvPAhUJZDWOUrW5j
 uyLg08dcqwKncwZ3ccum73AQjGbsLyr9JFGokaffyL2lT56Z1OYpVlPGS0rUhS8hEgNwc39m/LV
 yJFw1EfnFr/iOGpzvAdqd1KcQ1KjxplJYc/9bAzjnIkgRv+XQfSJhxrQbSCj1q/wQZt2CzzfIGK
 tAqxuKpSh1lO+rC+hhuBHozhkE+umrV78uJZecWDFD3v3NSD/BPtwSxn02DPcc8FZ7DF17xiiae
 LeqLxDrDOgIRmT6EaOK2xYBVqbzNM+79pptMjO0+UoacZBzeiS+M39R2/QMi76fO0OkkYyZG85i
 xa5AVgV8SD+9AALGz6FsCLs7Wr2nO54na+GQNfQzHrN1TQeNAHThpABERscv5aoVC/orAOxq6dF
 9169VFrI6JviDuhULO2DSxazz9sawqnVBhwFtZqex9Uh3HRJSaX8kaXBe6mCzqZUjznTHUUFmR2
 Z9SN6JYwQJawNbF4DfjXh1hT7y0OS9C8KQFwGX5mfvc434ZBH3/DzdhyIA+z+2NU4HTR3zs02AP
 d9s7Ox7ApK9bVFg==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_065633_746814_8D1E7801 
X-CRM114-Status: GOOD (  10.88  )
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

The RKISP1_CIF_ISP_DEMOSAIC_BYPASS bit, when set, bypasses the
demosaicing block on the RkISP1 ISP.

The current implementation however clears the bit when demosaicing
have to be bypassed and sets it when demosaicing has to be enabled,
effectively inverting the bypass bit handling logic.

Fix this by setting the bypass bit when disabling the demosaicing block,
and by clearing it instead when demosaicing has to be performed.

The issue never manifested itself as libcamera hasn't an algorithm
to control Bayer demosaicing bypass yet.

Fixes: 6c53a7b68c5d ("media: rkisp1: Implement extensible params support")
Cc: stable@vger.kernel.org
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
media: rkisp1: Fix demosaicing bypass
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index 042b759eba62..496381962f1b 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -1854,8 +1854,8 @@ rkisp1_ext_params_bdm(struct rkisp1_params *params,
 	const struct rkisp1_ext_params_bdm_config *bdm = &block->bdm;
 
 	if (bdm->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
-		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DEMOSAIC,
-					RKISP1_CIF_ISP_DEMOSAIC_BYPASS);
+		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_DEMOSAIC,
+				      RKISP1_CIF_ISP_DEMOSAIC_BYPASS);
 		return;
 	}
 
@@ -1863,8 +1863,8 @@ rkisp1_ext_params_bdm(struct rkisp1_params *params,
 
 	if ((bdm->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE) &&
 	    !(params->enabled_blocks & BIT(bdm->header.type)))
-		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_DEMOSAIC,
-				      RKISP1_CIF_ISP_DEMOSAIC_BYPASS);
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DEMOSAIC,
+					RKISP1_CIF_ISP_DEMOSAIC_BYPASS);
 }
 
 static void

---
base-commit: 27953c044974baf7e24dee3e9342fe0103dea80c
change-id: 20260911-imx8mp-demosaicing-bypass-bb284d9cca60

Best regards,
--  
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


