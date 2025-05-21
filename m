Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0735EC54E65
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 10:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H2LmXhZzc1qzkgRYCvMVEi2I5HZtnbqm/3T3c5bh0T8=; b=EKcwDsQZusKcliF6y5AdcgElaY
	sNYME4bDucO5736NA2vPVBhhJNC59+LwG9POPzaDE0tnK3iAxQqRkTt9tyFdm1T8cs1I1TlmIFnl5
	gtb7KLT+KbLza96uijT+h+8kPLWNWHmzSoRhgR4CndycQ2HnrpFDgiTmpWgO8JTJYoVFEVwMsQPod
	b8g6RKY5RmoNrzs6x5YAfgCuBSw4g67AyyVhtSc6YQgRc1MU+L6x5XyFfyt5YxNeK238GOUtB8Nsa
	dMoXDTm19tT7uROsymq1KecaIA8cmajgGbL088ckzVQwbRWw2JTGo5Zduo9f9Yh9B0PpHnyouqWKv
	XmNAVa+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHghs-0000000FSvS-3CDb;
	Wed, 21 May 2025 10:29:52 +0000
Received: from smtp2-g21.free.fr ([212.27.42.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHgJd-0000000FOT7-13Yz;
	Wed, 21 May 2025 10:04:50 +0000
Received: from localhost (unknown [82.64.135.138])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 14B2F200401;
	Wed, 21 May 2025 12:04:35 +0200 (CEST)
Received: by localhost (Postfix, from userid 1502)
	id 8BCBDC4D7; Wed, 21 May 2025 10:04:35 +0000 (GMT)
Date: Wed, 21 May 2025 10:04:35 +0000
From: Etienne Buira <etienne.buira@free.fr>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Etienne Buira <etienne.buira@free.fr>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] firmware/raspberrypi: raise timeout to 3s
Message-ID: <aC2lM6xXCVK_3oWI@Z926fQmE5jqhFMgp6>
Mail-Followup-To: Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Etienne Buira <etienne.buira@free.fr>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <e5659e34-511c-4137-9ffe-152bb0777146@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e5659e34-511c-4137-9ffe-152bb0777146@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_030449_432395_84E5868A 
X-CRM114-Status: GOOD (  12.98  )
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

Raspberry firmware driver expected said firmware to answer by 1 second.
However, some firmware versions are buggy and can take longer with
RPI_FIRMWARE_NOTIFY_DISPLAY_DONE.
[    2.861407] ------------[ cut here ]------------
[    2.865512] Firmware transaction 0x00030066 timeout

Raising the timeout to 3 seconds (ought to be enough®) doesn't trigger
timeouts anymore for me and proceeds to the next failure.

Some details about firmware debugging are available here:
Link: https://github.com/raspberrypi/firmware/issues/1970

Signed-off-by: Etienne Buira <etienne.buira@free.fr>

---
v2: coding style
v3: commit message

Stefan, feel free to edit to your liking if needed, or even take
ownership of such one-liner, that would not be stealing.

 drivers/firmware/raspberrypi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 7ecde6921a0a..8c45a152e3ba 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -58,7 +58,7 @@ rpi_firmware_transaction(struct rpi_firmware *fw, u32 chan, u32 data)
 	reinit_completion(&fw->c);
 	ret = mbox_send_message(fw->chan, &message);
 	if (ret >= 0) {
-		if (wait_for_completion_timeout(&fw->c, HZ)) {
+		if (wait_for_completion_timeout(&fw->c, 3 * HZ)) {
 			ret = 0;
 		} else {
 			ret = -ETIMEDOUT;
-- 
2.48.1


