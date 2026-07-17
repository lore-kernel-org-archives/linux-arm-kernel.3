Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C46C2C44520
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eLuzW4UoyjLIBOHVkT1M1Bap2xQlYADrM6wCNEKkohQ=; b=zYStK15kW9WHdRpGeP8vo8qUk/
	aqhFf1YgWW4pxMhBEKPCUW8u045A4Qu3Anj1C5hT+yp9zkVYQA1oLK9O86EgjW886OQPGZlojVu5Q
	qnkpx/56U5i6NpdP+5BjEs3c248BgfyuIgGJOskIsvhwSWKvgtmTnMeedQx0Ny2FaIF9zzWhFJDZM
	AcUrAwwr+LVXt5lyhMLzrrz0LH9X1mWMwe8W4jw+QmbDaCeEWThglN5j3q/Lw729XYSudS8QFS/je
	rBeS+fg1P94rpnsmn7PWLafyI4PXSb4uZDKV/1PXoHeqskzYeHhdG6seGMHt4M42Sn2KXa667agfA
	OQ7CaEFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke4e-00000001gJ3-1isV;
	Fri, 17 Jul 2026 08:37:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke4Q-00000001g6Y-1YUC
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Jul 2026 08:37:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=eLuzW4UoyjLIBOHVkT1M1Bap2xQlYADrM6wCNEKkohQ=; b=N1mqDeSl2wGVhnpHLLYCNxjWxM
	nEH6aTcQvj7o8pXpEdVW5Ufhyxvy3sso4hQvG3iNMnez1tHDD9nCAB6839Vb3mmJRVnCrSBkPR+A4
	G1qY0dZZA90QpRc2OKqdG1qJ11DLy8cHr6OCP2f3orsMhE4LAZ1WoQ1XFAaENS3bV6ghlsulZ0Y8Y
	OeKGqDsiDxDd/mEcYfYoiDmYNOvulHmea8vFK8GLbUE226ZJFJCIoZ8WPSIDA5rAaNpXlcXWJcyOa
	/Soe6PonBPp9c6lq+NA8cR6Xc/XMIOk0r8vHrVdgxAejSW3WNB/cIS5YZd6lU5frn5vxJXaS+Ffie
	emRTjagw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wke4N-0000000Eg7D-0yWa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 08:37:21 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6ciHg1078396
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:37:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eLuzW4UoyjLIBOHVkT1M1Bap2xQlYADrM6wCNEKkohQ=; b=OTy1S8iB6TaJqvH8
	WBdZGq4tVrWuweX3PSHP3SDE7XwhjqUU+ADY/tT58Y1caBW7pW01qJEjT8E2ll0t
	gNR9fGLBfU/OWw3NrNOmG8ye9fYpQjuIKAa/6ov4tQeqWcjcBCKwuEdS2OaPXsmP
	sKEOuBGd1cGAv7L9WhU/Bgyq7yXZR2hZuiRzO+68gCeWYCCgQlf88tBpzAWECR8B
	cTNMerE+iEkmrf6EgI1PFFTyktjEjwqd+QxWG2eiMS6L6dCD4ftvYLRsIK9XCNcA
	UmG69l6gN01dz8bF/WObCiuqUqnt/SDs88ahL4ComeloK+SOnRw9QmjtmwkFSDbL
	NNNNng==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feym1c7gx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:37:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0408254aso27430421cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 01:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784277437; x=1784882237; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eLuzW4UoyjLIBOHVkT1M1Bap2xQlYADrM6wCNEKkohQ=;
        b=CdOs7ufkoCAogWaaFqiqzAViHrVzePTaLkI/s2+ZWkVnH1P5uhsT0Vt81Szj2dS+J6
         XIA2RO6NmEhFroR5EIVT5eDaA1x0X8ZjSfbdoddTVFmgbkNsiKx5aVv5d+ZWpLP7QvGV
         UwNyr8Iogd/PE9fxmGzVK4b8/KtkwgXzZ97qFNZupsgBlgQmRbEyHZqMVKnBhQbn7kXB
         ZHxcJMTVrj+cMTG5Mo/q6ncGhxbzfR6/xZrmp6HSGGn2z3mHHr+11oOysPErSEy63nQ6
         6WZg3QatgmLyBiH3lTEJLfH6oBingim0seIXwbh+zGbipNfycbW2XvlrLAm3uQAdVXTr
         djfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277437; x=1784882237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eLuzW4UoyjLIBOHVkT1M1Bap2xQlYADrM6wCNEKkohQ=;
        b=AhtHNRMFsPzIQpxjtk5zB2H1VyBXSNrJS1rxLOxs05SiWDrQGC2QCgaXrQUUhfJ8Ua
         Pjs5Agu3ThW6cQR+tvtrM+25NZIQB1KbsHtJPy62k9S6iCZrLdimxIHfKAFpaBc0bfcx
         JgXdfS9swg4c0vB0TJ4G+f8Qzmkdp26ixMsEryJ6vOcqN5HzBdXOMdnvJr9HtXD8Henl
         0KYyVm/3J6eJtmtDQFRIk0Y2hVBvTiZDyJAY8AuAMSgqvDhhRP8r+VKf2wowucs8JEF7
         r4lTolUGO+SbckqDqXAOOq+OUbRCSgdscIiolY++O9O1LyZFjUQk1tnBO4OAYkHbnttI
         0hFQ==
X-Forwarded-Encrypted: i=1; AHgh+RrxzynJK/A3mOPJ53109nsEomRstRWZOSv1LlbOWK51gydjwqmP83lL8vkaI93SSAb53UaXCNlWIVfqmrlDu5I/@lists.infradead.org
X-Gm-Message-State: AOJu0YxBUyuuBadaY60jgCpOQNbfowIMQbJ39q6CSAuwJM99gZBygAnX
	3Mfp80q3ynNtPdS4lL+w2zJJFsdp3XtLQBo74FzxS9ClJ0e536H5BJuuSioRx2xAH4DbUOSCFH/
	H+KHrWAxMjU0gdi/GRFB4S2URnle0WPqH/sHxqy8+C5kToToZM564J9oYfR7Jaz4NtjqaKzbk/q
	aLvQ==
X-Gm-Gg: AfdE7ckhSn42Z+pn7FcC7zCnt2xWA3S4JanahAGyTyKG39k/oOaU5MqoUbSQicbCYT2
	5Piv+spD/06JCRPUkRaXIHk3uuXjNfwGGt05xe2fUxSUUs2Lzh+cLRCUNSnhRDVZDfCbxWQ1f3Y
	qgCaOwWBiOw/JCPDaTw3Vah7XOWMAZTQ9KoIt3YP6BaYy5043+44jxl3HehAb7LRLj/4m3dXtIg
	9JCzayOpce0R7DPqtKWx8QUS2idn70vOcTcVBgf2q9OEfrcDbQ15pjF+aTmzK1URB3HZw6yiw6B
	Hy80rSgRqiLw1E5LUju8krUmogegiTB3IXSaj5MHEwG9CunaJhkjB1MVKitwXX1UIfK7hziaVzI
	uEWJBptMEhG8AnVsdHRAqup07IDI5PQ==
X-Received: by 2002:a05:622a:1e0e:b0:51c:d1c:10e2 with SMTP id d75a77b69052e-51fbf3c1556mr60857791cf.12.1784277437078;
        Fri, 17 Jul 2026 01:37:17 -0700 (PDT)
X-Received: by 2002:a05:622a:1e0e:b0:51c:d1c:10e2 with SMTP id d75a77b69052e-51fbf3c1556mr60857551cf.12.1784277436672;
        Fri, 17 Jul 2026 01:37:16 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dc44:5b1b:5396:79d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b893dsm31268205e9.8.2026.07.17.01.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:37:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:36:37 +0200
Subject: [PATCH v22 11/14] crypto: qce - Use existing devres APIs in
 devm_qce_dma_request()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-qcom-qce-cmd-descr-v22-11-ff0d18b27246@oss.qualcomm.com>
References: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
In-Reply-To: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
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
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2502;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9GKLcUmlCf8HlWjhhByBBy4VvPdK7WbPpBpBdYahW+0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWemfZMJ4DaVPL4HimdLsqe2sPp//CG8OY3J/W
 DvqS5nNBwiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalnpnwAKCRAFnS7L/zaE
 w7L3D/4uCyH22h8Ds4sXw/INGLeQEZEBStbObfc0rUoi2dXWKuR+ZrjX91ZPHO925XylAZNgY/j
 mbgxPXgul8wZQryCtCMGSTzoA5qGvezACOfNRpb3KCCi4JK+RT4ZkK0qGU6PL3xRkNwJbBJT4It
 roQEwBJ6ttQBCK5m7hI2pfL6NgQOiJ9/ctBpOemzrrs/VRi823XL2Xs6iKU/HmcrtW4mKg96x+3
 PWkXNZMmTxWXAqKudsnCPFE5W6+F4W1cWdZEqZrozVMBa+Bxha6jCsZ/Q0w8LpbgK/JOxvaO/h2
 7kDQkQMV/aY5oCXroRebLOgvLFj/smA3wZuT4efSLR7ycE2CaLE+KoniMlCSYIGRSRQrPe0FGj6
 5uDlSnket/7ZL+ymyCFFmZUZuRjbAeAhHV0mL+mVUrZ8CO/ULp1yOqgM2+/jKhrowq5X3oavq8l
 8y2VJPUTFqstKYM7KSL9XzAP1z/jWNcLeF4hBq1SElHiOKqpFU18FowLUC1xmni7W+7AoyUycz0
 +KiLtzzhcF4FzgVefhYFDAbfJs0DMiszM1o7Zk/WMpLWdh57s/YgdsJezp86Eatz+54ZCHUQfHT
 Wlz+jtYWE+8u9aEmVvXTs2A5Vamu+mmDLszJNZfbpPmXGzgiP7Gx41cfyIOnrt6jBbrq5sXHkw/
 3NztCJHWPTWhhPw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=KPRqylFo c=1 sm=1 tr=0 ts=6a59e9bd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=rzIBUVXPi645tD0pnwUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX7UXpb2PCh5VY
 ncg0+ykZLvIMFJtIWbda/1H8j3AWK8a4KJByvIc7cP2rZkqQ501IwlkOMVzkkS3ZYQSn/mo5Z5f
 a7I4NAQvScRX0sxvK9d5napYVTlEQaan5jc0wMCY2a6/Rxt2HwDq9CEo24kJXXlv5yECLa7SX7j
 q1pnAJ4Xs3kP6PNxkX9eUSzk30xQQOQNetRVeVWOTE12VI+1kmT9TZkWI5tgGvOCTH/gBGEnW5E
 nlHupslL7TqaSmXnlZX9+lWluKiv8AEfpWtw5fwKHUz0l2nu9ZU01z7p0FYTSumsDBUm1CsK3gi
 5M28HmIaTm3Vl6IGl1o0NYvhfrMti2fv3rL/58VbYtgoDiIs9FCgvfD3wlXS3FzZBe9fW1Yotcf
 +wBVaHF34EnJZ/oS43x9SUV2zBLPW6Hl5tdhEJBWGu9vi6HC9uzrNZsebIuTSULdA3GtW+0DW0x
 GujqSK21RIBMCkdDWMg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX2q7hf0fOvK59
 4zXuHsnBaTacRGUGKbABDM3UCQ0ev/SvfND/MrUKNcR+GlnraDEkkAZUidTxxx2AU7+tK8sfmEj
 evqoktZHpY6ajXrYhsZuXym+f1M9OOA=
X-Proofpoint-GUID: 2gLJghIChomyQVNsuLqd43rbI7fF9_Ay
X-Proofpoint-ORIG-GUID: 2gLJghIChomyQVNsuLqd43rbI7fF9_Ay
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_093719_808847_73322D35 
X-CRM114-Status: GOOD (  14.24  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Switch to devm_kmalloc() and devm_dma_alloc_chan() in
devm_qce_dma_request(). This allows us to drop two labels and shrink the
function.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 37 +++++++++++--------------------------
 1 file changed, 11 insertions(+), 26 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index d60efb5c26d88f8b0259b1dccc8724d0f75571c6..26347e9fc078adede712722107e74958538accdf 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -12,49 +12,34 @@
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
 
-static void qce_dma_release(void *data)
+static void qce_dma_terminate(void *data)
 {
 	struct qce_dma_data *dma = data;
 
 	dmaengine_terminate_sync(dma->txchan);
 	dmaengine_terminate_sync(dma->rxchan);
-	dma_release_channel(dma->txchan);
-	dma_release_channel(dma->rxchan);
-	kfree(dma->result_buf);
 }
 
 int devm_qce_dma_request(struct qce_device *qce)
 {
 	struct qce_dma_data *dma = &qce->dma;
 	struct device *dev = qce->dev;
-	int ret;
 
-	dma->txchan = dma_request_chan(dev, "tx");
+	dma->result_buf = devm_kmalloc(dev, QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ, GFP_KERNEL);
+	if (!dma->result_buf)
+		return -ENOMEM;
+
+	dma->txchan = devm_dma_request_chan(dev, "tx");
 	if (IS_ERR(dma->txchan))
 		return dev_err_probe(dev, PTR_ERR(dma->txchan),
 				     "Failed to get TX DMA channel\n");
 
-	dma->rxchan = dma_request_chan(dev, "rx");
-	if (IS_ERR(dma->rxchan)) {
-		ret = dev_err_probe(dev, PTR_ERR(dma->rxchan),
-				    "Failed to get RX DMA channel\n");
-		goto error_rx;
-	}
-
-	dma->result_buf = kmalloc(QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ,
-				  GFP_KERNEL);
-	if (!dma->result_buf) {
-		ret = -ENOMEM;
-		goto error_nomem;
-	}
-
-	return devm_add_action_or_reset(dev, qce_dma_release, dma);
+	dma->rxchan = devm_dma_request_chan(dev, "rx");
+	if (IS_ERR(dma->rxchan))
+		return dev_err_probe(dev, PTR_ERR(dma->rxchan),
+				     "Failed to get RX DMA channel\n");
 
-error_nomem:
-	dma_release_channel(dma->rxchan);
-error_rx:
-	dma_release_channel(dma->txchan);
-	return ret;
+	return devm_add_action_or_reset(dev, qce_dma_terminate, dma);
 }
 
 struct scatterlist *

-- 
2.47.3


