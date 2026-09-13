Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A7AC88E56
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 08:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M95Bm5VFm4God59VQwDASLqUlPy5RyXv405harasprE=; b=asIoBW3vFGf/jQu5C/ZFpUe2ab
	Z5AEjkPe4/3zxV3DgxAzgyWeFeAxUkq7K9TxYl4AKZx+4m8QzuAnYpnFWMpvUdIdTGR2byY/5tF/U
	EyqFCTvpIm44cmex9PRNKu72GheNgQZdKtZOW2CUqDW77Zwp1bMRmQwew2l4JCxaEkEBC5kV7zPsu
	WfML2HQ7jjR/hQhyWTaXGqxY8Sz1a221CEUV36ZDRQg/g3O941O5A4fwOlqV7EjFqPgizB6g/ygul
	oUla/1noZ34opEdb6+c7SGweTJ+S/lNis2J0ExV1bqCZDLT4MoEIaTwJzbeZuFyKx2dzv/w4Uv/4E
	AOqDDFLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5faU-00000001W0t-1yGd;
	Sun, 13 Sep 2026 08:29:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5faR-00000001W0X-1VPk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 08:29:20 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68D7U1jT1324925
	for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 08:29:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=M95Bm5VFm4God59VQwDASL
	qUlPy5RyXv405harasprE=; b=niS2aWZT777KmIy+W3ThkU3Q1OLLipHKVIX6ew
	odA3n4LbZsYNy1pGkefoEXxehVfWPWbAXsI+CRtmcNsoF0aAeIN6QeV1970ttzJd
	BJ+kxU+VChiEH97Cz0j0kqsw/qTS+2EPrsXc9Rmwfhvx/whJZAVyVP373h3B4d7G
	FRiS0wS1k7RQl/ppMiqozM0bG7kaVX1IrsJTkJHmFLjB1cOmuOEq7F+2U9ZteZbg
	PO77yokfFH/uPOrmjY34qd8BokgtmYzeFJu2K0aTyMqD7qa4/ei0PSlE3mVJitOn
	mhJzU6jZ0iBstFC7A2fKDp9/yV6ZTMynEIHNV2ukMwfafq0A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cavag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 08:29:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a05d645acso234460585a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 01:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789288157; x=1789892957; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=M95Bm5VFm4God59VQwDASLqUlPy5RyXv405harasprE=;
        b=fZR5hKjCM8dxJ/rh96AB7M0qJo3N6eFljY9XJDmD163lUF6UYqaFDLztkWL9PNK+hb
         WLQxf7HBY+yLfaEGBVMYzWtKnjuKECqcjEj52Igzk/iEGAb2ueCquL9Y9rjg4jPe6j6b
         0a6gh3Pc8xZ+qlN8/5g4s0heMdlThzGjXF7EOJeijwWYBwGgnbbvVXh47vbSBmRyRSBL
         Z0ffhMeK23WQOxtcCAcSWUKT8Eo48F1MPgb5bU61IqEBdH1Z3AryjLbbdvv6UFPAMHJN
         46UW7+NkaaeK7GHUCUmSHFZcOPN/zB0wzm8uBxgpxzQC8Oam7ZALlg6pC/QwwLrHdYM5
         ppSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789288157; x=1789892957;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=M95Bm5VFm4God59VQwDASLqUlPy5RyXv405harasprE=;
        b=C30jxLLqqhJ4W8TDkWWxdIY5p/c13OOqHii783uSliy+J7nuLwDVE/5W25SJl5gYEw
         8kdvIKK/k2Fo7pvIYSOXQpe4xjIBqMLcH8uq1WOXNp5OoYAiNSuKlmIPjSipyWzLit/L
         xegEtT8abzD+V7P8R0+eO0ZHgCsa8i130z2AYGhLpUh1mxppgIk0UDvLHMJxLCZlHA0Y
         7s1ZvI4z4WZltRf0zobJYd0BVKUAuvFuA95bG4aJLNKZuG/11P9pS0glmlTTdAmzvGbk
         fciv3+XOeIdN2dnY75VFldAjy0KKYIr93XJexGVIcNrtYLQfSHLpDuR63afqEd4QM+CK
         sq/g==
X-Forwarded-Encrypted: i=1; AKwUvBwSeXUvrVKVJapYB/Sa0SjJd+Q1ypnfav0o7MzOrLKquaHQZNCl3zc4UvujkHrW1XBJuxeVL4x3oNCH4sxaCle9@lists.infradead.org
X-Gm-Message-State: AFuF++mo6y9i484dWBe4s9ECNfPD1WOEG9j4xWWjkAkuBg7HgLrpho0a
	fEpymwmcQiRRkKH/kYxyq6FmPHIPUEvMd0/rfSBJlHgPV5R3g0i7DAmtkpsecUGd0yjiTI+5Uey
	5j7ltKvM6c85s8lcWHWpXof5BOUvGrqFg/pB5yqBI1VGYBuV+HKT4EJSxDTOAZrKARqtRj5g//n
	m6/g==
X-Gm-Gg: AYBFou2sLLG6KR/mSm1JHzpfgByWdu56E4wgBZUCPyiTpI0i8lFvBzxuR/Ne/ePvj9d
	h7YFpajiFoWBJxmf9vAGQ4SAaPeW5O6P0pYtgUe41VSCWYV6gm0hREqil4D/CIK2c0IHOfQISfo
	cR9JqKUJchmJr2vU78PL/JXVkwYwR3fRhziSk8npjvQAdlk9MFXUE5cZbykoSj1Fu4Tw9Of4vi5
	Ywmirn/M7qCqULmDBCD7YoZhJUe2eEQnPOS4EviWjtdNOt8K62qM1SuheaYjsNGl+fOL+lFYqzv
	f2VJE7wwitr3SoHEdD2o/abe97BWS5xi52099wGDTmypJDBnCX2VHgE4B4QNc20VDIOetkLX28W
	HLfCiHxMfgiU4KA==
X-Received: by 2002:a05:620a:711a:b0:939:d38:3ab8 with SMTP id af79cd13be357-939ea11353cmr1624308685a.12.1789288157171;
        Sun, 13 Sep 2026 01:29:17 -0700 (PDT)
X-Received: by 2002:a05:620a:711a:b0:939:d38:3ab8 with SMTP id af79cd13be357-939ea11353cmr1624306685a.12.1789288156575;
        Sun, 13 Sep 2026 01:29:16 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6fe9d3e3sm68237815e9.0.2026.09.13.01.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 01:29:15 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 10:29:00 +0200
Subject: [PATCH net v4] net: stmmac: propagate PTP init failures in
 __stmmac_open() and stmmac_resume()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-stmmac-ptp-error-propagate-v4-1-a947aceac928@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NQQ7CIBAF0Ks0rKUZKCJ15T2MC0qnlcQWBGw0p
 ncXu3KhjZtJ/v/JmyeJGCxGsi+eJOBko3VjDmJTEHPWY4/UtjkTDlxCDYLGNAzaUJ88xRBcoD4
 4r3udkEoDTOwaYZDXJAM+YGfvC34kIyZyyuXZxuTCY3k4sWX6x54YZVRBB6yBqtWdPrgYy+tNX
 4wbhjKfRZ/4p7hbFXkWheaoUDBUEn6I1YfIYFWs3mJXKYmKb2Ujv4jzPL8AnffahHQBAAA=
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
        Russell King <linux@armlinux.org.uk>,
        Joakim Zhang <qiangqing.zhang@nxp.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=e+mT2qp/ c=1 sm=1 tr=0 ts=6aa65ede cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=P-IC7800AAAA:8 a=ajOIpsWwYqLBSbH5xuYA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDExOSBTYWx0ZWRfX1C+3yf8sqNX/
 70D39FOijxDqZ7BzMocGq3nYeQ/TUn8eo3OGXp6g7qTBzGKEH1tUzY1e4GHrtXOUkwpqKHQW/ev
 dlKBqCicEwZ9fbNWkYryi6R5rhA4S4c=
X-Proofpoint-ORIG-GUID: Pia8fcScfovigePhnAxDcW_OCDgt3xSM
X-Proofpoint-GUID: Pia8fcScfovigePhnAxDcW_OCDgt3xSM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDExOSBTYWx0ZWRfXzVTzgLQhjpys
 giLU0tpFdXXezKx7RiSS25qGMECWL6/G4cgclBVDJHptkmeTou7NJHF+jPNiaHJX2xBa3olNYFi
 axWTu40M+P+thHHPYdLexCDHtXM8dUwlmbRxieHt9dxStiaPeY0fJxIHjz9Bxch7g9qH5QdZLwj
 KGVYtxOZ1dHMVqlnqV9H7kcd8Kvh/u99I0LZL9ItIiPRrpFzmF0s7GF0PmB91IuAZF7W4/JXhiy
 0L7QEq58l5Y0wqEf1YPD8BaDEMjGGyNGO2XhU2s8mYmo/bWcXWsJT1ylmI+s1lcpOcgVADBGaLg
 +manCuj0+HmbC603Yb6TJx/H0I6l0l+pbTYoyUDcJAqdZquFOblIMVXZQ5zlwhmmemCfJf6ApNm
 vfVUyLnEZ/GJBrqHCunI55OE6kWcRz+fNE+HNaD1cYI6Ck6+LCDhEwoqnZjM3ug8hvJKJax/x80
 vnYdXhPPgyqlHeYRaWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_03,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_012919_532242_9D175080 
X-CRM114-Status: GOOD (  27.92  )
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

While at it, factor the timestamping availability check into a
stmmac_check_timestamp_cap() helper that requires both the hardware
timestamping capability and a valid PTP reference clock rate. This
keeps the interface operational on platforms with PTP-capable
silicon but an unconfigured PTP clock, where timestamping cannot be
enabled: those are treated as PTP-less rather than failing to open
or resume. Apply the helper to the hwtstamp get path and the
ethtool ts_info path, and keep the timestamping gate on the set path
(now also requiring a valid PTP reference clock rate), so all of
them consistently report -EOPNOTSUPP when timestamping is not usable.

Gate the PTP reference clock enable/disable in the platform noirq
suspend/resume callbacks on priv->ptp_enabled, keeping the clock
reference balanced against the new early return in
stmmac_release_ptp().

Fixes: 92ba6888510c ("stmmac: add the support for PTP hw clock driver")
Fixes: 276aae377206 ("net: stmmac: fix system hang caused by eee_ctrl_timer during suspend/resume")
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
Changes in v4:
- Drop stmmac_restore_subsecond_increment() and
  stmmac_update_subsecond_increment() changes for the moment.
- Add ptp_enabled check in stmmac_pltfr_noirq_suspend() and
  stmmac_pltfr_noirq_resume().
- Link to v3: https://lore.kernel.org/r/20260910-stmmac-ptp-error-propagate-v3-1-4f386e8256b6@oss.qualcomm.com

Changes in v3:
- Rebase on top of net main branch.
- Link to v2: https://lore.kernel.org/r/20260907-stmmac-ptp-error-propagate-v2-1-4a2e8e41e860@oss.qualcomm.com

Changes in v2:
- Check clk_ptp_rate value in stmmac_check_timestamp_cap().
- Return error code in stmmac_update_subsecond_increment() and
  stmmac_init_tstamp_counter().
- Rely on stmmac_check_timestamp_cap() in stmmac_hwtstamp_set() and
  stmmac_hwtstamp_get().
- Link to v1: https://lore.kernel.org/r/20260904-stmmac-ptp-error-propagate-v1-1-80f01b03dafa@oss.qualcomm.com
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       | 13 ++++
 .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c   |  3 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 72 +++++++++++++++-------
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  |  6 +-
 4 files changed, 70 insertions(+), 24 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 7582fca63741..c781cf3441fc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -329,6 +329,8 @@ struct stmmac_priv {
 	struct kernel_hwtstamp_config tstamp_config;
 	struct ptp_clock *ptp_clock;
 	struct ptp_clock_info ptp_clock_ops;
+	bool ptp_enabled;
+
 	unsigned int default_addend;
 	u32 sub_second_inc;
 	u32 systime_flags;
@@ -419,6 +421,17 @@ int stmmac_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 
 struct plat_stmmacenet_data *stmmac_plat_dat_alloc(struct device *dev);
 
+static inline bool stmmac_check_timestamp_cap(struct stmmac_priv *priv)
+{
+	if (!priv->dma_cap.time_stamp && !priv->dma_cap.atime_stamp)
+		return false;
+
+	if (!priv->plat->clk_ptp_rate)
+		return false;
+
+	return true;
+}
+
 static inline bool stmmac_xdp_is_enabled(struct stmmac_priv *priv)
 {
 	return !!priv->xdp_prog;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 154cc0c7623d..7758b854700a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -1007,8 +1007,7 @@ static int stmmac_get_ts_info(struct net_device *dev,
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 
-	if ((priv->dma_cap.time_stamp || priv->dma_cap.atime_stamp)) {
-
+	if (stmmac_check_timestamp_cap(priv)) {
 		info->so_timestamping = SOF_TIMESTAMPING_TX_SOFTWARE |
 					SOF_TIMESTAMPING_TX_HARDWARE |
 					SOF_TIMESTAMPING_RX_HARDWARE |
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 62c3441911e7..9d2c6bf68575 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -653,7 +653,8 @@ static int stmmac_hwtstamp_set(struct net_device *dev,
 	u32 ts_master_en = 0;
 	u32 ts_event_en = 0;
 
-	if (!(priv->dma_cap.time_stamp || priv->adv_ts)) {
+	if (!priv->plat->clk_ptp_rate ||
+	    !(priv->dma_cap.time_stamp || priv->adv_ts)) {
 		NL_SET_ERR_MSG_MOD(extack, "No support for HW time stamping");
 		priv->hwts_tx_en = 0;
 		priv->hwts_rx_en = 0;
@@ -843,7 +844,7 @@ static int stmmac_hwtstamp_get(struct net_device *dev,
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 
-	if (!(priv->dma_cap.time_stamp || priv->dma_cap.atime_stamp))
+	if (!stmmac_check_timestamp_cap(priv))
 		return -EOPNOTSUPP;
 
 	*config = priv->tstamp_config;
@@ -900,11 +901,6 @@ static int stmmac_init_timestamping(struct stmmac_priv *priv)
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
@@ -937,24 +933,43 @@ static int stmmac_init_timestamping(struct stmmac_priv *priv)
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
+	priv->ptp_enabled = true;
+
+	return 0;
 }
 
 static void stmmac_release_ptp(struct stmmac_priv *priv)
 {
+	if (!priv->ptp_enabled)
+		return;
+
 	stmmac_ptp_unregister(priv);
 	clk_disable_unprepare(priv->plat->clk_ptp_ref);
+	priv->ptp_enabled = false;
 }
 
 static void stmmac_legacy_serdes_power_down(struct stmmac_priv *priv)
@@ -4161,10 +4176,12 @@ static int __stmmac_open(struct net_device *dev,
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
 
@@ -4189,7 +4206,10 @@ static int __stmmac_open(struct net_device *dev,
 		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
 
 	stmmac_release_ptp(priv);
-init_error:
+ptp_error:
+	stmmac_stop_all_dma(priv);
+	stmmac_mac_set(priv, priv->ioaddr, false);
+
 	return ret;
 }
 
@@ -7740,8 +7760,7 @@ static int stmmac_register_devlink(struct stmmac_priv *priv)
 	/* For now, what is exposed over devlink is only relevant when
 	 * timestamping is available and we have a valid ptp clock rate
 	 */
-	if (!(priv->dma_cap.time_stamp || priv->dma_cap.atime_stamp) ||
-	    !priv->plat->clk_ptp_rate)
+	if (!stmmac_check_timestamp_cap(priv))
 		return 0;
 
 	priv->devlink = devlink_alloc(&stmmac_devlink_ops, sizeof(*dl_priv),
@@ -8346,13 +8365,14 @@ int stmmac_resume(struct device *dev)
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
+	if (priv->ptp_enabled) {
+		ret = stmmac_init_timestamping(priv);
+		if (ret)
+			goto error_stop_dma;
+	}
 
 	stmmac_init_coalesce(priv);
 	phylink_rx_clk_stop_block(priv->phylink);
@@ -8376,6 +8396,16 @@ int stmmac_resume(struct device *dev)
 	netif_device_attach(ndev);
 
 	return 0;
+
+error_stop_dma:
+	stmmac_stop_all_dma(priv);
+	stmmac_mac_set(priv, priv->ioaddr, false);
+error_unlock:
+	stmmac_legacy_serdes_power_down(priv);
+	mutex_unlock(&priv->lock);
+	rtnl_unlock();
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(stmmac_resume);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 6128ed1bd521..19d481554499 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -959,7 +959,8 @@ static int __maybe_unused stmmac_pltfr_noirq_suspend(struct device *dev)
 
 	if (!priv->wolopts) {
 		/* Disable clock in case of PWM is off */
-		clk_disable_unprepare(priv->plat->clk_ptp_ref);
+		if (priv->ptp_enabled)
+			clk_disable_unprepare(priv->plat->clk_ptp_ref);
 
 		ret = pm_runtime_force_suspend(dev);
 		if (ret)
@@ -984,6 +985,9 @@ static int __maybe_unused stmmac_pltfr_noirq_resume(struct device *dev)
 		if (ret)
 			return ret;
 
+		if (!priv->ptp_enabled)
+			return 0;
+
 		ret = clk_prepare_enable(priv->plat->clk_ptp_ref);
 		if (ret < 0) {
 			netdev_warn(priv->dev,

---
base-commit: 6500e89132d5d510c75e1be443455af87267b40e
change-id: 20260904-stmmac-ptp-error-propagate-6c0147b4ce29

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


