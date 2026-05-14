Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 042A2CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 14:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2bW6YUTzOuvBu0eaOmgGwPbSA1PvpkOTNmX5GKSvx7s=; b=i8le626ezMwkVkXi7wav0UIWUB
	JrgPjNvVAERLafAPgSv5F/eOH6mJBtjx8OTY/AQRYBvIHI5pJIePdHGBdPaKzePbMqtIz0RnZ3MA8
	6qvGrFSHmRINFzo/j0qT/bl82Lc2XaYL3mpDdwECOyo+eKHGOTTl7w/he7aqXyolGGGhH4u8l4gAp
	szaaJiiWyClgfIrphQukhAhqsndfH2GveBTsV9KHZXbTUU9raURYH6xgXBFuUyLMwSW0biqgfjLAV
	/R/3ZC2xhO63whcBHZMVpJ7+LVp+y0WDIkIIcgksnBCIFKoL28/d41JMvUdiVhBcQDLLvuSKzw3IB
	cQNPSFvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNX25-00000005idd-20xn;
	Thu, 14 May 2026 14:27:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNX22-00000005ibV-2GHU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 14:27:23 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeYoX2238424
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 14:27:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2bW6YUTzOuvBu0eaOmgGwPbSA1PvpkOTNmX5GKSvx7s=; b=R+2C2e509qoekEce
	bZ2+7KiT8IkfXYxYalO9rmWw0aiqjQY9d0dZU20J9hlylPmSsuWeKo01sU36YYui
	U25fAcrou+Wwe1j9fqswsYasZ3Yhp0caScniO4X5b2hO1IomYAv367rmQEeIJ2PS
	JFhtOwuQ3MDg/38n837LBRKmKbKpGdsc6PZP/rnJNTblN7CZOZn7QifKTTtkKuNr
	woaohcEbr5YkeIheVjrvB/81TViaYFsLWsU8vkiCk9zoMsEenn04oQ95Lv7B2JcF
	C2bSOP8Q9kK/pHG+BN47bKPIQHokMR45JlS21T8epCaG7Lz2w2qNiN92UbbF54KV
	NSeYqw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e566bj610-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 14:27:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2e8bba2e6so104869285ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 07:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778768840; x=1779373640; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2bW6YUTzOuvBu0eaOmgGwPbSA1PvpkOTNmX5GKSvx7s=;
        b=Iv4xQLwZ+gHQx9mLIhXkBbsuJK1BJQ2eMP3zTSCKgiBRzsu7iuy1PD52w9KHNd+UnR
         2+HE7Yy85iMIiH3goHgvAAGnnfdGcTikUNUqYPNK7TiTOL0iv9DGzHee9eXVBIhlm+Ar
         X8NGaRj5faAVB4qQSZBgR3AD99dDZ3QZPibjfDSMiEvCmrSCpRxIrqu2Cq5TIM/ehIme
         Ybivu1E5h48LVBML67FsJs9SRvw3DWSPxSViY9S3WQTS8SyY5jLjfsCPWHCsbtosisKr
         CYNDx2MU5ai/24uEdSycK97ojsUHHRIcpdDkgBs/Co/atqZaLZAOzVEf48rN1ZlehlW0
         +c4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778768840; x=1779373640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2bW6YUTzOuvBu0eaOmgGwPbSA1PvpkOTNmX5GKSvx7s=;
        b=DvS8QKAk4lmhLBXB5hbH4pSwS0uW//AeKBoqVjRzJZnfyX/4IJA4oGD3Sz+EdP9c9g
         wPE13IrJ1WSoDB6Vb/b4/NyPdOktEt2+j+/rurrR8FHl9s8RueYTxOXMGbwMjYfYXzMa
         ru2H6sx2EAYJ6Tc+MM3icnIHoSUtRpqERcMFHAilkqew080ePq2Us+/A+ALv0elPE3f2
         q6SICz430Se8bBZD/D0Vi6UrC/HSt1bX1c0lEmORq/4JIIvb8Z1Dnlac0tTM0tNfhWCs
         +LoCQU7fUFPFPFafIVTmzsnkyIfwyZKoKANyhEP+KlKjf+yvPcoHhJSbiUkSh6/iyZ2O
         y3vw==
X-Forwarded-Encrypted: i=1; AFNElJ/P3ohr5d51Drh0XgjlpFYEbtnIDZffai0wrDg9BaFBiquxwQXQyXdKrxOfu1a719uFLWqlfF6GMtUBKI/Un+di@lists.infradead.org
X-Gm-Message-State: AOJu0YyBbITsRnc+t12AKdew7WMiEB1+8VGnES1iX7vBhi6bve4lIXwB
	KQta9H+PQtNJKGMND87pyJftJTO0MBsIJSkparjyKXpz8L/+whUlEd8P8S4GOJrtLpvKU+83K3h
	/pluCxt6a7t/0sQk2bSaHS1rOyXa94/cJcng4n7BviZ9aqmwTSOeV7wDWGq1L2g3132lcb9B5c2
	U9Nw==
X-Gm-Gg: Acq92OFrJB9ek73X4kjlJfI47Qigl1Ghpv6JDneHmz8BWGLO5ia6IVYInom1oRH6/s4
	hbqsSbAqJP98UOhq+hNC2tjuLgdJfKQdudDqYJyIiATLueTFw6ka4xIG/8PhfzBouqF7F8bMTac
	D0DAR4sqip7I6l0zD5ubg4sHSKd+4vVPW7CGL97Z2Ot1nRASxnk+dgNlteCTRaeLVYHRYSZHpqh
	/kdHklmwG8W5wkaPfuho1hnqI0TuoGY8Y1fbi6b2eFGjTvgnVljj9WKpSf3nlcGBRDLTYVCXYvu
	LOWLnhyanQsPGIzQgagrk6IP/sBEpmephOcE6/o2Yufr6zYxFHML1cPr3mvg/z2Zj3fhe0OyF+B
	pvBT51mV0yD4ezgD9W38qsrG22I86ve9dWrZv3b/W2n5LEn0aSA5kKtQuXg==
X-Received: by 2002:a17:903:3e25:b0:2b0:6a22:5165 with SMTP id d9443c01a7336-2bd2718bf33mr68336765ad.7.1778768839508;
        Thu, 14 May 2026 07:27:19 -0700 (PDT)
X-Received: by 2002:a17:903:3e25:b0:2b0:6a22:5165 with SMTP id d9443c01a7336-2bd2718bf33mr68336245ad.7.1778768838912;
        Thu, 14 May 2026 07:27:18 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05ffbesm28566485ad.27.2026.05.14.07.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:27:18 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 14 May 2026 19:55:43 +0530
Subject: [PATCH v22 02/13] power: reset: reboot-mode: Add support for 64
 bit magic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260514-arm-psci-system_reset2-vendor-reboots-v22-2-28a5bde07483@oss.qualcomm.com>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
In-Reply-To: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778768806; l=7663;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=B0ZtyTNgrcb6Ah4fiJ7wnTmXZKRQjY+hrvqL1+z4Iq4=;
 b=HifSlQTw1nZj2bR6K1yArNohiisd4k/0HAIfMlCLb3nui1xiTM2XU6zK7HvyiYUoablEHqTK3
 JNQpO/hl9YLAalBlclzFzd1yht+VBoc2HceBdu3evEOXSfE1duZ/8mS
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: q-eRzAp29C2O8rFNWeMILxQeiFXIb9tH
X-Authority-Analysis: v=2.4 cv=WsMb99fv c=1 sm=1 tr=0 ts=6a05dbc8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=MO_J9Aa4ypbE8kPWTcIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0NiBTYWx0ZWRfXxNJisibI1biR
 G2rThLYRYk5m3qe2WyTkQ931ysA8uuMa+KWdqLYspT0Q+0f1ODeYDYmpIJAi9FvX0+IqiRyr4Tg
 T40rWCO0mxqLBrNmXnRbDSjgtgKOmqiA/0qDF1B7ZTvrSb3R0XKAtdQFofFZ2uDBnaq3hqCTdpI
 g77rFB2s6VOQUTA+pDwKHtHjWa2TXLPlroopkUFPIvJj2sXQnqPweK7u3BLqZeu5stMRWKTEeKj
 N1GYxMMD1x3dbazrWlXVlNI9e3cDebluZgYqI9U16DPK1m0+fsZi2riqYFzlnVrJrvTuV5hj6uY
 mi4DUmRFUeJUzt6wurrbFclqWpYwnuX1dZyhNA1xMm2glvmrlSVssS//gI6QJ/UNBonny+c6THQ
 kDTb6VOXg9mkGHBNqp+ECJepCCbZP7NPc89Uzz/v4yZPE3bnz4w7tcxSAMg+9Bg/0EjJ1cPMmol
 e1fk9v/F/T4oYdj+QVw==
X-Proofpoint-GUID: q-eRzAp29C2O8rFNWeMILxQeiFXIb9tH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_072722_701693_31090390 
X-CRM114-Status: GOOD (  23.38  )
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

Current reboot-mode supports a single 32-bit argument for any
supported mode. Some reboot-mode based drivers may require
passing two independent 32-bit arguments during a reboot
sequence, for uses-cases, where a mode requires an additional
argument. Such drivers may not be able to use the reboot-mode
driver. For example, ARM PSCI vendor-specific resets, need two
arguments for its operation – reset_type and cookie, to complete
the reset operation. If a driver wants to implement this
firmware-based reset, it cannot use reboot-mode framework.

Introduce 64-bit magic values in reboot-mode driver to
accommodate up-to two 32-bit arguments in below format.
|    Higher 32 bit  |   Lower 32 bit    |
|	 arg2	    | 	    arg1	|

Update current reboot-mode drivers for 64-bit magic.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/nvmem-reboot-mode.c  |  8 ++++----
 drivers/power/reset/qcom-pon.c           |  6 +++---
 drivers/power/reset/reboot-mode.c        | 19 ++++++++++++-------
 drivers/power/reset/syscon-reboot-mode.c |  6 +++---
 include/linux/reboot-mode.h              | 15 ++++++++++++++-
 5 files changed, 36 insertions(+), 18 deletions(-)

diff --git a/drivers/power/reset/nvmem-reboot-mode.c b/drivers/power/reset/nvmem-reboot-mode.c
index d260715fccf67f9f072bb56c5defbf885750650e..bd05d660490c686b43134f82f1eadd7665403d20 100644
--- a/drivers/power/reset/nvmem-reboot-mode.c
+++ b/drivers/power/reset/nvmem-reboot-mode.c
@@ -17,10 +17,10 @@ struct nvmem_reboot_mode {
 	struct nvmem_cell *cell;
 };
 
-static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot,
-				    unsigned int magic)
+static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
 {
 	struct nvmem_reboot_mode *nvmem_rbm;
+	u32 magic_arg1 = REBOOT_MODE_ARG1(magic);
 	size_t buf_len;
 	void *buf;
 	int ret;
@@ -32,10 +32,10 @@ static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot,
 		return PTR_ERR(buf);
 	kfree(buf);
 
-	if (buf_len > sizeof(magic))
+	if (buf_len > sizeof(magic_arg1))
 		return -EINVAL;
 
-	ret = nvmem_cell_write(nvmem_rbm->cell, &magic, buf_len);
+	ret = nvmem_cell_write(nvmem_rbm->cell, &magic_arg1, buf_len);
 	if (ret < 0)
 		dev_err(reboot->dev, "update reboot mode bits failed\n");
 
diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
index 7e108982a582e8243c5c806bd4a793646b87189f..57b36e6186f80aff947fd7f5aae5ce280c65dc6b 100644
--- a/drivers/power/reset/qcom-pon.c
+++ b/drivers/power/reset/qcom-pon.c
@@ -27,17 +27,17 @@ struct qcom_pon {
 	long reason_shift;
 };
 
-static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot,
-				    unsigned int magic)
+static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
 {
 	struct qcom_pon *pon = container_of
 			(reboot, struct qcom_pon, reboot_mode);
+	u32 magic_arg1 = REBOOT_MODE_ARG1(magic);
 	int ret;
 
 	ret = regmap_update_bits(pon->regmap,
 				 pon->baseaddr + PON_SOFT_RB_SPARE,
 				 GENMASK(7, pon->reason_shift),
-				 magic << pon->reason_shift);
+				 magic_arg1 << pon->reason_shift);
 	if (ret < 0)
 		dev_err(pon->dev, "update reboot mode bits failed\n");
 
diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index 7a74f72a8313b73c3e0930a426ebcf7ef6eed99b..f1372dc700e48043320812c3d3619ab1539e1854 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -22,7 +22,7 @@
 
 struct mode_info {
 	const char *mode;
-	u32 magic;
+	u64 magic;
 	struct list_head list;
 };
 
@@ -74,8 +74,7 @@ static const struct class reboot_mode_class = {
 	.dev_groups = reboot_mode_groups,
 };
 
-static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
-					  const char *cmd)
+static u64 get_reboot_mode_magic(struct reboot_mode_driver *reboot, const char *cmd)
 {
 	const char *normal = "normal";
 	struct mode_info *info;
@@ -107,7 +106,7 @@ static int reboot_mode_notify(struct notifier_block *this,
 			      unsigned long mode, void *cmd)
 {
 	struct reboot_mode_driver *reboot;
-	unsigned int magic;
+	u64 magic;
 
 	reboot = container_of(this, struct reboot_mode_driver, reboot_notifier);
 	magic = get_reboot_mode_magic(reboot, cmd);
@@ -175,16 +174,22 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	struct property *prop;
 	struct device_node *np = reboot->dev->of_node;
 	size_t len = strlen(PREFIX);
-	u32 magic;
+	size_t count;
+	u32 magic[2];
 	int ret;
 
 	INIT_LIST_HEAD(&reboot->head);
 
 	for_each_property_of_node(np, prop) {
+		memset(magic, 0, sizeof(magic));
+
 		if (strncmp(prop->name, PREFIX, len))
 			continue;
 
-		if (device_property_read_u32(reboot->dev, prop->name, &magic)) {
+		count = device_property_count_u32(reboot->dev, prop->name);
+
+		if (!count || count > ARRAY_SIZE(magic) ||
+		    device_property_read_u32_array(reboot->dev, prop->name, magic, count)) {
 			pr_debug("reboot mode %s without magic number\n", prop->name);
 			continue;
 		}
@@ -195,7 +200,7 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 			goto error;
 		}
 
-		info->magic = magic;
+		info->magic = REBOOT_MODE_MAGIC(magic[0], magic[1]);
 		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
 		if (!info->mode) {
 			ret =  -ENOMEM;
diff --git a/drivers/power/reset/syscon-reboot-mode.c b/drivers/power/reset/syscon-reboot-mode.c
index e0772c9f70f7a19cd8ec8a0b7fdbbaa7ba44afd0..9f4b18c5e46f6a8bf197773ceceb80b250f57541 100644
--- a/drivers/power/reset/syscon-reboot-mode.c
+++ b/drivers/power/reset/syscon-reboot-mode.c
@@ -20,16 +20,16 @@ struct syscon_reboot_mode {
 	u32 mask;
 };
 
-static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot,
-				    unsigned int magic)
+static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
 {
 	struct syscon_reboot_mode *syscon_rbm;
+	u32 magic_arg1 = REBOOT_MODE_ARG1(magic);
 	int ret;
 
 	syscon_rbm = container_of(reboot, struct syscon_reboot_mode, reboot);
 
 	ret = regmap_update_bits(syscon_rbm->map, syscon_rbm->offset,
-				 syscon_rbm->mask, magic);
+				 syscon_rbm->mask, magic_arg1);
 	if (ret < 0)
 		dev_err(reboot->dev, "update reboot mode bits failed\n");
 
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index 4a2abb38d1d612ec0fdf05eb18c98b210f631b7f..2ce189fdfff4b396d7cc6f175b30016781ae4fe9 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -2,10 +2,23 @@
 #ifndef __REBOOT_MODE_H__
 #define __REBOOT_MODE_H__
 
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/types.h>
+
+/* Construct 64-bit reboot magic: arg2 in upper 32 bits, arg1 in lower 32 */
+#define REBOOT_MODE_MAGIC(arg1, arg2) \
+	(FIELD_PREP(GENMASK_ULL(31, 0), (arg1)) | \
+	 FIELD_PREP(GENMASK_ULL(63, 32), (arg2)))
+/* Get 32 bit arg1 from 64 bit magic */
+#define REBOOT_MODE_ARG1(magic) FIELD_GET(GENMASK_ULL(31, 0), magic)
+/* Get 32 bit arg2 from 64 bit magic */
+#define REBOOT_MODE_ARG2(magic) FIELD_GET(GENMASK_ULL(63, 32), magic)
+
 struct reboot_mode_driver {
 	struct device *dev;
 	struct list_head head;
-	int (*write)(struct reboot_mode_driver *reboot, unsigned int magic);
+	int (*write)(struct reboot_mode_driver *reboot, u64 magic);
 	struct notifier_block reboot_notifier;
 };
 

-- 
2.34.1


