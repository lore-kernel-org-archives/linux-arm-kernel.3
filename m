Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94A5606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 07:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZuDmcU9N;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=EFNhL9f6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pWV+MHPJuJet8vQm738jlBmMlNX7vo5rGOnH975str0=; b=ZuDmcU9NtdlHj0
	wbo6xOsNdhlylaONOmHDckIAwYuRHsrOaBdzlneXaMQF4ltZYnVrTcR5ZB1YP6uLFxv1NdFqJMi8L
	30q/WDpLISeLe4ceacEb40EPVt04v8ejApdtRtNY/1EZxeryXqSBbLWjZ5Aw+ja2BcO3DiCGMwCSN
	vv9TJGfYvJunkQX/dtV4ZKjAXpUC+ZzkLoKopcsLL2xz7bPxkMjprvBDSozVczkNkwflXge9fI5bU
	XzzDZtMjguxdx+0KL+SFJ9YdSq/5y2xNSuahSamCkXuv7WVZdsDk9XKcvDmh5pecac3FloX8D9LrN
	0VRt3V5BUAJiVTM7uOJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9FC-00000001QTS-3xqT;
	Tue, 03 Nov 2026 07:47:46 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9FB-00000001QR5-08qm;
	Tue, 03 Nov 2026 07:47:46 +0000
Received: from [127.0.1.1] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CFFDB4FFC;
	Tue,  3 Nov 2026 08:38:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793691539;
	bh=4UM83WgUUmLXdUmJoKiyVW/Tt6ThP1bsffedn6enb1o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EFNhL9f6TQQ6m77Yh7/XVMHwAz7o/w/f6MxG0AoVEL2sM94ec4hBc84VWjYYuMcym
	 xGYI7AcG4pGWMMP86yE8pyGjtRBgPVmGEAHlJ9Zk+8vaYfv4HwxALA69zPE/ZS7f7i
	 Ltxk3VI1JJKghQdzpdSlC4OhsSEH+pCEjm1Xgg7w=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 03 Nov 2026 07:40:50 +0000
Subject: [PATCH 14/16] media: rkisp1: Disable resizer stream before capture
 device
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-rkisp1-suspend-and-resume-v1-14-08f863b6fdc5@ideasonboard.com>
References: <20261103-rkisp1-suspend-and-resume-v1-0-08f863b6fdc5@ideasonboard.com>
In-Reply-To: <20261103-rkisp1-suspend-and-resume-v1-0-08f863b6fdc5@ideasonboard.com>
To: Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1301;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=4UM83WgUUmLXdUmJoKiyVW/Tt6ThP1bsffedn6enb1o=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBq6ZARU29b5O2lGgZCbTA7WMrBfcYKXkuVYKTgZ
 jLzBR7PUomJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaumQEQAKCRDISVd6bEV1
 MiktD/sH70tz3ItYN/GwbHjvlnGrBMrBjAQPPYJFTL8pOLNc7v4U4roc6/YkoZxRQwHC3g5+Pv9
 BkLdMmSmGKY0Vlj8oPxICBpAuWeVdZLKChgDund4yoOhYRDDumAnMEEHP7jW8CHRV24+wpvg4g8
 XMtueUp2nquV+PmMAHyM5lTyHwyKjU+MsIz96Ej/PXQiF6R1K9HOo0nILqcRS7CfoGCW71V3Iy/
 UhXyZob/PDXAKRQj4e9PTDrD5jdM+TdGv8iLON4AnqDt6p2gyxQfTzuq6ij4FCEqgwvCKBzftHs
 uG8x7dUNCUoQRrUeQjhkvZUtktlglFsaeWymQ6GDUl23WuyKd07gqrgEncCkhfV04zMbe75jLgH
 jlz730J2dtUAotZ4Pox9svg82Tqr+fXHC/wJwyIRNOp6vwSbwwN1/lrzmO+79ZNxtn9q/kn0JUu
 RyF7dVGl08RfvRJZXGkB/c7WIY743UpO6q5rvrW+0D+Ss88JzqbViU0aYzHICQGHepyw2q1YLYx
 mrDPr17/t+o2fFT9gNEenXb2+4roRshdNkg4hWarIdG/O3eNDk3ThWueQzggOHGp3B+X6zoFch7
 pqWk8fGc9EoYV6aLYmaisfINMqi3Yn2MB8oQQsSxnBgFvOd7GufdZKdPxfGjFFIz29TWOjQTGwg
 Zbj+M7mZOBS1J9w==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_234745_248078_9C58B701 
X-CRM114-Status: GOOD (  12.77  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In rkisp1_pipeline_stream_disable() the current implementation
calls rkisp1_cap_stream_disable() before sending the stream off
signal to the resizer subdevice, which will make its way down the
chain of subdevices to the sensor. This means that much of the stop
operation happens whilst data is still being sent to the ISP. Switch
the ordering so that the stream-off call to the resizer subdevice is
made first.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index 84d66da484df7cbc29700efc433b1271d594ff78..3204f5afe3bbf1a5de88d57b50a120e716b1345b 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -1066,9 +1066,9 @@ static void rkisp1_pipeline_stream_disable(struct rkisp1_capture *cap)
 {
 	struct rkisp1_device *rkisp1 = cap->rkisp1;
 
-	rkisp1_cap_stream_disable(cap);
 	v4l2_subdev_disable_streams(&rkisp1->resizer_devs[cap->id].sd,
 				    RKISP1_RSZ_PAD_SRC, BIT(0));
+	rkisp1_cap_stream_disable(cap);
 }
 
 /*

-- 
2.43.0


