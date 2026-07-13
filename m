Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DECC44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 13:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ssHW8XScr3JWgrcOFJ5LiFi8t9CrlHFACuaOrI33AwM=; b=u0L16tOLigJl733sE8qAxugI3+
	oyQtbgoP85cM2imTIzSrpVsSQN3bz39kdr2DEkxWWfORVyBmYGAJjMnuGICdl/yWnPkIffGv1D8+7
	yhW54wUzY8UwbGvMnAB7mI2F4UylM/tnKyPd5Op1H1iD0thPb/wfEgrJ4dEOG7LEYxkOByDWGF9WU
	ShiSG40N5tn6LnOqC4WcmYXtZtxtVc7xQ+Y6OMrbia9oN3HMBfoMYPvUvnMWMf+laOykYvKuxcbqu
	9ZHue5cNNVNRvPH64NNJ6kVTWxGE6pbdJHOwY84//Da+NhAG3wmqki9lOQ4RX5l9PQ5bi2v69TYgs
	kpAtJYCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGI5-00000009HYc-3TLt;
	Mon, 13 Jul 2026 13:01:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGHr-00000009HHv-0Uzu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 13:01:32 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDWlv1299286
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 13:01:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ssHW8XScr3JWgrcOFJ5LiFi8t9CrlHFACuaOrI33AwM=; b=YJFK4JksueG3kSy8
	CsEOscJBC0OK7MMfArRUpRlNVdIMqiFLSsK8Rxk7/0TdNSPRnBCtCiG0+lhDxu28
	BfamHVNKBqy/hPtjgzzoA+09KlodvXoxi08WlHwwHwuh08qfKmmg4prKnYwRIy7Z
	+Po+aWQwWnfnO3w/IxNsmiY4m5NlC/GAid4Vz5OyPmmoWC8xTtKjFxuJdq0ivwc/
	InSTFrya04EUXnWu5IMjBH3kixlulKAAaIDFFNYFd3lBiGSN9ygLRbNgdzkti7/C
	m6xeANqK3lYQCtkgWlJzZxXOEUZ/brJdM/WHD05dylQ6s3zy824QgqdyWq9tDtRP
	6odF/g==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk3gpyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 13:01:30 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7eb641eaf5eso4072988a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 06:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783947689; x=1784552489; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ssHW8XScr3JWgrcOFJ5LiFi8t9CrlHFACuaOrI33AwM=;
        b=WDagzyIM7gunn3wV2HZZCM0lIKB5n8NqIwWgc4NCkHHQ3eRWR92zVaUPkKntt/4sZf
         UOYmphZbSpYlmhsrwRdeUgeJAd+6g2xYCfAD8gBbN2Pm1AmNutVCRYjHWUVvRuQYfCv7
         KIr0ah3ZSmdlt2MzwnLiX6IfozIb2lKj3IxYANJfz6vcwZuYg8iwPuPDNymu+qH4DBbX
         vQveM99czvMZwyEmAoiXEiy8cgaHt6Zvph4laSvSCSIwF2vfcfR0EvqEF9SzP1K5xkqf
         hEjTjFPZPcf0F8nBGWxXO+xjiLptSdW72fKa+43jjJ/nMfjhB7PujnMT4yuAtYH+h4ic
         ITFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947689; x=1784552489;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssHW8XScr3JWgrcOFJ5LiFi8t9CrlHFACuaOrI33AwM=;
        b=M+UQOQjq9SMxx5XPjC2ZTWDQmkrDW7x5+xhHmdw3KTmU0vnvSKGJefqdQxkU7ewpV9
         yf2Iu5s8MJIETmpsMun7esxqCqYYKGtXnZiPCwMYvknG8mXTZa+d0i9EqsYBlBaBOdEV
         Yir/M4DdybeDpshnXgAIWZNvw7X5K6irr2MVwGEs/P2SVbXvU5MksH3EgVlxCmd0wE9j
         pknPtUZten6CRrj1QtJKozBec4zXd5Q11nbMUNoWbSn9INta9qMgJZC3FQuB37GC2BEx
         QsqL+/sW+svTU4IfpHUmGBBFUzT5mCCDnVCMthib4rLqn0BM84F9wpq+DJsDgCXFlPIc
         +LBQ==
X-Forwarded-Encrypted: i=1; AFNElJ+QImq/cEmOaXHGEBQhua+vCDpSmYiHcZAIrdMy+gE7bx6W82cVkSpjlNcBhqNLh+1s442l2/m+6s3VxHeDxzSS@lists.infradead.org
X-Gm-Message-State: AOJu0Ywl0FwyNeIvRqMiWKi+2Nsd4JpPJHpMH5fgNBqv88PFftBjlAk6
	3MjbGruqqx2f6goifzrczYy3g98tDx5NIf9SAJpwR0O+fOcs0q4FxRjjgGvx0oY6iR/rkq50cLj
	8nw4XSveMTeZfgOzqTkbD/0Ro7cOFmX8qMooa8qJ9KxTluQbiBXY1kwukb+etIGx20/EpE9cKUB
	smUg==
X-Gm-Gg: AfdE7ckrDsO4iOaZX339OCrUgHkMj44VckiB7+rphnpMN5X22uZ5a4j5YKbrHSGzWxe
	9LUVEY68DQC9x/GBXKDrfRrNhmXxHNfrnC4narhoP/8Fgwq62waxzkVAxBYwLgRZ66Vxt6Z/tQY
	NOYgdK0UxsvMAFfLh13RT9uIOe7LGyRKI4jbctLy2ftUEwvHauVAumK2lkYL+2GXQHE/3JZrnbo
	SGBKPOWAF2awxbiSLDueF2hOCpAL4en5Xy0k3g7SfjC6Do5WfZvxhYzVzNf0DGAQTborHxI6mi5
	wXQD5JbwPa7iR269N6O3x9NY1TL9KKfZz0jwTgPwl5jt5YKHfOfMK2tUbBUb96mMB5bsTmqZ8Kf
	E+X2WaWRqmIoYb9lKeHW3jTVlXGpAjDdtcvM+ftWH
X-Received: by 2002:a05:6820:216:b0:69d:fcab:c640 with SMTP id 006d021491bc7-6a39a6cc376mr4848272eaf.42.1783947689347;
        Mon, 13 Jul 2026 06:01:29 -0700 (PDT)
X-Received: by 2002:a05:6820:216:b0:69d:fcab:c640 with SMTP id 006d021491bc7-6a39a6cc376mr4848226eaf.42.1783947688764;
        Mon, 13 Jul 2026 06:01:28 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2d97527sm306129725e9.2.2026.07.13.06.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:01:27 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:01:02 +0200
Subject: [PATCH v21 01/14] dmaengine: constify struct
 dma_descriptor_metadata_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-qce-cmd-descr-v21-1-bc2583e18475@oss.qualcomm.com>
References: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
In-Reply-To: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2359;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=T0ZAEoPGlcD+MBsHOs7IR7iXvbxs2FRnDbpOdt9CWCM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOGVtk23j9WMdAK9vTBVzx3ggbDwbf+8TN6Cj
 XQXTvzeETaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalThlQAKCRAFnS7L/zaE
 w6FeD/9JqF+LVP1epiNp5FsiCS3htRKz5PlF4mocU3VrUG0etSCHC1tK4PzMixQZj2Tl7N7Zok1
 j7/LP9ZI6/0xY7u7YuY9behpQ1mex/SKrXXzCId0DC1R40Gmifr67MXasXktEjiBwQNnHeouM3I
 KggDHXo4ccrCjBc9werjgP+GRdbBDWgE4lRaxZjjTOhkqAOgUrvIsv6KL/+nhZFSP4VAOtruUkr
 kJ/nzdGXfU6u1yCW3F0XbJaXqPdvE5rEi/RlO7ux6I7OXN4T7BPztA54Dc/Sv65u8TdxBn0d48q
 RevX3zqSTgmWUbfeb3PuW18MSNd7V/pU2Z2iJgHWX/1oYf0LDfwPIfcb7Pg+GWUD1WtcmVsWd7y
 DfCgRwzhPPnDaIwoeDGYK7OBE/RdtbRR25xC++dDTWSiCVlcIRvCvajQANHjzIO7NbKBNUI0uiX
 QFmbCPLc6SAwmhe1QojBH313wPgkjP9fYsCAoTwYGwW0tvaWaoWZPKrRNlDYJhNEqaSFhZJJs2h
 tesL4V5Kqv481xfqgE+XQdYFht2EAAFxyGQRRlHfzXyNPFesmC0bxRR/KG4FQjI4zOsKmphhDZl
 d6LFkMywLBDJO5nZzwXC4BIorLovMhXH+YyUuLEyqmUDehwLEBuDoPszp1uEOwmzRCUF86VVY+i
 eyex7CGHqOPsVWg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: u12yZ51-EvBtCkhjZkDt6UNlgrWRhrAb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX6ECC2+77mkgB
 YzRqFycp88Vuqe/bF8Mn5eozVy6U11iqFwWia48LUvPfbaBcFoGGq4w27Yrpd1Pdh4wDvaVE6e0
 0ZCLUu65znV6RkKd6e75UFhZXW6JG4E=
X-Authority-Analysis: v=2.4 cv=e6c2j6p/ c=1 sm=1 tr=0 ts=6a54e1aa cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=zd2uoN0lAAAA:8 a=EUspDBNiAAAA:8 a=XeVHrwws4l7kqE2Ex6IA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX28bsFD223dUj
 3ixao8vzdXk9sNEfXoY7zwpy4nX6of1pyver9FmSwliHxEDaRkyYkN1frMv1kTY726QccBfB5dp
 tEoqvTjG1TWy1HWi7xad4SP4f6XUGRaqtlAEdaDuz7QLUQ4kOD2rugQ7rWNEQDioiJz7cIF2w+I
 UoE395qP6lfLegCqt3n/e7uf7razglQJEIusaxCT4FNz5FV7F8qpSPwhMfuMwMNYayMDw+jO5fl
 i+IOelZdBWsFyCCOQ4ArAgOK1N6X1godqfiXPGjemF3ODy8coArBkW8OeqAcSfpe2ubz0/QtNXI
 MYeEHYWDhi7tHNAEY5Rg8PqMw7cKIYpNXH9hc5sRyZtTskocwT521oYcFIvjKWfvaOjJCYfZ8RZ
 6sSR9hneXOpkpoh9J1Q5e4p4Yl29JQSNE8Za739M3UFnZP0trGO+2frJKd7f2F5n36gpwrGZ4wS
 44e2YrJ3MSrAo2Ih6WQ==
X-Proofpoint-GUID: u12yZ51-EvBtCkhjZkDt6UNlgrWRhrAb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_060131_181325_4F53158E 
X-CRM114-Status: GOOD (  16.67  )
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

There's no reason for the instances of this struct to be modifiable.
Constify the pointer in struct dma_async_tx_descriptor and all drivers
currently using it.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/ti/k3-udma.c        | 2 +-
 drivers/dma/xilinx/xilinx_dma.c | 2 +-
 include/linux/dmaengine.h       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 1cf158eb7bdb541c4e7f4f79f65ab70be4311fad..fb21e0df5ab7b20e4e16777b5ff7f61d2ae67b2b 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -3408,7 +3408,7 @@ static int udma_set_metadata_len(struct dma_async_tx_descriptor *desc,
 	return 0;
 }
 
-static struct dma_descriptor_metadata_ops metadata_ops = {
+static const struct dma_descriptor_metadata_ops metadata_ops = {
 	.attach = udma_attach_metadata,
 	.get_ptr = udma_get_metadata_ptr,
 	.set_len = udma_set_metadata_len,
diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 404235c1735384635597e88edc25c67c7d250647..165b11a7c776abc6a8d66d631e19da669644577d 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -653,7 +653,7 @@ static void *xilinx_dma_get_metadata_ptr(struct dma_async_tx_descriptor *tx,
 	return seg->hw.app;
 }
 
-static struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
+static const struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
 	.get_ptr = xilinx_dma_get_metadata_ptr,
 };
 
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index b3d251c9734e95e1b75cf6763d4d2c3a1c6a9910..5244edb90e7e7510bf4460b6a74ee2a7f91c1ccc 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -623,7 +623,7 @@ struct dma_async_tx_descriptor {
 	void *callback_param;
 	struct dmaengine_unmap_data *unmap;
 	enum dma_desc_metadata_mode desc_metadata_mode;
-	struct dma_descriptor_metadata_ops *metadata_ops;
+	const struct dma_descriptor_metadata_ops *metadata_ops;
 #ifdef CONFIG_ASYNC_TX_ENABLE_CHANNEL_SWITCH
 	struct dma_async_tx_descriptor *next;
 	struct dma_async_tx_descriptor *parent;

-- 
2.47.3


