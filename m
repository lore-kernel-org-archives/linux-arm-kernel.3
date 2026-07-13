Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F864C44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 13:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=; b=ufjDL+q9JxUq9dkUxCudHo22ft
	YBYqe6yFYKjCp7oD/2qSNoo6zSBcUqrS6l3RT/pyhfKiE1A3YAiDiUgfHAu3OufMAVbC1RqC0KGgw
	K2D4skaeuZjdLjxMp2meAEh1WKux6AYOV4Ay0mTjeRYmCvASa4if5x60Jegd5rnZaiRfjy9eEPoPL
	8u3t0viRwhZF8QCtPVPF/c3Om8E3cifVZfkxTmnuWo9RJNFdEhKW8j78qgOkFdN4Wjt3hYsnWInou
	T96Lp0yR8ShE6z0djJMmf8+BxPPNh32YBFmxj9B3T7n76PsR5pGkoB+zoOf1T58/LZf5ZG7cubM4t
	H/Uy5Hxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGIc-00000009IRX-2F5I;
	Mon, 13 Jul 2026 13:02:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGIX-00000009IHl-1uAs
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jul 2026 13:02:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=; b=QQea4UaRyYHjo7SwfOoZsszmbp
	t9/fD8TeZT+lwHGxaLYTLYrFsOAFLD6odXfSdfLwYFSubsPbSmZWA+1GHSP1QJRic+x+R1ix51Dhx
	xStwtuTsAdf7ShIrVUTaT3RmSGJS4WmgbKtaNHmOEmSGaEPymRLe++r7wk1CfnyWJLH94i4ELOxHe
	cntdCcQ24hVdCcN2cN4e7F+Wle87Fj2/ibTvBMrSyhTqgrZUkeF3ztSKf3hs4NjwfB+yh4keDLuTc
	J+mjVlDWIuj2VCBgcJCAOZT3ua48KNosiJ9Le/PJp5BMgJ0UVA2Ex7HMKPiACW8T4ZI8XORfd334t
	z/pyp9dQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjGIR-0000000BcYX-2kXh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 13:02:12 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCE7J31210730
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 13:02:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=; b=mtKQ6aQhFyuDQE93
	vLS0PLFWn+3ssts+aKobAO4Z3qGaqUVXI5gjuS1xu91JAaK0kAk/MFI1n9gRiUXK
	VZzGPSNz7Bp8q1PLeYXrHFP1zBkaHghZt20UDZxw9SVbih6HTBrYynh9ebRMxzq4
	x7idrnW8SkVIPMMgND2OOJ9L5ZatDG6f1i0qL5BlTCGbRBX68aqkgW7qgO0zmXe1
	exmg4REXsTFM0RWl+20r6ygIGPNOxnnFnAj7bIJimxGs7typmqwCVsb4VRF8/iPS
	4TOkXNTH8GpUVAUlnxv++fl7mtAbYY+u2zDjZ7DLmFdVMOxrhx523pVll9J1dIRf
	6wTqRg==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcw4qrtff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 13:02:01 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6a18bd9c3caso4633900eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 06:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783947721; x=1784552521; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=;
        b=I7/C4iszOODvaUsvhFEOFRTpJclicIZ5NAgsNHgo5vOyvxDLwM67cNiXEtqPNH9S1i
         WDnyoM1ssEcpdAq2nHylZlZUYV9HuYArpGX2YJJ73LZVgA1iLnNwBHzWxMrX7DiQNVGP
         R3YzMktPai+k4V1MTWBAhux25GTNcSh+XAu9tneCTV6ye1btxRlQT7zI46LM3hVi9Ibe
         OJ0vAhKhDGppkvFMdrtJY2ohwS/aOqW24zTmbTmgraxzKZ4VJ6p3O+8bSMHWDwE9k53G
         bU/1uko+b/7s7UHcwRFYPzLTTAcXWBDFroJtUy38JMp9Wx2iJd1UokFLA0XrDdENKsV9
         H9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947721; x=1784552521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=;
        b=FTMTR2BsaZOwcJMdD3x97MTGc+6yGhj5MI8SJda+2gPtlYqSDjXA17P5OIAAIZrD4q
         rkddcuO5g6sNcXrNeZsUulJIbcpda37xtlH/8cMB2rVTPP37i2HtR/3+pEley5DLRf0y
         xmPHR8En3/JodYzx/hTSAu+nzmq4X1LXLdA7CYlX2fzdRTMknoW2JyDX+Pyqyl1zTBOu
         SYSaEV6CB9S6fZXkZiawgaziqTtynJDOSuaatIUo76Xtwgvxz5rmhf2dQQbtdGq9e75t
         PyJj7pjB8ksJMoco+69bei2pxbKycHdyPOnZ+c5BFTrmWb+nD0qJy5UedplLdvv7pIvF
         DpUw==
X-Forwarded-Encrypted: i=1; AFNElJ+SjYXNOprFThq2UPi4Ik06+FpxJET2vD9u6mkfX/6NRT0vTGj9iPZ+izynkd8zx5GO0rYbK+gC6+GCMhSxfhUw@lists.infradead.org
X-Gm-Message-State: AOJu0YzAH8/S0j7CecMFc73xaQ7+wSchuEM1mt2SBrCHtZhtrb2742x9
	PZVTfwVvkPr2gBoaBAVmFnzg8gs9Yr1c1HUyQ3P334aUV23sahEEEESbMNWxs0cK1GyAs73TQvb
	STqBmOxFJKhLeaeZwD5TN1PjjLXyvisYxEUgn9qnQnEgPny2f5Wt/i3JuVzU2GJXKuwLXW4A2BT
	fK7w==
X-Gm-Gg: AfdE7ckRxt4WQnCJTpMpqoJUf6i+Ol+/5Iose66gjZjbR5l32j8BYQ5+mE1Q6bcYRCS
	PvMB16b3rHg7E19DkqqQr7QkanBbWHJCnVbH9xbbpbhJfYdMZqy0u5aaofU5er09U0RskLzfbfM
	o4cmWj3rnQJay+xvCeSkOH46bSxiBycjWjLMhpsx+LfKzr9SW4t4+HxwTujW58glebc/m9Db9bR
	N4/+y7gpbaGJeT7yXMcgo5ns8mbyvvii6+u4FG4KTP+nYxgFROCjb/qJOZtSfFc2cIDA9bH2B76
	FMfnFqw8tI+S87WFunErtoGZygrykJ0AE/kAPL9p3cDjFbiCLtqUXSJ5EJK8FVR//lACBQqiuig
	/MUuMk5pg
X-Received: by 2002:a05:6820:4cc1:b0:6a3:916a:1d26 with SMTP id 006d021491bc7-6a39a8561bemr5855908eaf.61.1783947715865;
        Mon, 13 Jul 2026 06:01:55 -0700 (PDT)
X-Received: by 2002:a05:6820:4cc1:b0:6a3:916a:1d26 with SMTP id 006d021491bc7-6a39a8561bemr5855857eaf.61.1783947715189;
        Mon, 13 Jul 2026 06:01:55 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2d97527sm306129725e9.2.2026.07.13.06.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:01:52 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:01:10 +0200
Subject: [PATCH v21 09/14] crypto: qce - Remove unused ignore_buf
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-qce-cmd-descr-v21-9-bc2583e18475@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2066;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=j6XY4tGbVrzzivRLNBnBuYRESnCKLFI7yXVP5haQkuk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOGeHIeb8ttU8NMHmfvZe/dnHD8TlSqP+D4CC
 DKyl2r0VFyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalThngAKCRAFnS7L/zaE
 w3GID/9wtsZ7eG9siySdL9ECGYbUZMDbkEeFrIkn7nhWh+imlHfzg+aps1ekYXqrnnKoNpMAcYj
 s5S+a7t13UfMF0H4ezCA4SmKeySbw4Xza4+KOINoRrCvitkyhrOhRnOFTGtL5OYdsxUi8vBYxfA
 bhOYwwMqCw7xtvs39WG+W+ugZyCQMBrvMOVao1ZTs/QOVw5JdfTK7Enjn6CPI047t7+XtVbdcnR
 AO8b52ajf+00/8XS9y2hWNMhT5hPJq1QjkwjaCBTObA23ROM4Z7cGEXjrn0TNSwFOGdiBaI7voe
 FCJ9VyAiQ3yRc5198Eni4HMzXj5sqx9F5X+ZYs+sd8lJrvAld3W7gZMIZ3TJ9SZ8cpTzqmMqUqv
 pwheSNQn9xKZ2M+opu+1hy7/26q5i+Wk/hNPr8w/gYP29uPGH2/ZCBTwH3mHbK4Auw/w8oHI+aA
 q2aXjx9NPwmqdFBvo7EHkgNDmckjNdXVmbg+pmujnI8AeKsKpVqartHSq2sVSrE4NnFPbjGNlfJ
 GYyJNVtENy8vNNqtCs2rbm1CX4Cp2nNLnd4GPm257Yy/HS1E8BhMfwaVKgbqszK9Zx/smc3DJvT
 pOtMoWNgul11dbGF21pBRIe4dSyZoJ22b64Quq16v7iBe6XsVrKSjj3xPBP9JsDPEYNkrtYJ8vf
 9BPGsifSF6T4yow==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX3Jz3R192gOi6
 5sqrM4Pq0TOFyh1pqZXpqdO1Sq20XzBHGPB2/nkuLU4RGPlfaI43HjT37IIp8qJoYYx+C5px9wN
 ETP7nd/0E1/mZH5u5f1Pjwd3S6XJtbD6alovBMKDZvhyb77W7SzETYFV1E59acGNPNfN9ddbCWN
 FSxQ/8htOEclOPrdU0DLAYr8QvTiBU6AV0pRuXnSPZft8004h9HrD9zwggINF9LkzIBXpuG+4YT
 HQhnIkE/vVBwuKCRY5swrVo3huXi0J0DUclbc5JiRj9VfJFXdk5YIamvK9jbq7XNMFlAf/z1/lD
 owKC4bRzMt12DHUH39EEOZnnzv/rmCMBx440lgcIxBQlu5rzM18pmb4sChqhAI+Mq0CPM48dEl6
 fMrjBdqg2fcIwCySe+CErzpPKdWKRwYdOOldFKDGWQdMXrYN2siJZ5eCZeLPH9HEzaNVnnwl+0s
 VZD2lBA/OexlvYDiwsg==
X-Authority-Analysis: v=2.4 cv=HJrz0Itv c=1 sm=1 tr=0 ts=6a54e1c9 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tWRRbWwrKX-5tUpmLDIA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: GAgQ2D_vuvsW3HqhbqGCbghGD4NxpN2N
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfXzOu/qcPg/Bz8
 PEWKMqcttY7mDCdrejt+Db/3ojKO69d2B3md4UPQf5Py5bRVqiH95AlqPcYQyULq/jdB292xYhj
 kxKa4L0stNG2/wLLWHEDwXxMVnpv+es=
X-Proofpoint-ORIG-GUID: GAgQ2D_vuvsW3HqhbqGCbghGD4NxpN2N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_140208_181472_E4E5D574 
X-CRM114-Status: GOOD (  18.46  )
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

It's unclear what the purpose of this field is. It has been here since
the initial commit but without any explanation. The driver works fine
without it. We still keep allocating more space in the result buffer, we
just don't need to store its address. While at it: move the
QCE_IGNORE_BUF_SZ definition into dma.c as it's not used outside of this
compilation unit.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 4 ++--
 drivers/crypto/qce/dma.h | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 7ec9d72fd690fb17e03ade7efe3cc522fb47e1ac..d1daa229361aa74da5d3d7bfe1bc8ab189761e38 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -9,6 +9,8 @@
 
 #include "dma.h"
 
+#define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
+
 static void qce_dma_release(void *data)
 {
 	struct qce_dma_data *dma = data;
@@ -43,8 +45,6 @@ int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma)
 		goto error_nomem;
 	}
 
-	dma->ignore_buf = dma->result_buf + QCE_RESULT_BUF_SZ;
-
 	return devm_add_action_or_reset(dev, qce_dma_release, dma);
 
 error_nomem:
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index 31629185000e12242fa07c2cc08b95fcbd5d4b8c..fc337c435cd14917bdfb99febcf9119275afdeba 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -23,7 +23,6 @@ struct qce_result_dump {
 	u32 status2;
 };
 
-#define QCE_IGNORE_BUF_SZ	(2 * QCE_BAM_BURST_SIZE)
 #define QCE_RESULT_BUF_SZ	\
 		ALIGN(sizeof(struct qce_result_dump), QCE_BAM_BURST_SIZE)
 
@@ -31,7 +30,6 @@ struct qce_dma_data {
 	struct dma_chan *txchan;
 	struct dma_chan *rxchan;
 	struct qce_result_dump *result_buf;
-	void *ignore_buf;
 };
 
 int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma);

-- 
2.47.3


