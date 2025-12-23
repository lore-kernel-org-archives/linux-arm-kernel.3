Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C31FAE6F07F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 10:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MmsjRYzbPQApFG3gTDy39jZnNuEkTvMlQkA5MBnb0uk=; b=N9mYQRc7aZWfnuE2iEqEsYVoYV
	M4augRMPnGGdX1kdrdhk5wNZ3z3Z3DkD1+GUrkBwIwKSWHQG2vc9MBH1puOAiKK1gcE1eLgYc5c5S
	j0ie670Ii65a3/VnR7918CLFYociumTYA051PTwruxBWKJ7i4zc7NstXx3W1AiSiOWxMG8AoaNJLY
	yi3XwgRxB/u1WHlMug6fECFhA1g6FN46hQ4BWZAQHWJOyX2o6HnWVinoWhtmixOImkQO3gT/Tq1cx
	9Uv3JfFucsictMAE7d8qd1lNriaDMv7tXx/mBJYVtnFjm+rRLI682XKrwYHXIgxMQBHn/4pcDIsFE
	Zoxm7jMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzEb-0000000EokB-1sZ7;
	Tue, 23 Dec 2025 10:03:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzEJ-0000000EoVD-1Ykg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 10:03:01 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN9wLTa2040956
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:02:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MmsjRYzbPQApFG3gTDy39jZnNuEkTvMlQkA5MBnb0uk=; b=l0SHin7knMBp+W3F
	rjAdrwhhQChHbWtqrCAp+evLZYpItXs6dFbvxnWh/YJnN33zWOWoJwp16SxDMxiY
	I92683Sva9KMNIzsZviuWwwIV4/12Zh5Uc4Z/Uth9R68KYSi+Mse7r/w7UdbaufW
	j0nQkbwyAQYq3phTTtVkZkPZXrMAZ9nv2sEjq8Ig/tKz8rAteoZfLnYpB9vzy+7/
	wN8gjtoeyhCBWOtzoGbuldEjGceBcX9WF+FAPOWHfP2IeHXVLlwwoTnuHHmU78NW
	Vnc3Wdl8cePqRuy+tUZHeNwsBU40NKzSC2k4RPNjkFd4t0LzXuEe8vIjtXm7Nkzg
	zGUvtQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b763pkay6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:02:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee0c1c57bcso161431321cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 02:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484178; x=1767088978; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MmsjRYzbPQApFG3gTDy39jZnNuEkTvMlQkA5MBnb0uk=;
        b=HfPiBd+oOaQZTo1MuunH5CZwQrVWodh2es4LvQjzOc6E6VsuxpwfhfA3Mn8ILldbyO
         lR6oGTsfpjfZXEVSPd5G0Ck/qNJey9yFB1fe40oRwzIBLHBTpWKYJR3q7uDI/lYwEGPe
         sAsTWxAXGknH1ZWCjI8DHaf+mknrTgvdEVFmpGyAEZu6FgeytwsZAzO0d8ljCQroBin7
         j9kNFz/tSFPVcJldg1TlVRuUQZanAjviVie2k/YLZo4Cp1OfhNtavpXovDS/hmsVXcO1
         ZDx9P4bAgdh6bV4fcSAbDYuUkr0YP0yxgEcZb6f39VLToCblg07mhKGec9pMF2CSdHWv
         5laQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484178; x=1767088978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MmsjRYzbPQApFG3gTDy39jZnNuEkTvMlQkA5MBnb0uk=;
        b=tyg+iGL03NQhyBBOJzedq+4OBElp1eA1AQsKvBjOHM3m0hCkLZ81wskR8d83AOM9Aj
         DYIoSDTyhk4epS4Eq6vM7jDFyTU9GAPUa0XHM1Xc1ZpsWcbrd+6YDiJtKdF6lX4fq//n
         GxaXI8/NhZ7ZzXHuVF2OHmBVR0ZSY45Ctn5nat57y2WQtMxEECf5qI40qKt8IZunqaDZ
         T0jSmbirv0vgnI5l45+PJk5A6/kCtZSkHK10V8dln2PfYzWdKEci/75qIGeK1s6JzjJE
         JLqIBqccIm94NBRPACdlZ9Igf0N2MXZ/vZdETB/3xFtZ3+JHkGrSFHI5Gi5ha+TZPz8e
         kvOw==
X-Forwarded-Encrypted: i=1; AJvYcCVV7UWm6STFxAbKhlfPGSfsHF/tmZezrwawRm705R88R28DvGDu0ICvIYCKXFhNubh+clVlFAcAog5Ke46mouoJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxGOnTMbOqZmhXPjWTBV3UlMVYWjld04cOhGMOIQmPMqzmZ1Ptd
	4WrYxknL3VmF9bNwjmeibqbgspMRfcAm58QmbRHQHkSKKGgxKdd6B/ASMZEGe9XHEseIBkDqkVS
	FL6+wNoQA4fvCnQKWbB3DEm1QXzUunUFCyrooy0YU1ymjNlZhQ+BSoCmO4l/ybGfqbMN9gGARkD
	mnHQ==
X-Gm-Gg: AY/fxX6k9npreuV+o64bADF1D8epRaM2yc4YMtheO4WQHSjlAEGe5nMqn1PnTgQsnH8
	vRKwUr8/1vlskOZBYeANJ0Lj4eYlndbjNLj5AbNt5Vp+BoNBd/t2OiguOv1JBNUn5pwnVjKgPkB
	IJRI3GtYEK/+3NnFeUY7IT3jsYEyOg3xlpHNmGjLdUtH5dqu9r6Xg8vzjmpRhPkkAhPDQPEaepK
	gOKPzZPRo3zUaD+IkJjrDMFmFrvI6UgmQdBYsA26ryBKsnZ66BfmxJ3E4sf4Lkp7JJwS1uWQQb+
	tHmtkuPgvTYgQMDoos23jMe5hpWIlcBLHAF5AyIFjL397IyWaoVZU4jYklBGknTTyolAZPgnL38
	taHPezMBYAp/nBnhwnZN+0i1YV9avXAii2qBmZw==
X-Received: by 2002:a05:622a:178b:b0:4ed:2ff9:b325 with SMTP id d75a77b69052e-4f4abd9da0cmr170484271cf.59.1766484177573;
        Tue, 23 Dec 2025 02:02:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqtT5y76xE8az8rWmZUAFSiMsbZmM7GNLUeqGPBNc8CbOBdHosyOf/hmpUH+aL2r9YccEblA==
X-Received: by 2002:a05:622a:178b:b0:4ed:2ff9:b325 with SMTP id d75a77b69052e-4f4abd9da0cmr170483931cf.59.1766484177013;
        Tue, 23 Dec 2025 02:02:57 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:56 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:30 +0100
Subject: [PATCH 08/12] i2c: powermac: use i2c_adapter-specific printk
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-printk-helpers-v1-8-46a08306afdb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4136;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DjhS85KLuUmnMirWSsbDnV889wlZnMXf3iYZWcjz17w=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmi/bEQ1L9OUWygCY0o7CnHkaJ9YYNQdACOF+
 T2aISaVKZKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpovwAKCRAFnS7L/zaE
 w+VoD/9tysA1McH2iqmTqnqT9TNdtCA2efLxLXzIh07p/GuadPXYPv0VYjpYgtS/mnYXnG5kuF7
 bqCL52zltH4UM+oeMdLZddKTJWnAYfzkJTnQAiiwEMWXdFstGKsWuGWKK07Ts9aVNyFVKai+EbG
 xXPXchfoaWgKDaulvUvaZOw6b2ZA8kN/cVPpdsAyV/nuP7IDz9KUsMmd52t/8J50HYV8T1cjhNd
 HgPKRQJjsApbEayChYhr1R5676oDuz7IdWJnCKatgAVzQTt094ci26dLCVJ3iS/ungYosrJtci/
 XWRH/D8P/yO17XK2v6b/GfY26/whonOZ0zLpAKZVz6mIouwgwdMTnM9zm4riWoF3A7QF+XtHps3
 sZKwAAgSl7tkOHHv1jrG6h700Z/rAy+IvVLBMGa/DzTW87vqQJeFJy0ssGFhY6+VHCFYkzk5vPs
 xaagyxWZ7dZeH5cp4jGzaD6m6/WYi3YkAd2J4ZMeYJsh4f8SGdzXQc60GqCb3AiVd4sqXBgJcuf
 YUfHp4volrryE9S++6+BNve8L8YRmvTU+oVH7lE8WFZ5UEf/F/W956xuTRE+kMy+j5fGOp3oK98
 dCtIPF4btL+WEy6jpoAwpp6vAPlyqcO9Xp9Nfp5/+2R4l2E4PI+cJ6Ax2E1xWd5PvNT0Gw1MBvl
 iOtdGmtZ89jEhYg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfXxL94VdBOSSzk
 QjTlemavmOeIXXAM8g8guOU8Nj2A+si8ojHcUz8LTdw6+NOvv4B1IuoM31AVnxkjT0iVirxeS+2
 6QiRlv27Un2hJP37kCgEH9P3WGLDnUUGzT7FtxdPrjQ6qStLI2TLxF2FAx4jX7rCAuVo9LF+STw
 u8kzCmlqJKVHF2RDj/qswarvdsNjgFFyI8TCJTxUHAziX8lKkQo3zWlVx2pgQ1XJT3zKtjJDMrU
 XTQuckxraSHqK9PnHzFHv9Wk+VSIBSMXO1cAiy5AFvZjrz9RZ2Zb5iqIy3utsfT25a/LzYFZ7SN
 /4JM6Ev3Jl8BWlRRgb7DVMiKiN9Qb4DGcJsVOd/sZ3ahvubFswdD3yGd7u87ODpgtPcQ0sOhb7C
 PGqzuOuSfrLiv3cyn5r3uCMxXBNg3+C/xi6oJTvYbBYORebEXXTH31EzlZOA8ygWkyzoY8cZAQk
 +NafBFoIvfSQ+ETekLg==
X-Proofpoint-ORIG-GUID: ST3STdG8xbuMRUwcCWsAMJMMI9C5W6JQ
X-Proofpoint-GUID: ST3STdG8xbuMRUwcCWsAMJMMI9C5W6JQ
X-Authority-Analysis: v=2.4 cv=H6TWAuYi c=1 sm=1 tr=0 ts=694a68d2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=xF5Bwn5Do6ynS7Zu1PoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_020259_567847_9258C132 
X-CRM114-Status: GOOD (  15.81  )
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
 drivers/i2c/busses/i2c-powermac.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-powermac.c b/drivers/i2c/busses/i2c-powermac.c
index f99a2cc721a81dc328bc03ea88ff959cafe0f05a..fb5482655d6c5c617392e9ccd745433d5d828335 100644
--- a/drivers/i2c/busses/i2c-powermac.c
+++ b/drivers/i2c/busses/i2c-powermac.c
@@ -92,13 +92,13 @@ static s32 i2c_powermac_smbus_xfer(	struct i2c_adapter*	adap,
 
 	rc = pmac_i2c_open(bus, 0);
 	if (rc) {
-		dev_err(&adap->dev, "Failed to open I2C, err %d\n", rc);
+		i2c_err(adap, "Failed to open I2C, err %d\n", rc);
 		return rc;
 	}
 
 	rc = pmac_i2c_setmode(bus, mode);
 	if (rc) {
-		dev_err(&adap->dev, "Failed to set I2C mode %d, err %d\n",
+		i2c_err(adap, "Failed to set I2C mode %d, err %d\n",
 			mode, rc);
 		goto bail;
 	}
@@ -106,11 +106,11 @@ static s32 i2c_powermac_smbus_xfer(	struct i2c_adapter*	adap,
 	rc = pmac_i2c_xfer(bus, addrdir, subsize, subaddr, buf, len);
 	if (rc) {
 		if (rc == -ENXIO)
-			dev_dbg(&adap->dev,
+			i2c_dbg(adap,
 				"I2C transfer at 0x%02x failed, size %d, "
 				"err %d\n", addrdir >> 1, size, rc);
 		else
-			dev_err(&adap->dev,
+			i2c_err(adap,
 				"I2C transfer at 0x%02x failed, size %d, "
 				"err %d\n", addrdir >> 1, size, rc);
 		goto bail;
@@ -145,23 +145,23 @@ static int i2c_powermac_xfer(struct i2c_adapter *adap,
 
 	rc = pmac_i2c_open(bus, 0);
 	if (rc) {
-		dev_err(&adap->dev, "Failed to open I2C, err %d\n", rc);
+		i2c_err(adap, "Failed to open I2C, err %d\n", rc);
 		return rc;
 	}
 	rc = pmac_i2c_setmode(bus, pmac_i2c_mode_std);
 	if (rc) {
-		dev_err(&adap->dev, "Failed to set I2C mode %d, err %d\n",
+		i2c_err(adap, "Failed to set I2C mode %d, err %d\n",
 			pmac_i2c_mode_std, rc);
 		goto bail;
 	}
 	rc = pmac_i2c_xfer(bus, addrdir, 0, 0, msgs->buf, msgs->len);
 	if (rc < 0) {
 		if (rc == -ENXIO)
-			dev_dbg(&adap->dev, "I2C %s 0x%02x failed, err %d\n",
+			i2c_dbg(adap, "I2C %s 0x%02x failed, err %d\n",
 				addrdir & 1 ? "read from" : "write to",
 				addrdir >> 1, rc);
 		else
-			dev_err(&adap->dev, "I2C %s 0x%02x failed, err %d\n",
+			i2c_err(adap, "I2C %s 0x%02x failed, err %d\n",
 				addrdir & 1 ? "read from" : "write to",
 				addrdir >> 1, rc);
 	}
@@ -219,7 +219,7 @@ static u32 i2c_powermac_get_addr(struct i2c_adapter *adap,
 	else if (of_node_name_eq(node, "deq"))
 		return 0x34;
 
-	dev_warn(&adap->dev, "No i2c address for %pOF\n", node);
+	i2c_warn(adap, "No i2c address for %pOF\n", node);
 
 	return 0xffffffff;
 }
@@ -235,7 +235,7 @@ static void i2c_powermac_create_one(struct i2c_adapter *adap,
 	info.addr = addr;
 	newdev = i2c_new_client_device(adap, &info);
 	if (IS_ERR(newdev))
-		dev_err(&adap->dev,
+		i2c_err(adap,
 			"i2c-powermac: Failure to register missing %s\n",
 			type);
 }
@@ -299,7 +299,7 @@ static bool i2c_powermac_get_type(struct i2c_adapter *adap,
 		}
 	}
 
-	dev_err(&adap->dev, "i2c-powermac: modalias failure on %pOF\n", node);
+	i2c_err(adap, "i2c-powermac: modalias failure on %pOF\n", node);
 	return false;
 }
 
@@ -331,7 +331,7 @@ static void i2c_powermac_register_devices(struct i2c_adapter *adap,
 		if (!pmac_i2c_match_adapter(node, adap))
 			continue;
 
-		dev_dbg(&adap->dev, "i2c-powermac: register %pOF\n", node);
+		i2c_dbg(adap, "i2c-powermac: register %pOF\n", node);
 
 		/*
 		 * Keep track of some device existence to handle
@@ -353,7 +353,7 @@ static void i2c_powermac_register_devices(struct i2c_adapter *adap,
 
 		newdev = i2c_new_client_device(adap, &info);
 		if (IS_ERR(newdev)) {
-			dev_err(&adap->dev, "i2c-powermac: Failure to register"
+			i2c_err(adap, "i2c-powermac: Failure to register"
 				" %pOF\n", node);
 			of_node_put(node);
 			/* We do not dispose of the interrupt mapping on

-- 
2.47.3


