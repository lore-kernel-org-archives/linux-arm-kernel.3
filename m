Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2C1E6F079
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 10:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kn07S0VFJ00r1Opp95FLhCfso4raJ3godCnzzNkTUdQ=; b=uS4HwIbsQYzhnkvMuxnNDgnr+G
	+XvajlOD/URaab+jPdLMB/fI6RTsK8B/l0eHMWE16scKMKnlz60Q+vLUXgAIBXvgm0TKdRNJi0aA2
	LXX18A4VDssTItSHUMsGutvMkLAZqah+Lx7uHhxf44d1Wico1jd56nHQfnc20gRobzshbLcmQEUO8
	TIsNZUrTpfIIQibAY2neHVhFRig147pSU4BCB9GHICKH+D8grfi2UkrBd1jB5q4Vddwoywx3sFbXW
	AoDvQtjd9PmRhkrIV7rLgC/4V0MWRX2znjqtR+eO9eiblXpyOlYGWdI/0rQGX4IvgzJwHd0hbPvIt
	rcl/+ocA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzEc-0000000Eoli-1qiW;
	Tue, 23 Dec 2025 10:03:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzEL-0000000EoZ2-3QBg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 10:03:03 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN74vPD2115196
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kn07S0VFJ00r1Opp95FLhCfso4raJ3godCnzzNkTUdQ=; b=lgtVVrCRDEEhbVLA
	bu1fxLTBApMnXU4Io5Rs7UxlEpP4lv20AZm80EjrI6PAMZvpCBjCN/RrpU2aydOL
	g0vyT5gMOrqNJiYyX+5UjqmHbGn8dMJbc8BplkwFup1dzZnaRiKrxV9wmSjanO+5
	DAV8tqUDtGipXSWN/91KJm2nSQtUFCtkt+YZ4M8XDjdSA/Nrb8pwgRj3S1RPeblX
	O2ENydHSe6u8kcw6kNgqkiKc9x8rPElPzUPsxhK41Q0bMN0QMNciQW9HOdMdDHzq
	QZlmEU8TXuKRxRf76vttD6biAOOikTeEIAE5DoAFlKqjR/y8mG+ajwHT1pavw7Zi
	aYLMgw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cudj7yv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:03:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed79dd4a47so103663991cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 02:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484180; x=1767088980; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kn07S0VFJ00r1Opp95FLhCfso4raJ3godCnzzNkTUdQ=;
        b=H8mL6uDhfGVkg0dfMvgFw3mxinVG5uaZ4hSPC+b+EB/feHqIwTJGywkT3uHGI/pmf6
         1dM8r0VgPReS2juu7QD1kr4vrLyWeFPqYLtney1aTghrOBLLLmTXeKujV6LTaBulTV4g
         0B2a/fi3bPOtEDSHwEM/A6spKcFlk+NDq7PQxTrnPV9WUDEHYnpN6Z1j/LxwgIgl4ipb
         0yWxTunFVQ8OeKMs1BTqqnyI0dqj5P6NdRZ/Q76swlaBI4iu5R5Gvi0T24zOmQguqd4A
         UJmnCgDb+mXP+VrVjPHH1XHEwFy9tECXbcqWY2iN1u0Igx/eQOizCPDBlUv5niPeSF6y
         5RQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484180; x=1767088980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kn07S0VFJ00r1Opp95FLhCfso4raJ3godCnzzNkTUdQ=;
        b=ZZoStl+XDdNlU1/VOa4wtJ7nMOkM2rOg8kD0LAzDnHzmgY3DUgmQiwh3rj9P1fcbnN
         mMgtdospX22gI9UyPCAF6Ptm4ixQk3w//89LPiHW26mtoFa7pAQXTBoUtubeBgJs3AMy
         BHdPZkTQ+95FgT3kxFsG2naluEJePnbBClbKpNRKYa0oL0JIsklRgsUSDePbhx2ym4Io
         P+urwQruKmlOtrQxvB2+OkGdWPHKtl+0cPPVRyKx15vjyxPV+/YyO2lRE2sdOcwzUFhU
         iWgLG/SdGrrv8IqjLZZAu2Pr5XiOrlWgLMh8VKA5EIeAW323e2lL3w07S+0xsBO+p/Xx
         zHxA==
X-Forwarded-Encrypted: i=1; AJvYcCXhaA6FfEkDQKjP5gn6ZyQhYyGDXiC8Kog2mStPObOabBeNpSQHwaX6F+7C7e/Ji9mslHoMirIlJhhSVRdoV/zH@lists.infradead.org
X-Gm-Message-State: AOJu0YwZvLGL6uLeszIwJg/oJ5ABhjzcVy7OLTpCPX4gLY+BNEc0kGSg
	iTqKjgwGYkmqcEMic4wrtXiRHAd1cZ6UXNsmP8TseJwRKc71z7T447Rf26TupgaZ3B7VSb+0d9d
	0tO4A9v21+HcqIqxcCpoM/vLg85f0n2yWgCMaHf2+GqdW6hNcyfS6MaX6p1KUJKOfwLbnS0gk1c
	/aiQ==
X-Gm-Gg: AY/fxX7V9JImoehglAbzU1n+dBVzrDPC7r1JK6u6SGCT09azoIIwp7eItcpKXw3wBhA
	tOEZVySEzOx3sDJyNDiuF7g9YWAxCeb+/gZSdycdrDAyPr+47TMzqViZyyG3+yJoOSE0XQ6swJI
	lEfLJK0loTmoetfesiT1nNE72k9RHhQi1Lo3J9SOnC4NotjPSOWJtXj6IuZRl/C+z+Y95eU6Sgi
	ONB9GZM5Abch3ZJUpwoHEpi+ieB1HXz6WXsO8KRPIJkLdW/qKZPSC9S6SbZlLou/xvKMe3iIJbR
	CCLE69b5hkuRK16PXcIudgB8CWBj6A4xOt9gKPEhZym8K4tCi223kb5EkKHNv3M16a3CKSSrnUC
	5YgT5Z6WNaCUanReQotc5JsnCdRs3dU12G/0FjA==
X-Received: by 2002:a05:622a:250:b0:4f3:5346:5d54 with SMTP id d75a77b69052e-4f4abd78d8fmr199055451cf.50.1766484180388;
        Tue, 23 Dec 2025 02:03:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEb/XwjqmlNu6biskXJYdXx7yRjIVunYQjmGPYAWmA2yv1ld3r5jkFpRaOKuHbmJJD/SAxQsA==
X-Received: by 2002:a05:622a:250:b0:4f3:5346:5d54 with SMTP id d75a77b69052e-4f4abd78d8fmr199055071cf.50.1766484179952;
        Tue, 23 Dec 2025 02:02:59 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:59 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:32 +0100
Subject: [PATCH 10/12] i2c: nforce2: use i2c_adapter-specific printk
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-printk-helpers-v1-10-46a08306afdb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2796;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1RcMgKhoVIDH/uvlkjR4k8BRDeSqy3Z1wqmJ/Zg7uPQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmjAWS6dV2oSrIJN/8EGc+7W8i9AyzXFZaPPi
 mcV5IzVlFiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpowAAKCRAFnS7L/zaE
 wy0dEAClg4CncFPQN0S3c+U7UOudBSZbQgLmP6HOhyUtZ3U9OLbCsKadAQFgEhSwX1jECTm5dNF
 0RdoIoG+fF0GCw60nKZXgiUzxNUalzHyZjn3MgzLiNqR/BAr3Fe55XuV4sKpYT6yU1xAZ1D0AS0
 WB+Cuxnns2XBnbCeu8KX2+jXTE4EspmlwPkIwNTPlrAlof76u8Fyj815z/OQA/0uApNYkRudhth
 8X0O57dlCLpgrWcFelojmLpkvLBhwA3ug9kSOZS5GlNWt9tC7n8yEBuUGnu8+MG+yfjadZSdiGY
 FI/2l6PvAgagfWA6020GUjaUrTrdzHQr57t80WmhjeCdzxZht4XNHlQGykb1O4pHcC9FQoSsK1/
 Ua5Ilo556Drv7i1I7H8wPdl3MyXIb2mphWJCjOR3kD/v2xvLIqwnApfjb1z+6ag9RZHTuZBzsch
 h700sSioPBCeNDSEl8K/MX2Q6LnXgJHDfoXh0dQWUt0WV2kziDw7ZQCFJMAL8MU11fniAfWtnLu
 0zkk4hjESymk+Muoy340vMIrgjGBzwhm/KxR9h3yN2OPcYeZBQ6RTKGDc0TXwrufHCZ3m2YcYPU
 zB8cbguyyVBO5QUmGddwtTBc2xiWqtP6i75lMrsX7aWcquTAWMGnXWUt2zTV+fbXqmMuyOwazC6
 QswEw5+ooZn9yfA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=ebkwvrEH c=1 sm=1 tr=0 ts=694a68d5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ULAvDvZivfA9C-ZB8fsA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: cujYomOf4ejiNwHeTejnshleFTy9bkLa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX4frlhq5THIz3
 LM368wUE+UvRxbacHK/PuenPSNBQOWWmEl8fqzvHnN3tChymDcoThKPBv44o5rFNiVzaI47npgT
 wibTQ95xP7oV1pOEULoP0GAIiX22TLGpKBBMd1IP/49rP2KvdKHiysZzEMkQnj8mqdgpgH03kUh
 WfohyhEWOql+ycuPXP/7LEchcooswAJCuKj/XCk0QQg0G7BycINac0lqjfv4PLjR5R1d6WG7B8A
 fjWMGT5aPqinKGqNYN31YK0173smmVpL5dFb3iRmpW3gOTHgU90xxfl+naQJ+HsvKXPJD+EoUQE
 MmSq5jB+64ANN8k/K8iB+bNrsiBeiXUmHaySgzwY3htpkts52o77QAYeAoMLYiWgVrkVkpVXgI/
 hhk+JYdqYV4yhDQ0x+uPZPRajK6fQt/J/Ziu0KL+c94meDl34hIPpChlrIKOiTShmPonc+ouoPK
 PgT0Nx5sgIPyGY7SlJQ==
X-Proofpoint-ORIG-GUID: cujYomOf4ejiNwHeTejnshleFTy9bkLa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_020301_865285_872697A3 
X-CRM114-Status: GOOD (  15.46  )
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
 drivers/i2c/busses/i2c-nforce2.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nforce2.c b/drivers/i2c/busses/i2c-nforce2.c
index d58a308582e47650238312537d2d721261d3bca4..2fa6f1dbd27a92c2d67915775e588e4bab675d76 100644
--- a/drivers/i2c/busses/i2c-nforce2.c
+++ b/drivers/i2c/busses/i2c-nforce2.c
@@ -123,7 +123,7 @@ static void nforce2_abort(struct i2c_adapter *adap)
 	int timeout = 0;
 	unsigned char temp;
 
-	dev_dbg(&adap->dev, "Aborting current transaction\n");
+	i2c_dbg(adap, "Aborting current transaction\n");
 
 	outb_p(NVIDIA_SMB_CTRL_ABORT, NVIDIA_SMB_CTRL);
 	do {
@@ -132,7 +132,7 @@ static void nforce2_abort(struct i2c_adapter *adap)
 	} while (!(temp & NVIDIA_SMB_STATUS_ABRT_STS) &&
 			(timeout++ < MAX_TIMEOUT));
 	if (!(temp & NVIDIA_SMB_STATUS_ABRT_STS))
-		dev_err(&adap->dev, "Can't reset the smbus\n");
+		i2c_err(adap, "Can't reset the smbus\n");
 	outb_p(NVIDIA_SMB_STATUS_ABRT_STS, NVIDIA_SMB_STATUS_ABRT);
 }
 
@@ -148,13 +148,13 @@ static int nforce2_check_status(struct i2c_adapter *adap)
 	} while ((!temp) && (timeout++ < MAX_TIMEOUT));
 
 	if (timeout > MAX_TIMEOUT) {
-		dev_dbg(&adap->dev, "SMBus Timeout!\n");
+		i2c_dbg(adap, "SMBus Timeout!\n");
 		if (smbus->can_abort)
 			nforce2_abort(adap);
 		return -ETIMEDOUT;
 	}
 	if (!(temp & NVIDIA_SMB_STS_DONE) || (temp & NVIDIA_SMB_STS_STATUS)) {
-		dev_dbg(&adap->dev, "Transaction failed (0x%02x)!\n", temp);
+		i2c_dbg(adap, "Transaction failed (0x%02x)!\n", temp);
 		return -EIO;
 	}
 	return 0;
@@ -207,7 +207,7 @@ static s32 nforce2_access(struct i2c_adapter *adap, u16 addr,
 		if (read_write == I2C_SMBUS_WRITE) {
 			len = data->block[0];
 			if ((len == 0) || (len > I2C_SMBUS_BLOCK_MAX)) {
-				dev_err(&adap->dev,
+				i2c_err(adap,
 					"Transaction failed (requested block size: %d)\n",
 					len);
 				return -EINVAL;
@@ -221,7 +221,7 @@ static s32 nforce2_access(struct i2c_adapter *adap, u16 addr,
 		break;
 
 	default:
-		dev_err(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_err(adap, "Unsupported transaction %d\n", size);
 		return -EOPNOTSUPP;
 	}
 
@@ -249,7 +249,7 @@ static s32 nforce2_access(struct i2c_adapter *adap, u16 addr,
 	case I2C_SMBUS_BLOCK_DATA:
 		len = inb_p(NVIDIA_SMB_BCNT);
 		if ((len <= 0) || (len > I2C_SMBUS_BLOCK_MAX)) {
-			dev_err(&adap->dev,
+			i2c_err(adap,
 				"Transaction failed (received block size: 0x%02x)\n",
 				len);
 			return -EPROTO;

-- 
2.47.3


