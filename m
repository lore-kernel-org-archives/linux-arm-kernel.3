Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 081F0C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 13:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nJ3DjTBgFoGEsLV5b+erjzQOcSw5I5/IyYlcPZdcDEs=; b=BwHQ+duI3vgN4FmkmhkCgLOCEs
	Nq+3lbJJu4SUS/vg7llJMNkMO9+qDx+5HvK6M23BoEXHYimz/FmQhlJU6L8iYpCjf4vaORQ8R0jl5
	jm3jV4sTt5JMjarajolPD227732CbBFZ2xzYgdXn/zrdLIeXda9eyR8sG578ZywH9E5EBxTXIPYzQ
	2rpk2fx4GJDU+fIiyol3T0Eca/4V//o9Z9HilhkfS59fl5Z8qTDnmyBRT5BYsSHYLkMD5EZ8Mg/W0
	W+h5VOVOi7G97Q6Axw8d+M/MuhyZDKi/exyu6RdziDO2cjxpq9uy5FHioBHDyhCGog6p5W3v14rPK
	JebTrOnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuV9N-00000000hzN-3Tlv;
	Thu, 13 Aug 2026 13:07:13 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuV9K-00000000hwU-1cun;
	Thu, 13 Aug 2026 13:07:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1786626376;
	bh=nJ3DjTBgFoGEsLV5b+erjzQOcSw5I5/IyYlcPZdcDEs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Icyn6c8yhdHQAlx4W0szQLanIZtkiDmin71gdpSPyrvseqstoBx/3lutSSjhE90S8
	 GZbfZ2S1RauSutzc7fuyy5YGfq5Aj2ebY5wBgKQKKdyHSc//gthF2A4QW62oNaZoYe
	 VkdeR+IUVzzcuvVy3vbpHo70JmH2RByS/iRVgOVg=
X-QQ-mid: esmtpgz12t1786626355t9ca26cba
X-QQ-Originating-IP: dHhI7VBaezRAp4X4gI1x1FX2IMsrpI09Qjr/PigbalE=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 13 Aug 2026 21:05:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 588101152483150386
EX-QQ-RecipientCnt: 12
From: raoxu <raoxu@uniontech.com>
To: vkoul@kernel.org
Cc: wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	neil.armstrong@linaro.org,
	andre.przywara@arm.com,
	marco.crivellari@suse.com,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	raoxu@uniontech.com
Subject: [PATCH v2] phy: allwinner: sun4i-usb: disable the PHY2 PMU clock after SIDDQ setup
Date: Thu, 13 Aug 2026 21:05:42 +0800
Message-ID: <CE85F490F5646A2C+20260813130542.2425068-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MvyKdZyVtFx3ogxxWRGDkb3wjkVowJkMY7zgE3kzwgOz3wTrVGElr46w
	3Stlq7ADwX6crnNIfcueySAkOPttnBR3+N0tWSpJ+Hf8bILjwodltDfDMAys3dpWJ5A2Sr/
	kzkC6/fws1aw9SZgCdts4gEKQNjSQ/VxciLKeYWzg+FkQbef38BKrY/8HtMgagSH+DyDaUC
	A3Az1uhdWcVii3UHm8GHeDCcFLwNUyz/B4aQkA78dbQl4j/8x49oy4H08kvKj6Nd7xIS8tS
	qhHF9mujbFd8JKTe1XDICdF27ULL1pE/p1xIgDtH5qoNkzHU2V2TES9Z6dV9f+skkLfuN9x
	E/c5PvOI3Y8rByc1gcS6U98anIjR8ToinuSCtecagKaM3CR7ra+CAR7ALMctB57Qe08oKB1
	Cj6uh7xNk+RUl9cxw9xqwEp1Oq6nB7864/6o/fZ5g7Etfj68ZmNLjSM+LtaegcmJ/V2a+Wh
	Aos1SVlPZ3t3JubC8C5c06YAN59cXkmyfRM6ZajPi94c5xnqkVx5N0XWN9TGZ99AMvaD7be
	B0IBl4Wnev9FLc6rWF9IvEVYq+jIslNiR1WENa0ClGt1/hHImu/ZCv706b5Iko4znp6AMdK
	rJagUlF24IeEriPsfY+Nm9MmFjax2O3oWZiRCOCK/sQsrMJpdI9phgMbTEPY9xnv1fItS06
	69hyGvKKHqeK9RIspeXqEOTiWQs2UDZjlqmme1KWokWX2TZhgKeGcYhryy78+Q5k5PfTYDg
	GzIZ7J9SU0/vNnZxzD6W625AV0NmYmsKlWBoGnTv/sPZk0No5biElFnueUOT4UCnuF26Weu
	8ZB8oXUqEOkdQZU6hy6ZwAjgrDR/uccHiJSjrbYbpHuotLsCbhiFDlUJ+eFBLi8UfkZnL+g
	2zL+8mTfbRoNvcc2PTbYQXLNIVEuj8Go9gAVuhA5amJLYWNLnJhLQDurUBtG2vuBa0m7AA6
	F+jBCXCms9N2koilwDDuDkL4a3rHLRUXNQg2Qjw2y3EKz5PizeTUUzS/4FnOygjZalRCwll
	ErQo+qK/vGO565+9eNg1UZ3aWlVkQL9HVdGs50bMUHehIe1YdTDrq0TmOjySWE9Hdu8xA4z
	w==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_060710_968771_418C1F17 
X-CRM114-Status: GOOD (  10.66  )
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

From: Xu Rao <raoxu@uniontech.com>

sun4i_usb_phy_init() temporarily enables PHY2's clk2 when a SoC needs
PHY2 SIDDQ setup while initializing another PHY. However, after updating
PHY2's PMU register it disables the clk2 pointer from the PHY currently
being initialized instead.

Only PHY2 on H616 has a clk2 clock. No other PHY on H616 has a clk2
clock, so phy->clk2 is NULL in this path and disabling it is a no-op.
This is why disabling the wrong clock did not cause an additional
functional failure.

The temporary phy2->clk2 enable therefore remains unmatched, leaking a
clock enable reference each time this path is executed.

Disable the same PHY2 clk2 that was enabled for the auxiliary PMU access.

Fixes: b45c6d80325b ("phy: sun4i-usb: Introduce port2 SIDDQ quirk")
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
Changes in v2:
- Explain why disabling phy->clk2 did not cause additional harm: no
  other PHY on H616 has clk2, so phy->clk2 is NULL and the operation is
  a no-op.
- Clarify that the concrete issue is the unmatched PHY2 clk2 enable.
- Add the Fixes tag and Andre's Reviewed-by.

 drivers/phy/allwinner/phy-sun4i-usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index e2fbf8ccf99e..839856c09e30 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -318,7 +318,7 @@ static int sun4i_usb_phy_init(struct phy *_phy)
 			writel(val, phy2->pmu + REG_HCI_PHY_CTL);
 		}

-		clk_disable_unprepare(phy->clk2);
+		clk_disable_unprepare(phy2->clk2);
 	}

 	if (phy->pmu && data->cfg->hci_phy_ctl_clear) {
--
2.50.1

