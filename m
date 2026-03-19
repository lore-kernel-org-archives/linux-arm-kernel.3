Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D721088E71
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 03:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LJa0hR/irIUiusrwe3oMLmqKlCXFbsoEt4pwhDPj6/4=; b=gZB9S5HAYLJOnSkPBxKdDh145V
	y8TkGf/tZgrIiHjtikfvjWlpOfHEK9+cUTRsMxcdDecFdapfLrNCASm6RYe6/Lcdr3E9cGx5uTYyn
	1ePtb86FGpb2n13bIHsDFFEWS2QQK/EZkiPWki/nwmdl3UTnB7xqsiW+wVNa53p6eWFGumTBcLGS+
	3Jaqi8zKQivmjYtCQI+RFt/l5DpsXjyI1FrxdCKcpw+D73fhmNIX7tcfF9Nk2dDK+jYcBHS/EnCNn
	eQTkCWx3nGpl5hjba8yzmp4BST2tms+oCDT5sUbAh7ML2DSWAbQpa5mCWIhtUjz8j0aV0gI2r183K
	Ps8CaBuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w342G-00000009pkX-3gbs;
	Thu, 19 Mar 2026 03:27:00 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w342E-00000009pji-3RIR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 03:26:59 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6676d55d01dso225719a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 20:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773890817; x=1774495617; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LJa0hR/irIUiusrwe3oMLmqKlCXFbsoEt4pwhDPj6/4=;
        b=S8kW2+2q3GHkxehe/bG3ivTL0hyOYB+fkruNLAIAnqq3rpehfodlwCyhqFD55fepBL
         QF+yOIvZDuWMB7cNdb29ziVzDjA0+sqGGXCAzv+rq+NXiS0QeoCwYAnMzBqgkYkiJBx/
         btDnQGUvKszGqRDROZG7kLdZHH/AfD4aFESsdkPYifbrKkzIetw5cDodLglsgqT52Hc4
         nfHeX+35rvUEtgS/4bMUmjLrF6fQaorewljq7bpTan8xR4w1P2k3YZgOyoWZsnps754o
         UqsVUoal7+rjVBWSG0sQsqoPsfDc9g1tX06YeBE/5O/YeSnpP6p6hsUqloPn4YgaAmVN
         neOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773890817; x=1774495617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJa0hR/irIUiusrwe3oMLmqKlCXFbsoEt4pwhDPj6/4=;
        b=nC47/kcjHUySlmmeQ93T1LMW9eoQpBj9RjGiDuPnuBG1WO3NzkO+FxhjHDlTcF28GQ
         5+XCDDGywKsLQuxsKZ/p2TUWzcqgQjAbZPEKHJ19S3j32CanwYUPdaJdz1pppOhEWdpF
         6fIRqQqtxe4I6DzO7VlHFmss8Glb96AXJkUXyLFVqEd7vuwYUQkKOj19B+0uKtn5MFOQ
         tHXLSGU0aMl/HPp1dMGMxwvCZOI5vgSTUztSGP9dgDE+Ay4XawLW/0J5ijiws/Dh9ty8
         JBS+Az504Kaxc4q7u3Sa+Hqf/YzYwzG5WLW8mNd7flQHAtFcK5H7bbbiYejXhzUvmfTL
         5fBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbQTspYrfmCWH038GvqzWkAZic6S5pbRBpLDb+0bsH0y40706dnicQ9NUk9QMFIONrwmUAwsYRX7eD92MG5JpW@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+3qys8ww0BGHZw2fU6D8ldUxvVWICPzwunoQthteDAdKoJpl5
	NZE8AvkUkKLr/tHkpkPMCfDrn5MptKQ3F1WPL1pM3xcDiCPB77+O7+Al
X-Gm-Gg: ATEYQzzjusrkwzFq8jzWjyiM4ZutmdUuil1qDAx8RtX/+vszjwmAXKmo2GRV9c6RfMY
	OIkxR2lHslZ3N5Bzo/Z0XgfsU4xy/4eqn6ESTozMZC79T7LHPYGsYqRFN51++kdj1qV1hcAybxA
	fOpEA+EhyPtAHZkMAQzny4LuBH9WAAi2H82EIfVQfS6ScwkgkaWE7UQSHDooNB3SjZC8lyf//Z0
	kipNI5It3nwd++XUVWVyOTRdr9p9zOOX/ujL8WJN9GWNLqwpOX50MycwXDD1w3Ip4CLybu4eJsQ
	1Y3wpENw3C9sIREXETyjyz12TYupjDk8bbOZuZ9vX8a1FfQHVl1zA6o75O0qAo7wAqF3TW2ufTN
	WaatZtuEDl2rDrqPfvbR6uCIJn3o0c/oA99oDoy4hQvnhrsEd9JcDWBDI+0Am4aWadovO86Dip7
	EqGKg=
X-Received: by 2002:a05:6402:5cd:b0:65b:edef:40b6 with SMTP id 4fb4d7f45d1cf-667b1880976mr3907686a12.6.1773890816443;
        Wed, 18 Mar 2026 20:26:56 -0700 (PDT)
Received: from gmail.com ([2a09:bac5:4e22:2e3c::49b:45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667af38d891sm3059684a12.9.2026.03.18.20.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 20:26:55 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: [PATCH net] net: airoha: add RCU lock around dev_fill_forward_path
Date: Thu, 19 Mar 2026 11:26:49 +0800
Message-ID: <20260319032649.337812-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_202658_862274_A53BD88E 
X-CRM114-Status: GOOD (  11.83  )
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

Since 0417adf367a0 ("ppp: fix race conditions in ppp_fill_forward_path")
dev_fill_forward_path() should be called with RCU read lock held. This
fix was applied to net, while the Airoha flowtable commit was applied to
net-next, so it hadn't been an issue until net was merged into net-next.

Fixes: a9af709fda7e ("Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net")
Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_ppe.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index ec5ce41dad80..02deb739a1c7 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -227,7 +227,9 @@ static int airoha_ppe_get_wdma_info(struct net_device *dev, const u8 *addr,
 	if (!dev)
 		return -ENODEV;
 
+	rcu_read_lock();
 	err = dev_fill_forward_path(dev, addr, &stack);
+	rcu_read_unlock();
 	if (err)
 		return err;
 
-- 
2.43.0


