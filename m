Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09FFCC6B06
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 14:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a1m6afkSeaYLY+7Ncg1+riv3goTESL0u8rADY35Zlfc=; b=qRVLBA79Dc8yryAFa95bDhEeRO
	0VSICLoAN6MCObbvBD9rSchAsgNw29ART7npS0apF+yjwgODxF91kWQxaDMiJNoqrlRXvlJAma8Z3
	QYhRWRgRj0VspGax7OAKdBx13K49J0wpz6LD1YmsXCTMABTTaVgL299R3/mZyAmgpCVvvaHSzF5Nz
	dyWkWbyz5XMG7jjBnRZVEm48YurtchTdmj26P9NJLgF0uaQPYOYOqBE+eJj9QAjhv2XVqic+55rrk
	x53KHzW1OnmgBrJeJLqINp76CsqslwQDGrcD6zNlYKebgcUe+lhpvqz9eN5fXSB6/7/FVsanqtlW6
	9afqLfrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JSs-00000000O0F-0lTM;
	Thu, 02 Apr 2026 14:56:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JSo-00000000Nxo-40je
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Apr 2026 14:56:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=a1m6afkSeaYLY+7Ncg1+riv3goTESL0u8rADY35Zlfc=; b=fg57/4xGejGmdZ6koOQaYO7nFk
	2N4+8aC/c+sm0da0Z2R0tfj+cUNBca+kirHN9PUc+qht3w9oIV7rMK4HWs9fzdGV94oyq6KrLdX6c
	oHJGIZDZbzt1MZykTL1RFifgOGB00oqLTpGEudkGDM1UooGEAOZaTBV04YYlrLxmRGsWsXmXi3mHK
	/zb/XuN7Z6/jQugBWxjOSP3uzp6LdLPX894aRjrAA7Z4PMeYOk1C3M5nkDmPTzglntfGaBDcGdqaX
	Hsjph/twiuu7BvrW0CVYJR+RKpogVJd5xdJRhjsEKMA8vd220iUqnKqtwfm2JJryZaWl58z7n6hX5
	aR115diw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JSl-00000002jCo-3slL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 14:56:05 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632B8lr8090872
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Apr 2026 14:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a1m6afkSeaYLY+7Ncg1+riv3goTESL0u8rADY35Zlfc=; b=FWzRf7J0c9GGJe90
	70DtTyoUU1cfoUAc30LX2mQ417Hjui1au+rOSTEgECElK9ipk3ErdQMixEBXLJLF
	pxXgzPFWhDpK4OWrt2VvTG8HFvOEbPJgIGgjgC66+L20Se+J6f+amlCMcPscnYVF
	4gGwrbhLL/oJxdOqUXDJjUMEmdmJ+woiOvYscNaTeuIyYSwye45gPF4iCnju1cSp
	6lbJOV1MjhOSQWD+lAO+dkgAHi6JuGeNxXWPjgZKiD0anml/nQ5Z4mLgBltTdZOp
	koMOv/STBmY2naqVujhQtr5wPcw3QxzCl7stxLVdcLBrJhRI5QHkLsPeoM1nAyO+
	jt5sHA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9jcua9ky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 14:56:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50917996cfaso29859271cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 07:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775141762; x=1775746562; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a1m6afkSeaYLY+7Ncg1+riv3goTESL0u8rADY35Zlfc=;
        b=EQs20F3vQ+Ly46JPa7LWJXoxy3DKgsZq4fy7JGFZVo2VHSLz66XUkJiUTzkBTks946
         7uXTScbQlwW+DI8vbQ75fUqPC1r8vPFtyOPdZtxf+k4YEuoRWUG40cE8UFLlQTq/1FlJ
         90ULDqdRTrXEGbdP7LgZdtqoJar+RSeDwHs7wsWJbDX0WycPI4iMpzMj9lan7vVufm9A
         ++v2UhULACXskZ6AsOxN0fNkeaLHFakbY14ZlK1L7R9px/PeMcy7bEYuCZn/CrSMJm1y
         A2imTXYGEOhViWHN3MmGnHsrQoJxk6f4JXy+bt1StpTxz213NPab/w/Ml2cReeU+ipti
         N6pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775141762; x=1775746562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a1m6afkSeaYLY+7Ncg1+riv3goTESL0u8rADY35Zlfc=;
        b=H4ToQueuvm5yxpzyc0Q9vO0UfKvu+EI8QJgK+1maT8YSuGTxl0zHSreTCKhjbqe7P6
         Po1g/vzw1nIsZ0hBCFtO3AFrFGeyJLkB4zsRj/cE0H/OCTPfQXTHFnbv2Wdn0Jdbd6/m
         /EvWTletXrG8Tzj0vSGKWDheEjvAf/tb+w11wafvHp5PfJZniK08nPeWAuUVAHCW7gJU
         jBsUCE55EbBKesIJuw0eYfWVzzQQt8BZv1y0LRN6lzW13pwPkmwjdb0jLTwKFTwZTsmv
         K2T7si85g9FCrOWc/xpYF+upfQU7AAa5tEdB2mHVE4DxcNskZxCnep8Rpe6sNgDQ9MPP
         eqqg==
X-Forwarded-Encrypted: i=1; AJvYcCVDxqlyUMre6whnJ/eo6v6JHV7g0jfYC9Qy6GWbFKP5zQRO94AajCYrKeIZUZD2AFBM07yY2gIfah23ekp2mL22@lists.infradead.org
X-Gm-Message-State: AOJu0YxxAf4kyCxspYHXKrQtfsZmE+ht1hLQ0EyBkjnx4xuZbWUUClZg
	IbO3cLXLGOzpkzGI+R3DjYAzTp6RC5SYs8ZAxatlS6Q3go95ZnA3cJpbk9JcM+rwmJ5H9xmq+2Z
	MhbBoyIGSUk0A2RxKn4UKmOw3hrg5nbhR/tN/nvbczKwPQ5kN09ytGcFrGFmhcIPHeraZ2k/OlK
	8Oog==
X-Gm-Gg: ATEYQzxfqlPvqnKVvCHcWWAzBftKIF9P5uJITEyo/Ss8+fu5nwJghnKdJnMDs+6wEQ/
	ha9hiVT1v55kKZOY16HH/S0rzyMHenapmzIkO6yJCaKsJxZtgL9hSl/Kn3G3RGbrb4NlDV8ssMm
	eUtIEa2NBBQopJ+u0RLMb/udXS/KsDtfpLVTSWjCS82fZ9zcA0t5oNpEw7bCGWb2FFVvXJckF6Z
	1/B5mnXcxNwEUtWAjmR1RSuAEqkarh9YqZA+MVucdj0yNPtPZHuZBkD7VWBb8T837MpvzKxj9Yc
	1avt3ztQ8xeYqqhtWf9BqydbBwiji6MXAI0ZD/JQKbTn/7mnQhJsx4DLPUXY1appFe68HyB49V5
	+08yWZTSp3Wcy+MA3kKNaLx0EwyQKNYMX1OupKuIvv5V1sj60KE6f
X-Received: by 2002:a05:622a:4a10:b0:50b:4435:5df0 with SMTP id d75a77b69052e-50d4bbce536mr49635231cf.58.1775141761700;
        Thu, 02 Apr 2026 07:56:01 -0700 (PDT)
X-Received: by 2002:a05:622a:4a10:b0:50b:4435:5df0 with SMTP id d75a77b69052e-50d4bbce536mr49634831cf.58.1775141761173;
        Thu, 02 Apr 2026 07:56:01 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4ff1:3e57:22ec:dadc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f5294sm7234038f8f.35.2026.04.02.07.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:56:00 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 16:55:16 +0200
Subject: [PATCH v15 05/12] dmaengine: qcom: bam_dma: add support for BAM
 locking
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-qcom-qce-cmd-descr-v15-5-98b5361f7ed7@oss.qualcomm.com>
References: <20260402-qcom-qce-cmd-descr-v15-0-98b5361f7ed7@oss.qualcomm.com>
In-Reply-To: <20260402-qcom-qce-cmd-descr-v15-0-98b5361f7ed7@oss.qualcomm.com>
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
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9596;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wKwZxxjy27vlLx6KSC4wLUCtRQfRSr7Vcr0aJm2HW0c=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpzoNwpVyAN5iwSh/1dbiN6sr+7EZfRmB/v7Ybd
 aJIJHuRjoiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac6DcAAKCRAFnS7L/zaE
 w5n/D/9IrWGPxnshCnee3DoeCuaE7nTlDLEbuQVhavvTHKGBQk0lBnaQTntkZsn2Pa4DgWD9o6u
 PoSq4ucXVnPKDugT7cT+xrs1aT/KtWU+AW+fvvWxhyPlfaM12NpOLeFKQfBAFhygrHBhHHckj/h
 gol0/O16tNUkm7BCq857hDDJuSnT4VnbWOci4iYxFKrzqT8FQkNYAOCJVTBYoqhztEPDjBabcwS
 hg6rLH3EtSOm4RcY6R19gcHC+yn9IcQ/8Q1vTzZl4evnSMNrcCiEiAHDoHqSBUK5wtm9hTJTqnc
 sU1HMdj6da53H3tKQqEEAnENoiYnk47FgJorlLGNUXCWdOwCoqoU9GXtd5VwqU49EDxG2+hdH6b
 rIeKU3JeiqWYChNOSXy7/7uD6p8A/0NJzSkZ7M1l7MdfGRbr8F2pQAeDVNrv2AoZJRo25aVBvoC
 0ftACF9y3GbIxXuG/Jfop6cOPu4ykp/qOQhjsg2sxeHYfFpDJHT1wzVX4oK8IJDKDumf0ybqYPZ
 PQw1QJjwQ2lTCkuMMzShwwJn1mcSgOyQHlUXzdwvnAyH3OxvCSE299epFC4JLNOFD9Lg4H/TAmF
 DvQKG7a/3FZOEJa8jbd/mCLpC9+R2Bwpi7edhEIo3qLHFCTGelvUI51L9CQ2mtvbQwCv4e/MbVw
 2KZpvVphZy3di1g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEzNCBTYWx0ZWRfX3msRJBJdCR8P
 NzeKCe0nWCvGYcAtZR85H/Pdao5U4jJJ3Z3CQBAlmdClgoggEwsA7v8R5blI6o6VQwCUkbEW50t
 qS0lX33nUwbUKs8jibHp18MCp4ZXukMPUHgr2MuQFOyj0Z56nvoGEvKr+jgpdDVYYj3ttV6yExd
 BDMmd6Wy00sy4ZWwoc4U54Bg3xQoeZkhdjNqvQwa0srdEhfWCeyGo+cqHxELF5VOOeAPgAS1ajj
 E2zaLM1TEPRsr9K9LZBPtgg9H+mZ7CK5nuTzq8RMH4SKej9eG4m46F6O5MQlXZcP/u4YcrlHGVK
 JfDhIYh/EQSnr/udpEQB8wvfEjV7E6ygpgBVydgjMkwtZtKtjJoiFsbidQjL0qOR8XWmworJH3R
 Jyb7xFVyyYEhCa+iGMLiAypBrp2NBG2UyWJqkTED6wJeoCktUBdTTKpncaALDYw10vRJgickxGf
 xh/p7I2wpCvEN7W5YsA==
X-Proofpoint-GUID: ssS4rUSNxzMtAY-V4p_FQP9ANPq4KTC3
X-Authority-Analysis: v=2.4 cv=eYYwvrEH c=1 sm=1 tr=0 ts=69ce8382 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=qJbEDo8Lr3yLsC1F8HwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: ssS4rUSNxzMtAY-V4p_FQP9ANPq4KTC3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_02,2026-04-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_155604_275267_B3703A5E 
X-CRM114-Status: GOOD (  25.40  )
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
 drivers/dma/qcom/bam_dma.c       | 167 ++++++++++++++++++++++++++++++++++++++-
 include/linux/dma/qcom_bam_dma.h |  14 ++++
 2 files changed, 177 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 83491e7c2f17d8c9d12a1a055baea7e3a0a75a53..c3c1d39b6e7cce16cb4eaf450220c9e9a4dffe3f 100644
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
@@ -391,6 +395,14 @@ struct bam_chan {
 	struct list_head desc_list;
 
 	struct list_head node;
+
+	/* BAM locking infrastructure */
+	phys_addr_t scratchpad_addr;
+	enum dma_transfer_direction direction;
+	struct scatterlist lock_sg;
+	struct scatterlist unlock_sg;
+	struct bam_cmd_element lock_ce;
+	struct bam_cmd_element unlock_ce;
 };
 
 static inline struct bam_chan *to_bam_chan(struct dma_chan *common)
@@ -652,6 +664,33 @@ static int bam_slave_config(struct dma_chan *chan,
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
@@ -668,6 +707,7 @@ static struct dma_async_tx_descriptor *bam_prep_slave_sg(struct dma_chan *chan,
 	void *context)
 {
 	struct bam_chan *bchan = to_bam_chan(chan);
+	struct dma_async_tx_descriptor *tx_desc;
 	struct bam_device *bdev = bchan->bdev;
 	struct bam_async_desc *async_desc;
 	struct scatterlist *sg;
@@ -723,7 +763,12 @@ static struct dma_async_tx_descriptor *bam_prep_slave_sg(struct dma_chan *chan,
 		} while (remainder > 0);
 	}
 
-	return vchan_tx_prep(&bchan->vc, &async_desc->vd, flags);
+	tx_desc = vchan_tx_prep(&bchan->vc, &async_desc->vd, flags);
+	if (!tx_desc)
+		return NULL;
+
+	tx_desc->metadata_ops = &bam_metadata_ops;
+	return tx_desc;
 }
 
 /**
@@ -1012,13 +1057,116 @@ static void bam_apply_new_config(struct bam_chan *bchan,
 	bchan->reconfigure = 0;
 }
 
+static struct bam_async_desc *
+bam_make_lock_desc(struct bam_chan *bchan, struct scatterlist *sg,
+		   struct bam_cmd_element *ce, unsigned long flag)
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
+	sg_init_table(sg, 1);
+
+	async_desc = kzalloc_flex(*async_desc, desc, 1, GFP_NOWAIT);
+	if (!async_desc) {
+		dev_err(bchan->bdev->dev, "failed to allocate the BAM lock descriptor\n");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	async_desc->num_desc = 1;
+	async_desc->curr_desc = async_desc->desc;
+	async_desc->dir = DMA_MEM_TO_DEV;
+
+	desc = async_desc->desc;
+
+	bam_prep_ce_le32(ce, bchan->scratchpad_addr, BAM_WRITE_COMMAND, 0);
+	sg_set_buf(sg, ce, sizeof(*ce));
+
+	mapped = dma_map_sg_attrs(chan->slave, sg, 1, DMA_TO_DEVICE, DMA_PREP_CMD);
+	if (!mapped) {
+		kfree(async_desc);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	desc->flags |= cpu_to_le16(DESC_FLAG_CMD | flag);
+	desc->addr = sg_dma_address(sg);
+	desc->size = sizeof(struct bam_cmd_element);
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
+		dma_unmap_sg(chan->slave, sg, 1, DMA_TO_DEVICE);
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
+	struct bam_cmd_element *ce;
+	struct scatterlist *sgl;
+	unsigned long flag;
+
+	lockdep_assert_held(&bchan->vc.lock);
+
+	if (!bdata->pipe_lock_supported || !bchan->scratchpad_addr ||
+	    bchan->direction != DMA_MEM_TO_DEV)
+		return 0;
+
+	if (lock) {
+		sgl = &bchan->lock_sg;
+		ce = &bchan->lock_ce;
+		flag = DESC_FLAG_LOCK;
+	} else {
+		sgl = &bchan->unlock_sg;
+		ce = &bchan->unlock_ce;
+		flag = DESC_FLAG_UNLOCK;
+	}
+
+	lock_desc = bam_make_lock_desc(bchan, sgl, ce, flag);
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
@@ -1030,6 +1178,9 @@ static void bam_start_dma(struct bam_chan *bchan)
 
 	lockdep_assert_held(&bchan->vc.lock);
 
+	bam_setup_pipe_lock(bchan);
+
+	vd = vchan_next_desc(&bchan->vc);
 	if (!vd)
 		return;
 
@@ -1157,8 +1308,15 @@ static void bam_issue_pending(struct dma_chan *chan)
  */
 static void bam_dma_free_desc(struct virt_dma_desc *vd)
 {
-	struct bam_async_desc *async_desc = container_of(vd,
-			struct bam_async_desc, vd);
+	struct bam_async_desc *async_desc = container_of(vd, struct bam_async_desc, vd);
+	struct bam_desc_hw *desc = async_desc->desc;
+	struct dma_chan *chan = vd->tx.chan;
+	struct bam_chan *bchan = to_bam_chan(chan);
+
+	if (le16_to_cpu(desc->flags) & DESC_FLAG_LOCK)
+		dma_unmap_sg(chan->slave, &bchan->lock_sg, 1, DMA_TO_DEVICE);
+	else if (le16_to_cpu(desc->flags) & DESC_FLAG_UNLOCK)
+		dma_unmap_sg(chan->slave, &bchan->unlock_sg, 1, DMA_TO_DEVICE);
 
 	kfree(async_desc);
 }
@@ -1350,6 +1508,7 @@ static int bam_dma_probe(struct platform_device *pdev)
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


