Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA94FCD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 14:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4MzlzgFENj0SGuc5BtzYXGLVYZCfinPwBm1XxV5rC6I=; b=kF8cwBJLVsR/pNwa3gZKnjL++N
	Fv64ApYwX4UBl02rH1DAfCG3fC+h1jY10qB6iMIQZDD9ZZ0sJkPh35WMjFyEaPoFl9LDJW5k4c/GA
	TIVWUiI/Bb4NzGJEin8ede0UYTHvt30UKfO7wBlCWg+ZaV60MeTPA67bUjEA802kDkxU7tk+PTjQ5
	4vJtWK98AurJcM35VGi5HtM420Cl3UE0ctvKilmGpGTRkJ6LYgwj7XCt2UEZGGoEzGGxEj0QpfFpF
	QeQabG5auleVpAEBG3MIaMon9qA0XxAIxMiq6FVNv6/UhfcXpi56SJI6kBHDfD3QvwPAKS+7mDINT
	zPqSYFqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQ7L-0000000B0tv-14Rx;
	Fri, 22 May 2026 13:40:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQ74-0000000B0fD-1hX5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:40:31 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MA49493947391
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 13:40:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4MzlzgFENj0SGuc5BtzYXGLVYZCfinPwBm1XxV5rC6I=; b=Q3BeDV7bYs6Iisvy
	rVyqZ8B9BBRjnkLdFbF4k99xPuPt1P0Crd9bzejmb1Qm0a6EvrUvFGZK/aKhsia8
	sPlJBJhNbL/zwmmfAW01mgIDDzHHHncCcSzXDrrQZcXUoRzq0P7rtRHrKi8iOHqW
	odNss916PK6JBOr57rzFIKRDOyOFPqB460GgX1CIxUnThwQObJ5x0hj5oLWjSuBX
	z1OUdiok0JKRHmzezdMk01Bb8EC3ywqUMhD7c1j3XpF9NWTHqoE+BqblLLSWBe1m
	3LlF84PepGhwQDdTpJiwy1a7H9CrlDBnqk3Cc30PeDRphnEWeDugJsGoI+T9wmat
	4y0frA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean2ngqbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 13:40:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514cbe73d00so218101821cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779457229; x=1780062029; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4MzlzgFENj0SGuc5BtzYXGLVYZCfinPwBm1XxV5rC6I=;
        b=YszOxU4onTeUYz98Z8Od1+lMzCwzQ9VOKUF8rBg2Uf+w009ZRx1wkTSRnoL1HtWBQE
         sQjxFS2ENAoWLF4ccKZuTj2RPRSO0Ag3Qex/N9gnFWYl2UAL7vGEGiZmDczkPOWScqdE
         54FcdJABGK4aqVbI3l9SaJfcviDFGz3odUtQb3Js5SjwzW1MRrMACrxj+87IXHZdvYOS
         1KmAQtg4Ij4p7Q+zFoJ7R0LJ1VJ506V14j4lLbN4hApsMH70SOYdv3MsNnEVop7FnBvA
         wNcUk/UYmPBLAl5BawZc6lcFirBt9qphHXcGysctJk4SnKFTP8yvkaUloFJPveWGdZoI
         BGXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779457229; x=1780062029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4MzlzgFENj0SGuc5BtzYXGLVYZCfinPwBm1XxV5rC6I=;
        b=AkyVw7DH5T05HwXCguY5xhZjO7HGCuvhDdz/kIOhK/KjMemVshi+/RKJmysA1K4CZ9
         fairY8NigA0fCsv0UHxR9Y/7XhNXbJGE/emIoNC1FFbSRza/9lnBD58U/5jHqn/zbqMc
         swe8IhqbDzMmVsT6HzrnEC5X4q3tN4JBjBbDv2aIFz2Oq5cV38SZEh5hYhujHEapEBZm
         eEs5Ka9Jkw08jXiKmRp+0D8jUtC7GkQTlpSO7MmnP2fG4fUupsKS3ZCUcpmzbQFm2EV5
         BPFkz12e/K9xCXxHsayczQnk3/+oSUXpkQrTfKtPy7uDyun0D8cZYP6GgGyifVq3UYzr
         oZow==
X-Forwarded-Encrypted: i=1; AFNElJ8E4XsCd6CORT96NFyvLvoCclqfEHg1lwlc5W7gjtyT6KIlEXaCLXKevAcw5c7TKCMVYlHEnmnaVL5GTTLMiNCR@lists.infradead.org
X-Gm-Message-State: AOJu0Ywmf8J0yNqvjUm+MHGxRGWGm5wM3uAHbslrURBTsJyg+PiFEPgZ
	2RkglQtqLmbiYXLeRI2kCTNNO6o5/v3NkaFzH+p49w/oFx6VRVlwMuwJ5kJ+Rem0gk0xtcIXNhO
	vuKDbbdmPcGsAVi/dRAq0XygBlKXkfUrj7Q/UgbXut+Bxl1S0Bcfd9ZYbSiJHOwxtSd2Mw3n4sQ
	1Icg==
X-Gm-Gg: Acq92OHsQp7Ld6+WAbfI1KBLfplLqTH0XBj3iGWVbWuue/XqKO/g9SZq4TL0cMVeRyq
	c3erYy+AasG+dF3BGJEcHo5X815qvo9tdu7IJybdoyb/m0VUwPoIq7ag3HL6k1+O5ZDTzRNiOJ+
	+VANC2KBJLhhE/LhY9rvJZof2Z1PF7sihW4KfHyjDhITT8jscuonupU48jI4Al1I0BzUKdBQaKj
	mbFSTzQidc/QEg9mF2ZTYrq/GX7mJHA/AY6uTS1pweTWjIEybSqVr7bH6E2JGVvVUAWgFCOY2Ss
	IBdWRKX6Z1MYbEXXtCTqg87t9pTVW9uEn2w/EK9tU1XJmbCmgG/WCLw4MNERrgYjzgg/juqYSG8
	US2+d4abJgTyl4XWUxKMOPLE7Mvndv+8HwNmF6QDE04i4JZVJzg==
X-Received: by 2002:ac8:58d4:0:b0:516:d2cc:5160 with SMTP id d75a77b69052e-516d459212fmr49798761cf.32.1779457228723;
        Fri, 22 May 2026 06:40:28 -0700 (PDT)
X-Received: by 2002:ac8:58d4:0:b0:516:d2cc:5160 with SMTP id d75a77b69052e-516d459212fmr49798201cf.32.1779457228286;
        Fri, 22 May 2026 06:40:28 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:2fa:6280:a48f:fb37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454c600esm44912825e9.3.2026.05.22.06.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:40:27 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:39:58 +0200
Subject: [PATCH v18 05/14] dmaengine: qcom: bam_dma: Add
 pipe_lock_supported flag support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-qcom-qce-cmd-descr-v18-5-99103926bafc@oss.qualcomm.com>
References: <20260522-qcom-qce-cmd-descr-v18-0-99103926bafc@oss.qualcomm.com>
In-Reply-To: <20260522-qcom-qce-cmd-descr-v18-0-99103926bafc@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1530;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=XWQU2M8GNJi1hTXicUIAjauPbHJI4z5KvicdSabu0NQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqEFy3+8CwAWUYGtz5ChFcSpJ0iDTEYSKzMHbak
 OKb8pYpuFSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahBctwAKCRAFnS7L/zaE
 wzgID/9fxcVgxjsMMtcsIfMmsrA6TLSsgpemAxxT/40RvT0jg5qrmvtvuKjU7DBA3LruRgkIUBl
 cH6PqVB/NxyAEgQJ2taTQUiIJdGgcFZxckR0jq7LBCgH3vlQX980piQjxK4JXi3CR7PI8k0eC7Y
 2LLbZvn2hM8DLjnY/ZqShrSvILBra1sJZt8aREI7frl1ZN9qeoqNTT1txH43L/8+ovfKoIMWK9O
 4ZCQ31MvqIOgpOAKDIvZGMk653f4HpcH5y9dmO/j3+MEsPcE/dM94QBMj1zYPSKpUliX+3Gjs99
 s6fOret4uXBcgSec9BfQv8vOhoG7dB7KsUHwHhyWi3hkkCcCi1LDYUXV1Km2Fe+dNZJFLkF93vy
 f6b0O1bwcSWyUZU1Cbso+mETogeowV93qnfGDOs9wUpgctZF9Q/5B0hjOu9omJ8+bcpSIWdfQrz
 OdLdKNTuEWawDE/ih2ASVNoe8auSHcbM1QReW7zW05PTL+ZQN/Ls5k8jZr9K0Bd5ResQIG0uC6+
 qlmekYdXlM4XIgA3DNVoTRyLeaKW9ligxe8c1bGvfBWNar3qokt/mCDyZCgEW9CB+e062+k6BIG
 EYmdGM8dWBzvjH8aNsMaEbToKdMrWYaLaHi+LEUpkSBd5repkGloyVsaCnbzzwiE/3z0TuOGS8Q
 ZFkWIwO2J7wZuww==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=XvDK/1F9 c=1 sm=1 tr=0 ts=6a105ccd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ZSnkYuKn9ZpO9KHknGoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: WpmWwt7P29YT-OT8NFIuK4TyLyLl6aWE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzNiBTYWx0ZWRfX4onkm+TNEjyO
 N0qWBEhhUZoFtq5lKRzOHzFqb6lIrIXm9FfnzGZ3C+1d/AFBbfT1ZnsZe77ac3YHT5nGexQwljZ
 sjdvaTiswPmgSyUSfX31BSyNQyLs4c64QhL38A3iUjgmzTYJ0EK/2X9hLZOxYhtwH96w75exsUt
 RZt2V8o+8ddNWcqg9wX4q9MljdnW9VP53qxHbWUhvspnYJuEK7axgoOmy3ucl8csN941tASOTNh
 U2eAZaMk2md7FCCH0H6pEacw+fHaRM4kad9Q4iZJMPv46Z6ozsXdfDB62ktgV8a/0ou2ddNFH5W
 U2q/sREN78ZnpdUYEOS+ZZo+OVNvchEEd3/nC1RlcQAkk9jwmskgkZy+56oxGe2cjsWmNAucm+z
 qPOWgR9MHGbJ9j+CkjHpkdS3n/69J4jY0/iwdsE+XE7C8G/ZMm8RqXYfBwhLLOZdx0NcTB2OWiM
 wL6LDY79e9Wo4+M1YPw==
X-Proofpoint-ORIG-GUID: WpmWwt7P29YT-OT8NFIuK4TyLyLl6aWE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_064030_457907_D13F1A25 
X-CRM114-Status: GOOD (  15.33  )
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

Extend the device match data with a flag indicating whether the IP
supports the BAM lock/unlock feature. Set it to true on BAM IP versions
1.4.0 and above.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 2129ff5261571581a2c086c13dd657dc63e16f90..04fe1d546be73f074c66c4a5712ad65717e10929 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -115,6 +115,7 @@ struct reg_offset_data {
 
 struct bam_device_data {
 	const struct reg_offset_data *reg_info;
+	bool pipe_lock_supported;
 };
 
 static const struct reg_offset_data bam_v1_3_reg_info[] = {
@@ -181,6 +182,7 @@ static const struct reg_offset_data bam_v1_4_reg_info[] = {
 
 static const struct bam_device_data bam_v1_4_data = {
 	.reg_info = bam_v1_4_reg_info,
+	.pipe_lock_supported = true,
 };
 
 static const struct reg_offset_data bam_v1_7_reg_info[] = {
@@ -214,6 +216,7 @@ static const struct reg_offset_data bam_v1_7_reg_info[] = {
 
 static const struct bam_device_data bam_v1_7_data = {
 	.reg_info = bam_v1_7_reg_info,
+	.pipe_lock_supported = true,
 };
 
 /* BAM CTRL */

-- 
2.47.3


