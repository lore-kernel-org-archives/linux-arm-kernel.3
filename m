Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A230FF8873
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 16:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pdm0Q5wvmCn6GgEqOUMjbFnoJ2kFK5BaF9LzslBFdQE=; b=JVVWHSVGA3vTpMboZA+tFhhQF0
	Rnu81qQUakFp1+U3RNDjmEbdUM8bC+nRC8wYkiCmxTsBwwLfbKYGMITBkPRFGBCIMXCM1Zv7mnds8
	1wvbsTgRx6U4+DHlxWpOg6+mxGO/hNALxDTukEpYyA9CuwhSjoKqjR5/GhggO/+/B9kmHDet8Dnkv
	TtBxrvBYqyrmmJL6zfkhrE+IhCfanZcsfHLpOeBKRetGtbveHFxF45HtfELk6gTsBc6p9It8fpRJO
	+4iIj0qUocbfYMyQGAV8Sz5mOlt6qB0hCOwmPhA0/cJKAZVvbbVaCx32GkRMYps8idOeKS5HsS9BL
	CkUUXC9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIUQx-00000005k6m-18fj;
	Thu, 30 Apr 2026 16:40:15 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIUQt-00000005k5H-3qoF;
	Thu, 30 Apr 2026 16:40:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Pd
	m0Q5wvmCn6GgEqOUMjbFnoJ2kFK5BaF9LzslBFdQE=; b=TCAFEOLoYE9t+l126j
	uiN+UYc+AS0VC7guWxrC55BnHg12MgNlGinScfkU2dxPFg6kHgRKAXeAYuQ7YXvF
	ObdfoQ+Mlq7+Dmnwf6K9pbFDRuz4m4LvxVzz04WxWWZQvr8RZz3JM8HnkBJza/nD
	j85BWvzv1qRavZaFLvDOfS7y0=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnUmm+hfNptZrZCg--.19910S2;
	Fri, 01 May 2026 00:39:27 +0800 (CST)
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
Subject: [PATCH 0/6] usb: Use FIELD_MODIFY() for bitfield operations
Date: Fri,  1 May 2026 00:39:13 +0800
Message-Id: <20260430163919.47372-1-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnUmm+hfNptZrZCg--.19910S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JryfZFyfCF45tw1UWF4rXwb_yoWftrb_AF
	ykuF4ftw1DWFWakFyUC3savrZ8urWkZrnYvF1vq3W3K3srKr1rXr1vyrW8J3W3ZFW8uF1v
	qF4DWryS9FZ7AjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRKFALPUUUUU==
X-Originating-IP: [240e:b8f:927e:5900:c497:d540:b00d:97f4]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7B-ni2nzhb-ZWQAA3-
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_094012_339446_D0EBCF40 
X-CRM114-Status: UNSURE (   4.92  )
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

Replace open-coded bitfield modifications with the standard FIELD_MODIFY()
macro across multiple USB drivers (dwc3, xhci, typec). This improves
readability and adds compile-time checking without functional changes.

---
Hi, If the Maintainers think it's not necessary, please ignore it.
---

Hans Zhang (6):
  usb: dwc3: Use FIELD_MODIFY()
  usb: dwc3: google: Use FIELD_MODIFY()
  usb: dwc3: dwc3-octeon: Use FIELD_MODIFY()
  usb: xhci: Use FIELD_MODIFY()
  usb: xhci-mtk: Use FIELD_MODIFY()
  usb: typec: Use FIELD_MODIFY()

 drivers/usb/dwc3/core.c        | 12 ++++--------
 drivers/usb/dwc3/dwc3-google.c |  5 ++---
 drivers/usb/dwc3/dwc3-octeon.c | 11 ++++-------
 drivers/usb/host/xhci-hub.c    |  5 ++---
 drivers/usb/host/xhci-mtk.c    |  6 +++---
 drivers/usb/typec/tcpm/tcpci.c | 11 ++++-------
 6 files changed, 19 insertions(+), 31 deletions(-)


base-commit: 3b3bea6d4b9c162f9e555905d96b8c1da67ecd5b
-- 
2.34.1


