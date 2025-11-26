Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BB4D1039D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 10:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rTTCxc4MaCFCb9ALndfPRwOpBtfwAOdIt5SutWfVfSI=; b=AdVqzsZEtuwwzzpnnn7G9Xytpr
	Ks1W9z+aKfW/tcVHvnUldukDUn9FXQAkr3qTrMguzs4RuIngQvoyzgiYTGI3m0J1zonSWv2WYlgFE
	ign2oxgjVfwEGcPzSXroNX1gwLQX87h7HKCJhHkGZ1HeJ8GuKKnHCMEzfw4UQGsJ/AFaBCzIV589F
	XoxYbHISuo9iStcSqadC/8ay4P8r8G8yZcAMC0VU708++IwjxhCBM9RXFH+2YCLNrbfvvCS/Co1H1
	ZA+fPSNU8DuU+6T19Ur7fzt7b91tHOeDM4EWiCGtsYJdELVW0BzOsg6Ay+l91vk1cHEE7VJXQAT/5
	MDcNkNrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODAk-0000000EqJE-1eGN;
	Wed, 26 Nov 2025 10:54:54 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODAh-0000000EqHJ-0stE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 10:54:52 +0000
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-3e12fd71984so4139260fac.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 02:54:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764154490; x=1764759290;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTTCxc4MaCFCb9ALndfPRwOpBtfwAOdIt5SutWfVfSI=;
        b=Xd7Kw9tiCGVnALc19piTWv5ofC4drqMHdAgL/ve4EtI+AHNdc/UTboUXcQKRXHvwzj
         sBTF/yM5F/4YgE/6XqK9013d22GAXZmg3+ZVEgJU/9T0Pv6DLE4fYOOYuKd+rm/xYumD
         sWiYiTRZBseGOjGxrIPm7weX678kZoKvHwjcaK7Ugxx5ZTm795SXGLesjtl8lnXX9EcB
         hR3gF300XykZiVINse3uIPJ1zgTE9w47zVL04aISKIhnvQNm98+jZm9MvzBL0Iu3i+o4
         0sFVfq2KX2RREiuhBgazZGItgTGU6hGN9zLKR6ZHqI2VpDU0qoxJMNnHbQQIsJLezXoQ
         RzLw==
X-Gm-Message-State: AOJu0YxYSLLty2bOxHN6i10xVmfYSGhUTbuFv14XfPtPPzgHu+BioDUP
	ncajk1E4MMxhJ+hI96rOfAFaLYrCz2Sx2XDOpIsUf6dG/5DZZc1kxExd
X-Gm-Gg: ASbGnctFFbvFmCaYq504Hs+TtqZowoLeqAdpJHbQd9sUNHObYoHKb2V1h33NdcaXRjk
	A9p9yaRqYrsTcEOCnahFXn+silbkAoF/4+j2Py0XqDBP04Fr0L7k8yd/9+2f46MpQhVSni99Vjm
	RxBfb+7fOacjdt9kmtnElNYewaeUtehf7HcPOvRDaCm53kEbk0d7OpoHMXiEylWVlzn4tDVjlPy
	RvZBFH21PTnboDuwEvsZ2TSeDSzR2tlgiXJtweQx+joEMa+6/8r8Ji+F4ze5A1Z7CV2jrcNncBW
	zDQoBm7EgqeEYz6VOTFVqWhtdQEUSZfBuvfpc23txte8u1NsxfuzWKDpQtNQfJfeIXXlCX9TNeG
	xq5XQ1c4rYGuOt8zH8fV7S9Hl2P5bSqOsYad582e14K57rGc+M8P13CitWOTyr3wOeZR84z3gT/
	RZ0PNGdh5Fyb5U8w==
X-Google-Smtp-Source: AGHT+IFuKu9CL4OmitweQtj9FWFp7CoKQ0umbOJ8FTbSZuyLzYDItiE7AmncPJ0P+j0ZnTiSsNAoyA==
X-Received: by 2002:a05:6870:ac08:b0:3ec:53a8:437d with SMTP id 586e51a60fabf-3ecbe28c21emr8317882fac.6.1764154489592;
        Wed, 26 Nov 2025 02:54:49 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:4e::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ec9dc8e0e1sm8914485fac.18.2025.11.26.02.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 02:54:49 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
Date: Wed, 26 Nov 2025 02:54:40 -0800
Subject: [PATCH net-next] net: thunder: convert to use .get_rx_ring_count
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-gxring_cavium-v1-1-a066c0c9e0c6@debian.org>
X-B4-Tracking: v=1; b=H4sIAG/cJmkC/x3MQQrCMBAF0KsMf92ASTHQXEVESvpNZ+EoSS2B0
 rsLvgO8A41V2ZDkQOWuTd+GJH4Q5HW2QqcLkiBcwtX7EF3pVa088rzr9+UWjhNz9GMkMQg+lU/
 t/+8G4+aMfcP9PH8m9xnXaQAAAA==
X-Change-ID: 20251126-gxring_cavium-de39ec6136ee
To: Sunil Goutham <sgoutham@marvell.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-team@meta.com, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-a6db3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2044; i=leitao@debian.org;
 h=from:subject:message-id; bh=tEAuHtS8/XCUiYcXWYUoaNe7PaNE5xwF6AJ8POofAIg=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpJtx4y8QFI1JwZMblGTo8qDkuZF4qybDcdBql5
 h0VQ5pCeuuJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaSbceAAKCRA1o5Of/Hh3
 bXeDEACBZgnKRto4wtRjoIQIlcSdnIQi3vbv5myNO6X0tvt4WG/399mJXEQO/w7BVFdDhSBWe+L
 Ewl50esS85iqi/nBJXAuIwKWWMx+ObIEsu//gm5NvHLQA6Yb2Vtk0zKP42Zid6ZJi/8Zxkm65Fo
 rkpRDzQs7DIhbkSBDngxHFI3WFHVMVteAt2/bTXEDJ3N4wBvdeMiGrzvaSvjiUQ+cFpoAm06Sy2
 t6A2N0V2pMba7+xLl8QHJ3cUcQsumW2ukspZoqR0yUCj0pncEr63nkZasALZZ6eK+ma34CzsR8W
 u6WijiHofTTvLkTGkAy+HGanOhQIT2FtVXtcVSQDwOREqQuploy4coJJO/7XLdzPSKDZ9ZSsvUx
 l7ieqs1i5vpB9cLyat0Bqneqx7tyEm76zQNiOF3ouOoUKID8sTVPbsM/6svfxJ3aUX0KXfEfkAw
 m9pwMBrUSnT0QrWfJ3KqOJxikgBki5dkpwau4yTB5p2M0NfG/UKBPeaZ6naOu5CqzPeQKONhrDk
 9gXlAyd/BGrjAkqYt1ugWHiYtmlEgbI67u3OWsl41fLYhevyUTNohGl38Luw54cCcR7msjjqbYq
 +sscrornSqZFRod3ZYzr8w61/+RuN6uuVcK8kSMDgzSjvl+7R/UePxD3Qlp28k/uQov7jRpXd1M
 oX/nzKHO/SPJODg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_025451_261888_007AECB2 
X-CRM114-Status: GOOD (  13.55  )
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

Convert the Cavium Thunder NIC VF driver to use the new .get_rx_ring_count
ethtool operation instead of implementing .get_rxnfc solely for handling
ETHTOOL_GRXRINGS command. This simplifies the code by removing the
switch statement and replacing it with a direct return of the queue
count.

The new callback provides the same functionality in a more direct way,
following the ongoing ethtool API modernization.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/net/ethernet/cavium/thunder/nicvf_ethtool.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/cavium/thunder/nicvf_ethtool.c b/drivers/net/ethernet/cavium/thunder/nicvf_ethtool.c
index fc6053414b7d..413028bdcacb 100644
--- a/drivers/net/ethernet/cavium/thunder/nicvf_ethtool.c
+++ b/drivers/net/ethernet/cavium/thunder/nicvf_ethtool.c
@@ -541,21 +541,11 @@ static int nicvf_get_rxfh_fields(struct net_device *dev,
 	return 0;
 }
 
-static int nicvf_get_rxnfc(struct net_device *dev,
-			   struct ethtool_rxnfc *info, u32 *rules)
+static u32 nicvf_get_rx_ring_count(struct net_device *dev)
 {
 	struct nicvf *nic = netdev_priv(dev);
-	int ret = -EOPNOTSUPP;
 
-	switch (info->cmd) {
-	case ETHTOOL_GRXRINGS:
-		info->data = nic->rx_queues;
-		ret = 0;
-		break;
-	default:
-		break;
-	}
-	return ret;
+	return nic->rx_queues;
 }
 
 static int nicvf_set_rxfh_fields(struct net_device *dev,
@@ -861,7 +851,7 @@ static const struct ethtool_ops nicvf_ethtool_ops = {
 	.get_coalesce		= nicvf_get_coalesce,
 	.get_ringparam		= nicvf_get_ringparam,
 	.set_ringparam		= nicvf_set_ringparam,
-	.get_rxnfc		= nicvf_get_rxnfc,
+	.get_rx_ring_count	= nicvf_get_rx_ring_count,
 	.get_rxfh_key_size	= nicvf_get_rxfh_key_size,
 	.get_rxfh_indir_size	= nicvf_get_rxfh_indir_size,
 	.get_rxfh		= nicvf_get_rxfh,

---
base-commit: ab084f0b8d6d2ee4b1c6a28f39a2a7430bdfa7f0
change-id: 20251126-gxring_cavium-de39ec6136ee

Best regards,
--  
Breno Leitao <leitao@debian.org>


