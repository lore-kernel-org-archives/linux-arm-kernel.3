Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54895C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 19:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0JsV02jiIk99Htrjv4Tooh1nCMqCT9M9OeWRZPiqd+Y=; b=atKV0U7CObIpm9/mDw+COygZgq
	5KK5D/M5JIKcilvH9h3QaoX4Px1khsuGsnZOoh0nm8mFvL7TvSpg07cTvLx0vVMC/rtAQo7sArukS
	WfBuNcwl0GuRqmGs51221ZgnefcIos0TnzGFDNESmKG2Yj+EJ37sf7V4APFQtlQz68J3lI0MBcPlQ
	Lkjg8cvR01pjKZ4omCNfftCun6IgG5G0ZTzQ1Cih1FV3MSoPDbmWygzpaFqK+CPKyDz3MZWd2ggBW
	gQSc/xGlo5JdGyC5zc99NFGFRSFyOTSEx5iMoR4AavsbgfbTFP+qvCzCos9jIZjYceVwhVbxMVFX7
	fjoUl6Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtsHh-0000000Er5w-1ORk;
	Tue, 11 Aug 2026 19:37:13 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtsHc-0000000Er3q-1YQf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 19:37:11 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so752405e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 12:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786477026; x=1787081826; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0JsV02jiIk99Htrjv4Tooh1nCMqCT9M9OeWRZPiqd+Y=;
        b=W0z6mmFK7Fjttb50KYdakv6gTnuJCVvva0atY7KFrkZTsS7fl7TgWQpKUEn0xJ9xj0
         N874wdwZAIzxcUCOgvGwLGpIlHB2KcqXGxQlQuAlDM+pL831Z9+DGIFOauQafmsGlJ03
         VVfbU2jPOtuXT57YhtlN7i8unKK0Z6yA5482ytUerwGfCJxsUZ6zVJlUUENK8U/1ZTAB
         JgF9Xh0mdzazCqlgKt6f5k+te6Akd6hjFovXHI+FsnvGe9bk0DALrgzEjsOGYj5craqq
         I78YVkkDyNMXP8cFyibMNDDWqbLvmm5+rbthrDg2RZLXlB/CcDC5oxTB4Y6KSMEG5HDa
         9kLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786477026; x=1787081826;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0JsV02jiIk99Htrjv4Tooh1nCMqCT9M9OeWRZPiqd+Y=;
        b=QCvZZ+3JyWP2oaS8HKJfdk/K4EDnbJzyVsT8k+HWbmM2hASMjmslT4v4tXkBT237hW
         tRIOl7tHvds5sB1JdrTCXYN9an7krq5vHVEXPoot3S8YBHJWILanLEioUrnQXllcRvUf
         5zrKJzLgnHwfwieVAJHln7EtmpkB8ujILDh74ROGUFSwLwW0g6Qp8s30CJ0Hg6AF4uFX
         u/dp2tDOv/GqO6mnfSJqq+qvK8wzC/hLmzYJTMvtHDcUrVwMyepuZwydfSSffBTD6LSZ
         QTZCnOvuvH50LOXiph5giiOWxTz4bfblEWKYQj6tk47fQ8wXXsQ+2ZWRqYY4uy/O92at
         axAA==
X-Forwarded-Encrypted: i=1; AHgh+RpEXdVpQJo9jOHyKLx1tIvxuwuItAh8s1CJc2aMGfDEZTS7xcp3sf8fXg/OTZ8CgFySOiwt83soroZsF1V7vilg@lists.infradead.org
X-Gm-Message-State: AOJu0YzviMvJxUxionHvxRDdmYBLLi+tCy4wyhjkQPE2H3zkgOAJYCf9
	3Sk4t3+G00R1RREw/wpoq3GzLjsYv1SDTaufTfEOP8PYIXz588bm9Wek
X-Gm-Gg: AR+sD11q1kW7EF+3PbR8UpTuST5cytRHkYsxWKSIzgKq5AcIK1DtXbrCjeWdgyRxyc9
	2Yt0FoNm8B+hgkFS/Iyo8X7J8AbqVYbsd3IqxhoQ4ys3tl88hLgtfEYimjTpXVcgHe7afbtiDum
	omiH5KPdZBoeP7M198XpkfjnCK/sTBzOYf2BecIQWAolaurbkhw6qtOfEA3Tw4KcA1l1O6wLy1w
	L1qsd/pYk+Z+F4eZnjnI/mRe+3/HqkSXvyr6Fi0gxN7BGRNa0jm4w1P0GTKfIglOkkobo+pqzFm
	w9wJkkaS2mnCrU3775d7uMMt5uYptE297592uJm+doZJw6iQIiYW5YUH/64eyYAOSV45aoTbURd
	mLdkJK1n1PiBxYp/qrW7Hx/XWYD3SiTv2XTK5mCtdLASQQ7KvpUnQMVNgkYsb2FJceW0PcOVZ+W
	e/nIqBoik4+y+VjJFmJoctzh6ifyjG4fQuhIYIYTxaEjme4xpYQlEVvub01vL2fpBWnvrvybECV
	xi7AN2VnXC22fdr0P5eb//fiPkr+guM65nshiyr
X-Received: by 2002:a05:600c:3589:b0:499:5e9e:1f50 with SMTP id 5b1f17b1804b1-4997842aa62mr87661505e9.4.1786477025980;
        Tue, 11 Aug 2026 12:37:05 -0700 (PDT)
Received: from localhost.localdomain.pl ([89.151.31.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997b15b807sm10130285e9.7.2026.08.11.12.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 12:37:05 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	netdev@vger.kernel.org,
	Hauke Mehrtens <hauke@hauke-m.de>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Semih Baskan <strst.gs@gmail.com>
Subject: [PATCH V2 net 1/2] b53: deal with Northstar devices using CPU port 5 or 7
Date: Tue, 11 Aug 2026 21:36:57 +0200
Message-ID: <20260811193658.14304-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_123708_427649_6B3831C1 
X-CRM114-Status: GOOD (  16.51  )
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

From: Rafał Miłecki <rafal@milecki.pl>

Northstar devices have 3 CPU ports. Ports 5 and 7 may be used but have
their limitations. Warn user when CPU port 8 isn't used and add EAP
setup workaround to avoid non-functional standalone ports.

Fixes: 4227ea91e265 ("net: dsa: b53: prevent standalone from trying to forward to other ports")
Cc: Semih Baskan <strst.gs@gmail.com>
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
Tested-by: Semih Baskan <strst.gs@gmail.com>
---
V2: Print warning on switch setup instead of on actual EAP mode change

I added PATCH 2/2 as requested but I'm not sure what DT maintainers will
say about it. I'd suggest to take this fix if there are not more
objections on net changes so regression can be fixed. I believe we can
take more time to improve Linux dealing with switch to be more optimal.

 drivers/net/dsa/b53/b53_common.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 3f5b9592794d..a9bc90b2ffd2 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -332,6 +332,14 @@ static void b53_set_eap_mode(struct b53_device *dev, int port, int mode)
 {
 	u64 eap_conf;
 
+	/*
+	 * Setting EAP_MODE_SIMPLIFIED with port 5/7 used as CPU port breaks
+	 * standalone ports, see:
+	 * https://lore.kernel.org/netdev/ce4d9b7b-aaf6-4796-94fb-8c3d6a1dcd4d@gmail.com/
+	 */
+	if (is5301x(dev) && !dsa_is_cpu_port(dev->ds, B53_CPU_PORT))
+		return;
+
 	if (is5325(dev) || is5365(dev) || dev->chip_id == BCM5389_DEVICE_ID)
 		return;
 
@@ -1281,6 +1289,18 @@ static int b53_setup(struct dsa_switch *ds)
 	u16 pvid;
 	int ret;
 
+	/*
+	 * Northstar SoCs devices have 3 Ethernet controllers and 3 CPU ports:
+	 * 5 (IMP1), 7, 8 (IMP0). This design was meant for dual IMP setups when
+	 * WAN traffic goes to port 5 and LAN traffic goes to port 8.
+	 *
+	 * While all 3 ports support Broadcom header, ports 5 and 7 have their
+	 * limitations. Features that relay on trapping to CPU (e.g. EAP, STP)
+	 * won't work when using those as CPU ones.
+	 */
+	if (is5301x(dev) && !dsa_is_cpu_port(dev->ds, B53_CPU_PORT))
+		dev_warn(dev->dev, "switch to CPU port 8 to use all switch features\n");
+
 	/* Request bridge PVID untagged when DSA_TAG_PROTO_NONE is set
 	 * which forces the CPU port to be tagged in all VLANs.
 	 */
-- 
2.51.0


