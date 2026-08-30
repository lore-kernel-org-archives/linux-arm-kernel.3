Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA12C61DE1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 08:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M/Nytepkmt/ZP2rVkdCu7doVcdz2bZqfv3EnSqqfb8w=; b=XyTcUM2JAI0dyElWwofMMsPo0X
	hOQCxx7NWxFqOwM/Mj0VpxCOrqOQb+z0yYHiqQKewvI6wAyOo3+FZoCJMonPZuHO8xudPbbs4I3wb
	+hE1pmwKmX8SY3VXOKo+4IFPFistd99jNsoFIItQJx9hnwCZK9kBSQEb6levfAFK1ynZYtozj5J0+
	6EDhSOZQW9FTXFUWa2CwyHSzPPQ6FQHuBIRHeNTl9N3ot9idrSACus97jTGRgGDK08c0Cr6fb/Gzq
	hXQYeGV/aaT2s/DzJ7q6thkGYZS0oqWmZgDiHH6FqzAFGNP7/yByP6CRZjUUs/XJSkzz4kn3uvQRL
	pqVv14gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0b64-00000007bIY-1G3u;
	Sun, 30 Aug 2026 08:41:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0b61-00000007bID-3LVg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 08:40:59 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67U5vaE33875141
	for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 08:40:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=M/Nytepkmt/ZP2rVkdCu7doVcdz2bZqfv3E
	nSqqfb8w=; b=S5IhCqd/1yiomJiHtcsSCPVCmHL/DPZNP3Afc88iJsUa4NgF2+H
	+u6Vvasdq3BRQ7Qznqvk8FONNef7TuMqgNfkx6qbWSIDUm0kRgdIBEXZQR5cWxuc
	5ZXl9nVNrv3H5EZEHgS8OdEMPzuglitZ01eHLTEHuZk9qvjtkK5YJTrlW+wyDsLU
	7ioH9VrIstWJRr2OmAI/bBMlzJNq6Gf3nXEswresLi5y+1ks02H3qw/cxt9pdbbr
	34YICvvBsM7o2reA9bngHgAjmWYgr5lXU6VkOgn6+n9Q+NwKFBNuMUqe39Gi2fZu
	Ar2z0lmKXlxznMXO0fnwsy3soIExWRxUbaQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqfb2p8v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 08:40:56 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90cc915d1d9so34012796d6.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 01:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788079256; x=1788684056; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M/Nytepkmt/ZP2rVkdCu7doVcdz2bZqfv3EnSqqfb8w=;
        b=ixJkD+2FrbvHYzpnrPKUID7qckWGaptMi65iNHMhoEsvJiHhvmq97Z4fPqlgGgw9g4
         PyWuprBlMlsM7X5HU7jmBB26UFR4UV9IeD06B3ZhvA1A6JE6F7beHAtBYstWqkG307xJ
         pMIP5ec/wHXVcjbFkNmjrKaHFBSqAwJK+mTwv1ztJQJwyVstaMIs59wiFx2gjtkVZ4Nd
         RCJFamrPudHNpcSI/JIpZLU9Q6JYfsXmfC0b23KtCvPunduvW8bCmJJLDTTWFSvDcF3n
         QBXmkUaVYYlqgnZG3pyc2qO1qsgUpkTroVDt+E0QrlDd8zf7YCRgzYNEbiMCe8k78jgi
         FeAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788079256; x=1788684056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M/Nytepkmt/ZP2rVkdCu7doVcdz2bZqfv3EnSqqfb8w=;
        b=A837HgMFffPO1xx/TEy+JrU9TyuFxBHq8RLwol+ULs0hITNrcs230LH/CRfJTcMR4Z
         wJGT3M2QQph8TRPDO1pZLCUlwCTNITbRTttxd1lDIk8ptMjkdSyN4AtXhfQ5iu2bZYOo
         LtcmsYso52vBVtaHxpmpYsZ4OmVHAdGKEW4j8PPDUqU6hSMsUbDpZKUqYVuZW//XEK96
         oXeN4LShX8orKIGlcv2JMLxINYEvlxcyL9nRR34DwRf/brxpQ4fCAb7EzxRZo2UhlJzg
         6p+Qvhb2TP/WGtkK9CSJWWCHZ7ZIvxfhpGdQAa66X/AYbj0QKV60bgy41Q8/KXWxkZ9h
         J5yg==
X-Forwarded-Encrypted: i=1; AHgh+RqfqJWBBMvRDJzHvd5qdPNLxtOC2v2pSdOYfowXNg4oscsAa9j021aUi81wmqnSKFFskqQZIPU4A3FVaZBZcjjU@lists.infradead.org
X-Gm-Message-State: AFuF++lNJHtQUmi9kj6nbg/urkF/Aq1YZHnWNMiOKIIbETPxsGRl3Bvn
	nyfpHzyNfjtYs17tkbQE2dMDTyh2c+PM3hTyozARVSfh/VVureqg60nE78cE0jF4PaFP+Pc9TLH
	+cqxNNIk6AeQe4HykHU7k7t7Y5zFqeWKSpT2Vv7zVWDD1MvTRzKkl/hVdplBHNYbR+XpcIxGhHu
	CRmQ==
X-Gm-Gg: AR+sD11TLb4Z1SLpx45eFTA70sKTTGrNHSn+bhOvbHfYUZTvio8AIxTkjvJSPj9Fci4
	ufXmoATtcFV4wbgk65gdWYTI1HtSpbirHwzE1aWwlbTEqHkWiJFMl8dXPDHRa4fbOIgFBvS+7ob
	zC+kC3AkmMbjwlagaMnz0KXZQow1Xev/TT4df2UqwpHFbOf8FA8czmNj6BM3hhgaKzag7JaLdqN
	MeC9JdDLT+0VaSNZxNckRaqisMZON0573LKsTr2HSgMVEhgjRIl/8jlVmVjXLr7D5TjUQQk4sp8
	Uz65/xhu5+lhgayb3FXCw/2bw3oHcwXdEXJQARdFYMMBxy3livxQqLNspSdA9ipHltRTnQ9CgEF
	ImEPZzQSVzn69J18=
X-Received: by 2002:a05:622a:2588:b0:52f:a178:4c59 with SMTP id d75a77b69052e-52fb9657401mr225644651cf.37.1788079255893;
        Sun, 30 Aug 2026 01:40:55 -0700 (PDT)
X-Received: by 2002:a05:622a:2588:b0:52f:a178:4c59 with SMTP id d75a77b69052e-52fb9657401mr225644401cf.37.1788079255534;
        Sun, 30 Aug 2026 01:40:55 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b963c3c0asm314870005e9.10.2026.08.30.01.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 01:40:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2] ASoC: dt-bindings: imx-audmux: Replace tabs with spaces
Date: Sun, 30 Aug 2026 10:40:47 +0200
Message-ID: <20260830084046.14679-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1385; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=xstTPquafbNGlKwlQsKZ7eJq5FPgU6WMbUCfJXuADdE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqk+yOzvIYQOZZBzBQj6W1Qw9AqvmkZDdJ/+c6L
 pnuewph0cuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapPsjgAKCRDBN2bmhouD
 1ytkD/4qT4rdd3yN7yDIh42thkTo+Unwa2sFG31D9cU3y7Mjm2p5Xq0Dg3hI7zzGFyqWeKDZQLd
 ow5ABRV1PGgwuEic9y2reK+Okt+dWElZBc/09FeWtcJY0hRcUSVZpTqpdSOCPfccLZvWBH44Xko
 tbK6f7710D+MNASE4jDx0xIyqEdMhSNwiJscYiKUKucg1MOSufYlRYa3sj4E93IWZZF3SOWT5ga
 r1jT70VNPX7FiVOTquQoanidMyYoZDJvqjx+3MpoDPN79lSK2w1HciOsoD32E6nGW9utrc0kJlx
 OPbwVKT7gISsR4j4nKtI1PtSY6H3Z76oke4iG+QYkqyESDzfjCFFWhOKK7Mg1FIWsgWTVgAfO0i
 Kv4P7rzu3/MlT0CdTzBVG7g0mOLLMWfD0FcBypJ45JUxJtdXyEbDVGTf/kJdBT/p5qTUiQKl/wO
 W5ysEOZiE150cZWvpfrjsobpzeGHXCxpusk9BqLgHLQr5OUlDh1KDV80IhMR2NJtjdxpEubuP2s
 mBsBXlHJFPCOmiRRwGhs6gwUFzAZBL8ie+o7V5DRnMaztcrN0wPdreMDLCDXheljmOoLfZyhq51
 O4gPbISfvBcyvAB6QfgVByG7Nm+kk1mB0aC7AXVsxEGWkGSM3BikOf+IC3vXPkbgmE6GVca9zN6 jbEY2GFGR+K9sHg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDA3MSBTYWx0ZWRfX09lSabnvJgtQ
 9V+rgR9n35SHToe/AZh9QhJkqfuMETALujLLtcUKwlQJ30GR3sqQtWBjJ+c4ayP1cxBzzAwo3rM
 cxmcpkBtD4pvaEXuaVS9UOLzP8lukLkfpczGYuT9JUTYTX3IGqqdZc9F0ytqVNPwXwLVuLAvnzk
 x1qEODKqbvKTHFwHh1Ck0U+zze5zoYUT6Q0G8elKUXK9XYD+VtI2E+D1vCxRnB7njEan/SKdzHc
 QF9nvNOu/TqSM2QbshjAlnq+qz7OGGP41UCqHyZ5Xf84AsH91YG2oZxHLHqB07zgDq7/81hX7lr
 X2CRmE5G9gTzDJWhbRTEFJhhlAUD0Knql3W5j0u9aoOIU9Od7uVuxSmg7yaA7ihcIa2kYeiT/YW
 IExl50xLQMEnrIWUbH67W1dP3ZDfzxznXqNGeBseIYdIcw0eJu0U/mIQL2b0xBIbH7HC0PgfODW
 qfTtDfHfOMFtVGqexgA==
X-Proofpoint-ORIG-GUID: qNUO0HAjl8KgCvPTnoflDuLUZdz60RGB
X-Proofpoint-GUID: qNUO0HAjl8KgCvPTnoflDuLUZdz60RGB
X-Authority-Analysis: v=2.4 cv=Q77iJY2a c=1 sm=1 tr=0 ts=6a93ec98 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=i9mLyMywaSABm-nTGLoA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDA3MSBTYWx0ZWRfX/+UZs0HXYMte
 2LW8H+4rTXoi5vU8YNPq04O3Fvs+C+nD85h7viDknrGqMMlUysxycABWRP7GpqZd3N2D0j2TBuc
 ftqlkCx/djMn+LMZ6qT86zWS+K+LYqg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_014057_970302_06136DEE 
X-CRM114-Status: GOOD (  12.93  )
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

YAML files do not use tabs, even within the values in DTS.  No
functional change, although dt-style-check will warn about it
("[tab-in-yaml] tab character not allowed in DTS example").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Correct logic in commit msg spaces->tabs
---
 Documentation/devicetree/bindings/sound/imx-audmux.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/imx-audmux.yaml b/Documentation/devicetree/bindings/sound/imx-audmux.yaml
index dab45c310670..501af1add3c1 100644
--- a/Documentation/devicetree/bindings/sound/imx-audmux.yaml
+++ b/Documentation/devicetree/bindings/sound/imx-audmux.yaml
@@ -101,10 +101,10 @@ examples:
         mux-ssi1 {
             fsl,audmux-port = <0>;
             fsl,port-config = <
-                IMX_AUDMUX_V2_PTCR_SYN		0
-                IMX_AUDMUX_V2_PTCR_TFSEL(2)	0
-                IMX_AUDMUX_V2_PTCR_TCSEL(2)	0
-                IMX_AUDMUX_V2_PTCR_TFSDIR	0
+                IMX_AUDMUX_V2_PTCR_SYN      0
+                IMX_AUDMUX_V2_PTCR_TFSEL(2) 0
+                IMX_AUDMUX_V2_PTCR_TCSEL(2) 0
+                IMX_AUDMUX_V2_PTCR_TFSDIR   0
                 IMX_AUDMUX_V2_PTCR_TCLKDIR      IMX_AUDMUX_V2_PDCR_RXDSEL(2)
               >;
         };
-- 
2.53.0


