Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77F7C44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 10:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MsWDKH/w5P6MtO/VNux/FoMTI22L7P5oBEgCNW8qbYk=; b=ZbIgp8Bg7hAUJzrSYNhJd6vKRu
	fHJ81rb0LTFN9uCPXR4Bu3qii088wDSNG8Nt+XcXP4PYZ8t5H2Tlh9Sa4kaK76iaioP866LMhAJAh
	8deRJYZe0pq1nO2sY2ajh5qPgNm64HT4dAnCbT+UH3VSaOl7xh0SyHLomb3TkHzAv3dTpeaftkdpq
	Pl2T1gayngAQlpCH2rZq2stINZYF4wN7q0JEIL0vMdpMPiZHNaSYgwv6WZcx+wJS7/QN5nahdHl18
	iaGpACKZBgcV7cIEcDI7VxIcdftLWt+bMcTCF0FFyprKF87Q92hziQ6eKynvcPkevwQZDx0g5n+7M
	+yBFLU5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8om-0000000EHrl-08cY;
	Mon, 29 Jun 2026 10:02:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8oP-0000000EHY1-23tW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 10:01:58 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T72lVm2164230
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 10:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MsWDKH/w5P6MtO/VNux/FoMTI22L7P5oBEgCNW8qbYk=; b=f1LnJ0MluvQzqb/A
	8FGWGtZDObgYrOjIacLNIcJMDS0cd8gYOUSBrqtDae6dAJXxTAZfyDoQhE83wygQ
	4hHRphUM3dLyM+PcEMscjg0TJolFwvtYLq/6ll5RvIRkLG2HxZpPYtemCazgDl9b
	5wK38mef8N1C78X6AEa4qSBhqHl2vauAOxVW5HnmhZWaeZSfO3YEEYAY4cPIQ+SO
	miy7XOu+URqXcLu4jLutc8zmZ+aXLty67WqOPgHW6M8mqeREhuMwqwWQvYo3NNBa
	3XkWEJ+Wu1d4uD5RNaY2lwHBGpdxf3hWS/EHLkpnBPJFIFu+rQzq6AGnUJMe7611
	fOpxLw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kyjgr0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 10:01:56 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-73850dfc198so477159137.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 03:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727315; x=1783332115; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MsWDKH/w5P6MtO/VNux/FoMTI22L7P5oBEgCNW8qbYk=;
        b=c29BEXNLvNP5bg8XA7sHDpmZ7Hwvez01TW7s7zkyn5ZH8STdGaANUJ+Yc7p5Rw5CmN
         KZ4jbMN6C0laB497X0JSoAAE8MGw97ZPkk7cYLEHqwQ9U3MRdjUTPAFONN3qOsSaGg1x
         /iWrjWOze84/69GXidgLF7EkcHdGobVtkeWbSrpfvu81tzT+BCauqU2QT7Q5WhzTJS65
         OAOm4gtO68S7+ZQk5bQgYi7Zg8nxIQ4UiTw9TM45ibkBuYLLBjeoDvMOrmqFFiY9qp4v
         XLy8geomZJOCHeq0hpo2jyqeIhJH0rN3c/5dlxJNeevIlJM+SPqbMkaAEPRhp2YOqVnX
         Hu+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727315; x=1783332115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MsWDKH/w5P6MtO/VNux/FoMTI22L7P5oBEgCNW8qbYk=;
        b=owRXaQypewEuKOWMHAofmr2zCuMZz9hBz/33qbyE7lXPK2s2QmfAJVnY2zNhO/0Xp9
         pfMmAdB2vSWlsGO8IVL7lO8InX72oaPOCuzwL9Jap9dalwdyaLwXhx0K6Oqs/i6W3F4U
         pykFx12nd/D9v51aqZ3OONWX+G4eoIHLFNm4ZFefPg5KbA7s52M/KTNoOas1OtT0p3b8
         +Eb89ufmn97umjD5Pe9lyuErAqDRrXFuNwNQJxkKoySRe9MXVtOTORJrBcBntzMzK6gd
         mbMTJuy+6fWmXD+3Iv827vCjnNqtkaDUmOtZpViYoU9lX1UiHO1Q3aaeiPDiCFsQllQs
         iwIQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrg5dctpa9m0uz7tHteoNmvdFa8cypXsRoNxQuGUqfClG77UJ1QfmIoNrlXV1h4w8NcyZPRt3TafAnimYnlmGrx@lists.infradead.org
X-Gm-Message-State: AOJu0YxLvbZPdjPYzcKqFvYI+xwp4vgPNn+1g9gPWhuqTmLYFGkT+tw1
	OTDAdgCwau1TgNUOqaiyewCLegNH/K3oYCtbdofMyCQCXGea/HtlhbrKJJKVYITAUtkUFiR+sFM
	qwcbOOpUGRDdy57tiX9mFT7AchQYdteowcHqyc5BFX8Rlpx4M70cYBlWvcz2j9Q9sMxmUZ9cd+4
	Tdlg==
X-Gm-Gg: AfdE7clMJJ3DOUM2yPQg2L87Ds7LMJeSv6VDZWwdOtN8LlELoh6rEc0aIoPBUuHkbjm
	RetIX1PB15xH65UGgvEklLzZzA4kXsdXRAdO11q6Ceg7KqSF5BUeQ4r4L2H7QLnsFDNNhvHx0Uk
	oKHpqa+vnyLXfdOLH0Bff7PobxPk9ZdPTxQdd0ax4KUYMXtwlwI/0xFKf5Hrt8M3Oyws6Qy+X8b
	15Hip0VdnV3UmM85WbCZTmK6Bht/UxLOIcr0PpYAh4nfspFWCPD8N1YDdW/+uA3qep25kohI7su
	6R7eC6y7Orol3PzdM/04oXiRrE9xolfre0imSzeduNkK2XUH4+EKzD/t5Ip5AbtIPjW9CHfqwV0
	ILcZpuRgXBmk7MiiW06Xahmuq3uoVAfwn7U0DzAtA
X-Received: by 2002:a05:6102:2927:b0:738:9c30:2bab with SMTP id ada2fe7eead31-7389c30333emr1034266137.24.1782727315240;
        Mon, 29 Jun 2026 03:01:55 -0700 (PDT)
X-Received: by 2002:a05:6102:2927:b0:738:9c30:2bab with SMTP id ada2fe7eead31-7389c30333emr1034174137.24.1782727314682;
        Mon, 29 Jun 2026 03:01:54 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4705f8ea729sm24729405f8f.0.2026.06.29.03.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:01:53 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:01:16 +0200
Subject: [PATCH v20 14/14] crypto: qce - Communicate the base physical
 address to the dmaengine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-qcom-qce-cmd-descr-v20-14-56f67da84c05@oss.qualcomm.com>
References: <20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com>
In-Reply-To: <20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1859;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=xewtmBe7Tjse/Oov1uLM7I+VZpNX0SB8ljw+4HhCUeA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQkJztJW4956nVEX9MjvwMkNGVeY7bWyWSsjEL
 JlDk0vhZGaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJCcwAKCRAFnS7L/zaE
 w8LID/92VK6MtF4PX0Ay8O+iWvgPKwVfNgK9jA1tCP8Qd+Gh9YKfJjpq6CAhVvDnvbe18q/azgf
 hJHbJlhuPzXqYSETS56gA2/l/9+abNM9jLQKvK61ZTwUm9TXdVrWtuByl9244yf1NyP74p4C31t
 k0wv8ve08/Y1PgmWrFamnfYLHCZUgWjsB49qpNOqaM2c7kKZlpSW+K7jItm9dcdbEcGWrmF3+UA
 PABxkswczFoV5tXRN3uxgW28AEuplE8AMc8qKubRbTdYE+4SSoMdmKDkhiwOmYVTWplzJPErnuv
 9Kfl0khAZDvs+R6M4mh2Cm+PxxrbwJGxxbbvV4zqBqNo+tqE00kH4nvuMi5DUZCs3oqkXCqsDUt
 35FFBaQzYVCD9ArHQP3hIF18Pqg//htVnMFk44+/uPWoi7zLmtjzdP8qZ6F4LcuKoaVqs+iXbVS
 VsI4jCP9BSJ2yLG6O7Qwg1k6BbXv0DdrzdwCDkKmJw4Qp/8uA0QhSndqnbTl3P370E0QtvC9j1V
 MMmqD5LAZqlXgfDYnHgRmtr6Ipcq0eBPmmNPOMoJ6bgZxLCO/O0bT/TqYucw57zhs5UPUSoSiUa
 cGNQAkja49h+5Bziwx+6nJHCetoNg+WLfJospblWNsZlnZWkwPmPEzwJAVV+e5YFpI/ZyQVvqh8
 39N0QNMbtzQFong==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 0tbFI9IZ8ZtSFDjrorUvCIyUVyoT0dwV
X-Proofpoint-ORIG-GUID: 0tbFI9IZ8ZtSFDjrorUvCIyUVyoT0dwV
X-Authority-Analysis: v=2.4 cv=Ftk1OWrq c=1 sm=1 tr=0 ts=6a424294 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=TFgmKHP77OfOvYwKDSoA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX4QwBexDlO52i
 chBHuhLbmejGZtxlud/o3kbzpgxlqfMQLrdkgmAJlRIfmW7urlmPNR+cn0V3bBeme/oAkcbGPXF
 2AHyK2gqH6PB569/GxyEYSyrw5ks+8k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfXwPgF2aZkGze7
 awnYlcCDMK82FDsaNVDwT/8I8v02+9ItwF/wUVKBwfXm3c1WSWjrrDaGNE8HwGxDnHYHJkGLoEb
 A1Ks1nIBZgPmA6a1uRTO/mwuWzoYW4eS0eWzH6gsQ+4/lOd3Rggjm1A6k7SlKGxkokTm4uuugIJ
 pX7ji0FJwQTA3TotZuHhmS8TDGyFgaU7s/LGZUc9UiQ2jUklETf8djyS05xbklmAU0Y75hsOWBC
 Y1jgunrJi7FkZ1ylbR56AeEJV2NPO/KH1QX2aG2Ymd0Krq3bhi2EbkUf6gRIeZ+1LBHy08Tk6MI
 Pv3ln36ePJ7QJNGoLD+Yy59HEk2rVLmByx1Vn3G4bCoa3RpYRrDwuw8nL/SGgDZm22O4ztX66dr
 jvtc0YwIu+Wr1rFvWpkY1YbWVbddekhJVC7A+T68dRFmkh79PiHCxIp8uE7DErUsRpPEjV2bKNC
 Yb8j8uJVmrMvkXVsxaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_030157_709188_C65FA947 
X-CRM114-Status: GOOD (  16.56  )
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
 drivers/crypto/qce/dma.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 1b43c56503334154be4b8000e5a9330b2005cb64..6410f8dc5bcf517223c768a3e8f87af245076c84 100644
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
@@ -60,15 +65,21 @@ int qce_submit_cmd_desc(struct qce_device *qce)
 		goto err_unmap_sg;
 	}
 
+	ret = dmaengine_desc_attach_metadata(dma_desc, &meta, sizeof(meta));
+	if (ret)
+		goto err_free_desc;
+
 	qce_desc->dma_desc = dma_desc;
 	cookie = dmaengine_submit(qce_desc->dma_desc);
 
 	ret = dma_submit_error(cookie);
 	if (ret)
-		goto err_unmap_sg;
+		goto err_free_desc;
 
 	return 0;
 
+err_free_desc:
+	dmaengine_desc_free(dma_desc);
 err_unmap_sg:
 	dma_unmap_sg(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt, DMA_TO_DEVICE);
 	return ret;

-- 
2.47.3


