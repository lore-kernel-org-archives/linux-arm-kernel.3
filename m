Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88EDE69E9F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 10:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q4sUFc93gmjBPZgy68yfM8oI42T2WlPXmr5pgphYQSI=; b=eTaBrB5/Ovplvn1+ovvHQGoZG2
	2s3KU0V4Cx645+WJcbXwLJzD2Ka21k3M/Wqi/TN00AGvrBmx7vLwhfibZ74IssoychjH1TXyXwBH1
	wJIOUMgdF900sdlo4pI3WPE0O8gOiKh/pBFqor3IPwfR6GgwWyDsX2hmVXIDtDJfLA9UzHplCMm+r
	kSHfjDOFDHJn4M9LMhnd2UzSdxb3I+qqpgB+Asr6goqLQllUyxKO3HLxnAcVqVz7naYUZURMA733C
	PiKPYZHeLwwhBXPyGaGYGGsjRkagc9ksxOYf8RdE0A9Vnh+iHqUeef2x6rEsssWNF6mFpgg83fkFR
	ZbchSr6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQcF-00000009ATf-1IYx;
	Tue, 03 Dec 2024 10:58:51 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQPq-000000097sX-0PHI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 10:46:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=q4sUFc93gmjBPZgy68yfM8oI42T2WlPXmr5pgphYQSI=; b=nTrt4M3CasJxXw6OBstUtotAwB
	1WpkLzMA5oiU3Ba86Sa2CIFx8lJwxpKMWvAhVTsNWCxypFy4crjYZgHxUfIjloq0PSFz9Z6mLCja8
	oq1Ce0VtkITV8dQ7PqrelwFvQHDwT+b1Ka3jhM/rn1oR5Lpws+Lo9izXljgMkZSYsre8Bx389bRnP
	m1saEEoL2bDUQ9moGPwOIR5M3wyGvAH8jduBhN+/ibCY1f5PAQSQbspSClgVADFxNO5RNubN7YcRG
	d8EkB38Vd+VTVd8H6GhekIHctrFkou6mPGf/KuaA5iKodR8RAy5PIHKzlCqZFJhYeKjFp9d/MmEEP
	8YY/dTaw==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1tIQPj-0001Pu-Nv; Tue, 03 Dec 2024 11:45:55 +0100
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1tIQPj-000LGA-0D;
	Tue, 03 Dec 2024 11:45:55 +0100
From: Esben Haabendal <esben@geanix.com>
Date: Tue, 03 Dec 2024 11:45:36 +0100
Subject: [PATCH 6/6] rtc: interface: Ensure alarm irq is enabled when UIE
 is enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-rtc-uie-irq-fixes-v1-6-01286ecd9f3f@geanix.com>
References: <20241203-rtc-uie-irq-fixes-v1-0-01286ecd9f3f@geanix.com>
In-Reply-To: <20241203-rtc-uie-irq-fixes-v1-0-01286ecd9f3f@geanix.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Esben Haabendal <esben@geanix.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733222752; l=1219;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=9Dt96s2Bcm1MRb0U9H3U4fTwQJyZ4SwoQ7T4izq5lpw=;
 b=r3Dyu5602AIrHx2dWjtPnTDJcvMVNYZzvLiEShal74iF5XFHfuxtkFwXBxg/GB5IcrPZAcp/Y
 sUdFz60GGCoARdQ0Yvo2lFgP3OoUSFmijOQzgDAwUvHBkSD7c4NrMhn
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27476/Tue Dec  3 10:52:11 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_024602_448891_7B205A1D 
X-CRM114-Status: GOOD (  10.62  )
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

When setting a normal alarm, user-space is responsible for using
RTC_AIE_ON/RTC_AIE_OFF to control if alarm irq should be enabled.

But when RTC_UIE_ON is used, interrupts must be so that the requested
irq events are generated.
When RTC_UIE_OFF is used, alarm irq is disabled if there are no other
alarms queued, so this commit brings symmetry to that.

Signed-off-by: Esben Haabendal <esben@geanix.com>
Cc: stable@vger.kernel.org
---
 drivers/rtc/interface.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index e365e8fd166db31f8b44fac9fb923d36881b1394..39db12f267cc627febb78e67400aaf8fc3301b0c 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -617,6 +617,10 @@ int rtc_update_irq_enable(struct rtc_device *rtc, unsigned int enabled)
 		rtc->uie_rtctimer.node.expires = ktime_add(now, onesec);
 		rtc->uie_rtctimer.period = ktime_set(1, 0);
 		err = rtc_timer_enqueue(rtc, &rtc->uie_rtctimer);
+		if (!err && rtc->ops && rtc->ops->alarm_irq_enable)
+			err = rtc->ops->alarm_irq_enable(rtc->dev.parent, 1);
+		if (err)
+			goto out;
 	} else {
 		rtc_timer_remove(rtc, &rtc->uie_rtctimer);
 	}

-- 
2.47.1


