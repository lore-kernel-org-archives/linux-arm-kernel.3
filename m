Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B78CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 22:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gVvTmy2kjAxDOQ5oAUZAa+g5F4bDNkNdVicqOVQl7M4=; b=tfRFDLvgnjDHqDwprlc2tdxzJG
	PN/orVbCBNOZDKWMgeSEtjuVVe70UR5PSBWGZuRqvxHjQN1d8cgrTveQrRtwSR8dhAatvl97CzCwA
	f8XOjPTvcJbkoSDUHekDwUjc1S6WIcdRMPPQTcMwQwKsJrrJqFCV622kG7PjDgvO6+6WkTBhBUIFi
	j5aWg2hmyW0beiVfq9dWWJIoGTi2N8zfjIZb8RWFpBV322cOYRQjNMPlMeb2Y4V7Eenrs4LuWZKYw
	HbUEokusnDBBxva1gs3xAPMr/aE6bZa//N5w2fuJk12SS7V0bA2dPD9QCR+Jh+QvszWimQ78PYVRO
	QL85CypA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYWln-0000000CZdK-3dXJ;
	Sat, 13 Jun 2026 22:24:03 +0000
Received: from mail-dy1-x1341.google.com ([2607:f8b0:4864:20::1341])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYWlj-0000000CZcc-1to6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 22:24:02 +0000
Received: by mail-dy1-x1341.google.com with SMTP id 5a478bee46e88-304d7f31215so2037668eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 15:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781389438; x=1781994238; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gVvTmy2kjAxDOQ5oAUZAa+g5F4bDNkNdVicqOVQl7M4=;
        b=mGuMzWZWTGGaPkXl6Lushlo/0289/Q7wdBYPUgVI3826x8KbUhBMLz/ohPzjisLFDf
         5LNM2ErPu2mvz23iFbG+WOoLcxSzVLMPqqvC4T0Q8azzqW+DplencRSbZ4qL7sOIU8Ls
         O4/Z8m+8LCxrUqPbxeUUpn3qmM0719hb5dVcUc4YbpHjH2srSxjdPAdJI/nHWZwJb+qB
         bTRNYfQHbXnf9FZUzXCat6EwPqd29BW/famwL2JhxVZdHfGsx+x9fk1pIomcUCR54E7H
         AGAL5s7UIVVEsDBxSNqsQFw9TMSKxh85A+mR6HA6Jjnlf44XZ6135hHHsrWanr6fl57m
         efyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781389438; x=1781994238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gVvTmy2kjAxDOQ5oAUZAa+g5F4bDNkNdVicqOVQl7M4=;
        b=BibEHRHDVGAuvCglC266mtXi0WD5aYx+yE4GtOJNHJkOqHR8/pRaxEzZJ0xlnluqN+
         CV6WRoELQFYJLqWwA4k64U1gCPIbixriRnPTxBhNbOU8otd4UXltWWWhnrdQh3Rf6n5u
         5GBH+zIDIqMflHFN6QYbJwBsguFP6e6vr8gM00gtbPCo9giYqUlw3CNxxAwr+zGIGvy1
         YVeu0QqU4+R26Pjp855Kbxj3hJuEAxO2gCqQ6l2Z4FuWa7P4sk7c33o6v6hTjvL/MFBt
         yvVBDkHansvCOxG3aCyccktd19J7NVISrnJ84byqghUvSEK54jMyW+OIBjhE9mhb+QxT
         dMqQ==
X-Forwarded-Encrypted: i=1; AFNElJ9NKZzxZYRhTHn52hR9sjdozUt0Of0j492nNRhBukHD5vXTaX6dtyI0Gbl/3Fk1rLWUM2f07WDuVGU8oechW0WG@lists.infradead.org
X-Gm-Message-State: AOJu0YzI8q1zUP7Xyi1KjTnX3SfYikxVWR90H3CMwcJrSZ0BuRAKpF/9
	GYK8sqIO7m0du/CaIioT3SF+SDiSf0lQxiKBTLLBrZA07qqvSqP7RBOeVuC1Nsgx
X-Gm-Gg: Acq92OFZWuXOL486adJaC/xokwKPdsQaQ0wSEup1W15JCxN9x8RrVS977Rbbdtdd8DA
	KY0VR23+Gz++W6dp0wPyFar6WOQ/yolrT/TbIgRWZYc/7M32g2C4R6i5vVlIc3eKdwgOJDS9EJI
	rZpa8x7NztzhThDUO28zfpiXnc/mxe0J2HHLYlu+LhpNuzFEZykFLZnhDQR6Y1K0w+Gpqn3mGYk
	mHxTbYiOstPUwpT+CPT4PXR0W249ISl9IbhhhvrrDUKI80XY3uP9KU4TdtjGc6YikXKYXfuxmjX
	a6QQ6vVPktkSZQBDmBBlYgQC182Xx4nGX1hBDq3zM3wp226DzWaY07mg6iUu0dQmbokSkH35tOp
	tpLo+a17mOTjcO7De/cNaCVuJ7SocBpw9y88RBbBEKG0wJaInQ4ggPT7pJ/MYYlKkoC7Dn+nDvM
	D6HPPNF0jXn5CnU6KQM7otqz9SNiiID9iyIqUBaEBDd8L6jZoEzKQrXtwWFzn6/HTl0lKV93fcj
	OsuGNhDvQieDHDp2mMbm1j0dhS9rYt2ZAdrLFu5WpiMFqfu1QS6j+Hh/WoOHbkDyCklkog67QE2
	cogkC65R2cmkr1CRog==
X-Received: by 2002:a05:7300:dc88:b0:304:b93a:5107 with SMTP id 5a478bee46e88-3082004ba43mr4735033eec.21.1781389438357;
        Sat, 13 Jun 2026 15:23:58 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb9a2e7sm8811701eec.30.2026.06.13.15.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 15:23:58 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: "GitAuthor: Ethan Nelson-Moore" <enelsonmoore@gmail.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] [media] mt2063: correct CONFIG_MEDIA_TUNER_MT2063 macro name in comment
Date: Sat, 13 Jun 2026 15:23:46 -0700
Message-ID: <20260613222349.102397-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_152359_483005_69FDAB03 
X-CRM114-Status: GOOD (  12.07  )
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

A comment in drivers/media/tuners/mt2063.h incorrectly refers to
CONFIG_DVB_MT2063 instead of CONFIG_MEDIA_TUNER_MT2063. Correct it.

Discovered while searching for CONFIG_* symbols referenced in code but
not defined in any Kconfig file.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 drivers/media/tuners/mt2063.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/tuners/mt2063.h b/drivers/media/tuners/mt2063.h
index 30d03cd76061..6c4b6c68ec25 100644
--- a/drivers/media/tuners/mt2063.h
+++ b/drivers/media/tuners/mt2063.h
@@ -24,6 +24,6 @@ static inline struct dvb_frontend *mt2063_attach(struct dvb_frontend *fe,
 	return NULL;
 }
 
-#endif /* CONFIG_DVB_MT2063 */
+#endif /* IS_REACHABLE(CONFIG_MEDIA_TUNER_MT2063) */
 
 #endif /* __MT2063_H__ */
-- 
2.43.0


