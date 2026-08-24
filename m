Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8CCC5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 17:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/YiyuDQDgrAZIpdgTwrDK4kXwmBpmKtp2/U0jYeeTno=; b=Ott8Pp+79lEP1DNOzM2Aa01NTo
	rlnJBC9K3LVEhwR/eGP40TFLIZXwqFFqQUHYdTz9gjiv38CCN3nliJhiHg0tnuwzCcj/n84RKtotR
	/L/xWpteX72ZkoqAf/C6UVEub2DLQhiESaz+d1lUI/3Ey3XcM3p0jOUaY7P86mpTxbqNLWlUv3xBb
	cSGsjE6znITmyzyOZlxgZ8rq4stEa6gpluVsvop+rwo5dDGOh/iCApEzQJtSUEsjRxWwtN7XFn50d
	JNr3BMH5OOuPmTdM+ZtLHiE7hoibvcwK3evpsqAJaaK+CFCyViI81wd9VrGCyuyq3o1SNxCDbF+Yu
	yVuLgvJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyYko-0000000HChB-0RX4;
	Mon, 24 Aug 2026 17:46:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyYkj-0000000HCg8-2biA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 17:46:36 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OH89iG3138169
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 17:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/YiyuDQDgrAZIpdgTwrDK4
	kXwmBpmKtp2/U0jYeeTno=; b=opQMH1cww9OVaof7Ohg2xNARlePSxjt6quxPOh
	EdnTByDoeyi0ov828H3NZBQvJqzDCg0xXP2nD+7IhC/v4pY5hJsvE7hbNizBAhw2
	k+9Q25FeTTeesK1j/4vK61vKYJ2dxbShSedzrYzknVgW7iMkTlGw2TV3sryb43TF
	shjvese12OxRXDxE3vAyRUtH9RxYfqBW3vIsFp98QxB0jmWxu6TPL/KU3Tj3c/vD
	3s1W/72dHlOtQbX5B/1leKhkP6qSDXfy28wiascjB7WzxFFeD/X13YFFU3CnosNO
	OXMXIstwkmJOTl+hPOF9b+/eyHEYym3c87EMr+/PF1g/DrIQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8t3dr524-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 17:46:32 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-75116a48926so3048778137.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 10:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787593592; x=1788198392; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/YiyuDQDgrAZIpdgTwrDK4kXwmBpmKtp2/U0jYeeTno=;
        b=Dda1HbzNE9FF4NrGea2hmiP3YJp9X7G53dATuie3TOF0XI36l6y4d/U5NzygiS1hMQ
         lWr6IVbD/aIq0FBQ5Lk5CStZSKKTYFYO4rSw+biaR5a7Fsl5tAy2T9E6IA40BUz3/4AK
         w5gr7/hJord6Kq5xfkjJMESnD7jCA9L+GeACaeHZTfJVvvkr4AESPf8CkY/CjNrC8L4u
         NwBToGm2MjOWqALtkh706Wj4Jmd7ZICWpievk3OixXE83kjGTxnP0pjq5y/mvqjdB6zB
         c7Af8gfGy4e/zbR0KBzvBWxMoRZ59+OGPadIlhQ/Y5mGAyMkp39Kr7Xwr/Uc7FYazwC8
         syzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787593592; x=1788198392;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/YiyuDQDgrAZIpdgTwrDK4kXwmBpmKtp2/U0jYeeTno=;
        b=fsjujc1M7EodlsPYel8y2yAdwTfrsnHd7ssZYXdoZaZ/BIseO5yUvPBX8NuM0eIN6i
         Zr01akGCa4WRb05l4SKGH1knF79ESKC4rQbQ7PxbI71U4DUta/Jo5odmRXTL7uw05ci4
         Hjuyo7yoK7EIsjIXgOePb8fQGIXRWKxAVPsBdLrWqYFRdrcDoX/sSYkjGq32HXX/j4Pn
         Wjth0+bj0Aty7c4Cy1BF7aRnfR8RfTFQZ6xWd2e2kMMKwhMnbHSi6noaJ+ccq8WlYN3s
         K64/ZBKAVcLwK1ZEnDAGKoOJj5G9rLw2IiDBwN9Vq4d0B9KkUUxvwEEqb6NccN9NBMGe
         C8Rw==
X-Forwarded-Encrypted: i=1; AHgh+Ro1fN7ExuPua5nAnettf+LYnKtOvRSHyFTE5DoIJTd7GMmQEvezvn+6q8nD6vsHlpfD6jyvrKaT0hgVqE441QqL@lists.infradead.org
X-Gm-Message-State: AFuF++kLjvrXea6XhafdtIvG4JRlG/usoyCItQimv0evwV3nwBSMG0b+
	KG8WV6pMeA1xZmCO61JduUHhmESspmrilgFUJKpWCoTnDteAlnGugfSBZKtfwccbcfp28FoWy1P
	MHJNE9frTiLPVvkRNqlp+MRrzybrbhtPJ+3MYHFptTw0aWmQ0DMdVtKlt0HGIqNdFssgwyD5l9J
	AKfQ==
X-Gm-Gg: AR+sD11xdW9cRYqAN+f+XQLvLKQAAowVy+3wtla5YviXbfIJ9BybSHgfqnkrjMXEAa5
	2sEk/wvilsSmY6dboEhIRL8Ilzv/MyPBc4fMtDghHVqBBa+Mm0niL8Cxy5d5sGvDubTkL9jREFQ
	c+ogrGxBadcFG63KXk9N0kkP18coaSAi6XBAi6B3m2/mZK8WG0wCqdVERTY97ZG2yYhp9G2Dzn2
	3tFxQKKyxxhZpuK7yUTATifXXxZfFP+CNLfABQtt1FIkur4CeX/piBJb4MwfFQ7UTMBPFA2Df2q
	Wmu90Tp+UYe6TSd8SaAJw9YMRo8pXpbfgILWcichA33bWibDlB12OyqA2ZFXjUmZf8uhpuI2lwr
	2HK/9s0aJTV4QQ3w=
X-Received: by 2002:a05:6102:3ece:b0:772:dae3:d4d5 with SMTP id ada2fe7eead31-77a622293d5mr11922385137.1.1787593591717;
        Mon, 24 Aug 2026 10:46:31 -0700 (PDT)
X-Received: by 2002:a05:6102:3ece:b0:772:dae3:d4d5 with SMTP id ada2fe7eead31-77a622293d5mr11922345137.1.1787593591096;
        Mon, 24 Aug 2026 10:46:31 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e001305sm10346144a12.4.2026.08.24.10.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 10:46:29 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 19:46:07 +0200
Subject: [PATCH net] net: stmmac: hold runtime PM reference in setup_tc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-stmmac-setup-tc-enable-pm-v1-1-45172d241a4b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQ6CMBBG4auQWTsJVATxKsbFWH51ElubTiUkh
 LvbuPwW721kyAqjS7NRxqKmn1jRHRryL4lPsM7V5Fo3tGfXs5UQxLOhfBMXz4hyf4NT4K6fRE7
 DcR6nkWqfMh66/t9Xiih02/cf8hEh1nAAAAA=
X-Change-ID: 20260824-stmmac-setup-tc-enable-pm-149aa563d797
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: PZhTqHRhoKOiK3XH-4g9_qYOo4O3f9Ki
X-Authority-Analysis: v=2.4 cv=OLAXGyaB c=1 sm=1 tr=0 ts=6a8c8378 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=O7mAVgsXz2YliqE_5DUA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: PZhTqHRhoKOiK3XH-4g9_qYOo4O3f9Ki
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDE1MCBTYWx0ZWRfXyKJukLDbS9U3
 U4st/5/yv9zYcttEiUFCgvQF0ipsq9as7b4D40Cf4NClrpmrknilOjvGC/cgzr0uU8tyWE5AkQK
 84KpiCWSItpETr5kM11RUQcNM/i3tzg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDE1MCBTYWx0ZWRfX6I/dfcy/RliC
 6dsjzUvdSb5SoaN9QJmI+VTvv5E2JQvhz5xpE4vt3TiHVGswK6lH67mjLgcslEvIHdPmxOUCcpz
 W9q0V1zpcPuT6dEHCP2GHR3IkNK4STOtzvpJlfLYOcAJzdxaN3P1vEyS3239u1nR/jhSrwfF5sa
 VAd9e6yH/g+fyBEIsXWGPaPLIEuiYGRafXs5WqwGPsbFp9/aNgN5njm9qTYsVC3jCsy5JVlV+GN
 sGr7lTm71OqD+w2q0CTfOPTfIJBDMVRIqQi4bAy66I7SBLolQimykRl93iXzFhCs2SWClfdHfoG
 3tW+puP/RUBklfUlw0JT8n2iTJYV2hvRkQnaV0SlPH9i/OiLWey7Y2qDEqGsjhVD2V0qhcvCYhN
 TuOhjRJYdYcgBnVGEdlVaAHqiivuT6nceksOsyv2gbKWkLoPycIXOUWYDnwmxao/4HLQmJbsQ8K
 x6uUs9fTEdzx/bMA/5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_05,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_104635_311412_231FAA3C 
X-CRM114-Status: GOOD (  19.23  )
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

The qdisc offload callbacks invoked by stmmac_setup_tc() program
MTL/MAC registers, but they can be reached while the interface is down,
when stmmac_release() has dropped the runtime PM usage counter and the
device may be suspended with its clocks gated. Accessing the registers
in that state can trigger a bus error.

Hold a runtime PM reference while configuring the register-touching
qdisc offloads (mqprio, cbs and taprio) so the device is active, and its
clocks enabled, whenever the MTL/MAC registers are programmed.

The TC block callback stmmac_setup_tc_block_cb() programs the MTL/MAC
registers as well, but it runs asynchronously from stmmac_setup_tc(),
outside the runtime PM reference held there. Hold a runtime PM reference
for the whole stmmac_setup_tc_block_cb() call as well, covering the
cls_u32/cls_flower setup and the queue enable/disable accesses.

No reference is held for the TC_SETUP_BLOCK bookkeeping itself, the
TC_QUERY_CAPS query or the tc-etf path, since none of them touch the
registers synchronously. In particular the block bind/unbind must reach
flow_block_cb_setup_simple() even when the device is suspended, so the
driver never leaves a stale flow_block_cb on its block list.

Fixes: 1f705bc61aee ("net: stmmac: Add support for CBS QDISC")
Fixes: 4dbbe8dde848 ("net: stmmac: Add support for U32 TC filter using Flexible RX Parser")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 34 ++++++++++++++++++++---
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b2b7d0242dd3..4baf40fb01dc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6392,9 +6392,13 @@ static int stmmac_setup_tc_block_cb(enum tc_setup_type type, void *type_data,
 				    void *cb_priv)
 {
 	struct stmmac_priv *priv = cb_priv;
-	int ret = -EOPNOTSUPP;
+	int ret;
 
 	if (!tc_cls_can_offload_and_chain0(priv->dev, type_data))
+		return -EOPNOTSUPP;
+
+	ret = pm_runtime_resume_and_get(priv->device);
+	if (ret < 0)
 		return ret;
 
 	__stmmac_disable_all_queues(priv);
@@ -6411,6 +6415,8 @@ static int stmmac_setup_tc_block_cb(enum tc_setup_type type, void *type_data,
 	}
 
 	stmmac_enable_all_queues(priv);
+	pm_runtime_put(priv->device);
+
 	return ret;
 }
 
@@ -6420,26 +6426,46 @@ static int stmmac_setup_tc(struct net_device *ndev, enum tc_setup_type type,
 			   void *type_data)
 {
 	struct stmmac_priv *priv = netdev_priv(ndev);
+	int ret;
 
 	switch (type) {
 	case TC_QUERY_CAPS:
 		return stmmac_tc_query_caps(priv, priv, type_data);
 	case TC_SETUP_QDISC_MQPRIO:
-		return stmmac_tc_setup_mqprio(priv, priv, type_data);
+		ret = pm_runtime_resume_and_get(priv->device);
+		if (ret < 0)
+			return ret;
+
+		ret = stmmac_tc_setup_mqprio(priv, priv, type_data);
+		break;
 	case TC_SETUP_BLOCK:
 		return flow_block_cb_setup_simple(type_data,
 						  &stmmac_block_cb_list,
 						  stmmac_setup_tc_block_cb,
 						  priv, priv, true);
 	case TC_SETUP_QDISC_CBS:
-		return stmmac_tc_setup_cbs(priv, priv, type_data);
+		ret = pm_runtime_resume_and_get(priv->device);
+		if (ret < 0)
+			return ret;
+
+		ret = stmmac_tc_setup_cbs(priv, priv, type_data);
+		break;
 	case TC_SETUP_QDISC_TAPRIO:
-		return stmmac_tc_setup_taprio(priv, priv, type_data);
+		ret = pm_runtime_resume_and_get(priv->device);
+		if (ret < 0)
+			return ret;
+
+		ret = stmmac_tc_setup_taprio(priv, priv, type_data);
+		break;
 	case TC_SETUP_QDISC_ETF:
 		return stmmac_tc_setup_etf(priv, priv, type_data);
 	default:
 		return -EOPNOTSUPP;
 	}
+
+	pm_runtime_put(priv->device);
+
+	return ret;
 }
 
 static u16 stmmac_select_queue(struct net_device *dev, struct sk_buff *skb,

---
base-commit: 7cbfb180945ce529608e4d4e24a6d483699fab1e
change-id: 20260824-stmmac-setup-tc-enable-pm-149aa563d797

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


