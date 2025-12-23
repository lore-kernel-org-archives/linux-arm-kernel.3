Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0648CE6F079
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 10:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aRgl7yRlCXzyxV5Kapc0nHIuCvjnGwXzj9M2FJADyBk=; b=zPIqaES/rlVOYNhI+L8QwTsJoe
	doYbKdaO9XQGHSZSyG3VqnbAcgWcjHpfMoaI4QNotAYaPERcw9iKmAkFhX1SyT2Kgy50BH386IQoW
	Mp+dz3OlCvHlTGjwBrNP7kmYfolqw8d4+rf+v0NlRddYeYQWlN3HHOQrLWiBlsk6ro2occPCgIihA
	kp1OnS+UhRi83Lt/NgNYjQPy//3l7K1tqGz46/9Y3vi4sCW2XLlMuyqTui9gGN/PTh/ZLbkgmsqZa
	/CvGZcaVkOBzXx794DsWZ76k/+JqKcQs8uEj8XRJZgG6iM6yzyZ23pJATKtQcxYSqDgFrdPTJJdTR
	J+YvmXVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzEH-0000000EoTR-2dbY;
	Tue, 23 Dec 2025 10:02:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzED-0000000EoOe-1Avl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 10:02:54 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN9uYk51530068
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aRgl7yRlCXzyxV5Kapc0nHIuCvjnGwXzj9M2FJADyBk=; b=g5cVDaNpMwXsImmJ
	gT/ZfS2PGwp+freHknl+WUVEuhaemAoe9mzv8tv9/oROdqOtSjsGfqMYpjgPG2NC
	7Yo/t3Uk06b8FEwDqwP0RjOph1mkPBn8SnN3ZHCWbGR+RfLkNQIglZ39gV5OVkgo
	8hZ2q4l/LHjQePZp34mfi1q8zoitHSYg8Zl4pgJsWoZFK3QrdRAcPfu3iAbdSXjm
	SKkxVi4Hujbk9GZkci0wHGH9iLVfvSheJnA7sd8Vb+qoYG2/f4O07d6CqhM1kV+G
	HTB2X3aNLuFpv7lKmdFWqGVbDHtRHq2n+MoXF8KJ6lPjzrKwImcOc6LkPfi8fj+T
	68KxkA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b758y3g6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:02:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1d2aa793fso121750991cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 02:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484172; x=1767088972; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aRgl7yRlCXzyxV5Kapc0nHIuCvjnGwXzj9M2FJADyBk=;
        b=gqBmh97OyvOMviWZ22znz+zKcbmJe8mBAE42+O3FQaM2jzltLDOi5luTz1K/a4ZrI7
         cAq9goTIWnNfHvVzW8NeJNM8pTHDLmKya7eWkVmmlCQxBaIEFgqZDCLSEQK+y8Zjt25s
         jDmIGbfAh2EeFwi07zJ2V+HIeMBxqjHT3WWZlmvEoxvksReFRWaGPb7D00SU8YIw5hc5
         QoQ+IbF2ICzLo8qd8wo/Zc4osLHxkXPGHfFRbWGBmtarLWQaaGznVkcOj6Uzsj5H27dF
         624sOb5+mHWhaKva3iU9aGAPEaWMzMvLcFUNISQvopOUowyg18vdVsHrS1xpLJJSZDwq
         X8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484172; x=1767088972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aRgl7yRlCXzyxV5Kapc0nHIuCvjnGwXzj9M2FJADyBk=;
        b=O0rzHX6bZplPHz5wDt6XoE8pwunolCyXyCWbRJNcd6AQUEHNY2HYPSYySq+zocifWM
         4Rb43moeBXYZ7aPeJzY7H6EfjciA4JgMbCMCwpgsDBfMqdFN5inVYTeI7TYg5tm1JWaN
         curv39cQdIBNl6pxqobsAYe5qF2E0MtCNEX8cLjCAzNBonOz1zJv/xw3lQ50I6iPPzs0
         JShXdkaWpn9RKa/hfBZQdaGfzex2TEhnVKIqFfe6Q9g3JuGbFfO89F5uFvsDbBxd84Mp
         BVbXgtEVvFg596ud6Vacw/uNxDWXxR7hCH8I8gAnc1nVSnK33JTshT5YGsHsBtMdmMEe
         yZ6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWofQfXdOjR2rDGvsnVPdYA1SiIkdPqKE7MjLFq3G2UhJsm1H5f2SM/pD1UDuy2NXQjOdTKgkjAp+OlGk6KVamx@lists.infradead.org
X-Gm-Message-State: AOJu0YzgMWS307J2Wk3WkEgCwgLzzTw1oQ/REKV1eAywD5ffSwUHaqnp
	BAKRl+CoHAwRjng3xoqey8SDXtXWWdXEqrjzij2DAtVPP9a9stxTTR/lrazy4TApchwG21cgpA/
	orXn6HJSKNkTvIt+fVYzbg/VaOvGMFUvE7YTVoAsQ+VUetJc2RRZklvgZD755kCRZyRqaGw3A/o
	LIcw==
X-Gm-Gg: AY/fxX6KregNe+r9htyqAyUGyy1yWb89HXrLbZR/moxdC8IxhIMAtC4O8JC6Z5/ll/D
	glG4Iz7cwsSksH8I9JnYM0G0YzVqKrUOmEqBufxUXINIxrLrgdHX5+hPs5M8mmKMc+X34n7Rrzc
	28vSVWkqCTWGTxoaWJaIX7HZ/T0e7P2GIT3zmhh8Hp/ZxLV4pBme9JWf/UJagkepgX+euVrGYsR
	N0kfJKU1cIY/zc6UMP1ET3B6LRDD+vLkD82WQDRsWqsjIfu3idiXmnqMM4MZ2kiomgm1iTNB0Lg
	z2fGESmjQyQKYQGnIs8MsL2pAGAclMfblixKhP7CuX7FxOAxs1gcW07M/S/U4p+vAw0rH10DVKx
	uov3zi/XKWQo3lwD8oEXHb49MvLurwaUa57nmcw==
X-Received: by 2002:a05:622a:4813:b0:4f3:5652:6743 with SMTP id d75a77b69052e-4f4abd79a87mr210916081cf.39.1766484171684;
        Tue, 23 Dec 2025 02:02:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2nrkfO76+qDOJ3k1gwHAAwaCG3ETkY5QEA1jJ//1LJTq/ZgfSqHuPJJDz32+uEXbZStF10Q==
X-Received: by 2002:a05:622a:4813:b0:4f3:5652:6743 with SMTP id d75a77b69052e-4f4abd79a87mr210915701cf.39.1766484171153;
        Tue, 23 Dec 2025 02:02:51 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:50 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:26 +0100
Subject: [PATCH 04/12] i2c: isch: use i2c_adapter-specific printk helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-printk-helpers-v1-4-46a08306afdb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4804;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=v8r6k2O16OnH5w6BGAVCeXNkCvKSFSyUWNXZMHQqfkA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmi6WTQILh3vDp8LqDDriRAq9W1Ef9GxiLPWF
 7dPi5v50q6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpougAKCRAFnS7L/zaE
 w1rXEACS0olMUbGK/4Yp3SSQETn8Vguzf1GV7NdR6FPf2hSdaFxGeutLyKpJl+R34UFzl3HIo16
 D5lvsdFTfAgGtO3OfJzRqJzvZiqKUv/RaZurI8wGPSvyM2wWpFRZtWYSM3x4yJ799xkM61vhiO3
 zCtFQX9FndLM4u3ArsvyRbokSficADUkzDEd/m5GB6DOK1UvgbgKFEVAHSsIthU9RLEdhjCwvrb
 Ooii5Z3b0haaGOKsDZgWYBvUl5X8PqWNqB4kVsV5X/Nps8sJJPl19O+rRow/9YSZRthPEd5W8YH
 1EKH+MSz9FoYqIBNvIHExKMy512VO/7h/987/ta0sQRcfGQv5MxS61Yxl53icjrbJ0e2pdrGTAP
 MQwnWQk4Ofkr3KB11kui0cRbFlJsEDcsTj7APhADj44YTHseEvx+YadnT/7rWrJscq0v0E72JuO
 LHzxIy8tS87lik4AXEhsmQQrjDWGlZb0/fx0V5IVRHSLLkjhnk1pX2+MtSuo/q5/zvrzHWGAbBR
 McWzobJevYOUQFVNqS7YiwfVAQOtduMCW9Wq55OKrnKp8PYI0IgH3ubSPg2qT+HbyEtuV+lgF6z
 ARUYr5FUkASy66qOcrG7IVFQzoMvR+0ckhdp5lig8EwJf+RgQ6HBs/LgJDIICAh3sy80zf3Lg86
 PD/zBN2HibFEgAA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=TOdIilla c=1 sm=1 tr=0 ts=694a68cc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7nvlAvaXHceVFyMUCzIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: YWxrx4kL2qBX_2_uL5UEfJICE0_d9PH1
X-Proofpoint-GUID: YWxrx4kL2qBX_2_uL5UEfJICE0_d9PH1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX5uAdMqw2LaSJ
 aLIj+rtw/jRfPvbheNF834Joa7wsXUXzqTHlSnOewQ/d2DwSEBeLE+KcLv7YDi9n6976ku/seGH
 smw1IIZC5snfotgM5nsdF+YSzexPZRQhsJUsbZBWrKdj382N+nqr+fxnL1j52cR9IfUoussmSGi
 r4ausS3QeuRKft64mdps8JPf9FmlCK3Q1+l1Ka+kPVmUHmdNQMD4DRrDyWGpE9NiX9z82HPlPpV
 JeQ6bf1uXXXUQQqN7VCOXKieS951+jVfoxFuJHC3xFzdeimZUUVB8zG1JH+drCIdZT9bFOddXkc
 6dSd2O6Hluj7bVHgJzmZF+4qM9bA8oo9RDs1yzuYDP8W/k39bGhCZTVRAes6mWlBiLEQGdF39jd
 dKElI34S7b6x5i6tJsoDk+eJ59v4cWFtkvKSc+fKaJMw6oW4hEnqgarjvDqC4hyDEALTa9z9fVu
 XC+gbBl0vm0V9B97YzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_020253_344083_F3B79CC2 
X-CRM114-Status: GOOD (  17.38  )
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
 drivers/i2c/busses/i2c-isch.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-isch.c b/drivers/i2c/busses/i2c-isch.c
index a2ac992f9cb0d2accfaa979b802b98c3b7fbe3af..6ff07ab12e30db6821cadea4de3a588b9023ea20 100644
--- a/drivers/i2c/busses/i2c-isch.c
+++ b/drivers/i2c/busses/i2c-isch.c
@@ -86,7 +86,7 @@ static int sch_transaction(struct i2c_adapter *adap)
 	int temp;
 	int rc;
 
-	dev_dbg(&adap->dev,
+	i2c_dbg(adap,
 		"Transaction (pre): CNT=%02x, CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
 		sch_io_rd8(priv, SMBHSTCNT), sch_io_rd8(priv, SMBHSTCMD),
 		sch_io_rd8(priv, SMBHSTADD),
@@ -97,13 +97,13 @@ static int sch_transaction(struct i2c_adapter *adap)
 	if (temp) {
 		/* Can not be busy since we checked it in sch_access */
 		if (temp & 0x01)
-			dev_dbg(&adap->dev, "Completion (%02x). Clear...\n", temp);
+			i2c_dbg(adap, "Completion (%02x). Clear...\n", temp);
 		if (temp & 0x06)
-			dev_dbg(&adap->dev, "SMBus error (%02x). Resetting...\n", temp);
+			i2c_dbg(adap, "SMBus error (%02x). Resetting...\n", temp);
 		sch_io_wr8(priv, SMBHSTSTS, temp);
 		temp = sch_io_rd8(priv, SMBHSTSTS) & 0x0f;
 		if (temp) {
-			dev_err(&adap->dev, "SMBus is not ready: (%02x)\n", temp);
+			i2c_err(adap, "SMBus is not ready: (%02x)\n", temp);
 			return -EAGAIN;
 		}
 	}
@@ -116,28 +116,28 @@ static int sch_transaction(struct i2c_adapter *adap)
 	rc = read_poll_timeout(sch_io_rd8, temp, !(temp & 0x08), 200, 500000, true, priv, SMBHSTSTS);
 	/* If the SMBus is still busy, we give up */
 	if (rc) {
-		dev_err(&adap->dev, "SMBus Timeout!\n");
+		i2c_err(adap, "SMBus Timeout!\n");
 	} else if (temp & 0x04) {
 		rc = -EIO;
-		dev_dbg(&adap->dev, "Bus collision! SMBus may be locked until next hard reset. (sorry!)\n");
+		i2c_dbg(adap, "Bus collision! SMBus may be locked until next hard reset. (sorry!)\n");
 		/* Clock stops and target is stuck in mid-transmission */
 	} else if (temp & 0x02) {
 		rc = -EIO;
-		dev_err(&adap->dev, "Error: no response!\n");
+		i2c_err(adap, "Error: no response!\n");
 	} else if (temp & 0x01) {
-		dev_dbg(&adap->dev, "Post complete!\n");
+		i2c_dbg(adap, "Post complete!\n");
 		sch_io_wr8(priv, SMBHSTSTS, temp & 0x0f);
 		temp = sch_io_rd8(priv, SMBHSTSTS) & 0x07;
 		if (temp & 0x06) {
 			/* Completion clear failed */
-			dev_dbg(&adap->dev,
+			i2c_dbg(adap,
 				"Failed reset at end of transaction (%02x), Bus error!\n", temp);
 		}
 	} else {
 		rc = -ENXIO;
-		dev_dbg(&adap->dev, "No such address.\n");
+		i2c_dbg(adap, "No such address.\n");
 	}
-	dev_dbg(&adap->dev, "Transaction (post): CNT=%02x, CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
+	i2c_dbg(adap, "Transaction (post): CNT=%02x, CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
 		sch_io_rd8(priv, SMBHSTCNT), sch_io_rd8(priv, SMBHSTCMD),
 		sch_io_rd8(priv, SMBHSTADD),
 		sch_io_rd8(priv, SMBHSTDAT0), sch_io_rd8(priv, SMBHSTDAT1));
@@ -166,7 +166,7 @@ static s32 sch_access(struct i2c_adapter *adap, u16 addr,
 	/* Make sure the SMBus host is not busy */
 	temp = sch_io_rd8(priv, SMBHSTSTS) & 0x0f;
 	if (temp & 0x08) {
-		dev_dbg(&adap->dev, "SMBus busy (%02x)\n", temp);
+		i2c_dbg(adap, "SMBus busy (%02x)\n", temp);
 		return -EAGAIN;
 	}
 	temp = sch_io_rd16(priv, SMBHSTCLK);
@@ -177,11 +177,11 @@ static s32 sch_access(struct i2c_adapter *adap, u16 addr,
 		 * 100 kHz. If we actually run at 25 MHz the bus will be
 		 * run ~75 kHz instead which should do no harm.
 		 */
-		dev_notice(&adap->dev, "Clock divider uninitialized. Setting defaults\n");
+		i2c_notice(adap, "Clock divider uninitialized. Setting defaults\n");
 		sch_io_wr16(priv, SMBHSTCLK, backbone_speed / (4 * 100));
 	}
 
-	dev_dbg(&adap->dev, "access size: %d %s\n", size, str_read_write(read_write));
+	i2c_dbg(adap, "access size: %d %s\n", size, str_read_write(read_write));
 	switch (size) {
 	case I2C_SMBUS_QUICK:
 		sch_io_wr8(priv, SMBHSTADD, (addr << 1) | read_write);
@@ -223,10 +223,10 @@ static s32 sch_access(struct i2c_adapter *adap, u16 addr,
 		size = SCH_BLOCK_DATA;
 		break;
 	default:
-		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_warn(adap, "Unsupported transaction %d\n", size);
 		return -EOPNOTSUPP;
 	}
-	dev_dbg(&adap->dev, "write size %d to 0x%04x\n", size, SMBHSTCNT);
+	i2c_dbg(adap, "write size %d to 0x%04x\n", size, SMBHSTCNT);
 
 	temp = sch_io_rd8(priv, SMBHSTCNT);
 	temp = (temp & 0xb0) | (size & 0x7);

-- 
2.47.3


