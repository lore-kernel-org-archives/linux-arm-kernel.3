Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A8BCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yQGi3lzFLr9/fuMOxDQJrgdU3HWx1+ohqNB/fah88rE=; b=FoLTY0OH8Lp6j7LCmF9BLRcK8h
	Sq4KKnIkht0fKd0wSzzLeFdeBT8w0tJ95Q73CXVvizsOXiBqR5jxSXocO8D6hBPer34p7kSqTQIsi
	lJeBExsdzJSIBQjt9YIWBTAvoGFro+DRLvKF08gQ1lvG3YdlW9mVsICiUtETEKk68dW4H997HflG9
	MkkMMIk8UNXdHblZoV6sGcbsJEAcXUUPipmSM/ecjPgh42xnECs3GR+VIo25160XCmpYHbg1w5uXW
	YqhcUMHTRtRQqtngtLtx5NkEwL7i8QYmQjpMrD6FyZtbVhF8Aoa1WR1Ind9Pq7R4lBx/YhyzBgKvM
	qO09p3Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPizF-000000051zm-347O;
	Wed, 20 May 2026 15:37:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPizE-000000051zB-36SY;
	Wed, 20 May 2026 15:37:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=yQGi3lzFLr9/fuMOxDQJrgdU3HWx1+ohqNB/fah88rE=; b=RMT+MhWeVvs34hh1PrDqJj/WDz
	yA220kwGESw0eu5dWhMZeZpW1KBYbZSi/WwhT+miyIO31vnEN+fza+OVMVbrBUNtDNw4wv/kCbRYu
	F+J3HL+cJ/XU1IeKpjexP3uk5u2JP0wXQc9cnmySFPjAmyuccvtiVi+C218zXSDr9odmZ8nkWyntn
	WlKiAMbjx/jUGvRSK7wEiI/3EMoZd0jz0IGpNtpGBarL1iiLjWqlVEB1sKd1vNl4CIHtMSvRAHn5t
	8jBRqG6R8A5q0N2bMZ+3rNgHca9CvC8W980zLWE/qweIu+/QVjzcuylDks2zvEvExAMu+YPOQNV6Z
	5Fb8rztQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPiz6-0000000HFwO-3kv0;
	Wed, 20 May 2026 15:37:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EFBCF43742;
	Wed, 20 May 2026 15:37:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15F601F000E9;
	Wed, 20 May 2026 15:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779291428;
	bh=yQGi3lzFLr9/fuMOxDQJrgdU3HWx1+ohqNB/fah88rE=;
	h=From:Date:Subject:To:Cc;
	b=ZYMlE9Kmp++UqCoKJdvPv3O66yqECsvJJHz5ST4OO9z+l5BjAIJFoiRq1aki20w0+
	 /FIa0T55nmo5pjhA3gN7p+UtOuh+NGHR5vkCozLHJ0oXDgqR0xIhMGduAnpDoYQQGc
	 T8o9PBIzvZkOADFjbBlmzr9rrHTJO7r2Vq9ygVc82vaOhudnO0D1IX/TwMpRrWaL5L
	 rrUpfrpGh5FeX4RDb9mfZMc4RCOGpYCMcSQ+UvXtIK/CdE+OOlrStc5gh1H2jTuyQS
	 Drin9ymoq6sS15HANYDRM2WA5W/RJoRe1+qwsbSdQ+R3vo+mAtV1glpH7YLKxKG/1s
	 Eye/PQ2D8HK2g==
From: Eugen Hristev <ehristev@kernel.org>
Date: Wed, 20 May 2026 18:37:00 +0300
Subject: [PATCH] media: bcm2835-unicam: Fix pipeline wrong validation for
 unpacked formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-bcmpi-v1-1-41d80125a7b9@kernel.org>
X-B4-Tracking: v=1; b=H4sIABvVDWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUyMD3aTk3IJMXaNkEwtTA2NDk1QjQyWg2oKi1LTMCrA50bEQfnFpUlZ
 qcglIs1JtLQACC+XwaQAAAA==
X-Change-ID: 20260520-bcmpi-2c4850314e21
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Maxime Ripard <mripard@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Eugen Hristev <ehristev@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2451; i=ehristev@kernel.org;
 h=from:subject:message-id; bh=t9dlwa/PW4NqUH44Ui3R+NtfUyGFxOU24A9dkasKujk=;
 b=owGbwMvMwCXWkjcnuXne3fmMp9WSGLJ4r8qtmRM4lZ/jayO/yc9d194mbfz00VnM/avJim3ss
 opF6kqHOkpZGMS4GGTFFFmqTf7VCvfvcD/paqkCM4eVCWQIAxenAEzkYwPDP9NZT0KPzvkefTyB
 ZfXLiPCyJ/VxvorvRPMlFy+3+XB8pQYjw/T2rTcm7vfksd4m9HP9up1T3Ob9v7k64pXp/s4M+ws
 3AjgB
X-Developer-Key: i=ehristev@kernel.org; a=openpgp;
 fpr=AB184498D27A77B65D7852C81EB31E020EAC2FC8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_163727_396578_960FA12F 
X-CRM114-Status: GOOD (  13.69  )
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

The commit
08f9794d9b79 ("media: bcm2835-unicam: Fix RGB format / mbus code association")
introduced a check to see whether the format requested is the same as the
fourcc in the format list.

However, this breaks the case when userspace requested an unpacked fourcc,
e.g. RG10.

Unicam can work with or without unpacking pixels, e.g. pRAA or RG10, depending
on what userspace requests.
In the unpacking case, a dedicated register is being set.

If the userspace requests pRAA, this works, because the check validates the
pipeline:

v4l2-ctl -d /dev/video0 --set-fmt-video=width=3280,height=2464,pixelformat=pRAA \
 --stream-mmap --stream-count=1 --stream-to=frame.raw

but, with
v4l2-ctl -d /dev/video0 --set-fmt-video=width=3280,height=2464,pixelformat=RG10 \
--stream-mmap --stream-count=1 --stream-to=frame.raw

unicam complains at validation level:

image: format mismatch: 0x300f <=> RG10 little-endian (0x30314752)

This should work, because MEDIA_BUS_FMT_SRGGB10_1X10 can be packed into either
RG10 or pRAA depending on the packing register.

To fix this, modified the condition check to also allow in the case when
requested format (fmt->pixelformat) is equal to fmtinfo->unpacked_fourcc.

Fixes: 08f9794d9b79 ("media: bcm2835-unicam: Fix RGB format / mbus code association")
Signed-off-by: Eugen Hristev <ehristev@kernel.org>
---
 drivers/media/platform/broadcom/bcm2835-unicam.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index 8d28ba0b59a3..cc7627e9a51a 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -2158,7 +2158,8 @@ static int unicam_video_link_validate(struct media_link *link)
 		 * In order to allow the applications using the old behaviour to
 		 * run, let's accept the old combination, but warn about it.
 		 */
-		if (fmtinfo->fourcc != fmt->pixelformat) {
+		if (fmt->pixelformat != fmtinfo->fourcc &&
+		    fmt->pixelformat != fmtinfo->unpacked_fourcc) {
 			if ((fmt->pixelformat == V4L2_PIX_FMT_BGR24 &&
 			     format->code == MEDIA_BUS_FMT_BGR888_1X24) ||
 			    (fmt->pixelformat == V4L2_PIX_FMT_RGB24 &&

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260520-bcmpi-2c4850314e21

Best regards,
--  
Eugen Hristev <ehristev@kernel.org>


