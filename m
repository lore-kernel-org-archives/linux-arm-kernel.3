Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F43C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 13:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rLqupxzjXmzvfUPsB8zm1Mahn5C+EFV39FmCjpXtCPE=; b=QxQMUyu3GrZDuhUtY8Kmit8SmV
	x0fxbEhlBvgziaS8OkRB3LsnRu0mEOjWVl31KnVFM2G4W5VqJNreyLBA7MUnYF7xvdDJXsD2oQLgF
	dWJWL1o69qNmV4m9F4R8goM6uqkxfGpFSDdFBHFHqyGlM32wguC5o+6uuOJFM4obRTAJ65Q6B+sY8
	na6aVobE8cTKNlMflemfDvJMu/H9EBkBnRoYoK84LbCPNbZidAdZMFDXgA7FGif17vp5PHNceZVQ2
	T4oHD9/90VstdSCIaJqj1HchqnF4p0yZeNlPkEMBRK6X7nPJwxSyokCUCDHwd8NSI+ssydsroJId7
	TglO+hOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6pix-00000009GWr-2YLl;
	Wed, 16 Sep 2026 13:30:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6pis-00000009GVi-0i9w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 13:30:53 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GCYYPx3636729
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 13:30:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rLqupxzjXmzvfUPsB8zm1M
	ahn5C+EFV39FmCjpXtCPE=; b=Gys/7DUhcmYcSGG/8N80nL+MQLYqGttWhw+nxa
	2x7fiei3Qw+Vo1JQ1SEXrqJhTsPsvAelZ3DDOEMnHlysX7fi/C2vQAzDNH3PN/eD
	h2+bw+u+qt2MIw2JVaGUd/66bUCvA1mN6yW/TPI87C/Ij8kHq479GC3fWgr5Yepd
	+xxcp9XRpLcWkTL7EZDkdZi5rck7D5Y7/BI/UO1RaQiVoEkqlWssYYPt2/rEHHIo
	SOhlxdnjW7CK3ILTvhrhmQ3TWVPC3ntMyLYWGvsS+RE8L66yfFyOnwAudKYXPVsv
	XL2XqhGnKd5J1TUml6qNg3GDW2pFQGAZmmv66uUWBq2WUdCg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqpu2sdm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 13:30:33 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78fa7ff1a44so1336083137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 06:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789565431; x=1790170231; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rLqupxzjXmzvfUPsB8zm1Mahn5C+EFV39FmCjpXtCPE=;
        b=FctzUJT8oaimKH2qALnCpS/BBmOHq9E/39jVzcj47ftchJUE2RsCN6O2rwySjFRtp/
         KYhWOkirSecugHul1/zZNWkGk2FbKZQbkAvK+q1CsOgbfStBFyNJ9/ZrAWxNppRqfGjG
         WxSBfHZQA6hy9gUJkru2KH6MuCUdm9doFjI3nkOshyWzpcMrxp6jp8kQh2e19iIcAQvA
         ZjeI14RogU5lDuoLA+RbzvNgX22kh3YxjuczfeDvthh3z9yOXXsRtnjeI+mmz+MMotAl
         7beaZwiwbOUQpMXxMUybnyG0HTTNO5+0Fzx8xpe9w/G58UoVaGZfbNXXjNbxrhX/AcOU
         vIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789565431; x=1790170231;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rLqupxzjXmzvfUPsB8zm1Mahn5C+EFV39FmCjpXtCPE=;
        b=dLhJxpyi6ZsNH5mqLNhwFU6onH+V154+z7KeMyOfVc4HqHts2KrCGH/7jGcGnEj9cC
         CNzr/RglUjwOZRWTAiW2RfL34ZeJOXq1GTMDq2Aso29qeURN4HO6CFu24lFg0ug0swoF
         /RqEBA898b0Ts68ZgoCBN/cNl5Yndp81D9fcj6GRz09/IdRR0XUyrLODW3hbUhaHFF0f
         8DOlI4s07GADEIQP5usZRD1a1UJuzelBiVIYpWko9Eb4fRGDNcqA7v9FqJy1F7z8p9qo
         O/fyy4O2mWh9M8keSeXQepk8YibGVGqDn23UWF0q4aAR/Oz+GiSpG9YB573OIrxojxKR
         F4VQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/sBmShPeNScTTzzH2uPAR8L6u6CBgl2c0Y95O/SqudlvL1zEM/IpKbHkBHxeFB9zkjE3I3S2xFqIW0PYC+Acr@lists.infradead.org
X-Gm-Message-State: AFuF++n3koqPh3irKY87R1cqN3B++pVkYf9IjgHa6RA4dnC5ZWSpPqyc
	uXy5+lKElLfho+HSPRptyJvnRj4rYz//HLzjU0rUjGQZrs61sBkidqM8evaB0mWVtftvfZ1GFBL
	Rm4i78zmfCcHZtQQPdmy5V6ODDLhzp5FWBFAOsSvJGO04xoZ0vwVmmyiiOMEedW3L/rKz+uUbUL
	1Rxtcgn2j7Rg==
X-Gm-Gg: AYBFou1Zb0QRHDBD8cWobJEOQqYjXdovIK9EtbwRX5EfBQ+hlEnG/InuR5gXnLgUt0V
	Ztc2KHkPyifJvSny5iH2kJ3PdnmFvFHNeLO+WQrsADm3X66RKnh2+AqkBWY/By6Oa4PLK3c81d/
	rtXXbG9SuUD4NVUbbL/9ajv2NvKmVx18qoxr2c7QeBp/N8in4Erxb1qt0azZ7EAvdL0qv4cNRh8
	u7FqhcTUSsSmsyp8+Pnm4pSTFY9JIlNaLTHxm8veaz3JfyBRmjxfryZULeiRzNRiM4MO9Gd08Sr
	f4m8aNTsGzfHv620Qf5Stl+O8n6pf8K07gCYVIC5U7BnuJ01vTLpmhExzi4gUY/WRj0Sh81aIjn
	7mWZ6Kl87u71eiA==
X-Received: by 2002:a05:6102:1495:b0:79d:dab6:66c5 with SMTP id ada2fe7eead31-7a024dcd3a9mr2963941137.2.1789565431479;
        Wed, 16 Sep 2026 06:30:31 -0700 (PDT)
X-Received: by 2002:a05:6102:1495:b0:79d:dab6:66c5 with SMTP id ada2fe7eead31-7a024dcd3a9mr2963772137.2.1789565430895;
        Wed, 16 Sep 2026 06:30:30 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de5b22b2sm136121366b.36.2026.09.16.06.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:30:30 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 15:30:13 +0200
Subject: [PATCH net] net: ethernet: mtk_eth_soc: unregister net_devices in
 case of probe failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-mtk_eth_soc-netdev-fix-v1-1-5dac50eb65b1@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MUQqDMBAFryL73YUkVqG9ipQg+lKX0kSSIIJ4d
 xc/5zFvDirIgkLv5qCMTYqkqGAfDU3LGL9gmZXJGdebl+35X38edfElTRxRZ2wcZOfRdQgtume
 AIT2vGTrf4YHUo895XppOe8ZtAAAA
X-Change-ID: 20260916-mtk_eth_soc-netdev-fix-a25ef3e54fe0
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Sean Wang <sean.wang@mediatek.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: KQRQiw8fnPf6rlxdfZoBDVyim5-bFqiK
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aaa99f9 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=q-zEs5IEZV_uNfpMk_gA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: KQRQiw8fnPf6rlxdfZoBDVyim5-bFqiK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE4MSBTYWx0ZWRfX9cRj1wnHztAt
 97Md0n3jEQDTTGk0+c9NLFFeZsPG1wCo4syrcQexrLKpnCcG+0oFoPqmJ156yOgLuYC+XX+C+Ut
 zsj4azG5mtjWiNeMFsE7+JEoBPJzyVrjMhil7314Ew/4edymLr6y3j3wLiuoL927AHeTGeG/nR+
 vF8k0keg32WFHkc96cZVcBnf6KV+j1IwoL/F+9U1zbMJasO0JoWUQKJ8yzH2AfbqSt8CZT6gfjD
 inpt6nBkosXg2tKXPtLRJDg5N0gieBVZ0r1nTwH/jkd4to/Cjn6MB9rQZbKogc3clbjar+lCMNS
 nbNYP20JACpQsvVhVC3mNnrBNqaMsE4ZCJNdJuxGXLxFTa9L0cVG1/1VxX58+XsvzdLC+tsIWwW
 0+PSm1Ni0DQUaNodiUPlcFRL4XSgnFja2gHV5xtWbcwKYgrqZvjBOO0SuKDbeXDGDgcNAHyNhXx
 YBJl8IFSNazvlcezLPg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE4MSBTYWx0ZWRfXzW6cYHEUiCj9
 teulOWuWXAri1mbqpXhfiAGTgZUkqSu3cqBMUlqbAHrbt7Qt8pdFURe1pCWRGTKKKu35RLDvSbd
 9RQIpJdH/PXPBzen6Mtmv5HyG78Id9I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160181
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_063050_301707_63E56FE2 
X-CRM114-Status: GOOD (  15.29  )
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

If register_netdev() fails for one of the MTK_MAX_DEVS devices in
mtk_probe(), the error path jumps to err_deinit_ppe, skipping
mtk_unreg_dev(). The previously registered net_devices are then freed by
mtk_free_dev() while still in NETREG_REGISTERED state, hitting the
BUG_ON(dev->reg_state != NETREG_UNREGISTERED).

Route the register_netdev() failure to err_unreg_netdev so the net_devices
registered so far are properly unregistered before being freed.

Fixes: 8a8a9e89f801 ("net: ethernet: mediatek: cleanup error path inside mtk_hw_init")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index fd7a49ae88d0..2ea5dfe85539 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -4509,6 +4509,10 @@ static int mtk_unreg_dev(struct mtk_eth *eth)
 		mac = netdev_priv(eth->netdev[i]);
 		if (MTK_HAS_CAPS(eth->soc->caps, MTK_QDMA))
 			unregister_netdevice_notifier(&mac->device_notifier);
+
+		if (eth->netdev[i]->reg_state != NETREG_REGISTERED)
+			continue;
+
 		unregister_netdev(eth->netdev[i]);
 	}
 
@@ -5344,7 +5348,7 @@ static int mtk_probe(struct platform_device *pdev)
 		err = register_netdev(eth->netdev[i]);
 		if (err) {
 			dev_err(eth->dev, "error bringing up device\n");
-			goto err_deinit_ppe;
+			goto err_unreg_netdev;
 		} else
 			netif_info(eth, probe, eth->netdev[i],
 				   "mediatek frame engine at 0x%08lx, irq %d\n",

---
base-commit: ceac0de741bfb47ca255eee075257b3bb31f0651
change-id: 20260916-mtk_eth_soc-netdev-fix-a25ef3e54fe0

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


