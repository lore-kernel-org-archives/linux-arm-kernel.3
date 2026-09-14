Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE8AC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 15:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WfeSSIGEMf5/K70d7iHCjKsPLBWa2a40x5/XuD7ShWA=; b=Tqzy0fTaD6cQueRe90fFHCeLYe
	VM9NG/W89XEX6iOWixq5+tX8hlwWS7W5wRQoVzbRnZOGQeaDYhaGSGMJnsg5ySA4Y8kAN28IMlzuG
	3FTZhPQhzbY6SQjHyWQjHYjhgTB7olB+KhYETVcCXer5A2U/LzoL1ze4rDEP1/31piHHBemdz9K1A
	Mov6p/P2hWk5Sf/WBk0f6ERiuOf5MXBqVm0S+zM9vZCsiNmteFkq4d0JGv9JoG6laiM42QRqyv7wd
	qdf8AG+rVKEsVp5QRWCp+Wqr5Fyl8+6BFyG4mv4fQu7Hc+xjxguz/GUiUu9H2HPlPd7JWHoOHhiYL
	Wouruxpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68aG-000000049js-49PN;
	Mon, 14 Sep 2026 15:27:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68aD-000000049ie-345L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 15:27:03 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0cRO511056
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 15:27:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WfeSSIGEMf5/K70d7iHCjK
	sPLBWa2a40x5/XuD7ShWA=; b=gLCzAzr2kq9jO7ZYOIbNv771/R6UdSWd30fMAJ
	b3DSelcmoBTj3NGUrVgZv1MmE1pvByqygVwQ4U4HhYN1u8VhOLB1CL/j19Cq13T0
	M796Klv/AcAQvZjo5kYkIJaKQLZR0bbag9mA1FaEFldzjNE2wEw36OxTFJ4YBcEn
	UCnDMZAZ41B+cKjGZEDUbpTmY19tbFJdlt2V57hoSxjTcuLVqYZeenSlwTomwo0U
	mTWSJgFkixquL7v0y4u9jwKhhZoeVVrIs3AC5c1c3K+0GMV5ERFQWgLwzM6RslzX
	RKz+0Civ/38spjxahafJk8wIqgbWpsFCiL81tXTjoBe2uXKg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpgvtgr1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 15:27:00 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6751db2792dso703475137.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 08:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789399620; x=1790004420; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WfeSSIGEMf5/K70d7iHCjKsPLBWa2a40x5/XuD7ShWA=;
        b=ZN7NVo1Z0GuZ2LmeTnxcGowYnRau1yANCwQ5dROb5q5pDOnJ0xpjRHWfSARWfm3vN+
         hV9gZRGrfiBG85Zrsof/6Bc3oRxRKWBouJYf1VzgW1p0mDQhduvMzy91aWVtE1QSd59M
         OBf2g9duJmc6jUonj7scmCz1Fr2zvdDoXw/PuObjkJ/KCPztNsGtyWL1MiprVfqoeICr
         uhB1BPJY1YKFp6jwW7oPH7jUnVYqeiN/6hVVf/6cadNQO41Gy/tgWGOgpGOGC2EO81g0
         qvqyXT/POhgwRXiQbeXZpP0L0ELOh6ukcXCekbncgS+L7zjhbOV2yLWyOfCFVgIOTTO1
         Itqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399620; x=1790004420;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WfeSSIGEMf5/K70d7iHCjKsPLBWa2a40x5/XuD7ShWA=;
        b=YTLVe6yN3FrqyKP8QVD7nTcL3UVGg0SxWRzXIm33h9Prr5eMTVOl7KyVXf20YHpQsg
         ukbZ69eZOL02Fe+iQIG45DtJOyvVMYXbvWCHp4FcqlgXt7ULXheN+CZxYDc9kMz92YNW
         cH4kSUIUgJ36iX6+/lC13xYhyjks1xyq0FTGbNTo+LnVv5iM49AHmQ/z2yzmQ4U+PX6g
         4Pkc3iNts8Sqk0zg4VizihsOE5ED9Y3a6lCtTdklhE3I0k7o0nsO8Of24Cmr0WJ7Of5h
         c5ISFhLVEW1SpioPaB5Mnh7D7LC1yid4RzW8rwumeeX2NtMqlTsdY8hQjxYo/nKWD/UA
         hyNg==
X-Forwarded-Encrypted: i=1; AKwUvByINNaR1J4pSTB3LbgUnBtoPnf017t7z08znKJ3cWMSmCrfeM6qoUZxWzA+5kQbvL1QTOnZg9LiRZSFvqIWposU@lists.infradead.org
X-Gm-Message-State: AFuF++lNWc/ROKi1dkYE9/LQVAFPYhCD9n+YWhLOiff9dzyxjFqXrWmv
	l+a6BuP0G8EINp3XnNgQgret11v2bq9WPdw/qltU2CIIbqAJAOQRKv4621/CtJf+s/6E03sLHzH
	bsesxjO90xkPkZtPXNw7cII/sKdkiiJ6KC1dRHQTPDYHifn5xgTl1+bm5hGr7drD3d0CxkCWTsD
	Ur+w==
X-Gm-Gg: AYBFou02oWYUHbKa/ZkQCMiBF8hk4/7ctX/KzNK6BLmrEv12bbo4ABOCdPCr/n4wXJP
	n9zglfnEzJ7ymMnebxupIE0rWe1F/exW15KdYcdizyb2hZrtCj4D+0ObMVGZg8FsjQpr2dbIWnM
	QyoSJKe6ofNAZDS6mmB3g7tHdBd3f8kSxmOoGh6Ek0XwDfsimDoVor4n0hlBgw4i9FP1W1NfDxz
	4cM2py8Nlet44rcsqK4JDv2U2omuiQ1vSfwkWAyU9JhDjMEC8L/FyROAgL01/iLwb97J5MLIGd0
	QaFm6M0KCg5rF48SZMDBPBEyoG9+qL4HNV+NP6Lxz7z2C/Vfv0916snFQw7iaHW+PyFgV8L9i3v
	cWOLEAJ6l21+pxA==
X-Received: by 2002:a05:6102:80a3:b0:796:9525:ac63 with SMTP id ada2fe7eead31-79b5adb9951mr3385070137.9.1789399619243;
        Mon, 14 Sep 2026 08:26:59 -0700 (PDT)
X-Received: by 2002:a05:6102:80a3:b0:796:9525:ac63 with SMTP id ada2fe7eead31-79b5adb9951mr3384908137.9.1789399618486;
        Mon, 14 Sep 2026 08:26:58 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d2915d6sm4926985e9.4.2026.09.14.08.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:26:57 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:26:44 +0200
Subject: [PATCH net v5] net: stmmac: propagate PTP init failures in
 __stmmac_open() and stmmac_resume()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-stmmac-ptp-error-propagate-v5-1-81149897e65d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NTW7CMBAF4Ksgr2s0/sFxuuo9KhYTMwFLTezaJ
 mqFcndMVllAxGak9570zY1lSp4y+9zdWKLJZx/GGg4fO+YuOJ6J+1PNTII00ILmuQwDOh5L5JR
 SSDymEPGMhbhxIHTTaUeyZRWIiXr/t+DfbKTCjrW8+FxC+l8eTmKZ3rEnwQW30IPoQJ2wx6+Q8
 /73ij8uDMO+nkWf5FpsNkVZRY2SLGlB1sALUa1EAZuieoi9soasPJjOvBD1WlSboq4itrpBR+h
 aaZ+I8zzfARxh7ejGAQAA
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
X-Authority-Analysis: v=2.4 cv=c/0+0h9l c=1 sm=1 tr=0 ts=6aa81244 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=P-IC7800AAAA:8 a=DHtdb9-wNaOo6L0ygOcA:9
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIyMiBTYWx0ZWRfXxPc1Hgw3ia25
 Drd2MYU21GVwatYtMPyhJoXDcv3tyjwqKIySJiPn912LXmNiaIhNA2+yLvo9BhILIUpbjqgtxJs
 60cY2S0yjSp3Wv0gquzTDZzGO3viCZdlojfZmX2iKXaPUCcfCnVWuTi+BODIepJVaV5EfCukc2w
 zKjjg/NALzO8yulW0/EW2HS5w32QsIptgGQh6vgz+7HEUx6dAmy7ULvyp/vs6Co3O7lhFuBMpsB
 I0m3rRl53/BeFPNvZgsE10VsjvSdlzB8c8e5BlhD2u2uYXOTxyPOuvkD4qjeftwV+96AGi6X0aT
 klXkJIIzPkUvq7w/prXiYXm1pVyon/b/iz6Zj0TTuUzHioEJrc64ALCMIetTJ6FYoTr2KgKMUDL
 mk2noL4OF5Thf+1M9zgqkwcSbiMMoZa09eE8vgiWea8JdOND6VBjStEmhJz80k/gWP1GrAp6J1r
 QpXy/b8vBisdEB3sHkA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIyMiBTYWx0ZWRfXzrPmYtr4ksaG
 W2S+9LABgEd6qyLgPAWigypH2dCdq55FOSowVAcANX/b5mCz4fgCvpNhXQ/QTzmrUGy+Vv+/sdw
 3nLr5RDtgF16GMT6TkSRfSy3y4vUJhs=
X-Proofpoint-ORIG-GUID: dqL1DY1NS_pKKwSXKmtDq5Q3gBQbPLuY
X-Proofpoint-GUID: dqL1DY1NS_pKKwSXKmtDq5Q3gBQbPLuY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140222
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_082701_900381_6EF1236E 
X-CRM114-Status: GOOD (  30.03  )
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
failure in __stmmac_open(), stopping the DMA engines when PTP setup
fails. In stmmac_resume(), re-initialise timestamping only when the
PTP clock was registered before suspend, re-apply the platform clock
rate configuration, and stop the DMA engines if re-initialisation
fails.

While at it, factor the hardware timestamping capability check into a
stmmac_check_timestamp_cap() helper and apply it to the hwtstamp get
path and the ethtool ts_info path. stmmac_setup_ptp() now enables the
PTP reference clock and runs the platform ptp_clk_freq_config()
callback before validating the resulting clock rate; if no valid rate
is available, it disables the clock and returns success without
registering the PTP clock. This keeps the interface operational on
platforms with PTP-capable silicon but an unconfigured PTP clock,
where timestamping cannot be enabled: instead of failing, the driver
proceeds without setting up timestamping. Extend the timestamping gate
on the set path (which keeps testing the core's basic/advanced
timestamping capability) and the devlink registration with the PTP
reference clock rate requirement.

Gate the PTP reference clock enable/disable in the platform noirq
suspend/resume callbacks on priv->ptp_enabled, keeping the clock
reference balanced against the new early return in
stmmac_release_ptp().

Fixes: 92ba6888510c ("stmmac: add the support for PTP hw clock driver")
Fixes: 276aae377206 ("net: stmmac: fix system hang caused by eee_ctrl_timer during suspend/resume")
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
Changes in v5:
- Introduce stmmac_init_ptp_clk_freq() routine to configure ptp clock
  frequency.
- Update commit message.
- Update stmmac_init_timestamping kernel-doc.
- Link to v4: https://lore.kernel.org/r/20260913-stmmac-ptp-error-propagate-v4-1-a947aceac928@oss.qualcomm.com

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
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |   7 ++
 .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c   |   3 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 114 +++++++++++++++------
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  |   6 +-
 4 files changed, 95 insertions(+), 35 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 7582fca63741..4fc96b317d79 100644
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
@@ -419,6 +421,11 @@ int stmmac_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 
 struct plat_stmmacenet_data *stmmac_plat_dat_alloc(struct device *dev);
 
+static inline bool stmmac_check_timestamp_cap(struct stmmac_priv *priv)
+{
+	return priv->dma_cap.time_stamp || priv->dma_cap.atime_stamp;
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
index 62c3441911e7..0cc6eafa19a3 100644
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
@@ -866,11 +867,6 @@ static int stmmac_init_tstamp_counter(struct stmmac_priv *priv,
 {
 	struct timespec64 now;
 
-	if (!priv->plat->clk_ptp_rate) {
-		netdev_err(priv->dev, "Invalid PTP clock rate");
-		return -EINVAL;
-	}
-
 	stmmac_config_hw_tstamping(priv, priv->ptpaddr, systime_flags);
 	priv->systime_flags = systime_flags;
 
@@ -885,26 +881,37 @@ static int stmmac_init_tstamp_counter(struct stmmac_priv *priv,
 	return 0;
 }
 
+static int stmmac_init_ptp_clk_freq(struct stmmac_priv *priv)
+{
+	if (priv->plat->ptp_clk_freq_config)
+		priv->plat->ptp_clk_freq_config(priv);
+
+	if (!priv->plat->clk_ptp_rate) {
+		netdev_info(priv->dev, "PTP clock rate not configured\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 /**
  * stmmac_init_timestamping - initialise timestamping
  * @priv: driver private structure
- * Description: this is to verify if the HW supports the PTPv1 or PTPv2.
- * This is done by looking at the HW cap. register.
- * This function also registers the ptp driver.
+ *
+ * Description: initialise the hardware timestamping counter, reset the
+ * timestamping configuration and derive the advanced timestamping flags from
+ * the HW capabilities. The caller must have ensured a valid PTP reference
+ * clock rate (see stmmac_init_ptp_clk_freq()); the configured state is valid
+ * as long as the interface is open and not suspended, and this function is
+ * re-run on resume.
+ *
+ * Return: 0 on success, a negative errno otherwise.
  */
 static int stmmac_init_timestamping(struct stmmac_priv *priv)
 {
 	bool xmac = dwmac_is_xmac(priv->plat->core_type);
 	int ret;
 
-	if (priv->plat->ptp_clk_freq_config)
-		priv->plat->ptp_clk_freq_config(priv);
-
-	if (!(priv->dma_cap.time_stamp || priv->dma_cap.atime_stamp)) {
-		netdev_info(priv->dev, "PTP not supported by HW\n");
-		return -EOPNOTSUPP;
-	}
-
 	ret = stmmac_init_tstamp_counter(priv, STMMAC_HWTS_ACTIVE |
 					       PTP_TCR_TSCFUPDT);
 	if (ret) {
@@ -937,24 +944,48 @@ static int stmmac_init_timestamping(struct stmmac_priv *priv)
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
+	if (stmmac_init_ptp_clk_freq(priv)) {
+		clk_disable_unprepare(priv->plat->clk_ptp_ref);
+		return 0;
+	}
+
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
@@ -4161,10 +4192,12 @@ static int __stmmac_open(struct net_device *dev,
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
 
@@ -4189,7 +4222,10 @@ static int __stmmac_open(struct net_device *dev,
 		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
 
 	stmmac_release_ptp(priv);
-init_error:
+ptp_error:
+	stmmac_stop_all_dma(priv);
+	stmmac_mac_set(priv, priv->ioaddr, false);
+
 	return ret;
 }
 
@@ -7740,8 +7776,7 @@ static int stmmac_register_devlink(struct stmmac_priv *priv)
 	/* For now, what is exposed over devlink is only relevant when
 	 * timestamping is available and we have a valid ptp clock rate
 	 */
-	if (!(priv->dma_cap.time_stamp || priv->dma_cap.atime_stamp) ||
-	    !priv->plat->clk_ptp_rate)
+	if (!stmmac_check_timestamp_cap(priv) || !priv->plat->clk_ptp_rate)
 		return 0;
 
 	priv->devlink = devlink_alloc(&stmmac_devlink_ops, sizeof(*dl_priv),
@@ -8346,14 +8381,19 @@ int stmmac_resume(struct device *dev)
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
+		if (stmmac_init_ptp_clk_freq(priv))
+			goto init_coalesce;
 
+		ret = stmmac_init_timestamping(priv);
+		if (ret)
+			goto error_stop_dma;
+	}
+
+init_coalesce:
 	stmmac_init_coalesce(priv);
 	phylink_rx_clk_stop_block(priv->phylink);
 	stmmac_set_rx_mode(ndev);
@@ -8376,6 +8416,16 @@ int stmmac_resume(struct device *dev)
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
base-commit: e6b6078ea1731b05b3b552497b3bce4bf8b014ae
change-id: 20260904-stmmac-ptp-error-propagate-6c0147b4ce29

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


