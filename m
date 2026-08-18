Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2958AC5DF74
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 13:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:Subject:From:
	Message-ID:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m/LXl9fTO3dMTBf7vWRGKL6aArXJcLw5Fe2OfvQ7VdM=; b=FS1Fjd6Y2R+fBqAUsdc2KEctci
	VVf5MQDWhROtH4NWU3Cd16EERmw0JGFI3QCjnG3uDA0T7KneGhXq+Pmiwlkfy3sC/24LGfd9OpWn6
	RxB+lUHH4rWvY1Bmk7kgXEwNk4kgdWbOqU2pNuJ7XGGTTIwZXJnylP3uCwbgnk+R+nAPPMxl8vNzT
	j19t6ccN+ywVi+6SzvA6nAkXkWyTvhJgpqdfiQ30QL9cHYTVd4/S98pTqQ6QvAta491TPG2kWoWho
	DLCm6BjxPmAWIe+6CEPwyG9nEu3cNHpi0EE3MzO/UzIVddFfw+JTFU4iod5lmif/dOz+BdLnt71Cq
	LFRIWI4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJki-00000008270-1oOo;
	Tue, 18 Aug 2026 13:21:16 +0000
Received: from out203-205-221-192.mail.qq.com ([203.205.221.192])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJkf-0000000826W-2pGc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 13:21:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1787059271; bh=m/LXl9fTO3dMTBf7vWRGKL6aArXJcLw5Fe2OfvQ7VdM=;
	h=From:Subject:To:Cc:Date;
	b=m2uJ2HNrTYQiwIbaa65DUd42Rmgc/hOULdAn9Mk4LYfzBpzkdj4as7p10ZO5YftJZ
	 yItFctNhaScZipBD0rW38/Z2LIY1MZVSyAs9Au47XI5RSVHBdZcM4MjcgTs8GvxsJm
	 cnafV6T2N5qBsbCOxK1sqOlsV5fL2sm0LCHx7Kgk=
Received: from [127.0.1.1] ([5.195.0.150])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 1721C6D8; Tue, 18 Aug 2026 21:05:50 +0800
X-QQ-mid: xmsmtpt1787059178tf3sshen6
Message-ID: <tencent_62C095FCF52245E6900FBA2E4E008042BF08@qq.com>
X-QQ-XMAILINFO: NnYhxYSyuBnLCu+aiLiRXdbLHmZvFK+8F6DSOcqHeIy3e+QYrf+3KUT3crXI7d
	 TTHtmD28YmcgN3rxPan8FhnSbihePYVrPw09X+CZpHUuFr2NXB96PCMAkgQuqjqS7VN6AOajSdvL
	 6h9VTmB+w2/Fv4SFdudYflC6IZ795ZeY+v6DgCV8LTv38shpsyGgS62NA7MVF7Hw7oZ5pMC52RRR
	 Ik0U4tCrl7tdE/+MtPNX+uxBYvTbjAPt0oGadGb44GnKafuU8PrzyQOFUTvgymFzWwqwznsUUoJr
	 uq2U4srbCMLElocqrZXnrB08WX8oivAL2tGCfogYlG+v22Tjt8ZsQ7WqtdA0kcwVpkrYCNYHWd6R
	 f4E4e9/wh6SRCBh49XeugRTnTkhuz8LDThnaqyD0O7mYcCiYG2tSd97pVCRJc68pxKSwqcByqa2E
	 HI8vJU3CbveFjT4XLS7qkgsPFy6dIf6Fqhwh+LlWzHOP9lSTc5HQ4fVK1AoUYp+0fnvuCJHgBVkT
	 /Z+yoirw3SJaGqqafsotdzPDWQDRl3Zzr9Fg2WmPbQmFQCuEE7GQ8rVAa/vHddW1RG4AWQxmtBVy
	 jJPK2NQhPZ4W0C9A93B6af04bWj/AuETdQcBhNJCr87hltWAeuf8k7e5ZILK52BJ8omblz+bv631
	 td32DrKHefqr8mKDXRV176T+2ucB/4CJQokNuU18jrhZY35YdLzRS1UII/D8WI8zF+/yaK7fxrEl
	 5UVj6Sqm+DURpKFi2MamGS/TGl+kPHhSDK69roYGCQsBIUZ0GlQHypuqrwhxjOVdUZvXTl9Gi3ZD
	 e3/yKmojSGbtEvB3Huyu9lmYZ8qeB4Utx1Dp6JD2dxXMwRD+C4sBfNWmY+b7RUwwmWrwn8JRBl9D
	 qpK5njvcmvnPtIAi7ihq2Q1ng6Hc1WJoimgzoBfTdqqKonpeq3TdoimkIbvgvf2rd76IVEpHDZR8
	 MwGxRs9Iyj+p5KoS/EpGTTC66rzBY0CeUq42t7xlSP79HIrtn9BluEQUx1g3eg31jBB3PzDwr5Hi
	 hzl4D8fnFfOgms5I4176Bkxxk1r/4HSZoctAdpbq8wlzBmxcDNIWvTnBsVP9PnYbUWtFaVOA==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Jiawen Liu <1298662399@qq.com>
Subject: [PATCH] irqchip: irq-imx-intmux: fix runtime PM cleanup
To: Thomas Gleixner <tglx@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Date: Tue, 18 Aug 2026 17:21:08 +0400
X-OQ-MSGID: <178705926890.291840.13691325396124428078@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_062114_051702_56C86CB0 
X-CRM114-Status: UNSURE (   5.84  )
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

Fix imx_intmux_probe lifecycle error path.

Probe enables runtime PM and clock. Failures after clock enable only
disable clock and leak PM runtime reference/enable. Clk cleanup is
incomplete because PM runtime state is left enabled/ref held on later
probe failures.

Balance runtime PM setup on imx-intmux probe failures in
imx_intmux_probe.

Signed-off-by: jiawen <1298662399@qq.com>
---
diff --git a/drivers/irqchip/irq-imx-intmux.c b/drivers/irqchip/irq-imx-intmux.c
--- a/drivers/irqchip/irq-imx-intmux.c
+++ b/drivers/irqchip/irq-imx-intmux.c
@@ -240,6 +240,8 @@
 	ret = clk_prepare_enable(data->ipg_clk);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to enable ipg clk: %d\n", ret);
+		pm_runtime_put_noidle(&pdev->dev);
+		pm_runtime_disable(&pdev->dev);
 		return ret;
 	}
 
@@ -282,6 +284,8 @@
 	return 0;
 out:
 	clk_disable_unprepare(data->ipg_clk);
+	pm_runtime_put_noidle(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
 	return ret;
 }
 


