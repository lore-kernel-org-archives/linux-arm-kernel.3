Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C945CC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 11:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hnZ77uAGNkXZwL38YlAOhFw5azQdwBgsjPnqcAPbxdA=; b=yeu/3jNS/Zagrtqurure5o/6Rk
	YWQdSZQ88j0Fy9kQHx77YWWSovOgHFX2/p1r6luJiiFyf8Fbk4Dt5BzKw5dPE4gMbV3gIES1Vw3J6
	C6+bGPXs2Q2h2ZzufWcRkxzg8EYYwad6p4AeSN5lyHyv2mseOHSaN9Om/l7TxwCof06JVk3FRruxT
	Kl5bllbTGXdLeiPX1v6weB+G7dvG5HBWlqWUNnrMqhjRSV0xWaa5QJBtpZ5J3j8r7Ki6rpknv0zY6
	aI8oVo5J1e0JgY0ug60Z0mY0jh89vJGRAIsbNq6R5/cY+cG2qR2iQhUDtdlJ/xo8cJikmzIj7bCNf
	anUrNxAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XsT-00000006iY9-2OfE;
	Mon, 07 Sep 2026 11:51:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XsR-00000006iXQ-0rm2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 11:51:08 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687Amrdc3872679
	for <linux-arm-kernel@lists.infradead.org>; Mon, 7 Sep 2026 11:51:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hnZ77uAGNkXZwL38YlAOhF
	w5azQdwBgsjPnqcAPbxdA=; b=QusFfYUSw+/4Pxv7ltfpDAIbTXM8YJfSkJhjj1
	mLfdf6bbvzll3xLVKO50+0u1O/bpwWFOhyqNjnJ3sjouJxiN35DA9gFxPc0vdM32
	vzapDgvFOp6h4zp7rbWOGGoFOc8vCopTpWdmLDWEyyOlXy5lyBC+tHnPzGYtpwaq
	p57o0KSfJqibgoY9TJx1rGPQxoYpvGHIz/g4Z24GXzCuG4OvhpOzyO+HlBMtOYKx
	oWUBmgI/Scsu3d+Ocq6L+uvQbnVmjBKJdjMJBH9S0XmxuUVLZmsItRSYsnPLudSY
	TYAiMeKqJovSyYCGGRpwgEiwNCaYFQEPDXjoP7Df+rpKuuxg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghnmj1v0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 11:51:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9394ad7f64aso572502485a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 04:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788781865; x=1789386665; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hnZ77uAGNkXZwL38YlAOhFw5azQdwBgsjPnqcAPbxdA=;
        b=BWBvWfUavim4q2VH/r3uMnTicIT2XXeO1GJHZgw1IkP9kddpTvxILa0pRRm9iij8Y1
         5ZnQIpVwJAjyn5AUHycV/NCwLBNsWehE+yb+KNAyhlIVt5ivXn90iOywTd6VM0fdp1CR
         st8XaEjxHmFnDTHvOwT7Oltjam5WFj+V7KRlaU1WwL+4gxksx4upozZE5DbRRipcGCMy
         fj2/G7sCvqVp8tOfi3GJF2FfxF2alpE3ZC3OWL80ciqj/BtmkguRqUZsqQAUWFiD4NfD
         9U95hel9lT1gqTvMAo3IsgdThCPIX1ImX1VUZjBXVeswaAcgiO3mKMWPlOAeBZSpAX1y
         FlCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781865; x=1789386665;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hnZ77uAGNkXZwL38YlAOhFw5azQdwBgsjPnqcAPbxdA=;
        b=C13S+/gc2XahzeiMzq5h3iI3eD1siI9kXJpn///Prw0UB7N7EpwtATzFBJwFdKoBZ5
         MO+q0+3TjKYrNmVIx8NR+kOCSzyobpWlsWNL3gAUg2VG0Yx3qA5do8JGqF4wW29+Gg6n
         PLjd4ufN50VmOQj1caGECs8bYd4Fe9CHiq+WPAB30hxQIMmpRJsXeWiFIt2Lc8O0BTiV
         cGRsGhVak74pGAAW+iPp//5U6gQzQIFl8F2nHDZgdldZKY11dXioRxglfshDKgDQ8aL0
         mCBdkXMeRebrYL7y1k1/FF4iEooaAfpluyk8WrtMz+ZK7LCCh9I5REkoQN5I1+5GB7Tb
         vdqA==
X-Forwarded-Encrypted: i=1; AKwUvByu65HSdO6KqCDZTYlRB3Xb+kAg9QYiafskNb+VqbeHwlbuouDkbtw03BrrW0p1wJn59n/agSe04Ru0/vO0Rg99@lists.infradead.org
X-Gm-Message-State: AFuF++kM7BI5R2r2MrrT2/W4qQq0jf7Dqprh26ROyrHWECESBhwCCOVy
	uF0G8qoT0VoKokCJ4BEA8UP5zkTuYWAna57ylIFVXWmQaEGRe5VZtvR6pnrVpIZxJMjGpWYIBpf
	Ur6Kp+0CQCkjAHPkBCLCTT/Fx6RfMp2l2slsFEZQWwVCeXjOiTBYMEflcJnoCMJkAOseIufiycL
	Y6xA==
X-Gm-Gg: AYBFou1sZGKngmJ+A29fuyg1XPFwrKIWSeylAnYeWlVMJLT+382FLaL5XfNhydnz2sE
	8/Ov6VKjtwcYGYuGDPyqn8FVHzcJ74oCZdFV8aR2UWzCr0TuRmGyywitwB63Kx99rhTj5MYJwKf
	K7sVOpBwKhPX0TBnMO1lBqZgVDk88Mzq79dZw1Ut4DaIyyQuItZcTgX2epnyHVblRF2xqZL4UE0
	IP83W5lCG4EUdJLpThjPWOiN+2AY1KXtAioXZaElIE6bWKDAB2apdiD+SsD5DOJsYFZIr7ESxga
	S71tFWyK4jfG/AHrEBwP4cURyx8G5D5bKmVXgtc6I0TtSsxxCxpB0Is/GCFohCkO8xH8TnyFDra
	mLXcX+R0xySWUbw==
X-Received: by 2002:a05:620a:4686:b0:939:9d8f:cb50 with SMTP id af79cd13be357-9399d8fcc8dmr1109868785a.44.1788781865373;
        Mon, 07 Sep 2026 04:51:05 -0700 (PDT)
X-Received: by 2002:a05:620a:4686:b0:939:9d8f:cb50 with SMTP id af79cd13be357-9399d8fcc8dmr1109862985a.44.1788781864834;
        Mon, 07 Sep 2026 04:51:04 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4859207c28fsm21589973f8f.5.2026.09.07.04.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:51:03 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 13:50:46 +0200
Subject: [PATCH net v2] net: stmmac: propagate PTP init failures in
 __stmmac_open() and stmmac_resume()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-stmmac-ptp-error-propagate-v2-1-4a2e8e41e860@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBBFr0Jm7ZC2EhRX3sOwKGWAJpbWaSUa0
 rvbcAI3P3n/J+/vEIktRbhVOzBtNlq/FlCnCsyi15nQjoVBCdWKTjQYk3PaYEgBidkzBvZBzzo
 RtkbI5jI0hlQHRRCYJvs55A9YKUFfysXG5Pl7HG7ymP5xbxIlXsUk5CDOo5703cdYv976abxzd
 Qnoc84/oHsD79AAAAA=
X-Change-ID: 20260904-stmmac-ptp-error-propagate-6c0147b4ce29
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Rayagond Kokatanur <rayagond@vayavyalabs.com>,
        Thierry Reding <treding@nvidia.com>,
        Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEzMCBTYWx0ZWRfX25OrUPtkg9wS
 ha5+gdwBCjJ7/0fRtY5p9h5ViUJX735dNMHirr8XpxmtWDIA5kHcAC+WQPkyhW6JeblCK0VVFRX
 QAkzCE2KFuF3JdPJfdoRphtUhihQQR6hWJjxsuhST5ySUlD4TqXIGg0WRzTBC8E60Yk62pihSY4
 GnVB8nUUik+WJra8Z36AG3cxFfz57+AnAAei7rIxjo1GHEOMey1pnhKlxVsbh0DZRm2xK1OZ9+Z
 FSb4dIYDgG29taNJoQ+kwYfPAnAZhROSr9854u8aVRFMIaoLDUQOkmgX99RvXVMH7paFK4TQkcI
 rd8FMS2AE5H0JfQGaHwVhhBkEa2FlTZfxKT94BOJeGY6tpdYp0Ovt6lYftsPxdcI7qjdV/PVG6v
 5XtfbhSBy/1wZf/8lrMf9ox+dIjc7Sq90REGqBMSZMNq8ptKky/kEaXxJOtIgx5SkQ2oQ53m671
 rUIqyvluM8VeBqXGT+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEzMCBTYWx0ZWRfX3R8Lr4KhtAkb
 rfw5Sdr1iR6oN0EfJ+aJmTLEb1EUaIbJYB1WBn5rTed15CEtu5vNYfTWT2wygqj/LvU4usnC/dD
 AAJVsRul+pTFeyDjN2gkQvJuUEiVoYo=
X-Proofpoint-ORIG-GUID: ZhkxOqLHz6m0cTJOp7PZOXf781B1Ysyw
X-Proofpoint-GUID: ZhkxOqLHz6m0cTJOp7PZOXf781B1Ysyw
X-Authority-Analysis: v=2.4 cv=LZYMLDfi c=1 sm=1 tr=0 ts=6a9ea52a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5UFYL5-E9tWFkZEryMcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_045107_263562_857C698B 
X-CRM114-Status: GOOD (  26.92  )
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

stmmac_setup_ptp() returns void and swallows both PTP setup errors:
the PTP reference clock enable and stmmac_init_timestamping()
failures are logged but never propagated. When they fail, the MAC
system time counter is left in its post-reset, non-running state,
while the driver keeps operating as if timestamping were up.
This matters for TAPRIO/EST qdisc offloading, which derives the EST
base time from the hardware timestamp counter: arming the gate list
against a non-advancing time base would leave the schedule permanently
stuck.

Make stmmac_setup_ptp() return an error code and propagate the
failure in __stmmac_open() and stmmac_resume(), stopping the DMA
engines when PTP setup fails.

Extend the same error propagation to the timestamping counter
initialisation: stmmac_update_subsecond_increment() and
stmmac_init_tstamp_counter() now return the addend and system time
programming errors instead of discarding them, so a counter that
cannot be configured is reported as a failure rather than silently
left non-running.

While at it, factor the timestamping availability check into a
stmmac_check_timestamp_cap() helper that requires both the hardware
timestamping capability and a valid PTP reference clock rate. This
keeps the interface operational on platforms with PTP-capable
silicon but an unconfigured PTP clock, where timestamping cannot be
enabled: those are treated as PTP-less rather than failing to open
or resume. Apply the same helper to the hwtstamp get/set paths so
they consistently report -EOPNOTSUPP when timestamping is not usable.

Fixes: 92ba6888510c ("stmmac: add the support for PTP hw clock driver")
Fixes: 0ad2be79f254 ("net: stmmac: Balance PTP reference clock enable/disable")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
Changes in v2:
- Check clk_ptp_rate value in stmmac_check_timestamp_cap().
- Return error code in stmmac_update_subsecond_increment() and
  stmmac_init_tstamp_counter().
- Rely on stmmac_check_timestamp_cap() in stmmac_hwtstamp_set() and
  stmmac_hwtstamp_get().
- Link to v1: https://lore.kernel.org/r/20260904-stmmac-ptp-error-propagate-v1-1-80f01b03dafa@oss.qualcomm.com
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 96 +++++++++++++++--------
 1 file changed, 64 insertions(+), 32 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 07a6fab6460e..99d4fbccc300 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -601,7 +601,7 @@ static void stmmac_get_rx_hwtstamp(struct stmmac_priv *priv, struct dma_desc *p,
 	}
 }
 
-static void stmmac_update_subsecond_increment(struct stmmac_priv *priv)
+static int stmmac_update_subsecond_increment(struct stmmac_priv *priv)
 {
 	bool xmac = dwmac_is_xmac(priv->plat->core_type);
 	u32 sec_inc = 0;
@@ -625,7 +625,18 @@ static void stmmac_update_subsecond_increment(struct stmmac_priv *priv)
 	 */
 	temp = (u64)(temp << 32);
 	priv->default_addend = div_u64(temp, priv->plat->clk_ptp_rate);
-	stmmac_config_addend(priv, priv->ptpaddr, priv->default_addend);
+	return stmmac_config_addend(priv, priv->ptpaddr, priv->default_addend);
+}
+
+static bool stmmac_check_timestamp_cap(struct stmmac_priv *priv)
+{
+	if (!priv->dma_cap.time_stamp && !priv->dma_cap.atime_stamp)
+		return false;
+
+	if (!priv->plat->clk_ptp_rate)
+		return false;
+
+	return true;
 }
 
 /**
@@ -653,7 +664,7 @@ static int stmmac_hwtstamp_set(struct net_device *dev,
 	u32 ts_master_en = 0;
 	u32 ts_event_en = 0;
 
-	if (!(priv->dma_cap.time_stamp || priv->adv_ts)) {
+	if (!stmmac_check_timestamp_cap(priv)) {
 		NL_SET_ERR_MSG_MOD(extack, "No support for HW time stamping");
 		priv->hwts_tx_en = 0;
 		priv->hwts_rx_en = 0;
@@ -843,7 +854,7 @@ static int stmmac_hwtstamp_get(struct net_device *dev,
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 
-	if (!(priv->dma_cap.time_stamp || priv->dma_cap.atime_stamp))
+	if (!stmmac_check_timestamp_cap(priv))
 		return -EOPNOTSUPP;
 
 	*config = priv->tstamp_config;
@@ -865,24 +876,21 @@ static int stmmac_init_tstamp_counter(struct stmmac_priv *priv,
 				      u32 systime_flags)
 {
 	struct timespec64 now;
-
-	if (!priv->plat->clk_ptp_rate) {
-		netdev_err(priv->dev, "Invalid PTP clock rate");
-		return -EINVAL;
-	}
+	int ret;
 
 	stmmac_config_hw_tstamping(priv, priv->ptpaddr, systime_flags);
 	priv->systime_flags = systime_flags;
 
-	stmmac_update_subsecond_increment(priv);
+	ret = stmmac_update_subsecond_increment(priv);
+	if (ret)
+		return ret;
 
 	/* initialize system time */
 	ktime_get_real_ts64(&now);
 
 	/* lower 32 bits of tv_sec are safe until y2106 */
-	stmmac_init_systime(priv, priv->ptpaddr, (u32)now.tv_sec, now.tv_nsec);
-
-	return 0;
+	return stmmac_init_systime(priv, priv->ptpaddr, (u32)now.tv_sec,
+				   now.tv_nsec);
 }
 
 /**
@@ -900,11 +908,6 @@ static int stmmac_init_timestamping(struct stmmac_priv *priv)
 	if (priv->plat->ptp_clk_freq_config)
 		priv->plat->ptp_clk_freq_config(priv);
 
-	if (!(priv->dma_cap.time_stamp || priv->dma_cap.atime_stamp)) {
-		netdev_info(priv->dev, "PTP not supported by HW\n");
-		return -EOPNOTSUPP;
-	}
-
 	ret = stmmac_init_tstamp_counter(priv, STMMAC_HWTS_ACTIVE |
 					       PTP_TCR_TSCFUPDT);
 	if (ret) {
@@ -937,22 +940,39 @@ static int stmmac_init_timestamping(struct stmmac_priv *priv)
 	return 0;
 }
 
-static void stmmac_setup_ptp(struct stmmac_priv *priv)
+static int stmmac_setup_ptp(struct stmmac_priv *priv)
 {
 	int ret;
 
+	if (!stmmac_check_timestamp_cap(priv)) {
+		netdev_info(priv->dev, "PTP not supported\n");
+		return 0;
+	}
+
 	ret = clk_prepare_enable(priv->plat->clk_ptp_ref);
-	if (ret < 0)
+	if (ret < 0) {
 		netdev_warn(priv->dev,
 			    "failed to enable PTP reference clock: %pe\n",
 			    ERR_PTR(ret));
+		return ret;
+	}
 
-	if (stmmac_init_timestamping(priv) == 0)
-		stmmac_ptp_register(priv);
+	ret = stmmac_init_timestamping(priv);
+	if (ret) {
+		clk_disable_unprepare(priv->plat->clk_ptp_ref);
+		return ret;
+	}
+
+	stmmac_ptp_register(priv);
+
+	return 0;
 }
 
 static void stmmac_release_ptp(struct stmmac_priv *priv)
 {
+	if (!stmmac_check_timestamp_cap(priv))
+		return;
+
 	stmmac_ptp_unregister(priv);
 	clk_disable_unprepare(priv->plat->clk_ptp_ref);
 }
@@ -4161,10 +4181,12 @@ static int __stmmac_open(struct net_device *dev,
 	ret = stmmac_hw_setup(dev);
 	if (ret < 0) {
 		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
-		goto init_error;
+		return ret;
 	}
 
-	stmmac_setup_ptp(priv);
+	ret = stmmac_setup_ptp(priv);
+	if (ret)
+		goto ptp_error;
 
 	stmmac_init_coalesce(priv);
 
@@ -4185,13 +4207,13 @@ static int __stmmac_open(struct net_device *dev,
 irq_error:
 	phylink_stop(priv->phylink);
 
-	stmmac_stop_all_dma(priv);
-
 	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
 		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
 
 	stmmac_release_ptp(priv);
-init_error:
+ptp_error:
+	stmmac_stop_all_dma(priv);
+
 	return ret;
 }
 
@@ -8350,13 +8372,14 @@ int stmmac_resume(struct device *dev)
 	ret = stmmac_hw_setup(ndev);
 	if (ret < 0) {
 		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
-		stmmac_legacy_serdes_power_down(priv);
-		mutex_unlock(&priv->lock);
-		rtnl_unlock();
-		return ret;
+		goto error_unlock;
 	}
 
-	stmmac_init_timestamping(priv);
+	if (stmmac_check_timestamp_cap(priv)) {
+		ret = stmmac_init_timestamping(priv);
+		if (ret)
+			goto error_stop_dma;
+	}
 
 	stmmac_init_coalesce(priv);
 	phylink_rx_clk_stop_block(priv->phylink);
@@ -8380,6 +8403,15 @@ int stmmac_resume(struct device *dev)
 	netif_device_attach(ndev);
 
 	return 0;
+
+error_stop_dma:
+	stmmac_stop_all_dma(priv);
+error_unlock:
+	stmmac_legacy_serdes_power_down(priv);
+	mutex_unlock(&priv->lock);
+	rtnl_unlock();
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(stmmac_resume);
 

---
base-commit: 7a036b5f83726ad5ea310fafae6cb7bb4c92072e
change-id: 20260904-stmmac-ptp-error-propagate-6c0147b4ce29

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


