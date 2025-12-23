Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BADF5E6F079
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 10:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=or9DvhQwaxtsrAqBQKF2R4HMkZA0UWyOfpa2BBt7/z4=; b=KkEN9i8avw+e6NxqtjWP60m0oO
	nQnTrZeytUFLtYphJng04F/ddtfm+h/iAzsqKmYb71WqDEcPq5f7Y8b+28/hCm/FhchxK6G2g6rZj
	c7Ah1pgMJBKYn7DjBK3BF2JCaC0J7ICII480Ji120ytg/PGmS7+6zdFI2uLoBd5OE9x/1DxBbiF8j
	DOdbZfs495KevaHg05QYBL0uOFpReHpVquFXLiQO6LAFZAosvilbLdSiqBiK4m1gJQE/OS9fnOLGp
	63VqRWEQNoimYPQkGvpZVglpoUEBrig7JBIn2YH5ICt3wgOQgieJhmJPJX5uFJ2icyNxTU0/YehuJ
	f6G25LOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzEd-0000000EonT-1im9;
	Tue, 23 Dec 2025 10:03:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzEN-0000000EoaM-3CXT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 10:03:05 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN2eorF2199451
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:03:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	or9DvhQwaxtsrAqBQKF2R4HMkZA0UWyOfpa2BBt7/z4=; b=F2GLm8R2dREg5sck
	zgwCv6IffFw5EQxdkz6nZX9+TnNyy8LZcekauJxst7CNm8WdkKpH/ZVHkj+qS/px
	GDbP6yrTQNayaiBAkb/FwCXjoYPP4IeJ8jjaPBc2jMUIXkL/lj7vMWlD/Axn4D0l
	rCjL/MvYhL3NNd9iF8EdRvRVZwxSfaUUqhuOFLiDDWRKnPWgf2q9DzEnYJJmF03b
	zH9+8N8WFL6TFMqn7tqwZIo/0lxAR0ZA8mh77yxxGs1g2ItJ1k99KAFxIAjftPcN
	XKqKe/l9ArxoAmdi6nrgzWDkW/iV6O7Gldkg6pYtMi4shkzKgT5f0vUZaj8iT+bE
	ZOwRmg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b73fwurgm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:03:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f35f31000cso67818631cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 02:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484182; x=1767088982; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=or9DvhQwaxtsrAqBQKF2R4HMkZA0UWyOfpa2BBt7/z4=;
        b=Z8kcoYAPovAbHfhiWdtobrOy/hxoFIqAlshbg4tvDIfi3WJl7AKblz28rMf/hkajUT
         117JfJoO7PmbEUpipjGmcHD+dGPpBWItjBwTlt0gTtMvwW0ORC1QFmJ7YFM8yTYEKMTf
         uJVlC5L164uftuJj7CvjvKDdQ1H5Hb8/R3il4vgp+05kUnSf0IVH/7oiW6IqxJr9QNf9
         xaeRE0z97BUjesiHV1uD8PB7Tw6UhG0slebPTaEHcggVX292wAxF67gAAgfcSBfZAAXT
         z2UPIlQBJk0wVzwOOK2hR3gtC3lRo4Eaj85oa1kbTggTLJr8vszz4W0KwrTpUobFzfhg
         eHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484182; x=1767088982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=or9DvhQwaxtsrAqBQKF2R4HMkZA0UWyOfpa2BBt7/z4=;
        b=Sjs6pIVPGac4fbQfscIw7mCrOsflzEemOTLBW+n2BGt3ENdIIwf3hFWbBIc1il1FUQ
         CgqCRder54LeyNWv+Y/3DuLdvGig3ELJVHvTd7z1k3FZZJ4nG1rQ44NV+uuz6DjGxYDH
         W76PEf68T2aE9yff3MEPhHApw8iKNGpR4MBzSSy4ajQOG0VF1P/0+pJQu0KuJ6kQ9BZe
         8VVC2wyqtZaE2wHmzMRP2Z+ktS72S47Y6xFu13NK3aHd8gFMc/y6HuUAqbij1eAuKPI0
         Z/WBhH2jMBLw+a2uq8Q+KFQm3MTsCPscpHQX0rtoHi0ipscoPjy+0Z4coZblX/c2+kFI
         pkgw==
X-Forwarded-Encrypted: i=1; AJvYcCXqyZGujnmVH5mch7a8bI7/oqTrYANlZUgFmCAJ1UJk5KVmnFuDX+5Z99SMeCwYemd4H2YYgyH0TOmAu2LLQ+FF@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7OOXY5gpGlAR3vAWybJMM22fstPvYFunuEkgyBmigDvU7NsDM
	wcmkSoWugcUMeO2BN3BUXrHWhEOLnh6AjXmv08pGiwUEhePlW4cAO+rWfiqts8+qi8oEPhLzL1w
	sHg0UtUvSO+KbelOg+Aw27ta9+t8OEpi3KLje3NPNjiwb892ruyqTrazbticvBIYwL6U7hZxvvd
	lNJQ==
X-Gm-Gg: AY/fxX4R7/vsRlwBa1u4aNPmsId0E5pQ74cjRW1rXNRxS905dUdNWbz0U8yIxpQM1Hm
	suskBpbEkZePPcR3ngjoFaX5Zd1o7XDwFNY81eh0upgGbEeGva7jWYMbxCap28sp4w1YhEphWXD
	opabC4iPKPhzuASKVymRqTGWaUGNlIh5p6G2+0LIaBhRJNY5YAk8Gd1Dl3d3IpdmR/uIftkubWb
	w6dR2nRQMmTmDfEnOAQ9hIJ929Ulb0XLCQT41zUQS3YF73/L7+lbMu79huuWHsV0lItNyyGSCxB
	XRxJh0MyIB2hqjxbP7oh5K3REB1PELz6Rdr2vvy40hcmR793PILAOEDbcgg0/XZMIRDCavLaFCD
	sRhw1QjXkoTouCCo1FLRnHN6hDRALVnLYJaFbHw==
X-Received: by 2002:a05:622a:2609:b0:4f1:e46b:9dcf with SMTP id d75a77b69052e-4f4abcdf56emr174601991cf.26.1766484182022;
        Tue, 23 Dec 2025 02:03:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYmKh9q3TVpBvPGG04xNQnPAJXRKn+MV5cm9azWZmmq9WoPxX1CHwGyf0VG3WWqkcEF5gNgg==
X-Received: by 2002:a05:622a:2609:b0:4f1:e46b:9dcf with SMTP id d75a77b69052e-4f4abcdf56emr174601651cf.26.1766484181594;
        Tue, 23 Dec 2025 02:03:01 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:03:01 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:33 +0100
Subject: [PATCH 11/12] i2c: amd756: use i2c_adapter-specific printk helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-printk-helpers-v1-11-46a08306afdb@oss.qualcomm.com>
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>,
        Jean Delvare <jdelvare@suse.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3679;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=dI851BmOduiioly8u4iYfe+Rr//GzNIkYCteXmln3Ng=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmjB5UVNcmc611VKtySZweLgh03lH4CqLyep8
 HN5EDTCCTaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpowQAKCRAFnS7L/zaE
 w7K7D/4+c+Fz0nx+enSy+0T4yYkJZdn0nkZfXEFvgWl9SaytNp+VrFeIZFFCXXMRHJLHzQ9F6yE
 6grb+AXEzou95fx6/DnPZnO4gmcgKK1vIR5ea8WocpwnbE0BV8n5SCeDwJtTMqb/i7ESl/L6Uw9
 7YdYJWNS2IXMX7FN7fE/Nc+ibmyHtIv5QHZQbD4L4NEDUBDXt3L/u1EKGsqMyUp5C/3qAtSkXH1
 ix1sU8F1hiF4ppon9nlTAxe6MOmla3QRgWCA0i6WoPuIYU+LtfFBSz9PlLMFSQi3/Tb9pTJojmv
 sZyt0uBuvEPgfDyh9D4q5y8scZeFgW6/roKmrAmktmOPfu69d600IhvNzHX1/53yk2+ruS4HAWe
 jr2xoMOReoaIb6zkzEE0K90I4fJNM8eFCx08mnXqg1typ4jMHuTRK26+T2kLlreUWiNAHYXbg8W
 NintnTN9h/k5RLXA8M0Imm1bBI1yXyxIp7EejP6p+7y4WMjVDx+KmJsnYtWI5qwSIgG0EGvrG8n
 HzEAMhq4EHGZ21GoCeWNKI0uXpcwJSls/9lQfmgT29CNmnigZgBM8/PW8iEsLmgHAFwlt1BpTZn
 VIO7KE9o3UipYVObALa592Fk9Ye+4KVwPvy4fepnLyrsTInjb15j8hoaKeYzfo7Zei9+IYYPHAR
 cv/14KJKs7ruXCA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=ELgLElZC c=1 sm=1 tr=0 ts=694a68d6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IUzV_G_aAFXi5cZUTYgA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX5YPOLxo5tbx+
 hn0stpmvKyiR7bNnJ/yvlMA8Kn9pgSroqAn4peKKhnx2B5R4jdDphETQT+nV3Wbfvm7+5putT1K
 Hha1hRZEHOdqHHO5BsOeRGFYoX7vzbMLPckh1qUZDGjSOJRpyPXrsvXWHmtxYI6HTEjwUMMTvmq
 5wTV608yiM8S7xu1KdfbHjUyworkuhD6ukJ+i5WLFqn1af5YiSbFBlD4UXg7ayd3vDSZBeGMjoD
 BatUiuefn8MBZF48tuFp37R5WLvyaDO89+hlbcyAHL+MWsYPR2hTm4am0VmScofAaCjV15T2lll
 yivprEKGTxB41mhyqsxX3j+948U/7ZQhE/Ro8K15ezg85FuPHj75UrS2JifEu3GlxSv4zFAtlOI
 tg/BnKZBm1rYh7fIuZKSh7YnaNpijtEVHwyTCJzVMR4uJX69PgcRROipMoIsbUwpGySTxajKTS5
 voDsl+HV+dC8RRIB+jg==
X-Proofpoint-GUID: pqXjx4tiY2QLAoSnbMpvhyzjksLy-rAS
X-Proofpoint-ORIG-GUID: pqXjx4tiY2QLAoSnbMpvhyzjksLy-rAS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_020303_921125_76B7BDA6 
X-CRM114-Status: GOOD (  16.26  )
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

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-amd756.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-amd756.c b/drivers/i2c/busses/i2c-amd756.c
index 3621c02f1cbabd8c5e9d8a4ae1494ada78726b15..629da0b8024b88cc4d51ea5e785147b462a1281c 100644
--- a/drivers/i2c/busses/i2c-amd756.c
+++ b/drivers/i2c/busses/i2c-amd756.c
@@ -99,14 +99,14 @@ static int amd756_transaction(struct i2c_adapter *adap)
 	int result = 0;
 	int timeout = 0;
 
-	dev_dbg(&adap->dev, "Transaction (pre): GS=%04x, GE=%04x, ADD=%04x, "
+	i2c_dbg(adap, "Transaction (pre): GS=%04x, GE=%04x, ADD=%04x, "
 		"DAT=%04x\n", inw_p(SMB_GLOBAL_STATUS),
 		inw_p(SMB_GLOBAL_ENABLE), inw_p(SMB_HOST_ADDRESS),
 		inb_p(SMB_HOST_DATA));
 
 	/* Make sure the SMBus host is ready to start transmitting */
 	if ((temp = inw_p(SMB_GLOBAL_STATUS)) & (GS_HST_STS | GS_SMB_STS)) {
-		dev_dbg(&adap->dev, "SMBus busy (%04x). Waiting...\n", temp);
+		i2c_dbg(adap, "SMBus busy (%04x). Waiting...\n", temp);
 		do {
 			msleep(1);
 			temp = inw_p(SMB_GLOBAL_STATUS);
@@ -114,7 +114,7 @@ static int amd756_transaction(struct i2c_adapter *adap)
 		         (timeout++ < MAX_TIMEOUT));
 		/* If the SMBus is still busy, we give up */
 		if (timeout > MAX_TIMEOUT) {
-			dev_dbg(&adap->dev, "Busy wait timeout (%04x)\n", temp);
+			i2c_dbg(adap, "Busy wait timeout (%04x)\n", temp);
 			goto abort;
 		}
 		timeout = 0;
@@ -131,38 +131,38 @@ static int amd756_transaction(struct i2c_adapter *adap)
 
 	/* If the SMBus is still busy, we give up */
 	if (timeout > MAX_TIMEOUT) {
-		dev_dbg(&adap->dev, "Completion timeout!\n");
+		i2c_dbg(adap, "Completion timeout!\n");
 		goto abort;
 	}
 
 	if (temp & GS_PRERR_STS) {
 		result = -ENXIO;
-		dev_dbg(&adap->dev, "SMBus Protocol error (no response)!\n");
+		i2c_dbg(adap, "SMBus Protocol error (no response)!\n");
 	}
 
 	if (temp & GS_COL_STS) {
 		result = -EIO;
-		dev_warn(&adap->dev, "SMBus collision!\n");
+		i2c_warn(adap, "SMBus collision!\n");
 	}
 
 	if (temp & GS_TO_STS) {
 		result = -ETIMEDOUT;
-		dev_dbg(&adap->dev, "SMBus protocol timeout!\n");
+		i2c_dbg(adap, "SMBus protocol timeout!\n");
 	}
 
 	if (temp & GS_HCYC_STS)
-		dev_dbg(&adap->dev, "SMBus protocol success!\n");
+		i2c_dbg(adap, "SMBus protocol success!\n");
 
 	outw_p(GS_CLEAR_STS, SMB_GLOBAL_STATUS);
 
 #ifdef DEBUG
 	if (((temp = inw_p(SMB_GLOBAL_STATUS)) & GS_CLEAR_STS) != 0x00) {
-		dev_dbg(&adap->dev,
+		i2c_dbg(adap,
 			"Failed reset at end of transaction (%04x)\n", temp);
 	}
 #endif
 
-	dev_dbg(&adap->dev,
+	i2c_dbg(adap,
 		"Transaction (post): GS=%04x, GE=%04x, ADD=%04x, DAT=%04x\n",
 		inw_p(SMB_GLOBAL_STATUS), inw_p(SMB_GLOBAL_ENABLE),
 		inw_p(SMB_HOST_ADDRESS), inb_p(SMB_HOST_DATA));
@@ -170,7 +170,7 @@ static int amd756_transaction(struct i2c_adapter *adap)
 	return result;
 
  abort:
-	dev_warn(&adap->dev, "Sending abort\n");
+	i2c_warn(adap, "Sending abort\n");
 	outw_p(inw(SMB_GLOBAL_ENABLE) | GE_ABORT, SMB_GLOBAL_ENABLE);
 	msleep(100);
 	outw_p(GS_CLEAR_STS, SMB_GLOBAL_STATUS);
@@ -233,7 +233,7 @@ static s32 amd756_access(struct i2c_adapter * adap, u16 addr,
 		size = AMD756_BLOCK_DATA;
 		break;
 	default:
-		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_warn(adap, "Unsupported transaction %d\n", size);
 		return -EOPNOTSUPP;
 	}
 

-- 
2.47.3


