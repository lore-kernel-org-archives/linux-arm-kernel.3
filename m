Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC759CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 13:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uR5lZ/aLpg7JPf2Y9UuxbBRL+jfu0XggxF3MrEIcb/s=; b=VeRLFqxfhaoY9P3rMWqBO7qWWz
	EQoWxvDWidioFCnEGCG4nYREEynLWhbLvDmoA/AftXstltP+fPJeClbCmK37lnJcLPd4L97ieGmHg
	knmW0c2Op5ifRfc9AFL4c/YTnKVqvh9kUaB3PJtx8qc8yZ4hhzzfuCvYe5cKL3Q7zZqpxx0p6WbYd
	cM24L+0gj53DneT5YSBSej8fUSoEBrIMsvB2FqmIPUcj+gd4LMT7cEEnLx/Ce+7E7viZbth6FcuzW
	yMZger4LNTMwuYp/bg/ghn9iiCB7KKN0gAheIYkHw5tn9tdTwfFgBs7aU3GykM/gqrDranEn3Caij
	YyiJFI0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBXbQ-00000003dSt-0TTK;
	Tue, 29 Sep 2026 13:10:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBXbN-00000003dRe-0KqD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 13:10:34 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqgAV350050
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 13:10:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uR5lZ/aLpg7JPf2Y9UuxbB
	RL+jfu0XggxF3MrEIcb/s=; b=bjWvjIptWBAZ3qpYVa7Y9LbPgzauS7hhuuZvbc
	Oi9HpsqU2Deu5XML//HnyYkZ/gQYoN6o/LSHB/ANMj+KOrAUubiGRRJ8ce2B3nUK
	XfiTnwIQe570orxV+b1LgMb2y9aJGyh6PyYQs58upHuoOMj3f8mzK7nD/sgxbZDi
	7XfRNSQaRnhFI97sHLqP+9PNoqk/W9KU+eR1uB/4rpYcwYgGfv1B4sC9nUOSlcJD
	TU8gmCxN6s93ofZvCrUXjoCIpdeZ+dpO/coQlvSxJcBtK5hiZdCoEw5a8lPDgzkA
	JD097sDgON5hAXEOVZBHMypd+XVOczVdodRTUfrWyNaSdRkw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h01vkjxqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 13:10:31 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9829a8b46a7so300776241.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 06:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687431; x=1791292231; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uR5lZ/aLpg7JPf2Y9UuxbBRL+jfu0XggxF3MrEIcb/s=;
        b=h06ykBRGEiXnVK0y7MGJqLvgl9j3EYh5qtsoghCRVNG09Jgu+fD1ehBMBLqzS7Jbp5
         DKeeafAg1pc8R/+RwHElbqVQjmMG1ubKps7hz9FW1PsJCCrodm3F15sHy5Y9hvg35x/m
         yHCxPzMxC/YCIh0+YYwLgXLVdBeXZ9wAN2jMn1YieEVQMjRbyPL0uFUyi31YxbGExZmH
         HRAWf76qLdu3wt1zLojkWNSgKTXysk9JXrBtqNwFp1oVd5KcBXkS4IC2BVv240qdxJiT
         9OsMAe8mqeOPvC2z5+p449dR8zUeceaxDPj1gMd0FYskmMaFULMu3bOZ6wrsAO8xDDn+
         c3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687431; x=1791292231;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uR5lZ/aLpg7JPf2Y9UuxbBRL+jfu0XggxF3MrEIcb/s=;
        b=mfVY7BnP+4d1YAh+Mnl8GcUBxOEaSLBa7Zx63UzSAGEmjAbxuxiRsjawgznBi5T8vg
         EqkTuZMRwhMe6udr/8LTM31Y7Qzj4Yc03AALt5NuiXskGOzPpwunyP2vwIK/0eVNJ0Yi
         4JsyQW/RK80NuolIT7+m5SWHOcIKj2rX83x/liBmZMzqBv4mGKVKLZwp/DRHXkErVD8o
         s48/Kv4rd+ZaSbc+UXqMhTovi9LC7DqxBAX3R+gPSJ9xwRnsmMRLh1xmnhpQgMHOeI9s
         8wmdhXuuaBbz1QxBoZnvKsz7DZSqYMgdgpCZgklwdvi4xe74IAmy425T0IfC04dqS6G8
         GCVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlNIy8ulSMNhfmu8e/bJdpjJtXjyt6+oHahek9hCpF9rDN7W/LCGbIw5cwa5j3FZegVYUqgL+GF8BlVyUCxB5E@lists.infradead.org
X-Gm-Message-State: AFq9FYKdF6u0KHWa+Nh/5N+llElo7CGRi9cPqFph//qSXTe4/zgQ5ARq
	O/pHGm6ktmESi1g4Fzo8vNqqpANd5O2jo+u7qasobV7Ak4iMhg+JHOIAqr14+t6IwoVI79USLf7
	6YJfqfcnFJyGqblaG+oUK6PIx9OG4Ic2jmFfgw6QngAK6gu9ZvVMk4OrdmhIW8tbwZC2XdI02qK
	aJuA==
X-Gm-Gg: AYBFou0w8aJuiMOLtyR8uSn3nx10g6UbAzpMQLoVJoZj2zcDJDAPCnbLyRQHf+oqJ/G
	ojfbUdHxteRH2UuoaeE7bmfGd2jPpEF/s4/oNzBfcyIkjgzDz9X92yjBnSFxyirspYJRfX3eb1F
	GtIP3qgSFiCnzTPY0GpFGaPdPqPPLG76AbOnb9gvxC0+zXMwF2cPfUkBikFcjvA6WOsJ/71kcWQ
	AaND2O6CALcpBdDQg1rKxa+fz1mlBqKMYt4eG30gk1cD7GsgVk5TaBH2iaEbG+vrQpKP873Tcsl
	O5kKMeUOqL8Rg1Pn24wr2F8ULfdVJKGyid4p8wJ24GxHAVNFF5goOLNK2vo0XpBRHEtgHNnwIA5
	qY5tl8MQxqRqSRA==
X-Received: by 2002:a05:6102:390a:b0:7ba:9a91:c50a with SMTP id ada2fe7eead31-7ba9a91c98emr102342137.30.1790687430717;
        Tue, 29 Sep 2026 06:10:30 -0700 (PDT)
X-Received: by 2002:a05:6102:390a:b0:7ba:9a91:c50a with SMTP id ada2fe7eead31-7ba9a91c98emr102321137.30.1790687429921;
        Tue, 29 Sep 2026 06:10:29 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af506fdc1sm3931416f8f.21.2026.09.29.06.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:10:28 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 15:10:11 +0200
Subject: [PATCH net v3] net: stmmac: propagate PTP addend and system time
 programming errors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-stmmac-ptp-added-systime-error-v3-1-ddd6afe936b4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NQQ6CMBAF0KuYrh0Cg1Rw5T2Mi1Km0sRS7FQiI
 dzdhpULE91M8ucn7y+CKVhicdotItBk2fohhXK/E7pXw43AdikLzFHmDebA0TmlYYwjqK6jDnj
 maB0BheADtLqppESJBo1IyBjI2Nc2cBEDRXFNz95y9GHeRqdiq/71pwIKqJVu6KhKownPnjl7P
 NVde+eydLaFCT/Vw08Vk9pSi0q2laml/KKu6/oGNKMYxS4BAAA=
X-Change-ID: 20260920-stmmac-ptp-added-systime-error-bc9566262f2f
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX78CawBVCeFwD
 5MYTNM0jLTBlicL+iEyDvpPPkXuT/plVPUGHE7oQdm08WV8HWntxWze9UpsK2LTHz2gX56/hYWO
 HRyyAXOBPHgynUPqfF6aFrknp9PhSP95kT3gUYAnGad9H881of3nAJlWeEVimhJRajm1lzq8klP
 DTvebLT9k6Pc0XVYsLflHF9cXdO2K7rbUJHE9jd9DN8gxUCr5N+f2yppEtLpAshmatA/VIweyNl
 tmrTlyuACT7SOCq0RRChgoUkIu60nMcvSfutc9Pf4OOJHhNpe9VgS643cMcZosY0BgeoIybn7Uq
 Dp5/+K9s6LAAxoBtMDGBYMwG9iC8WaJlxh+olzAYOXo3k6CTO583Yp4VXccLtwrlYaWDg1QXE3K
 6s+HiuoPtbeh/PQCwN/ZCpr+pa/tNOLqxuBuWYuE7Uu4eN7Do1IbM+BLSWE6BwIhK5NSRypb1Dw
 oCQ9gCXVDst5fpV+NAQ==
X-Proofpoint-GUID: iEp3BB36_VxxKp3DmhT7tGLe_7jzRPCY
X-Authority-Analysis: v=2.4 cv=VcVir1p9 c=1 sm=1 tr=0 ts=6abbb8c7 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=uyVPXY6SzKWq727VUmwA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: iEp3BB36_VxxKp3DmhT7tGLe_7jzRPCY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfXwLCsB8gBVJHN
 zlLDTdCO+xVMvUrstZQ59fIVX8lMghWXi+7KtozuxW2JLCzfHk1ZYOEkwu4icSRi9iHY6jW5lbq
 j7+flt0C06+eplRqUMJ06BWwHhu93Js=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_061033_251491_04515DE3 
X-CRM114-Status: GOOD (  25.09  )
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

The same hooks are also called from the PHC callbacks: settime64 and
adjfine drop the error and report success to clock_settime() and
clock_adjtime(), so a dead PTP reference clock goes unnoticed by
ptp4l/phc2sys.

Return error codes from stmmac_update_subsecond_increment(),
stmmac_init_tstamp_counter(), stmmac_dl_ts_coarse_set() and the
settime64/adjfine callbacks instead of silently returning success. On
failure, roll back the partially applied configuration so the hardware
and the driver bookkeeping stay consistent, and report the reason
through the devlink extack. Also guard against a zero sub-second
increment, which would otherwise divide by zero when computing the
addend.

Reset the persistent timestamping state (hwts_tx_en, hwts_rx_en,
tstamp_config, systime_flags and tsfupdt_coarse) when (re)initializing
timestamping, so a failed init does not leave TX/RX timestamping
enabled on a counter that never started.

Fixes: cc4c9001ce31 ("net: stmmac: Switch stmmac_hwtimestamp to generic HW Interface Helpers")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
Changes in v3:
- Do not run stmmac_config_addend() in
  stmmac_update_subsecond_increment() error path.
- Return error from stmmac_adjust_freq() and stmmac_set_time().
- Reset hw ts configuration in stmmac_init_timestamping().
- Link to v2: https://lore.kernel.org/r/20260924-stmmac-ptp-added-systime-error-v2-1-beb2a6b5f866@oss.qualcomm.com

Changes in v2:
- Initialize sec_inc to 0 in stmmac_restore_subsecond_increment()
  routine.
- Link to v1: https://lore.kernel.org/r/20260920-stmmac-ptp-added-systime-error-v1-1-8ac9e7a3fce2@oss.qualcomm.com
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 106 ++++++++++++++++------
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c  |  10 +-
 2 files changed, 84 insertions(+), 32 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ec62fa7418f4..9741f97fa37a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -601,31 +601,64 @@ static void stmmac_get_rx_hwtstamp(struct stmmac_priv *priv, struct dma_desc *p,
 	}
 }
 
-static void stmmac_update_subsecond_increment(struct stmmac_priv *priv)
+static void stmmac_restore_subsecond_increment(struct stmmac_priv *priv,
+					       u32 default_addend)
 {
 	bool xmac = dwmac_is_xmac(priv->plat->core_type);
 	u32 sec_inc = 0;
-	u64 temp = 0;
 
+	stmmac_config_addend(priv, priv->ptpaddr, default_addend);
 	stmmac_config_hw_tstamping(priv, priv->ptpaddr, priv->systime_flags);
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
+	u64 temp = 0;
+	int ret;
+
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
+	stmmac_config_hw_tstamping(priv, priv->ptpaddr, priv->systime_flags);
+	stmmac_config_sub_second_increment(priv, priv->ptpaddr,
+					   priv->plat->clk_ptp_rate, xmac,
+					   NULL);
+	return ret;
 }
 
 /**
@@ -854,35 +887,42 @@ static int stmmac_hwtstamp_get(struct net_device *dev,
 /**
  * stmmac_init_tstamp_counter - init hardware timestamping counter
  * @priv: driver private structure
- * @systime_flags: timestamping flags
  * Description:
  * Initialize hardware counter for packet timestamping.
  * This is valid as long as the interface is open and not suspended.
  * Will be rerun after resuming from suspend, case in which the timestamping
  * flags updated by stmmac_hwtstamp_set() also need to be restored.
  */
-static int stmmac_init_tstamp_counter(struct stmmac_priv *priv,
-				      u32 systime_flags)
+static int stmmac_init_tstamp_counter(struct stmmac_priv *priv)
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
+	ret = stmmac_update_subsecond_increment(priv, priv->systime_flags);
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
 
 	return 0;
+error:
+	/* Restore previous configuration */
+	stmmac_restore_subsecond_increment(priv, default_addend);
+
+	return ret;
 }
 
 /**
@@ -905,8 +945,14 @@ static int stmmac_init_timestamping(struct stmmac_priv *priv)
 		return -EOPNOTSUPP;
 	}
 
-	ret = stmmac_init_tstamp_counter(priv, STMMAC_HWTS_ACTIVE |
-					       PTP_TCR_TSCFUPDT);
+	/* Reset hw ts configuration */
+	memset(&priv->tstamp_config, 0, sizeof(priv->tstamp_config));
+	priv->systime_flags = STMMAC_HWTS_ACTIVE | PTP_TCR_TSCFUPDT;
+	priv->tsfupdt_coarse = false;
+	priv->hwts_tx_en = 0;
+	priv->hwts_rx_en = 0;
+
+	ret = stmmac_init_tstamp_counter(priv);
 	if (ret) {
 		netdev_warn(priv->dev, "PTP init failed\n");
 		return ret;
@@ -927,10 +973,6 @@ static int stmmac_init_timestamping(struct stmmac_priv *priv)
 		netdev_info(priv->dev,
 			    "IEEE 1588-2008 Advanced Timestamp supported\n");
 
-	memset(&priv->tstamp_config, 0, sizeof(priv->tstamp_config));
-	priv->hwts_tx_en = 0;
-	priv->hwts_rx_en = 0;
-
 	if (priv->plat->flags & STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY)
 		stmmac_hwtstamp_correct_latency(priv, priv);
 
@@ -7711,18 +7753,26 @@ static int stmmac_dl_ts_coarse_set(struct devlink *dl, u32 id,
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
+	if (ret) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "failed to reconfigure PTP adjustment");
+		return ret;
+	}
+
+	priv->tsfupdt_coarse = ctx->val.vbool;
+	priv->systime_flags = systime_flags;
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index 3bfcc9760dce..493c5d81a36b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -28,14 +28,15 @@ static int stmmac_adjust_freq(struct ptp_clock_info *ptp, long scaled_ppm)
 	    container_of(ptp, struct stmmac_priv, ptp_clock_ops);
 	unsigned long flags;
 	u32 addend;
+	int ret;
 
 	addend = adjust_by_scaled_ppm(priv->default_addend, scaled_ppm);
 
 	write_lock_irqsave(&priv->ptp_lock, flags);
-	stmmac_config_addend(priv, priv->ptpaddr, addend);
+	ret = stmmac_config_addend(priv, priv->ptpaddr, addend);
 	write_unlock_irqrestore(&priv->ptp_lock, flags);
 
-	return 0;
+	return ret;
 }
 
 /**
@@ -153,12 +154,13 @@ static int stmmac_set_time(struct ptp_clock_info *ptp,
 	struct stmmac_priv *priv =
 	    container_of(ptp, struct stmmac_priv, ptp_clock_ops);
 	unsigned long flags;
+	int ret;
 
 	write_lock_irqsave(&priv->ptp_lock, flags);
-	stmmac_init_systime(priv, priv->ptpaddr, ts->tv_sec, ts->tv_nsec);
+	ret = stmmac_init_systime(priv, priv->ptpaddr, ts->tv_sec, ts->tv_nsec);
 	write_unlock_irqrestore(&priv->ptp_lock, flags);
 
-	return 0;
+	return ret;
 }
 
 static int stmmac_enable(struct ptp_clock_info *ptp,

---
base-commit: 37e02c42a00be692c06343e11779aadc45f45971
change-id: 20260920-stmmac-ptp-added-systime-error-bc9566262f2f

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


