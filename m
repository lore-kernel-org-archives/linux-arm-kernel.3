Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8FEDCA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 13:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=anZMUlFWluJFZosHEUNRpWoVljRu3uvfOe/sW+wWxKg=; b=GT4/CxRrJl+HaIS9rh9YxTtnKV
	dLA5Rm3UvbIZgct+Q/2FmxZFsTA+KU/Tnzk2Bb/hna+Qeum7/Sxn2hwXQ1tIZ2tosK3V/apPAEica
	mTsaEKLrbI7ABI2N80rH8gAC3euMfugK9MyMvewVBYUYMprDlsNxF4j2dzWRiNYMj2RTceM5UlRc4
	uw8GH5tr15oRtwiju62PjJ00DhAsCCMiaUXzZZ2rJHV0lLDqxzW/NPWLxUtT5IzNRRl0jyPWl76hk
	x1rOR41h5Fu/0Sp12ARsNW2RbmzKdBVe8a8LgJQy0XiEmKi8nJU8dtP643IG40owphX3fVWAdsJIW
	5K063gfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHBW-00000009HAp-1tP8;
	Thu, 01 Oct 2026 13:50:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHBT-00000009H9R-0ZYr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 13:50:52 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691DjHux2403835
	for <linux-arm-kernel@lists.infradead.org>; Thu, 1 Oct 2026 13:50:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	anZMUlFWluJFZosHEUNRpWoVljRu3uvfOe/sW+wWxKg=; b=AwWInIjilIReedJ/
	CRbxxnKSGNEAghoayRYm+Xdvo66GY7FUfaDbhcx6Bek7X6VLzyDu6iMihFGqYO0e
	3TsY8H2UDkBO6XZZdfxUPoSvF58FilX8IGLJxhNRH6dIzRsod12uOgwMQBKlOdms
	zZMrRlhE1bhwYcE/63DpV4iiSd3Ktw743aCFeu98NiAvahB/dV+Y+z3IVnaYucPH
	yd0X5N4/o47kBJIQd4wkv6WC+/gS5tZKLem/IU1JmyPxW/yKeNa+FLQaU2ChVBy6
	gB8KTMlL2Uu9vz5ApsL7AgXmdbZHzDj8KHKrRfquOTQhRv3N59lVL3IRu8ZmJQ+w
	kNkz3A==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h188sv0tb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 13:50:50 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5d8ca39f596so486352e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 06:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790862649; x=1791467449; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=anZMUlFWluJFZosHEUNRpWoVljRu3uvfOe/sW+wWxKg=;
        b=cgnszHHlBnROpy6JVMUd9FOuvPBHBHauGKq4cWlo3rFrtVGuj68dNQ6tiKzdVdxYD0
         SpCPVKlqHMgW2PKRL2+j7gFUCRv3oRAqdBhFq0lfxBzPlQuZoyEFj+iZXGxfKb+PUp+Q
         yI/TKOph8jQVxsWdo3n6N9xMdFWKfPXkYjxYcp4UpV4O1Ob4jbzCGRMCpTxd6uF1qTf4
         fFWtxyMyWdGM2xZI/L2+3O26A8m5/KzHVAymejwUwO3bGrbfbNqTmTgSXZ+rzfpAAQ8t
         9FsYRd+x7xHKdG8eEdmrPXatkTvvAftHxDFqG2uiPxgOc+UT93Vp0rKt+W7gns9a6ASA
         Fozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790862649; x=1791467449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=anZMUlFWluJFZosHEUNRpWoVljRu3uvfOe/sW+wWxKg=;
        b=ELuOgV+QXymRZPuFSXfwk1Qlx5YgFGcxo4PRQ4AQL6hHGQAzSdHdqaWOHi/XhPCNKS
         WiVUa8wBjSg+diEqGdTxP9GYxqMsqIh05d2IWa+ymyeh7HepgQcK1uVgVQQB0tw8n+0y
         oB6SQwUUAfiiq1xw5qlXmGOpqYhavthpxkDUg3AnzUCHRiPLXPUSizpcXng9Ewekl3aF
         hin2lkvXOEN2Mws5u69YE/08Xe/mhik9MjmiBZ6R2545XISfYp4WeQfIkG9aznIzLQKy
         cZxO04Xjn/X6aLIiRkvAbCotkPK5LUS6q/tQtGLmFdQZd9ujU6tSne5O1LoovuV+uzpB
         jirQ==
X-Forwarded-Encrypted: i=1; AKwUvByPGECqeypfUXUn2QiaYoNZRzBpSsDRg8+ZwJayMqcVfKd0gpWhQvmEgkXaM5ZNA1qNVBe/PySLEd/+JMRqw3Lj@lists.infradead.org
X-Gm-Message-State: AFq9FYKZHIPcPf4h49Z4zKjshRTlTBcpdFuePGNTDMZfpp14wpgtFXGz
	FSOo9SCondvrr4n1e9XIEqK8PgZrMQO8GYnzSWRrjLJ40I5m5DJMwQpMFWY0m5KI85A9aG1eW74
	oeHEdVeDxej9rnr0Wedh+s4JcfZWs79d51RxvUptyJr4bY+mvggj4bZUj6PEZ4+iift1Jxdj8c3
	BVLQ==
X-Gm-Gg: AYBFou2NLGP3Gw0QLvvLbPuIyB8e2Z9mjq6MX92lqDPt0/R8bKLaGXxbYIml/1OpMoQ
	OQX54mFrWxNkf/32OLrRpT6Cth7OGsMGpeTIRjUgdBgoPXvna+6e8YdiTLRyces4v9ybDO5TZzh
	YapB5jq11jyAqvghMwJVtR640RgvHWrr8R0KKkx1MfkK45cfKySRl8dFV1R2b8+JHiaBTCxmPQu
	UWiMd6wD2n8RI4DPxqb4tBMvnLsfmvKOl7C0ZMcGP3mdj8czZzF76/OgfMIadKtCS9pwh8xfEw9
	B4BWmDcc5XnRRZWcxx8evFK6KG96bV43GmfNhaaZaQPdg7M+TbMST9Lf6340MFDjRvDItw+sSoA
	umtDpjvCiQ4OTfA==
X-Received: by 2002:a05:6102:4499:b0:7b3:54c7:7ce4 with SMTP id ada2fe7eead31-7be74985077mr1542549137.35.1790862649299;
        Thu, 01 Oct 2026 06:50:49 -0700 (PDT)
X-Received: by 2002:a05:6102:4499:b0:7b3:54c7:7ce4 with SMTP id ada2fe7eead31-7be74985077mr1542525137.35.1790862648635;
        Thu, 01 Oct 2026 06:50:48 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f90cccesm80653465e9.2.2026.10.01.06.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:50:47 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 15:50:18 +0200
Subject: [PATCH net-next v4 1/3] net: stmmac: set real_num_tx_queues to
 max(offset + count)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-stmmac-mqprio-prio-offload-v4-1-a74610d7f1e5@oss.qualcomm.com>
References: <20261001-stmmac-mqprio-prio-offload-v4-0-a74610d7f1e5@oss.qualcomm.com>
In-Reply-To: <20261001-stmmac-mqprio-prio-offload-v4-0-a74610d7f1e5@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Oltean <olteanv@gmail.com>, Furong Xu <0x1207@gmail.com>
Cc: Daniel Thompson <daniel@riscstar.com>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1NSBTYWx0ZWRfXx3wcwwL7g+KF
 nrmcj7umovZ17SIEiryxyRpVXe5WliG+YafgyYEIcjSsYKpA1zbHjyURTXJA6Oz+KY2Rf2VlT7S
 31MuDpX8C2Q+Ta0Cx4YubdqaOBm3X9Y=
X-Authority-Analysis: v=2.4 cv=OozaWC/t c=1 sm=1 tr=0 ts=6abe653a cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=oHinmdPMHoDLt9c3IdwA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: CdaVFon2okfjmb3KxV4SXzfWkya0n71o
X-Proofpoint-GUID: CdaVFon2okfjmb3KxV4SXzfWkya0n71o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1NSBTYWx0ZWRfX0ZQjOhmd+uMj
 ZKxsecf5Thn+m/+3sZ7xV/gkuKdMD5/acHulkjX3toVmC2YlIB7KD24KnzATZcz4A4+og9PX3Cc
 TTA3jIYMCguCNqbynAMr9y81cuEfnuJAz0++pDCLjnrhep5AbaD0QymbveS7CDg17pZe82mjW2i
 r9A1CbrY1GQd2HM3cnZcP33qTSBVWUCO/DPctJQuXt817gLwxwIGgYK2UaOvPbspa2LqTZy2Up6
 ngo8+DU8yRJrx5qRD7N2VVuZnMzpPsAbCTa/wbaIqcJTDUusQqn1apI44wbj/zevkDHle/sNY2u
 NNBg688yMriHfS0yWAioaPZ2hVyCTOrsbnK/XG8Tn4phoTk/knM01VMexirwDhLamU+JdU1bHCK
 eOMS6JFpHUb3wuRlhLEpjUj0iBaAl0x+XtWWDS+dZWNwPGoSTPUq4p/R8QAp8vBQmz5xfquJQt5
 SZNuuW6fzvcY2MJ7nDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_065051_615959_03787272 
X-CRM114-Status: GOOD (  15.81  )
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

tc_setup_dwmac510_mqprio() computes the number of real TX queues as the
sum of the per-TC queue counts. mqprio_validate_queue_counts() only
rejects out-of-bounds or overlapping ranges, so layouts with gaps or a
non-zero first offset are accepted, and in those cases the sum is smaller
than the highest queue referenced by the netdev TC map.

netif_set_real_num_tx_queues() then passes this too-small count to
netif_setup_tc(), which invalidates the mapping.

Compute num_tx_queues as the maximum of offset[i] + count[i] instead of
the sum of the counts, so real_num_tx_queues always covers the highest
queue referenced by the TC map. This is a no-op for the contiguous
channel-mode layouts where offset[i] == i and count[i] == 1.

The issue has been reported by sashiko and the patch has been tested on
Qualcomm RB3-Gen2 board.

Fixes: 195e4f409a40 ("net: stmmac: support fp parameter of tc-mqprio")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 42a00446e9b4..1aa80d51ab33 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -1303,7 +1303,8 @@ static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
 			.count = qopt->count[i],
 			.offset = qopt->offset[i],
 		};
-		num_tx_queues += qopt->count[i];
+		num_tx_queues = max(num_tx_queues,
+				    qopt->offset[i] + qopt->count[i]);
 	}
 
 	err = stmmac_set_ndev_tcs(ndev, qopt->num_tc, tc_to_txq);

-- 
2.55.0


