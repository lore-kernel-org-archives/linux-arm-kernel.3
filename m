Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9F0C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qxO6EI+JHotyzw590GeS1Ja6m2iBYk0mzXt7JlImkhk=; b=JVp+3nXTD5XJWOgv6wSimzto/Z
	IGSQhaXq3QRVmMwKqQwm14r4gNxiUY5HZgVbmehfp1thxlWxTJPqn6rYTDGwzB95SvcMPJjCKIBE5
	NhcQiKcmSKVZcYmlkFJzKKVFmCUT8hnb2dG50ILt6NE8gkskldKlMTdYADiEnQ/E68diFWngwnumI
	W61ev7maLxZqyBB7b058cZhy9ONCm8pE2fUUcp5asrSkB8fuR7kkPVqhJ0icAO7KVbaOZ2eEveT4f
	cvVzcbO+LsoqMRKGXtC8j7dvvQflWHz7HPUz+vmRRmfjYMUOC2ZJkFfb+5zubaX8c4W92+CxAcnDj
	z/ZDRgcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjimd-0000000D486-1NbL;
	Tue, 14 Jul 2026 19:27:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjilt-0000000D2wS-32Hg;
	Tue, 14 Jul 2026 19:26:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784057170;
	bh=iV0TFUhsGtT2QxB2V0jcayH1eq33X2v2R8/s+ngigtU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ldoXBN7g8VUh9UpqzFdEhAZ0g+R7v8dmLB6WPf2eabM9JHGHxhwM1t94WHb1AE5SS
	 CA+y1v8fdD7eUCnVaJ3hZXwS5DU/o+/yEve1Cihkt15y7+u2v0LD6xo8ZtLnAqX7SJ
	 0H60l1Eg8dXNfpEXd1nFTFvW6HOEs8Rgf3BeLZV3r9XSiKNWsIumkxLt3+PceO43QG
	 ay6XFBNOz19wYmjnaAT+fj++/9nyFlqhGmQU+cAgAsiN/Imb4aVH7l9r/Ddp8yLV8E
	 WHhu6YVVOzIPXSwfQthRoaLyof8zdjUO+gPZa3VFlffBg9CD+vpEg7iz3JgSXFitCZ
	 kIduW4nfMG3BQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3023717E127F;
	Tue, 14 Jul 2026 21:26:10 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 096F4480075; Tue, 14 Jul 2026 21:26:09 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Jul 2026 21:26:32 +0200
Subject: [PATCH v13 31/35] phy: rockchip: usbdp: Drop -EPROBE_DEFER hack
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-rockchip-usbdp-cleanup-v13-31-6cb3e769d4c5@collabora.com>
References: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
In-Reply-To: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1428;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=iV0TFUhsGtT2QxB2V0jcayH1eq33X2v2R8/s+ngigtU=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpWjVDx4uduaatH1g7+Qw6gWCWQExoRIN3bu
 DPb/UwcdWTJW4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqVo1QAAoJENju1/PI
 O/qamgEP/2us98K92E3jhqGo13ZHrkpP4mj/3OIV+MXkJ42gKbUsEt8AOB3wPTMI3k/RTlVYEcg
 DRHqtQGGmCLNK0gf2ZrobsBdb9AVDs26ZF2uHFzcl4rDtby8pKBlHWZX7px9dGtscAUPKQBdCVn
 jH0m1Op67kDOhszUHVqFwPnFmZvvQLAQ3zWv3pH/XjvMfGlnqhRMFCor6jpMOZKxvCbqCByKFy1
 eZt5gmkm08K6zn3HIWCuld2bR7Q37/q6I7/u/oI2RMSnWWTxByt9uYgAn5KMk9vCqEEaonlIpW4
 W29uhsBojJrDe82TXCpX3WKglY7uoftxfL2PZMHpyUnpigTQnQ+PRCnuvneJr8O5LPZSpsxgPfm
 CSeBNEYHhYF2W5VYUh0VD6hQFovfWhh9LNS7tVpfSKSsHpDuI5lSaQFGCsDtuL+ss/XDvGx4Tn9
 CbFj3Fcf9BkhtK8XfatJjQgYeidDJ/E39s1MQpVR6467cSVFa40FV9ZPbEDbcgkNrn4dOfilOYP
 JC0ihIRmnbGAYbMU89my9EEnEdBUrdCRsexpSAJi2vM5FH5eP+ODsfRIWBgZSVni5uCcxx38YcW
 MoJmX9Ks6I8RM1edpXJUIUPYIJFxaqQXqdlGgq7Gvq81mfBQItUxRO8zEm/QwbGELjikogQx0S/
 uJNKpmkYGdlHs6vQvEDQvRg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_122626_617372_9D0761D2 
X-CRM114-Status: GOOD (  14.24  )
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

The hack to return -EPROBE_DEFER when the lcpll lock timeouts is no
longer needed. The driver now does a reset during its PHY init, which
avoids the problem.

Since rk_udphy_status_check() is called after the probe, it should not
return -EPROBE_DEFER.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 21f282216aef..a6fe634574bb 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -750,17 +750,7 @@ static int rk_udphy_status_check(struct rk_udphy *udphy)
 					       (val & CMN_ANA_LCPLL_LOCK_DONE), 200, 100000);
 		if (ret) {
 			dev_err(udphy->dev, "cmn ana lcpll lock timeout\n");
-			/*
-			 * If earlier software (U-Boot) enabled USB once already
-			 * the PLL may have problems locking on the first try.
-			 * It will be successful on the second try, so for the
-			 * time being a -EPROBE_DEFER will solve the issue.
-			 *
-			 * This requires further investigation to understand the
-			 * root cause, especially considering that the driver is
-			 * asserting all reset lines at probe time.
-			 */
-			return -EPROBE_DEFER;
+			return ret;
 		}
 
 		if (!udphy->flip) {

-- 
2.53.0


