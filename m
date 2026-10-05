Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7725CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 08:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bjZV0POkzh7LpIvx+eSG553iX1QjNnqXJQew9yHol0M=; b=rBAAPmScg5H6ugaCfRLcIwdmxR
	gJ84XkhWbOGwYdINTzpNxG8GFcGkjyHEVut6aHTYpyuoM8vbfhnfT994xjCYbsMReWzTch/5sldnO
	PmI/sFzFRONaXbcRJjWFcoC1yojJPILnkrq/oC9YwXsh0VqYvGjkjpaDMggYhjxThh0y24K9l5EQb
	uWfHvBhTfUdojEleG1Bw+9dZVhE4DCLj/mczGoE8f3+x94BHXl9to2XqqbroH96sTB7naYjmybU9j
	o0AROHTRw/djokxW60a/rztylK+Dl0nPdDw0G0Pd2lUJXdYXbSrtm/Nf6H1emRG6tLbK4Y37gJzes
	iiv/fD8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDdnV-0000000FqcH-3fWQ;
	Mon, 05 Oct 2026 08:11:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDdnT-0000000Fqbt-0ul8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 08:11:44 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69583xFO1352451
	for <linux-arm-kernel@lists.infradead.org>; Mon, 5 Oct 2026 08:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bjZV0POkzh7LpIvx+eSG55
	3iX1QjNnqXJQew9yHol0M=; b=idxu6HewFD5i5Crnicm1AfOOiBOeFpmgt+n89q
	M4xdbtAu06OPlZZxIkdg6tcqZX4cARFFxpdQV+fwFxN7ON359XqfF5Ljy/P0/Jh0
	tpi2VQpgkx9jSfdG4wzDDXNOV6N/8rDYtyqKZn9XzBHd2fAGxVXK0r29e76UoMhJ
	KEXp8YHN3jB2RT0vx25OIa6DImH+COQJ10S/5z1yTLbUj6JxN/6hZ8LDHimVJW8j
	Pc1DTgmBJ9w5WMrczzrxh8KHbdvYz2ZxTonmv/uo6gCJgrgTfMY3VQbyhO7sSZmf
	RJtLr2K/1AcRa/zV4PMnDuM4/0HixR1XVRh6uOIneFyG4EXw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssud1b6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 08:11:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb7f9bb86so277620885a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 01:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791187901; x=1791792701; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bjZV0POkzh7LpIvx+eSG553iX1QjNnqXJQew9yHol0M=;
        b=MEcXH9EaiSr/tKOXlVO4C612n83I2vZhXomX9nzqi+lyfWEKvmKd3Ev1A7jA9ae2rs
         WXa9XUmV0dsphw4/z/4+Ivi3IrB0i3F6pe74HZtmgPlPUPBX3OmI6dt1GTlqdn+r4mQS
         259zc0TCgqcE6AtOVZJ3FhYIoLCHn4Wx3T6qtcUIxyGpBd3ZYKhqJvdiL5ENX/hW0FKo
         s2NoXENpluQJ2EO7ipFcXtRoYKbIGnu8nWshbGQdIaDMsYsNi4zmfA8xe6TPCcXqao6L
         m8H2lLPNruT4yNOArfIklobW1oJgz3TssjeWb+wgS6GsyQtRTiDrLPuYhY91fKlR7vJT
         Lcwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791187901; x=1791792701;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bjZV0POkzh7LpIvx+eSG553iX1QjNnqXJQew9yHol0M=;
        b=wFl/xuXzWtjspE2hZAalLwOorEmiTWFYb++boa6XNmTc5FFMOsHVOMxllCaFx/bgw7
         3gIiQMO3n0Dcmv9FKZHJ6e8Natg4cCoQi1mnTQ1XHSoWcxDR167wVdyWbwA5lDCTK+6o
         mpS3em271xrlxhTy7mZNAtYuPlO1cG1YumWsSj0A9TQYJKMz26gk9B61rOeH04fSSZSH
         oVaGzYPGdZNVFeYzaJbyuqCXbKPWJWYZiqCLl/z3GxjdG5c5ioDKDM9Xn0qUKbzBhgQk
         F3Lg1Z4SYFLMaEYIHpSU6TwznONsybKyc/QUVD4cnYB4smxG7f9TX6UYp5u8Da+24IOT
         87IQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5FKZyh5pV3aOqjKYpsZZDc8nX4Q+g/dsd+6CQZWkTMNJOR1dfEz//aP/mMw7C0syPcs0IQhgUhRBcvusarWkt@lists.infradead.org
X-Gm-Message-State: AFuF++ljxFVf96VJPatsM6Qw0izOY9bhthIj/vbDWT91+JBvzcsL5eJL
	2EFPAeoV631UTaTYBq+FwgpetgoJAB06Q+RweM1FNFg06e825S3oZF2emO+1rHNDVxj5T/igoyk
	ZbDy1svLav7SJEVpJqjRrcRyeGH5AvPZ/bfCSKamkWvY30rawzlWgBwfbvyLbJfRRNdOH5UrQuZ
	g6hg==
X-Gm-Gg: AYBFou2B3EuTtWH33fFNw7PY77i3sKZtJY+C0gRdibY+3XE8qqQel4H8yIUhUfcXJLJ
	aSG6RjYihTkGU+WEN6CCB1s684fP2e7+NAxslmesNsQdcIyKXeO69T5nH8UkFAL6Zh9sebK8tbr
	u8NZAP0p200RBiPmkGoWiEKqU7mcaoununBA51+jAyMxb6E3Hhhroew9a3OjA0+LGM3K7kbL7kO
	iZmB28pXlkBR6IXRwsQgX4ONmonO0ncDSPHRPujE4MkTMu5DEtzTX/5f5INbwgZjH8fwJimwcHT
	zS/Xs6qWQGTP/6lQAbxQ9lqTWbn0VfJxyI5ivcSZyPnYv91QkCvN4sw/xzChmBrxW/bNqFMuQqv
	7NGV9pNqyRmQBCw==
X-Received: by 2002:a05:620a:1710:b0:93e:5929:f012 with SMTP id af79cd13be357-93e592a0715mr1003524185a.18.1791187901344;
        Mon, 05 Oct 2026 01:11:41 -0700 (PDT)
X-Received: by 2002:a05:620a:1710:b0:93e:5929:f012 with SMTP id af79cd13be357-93e592a0715mr1003519985a.18.1791187900697;
        Mon, 05 Oct 2026 01:11:40 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0316b2524sm376315055e9.1.2026.10.05.01.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 01:11:39 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 10:11:24 +0200
Subject: [PATCH net v2] net: stmmac: serialize PTP timestamping
 configuration with priv->lock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-stmmac-hwtstamp-missing-lock-v2-1-3b3bf4fe3f45@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NUQ6CMBBEr0L22yW0YhG/vIfho9YKG2mL3Yoaw
 t1tOIGZZJKZSd4swDaSZTgVC0Q7E1PwOchdAWbQvrdIt5xBVlKJqpLIyTltcHgnTtpN6IiZfI9
 jMA+8Kt20TWtUvTeQEVO0d/ps+At4m6DL5UCcQvxul7PYpv/os8CsY2usOAitZH0OzOXzpUcTn
 CuzQbeu6w//TMYY1AAAAA==
X-Change-ID: 20261002-stmmac-hwtstamp-missing-lock-b6a7979c643c
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Kory Maincent <kory.maincent@bootlin.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAzMSBTYWx0ZWRfX9wukK/XvCF+r
 jz4Dhx5gnr2ji2ZFlJzRe1MUMmOQ5biD55NxbAE6QMBUrQg+4aqIfsbYsy1U9KmHc3f//CG9wgO
 IFfbkmRlNV3+TrqDe++0bQaMLnvitkI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAzMSBTYWx0ZWRfXxLLqjM5GE4X3
 91YyJeNxyVSJ6wrBtOtrV/0zyO+PmMbI50WfBYrtgcJ+TPlMRqblOI4u1fbJPDQV5kOT4NtLAxm
 dQ74BTo+4t5XD1wjgZnVlFDYCpJoooPB2em9bZNIctvOh7ivZYjDe3dkW2vr+DMenQ0sWrl+WBZ
 RrCfL8NXndzQHR7YwywAkkBfZ5TlunlLp9CWC0xHxwQUmV4Qsq2tmv7TVB1yI0cim7SWV5IHoLm
 1fcaPfOKp1Vkc4JsSgIdZJOohdHBnYmkJNQk/GbW0kVJRlH69clFO0cp7JKCU/qY/RnMrGyuW5R
 0/gUh4Qq7lnFpXkTJYzUkbEtnS/IGcZfBkzcgzGKAo07m5mhtzuft8crswqSR+H6pcG9zwt+QlQ
 SC0Uk191pKbNnn7GyMIssuA2SfJOaT5oym/GAYjtqUa29FAPu6hzU5kAPGMAqO9D9n7s0yx9MMH
 /iR2yLfnNPgIJi7QDnQ==
X-Proofpoint-GUID: 0ZCDk1nMKbIvPkWS-AUbFVKSFpsu1jtR
X-Proofpoint-ORIG-GUID: 0ZCDk1nMKbIvPkWS-AUbFVKSFpsu1jtR
X-Authority-Analysis: v=2.4 cv=FryQbGrq c=1 sm=1 tr=0 ts=6ac35bbe cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fyqvg29pATKFG4behgUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_011143_400115_1CDCDC0F 
X-CRM114-Status: GOOD (  19.16  )
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

stmmac_dl_ts_coarse_set() runs under devl_lock only while
stmmac_hwtstamp_set() runs under RTNL. They read/write
systime_flags/tsfupdt_coarse and run stmmac_config_hw_tstamping().

stmmac_dl_ts_coarse_set() snapshots priv->systime_flags, programs
PTP_TCR, PTP_SSIR and PTP_TAR, and only then publishes tsfupdt_coarse
and systime_flags. A concurrent stmmac_hwtstamp_set() can read the
stale tsfupdt_coarse, build fine-mode flags, program PTP_TCR in fine
mode and set hwts_rx_en.

Take priv->lock in both stmmac_dl_ts_coarse_set() and
stmmac_hwtstamp_set() so the timestamping configuration is updated
under a single lock.

Fixes: 6920fa0c764d ("net: stmmac: Add a devlink attribute to control timestamping mode")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
Changes in v2:
- Use proper Fixes tag.
- Link to v1: https://lore.kernel.org/r/20261002-stmmac-hwtstamp-missing-lock-v1-1-189ce151a624@oss.qualcomm.com
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 43 ++++++++++++++---------
 1 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 9741f97fa37a..a6793054a179 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -685,14 +685,7 @@ static int stmmac_hwtstamp_set(struct net_device *dev,
 	u32 snap_type_sel = 0;
 	u32 ts_master_en = 0;
 	u32 ts_event_en = 0;
-
-	if (!(priv->dma_cap.time_stamp || priv->adv_ts)) {
-		NL_SET_ERR_MSG_MOD(extack, "No support for HW time stamping");
-		priv->hwts_tx_en = 0;
-		priv->hwts_rx_en = 0;
-
-		return -EOPNOTSUPP;
-	}
+	int ret = 0;
 
 	if (!netif_running(dev)) {
 		NL_SET_ERR_MSG_MOD(extack,
@@ -700,13 +693,23 @@ static int stmmac_hwtstamp_set(struct net_device *dev,
 		return -ENODEV;
 	}
 
-	netdev_dbg(priv->dev, "%s config flags:0x%x, tx_type:0x%x, rx_filter:0x%x\n",
-		   __func__, config->flags, config->tx_type, config->rx_filter);
-
 	if (config->tx_type != HWTSTAMP_TX_OFF &&
 	    config->tx_type != HWTSTAMP_TX_ON)
 		return -ERANGE;
 
+	netdev_dbg(priv->dev, "%s config flags:0x%x, tx_type:0x%x, rx_filter:0x%x\n",
+		   __func__, config->flags, config->tx_type, config->rx_filter);
+
+	mutex_lock(&priv->lock);
+
+	if (!(priv->dma_cap.time_stamp || priv->adv_ts)) {
+		NL_SET_ERR_MSG_MOD(extack, "No support for HW time stamping");
+		priv->hwts_tx_en = 0;
+		priv->hwts_rx_en = 0;
+		ret = -EOPNOTSUPP;
+		goto unlock;
+	}
+
 	if (priv->adv_ts) {
 		switch (config->rx_filter) {
 		case HWTSTAMP_FILTER_NONE:
@@ -829,7 +832,8 @@ static int stmmac_hwtstamp_set(struct net_device *dev,
 			break;
 
 		default:
-			return -ERANGE;
+			ret = -ERANGE;
+			goto unlock;
 		}
 	} else {
 		switch (config->rx_filter) {
@@ -859,8 +863,10 @@ static int stmmac_hwtstamp_set(struct net_device *dev,
 	stmmac_config_hw_tstamping(priv, priv->ptpaddr, priv->systime_flags);
 
 	priv->tstamp_config = *config;
+unlock:
+	mutex_unlock(&priv->lock);
 
-	return 0;
+	return ret;
 }
 
 /**
@@ -7753,9 +7759,12 @@ static int stmmac_dl_ts_coarse_set(struct devlink *dl, u32 id,
 {
 	struct stmmac_devlink_priv *dl_priv = devlink_priv(dl);
 	struct stmmac_priv *priv = dl_priv->stmmac_priv;
-	u32 systime_flags = priv->systime_flags;
+	u32 systime_flags;
 	int ret;
 
+	mutex_lock(&priv->lock);
+
+	systime_flags = priv->systime_flags;
 	if (ctx->val.vbool)
 		systime_flags &= ~PTP_TCR_TSCFUPDT;
 	else
@@ -7768,13 +7777,15 @@ static int stmmac_dl_ts_coarse_set(struct devlink *dl, u32 id,
 	if (ret) {
 		NL_SET_ERR_MSG_MOD(extack,
 				   "failed to reconfigure PTP adjustment");
-		return ret;
+		goto unlock;
 	}
 
 	priv->tsfupdt_coarse = ctx->val.vbool;
 	priv->systime_flags = systime_flags;
+unlock:
+	mutex_unlock(&priv->lock);
 
-	return 0;
+	return ret;
 }
 
 static int stmmac_dl_ts_coarse_get(struct devlink *dl, u32 id,

---
base-commit: aaaaf87ea99b8766c9a8aa0e71aa42e6bc8a5320
change-id: 20261002-stmmac-hwtstamp-missing-lock-b6a7979c643c

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


