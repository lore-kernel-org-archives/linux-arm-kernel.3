Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20093E6F07F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 10:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r9uATJ82hYYI1P1Ta5M3mFlNuQ1YfP5cbyb+2iRgAqk=; b=oUMtH2bhB9JOdXEYAhwGmmuZ00
	Q5CWHieLYKGk1Z0aLqmdI9UH3TmP3bpo5rdMLaqrUI4fHTBmhbElC/DeXYJqPjUcWkBjAA0KCQaAc
	YrDMQpLu2+ZXI/lEXuk4knVXy4pdlFUhC4y2CCoMQ4O4WZe9FPE4PXlbxoHirhq6LSt78tP+ZAnEc
	pOgZOwUo50DMg3cPQy5vzHL/x47Klf3FyV+tI5bKkZlAoBMOQDY98cnlLgwsMA5pnoFKYHzxQ7nSX
	e09coIfVJ8tMVqowyIf1TcQDqvE+NunEIxjetFlbCmiMg281f4gXo3GnBiObgrMslBYEMcMIQ2oIL
	2CiorXSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzEb-0000000Eol1-3t7O;
	Tue, 23 Dec 2025 10:03:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzEK-0000000EoXJ-2Wy6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 10:03:02 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN5Xnr31902190
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r9uATJ82hYYI1P1Ta5M3mFlNuQ1YfP5cbyb+2iRgAqk=; b=otwKbrxfnL1TdBVC
	6WV4xwy/B/sUn11hn2Mc7GzTZGP3XqRyJ5xnM73dU14UKE6XUzKF6qaOA7b8UEXK
	wSt9BHWtZNlMiMqr+qTAO3he9wMSD+YQNzdxZer8gA15KLv+c4456bAg/IZZfHnr
	Fq8YbT3WD3s5fO7LpO67NGCN5mpvRZwDQIXSjD0Z/B5cvp1Ygi2DcajaNNdPYoE7
	5nvRXV96tuFd5JVvItjtJQQkmzvkUIA2XJGDrN4a7u7Q/dHDPv6JpY7FcQALcT5B
	JPJ8jK7uAUGPWRb6dmtSPb3MEN2s3nBA0y9pYNYuInrMOwwsM2aK1Y+nLM+Pok7P
	IYkqmw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b79w8jkc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:02:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6ff3de05so136994071cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 02:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484179; x=1767088979; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r9uATJ82hYYI1P1Ta5M3mFlNuQ1YfP5cbyb+2iRgAqk=;
        b=ZdxkRYCnftkXoVnGa3V37/x1xHqPtvAD6iiDd6pYMqqMlJclBH6zSlMP7GD44VfEUf
         Pm8YWyimoQv8EfIA7PmscP/rA9stwRc4qfqwWSBUp2RvcnlvqmgvvtO6TeqtIyLwbC17
         hhBMd/l9lTDVhriWgg+F6MRpSoNFfY6PvL2jfzgwMN8B2/nUVsH+fyEB5zUHy4rSWMLD
         M2eWsfYxUWWh1vBZHQhI19VHvOiSLYXy5sxtFxKQpjY5G6hMy5N16lTkjMT+yIoPKK1X
         I+S2vVKWq4CFZG/7UPhI9G3eNSWXzj1TSHM4JT2KfY6+PgcSid1LlOB4NQaKXyKsjVk2
         sZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484179; x=1767088979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r9uATJ82hYYI1P1Ta5M3mFlNuQ1YfP5cbyb+2iRgAqk=;
        b=ETfXGNj3Fbl7JxBzx+lWLbOSfYlIZHp2xb+qKGiwwN6Kkr9CuThsL79wn+XatuuZci
         ZkFxxPVabYIbSZyHOYZgnqjqwnTNt5QwhRt6roqBmuwv/OgtLARvNI+GSXRu1Ou5Arh8
         t2UBR3I4m7L1SNpqSG7aadOu7WOs6ZNoIj9oT0y2Q3A0Ym/FKpUqIfoAZlIrfCDT/wzx
         jdVuSu5PSrLspU22zYmtJOF7xbEtbjpVNRuLjsriNorz/HkpMkTph+31G/0ps9z1ouRv
         duUPIWjvmRcfC4zXf7h8vhBWHDWI0k4BnnQAuB2vbxwPm7dz6tI/vZlJSDivqyfeVJE4
         dDwg==
X-Forwarded-Encrypted: i=1; AJvYcCWVBGt0+RpASrSe6+g82yscdjigNQ96YrMGtvh23pa1OmunjackNm5JEn7BrS/GfnIURhybNi1O11E9Yr+zDx7N@lists.infradead.org
X-Gm-Message-State: AOJu0YyQGnUyP5pvZo4uQ73IZpKg5eSjmLFa2mMwq+lOjEsphMoVmjky
	ljjr59RDN2VR051BF/rWPS+aRtf4620pz6KFDYNpXHmY8WtIZa9w7n+zFVXFUOisY4BDgjHm1Xq
	GDqG3vg7wLtJo2qTo6gAT5nsqzYhxN3cAJwn/knqsgNwVRagfB8DVQ3AHkU1mZ3SWmszsBxug/5
	InGA==
X-Gm-Gg: AY/fxX4jXm4cqnv/C3X0FUDR68gvWa+cpq6th6Js8V0svagEAF7+GAn0MbuVRvs3u0x
	dIHWnOxXo+N/0WiWjvJv9msvu2dLUiHexiDJ1vYMSKTktg+nhb5N/J5GKbPC97uVFudcp6aXGS/
	mwS74gMAF8XJkzB5hAF4c++tg4LDYElmsns5Y9TGXYUSOlSOyrB2SG6ipnwANGvnRM5Y2YfS7bv
	pCEN9nBSTxXuWxvK7xhd+aQ2qM4cE970TX2FjsTTnKENLM+u9h7xMKSCpm0yFCQrYzBE3mnqBup
	IbjwrC/GPZIyBdN880y5JRRDTKQtOL3wTKB3Y0biB6+nW1XalZZptcv248gJ973TFIhMOiH+TKj
	btpHN/xM/+FZHEnNTyzLGVTDwI/HYvYSqFQqKvA==
X-Received: by 2002:a05:622a:98f:b0:4f1:be95:5a4c with SMTP id d75a77b69052e-4f4abdbe4c5mr222266401cf.63.1766484178983;
        Tue, 23 Dec 2025 02:02:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYXi/jHhONsfaUYfyqVZi+bmTDlvcyn169B42+SyCfOiYjgT7JBB+81IGnemThpNA20OAzag==
X-Received: by 2002:a05:622a:98f:b0:4f1:be95:5a4c with SMTP id d75a77b69052e-4f4abdbe4c5mr222266011cf.63.1766484178619;
        Tue, 23 Dec 2025 02:02:58 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:58 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:31 +0100
Subject: [PATCH 09/12] i2c: owl: use i2c_adapter-specific printk helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-printk-helpers-v1-9-46a08306afdb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1370;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+nrztrv3eun2Q963Kt+vOIIxHNHM2moiogYKDHo0wls=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmjAhdbFloNWEKAbQOt2D2f5/84o4352KnQVG
 qC6sU/ezyyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpowAAKCRAFnS7L/zaE
 w7epD/9rDuuAuMrijZz+HznnGHSdCAeNvsyqHlql+M1L3UpFuJyrk4GpvYgN1asIGCxHuiIFf1f
 bXtwKF9d3aIJdQVpRiUqimlYz2hnFRxxS75WMWMzENRiho/uW/5Eqt+0cy2tDr/0s5hx0L/A0su
 +GlAUQJjYyIMHUuHqFGK5mnOcmufBxbSXsae+2b0qsOkJufCrsrrSJYqKOp1taATIiBemTJZBpU
 VxbKBW0hXg0LR1fhLovLl1CVuOgukNLNVQqMjcTwe7GqYQ978CIp9weEtETbxvuRelLQJynHcSZ
 KL/6FadBg1u2JjG6wfiUDTij0xfm+4hCrKIkVPrqlxOSOMGUpLzefUV0l/maqjvOgQ0LppSNR5X
 A934pNHJp/+0V5FSaHBftfwPWbxFQXdbRFgAwfkGkhposEp+iccTtfHyhJXgYcCvmoMLAn7/cfL
 NAZQ46Hi9rWpzZm5iYEHBL+Bf2/h9OLBSHlpbfWDLqxzMeGEI4hx1bLS7mba2o1qCM/5rln6Gj6
 mcT0wSiIUGkhRD8ScfYZWZDeU5m/ZMu7UdZko7fXjAuwqBiTEBJssvjkaKzVeh+47B/R5rCi5tX
 6RP3KTEzVW0U0Mrk/v1FkjrmB+jDbxnBnhc2dGQqllDFHvfAFCbO1KYYTpv+84WgRnGB1qad/uE
 eSV/XsXnlHU5OnA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX79bjF4Aklcg6
 A986VgfJAx7DaE0i6ndoM7Qczy60VVyPw0qzRXIt0VMEqWlRh91m8Xdq6uFL15WukfPl9YWAkN8
 nCSz+HRJ4BQ7r2zPDrsjKkYlWR343AENpc6v0surdB4Cf48DuG5tIiSyPBj9Jf7pEyzaVy3JH2G
 nbYRAYuwdwdW05w6IBTKz6TxqRinIW6BcI5Nt0C1Wf54ZlaYhgGO6AGhRVYf60OUQgBVC3fNJYA
 jNXiWsZ85g/6XIqaaJCbVn9JLai3FMDAwAN74G5M6mWdTqH+X8glW3slY8PqizZ362G+XCglBFR
 uxkJTFCpsxBC3D9al7FRSRLQNfkY2rQnP4RBYlnQOFy7aoKsVtjz6bFg58vHbAQ29LlhbpLqC8o
 AmGugPkK2uNs4zEcPf+eCBxzCXfNgVcmvXK5SIVydli1h9FZk3O4DKeTIQEQ4YJyWozEkEBs2L3
 +8FeKkhqJSDNRGYGQ9w==
X-Proofpoint-GUID: AjsgD6gjm8q70d9ax5c94sk9fGW8GjvV
X-Proofpoint-ORIG-GUID: AjsgD6gjm8q70d9ax5c94sk9fGW8GjvV
X-Authority-Analysis: v=2.4 cv=T/eBjvKQ c=1 sm=1 tr=0 ts=694a68d3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=td_-LIo_6SHiI0BopBAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_020300_816955_ADB7807A 
X-CRM114-Status: GOOD (  15.76  )
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
 drivers/i2c/busses/i2c-owl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-owl.c b/drivers/i2c/busses/i2c-owl.c
index 84a195e358866d693fb6d435a5beaaee640fd2e2..17718f15a0f1fd238bb4a6f23dbb4f9696969ed5 100644
--- a/drivers/i2c/busses/i2c-owl.c
+++ b/drivers/i2c/busses/i2c-owl.c
@@ -241,7 +241,7 @@ static int owl_i2c_check_bus_busy(struct i2c_adapter *adap)
 	timeout = jiffies + OWL_I2C_TIMEOUT;
 	while (readl(i2c_dev->base + OWL_I2C_REG_STAT) & OWL_I2C_STAT_BBB) {
 		if (time_after(jiffies, timeout)) {
-			dev_err(&adap->dev, "Bus busy timeout\n");
+			i2c_err(adap, "Bus busy timeout\n");
 			return -ETIMEDOUT;
 		}
 	}
@@ -383,7 +383,7 @@ static int owl_i2c_xfer_common(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	spin_lock_irqsave(&i2c_dev->lock, flags);
 
 	if (ret) {
-		dev_err(&adap->dev, "Transaction timed out\n");
+		i2c_err(adap, "Transaction timed out\n");
 		/* Send stop condition and release the bus */
 		owl_i2c_update_reg(i2c_dev->base + OWL_I2C_REG_CTL,
 				   OWL_I2C_CTL_GBCC_STOP | OWL_I2C_CTL_RB,

-- 
2.47.3


