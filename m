Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5034C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 13:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Dv++Hwgz+611wPTlNPuNZg9gGp73vyEv5RaQpPZcNTQ=; b=GwgryXWWo65Sj7I3exsqvwGWEq
	TPDKJANtF38Mr1cE2X80BiATGtQTv1IYYItwWvMfsHOhPpAs5Q0ApXM/ZS5u3YcwOvAKZ3vw7OeJT
	7H708Y3zP+50NmLLld1uY+1j1OKT0L9j3v1iob/0OKYB/AkhLslfORd0PgJVGrg+OyuSXGVjHiAQt
	iSm8fB6ytTxBTQgNYUnBEHcqdtXDuSkwUinqe9lfgGUUv7dWbeg4a7Jy63qrmeCPHN9pDtCUdTjGc
	3v3k6EGosO/ODpWFZiRcauS4YQdfnJKwpxrzWDttxL1l8UtwS4sHisKmuM+zqldt8UlOT62oGFcDu
	ChrRLqzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8H9j-0000000HTeT-3Ito;
	Sun, 20 Sep 2026 13:00:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8H9g-0000000HTe9-3Wao
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 13:00:30 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBnpxI974577
	for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 13:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Dv++Hwgz+611wPTlNPuNZg
	9gGp73vyEv5RaQpPZcNTQ=; b=FO3wYcFMrcX5P02v0oNSx90E8cM63zXbaurZeL
	AHmrY7LltNDFGq/R8JcrmxAC9Y0FHBU6+TXJeJNuwrLOD/ykOONzvmGcSf1rZc+a
	+sgvDxKrMJj40osgl0qJwjwjiTv1Si3IotQH3WbjoICmoXZkpvaw8CX6/8yzR2TL
	q06lBUk2+PAVV/Kn/1g/MjwI8KtqZv2NDQfNaJ6BjYlIBQ+dp+AYdRlqXGfqO9fc
	AQYbr3/Ykc6ZVUxZyn+0c92i7n0y/aBZF/Tb65MKhmjcZ4x1iSF02PNW6hWVqHXT
	sJVgCyKq6hTsN0FrBsbXnKeZ0hqMdiTUYOKf1F1Vb7rjsWMA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gskjk2w4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 13:00:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a183a0e93so516192185a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 06:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789909227; x=1790514027; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Dv++Hwgz+611wPTlNPuNZg9gGp73vyEv5RaQpPZcNTQ=;
        b=Dk9MRDUUpVU+mTwspgSK5J3V2onlh9yaLN9/KYLupZqE/Mpl9OtoFP3cywSOwJIjdn
         bXOtwp1Xwpz+1NbHRsaXyNsK+JyKKDFFDAZr+Wo3lBJ7Tnw0ozlyYb2VgEfSuTursEjH
         eeit2SW6f1Y4gUdFU4tEPphyUENmin6+C1nkhKyysePfQVX34YXQmKNxv3R24tAxwtNZ
         XRGv5H7Apt3IVzBbKXhRvBGUYNcT/sstsuYcY4ACAizKoG/AJ2HqdzoONXX+1qz1PC3x
         bn8VdCUuKpHEJ/BDy/4R16py+b1G0jsHUE0GYjfZOSka2DpPOi+0PlvjLl5GmGzRDjX1
         3tiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789909227; x=1790514027;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Dv++Hwgz+611wPTlNPuNZg9gGp73vyEv5RaQpPZcNTQ=;
        b=DoobjMA5+gxhj6H1jbGPuI5+z9E5k9XpeILVDccO9DXnGGgSBs3V1IXFA7FenzEpFv
         0bEcdMgT3xE95zoNK5hJeen1X/VWkip7GPj4u0wNyEc+A8cSPa5oSi9EmIOtYAserDnC
         XHOt7ohedZKxD69Ovf9aLjY39pxmvtWoIyO6Houy4KDKIEtnX1m03Tik7P3SK391E2LC
         +HLOSPWxSY+rvc/IutwxiUtUQJfIFsmj4obf3i05QjnBx3lrIsdskGdK58zLw9lu2C5k
         gS8a6Rce/Q6+RbshiAQFpSOTqnB1bQRJj/seHmA2aioigU9VJ40tI97UF2zRqTB+1o23
         NVeg==
X-Forwarded-Encrypted: i=1; AKwUvBw706oJKSB/Wgpmhrhdbv2T9ah6oB4g5h/6ix52ZlfGBZy5gDqikYo95K3rDr0wTnLxEZO20lNtPebAIhnhCxw6@lists.infradead.org
X-Gm-Message-State: AFuF++naGIcgaHpwuNKv2WsFfqIhOt7Wwu0SyYzCYRV6dkAQnaebKPDr
	/RDim+SY3PdOfnl9B9k8MyetNEXckuYgdrTZ5JXDw9ga2dIF/+m05c0SaQXkVQROClwk0+mGwaw
	qufVTFtQ5AbPfmCx2hPxb3JmlFo7Tyfu4Md+NZJHpHdKGVCUs+oDICp5U4KRWz5Qz4YVs7InyY4
	QSHLDvBhGvow==
X-Gm-Gg: AYBFou35DNHIfgEH5iDtL2ud8HQXLZurwmKHRQPsdCaqKIi93y1sKVtWH/O1ILZdJWe
	bkcrhcn77GjXa9z8G0k15I2WzUCWbjHNkxU3HJYE9qcKQ/mMh8cmh15QjqBy3LCCiGqrOgdPNBl
	gUIAoBz9ijwJm7SGrThu2D5uyViNIkE/2/UiQXWv6rVzCxGQ/ZXENsewpyLC9ce5z4QYOcGiWqa
	19vhNi615UXpHTL3LJaXgtvi86bSbcflOrtjq27qX4KT0QbAnJ1mcLNtWr25EseaaTPJF7P0Lne
	CcTR7It4vtfvWfUzoMt9xHiLDkHD85MaoB+Y4QmuYD9cvfSgnjz6Sk59YQ58v8eLJ24ZGn9z0j9
	o9DgxYpwMf9XDZQ==
X-Received: by 2002:a05:620a:6891:b0:93b:d7a3:45d7 with SMTP id af79cd13be357-93bf57b75afmr544587285a.64.1789909226342;
        Sun, 20 Sep 2026 06:00:26 -0700 (PDT)
X-Received: by 2002:a05:620a:6891:b0:93b:d7a3:45d7 with SMTP id af79cd13be357-93bf57b75afmr544577285a.64.1789909225736;
        Sun, 20 Sep 2026 06:00:25 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcda2140bsm147988155e9.1.2026.09.20.06.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 06:00:23 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 15:00:02 +0200
Subject: [PATCH net] net: stmmac: propagate PTP addend and system time
 programming errors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-stmmac-ptp-added-systime-error-v1-1-8ac9e7a3fce2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NMQrDMAxA0asEzRW4ghqSq4QOri23GuwYyYSUk
 LvXdHzL/ycYq7DBMp2gvIvJVgfutwniJ9Q3o6RhIEfezeTQeikhYusNQ0qc0L7WpTCy6qb4ivP
 De/KUKcOINOUsx3+wQuUOz+v6AR3RqGN1AAAA
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
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=H6JOUOYi c=1 sm=1 tr=0 ts=6aafd8ec cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=9VuKQwgGOwxQ2f590fkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDE4OSBTYWx0ZWRfX0m4LuZQQg5KJ
 O001s0Ri4Mcwi3+a7ioClDGHatO45f/3JHfzbo+IB7PTeSkUXgiyK1vMAgU6QZovBrtmJrC8fcN
 ocur+MXmNvjlDbSmZ+AU6wHB/ZqgNs0DySYJTHLgHmW7yKGwK6/NUODdXjahM+EfNWINh2Goii2
 aiyYCA6DP9l0dtKNMtzmEK5AyZ4DRNEs9r7p9MQM2IIfsItn8n36IGWSIs7qDTGarpTdu+Er2AW
 iMNkIgvzIKmRFszZ3Pgm1VLylgjpwPQU+epyZ/JNl3VP1gommr9By7+F3c9HswfXNJhxBGMHovn
 yo6nd3vtIQTxA4GvurdZDMJ7vJM6j/hkhAEHjgGusKHYX4Yuk0eD2nIDWZ9aDgeBClO5bYvYKAg
 bJ+lVd/eSUN7cPp15/bMiqFnolblFwSHWgRV7IxL+DqyGYiTtKE4uPRKoMj38O/u5A041haBVI5
 UQn8AMbxU89qIyOVItQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDE4OSBTYWx0ZWRfX2xmk3S6NaQQt
 DupetvDcNWzHs1lpETTn/tbpUhh+BCcZTtqH1QiZCB8x8EnE+92zrIHv9+pyDZW7a+zuELXI9G2
 g35NX6A1SPkwFF+IXKn++Y0SNhASlkE=
X-Proofpoint-ORIG-GUID: p2A3WjRU_--YrCxi-kRWeFyIhKShnrZf
X-Proofpoint-GUID: p2A3WjRU_--YrCxi-kRWeFyIhKShnrZf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200189
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_060029_844814_E9F6885E 
X-CRM114-Status: GOOD (  19.91  )
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
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 89 ++++++++++++++++++-----
 1 file changed, 69 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 1fb5f804ea23..52587ecb1a54 100644
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
-	u32 sec_inc = 0;
+	u32 sec_inc;
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
@@ -7693,18 +7737,23 @@ static int stmmac_dl_ts_coarse_set(struct devlink *dl, u32 id,
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
base-commit: 1e24c4f2ee44be0eee94092b5d13cbdb4bdf0d60
change-id: 20260920-stmmac-ptp-added-systime-error-bc9566262f2f

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


