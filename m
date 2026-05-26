Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4967ECD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 13:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oCU3VsxGEdjPBCoGd41WaHJI7aWQRWqjQ950S1o2Zrs=; b=VE7KoMtpWGufnQdVombMO+TfhH
	8jkOn5GGMiaLdEhSyRNZcEebnilAmCCJqzZq3k9QBvT7sJJofxxDMWrFbHK3MaFTfZs8KkJNHAbFx
	sZWWvcWVpk8wuqaGOy2pz2kqrSSZ8InD5R31NOSVk5zLWbSFwRvc9ISq4gWOGW66jRKkWOr1r0ham
	+Sc9We0du7H/QmJ8FURRqffd0PhC+H030ryILKXV07MCa4I6DgNUfbQoTuWwAHfkU58SZKhtaMDYG
	aEy+grM0foFAbtZYXbv7szmNEWrgO2oDYBum3RAD7M8ujDgKBMbioNK02j20xH17U8cwlqC+ygZyn
	lqGAGf5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrZK-000000020vt-08eH;
	Tue, 26 May 2026 13:11:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrZF-000000020sV-0q7E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 13:11:35 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QD407V3693580
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 13:11:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oCU3VsxGEdjPBCoGd41WaHJI7aWQRWqjQ950S1o2Zrs=; b=AjUmkbJnp6qVhCB5
	pXdlhv+8zhgzNwFDRak5tSyJLkzurACylamJplV2mXDU/2ww0RbMmL+1K3b5Acft
	nGasV1nf7KTQ4wW3J5SYJVlaSjk9kuREYeilbukArfp+KjbgGAVAQMkczXRUXi7A
	sF6WvCcomWBqDlpXH/J89V5y5L1HK99+YwMjWFtYBI3GReXRuikGiEwWswkYLVoh
	KmWEElPPSVm1UyyoAowMf0YUDHz/FGmq/+abbrlAXfNMbl9E5WwMrjq+3/WSlIp7
	mtNfEq0vtPnCpkkVmzSeUkXOh7v3F0miZFAh20/EytaHnNnF0/jDIv9jR9R6bdS3
	DS8ORA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edc2yg1sp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 13:11:32 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6313385ca1bso4687896137.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 06:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779801092; x=1780405892; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oCU3VsxGEdjPBCoGd41WaHJI7aWQRWqjQ950S1o2Zrs=;
        b=aHxTpSVd1+A2pGa4SApC+H3qartYuCqeH13iwHYMpuMAqdRiodIzcDrtj7FxVZkod9
         WOWSKEiKVYLF+ri+Az2vDSWbFopexU6q6VXCvl0/NwcdujH94pJ0ECV4qogxOCOCf2t5
         nrWjr51GNJNSpfXJy+YQdHjzuW8+sg4YzYDZgV2UTw/2h7cO5SQKBCwQ+VZ0bWQmfhAQ
         MZ7QettmdCmaVudyFVmxRfcpeXvKnVvBaqFwHRTqw5iprUMkilkDf1EvfV+SmSqamYW4
         nz333v68gzfYOyYXVG199FGmUWPhe5qA9hktBfP+OuzNlKOg+57cetWOVJGle8+sidVZ
         Sd7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779801092; x=1780405892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oCU3VsxGEdjPBCoGd41WaHJI7aWQRWqjQ950S1o2Zrs=;
        b=fRypW45t1Du6L0y9mrjSMYEXcn0rIEKK/TQQvxwnhhoyuY3Cm6wbJsrRoXyxkdUh4b
         2rPGCAxzAovIkcdqa7USS1JC+q8THiButWkY8bG5v/lS8P9n26izEpiaYBtRwfeqKZSe
         RuBkQpVUNrf3B+DohEzOVLxiLlnn2zaVK9H0SENsLSwE/BS+8FrEBxbiFWI1xa3U446V
         NT2aOC2RUXdsVTxDCQ6EwFw9Y2sTOKfQzsQ7SLU79hSBxMi99FAZGz5pTBandcCoKdwd
         +gna+0Lt1oBcsgP2hfI0oZk+epN+CmPUdbgXcWJpa1uwPmkqQ2piRRJDo+1hxRGNQXkg
         0CyQ==
X-Forwarded-Encrypted: i=1; AFNElJ+19npHrYN3kB1+jBWM5N60PgWft7P0prjObFyEKDl57QPrXJEUTGSQRLvl/Mkap8dl7OHsNmwSDd8IYzmttWEQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwIAr2u5NwtWEUKuq42R/IxXZwg0R6ED1+q6vckcK2k25GMqvD1
	LS3ASeI8BvkbESPU+8uVC78U7MPC1H9GKNOxlQI4J+oOWx6n+7KkgecnLQ5DtyVEh6OhladjsXn
	3E9ZXMWOhQ2CZ/f8TEKL6MH5IRynaZQPmKNXQgnVItOEP73/tLs7cYxe/XdDcE+SlW6Yvj5pnmH
	RBgg==
X-Gm-Gg: Acq92OEjnu5TvJmtw7bJnC4qy03RWhMecjQIitQUpHJBW4yNg3Zp26gEL8MDQPf8UI0
	jqREKCGV8k4O/Iup0BoUQOm9H/frkGt5pmUkXN9rLx+6tpl8qVm4AYhlbGqVxaE0ahB75DZy4V9
	JLRDMycqNQicb4w4Bwe6slWFPVnG92N2FZm/9Ioi6tcR2e0Kw8AqF6jdEjNNKoquyohmWRbhnE2
	RM/0Q5dirrOH+QZUXNlgRedVypUADCmoAyj6/zIqWmAPutOBQctydrvwl0jLcxNrwaV37OYiv5A
	jhml9HKg4gh/eYd1cMHZkrhVxuK1/qfsgDdlJ/UvFZ/Er29Nfwk3VJNIxEphwf6f8SK2UqOpqvY
	FHWfiavxrS/gOJC/lcMANJ36y9kxu1BOKIbs1qdWunAFhcHcMjOc=
X-Received: by 2002:a05:6102:c07:b0:631:2f82:c3ce with SMTP id ada2fe7eead31-67c77ff1283mr7782048137.10.1779801091381;
        Tue, 26 May 2026 06:11:31 -0700 (PDT)
X-Received: by 2002:a05:6102:c07:b0:631:2f82:c3ce with SMTP id ada2fe7eead31-67c77ff1283mr7781951137.10.1779801090577;
        Tue, 26 May 2026 06:11:30 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:15ba:1d70:65ea:9578])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5e484sm34259426f8f.30.2026.05.26.06.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:11:29 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 26 May 2026 15:10:54 +0200
Subject: [PATCH v19 06/14] dmaengine: qcom: bam_dma: add support for BAM
 locking
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-qcom-qce-cmd-descr-v19-6-08472fdcbf4a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9514;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gwfKXaVEiVIBtazssjucoj3rS7WWAo2eUOnSd/TMZv0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqFZvtj4BqUHDrNP0sdg0saKBsOM2MRyh34m6Dy
 EFU7o3qF+uJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahWb7QAKCRAFnS7L/zaE
 wz+cEACZYnUIzTy6zDUIO7SgdoD6QjR30C/Nxhwa8F8J0L+2NH8N1aqvbwZytTgSi55IhlnprAf
 kytBTd8ZYRi0Fl4z0ULnsTtaJujaAewSZZ9WitZuDbOxuw5OsHySSmBr3QY7QJpGgxKyycGA05D
 kY04xLeExmzTF7AaFcYRit8Aq12GHDi7fiqSH8dwkcLD+18xgpNnL40BkaN4Ye4GmSRQOXre17s
 ebekpT2BSJCLjnJypO1l2Jdg9s1mbOZxqto9SIVd5X2v4LNFVu+/XZk2Ot72227MJFs702NeXau
 kfTzswEcb4grbIj4JUOpYyslutAuCqJZjBT0pQOPD+9VhPGl/+flp76E8PJWB2SV54MV8V0mpdp
 gHPAMG0Q7Elg8GKZwISvbQG4C/VHSSo/azPv0ooqgXipmZ+90r91Lw3i4f0+UoZQX6VIvxd0Se1
 xuilqeV5PDpVnWIDDzEc9/LswhTeAkjzp7wzB4Ge30T4uv5afK7VeTh3I4aGqKzC8ekUQaw8G0/
 0Mj0qdsvtrA5KIHEyfGBc0XI7ItVjE6E4xhl5C9ecjiGyieuKUgaXESVDZUtjSNadI9Ov8UKyY4
 14v526wQn/c4qN+QQ8O0Qr+0B023fGbosntlXvJq4oYI0dUre8yBtFEtevUi9Oy73rB4lnnFXen
 bHrMyUSJg+fnpog==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: f_VkXsaKPpFAUY_qbI7w849aF4KEwXhE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExNCBTYWx0ZWRfX36GFguOn8hgs
 nXWYIPTXpPbkbP979rMj2amQb3RTofZtZYX6UA0Iwgr8liGIfb1ECD6G8qad+j3lunm4fosl+IY
 zpqZlPEPVDOPbmE7Q0K1KRtHlMRVSZ2mQIm4JIqVB9Lw4QlThJAOeafV8UjhNNto/hZ1zFTWVmt
 5jhcfws1W5XCHntL3A+xaOLigsJewdOpDm7Bl2zV6jWcaXrfw6xKdSDecdSuBntulsrUJR7dZVo
 CUqx0AOcTyWaiCmYXPVWGh1LitMotYGIHC4JXSIsZvxxkKW4HK072mdygLBYTY54TJSXj3+AUBT
 B/KrPp05sssGZETL8SRgEEyr/CiBZPFdeyLEAZoV21DVmddljS2ZGhVz/dD3L9McpRFlczOMytK
 ZXXsAtUWienRTX8xeb+L4Agoa7spR/fK+8KVcNHQiGE/B33qZW2+EfeW4UktXR4ajafbih0726Y
 JDaD6P79+NJuI/d3j/g==
X-Authority-Analysis: v=2.4 cv=CYg4Irrl c=1 sm=1 tr=0 ts=6a159c04 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=j-cXwOq41x9PnjJ4jooA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: f_VkXsaKPpFAUY_qbI7w849aF4KEwXhE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_061134_041421_8197CB23 
X-CRM114-Status: GOOD (  26.13  )
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

Add support for BAM pipe locking. To that end: when starting DMA on an RX
channel - prepend the existing queue of issued descriptors with an
additional "dummy" command descriptor with the LOCK bit set. Once the
transaction is done (no more issued descriptors), issue one more dummy
descriptor with the UNLOCK bit.

We *must* wait until the transaction is signalled as done because we
must not perform any writes into config registers while the engine is
busy.

The dummy writes must be issued into a scratchpad register of the client
so provide a mechanism to communicate the right address via descriptor
metadata.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c       | 153 ++++++++++++++++++++++++++++++++++++++-
 include/linux/dma/qcom_bam_dma.h |  14 ++++
 2 files changed, 163 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 04fe1d546be73f074c66c4a5712ad65717e10929..84fd9e181bdd5fd9a4a744050ba57f05f54787c7 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -28,11 +28,13 @@
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
+#include <linux/dma/qcom_bam_dma.h>
 #include <linux/dmaengine.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/lockdep.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_dma.h>
@@ -60,6 +62,8 @@ struct bam_desc_hw {
 #define DESC_FLAG_EOB BIT(13)
 #define DESC_FLAG_NWD BIT(12)
 #define DESC_FLAG_CMD BIT(11)
+#define DESC_FLAG_LOCK BIT(10)
+#define DESC_FLAG_UNLOCK BIT(9)
 
 struct bam_async_desc {
 	struct virt_dma_desc vd;
@@ -72,6 +76,10 @@ struct bam_async_desc {
 
 	struct bam_desc_hw *curr_desc;
 
+	/* BAM locking infrastructure */
+	struct scatterlist lock_sg;
+	struct bam_cmd_element lock_ce;
+
 	/* list node for the desc in the bam_chan list of descriptors */
 	struct list_head desc_node;
 	enum dma_transfer_direction dir;
@@ -391,6 +399,10 @@ struct bam_chan {
 	struct list_head desc_list;
 
 	struct list_head node;
+
+	/* BAM locking infrastructure */
+	phys_addr_t scratchpad_addr;
+	enum dma_transfer_direction direction;
 };
 
 static inline struct bam_chan *to_bam_chan(struct dma_chan *common)
@@ -652,6 +664,35 @@ static int bam_slave_config(struct dma_chan *chan,
 	return 0;
 }
 
+static int bam_metadata_attach(struct dma_async_tx_descriptor *desc, void *data, size_t len)
+{
+	struct bam_chan *bchan = to_bam_chan(desc->chan);
+	const struct bam_device_data *bdata = bchan->bdev->dev_data;
+	struct bam_desc_metadata *metadata = data;
+
+	if (!data)
+		return -EINVAL;
+
+	if (!bdata->pipe_lock_supported)
+		/*
+		 * The client wants to use locking but this BAM version doesn't
+		 * support it. Don't return an error here as this will stop the
+		 * client from using DMA at all for no reason.
+		 */
+		return 0;
+
+	guard(spinlock_irqsave)(&bchan->vc.lock);
+
+	bchan->scratchpad_addr = metadata->scratchpad_addr;
+	bchan->direction = metadata->direction;
+
+	return 0;
+}
+
+static const struct dma_descriptor_metadata_ops bam_metadata_ops = {
+	.attach = bam_metadata_attach,
+};
+
 /**
  * bam_prep_slave_sg - Prep slave sg transaction
  *
@@ -668,6 +709,7 @@ static struct dma_async_tx_descriptor *bam_prep_slave_sg(struct dma_chan *chan,
 	void *context)
 {
 	struct bam_chan *bchan = to_bam_chan(chan);
+	struct dma_async_tx_descriptor *tx_desc;
 	struct bam_device *bdev = bchan->bdev;
 	struct bam_async_desc *async_desc;
 	struct scatterlist *sg;
@@ -723,7 +765,10 @@ static struct dma_async_tx_descriptor *bam_prep_slave_sg(struct dma_chan *chan,
 		} while (remainder > 0);
 	}
 
-	return vchan_tx_prep(&bchan->vc, &async_desc->vd, flags);
+	tx_desc = vchan_tx_prep(&bchan->vc, &async_desc->vd, flags);
+	tx_desc->metadata_ops = &bam_metadata_ops;
+
+	return tx_desc;
 }
 
 /**
@@ -1012,13 +1057,105 @@ static void bam_apply_new_config(struct bam_chan *bchan,
 	bchan->reconfigure = 0;
 }
 
+static struct bam_async_desc *
+bam_make_lock_desc(struct bam_chan *bchan, unsigned long flag)
+{
+	struct dma_chan *chan = &bchan->vc.chan;
+	struct bam_async_desc *async_desc;
+	struct bam_desc_hw *desc;
+	struct virt_dma_desc *vd;
+	struct virt_dma_chan *vc;
+	unsigned int mapped;
+	dma_cookie_t cookie;
+	int ret;
+
+	async_desc = kzalloc_flex(*async_desc, desc, 1, GFP_NOWAIT);
+	if (!async_desc) {
+		dev_err(bchan->bdev->dev, "failed to allocate the BAM lock descriptor\n");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	sg_init_table(&async_desc->lock_sg, 1);
+
+	async_desc->num_desc = 1;
+	async_desc->curr_desc = async_desc->desc;
+	async_desc->dir = DMA_MEM_TO_DEV;
+
+	desc = async_desc->desc;
+
+	bam_prep_ce_le32(&async_desc->lock_ce, bchan->scratchpad_addr, BAM_WRITE_COMMAND, 0);
+	sg_set_buf(&async_desc->lock_sg, &async_desc->lock_ce, sizeof(async_desc->lock_ce));
+
+	mapped = dma_map_sg(chan->slave, &async_desc->lock_sg, 1, DMA_TO_DEVICE);
+	if (!mapped) {
+		kfree(async_desc);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	desc->flags |= cpu_to_le16(DESC_FLAG_CMD | flag);
+	desc->addr = sg_dma_address(&async_desc->lock_sg);
+	desc->size = cpu_to_le16(sizeof(struct bam_cmd_element));
+
+	vc = &bchan->vc;
+	vd = &async_desc->vd;
+
+	dma_async_tx_descriptor_init(&vd->tx, &vc->chan);
+	vd->tx.flags = DMA_PREP_CMD;
+	vd->tx.desc_free = vchan_tx_desc_free;
+	vd->tx_result.result = DMA_TRANS_NOERROR;
+	vd->tx_result.residue = 0;
+
+	cookie = dma_cookie_assign(&vd->tx);
+	ret = dma_submit_error(cookie);
+	if (ret) {
+		dma_unmap_sg(chan->slave, &async_desc->lock_sg, 1, DMA_TO_DEVICE);
+		kfree(async_desc);
+		return ERR_PTR(ret);
+	}
+
+	return async_desc;
+}
+
+static int bam_do_setup_pipe_lock(struct bam_chan *bchan, bool lock)
+{
+	struct bam_device *bdev = bchan->bdev;
+	const struct bam_device_data *bdata = bdev->dev_data;
+	struct bam_async_desc *lock_desc;
+	unsigned long flag;
+
+	lockdep_assert_held(&bchan->vc.lock);
+
+	if (!bdata->pipe_lock_supported || !bchan->scratchpad_addr ||
+	    bchan->direction != DMA_MEM_TO_DEV)
+		return 0;
+
+	flag = lock ? DESC_FLAG_LOCK : DESC_FLAG_UNLOCK;
+
+	lock_desc = bam_make_lock_desc(bchan, flag);
+	if (IS_ERR(lock_desc))
+		return PTR_ERR(lock_desc);
+
+	if (lock)
+		list_add(&lock_desc->vd.node, &bchan->vc.desc_issued);
+	else
+		list_add_tail(&lock_desc->vd.node, &bchan->vc.desc_issued);
+
+	return 0;
+}
+
+static void bam_setup_pipe_lock(struct bam_chan *bchan)
+{
+	if (bam_do_setup_pipe_lock(bchan, true) || bam_do_setup_pipe_lock(bchan, false))
+		dev_err(bchan->vc.chan.slave, "Failed to setup BAM pipe lock descriptors");
+}
+
 /**
  * bam_start_dma - start next transaction
  * @bchan: bam dma channel
  */
 static void bam_start_dma(struct bam_chan *bchan)
 {
-	struct virt_dma_desc *vd = vchan_next_desc(&bchan->vc);
+	struct virt_dma_desc *vd;
 	struct bam_device *bdev = bchan->bdev;
 	struct bam_async_desc *async_desc = NULL;
 	struct bam_desc_hw *desc;
@@ -1030,6 +1167,9 @@ static void bam_start_dma(struct bam_chan *bchan)
 
 	lockdep_assert_held(&bchan->vc.lock);
 
+	bam_setup_pipe_lock(bchan);
+
+	vd = vchan_next_desc(&bchan->vc);
 	if (!vd)
 		return;
 
@@ -1157,8 +1297,12 @@ static void bam_issue_pending(struct dma_chan *chan)
  */
 static void bam_dma_free_desc(struct virt_dma_desc *vd)
 {
-	struct bam_async_desc *async_desc = container_of(vd,
-			struct bam_async_desc, vd);
+	struct bam_async_desc *async_desc = container_of(vd, struct bam_async_desc, vd);
+	struct bam_desc_hw *desc = async_desc->desc;
+	struct dma_chan *chan = vd->tx.chan;
+
+	if (le16_to_cpu(desc->flags) & (DESC_FLAG_LOCK | DESC_FLAG_UNLOCK))
+		dma_unmap_sg(chan->slave, &async_desc->lock_sg, 1, DMA_TO_DEVICE);
 
 	kfree(async_desc);
 }
@@ -1349,6 +1493,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	bdev->common.device_terminate_all = bam_dma_terminate_all;
 	bdev->common.device_issue_pending = bam_issue_pending;
 	bdev->common.device_tx_status = bam_tx_status;
+	bdev->common.desc_metadata_modes = DESC_METADATA_CLIENT;
 	bdev->common.dev = bdev->dev;
 
 	ret = dma_async_device_register(&bdev->common);
diff --git a/include/linux/dma/qcom_bam_dma.h b/include/linux/dma/qcom_bam_dma.h
index 68fc0e643b1b97fe4520d5878daa322b81f4f559..a2594264b0f58c4b2b1c85e243cad0d5669c26dc 100644
--- a/include/linux/dma/qcom_bam_dma.h
+++ b/include/linux/dma/qcom_bam_dma.h
@@ -6,6 +6,8 @@
 #ifndef _QCOM_BAM_DMA_H
 #define _QCOM_BAM_DMA_H
 
+#include <linux/dmaengine.h>
+
 #include <asm/byteorder.h>
 
 /*
@@ -34,6 +36,18 @@ enum bam_command_type {
 	BAM_READ_COMMAND,
 };
 
+/**
+ * struct bam_desc_metadata - DMA descriptor metadata specific to the BAM driver.
+ *
+ * @scratchpad_addr: Physical address to use for dummy write operations when
+ *                   queuing command descriptors with LOCK/UNLOCK bits set.
+ * @direction: Transfer direction of this channel.
+ */
+struct bam_desc_metadata {
+	phys_addr_t scratchpad_addr;
+	enum dma_transfer_direction direction;
+};
+
 /*
  * prep_bam_ce_le32 - Wrapper function to prepare a single BAM command
  * element with the data already in le32 format.

-- 
2.47.3


