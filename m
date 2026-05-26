Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCB1CD6E43
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 13:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=heR+Rq57taQJntO27O6cewlt6NKto0RiHGK1KQcUICw=; b=UyU4aoL3qDcRA7lOxoEpgUZNja
	m0tEQkc/zhMgOMe1IqJN5NIVY85wK9WazuL2YIW27qpxmx9UYXAjtuzFt/irt1VNRm/6ANw/A4XAF
	G85iFDCI7FGQVPd4Jo3BhG2Ah7j0QpTDOD58n+KD/+mAGb2J1zHWms2TTmIGydpogrGQq6lJX6JnB
	UBMzzkDY0qotsVxPKypUI2+3awOrxapmp+oR15L0nxGyRlqui6QhHyKt3DmU4cDtNir7GssHbSRZf
	ffR9cdHEbGb6c/2+qjgstGBbl59+I2aD2G1M4K9ok2MBVAmeLxgL3oXZlqLmvodrtCxy+ti6BJLmx
	eTw9gQpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrZj-000000021It-2FOt;
	Tue, 26 May 2026 13:12:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrZV-0000000216d-0Oro
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 13:11:50 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QD40p43693560
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 13:11:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	heR+Rq57taQJntO27O6cewlt6NKto0RiHGK1KQcUICw=; b=LVQAAu3r4aDq6EIQ
	7bR/wma6Rra4RG5Yhk+pjblvuattCKxBpprJ/R9sku3jK0CMH5qP8Y2j+YlnWWmp
	E5WWGqXyM/G0tbrYFxQWkDrLMwOTACv0NCFDA6xEARmf0ba/Px6nSY+BjU5jZ73o
	h3FRnAnBsaMxpiFaXcywmGtnXDymY6wayor66LjQhEFZxTofhZrII04G7spZfvfH
	Wl14zwh8c3fISM21okivh5RHUzZOeH3ADHS08Tg6729xt9w7ipgWoMaqckON7+/L
	YDwQnnDvwSKhwNmhkg0sflb3sSpSbQvDYYdNQ3mZ9CaP772w+OVPCoM6EbTPbP88
	WLu2dA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edc2yg1uu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 13:11:48 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-639389de134so4264046137.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 06:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779801107; x=1780405907; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=heR+Rq57taQJntO27O6cewlt6NKto0RiHGK1KQcUICw=;
        b=AWb268imNrspNmKi6DdjaMr35Uwgg7OmdPC61BeGSLaSnLW2/bHOXfwWdhPO/tBOR/
         7RNdtoHMvgPsFavrYF5dujcXGqMSq0hQRzRx4qtGoJ355izkS18jRgAHp1kFDFmqbpKT
         H0CLOeefnN0xq75wPVMBE6Ywg7vVVOAreZWqkkA30hsoH5M0oqG2bn/vtdW+Sdi2yFNS
         F6kEzYZPMyITpD6mgqO7LsEvRZ1GVp8XZapmF2xDScYxPvV7HXERH35wQcBsIcpb9n6h
         siVwY0tfffSuJH3X6OBs30GWmtuutbX4YHltSYnMKY/vaFBaGj1+MeDkP5X8A5ha+JKx
         f+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779801107; x=1780405907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=heR+Rq57taQJntO27O6cewlt6NKto0RiHGK1KQcUICw=;
        b=GpmT36Lknh3DJSO1lGt2mYX5a8Yxw9gfr/cx+aDpb8T0l5AVqDGxpxkcCjptJrWjNs
         5xkqwbRdY4q7apT+VsKEwIrHbz3YcTxtFplXp9mxD6IVH4mu6Seteh1HcRQI6NJC019K
         oOsi0yrt/r1aGp0Os8lBYIRv1ko8KDqWB4NaJjtzKBSmCnmB9sRL8TZr7L+Jaheu0a2F
         PzgAbmWjx9EP+wrRrjKGoD4te+M42nucKauAUFxHdGAoer1k06mEgqm9W198yl34e4FX
         xiP6G6/rMKo1yNLWXE7CnqwkKkZfn7EQwrReYgmYZeeR/5662462oZGQ/Z/9UkmQYwHc
         vWeg==
X-Forwarded-Encrypted: i=1; AFNElJ8aLpt8O4IqIQ/pfbiDB/tjJW/a1W3MYQKSq3M9kvMlLxv6rs4JQGAc3Zo/neaS5xIxBnyKMjmzpFvjYkPpruh4@lists.infradead.org
X-Gm-Message-State: AOJu0YySVGzmMUsqfPXcMkQZre/Z0SQ+DdckGoPpPeAXaOpfJMtlJG7o
	sOMiKAqKfZPcijlNoZikQ0YMKFOwcArvNd4IiiP9IFYhul3nm/uKVJGisUnBRBlGIaUZhQrNSZU
	xf/Zyem4w80HoWkVeduTiJCb2O2hiCt+1Ke1ioxKrDWIDMOvY3/IXK8QU2ry+k7vdo9XedY7uPl
	ItLQ==
X-Gm-Gg: Acq92OEtO8K+Yk4+oNKxMu8U8uNIQdK8jnMkI7hfdc++N/UrwP3oW0GvmtpUfltpAn4
	NcoX2pwRBxydetIiPYVHO2MIg9Bf1c35ME46h3AMsPr3xMSR0fUg+g851JAn7U6WAwPFwi7UL/d
	NGfCk1n7EdExS5aQzc4pYmECXT5NdE5EM415sBq4pCNquJbiIJOAg5inpICz35cwtR3b/FrsLjX
	TzCuUddeO1YyYzcTNBmiPwBK+lALt1IV5uIE60Zieun/Hpk/UfCp3cB2ywjcspnROTQuxYKHPC3
	paGMNn6DGXSSbb9wnZBcFqKya5tW/XsMgMdPJSwCifDEidDtY8d4h/CIp275+uQOYnR3zO5bssw
	9ENfpMJQ5qm/zyPHdj8p5p6OLoT9vaVfhWpOQB3fr8vLTzGzpSO4=
X-Received: by 2002:a67:e7c9:0:b0:631:2dc6:2f5c with SMTP id ada2fe7eead31-67c646469c3mr7519350137.0.1779801107507;
        Tue, 26 May 2026 06:11:47 -0700 (PDT)
X-Received: by 2002:a67:e7c9:0:b0:631:2dc6:2f5c with SMTP id ada2fe7eead31-67c646469c3mr7519273137.0.1779801106934;
        Tue, 26 May 2026 06:11:46 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:15ba:1d70:65ea:9578])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5e484sm34259426f8f.30.2026.05.26.06.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:11:46 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 26 May 2026 15:11:02 +0200
Subject: [PATCH v19 14/14] crypto: qce - Communicate the base physical
 address to the dmaengine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-qcom-qce-cmd-descr-v19-14-08472fdcbf4a@oss.qualcomm.com>
References: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>
In-Reply-To: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1561;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wYb8hULMzww90PvO6ikCdSc5niQ+bjPp5Yt9PZ3KUhY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqFZvzxsEoOkXKERoBmJ+YvCvy9mO2/ZVwzzxGW
 SkD5+eOhNGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahWb8wAKCRAFnS7L/zaE
 w01UD/9Qd52H3q5VW0VL6E7KzqRa+d8K+Y+jYtcVKzVY5jLZ4SyZVi3tVBOS1l4w573XttjwpQ9
 bLmG5wgI9YwBOYEKor4l2B4NV5r1RTzWWYY8kkHZbY2pR5ot3GRBk41IHrFkKqJtLCUihkZyTM7
 BRvxv0cDH07RHmyCDeInlnwULWxqvKJtnval/yE78/Rv4z7XOflmK5RLA/3E8agAXFd2qK+EBSI
 HCHt+oBWXtmabclRSm1us0rmipHIsMJu/GXiKVd+Pwl/WF5N/cfq3SxN38ttYfXKzBv3RfSMB/v
 OTK+WGPkOU5rs3mWfHtvQfbArbPnV786v5NWONXLKaohikx5KNatccGpQ5aeQ/WuaNLreW5d0CX
 d+sKayWGvRazJP5WhH7iaw2NE3Ik5X3/AbDFd019x5fs8E0IeQX8CqZvFFQgx9GwYVKh7m8++xj
 eCxrHcDnnjwKXMqmRLUqLEDmxt96FpTmSrvubr3rO8WmtR2K1Rr0+il194IajYmFaXto42h10+P
 J99xrA80QX3GCp6IAOIQa528bkuLn//rMcbinl9x/FWfJN8PNWeyJLTgC+FViy52icXv9KcIaIR
 739qnqXKU4sjQtDrC9EjPhGwzEJJIkxAReeSaJ/bI50Kiy9PgYV3iUz+9wgtb1/+x6A5iHcgS97
 3TG2vGnfRcU3DHg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: mmh0Z-uWfju3h0xy57i6pKedA4xFZzA4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExNCBTYWx0ZWRfXw4QV8ZDwAqhv
 rKNZtvo+vqlRabrKWoK/cQRR5nWt+yoWEbFHpV6AhrD1C0MoTSm+AVo9vLSxh9WNTPM7+vQwWty
 SBrjsmbfYl52TdcfCWD46mx4YTYlPbOTvlkp/7vOF5RdWwpp+yAOa8mAA3slhCT8FAT3VFMgusk
 OsDljScr3JY/wld0TFITAgg+eQBhS7NlR4fNImvvcxnSAIiIgXrTA0+QZXLzJ2xs9lrBIGwqhEA
 kWhShr77YCuuSGv4gmHf17r4PrHxtkl9mZTSZojkTqtYjzS+0Ee4M5eXxAxiX/zzjXDoS8V9k8q
 DIWs8N2VyZSrlwflr9F09QhidlPH+ZJP/LrFeN7PUyvEOwuEpsBhkQqrwNbMn33dRTM6hvA+xB8
 2ysRgslTIE9wrLgs727+od8YNSPIez5PoZSbcoHuuBAKwK7vaoYEyR44urwfu85L1gi2OQLrezz
 tD3NHHwUgR7+VYfEaiw==
X-Authority-Analysis: v=2.4 cv=CYg4Irrl c=1 sm=1 tr=0 ts=6a159c14 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=TFgmKHP77OfOvYwKDSoA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: mmh0Z-uWfju3h0xy57i6pKedA4xFZzA4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_061149_158799_EAA83D16 
X-CRM114-Status: GOOD (  15.50  )
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

In order to communicate to the BAM DMA engine which address should be
used as a scratchpad for dummy writes related to BAM pipe locking,
fill out and attach the provided metadata struct to the descriptor.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 769cc71da90076be446cbdf7ec7db27f628fa2ac..349c1d9ce9a2f4628087aa4ed5f8dda2bd9eaedb 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -11,6 +11,7 @@
 
 #include "core.h"
 #include "dma.h"
+#include "regs-v5.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
 #define QCE_BAM_CMD_SGL_SIZE		128
@@ -41,6 +42,10 @@ void qce_clear_bam_transaction(struct qce_device *qce)
 
 int qce_submit_cmd_desc(struct qce_device *qce)
 {
+	struct bam_desc_metadata meta = {
+		.scratchpad_addr = qce->base_phys + REG_VERSION,
+		.direction = DMA_MEM_TO_DEV,
+	};
 	struct qce_desc_info *qce_desc = qce->dma.bam_txn->desc;
 	struct qce_bam_transaction *bam_txn = qce->dma.bam_txn;
 	struct dma_async_tx_descriptor *dma_desc;
@@ -60,6 +65,10 @@ int qce_submit_cmd_desc(struct qce_device *qce)
 		goto err_unmap_sg;
 	}
 
+	ret = dmaengine_desc_attach_metadata(dma_desc, &meta, sizeof(meta));
+	if (ret)
+		goto err_unmap_sg;
+
 	qce_desc->dma_desc = dma_desc;
 	cookie = dmaengine_submit(qce_desc->dma_desc);
 

-- 
2.47.3


