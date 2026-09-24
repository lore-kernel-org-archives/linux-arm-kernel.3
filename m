Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427B0C98317
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 11:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7/+uyVMC+2gJk/WZarm4fABHT/pO1A0jQduvUZmyoXk=; b=h6x/eSdFVUfVUHpgGouOMZy5Jv
	GvVoZT8iilHBlh/9Q46klvQFd6n/RKq22KW/EDeOO1lJW+pSpXfX8Lgm+rJF2JGyTXZin0eSTJRX3
	so05kFCZvF9cYJJqn/TAohh0E/lgu99i9nuhNed1ZEkZxLo7LQB9vBw65AzDpeoYMD/sljB43rbAq
	LLCYvGXUAH+hhKxZsZHGC6bosqcO3XaK83WPBeOf9kFIc5s4YJeZVhp23Zw6KFxuj/Gbcp7IjXpYx
	A9+34ThkXwhanpqhHs6xOFZior8WkYWemPNaDmrxVjtAh0t7GmsXHelEm3TsnNPs+sHr86SngMs2g
	HQWhiWfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hnq-0000000AtW6-12ot;
	Thu, 24 Sep 2026 11:39:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hnm-0000000AtVZ-3wc1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 11:39:48 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9Pmjh1644189
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 11:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7/+uyVMC+2gJk/WZarm4fA
	BHT/pO1A0jQduvUZmyoXk=; b=bRuOOHMxg4BVLphU/UiU2ciSKKRiyNUDdhm20x
	c3tgOrgKp+cSf7Nfkr66QSTCXkqHhOUfeu9mXr0mtaG3tp69R3GJWlZHpcPpboZU
	i/QMKhA4nB/vbyOZzYtO0zi3Uu4emOWDoRkoPf/6ZV15nWMK36M9Gdvk6TPW1Z9N
	Tu9rc92+I64nY7ptc3rb7XUFOgmik/wSnz204oSw7afUwrGbtgAqwdpTOdtGkNXO
	MQKwKZ4z8hmmlXl+s4d2VZmVxkvjHHlqe617SDCW7eELz/07C291KQ3jBgNqsPOE
	b0eUEqg05FnhUFRmALVyfrTNoxsQ/HfoxaJMJUr6+HvBeyXA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvmrrbb57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 11:39:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934956beec8so382299485a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 04:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790249985; x=1790854785; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7/+uyVMC+2gJk/WZarm4fABHT/pO1A0jQduvUZmyoXk=;
        b=BdDCKxcOfbWg+zZ2ALsE9qf7GQjr2VjW3QLmmARYfa0vRVRgN4JyztWVEAA/KBTxrz
         8umZnlQ51/aF9XdJOTB1zGxguyX1y7Hfsu11ccR6xxLeQMyN3ReobkEnWqdrw1Bwhpx1
         9eJ7F5kAVh7l3m9ySQftleExNUOBh1CwWZphlGKKo+4zRnAQPRZSqJnjRxVRCUEzVb+M
         ksUFimexJyOXZue02sWlFMnhGhhOHIpCPjo3lnleqKY7oaLli96vEZYfVMLpIXga2ZxG
         RVNt39UWVPa+b1R5jJAoefu9PdknQAtNl+W1HaF9unElDb4f+334nDYsqs4JEhPgCGDJ
         y4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790249985; x=1790854785;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7/+uyVMC+2gJk/WZarm4fABHT/pO1A0jQduvUZmyoXk=;
        b=kXaLB+1DGsNfzgoVk9F6RCdqAeHWY8HaS6nikDEzu8mNgQTkdXF9hVoxBv+PPMvpEo
         dCoWIzA/rTKWWjALN3T8S8NPClLkJlqiWDytS3MvKLeQ48atMCac1MSrwwT2u06Ad6NN
         bKoAS4vw/tRCLcaqC+zAY/XV5WEU3b6z8s+B/zIUEeOvaEF6ZhzXl9BCy6dKOiuxcXf1
         TB2T7FG3McF1wlpoTDfqAfSUqQlQAq6KdU538RM/5SfHmLt8PSRA1cBkFf72K73iusQd
         VIuUKZKj/OS0+WouHoKjnfgCS4/egzQ5bhVDi5SQcQEM7BLH8ZJBVJ5vZSjPWwQbO6AL
         t6fg==
X-Forwarded-Encrypted: i=1; AKwUvBwR3AQE9EZwkWJPRPsHUrqsKq61QaIrmkXJYLJLZkBK1y+XZbcd7iShZgC3U3ntfxQeWj6FhCXr8T6Y9dhnFLuB@lists.infradead.org
X-Gm-Message-State: AFuF++n/8nmDzLbXxFkQe12e6Wh8EFcevdk8+U2j58wTz1mP377i2Lfg
	g/wwxZ4/ADZcJhz2DuSAC4NedzZ8U2dPoTnzSWRchg0vMaMgrrOiXMGieNIc+WaOze4aGLia87K
	CTo+h9ZtQ8vQ5PSowCzCJq0L8DpRAZuMck7heXf9mk3oQ/P7KDuBkIfrzrW8f6npTVBxiNdov2X
	r0Hw==
X-Gm-Gg: AYBFou2FOjqKwO/ZFDLF6JD3AwOYnKiU7MyljoZp8N7ldknN36mHjHzTQB4nZZjTnwO
	IOf/vJxAuXdmDmYFN5ReweedpfYBV3YiDe0V2B6zO8qgYC5bo3IM/1i+S1HCyUlnj/B8MJNuAUL
	Zw/qUxPTPXYFyFTFTYNKkJvya5E0opQ7ekBWYBdvFnAgH3gXAMGdl5Lckj9QuL9z9veOGTNdS64
	11yvmuIIVYKmiFybUWHeLQYUeQfhrQaItVloDGnS5YkQsgTHKBCL6NiosJFHhS3yEt3uPJwYPrQ
	5qz/g8P4MY922+kfLIZn2acdXYQXaZBVyKoQS9bcyGBSXJ18GANxq8mGEjrPEhpqvx7DPEzZ6b0
	IAQy/GVbPrTCbVQ==
X-Received: by 2002:a05:620a:c51:b0:939:993e:bffb with SMTP id af79cd13be357-93c3628e16fmr246048285a.22.1790249984651;
        Thu, 24 Sep 2026 04:39:44 -0700 (PDT)
X-Received: by 2002:a05:620a:c51:b0:939:993e:bffb with SMTP id af79cd13be357-93c3628e16fmr246042585a.22.1790249984087;
        Thu, 24 Sep 2026 04:39:44 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488684863d9sm14251392f8f.12.2026.09.24.04.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:39:43 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:30 +0200
Subject: [PATCH net v2] net: stmmac: propagate PTP addend and system time
 programming errors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-stmmac-ptp-added-systime-error-v2-1-beb2a6b5f866@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQrCMBBFr1Jm7ZR2xGhdeQ/pIiYTGzBNzcRiK
 b27oSdw8+H9D++vIJw8C1yrFRLPXnwcC9ChAjPo8cnobWGghlTTUYOSQ9AGpzyhtpYtyiLZB0Z
 OKSZ8mO6kFCly5KBIpsTOf/eDO4ycoS/l4CXHtOync7tP//rnFlu8aNPxWR+dYbpFkfr90S8TQ
 6hLQL9t2w9YKNFz2AAAAA==
X-Change-ID: 20260920-stmmac-ptp-added-systime-error-bc9566262f2f
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0OCBTYWx0ZWRfX9Ge9PNR0sN24
 Fr8QTrlTvADE4V087jQHlofX6jqGUFTmkRUb4XT2upCZ2Iiv4v8G4gB312yFeoTIYAUr4aBYoby
 EyKwvV2YhbB7UKUyzFi9u2odd+V/b4CrG7CUmp5o/f1+Gz1Alzpmgz0i4OHtbqkyzJkZ/5TLq4L
 NGI8MK6V2WdhdcWjuowwfzTWPOEMxHtARvs9APaWR0dlDxFLRWDIIlD+8WtI3kfUON5qaWDs/my
 RUgj9+e+Uin10dJ7RaS2o4hc93CDoJ9CTwnp5KHhPn49VU9VSDDDFpAFvQ2/G0ft1aEqfpGapW2
 u3Xv++VrP/sX92G/njH9v1bvsAfTPTXZ84XksQsnMsJuXyC7MxTmOjYn9U9UECqmDi29JFZOp7+
 +8Y8hl2e7u47CwWfsA7pL4ho0zWWJVUpnwVnHag8cm3aC60209Xe9oGCKvR19eJaiG7C90jk7Yq
 RgfUVZsxxGjafafax4w==
X-Authority-Analysis: v=2.4 cv=TYwDJhQh c=1 sm=1 tr=0 ts=6ab50c01 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9VuKQwgGOwxQ2f590fkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0OCBTYWx0ZWRfX/WJvrxfqo1+s
 hkkcEs12vrNHwHBuk7OPTDEGUti6v1zWkMg79u6De9eZMzD3600svv9JR9DZ1NKHQrJMlIcNmmd
 O9YDASLQZwC6gceTep64VtOBmiRPrDk=
X-Proofpoint-GUID: HAEayfukuBGh8zg8bYzuso2UR3fo5i57
X-Proofpoint-ORIG-GUID: HAEayfukuBGh8zg8bYzuso2UR3fo5i57
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_043947_124171_60F62B56 
X-CRM114-Status: GOOD (  20.96  )
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

stmmac_update_subsecond_increment() ignores the error returned by
stmmac_config_addend(), and stmmac_init_tstamp_counter() discards the
addend and system time programming errors, always returning success. A
failure to program the addend (PTP_TCR_TSADDREG) or to initialize the
system time counter (PTP_TCR_TSINIT) is therefore silently swallowed,
leaving the hardware timestamp counter in a non-running or partially
configured state while the driver keeps operating as if timestamping
were up. This matters for TAPRIO/EST offloading, which derives the gate
base time from the hardware timestamp counter.

Return error codes from stmmac_update_subsecond_increment(),
stmmac_init_tstamp_counter() and stmmac_dl_ts_coarse_set() instead of
silently returning success.

Fixes: cc4c9001ce31 ("net: stmmac: Switch stmmac_hwtimestamp to generic HW Interface Helpers")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
Changes in v2:
- Initialize sec_inc to 0 in stmmac_restore_subsecond_increment()
  routine.
- Link to v1: https://lore.kernel.org/r/20260920-stmmac-ptp-added-systime-error-v1-1-8ac9e7a3fce2@oss.qualcomm.com
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 87 ++++++++++++++++++-----
 1 file changed, 68 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3f34d491c959..28a83f4a174b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -601,31 +601,63 @@ static void stmmac_get_rx_hwtstamp(struct stmmac_priv *priv, struct dma_desc *p,
 	}
 }
 
-static void stmmac_update_subsecond_increment(struct stmmac_priv *priv)
+static void stmmac_restore_subsecond_increment(struct stmmac_priv *priv,
+					       u32 default_addend,
+					       u32 systime_flags)
 {
 	bool xmac = dwmac_is_xmac(priv->plat->core_type);
 	u32 sec_inc = 0;
+
+	stmmac_config_addend(priv, priv->ptpaddr, default_addend);
+	stmmac_config_hw_tstamping(priv, priv->ptpaddr, systime_flags);
+	stmmac_config_sub_second_increment(priv, priv->ptpaddr,
+					   priv->plat->clk_ptp_rate,
+					   xmac, &sec_inc);
+	priv->default_addend = default_addend;
+	priv->sub_second_inc = sec_inc;
+}
+
+static int stmmac_update_subsecond_increment(struct stmmac_priv *priv,
+					     u32 systime_flags)
+{
+	bool xmac = dwmac_is_xmac(priv->plat->core_type);
+	u32 sec_inc = 0, val;
 	u64 temp = 0;
+	int ret;
 
-	stmmac_config_hw_tstamping(priv, priv->ptpaddr, priv->systime_flags);
+	stmmac_config_hw_tstamping(priv, priv->ptpaddr, systime_flags);
 
 	/* program Sub Second Increment reg */
 	stmmac_config_sub_second_increment(priv, priv->ptpaddr,
 					   priv->plat->clk_ptp_rate,
 					   xmac, &sec_inc);
-	temp = div_u64(1000000000ULL, sec_inc);
-
-	/* Store sub second increment for later use */
-	priv->sub_second_inc = sec_inc;
+	if (!sec_inc) {
+		ret = -EINVAL;
+		goto error;
+	}
 
 	/* calculate default added value:
 	 * formula is :
 	 * addend = (2^32)/freq_div_ratio;
 	 * where, freq_div_ratio = 1e9ns/sec_inc
 	 */
+	temp = div_u64(1000000000ULL, sec_inc);
 	temp = (u64)(temp << 32);
-	priv->default_addend = div_u64(temp, priv->plat->clk_ptp_rate);
-	stmmac_config_addend(priv, priv->ptpaddr, priv->default_addend);
+	val = div_u64(temp, priv->plat->clk_ptp_rate);
+
+	ret = stmmac_config_addend(priv, priv->ptpaddr, val);
+	if (ret)
+		goto error;
+
+	priv->sub_second_inc = sec_inc;
+	priv->default_addend = val;
+
+	return 0;
+error:
+	/* Restore previous configuration */
+	stmmac_restore_subsecond_increment(priv, priv->default_addend,
+					   priv->systime_flags);
+	return ret;
 }
 
 /**
@@ -864,25 +896,37 @@ static int stmmac_hwtstamp_get(struct net_device *dev,
 static int stmmac_init_tstamp_counter(struct stmmac_priv *priv,
 				      u32 systime_flags)
 {
+	u32 default_addend = priv->default_addend;
 	struct timespec64 now;
+	int ret;
 
 	if (!priv->plat->clk_ptp_rate) {
 		netdev_err(priv->dev, "Invalid PTP clock rate");
 		return -EINVAL;
 	}
 
-	stmmac_config_hw_tstamping(priv, priv->ptpaddr, systime_flags);
-	priv->systime_flags = systime_flags;
-
-	stmmac_update_subsecond_increment(priv);
+	ret = stmmac_update_subsecond_increment(priv, systime_flags);
+	if (ret)
+		return ret;
 
 	/* initialize system time */
 	ktime_get_real_ts64(&now);
 
 	/* lower 32 bits of tv_sec are safe until y2106 */
-	stmmac_init_systime(priv, priv->ptpaddr, (u32)now.tv_sec, now.tv_nsec);
+	ret = stmmac_init_systime(priv, priv->ptpaddr, (u32)now.tv_sec,
+				  now.tv_nsec);
+	if (ret)
+		goto error;
+
+	priv->systime_flags = systime_flags;
 
 	return 0;
+error:
+	/* Restore previous configuration */
+	stmmac_restore_subsecond_increment(priv, default_addend,
+					   priv->systime_flags);
+
+	return ret;
 }
 
 /**
@@ -7696,18 +7740,23 @@ static int stmmac_dl_ts_coarse_set(struct devlink *dl, u32 id,
 {
 	struct stmmac_devlink_priv *dl_priv = devlink_priv(dl);
 	struct stmmac_priv *priv = dl_priv->stmmac_priv;
+	u32 systime_flags = priv->systime_flags;
+	int ret;
 
-	priv->tsfupdt_coarse = ctx->val.vbool;
-
-	if (priv->tsfupdt_coarse)
-		priv->systime_flags &= ~PTP_TCR_TSCFUPDT;
+	if (ctx->val.vbool)
+		systime_flags &= ~PTP_TCR_TSCFUPDT;
 	else
-		priv->systime_flags |= PTP_TCR_TSCFUPDT;
+		systime_flags |= PTP_TCR_TSCFUPDT;
 
 	/* In Coarse mode, we can use a smaller subsecond increment, let's
 	 * reconfigure the systime, subsecond increment and addend.
 	 */
-	stmmac_update_subsecond_increment(priv);
+	ret = stmmac_update_subsecond_increment(priv, systime_flags);
+	if (ret)
+		return ret;
+
+	priv->tsfupdt_coarse = ctx->val.vbool;
+	priv->systime_flags = systime_flags;
 
 	return 0;
 }

---
base-commit: 58eb1b3325edac42dc6df72c80962bd53a3c8ca7
change-id: 20260920-stmmac-ptp-added-systime-error-bc9566262f2f

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


