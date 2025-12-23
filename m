Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35392E6F07C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 10:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x9w1CN691OQTmP7uC2eAhibBXaSrfMYpwQfqEaEU3mA=; b=ZGXPTZIusqd4FHxCQWCiIgnHal
	qU87JZJbRim+Bn17jOF3ZCzeTPp0i4LLjmW7+X1xl96osTeLOZnVele4F6seEkCJY88mzVhcWD/O+
	3/+BTyX7mlc38/T/jCLxib5IVeVejezCea2OsVxnKgggDTdsimEiTAdZZ+jTRB9ddjoHXcjDrNE+6
	MpLBwrPykbggZ5ehGkYT2iV9lyAym25Ei+hHyjEOmydrcXSgF2g9Hu7PJMZFUX8KI4dmuHGK50vTk
	p5hKKFbGAAwbcCD8JUNm6/bg6Tj2hv6oOs21VHyuIaMGeLikSIxvGh2ped0Yqy41U22arvae6rtaN
	sDxNcbUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzET-0000000Eof7-1Seo;
	Tue, 23 Dec 2025 10:03:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzEG-0000000EoR9-1Ja4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 10:02:57 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN2mlUw2199150
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:02:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x9w1CN691OQTmP7uC2eAhibBXaSrfMYpwQfqEaEU3mA=; b=PGtJqv01xFkPDLF0
	9sSCKg1EzX/dfThiML4tQYD6RxzIc2D0GQHgc9E5woU7+Qa4ZD5BmxFTfDwom/Zp
	/dTHffSso6IFUu/pp+5jvKu7njf7FTstNTuN10HjgRc35k1yoFcgALIkB/1I8QMC
	QZCbZDN/YTk06R+RYffs75NYZgj+u5kftGGI3BgyL8qQ+MYuvyX71b+IxVB0u3IW
	CwtPIanv2tzUPcpsOm8L7bW29WfX/DVqFrGHi9cT4ZWsPFpXoQjXlkOONgsyHBol
	OisiQG69PHI+hDVSzmfJCWIjsuRO6dStKYjFiplI/ML283x011S2Tu2nlBLS7Ev+
	f8qGUQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b73fwurfn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:02:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee0995fa85so136704881cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 02:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484175; x=1767088975; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x9w1CN691OQTmP7uC2eAhibBXaSrfMYpwQfqEaEU3mA=;
        b=L1Q76DT2rpFnDLAeb7O6KHxCKEMd6HAAEav2+Gj+Odx6b4FtjVfsty5lrQZYm6xc0N
         F93KSlNTu9NPRzeJ1/0Jh26VsW2RpFYPq6ooSDXwjLfpInwKyDhv+azl8Znk4F0GzdzA
         ATCkQOVDAOL++cocgkkkL4HXGte44oe+M+O4VDEorZVhIFSLqH7EbBt54vQ10uMrihF8
         u2nAoi7f9A9XaQ6zv40PC9mpME5acESBrI9wA7c/N8btAWAjNxXLhGnlK5lWow+77b9X
         zeQGDbrHPRmwsy2FNWRv8yrtaqCp9Kj88TrOxEJDc8REPXedDYxT32xtlIokVSQ9xutD
         7vEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484175; x=1767088975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x9w1CN691OQTmP7uC2eAhibBXaSrfMYpwQfqEaEU3mA=;
        b=n4WrTlcTkcb5sxqCEnT7u7hXcPK+3DpYZe6SJafSZyKBO+vZSuSiN/4VsFqzntq7nK
         3/GFzTi7I0wfkUl9vD/KjhLIMnG4EXlanmZXU6nWJQWsdm/LcPifKJWzg9aO/CmL9BfZ
         OEf16YIBBRB4FY3u/Zoy7VNr99iYvZIOQBF0x5JWFtNDLG1G0YRgZj0Ij151VrSkxeqK
         Qqx8sjrdfSzVNnNcL/T8YxmviY+os2ymS3RkD2jSfFqugdku7xDCQxeHnXSFFTA3KOQV
         BTjHK2vBramC46IyACX9LxKdLrPqy8Kc3lL49r1d16XFbKJUjrP/KDdftG1Ip1Ni38OM
         v7/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXJv2h+r98DmipCnwLIG4AnEdxlhFpL3NPbNlmbzAunU4Ba+9HT2oWVyZYYzpweOcxMdHEPnmcj9cl5edEjKRqc@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1n17l5lHRp4pX2H6tCjKAwssRE3D5QrP7pkxZftuiHbbHn/S6
	WgNAvjuiyFCtJ28iSzOfciefFsiwRC6gD0u0P8uMhhu9IWsWifyxtQkncY8cy511lzYqqhjZmyM
	GlRHz6T1UHRzpvBJM/mNvU67s212sQih35Aa+HWErrSEqT8YAH10UtF6QQQ0wd7APqQdTLabkO+
	mb8A==
X-Gm-Gg: AY/fxX4FT0sINeoEGR9ghAwpJ3Gh6nh+nvxZXGrRIsnqWDJ8MQ40X8CortIg8jk/cqr
	cQbPSQQ6FKG2279NcSVNBNziVwnhq5udW30AkGv8b2ipHnzRY3LrXb4azjENqK68DhTZdqOY7UG
	12xC3GIA0uRZJaTRQqf/7gkH11NqjuoMq5xFDLgFkFs86sJEhRoRn4xOH6+0BNf9mQqN0wRCW9F
	jvbzzaaJKrc6OwxBw9oQo7QUHLPZ7QSXXF4+PoNg52DkDxDxrW6Bji+f+YQPxd3/t47vgtfMj5+
	Vkqn+dnK+dx6cR4Je4y35NHg2GxgF3ltD7sFL4vk3SsKwo/QPOAFPaoI5KT0tC2mIGxlK7za6PJ
	3PAEFgXDGMH3j0/tvT+whi2y2u14LYsAotKPB3Q==
X-Received: by 2002:a05:622a:258f:b0:4ed:8103:8c46 with SMTP id d75a77b69052e-4f4abd6e488mr216717981cf.48.1766484174527;
        Tue, 23 Dec 2025 02:02:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPzfEhfDLCN2KQRG3eXv3603/QIFTCQ3fgqRQI0wW6fh6MkpQmoObyB8JOHuhsUVXPreOj+A==
X-Received: by 2002:a05:622a:258f:b0:4ed:8103:8c46 with SMTP id d75a77b69052e-4f4abd6e488mr216717531cf.48.1766484174005;
        Tue, 23 Dec 2025 02:02:54 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:53 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:28 +0100
Subject: [PATCH 06/12] i2c: scmi: use i2c_adapter-specific printk helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-printk-helpers-v1-6-46a08306afdb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1478;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=RIl62iCgn+geu7s6HZTdTxIYUTQdth8ibomSIberRJc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmi9QpltbyrI7odMVS6fBVkmr9NkXuk8yrkL3
 XkWgXt4udWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpovQAKCRAFnS7L/zaE
 w2S/EACN3KysLT+Ab5yj5K35LkC7LOd9tZrE/a0sLOrsKkOjkbjUa099UfaIId1GKtt1/aaAzQn
 bZtc/GClmaiNzCfR4bdnbVCOVXcvIMikDvr42Wf9iQqqnRCpoo8mUXDx+bNQlo7MjKwKVs0vSZC
 GKF+3X565kuPX31mKr96XKGHfsHSCWADBDiSR4kBX3h5vgQeN0zgFPq9S9MBTBDEMmSfHtiS2Eg
 R/O5ZJc+6Xa2eElqXm4De1R+zF85mV/Qu3xkpuSFXEWWFZhrCd/Ei64B1WJpo5pA0cc4Y+Lo8ey
 gIdKhh6SkCedu9ZLoJy+3fkDCRrmC+vvtlu/nb3ML0x8cJEfNehgmqTRuNBTuAujBvJ+PTc24V8
 PGfeAsHnI7pMMHFbjZXKht9/nQ/5DDPtWRMc3xAXdTmNetVRcZqeaplnBfr06ZJtCg/I36MZcUE
 QOyAsPM1E91bToi8GsL5jQlpfOusxgAozXWvj7l5DE7mo1AEXBsGthuECijJh44aKfymlGGRvK8
 z3cOUlq8lItD9ixk98dVGmGPYFvkhxl1WPKBNhZ7+wdB9GFywUHMR1SKCe18iO1LhrvpgzgYOSR
 4wdpgP+2B/dPen0U0hk+ZaNGKeQ9soQCtUpUwkr9ASGtDIF3vmVtCxkzoCIM2wyEnK8iAuQGW9M
 FJMCJ+lgq98p1vg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=ELgLElZC c=1 sm=1 tr=0 ts=694a68cf cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dY4OjmsCUpDc7DjzIskA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX88nYxaPJNYce
 2/hTSf4AYRKXEn7jIGM7gumgX93+l5esREiJ3aJ+97F5FTGpwn9ax1tgFyWfYiKADK1MywcYsht
 1JCIKgH0zitbDK8EgLBLHDhDRLxSzYGH9RVtpM5BjEYChDynTF0HFhwC6tyQuuDdhm1TI7hPpaD
 DCuQRXo5/7uE58oZkUOHhl4C1sOrSz6D143hwDpYqJh3mwOVp9njQu6j13VqQG5LtBM5V554e/2
 /dBNjV72pnJWPcee853uzMUew23APe+dUeb499FFGiJxMpS2V5+5mVlvzHBTly+7UxHnEQZBJmA
 FxlmUNcPkpl8JOAo3YQToxA7nSvUMiDyIHB5ryiyDMBPUh/slelKZTFbKrRjSuGrYgrDRH2ldeg
 9eIPfxZbhrQuu77/TWNet3PbdVahwDvAUvNF2PSSXXqRUanDEIYxjsFUSj2awCVXQTCABuSac7Z
 oM9wSS8EPs47X2uwlAA==
X-Proofpoint-GUID: rrmAq6dZ_qW0K4odMkc4T8D_7MzU9qzO
X-Proofpoint-ORIG-GUID: rrmAq6dZ_qW0K4odMkc4T8D_7MzU9qzO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_020256_574043_BFB47783 
X-CRM114-Status: GOOD (  14.30  )
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
 drivers/i2c/busses/i2c-scmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-scmi.c b/drivers/i2c/busses/i2c-scmi.c
index 10a5146b3aa5fc6edb4c2f3e1cc57750041b7087..96a2cd70d367f485d5f230be4eaf124398b0f239 100644
--- a/drivers/i2c/busses/i2c-scmi.c
+++ b/drivers/i2c/busses/i2c-scmi.c
@@ -87,7 +87,7 @@ acpi_smbus_cmi_access(struct i2c_adapter *adap, u16 addr, unsigned short flags,
 	char *method;
 	int len = 0;
 
-	dev_dbg(&adap->dev, "access size: %d %s\n", size,
+	i2c_dbg(adap, "access size: %d %s\n", size,
 		(read_write) ? "READ" : "WRITE");
 	switch (size) {
 	case I2C_SMBUS_QUICK:
@@ -148,7 +148,7 @@ acpi_smbus_cmi_access(struct i2c_adapter *adap, u16 addr, unsigned short flags,
 		break;
 
 	default:
-		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_warn(adap, "Unsupported transaction %d\n", size);
 		return -EOPNOTSUPP;
 	}
 
@@ -257,7 +257,7 @@ acpi_smbus_cmi_access(struct i2c_adapter *adap, u16 addr, unsigned short flags,
 
 out:
 	kfree(buffer.pointer);
-	dev_dbg(&adap->dev, "Transaction status: %i\n", result);
+	i2c_dbg(adap, "Transaction status: %i\n", result);
 	return result;
 }
 

-- 
2.47.3


