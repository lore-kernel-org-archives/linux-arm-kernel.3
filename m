Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15798CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 10:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S2xyB7XTL0+qCDVUHZbY2vfGSDX7LTYPR+SqfX60x/w=; b=4RGDHB3kQ3s+wDBwDlJmj0DjaL
	ZO/RrYzB1gr5jDxpyAR5eK0kzhgQSg3iFN6zdJkEGcaKGElOaXAQeV1zjN4d0wWUxSs2klq7z0/lf
	pxv137YEegELbu7+rb2COlsxyqRWwaqK344BC9zc4ONoF7brVO6qAuEwuEnPOGsZ6758pbU3BhVwG
	RqdLMDbq/yUfRuz/qX27Eixm/YHFCQ8LOF4sR9r4fxrS2MA8qYIWjdYTCtWHzcVjH1hnXTSE/qz8V
	oARHwD7EEGH8Ka1T4yJWtXh4zUj+7dduhzw2wZYpAMg+9AHz7nl6YuS0TSjsiOMtsgD5vG5ZBkX7f
	jHIHGoeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2h4-00000000YIb-0G14;
	Tue, 06 Oct 2026 10:46:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2gz-00000000YGj-1qbU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 10:46:42 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696AREAC1580766
	for <linux-arm-kernel@lists.infradead.org>; Tue, 6 Oct 2026 10:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S2xyB7XTL0+qCDVUHZbY2vfGSDX7LTYPR+SqfX60x/w=; b=DefDy32m89/epF7H
	UMoS0HTLGsYaRIzlo7FZdgI+u3RBLPi03mUDHRVR5oCv1Vk1cAjvX16uJWcA+XUE
	ELLQwwatmtc1rJkiRd+lmMYLdB/y2kTvGBmNS5NNuMbjEPDdUfMrt9WVIBeOZNlB
	QbsUEFqtetH/QLkyrmBaZP8xj/Xj9+iq/C1NPvD8ntYuB+K1MNoN76hgBejG+j1t
	UxD9Dyxtl1QUVLVlqO4qySaDNz60hHWdI+nk1l4nwQTO1fYB9nt1vkvnBe7/P+l3
	H/uAuavfE+S9jbgPju8Bicm0iXghsvjZvEGv/oj/NaYFPPW+r4DAXVQOd4SaeVMO
	GWMdLQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xc508m8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 10:46:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ca4a2b9c4so615973585a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 03:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791283600; x=1791888400; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S2xyB7XTL0+qCDVUHZbY2vfGSDX7LTYPR+SqfX60x/w=;
        b=J/j3YfmB5agt/x9PT+BcxsV1at3q1xZXlq+DTm8hnIz+ShoJLUbodhprdz0FyGJgVz
         HDMXidjjTKfDnQpaO6Q/U6StzouuOlLugwixzjlbcl/mORxeGkveBvytadpxF2X1nShB
         r3LfYDme+C1LIrhfQufpG82xD8ryegaKETbeocygGVcXJAh2is5krnNHXiGxdE6Xaxmf
         TI4JCvkA8N5qSgMDOwKw4tsuTfe3OIGhhoJG3ni5gZH4YuIzSaNu5nZ9uMIt+Pr1QE3P
         Jy+aW+voqdGNFZpdo+U7pGiMZWOIj7fk1wu4LMsgwEd9BmOCGZJL6SmECcKsNw4kWI+3
         LInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791283600; x=1791888400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S2xyB7XTL0+qCDVUHZbY2vfGSDX7LTYPR+SqfX60x/w=;
        b=PLtl9ISFDh88S/bCU4jW5GdfspSkYIG3tdkIXQ4NRHmP7kC3z9FGM77XFN+X2kofOL
         Iuz+1u93U3xg3BHcFvoJuiIHW88KyEMcVrxqs7UbDstYcz+dKOdMY1MTDdNvSu1bH/oE
         sVwDpTtQBPd44eI0sNHzGEl4aF8+1fV+q0AUxEznNfhc7tx2Dv/Up++9sgu7vfu2+2vW
         DlT6ZZYmIr32zVQrcOHn2WOojZymUL/Opm5MI3xJf01d4OvQt8Tf4K6p2fpt8YqxDdpp
         3d5hMgyS6pM0+dPf2HD7rSn4zsW/pZcdU4zJEeyKHey/DMTsWZYOXoj+aM4eYj+v0l9G
         knjg==
X-Forwarded-Encrypted: i=1; AKwUvBz2HmjP0io+8btHdrKvMPLie+dyC1sO777ypSN2BTkZSbgFazU7zBoELzz0ihQhRvH9fMjwas2ahe4rgN/CCVXF@lists.infradead.org
X-Gm-Message-State: AFuF++mmQNRiDC/5lTz7TsH545wZZhKqc+dBJKUKcQ8k9iUWKTpEo9rR
	v+fSlqF06f2QnMM/HCfOJB8h+LmICy3z9G+XjF3oPf0iQtNRnh3MR8vDa2qmBdMSr2/Y51bivev
	ehE0TqxVrDXptJEL8mYeAEQKTf2DxC+szPQxlTFTvxDlMxkm2GYBmlmICWzA0Eqs2F8yF/xAEx/
	By05lSplj4Gw==
X-Gm-Gg: AYBFou30h6i60JlQRFnjhxMyIEQbVMIGdDdKKdLEERJcU2URDxDRu7w3GJpSHJcnkiS
	mEhCa72Ek3WBp21mxhPQgg/2SdTkltGDTsvQRpuZcCBNrS6q8ULbGF+SmsXzwL3TgJMPW6A8GNe
	cVUePZo8YOk1i3Jn5qfrHoeBshSA4DAQo2GYeD219jjN4/7d4u2y56tFmBPx+IDaw/T4B945HD0
	ULKwPtAiIZAI7tjYF82UpoB9Rkt7Y0WJ9mZMjDvBIgXUAigdU6tIsoFfnEn3cq1gKci0uvyDXKJ
	fvDjhbhCgRN/cq8Oe8Mh53FV3n/lcLW2UrtQlcYCOT5DiXNNgSWwVAeSfHbGMBMDRu2RPuRdyPl
	gn06jARmNwEaJGg==
X-Received: by 2002:a05:620a:a2d5:10b0:93e:5953:1cb7 with SMTP id af79cd13be357-93e59533371mr1145543185a.54.1791283599742;
        Tue, 06 Oct 2026 03:46:39 -0700 (PDT)
X-Received: by 2002:a05:620a:a2d5:10b0:93e:5953:1cb7 with SMTP id af79cd13be357-93e59533371mr1145539785a.54.1791283599229;
        Tue, 06 Oct 2026 03:46:39 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6fa8d2cfsm728778f8f.13.2026.10.06.03.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:46:38 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 12:46:25 +0200
Subject: [PATCH net-next v5 1/3] net: stmmac: set real_num_tx_queues to
 max(offset + count)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-stmmac-mqprio-prio-offload-v5-1-d7da93419784@oss.qualcomm.com>
References: <20261006-stmmac-mqprio-prio-offload-v5-0-d7da93419784@oss.qualcomm.com>
In-Reply-To: <20261006-stmmac-mqprio-prio-offload-v5-0-d7da93419784@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=X5THu2Te c=1 sm=1 tr=0 ts=6ac4d190 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=rcFsrxwjrcho-PCruckA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA0MiBTYWx0ZWRfX1qBcgWiFYkxr
 jzFzcpwMQGAQJ8Xvk8fRLBhMCO9TEp3+EyQYPKVeP/MeA6NfFrGHdwBmpPxbuohuJ3cpfQzdXT9
 z2Yrcesk3vd5Fs0uOKZtFFLiU3YSaWw=
X-Proofpoint-GUID: _2AzmFqAaUA8v54k4cfGcgAtbAqBD__k
X-Proofpoint-ORIG-GUID: _2AzmFqAaUA8v54k4cfGcgAtbAqBD__k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA0MiBTYWx0ZWRfXyw4jAXRQ0VaL
 FaVn1IvxZce5XNlDa0dN4ZXPie3diGS625zooMzQNZZHVMTgKHAMUEnoLbVcDNmtgdFZC2b9nB6
 3rwauAAXgP6scKnQjSpTYsvO8hJE48fhIxqTFQrrHB5cmNpYpfo4kKCRXFwa2nVDPTczK+qp+je
 1CPA1iSlrtLS3SJ9KaUB9xCRBbmcZBhoviO99ekenHT93jpounCRFRJz96a0kdaq/gQMArw4ZrL
 WH7FNyNlI9NqY0DNb1MNz+io1tL2M0p1EEeCbpu3k9rbVq10sBl2n3H8u3F7K4GqqyPdc9cVCmB
 jKbhYOW3BiIKmRgIRfbTWd/iBMIxEh1dth498cBpTgdIpcqKg+E8ay0Qz8Dy/lPlNaY6zHPmqWF
 crwH3GIBZhmzGTeTWWLwEqYRzO5P6fTWGmHcS0BRnKXk1VscirlsBHvh/dpFn1AiRBS1UDoo3qT
 jk/eSdte4poyAXjm23A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_034641_489746_5C5E7A5B 
X-CRM114-Status: GOOD (  17.17  )
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
netif_setup_tc(). However stmmac_set_ndev_tcs() has already zeroed
dev->prio_tc_map() through netdev_reset_tc(), so when netif_setup_tc()
runs every priority maps to TC0 and only the TC0 range is checked. A
layout whose TC0 range fits but where a later TC references a queue
beyond the new real_num_tx_queues is left with num_tc set and its TC map
pointing at queues that are no longer real, without any warning; only
when TC0 itself is out of range is the mapping disabled. The real
prio_tc_map is programmed later by the qdisc, after this call, so the
driver cannot rely on netif_setup_tc() to catch those cases.

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


