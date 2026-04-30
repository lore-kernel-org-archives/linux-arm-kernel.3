Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5285FFF8873
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 16:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=883GNpBzpZT0kzzAWtcd9tO1xmCz7U41eOWRk1IoUcE=; b=Qr1HOlpi4RF62AjPy0RaOe+xLY
	Ox4zWShI7ZT8KvcBsL9Wp8jdhlVyrGTTqhL39pD8E5btOphHGu3/p6JTR+n+eBlVNWsF78DDQDWqX
	5S1RtIQ2txDvpcRquAQZHCbgqB1T0Yqp8xxh7xD/Eg6EPQrYpibUbKiBVypy9pyAwhxx+SYR1O3ri
	O4VASYugBh2GvM+YXXlEco88OoJtHtGlszkuYAm8CTj7y6LC4S6lwrCl7CTx/lQNrVVmLIvTT6hNo
	Lajk0NKwQ974Ad19wXXzkg/1to7OljGGUhhhCz/Visjpx9BVdRUUnjYZPcx8uwYKeqyeKdAOTLbwO
	Cej0kLtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIUR7-00000005kCO-13JG;
	Thu, 30 Apr 2026 16:40:25 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIUQy-00000005k6c-1OPL;
	Thu, 30 Apr 2026 16:40:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=88
	3GNpBzpZT0kzzAWtcd9tO1xmCz7U41eOWRk1IoUcE=; b=aBApgiEBRCh8GzVMLy
	sYAoVuCiAGbqNJcc7dwTsdqcy5YuCx3TX3zgJNtGzX5N9/hKFb/C+KMomq9mKTa6
	24S/FWE+ZpeXof0dISgzC74Co3jjfwtR58/OAHFrtIa6Olem0V8VtXxDViYDgyFJ
	GffQj64057y+SfMYmnXG7iuSs=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnUmm+hfNptZrZCg--.19910S5;
	Fri, 01 May 2026 00:39:29 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org,
	peter.griffin@linaro.org,
	andre.draszik@linaro.org,
	tudor.ambarus@linaro.org,
	mathias.nyman@intel.com,
	chunfeng.yun@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	badhri@google.com,
	heikki.krogerus@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 3/6] usb: dwc3: dwc3-octeon: Use FIELD_MODIFY()
Date: Fri,  1 May 2026 00:39:16 +0800
Message-Id: <20260430163919.47372-4-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260430163919.47372-1-18255117159@163.com>
References: <20260430163919.47372-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnUmm+hfNptZrZCg--.19910S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7urW7uF4fKFyxAryfZFyrWFg_yoW8Aw4rpw
	n8C3WSyFnFkrn5uw45Gay8Aryrtay2krW8KryDJ3yxZw4DXrn7Wayqkw4rtrn8Wa4xtF10
	k3yvyrW3uFW5AF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zi-B_bUUUUU=
X-Originating-IP: [240e:b8f:927e:5900:c497:d540:b00d:97f4]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7AHojGnzhcHZvgAA3w
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_094016_690352_2A4D1EFD 
X-CRM114-Status: UNSURE (   8.02  )
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

Use FIELD_MODIFY() to remove open-coded bit manipulation.
No functional change intended.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/usb/dwc3/dwc3-octeon.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-octeon.c b/drivers/usb/dwc3/dwc3-octeon.c
index 42bfc14ae0c4..2201f0f34abb 100644
--- a/drivers/usb/dwc3/dwc3-octeon.c
+++ b/drivers/usb/dwc3/dwc3-octeon.c
@@ -296,8 +296,7 @@ static int dwc3_octeon_setup(struct dwc3_octeon *octeon,
 		return div;
 	}
 	val = dwc3_octeon_readq(uctl_ctl_reg);
-	val &= ~USBDRD_UCTL_CTL_H_CLKDIV_SEL;
-	val |= FIELD_PREP(USBDRD_UCTL_CTL_H_CLKDIV_SEL, div);
+	FIELD_MODIFY(USBDRD_UCTL_CTL_H_CLKDIV_SEL, &val, div);
 	val |= USBDRD_UCTL_CTL_H_CLK_EN;
 	dwc3_octeon_writeq(uctl_ctl_reg, val);
 	val = dwc3_octeon_readq(uctl_ctl_reg);
@@ -314,14 +313,11 @@ static int dwc3_octeon_setup(struct dwc3_octeon *octeon,
 	/* Step 5a: Reference clock configuration. */
 	val = dwc3_octeon_readq(uctl_ctl_reg);
 	val &= ~USBDRD_UCTL_CTL_REF_CLK_DIV2;
-	val &= ~USBDRD_UCTL_CTL_REF_CLK_SEL;
-	val |= FIELD_PREP(USBDRD_UCTL_CTL_REF_CLK_SEL, ref_clk_sel);
+	FIELD_MODIFY(USBDRD_UCTL_CTL_REF_CLK_SEL, &val, ref_clk_sel);
 
-	val &= ~USBDRD_UCTL_CTL_REF_CLK_FSEL;
-	val |= FIELD_PREP(USBDRD_UCTL_CTL_REF_CLK_FSEL, ref_clk_fsel);
+	FIELD_MODIFY(USBDRD_UCTL_CTL_REF_CLK_FSEL, &val, ref_clk_fsel);
 
-	val &= ~USBDRD_UCTL_CTL_MPLL_MULTIPLIER;
-	val |= FIELD_PREP(USBDRD_UCTL_CTL_MPLL_MULTIPLIER, mpll_mul);
+	FIELD_MODIFY(USBDRD_UCTL_CTL_MPLL_MULTIPLIER, &val, mpll_mul);
 
 	/* Step 5b: Configure and enable spread-spectrum for SuperSpeed. */
 	val |= USBDRD_UCTL_CTL_SSC_EN;
-- 
2.34.1


