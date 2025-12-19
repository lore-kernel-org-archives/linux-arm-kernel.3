Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF34D7497A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 10:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7KsmdZ4x76VsS5fxr1ctBlIdVxj1CBW4LZiVMfMrgUc=; b=4ZBP24SbEJGttCPCpvkjTJPb1/
	UQL1khTgHyben6iHWglc3PApTpHsBk7NujPdLgF/Zz5NQV7bJ1GblArRtlT4R6BCBK2BoTc7+k13m
	Pghni1OPe/Vka60AdfpfJ1c5pEy6WgJrmGflli5Dgo42a4e3Z2EDukEKi6Nr36GgqUT4jUI5u+SDu
	m1rBDNJhqS/B7BgJF60We7P9qFy2LXbcl456d5c7JGkDHPOkYdlVM4YVwG8jkc4oGIdgi0S5h2Tsk
	Tkc2Hx29fGbNsUixvv+2IBCIS7TQ04elVJrwcDCum7CZ7NWg9TEgCCSUL7lxSvHqYu7Nd7rWGUhN+
	V/j9r45Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXPd-0000000A1Od-3LyB;
	Fri, 19 Dec 2025 10:08:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXPW-0000000A1JH-3pBD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 10:08:36 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cMR04154718
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:08:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7KsmdZ4x76VsS5fxr1ctBlIdVxj1CBW4LZiVMfMrgUc=; b=owLOZ6PVkqobpWoy
	2YnJ5PHAAAu0NsHXzctawY2nmaC99xDHV3sr82d3vjC9NO7Qa5A+EI7KYeLUp39T
	JDieAYDU4slBSYkp7opowKOKqJBzCOKqZ4x+D3co93m3dfMZwcagjwXVTsKu7tfR
	JyAOShRQjDj2YRUpIMAIsMGc6tLRJq1z95oWKr948+v9DOxyJixkgVMrF6q1Hp/3
	TS4/0eYERadIHWIwSTfPj664yEyvNXLed9kHG2eZZIuYLLtc+crd4vysxiQbylvA
	NXW5j85Cq3pl6DcFx82XH8QiOWg3L/YrnyMd1yotx4EwL1Kq9GfawfYBNdXw+wBp
	n+fCAg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ct9du-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:08:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee09693109so28682411cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 02:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766138907; x=1766743707; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7KsmdZ4x76VsS5fxr1ctBlIdVxj1CBW4LZiVMfMrgUc=;
        b=dsGnjHFLclPcLEUJj4mQKxKuwqyHi0YblonEdmm9GFC1TdjZotdC/GweqO02kO3uz8
         FAWtAHcT18bHaeL8LRBRT6GcvqoxMK/FnKYJD4nNkb0bfGwObNE7HNXzlSXub04oJ5IP
         wAjuGB5dz9IdtKjRErZO4nRAOM8E0QoL4d0nQsG/qDC2bk4QC/2M3jbkPjMMhEtb5e8n
         Rw2JAaGjYrOTXIdBsO9UcN23Zn5kavrZdOZVCj4G/Nu5Gnx8wC/T12EzMei3GQrlcAq8
         tZ+HkYEK4r59LCHovSaxREDjCzMHnCyDjjY6eSJTxCQTHjKqMomEuBeek79TiaBCdmVU
         kOPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766138907; x=1766743707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7KsmdZ4x76VsS5fxr1ctBlIdVxj1CBW4LZiVMfMrgUc=;
        b=A42OamB6+4nALIdnaiWJb9GPrrnnsUQbLp/WhsddedRvFA5sA2sTcIlPJR+kbVDKIz
         QZmDrIK8vE+phH1SKZf8sa8mJ28vaT8RBeJBglTJgwLMVWXuQ2XHU74OLEd4NCLJ9rIf
         yv7QdUlteWCxfPMVxxhaI1Ur5e3YANJBSOQoSJUYD5JLkOsLv21wtXsjzpzdE+i1B6uH
         06CMpIsfYbBDAiAWX/aZoScVmQCFjNPA0TrNteALQFXxoWIuTCDZY0ogUdYSyBuNS2Bm
         5ZZ3H0j5oesI3qWmGQs3ltlm8MAGjz3Sx8fHN4TCAkWUxRqcaj4pZTAEWAmZYAFrTMY4
         0JQg==
X-Forwarded-Encrypted: i=1; AJvYcCWjyR/V6Dt2OYWaehjqUGi/oYgyk4Fu51jfDm7lPbaKtKwBtPKrwLkKfvcbvN9TfbdqH6MTkAa/Dr2YhcVIE65C@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh8BaR9G0eoOkNsp95l7VReY2Iygjz+gbRB0YwMWKM/rPNkNsW
	vDOC40y0nSAo9YhDfOggKJgI1RJYwGD3UAwbvWHeJHUcq31ttOymucRRcydtTpia8z2kNWqIaxl
	ZyXKcwYb6FTqBGqfd1scMOiEqkTq9/G1iA1fwQHeC7Tkl28/i0C+nwIy7Ml+FBvzq+ZDJtYTTdF
	K/1Q==
X-Gm-Gg: AY/fxX70Wz4D2FuRfednPsl0Hrp6re9ZOtRnx6Ik4bBdAnUOpfgrZgrEWAhPOnojn3B
	H6iKk0bYo5S9nwEBQi2XRy4dnBkwYZV0XC8PuWL5WmlIN05eJujpqBGHzvdtiVEIS3C7c8PxoJY
	zno70aLZrCKBrVa+kyzKqrtmgjyqvBaYPtftW/rSoXxSK5mHKTYN4odNlzrJyunW3PRqmSh7RLl
	0fkKVagrbqFCVk6zFOs1V1UNCl7VBG2ANRmCfWB0CtDCh+XO/FqrXl0CB5LrApHd0eDL35vBUzv
	NhHR1GvOr57TLYtUC1FXh+qi8HP/gcxdlislezRx3td53erptvPxg+BSoga6o8a+ftn4mOpKRpp
	3Fgs1wtC5L3ePpz29Me5zhbmwZuhg6e7FAswEsw==
X-Received: by 2002:ac8:5dcb:0:b0:4f1:b9c7:18e7 with SMTP id d75a77b69052e-4f4abccf5c6mr34585641cf.4.1766138907170;
        Fri, 19 Dec 2025 02:08:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVRhXji1ckLD/m55ts+YyuKwNuhTK57fef/BjMCO+TpK2cXQDnhsPIAXLhF6EwDS4P7T8fHw==
X-Received: by 2002:ac8:5dcb:0:b0:4f1:b9c7:18e7 with SMTP id d75a77b69052e-4f4abccf5c6mr34585431cf.4.1766138906730;
        Fri, 19 Dec 2025 02:08:26 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:a48:678b:dad2:b2eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm4209571f8f.27.2025.12.19.02.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:08:26 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 11:07:40 +0100
Subject: [PATCH v10 01/12] dmaengine: constify struct
 dma_descriptor_metadata_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-qcom-qce-cmd-descr-v10-1-ff7e4bf7dad4@oss.qualcomm.com>
References: <20251219-qcom-qce-cmd-descr-v10-0-ff7e4bf7dad4@oss.qualcomm.com>
In-Reply-To: <20251219-qcom-qce-cmd-descr-v10-0-ff7e4bf7dad4@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2241;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+yW7g724zkTvi6c2Y4D2hyvIoUGp0kLpwcBoXePSCu4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpRSQNfXlXxoKASScjNexD0hZ6xbMQ4AugwhXcJ
 QtIJsvcd2eJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUUkDQAKCRAFnS7L/zaE
 w4nmD/wMOcgJ12ky6dBNZro/3cEdNyVhXZMXROTbJhW5DdAI9vURbsijk+VvT7ztuHXv22Cyn/c
 sZzVeFB8oEPldbm+ZdgeLteCQohv5oUUUntYsOs/J91F3JoeWnl4YdHLo5cajw4RVcWOduQR0F7
 LLm0E6kfE35ed/hIpHIy60TDduWQqvpyU7J40R7VHVm6o2nFPqycgXyo0qOwk6jp5bQD7uW9vV1
 NXbLKCvriJ3PPHRolnomJ6WArmekBtYZmQknlN0IhmOcoDkHlHKi4IBB8SvBL0vEYgeQVhvQfH5
 vIocD81ia6ZyZdTcDXm5eziqMLcWS6brIjc4i1IBd4MVQsSIstmBvQrvhPRwh8Okj27gjbd8525
 uHDLNmoYUkMKpWsUvd93tPcoyz7ksGR75zDIUWsidziGi2Vd3EdIDhZLItlq0SJD4pNIbaMr6oI
 oN7h/B5/RRNSzQxtQx0pLzwq+iKUmQXdiVerrWRx/kZByJZKV0iFrqQ+CVtmD2F/O5FSonQkDKH
 B8ftFXwsko9xknwKX1F9cpQ+tAu42wIUOccTXq/z2n9bAPJ5HjuS6fleF1BI0gF6tXPg9s1TZ3D
 eW0wgb63pVTkHRsCUS80tKAHB50GqUyI8eiPkL5FB3/HqMWJBOoeNG3NEhHgUafYWqIcQV6Rtl/
 rwSQiRrbvpiLrSA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: pq9OWvO3LEf0rW4PaIKSQASYQZJhFlv3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MyBTYWx0ZWRfX22UXhVpJpWUq
 QkCdg9X1fW4rSEYWOfGdfIFLUr9Oo2QUv/KHALRELY69sVzm1g0pW5NT2AwWiREO5lHBlAmCoNU
 LXBYmzLfi0hnUMQUr2SGYYoZT3bVQh7c0Eh+592hAmEX782vB8INo+SI96heqSYtBSKfwFWYzai
 AkoMcJNEVfeyJs4ISk1sPJsM8gWuA83j2Y+ls1mc8HTiUb8rUZqqJmNZrgXHkiPT/2vOG3G0lME
 JxtmLyOpBL4Zpli08kiiekZX8ObU3owenia3nYvYFhNvxdqILAlA1vXu/9Q6BtYbhnStw6yx5Uq
 oR2dH1PXgVW+pvhDdnpVABgIUpryyz5E6irRz17S+JVS8uw1xORPsG7vovQcFXOxkNzAVJddReM
 LMEEL6e5yko68JW0R+g1Sx+elUMN94VNPMIKrrj4IpGmaMMrHrfDbpCOCvtvP9x9VWUcARlnfUl
 lYpw7IPfGNynb+dTVGg==
X-Proofpoint-ORIG-GUID: pq9OWvO3LEf0rW4PaIKSQASYQZJhFlv3
X-Authority-Analysis: v=2.4 cv=Lp2fC3dc c=1 sm=1 tr=0 ts=6945241c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=XeVHrwws4l7kqE2Ex6IA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1011 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_020835_516056_A490BCCB 
X-CRM114-Status: GOOD (  16.38  )
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

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/ti/k3-udma.c        | 2 +-
 drivers/dma/xilinx/xilinx_dma.c | 2 +-
 include/linux/dmaengine.h       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index aa2dc762140f6eee334f4506a592e72600ae9834..75c8eed063af8daf68cd68670abba211740dd11e 100644
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
index fabff602065f6cba23cff7bb4f305a3504230a02..e2a40e8dd4b20379f337c1017f8accebeb914645 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -652,7 +652,7 @@ static void *xilinx_dma_get_metadata_ptr(struct dma_async_tx_descriptor *tx,
 	return seg->hw.app;
 }
 
-static struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
+static const struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
 	.get_ptr = xilinx_dma_get_metadata_ptr,
 };
 
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index 99efe2b9b4ea9844ca6161208362ef18ef111d96..92566c4c100e98f48750de21249ae3b5de06c763 100644
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


