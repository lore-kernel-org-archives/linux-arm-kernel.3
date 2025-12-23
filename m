Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8872BE6F07C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 10:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s3KzOvEJ3mLY2VN7JHFOBtmtRk05pXH+bmSQ3cYbJUU=; b=RW5N4L4HuVK/Xf9ENu9Yjqe518
	4zCRo3dr6G4yP5KwzmRy1eWvmduNYFGWWpdp3RDqgPLFLumcQR7dlDfiO2Z1RCuO19nLjKv3/aUgp
	SuIDLNuN6d3Shnjxs+xVFHmaBgbwdAhQ6JcZpWPKg43Uqhc8k0V9pcUQzHe8c+TnsMXcUYPZAvpmR
	Ns/h+kJvgWmdcpAWgRGSxr0uwnHPGh5mn4pYeyAxQy6IovWk9ZvPHCuDauuhhykeIeK8j8udMNmGV
	EAtJHoy4siYmyDKjEFz/XjhKArhJW1/nnL5OyT/B82lmrzGmzG2v6VYNmQ4DNGia/j5uoy122yKah
	utUh7QwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzEe-0000000Eoov-0gyM;
	Tue, 23 Dec 2025 10:03:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzEP-0000000Eobn-10LM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 10:03:06 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN2wUYg1894982
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:03:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s3KzOvEJ3mLY2VN7JHFOBtmtRk05pXH+bmSQ3cYbJUU=; b=TH82n2REmZ2IrdP6
	aoMlqIC7IqTaux2aOxGZa/nehnemTyKBWoO/gusPvJ2i7kBV+sZ7BpNP52dT/BiT
	bV7249MTKpyxGvm4/W8xBHEIIcmu/cm1zPVrYCbIRLjMFDVzJcZfb651hTpYwTgA
	Dm+gPtTlM199hlN6zaqzsyLoc14I6hrs6QVqT4Ntb6CJ5Ww/S6VyuDy5cXqDf110
	Me9+p2Uz/ZYGIWv0ydKHbCOAHOWS3+k3+V78hz26BO1gAJ9Mirzxc9qQhZ1aKthb
	DWjgCiddrmF5NmVOpqsRTeBGjlkKSk1rBa/Bl4BDWHcBLjyuX5b4yGMvGcifXkpr
	Dcwyhg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b74takeks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:03:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed6ff3de05so136995271cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 02:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484184; x=1767088984; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s3KzOvEJ3mLY2VN7JHFOBtmtRk05pXH+bmSQ3cYbJUU=;
        b=T61t7aYd5AmxaJT/IqE5cn+B3aNGtHBn3W6Naj66EABWpQ+hZbza8KtA14l7IpDUHt
         gY3P9uGUmumFyl9hpVYGTMhMZN/ucKLPIjHMUI5ssnwuvy1gx2bucgpIe1Dv4hjHf+G4
         tm8Ygr7bcU1hjNmv2vPlevJenatA82hJXXKWGDTb4Wqd7adiexDXbzBOyYN/jVic6BlA
         vxUdc7BvvS97aAeWGwcH6942QvVv/C2jPAvydyqPke+nIwszFpLnHbRRTk4eMxBk4vPh
         n+B8vKKeSymOsD3CbzxAQ4KryS+E7LBvQiEsgFwltUWHZ3JsifTsz6+2AqO1DSwvewz7
         zlmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484184; x=1767088984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s3KzOvEJ3mLY2VN7JHFOBtmtRk05pXH+bmSQ3cYbJUU=;
        b=SYbOMeuZNFZ/MzTvKZvI4C8xwxzy7PZPPyyQcKgRViyqmtF9G/CY+6AOAD1zWcP6gO
         59nwUnaygBLw1eCLO5hNRye/uIOQcprEa0JyjtpMnKDwMR2lUFy8L2mistEnT7BKthvB
         A9IyXfAzKtyg2UIwn3+Orqd8y24VDwqGCLzfd78fmkoo65N5BNFLKJpbupWBQwhHeE6A
         sPiPqeDjZG8kszgheNLcgiyQ+6HGCsIPEnTNnek2pCDDVeI+8gFUTRG/3N99mmIWvtw0
         dS5eI7jcEqI3fTwZLpqcv6HfiPQLEbgQ+kKzbmvtbJMG4ZbzJZ/JolBtVqTYvxxSWJUO
         EHVA==
X-Forwarded-Encrypted: i=1; AJvYcCWF3Dxx50BSYEezPQAVOuthizOm0ohNJ/GwmSkJOi1lUtNM8S5MELD0csQKATZmvOhVKeF1Z5tB+YEIg/4999L0@lists.infradead.org
X-Gm-Message-State: AOJu0Yxbqq1aYKD+QgyIV1PrrbDoKfGdT0RoMY90869dmBY1W+mxgBX9
	C44WX/bEFSSy/M/7PKjJcmXXakmaEMryshS7f2m/5MTVjsjX+8VFJW8R6OexmQEASHuIPxtiCcR
	Mr5Q6PpftGf/LHuLlaUtf2pnMLr2ZOgHoNyrq3zjI1RY7YTOL7QjxYwJenywBv2Jl0VP6gRs+JT
	kDSA==
X-Gm-Gg: AY/fxX5GVktNs2YOrHh+ePt4fzunJFeuXlM9UyiPGpZwWSYqx5QZF8tSWb5y0n8x3UE
	1DXLNkz4j2WZLumd4JrW5tHGnnmc0Kw4tysRHODeqe6Y74OQFw0xdffqGo8Y7XyBh30g1yft1WO
	fXtXK5mD8VVC//FkFYxINjiGhWNB8dNKyCRejd+YCHlVzYlpCkgs7Smf8fX6/raqy6UOOUJN6bV
	kHmpoGBakUOlxB+2+6xx7G2P9rgzEWtNHcb9gyhrOwT2pfZfFn+Aak6NeYm3eB7bTTCHovZ6wxi
	eUmIQwZTqHKyhVjG/OAvUiIUUjK2+E1AGKPudPnoSC6S93HV8ZvKcuqrHjHS2t6TsIMJUzsoC0V
	sQbDMBswsTQwe7hqEW6/9TWDw1lLCvz2TCgohDA==
X-Received: by 2002:a05:622a:180e:b0:4ee:268f:baa2 with SMTP id d75a77b69052e-4f4abd01701mr216034251cf.27.1766484183605;
        Tue, 23 Dec 2025 02:03:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAMTJ8pU1YC3SohbnEGLHAGZHc0AA80x7fYb578qtWe2mL3hTCo/7Z/yMtAiRHdU8xQS7aHQ==
X-Received: by 2002:a05:622a:180e:b0:4ee:268f:baa2 with SMTP id d75a77b69052e-4f4abd01701mr216033741cf.27.1766484183148;
        Tue, 23 Dec 2025 02:03:03 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:03:02 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:34 +0100
Subject: [PATCH 12/12] i2c: piix4: use i2c_adapter-specific printk helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-printk-helpers-v1-12-46a08306afdb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1631;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4FwHimgg29jlntM6pAuTRFRVSUKHlsg/WMwTYloxTIE=;
 b=kA0DAAoBBZ0uy/82hMMByyZiAGlKaMKjcyICb7c6UsCyrP1wlptqZ7FtRRqRMa9ynrsk3cOjk
 YkCMwQAAQoAHRYhBJHlEy3ltUYde6Jl/AWdLsv/NoTDBQJpSmjCAAoJEAWdLsv/NoTDTa8P/1PJ
 3J38Rsk8OVuFFOLjY8ZAaeAQBKgVC7sJzw7nbu3V+LQJH8+ifuhdooUdi0IlsXt97oMXa66FcQ9
 0gw2YiyNXkmud6rB3GC/x3c4uNK0wKq5spQJcT9aOUa8u/gZ4PPK4MfVSiy/Fo4YqRJURYxQM6s
 dAPbGdd7LynK69IU2Nl311cKRmBNscXNzM0Z1b4jOl1es4R/vbZA4pfJxJFdRoO2H8q0VEFbN0v
 zD+s3ZeRxYP5m6qWxnaTwRBrfeTH+Oos2g2inIEjSt7l4Xy6HZS5nefyfe8OWMEAxUeXjHs+bSa
 r8XLlsgEc9MVKOe2en8wvIZJfF/QZ6jd4xYcO+RJeORm0HzHdF8TgdU6oOgV8Xamhe8KsWMTV2h
 sNWtMM670n/wlBYz+kEBJ6YcWwL2Ecxu2HxRjvfDvCDpgXzBYBoV7ZREMO/10Ougp8Eplr3+wDs
 TCuxhaS8c3fh3rrA2IdE+z9h/IRc/F6os0IkJ2nAopuP+KVCoVz0X/pTy1kn84ukScDHqwKxT1s
 fSFx7xuLjep1ExXaYPvblmMmZYe1+UOQIDYK3cIhvYNaOUlyWNIBUQ+3Orngcn0vX/yUxGPAsNK
 lcfS+4siyLmNRv2Xhqgdtj4r2czS4tH0B4gH++Tezd68ywjNiXorRG5zcbWFFU+/8GTpHdiK0+O
 8TiEy
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=DPiCIiNb c=1 sm=1 tr=0 ts=694a68d8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ZTA4KjZG30Bk9MnLWp4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: zR5NSu5vO6wHDs9DzuKxxc_DyF1_i8Ex
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX0TF2OJLqt8Du
 +f3T9Fz+D/K/LPdnQMOt9zCxvU9Wf1hmvHanHCDqtRphWsdIvEVZxX8N05eGZ7cGniQFwzI5gBz
 2+wxVEPZ8aORpkc+no1Ne94V2V75ZJDBI4lg9Bk01jM6NaS9hwQ8oA9tZiOTP753T8GtQILPx+D
 ZYBybPeub4RBXIoSWbrLC6P9V42E1lR6sGCFkNg4c9c2ybsGB/N5xVjS0/SX54CgADDb6W93LyX
 /ZNaQ5ppisq8TecNEHfOtyVicdQN50aCiifCk4tE/protyYleKWhB3tRLvEUNtIzpt/rZHE9B5O
 3UVLUYueZibUAhVWER+/6I4Bb3Bl/WwHkp11efVwTgdh+U4M4RmHmf7H9Hl0Y8UZpdl29gvcUAl
 SfpZXz/TZXwuUjudb1eO0XxW1vo9ZMyU3x6+jDFWpbNl/nQ89SUM8k/rGnHJA6Buxhe0lZ2/oWf
 KG0OjjQ3pEAfR0k8YUw==
X-Proofpoint-ORIG-GUID: zR5NSu5vO6wHDs9DzuKxxc_DyF1_i8Ex
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_020305_467939_ACBAFCD5 
X-CRM114-Status: GOOD (  14.68  )
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
 drivers/i2c/busses/i2c-piix4.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index ac3bb550303fe5893822af50c385004c9292e695..bf6ce6b4bed3f4ae8aa392c68189a67636c01bf9 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -650,7 +650,7 @@ static s32 piix4_access(struct i2c_adapter * adap, u16 addr,
 		size = PIIX4_BLOCK_DATA;
 		break;
 	default:
-		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_warn(adap, "Unsupported transaction %d\n", size);
 		return -EOPNOTSUPP;
 	}
 
@@ -825,12 +825,12 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 		ret = piix4_imc_sleep();
 		switch (ret) {
 		case -EBUSY:
-			dev_warn(&adap->dev,
+			i2c_warn(adap,
 				 "IMC base address index region 0x%x already in use.\n",
 				 KERNCZ_IMC_IDX);
 			break;
 		case -ETIMEDOUT:
-			dev_warn(&adap->dev,
+			i2c_warn(adap,
 				 "Failed to communicate with the IMC.\n");
 			break;
 		default:
@@ -839,7 +839,7 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 
 		/* If IMC communication fails do not retry */
 		if (ret) {
-			dev_warn(&adap->dev,
+			i2c_warn(adap,
 				 "Continuing without IMC notification.\n");
 			adapdata->notify_imc = false;
 		}

-- 
2.47.3


