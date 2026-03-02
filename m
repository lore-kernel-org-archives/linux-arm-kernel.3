Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 688FBEA4E2A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YTHMQ74pG40cf2TThEo/dQpxpxcnmIMpmWq++2akSHc=; b=DuZCsZVApbobmDaLaTbCk6bjwM
	Vo62q6pdWiS27IMNqbHalnKcgrM2vCg6qKjvdKednWy8R0Rrcc6hdbnf4lRx2yU2CwKIyM7fyErIH
	/k34mQICc649Y/R6MVTSZIKh+96PoHTE2qn8arBUgNzjaMdlTDMajFw4jyJ/t4sPlQC/XshNVKsZE
	WoqkhkRthe0U6xqOrwx1NTB51Y1oTPYxOE8BxWeL/h6EOPRzyby5L/9fF4w7LvDCtV4f0gXJT6+WO
	HqI7HthhrcJx1oIwGZTO7Af+rmuTBxcbRXHcjr4mJ19YgeDLczl3KlHq9AUgUVy1X1n0xtFqzM7F3
	H2dLX9Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5ei-0000000DQ9j-0sKd;
	Mon, 02 Mar 2026 15:58:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5eg-0000000DQ6w-3Tcm
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Mar 2026 15:57:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=YTHMQ74pG40cf2TThEo/dQpxpxcnmIMpmWq++2akSHc=; b=EXebm/vKkWxt4/e5SXY5Vva1U3
	pzBvqi/Hjr5ca1J65s2T/wvSB4DmgaSaTw4Wp6BFxPi4YbeS6BkU9F/RnuQRxFvqvl/S8/Ld+tZ9e
	Ximj7K5Qc0H8A+I1mKGKV65FB4JZQy5iT5tWGd0zLJf1JHvmW4SQfG2a1drtt0Jm6hMQNetmRHqFL
	BiJxyPU5u4P0oXpPZTacm7WBdVvzOm1iePXKUrhlAkVNuwfcON42UYV+b03kv+cjvVdri41t5kX4e
	JYyKfO228leeqLsuWZrKg0gknVnD3+zaZN0xt9iJZtktbWk2+R7GD++i8JYtY84hyRCyepB0PeQAF
	QucjCu4w==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5ed-00000000VCO-3LIu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 15:57:57 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622FooUe3741564
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Mar 2026 15:57:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YTHMQ74pG40cf2TThEo/dQpxpxcnmIMpmWq++2akSHc=; b=lLQlqDBdv9RwvqME
	yBGs4nQ6md19yry3vx53hoMA4iTI9D8LDJOVvquidw7pWr3C2ACNmXVLaTfNATg5
	K4cb2Kep8d/g1SriXpAxFJdiCbo0mWaNY2/vtBX1GznM/B+0tg14MTiOVjSL1LJN
	pEfl8m0iJsNPcrwc59+ghfgorhlVSTz4WWokjTKdm1HkweluaexxwOjoBQw+2l+l
	b34TSYBe9e/9EedeqQd0H38q896cYJ3osgHbDBa6NhsmwFmQCZj3k5MZBAZ656ST
	cxTkGPK/fijtah67StX2Pi26fFUNUT/lVSRrVjl1q6jcd3wsE5CX8Sw2g5GLgsHt
	goyObA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7trhbbk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 15:57:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71655aa11so5143892185a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 07:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772467073; x=1773071873; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YTHMQ74pG40cf2TThEo/dQpxpxcnmIMpmWq++2akSHc=;
        b=aFa6O1/0oLc1DrK/T6m7EqN5jq7sH7kSfdKSXb9R7ZJy8NONACHougTC4pyOeCV39g
         SmHkXdm5lRylQ4FlZHjVJihcysBVzxKUYXZuObUOOYpK9JkNp8dZkR0SPmyohYgDe8IB
         Uc0J/N5mQ+QbvaH8JXDKmZWHHSr2alJcggn7YtQatsDk9DV1/0MtRYCuaxg/jPK4fyFI
         apiadptM0VxmkPA/UtaUjrUuiHG2SXdqjyhHf1CiXfBOWWfhcELUPH3B/zuM3LH93k2r
         QA4yWIWXIcl70kO9B9i1F6K5v+k7XJ50TK7eVjQjhg5PmcRq7fXgvQ/b2OHvaQ9aBLos
         cNyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772467073; x=1773071873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YTHMQ74pG40cf2TThEo/dQpxpxcnmIMpmWq++2akSHc=;
        b=nLHhxopslv/wkCrqH9yEDsg95NT+yJ1DGnDpT4fsR6DV/N0UFuLkKU4a1GGtXAfn0h
         IukdEIsus4POolnfjREziiOIVzTF9TEDanoo9TG8IHsbEHYPHyW2zlOXXTzzMXUpNJTI
         VvcrRsrMeZA50v62RVTCDzYU9AIYmlm59CyMZjkqRrn2lNuLAFXtcT8BhBMClB7Zcl+W
         AO1spDNnYylLH9OnmXmDA3pPlsSiv8TgV0n0qA3kNGaRUa3HpLg6ZlRox6mo17ICUXP1
         wR2funng7CEiTS/J5K8El4Ha+JvRxOLybdtUwhJ5DHc33eK4WMGQGdPnJI2/gKYkXNnA
         yzFw==
X-Forwarded-Encrypted: i=1; AJvYcCUiAG0UfOE3pzVlVwlP7qBmFTh7YOFq+l8ZhYZPHmYFzBwUKztw4M2hkdaTvxVUM1388jr3MgD2VT8K6vyMVTs2@lists.infradead.org
X-Gm-Message-State: AOJu0YzBG6PLkI7nhuGDGzIELC2ED6plD5d+pMseWW7N0ca4g1bzszwa
	oVr4NIOejLOTPaieq3eOYZntqPxEQOA4jWOkQ1B2voSJy7POVb2a3r7J5qx9Dg8DB7LIpwGm8fF
	OikTjWb5fXIV3giczCglOEcrBxPc6qiILmbwHgSbODWMKT7WHUxyPVTk5XR+vyqvp4aKKgP8flx
	RJrQ==
X-Gm-Gg: ATEYQzzpygERLg0qfd2olY6VXA8JlG7AR795CEaTcViBR8pjNUtdklY+wpD/rzh0Q+T
	UmBgJ+/wHKjBT8xOAFnJxjLYGfjBp/EYxNtVUW/NVhNGZCdL20Ds/TzGZ+Kh+Xu9CTWIOyNEpHN
	YtA1Z3yKw81U8Jnef6LAguei28g+EcSjSCcjQk66v5NfGyJqwPm1b0jrHaho1hmGi16wLLrJEmg
	6sEfnDnPa2z1i0xDzMGclGj26c6EkQj86WlwSjnH175G0YIzFLK2wr5D2MFVP8QA7X62bp3D5Ux
	4T4RBB5NLNepvO8gYazT4LfKC5aUG5bIGgs1wu3MKuVcLXyCqba0Hqgbg5oXdnpOpjmzVBiUcmb
	nv95BzyheerInq9DKljkaNjBZ5XzwWdvKR1eUNLxWQNyy3LpcIO4j
X-Received: by 2002:a05:620a:2989:b0:8ca:ffe3:3d3b with SMTP id af79cd13be357-8cbc8d29be0mr1478734385a.0.1772467073162;
        Mon, 02 Mar 2026 07:57:53 -0800 (PST)
X-Received: by 2002:a05:620a:2989:b0:8ca:ffe3:3d3b with SMTP id af79cd13be357-8cbc8d29be0mr1478730185a.0.1772467072663;
        Mon, 02 Mar 2026 07:57:52 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:87af:7e67:1864:389d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b41831easm11282438f8f.12.2026.03.02.07.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:57:52 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 16:57:21 +0100
Subject: [PATCH RFC v11 08/12] dmaengine: constify struct
 dma_descriptor_metadata_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-qcom-qce-cmd-descr-v11-8-4bf1f5db4802@oss.qualcomm.com>
References: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
In-Reply-To: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2241;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=aUMoNrCGDXfli/Niiqe45turoruXO4WeijyijWZBwgw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBppbNrTjy/ojBhX/ZFgmg4UwznZqz412Fh06ExU
 MrjXRXycaKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaWzawAKCRAFnS7L/zaE
 w0UaD/4kKdICehR+EWUpEJ7Xw3Pn+Zs4aSTYcrf87riNyI4MzlhCH9lalV+/4BgyrQyWXL9jTIY
 E6LoPKCUQ+NdQNJ2vGxj+QpJpzJ6UccaNpN6ZUZK0rvts+QJ8QaXx3X6RBZmGgZOHe0cwxhBUWl
 aNraBhcjruZNqcafqUeryEjGqOqg+6rsfB0md5jISCrvM1Y3HPo3HeFT4vWipDT1qGnWh1u3rJN
 lMvE4e4OSeXuVXrB1TRCawmTN+F4B/3fWGKhTlSIvZoMPztvk3zPaBlI9x7CXKara6Ar0G9nUq5
 egR+gTGfmAmxqNojshzYdq4A/ok0vrNoZInhe4AR885iaIaBZukm1rbb+Egd8oOklSzOi1HMGv5
 OH1ZH+ZBRpeJcK71LxHRL3gLkkiwa4KnaLE45jL+8z2bRwGPN+RHc4vgkcmErEOWZFmN8X1YSQz
 uWCzc5urAtYMJXBFGkovaLpeEELBflXDQeQOpVyAQwdU6C+D0ln4C2Lftlu+zDhSw2+UuBe+WxK
 Rj4TxlDts1Enx2YFfESAsXxdfCIlJm6f7FsF0TEJAWdkm98ziV65XXVDtbT37J+NWU6OQMbGoqv
 aG4PjmKvoMvJz2sNe35Bw+OcH/MrfkY1SS0ewx3s0n6kx79xujbAi+fo01EvBPTKRt2vGywy5kM
 PO6CirSIe6kREYQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEzMyBTYWx0ZWRfX2S3LiZgv4K1E
 crpBZGGD6ZFwcjUwyB3JOQVj/p44TQ1X0Z4Zj9wRIjKMc7QcFUOMRi/5UwFHRy9ACqc98yMC31q
 0M/+8UKNx8PcDIJ3gT2Il8ALS/t/lNgiEYrmt1rNlYmT3bBaCEbKdjjUPqlduQ85XJ5ZY8uQFPQ
 eOx/RKndimYZrPFOqi4QKtBaYZg5oJa0T/Z33b4RunqBCDYmZUfg+unV3k52TqO1mrY+iLbLsZp
 eb13Llj0Wtw66XgjRKJDnz7/VUkkKqiSiDS3VgI6ZJ9uWlfljnqw2GqEmFDjX31RPQW8F5yk+1y
 DCOnSXa7uguF7gQ7jUaONWRYF7M/Q+LJE3uOAFwXs1b3JocQQZXh9yDKxOU0CdVVrtVU1GRrf/x
 GAt8ZdSWo6gCCxYjsaVX/OKmtKAyn7eVPWMFjOuCgkJnqtFBupqWgP3Rv6HpvqjJGl2YfpRF9c/
 Md66edSB/ospMEJTM0A==
X-Authority-Analysis: v=2.4 cv=TNhIilla c=1 sm=1 tr=0 ts=69a5b382 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=XeVHrwws4l7kqE2Ex6IA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 6YG5QhQQqPKgx5pd0kUdoi_srajSDr1_
X-Proofpoint-GUID: 6YG5QhQQqPKgx5pd0kUdoi_srajSDr1_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_155756_218875_72724022 
X-CRM114-Status: GOOD (  16.29  )
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
index c964ebfcf3b68d86e4bbc9b62bad2212f0ce3ee9..8a2f235b669aaf084a6f7b3e6b23d06b04768608 100644
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
index b53292e02448fe528f1ae9ba33b4bcf408f89fd6..97b934ca54101ea699e3ab28d419bed1b45dee4a 100644
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


