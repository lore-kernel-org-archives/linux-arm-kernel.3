Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677EDE6F079
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 10:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7VJPGTun9iAEUTgsAs5oldXV0hm6NbS8Rh/bgRh+cvE=; b=1jB0RmAx/MeqI11bjmY2b62ig2
	k1zJq+Jie79Pzr0VHK4zGKDBHI5bADP63/rM7XS/p8iLtbxV8IbAEUPnpLqynwKnvsBnWNmhpuxXA
	fF9HB8f5QjfX9P5QFXyTSeVf+a9QnzxgkFWmB1lQcfHmm4iO31ie7T1c2H1Kn9g9RO6mToH03FdK+
	5RA4cM8DBdRcdnwKIDLBAngag22Or5pSYaig+vB0RdoLDBTsy/uATsnGdobrTJOId6IiM4y7kShvd
	QV93pR2fG1y8D6NlkOV3wEjay+uTAvlY5HX3zSib1CyruJTwk29Yp4CAQ5EGk+7U0aI1d4Q7vM6+r
	V48x9nSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzEU-0000000Eog4-105t;
	Tue, 23 Dec 2025 10:03:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzEI-0000000EoTu-0ZEP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 10:03:00 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN2uKbO1528818
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7VJPGTun9iAEUTgsAs5oldXV0hm6NbS8Rh/bgRh+cvE=; b=bIBBN9gEj819WWSx
	ukr6MOHNbMcO371J8nAzeNYa6kAXDXdyE4Dg/KOTsXaUTl9qKkZkGyRLFsanbFM7
	ulRV11/8RRD9xGHJkL5via2oxM8bV6+tDFtIDXmq/u97zF8aI5SlLyMu89neCMDG
	4+G1BfRsARTSwS//CvhRqWHZi/lbX18qELxu7Gulg/+9G/jTQHbcFHvI3sSUJbpu
	F/geqQDiMKZYCvIorg0sAQNQOseeeCIphl8Yf9Ax6I4JQuaCniTsMznNJN5oeS26
	NkGkG3bWxTuZe2B7WVeVjmr83pKepmi4QZzpriJF/ENOpl53lgZMfiuxGK9Xhcqy
	0qriWQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b758y3g7g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:02:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee416413a8so52841481cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 02:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484176; x=1767088976; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7VJPGTun9iAEUTgsAs5oldXV0hm6NbS8Rh/bgRh+cvE=;
        b=W+V7mSSHqOLiw/8T2MFFWMtAxfXXPTk+nibA86HJpyEZHmzxHsriqfjczwfUl8qc3/
         zoMz3WhplRCpUnf2C/HzgQKSZZqpYqWVMW0rktWWg8aIH7ruteqmN0pKgNWz174aiYMd
         aC2/8lKIu6oL7VjTT2uTv8p5uGVG6ORGw6F7+B7usMfNtG50YN/OkRXLDJnxKbLQ4y1s
         FP3MmWLtSlRKSQh6s9qeqIm8WDxMIXPv7kU0aBXmmbYOU8R/TsJiSbtaAiv/aQZyzF2O
         nA9FBmPtLMtj6uAVALCOj542fyRa9CBgsrrRj5GEuU2NFwU35B87jXUSAFq0O073By8q
         +uUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484176; x=1767088976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7VJPGTun9iAEUTgsAs5oldXV0hm6NbS8Rh/bgRh+cvE=;
        b=juP1k6PXGvdDbIeiadWlYn+8pTEGj3Oh+xNvZVdQUSdIGRXXTAFn1KVlRvwUHI/9dw
         /ctthpw0qN6uhe8ciIJC9fScaFSB0Ctl+QSQA+U7gxCt9vJOfU1cOn/T/IxqT9Nvma77
         qybfhs9gg7a2GkQAIH4ZruKdVFu53BCFNCwo5MdJkcKU8jxwv0iPleqKdJ1/zB/1ZGCy
         PqhH0VcSjCsmgvqu/AsP5Kch9iXhzkzDv3ZE84lQCknfg1itsmUqJRYalYJiIxqKaWiV
         Nud5mur9LSBZzgFqqVuMPDwu4QSUM+5XrqNYVajb/42WMndYyZ1rJu5uxFBl3MLWtePk
         uUOA==
X-Forwarded-Encrypted: i=1; AJvYcCXMJbNRn2oDNRNnhxwzdW7uvJCdONsRIPFC1ayGE0bDhMFaDGEKM8+svhlSMsCzoRAnSaOnNJkqH6Z7G/HSNJ8E@lists.infradead.org
X-Gm-Message-State: AOJu0YwpaclZY0yOEDUMxdQjDT99c4+dpu+b9bQW5KMR5P+/IKgVwCkI
	xIGjlu+M9IjRgaXW5FmBLHXIF5KGlXlsoI/paco9lpJmQagIvqGab6ojA844M70SNLTKHUhHnO9
	H+neFbKbXMZ8AwRWliWqdrTkZL0jG4qXpzNMkBEUQfiQSp4tigA1Xqfpgso2wiDl0iAdrqqyCH1
	+4yQ==
X-Gm-Gg: AY/fxX4OUxIu+L0G4RiKAS7Kv/ct+MpptY7uwSpdLSqHY0xs9ohtE3qquugtLzoyZWh
	KN+DwXLBn7QdxgjCl8Ab3AvjTp3FuEJeL6iU1byEPusIifluD9U0vnLZofc1A6IF+lDKlTZEuOK
	niMA5PLIMZmha6afhOZSGFcGllMhZGidt8raPxPfvCGaQjBpfKqsU31rir/VkcQtYdztPQ2uOSm
	MSN71AMbZkfYPN5cN4g+QFmX5XPxt1icaZfgFEzQz0lE9uaC5G2fp4vtPMb2fA0l1vsotEg4wHu
	RIrJkFIGOcQgtZyBBecB5VEw+IxeFI8+1CXXYdApplItdyCfppcxEpxC+pBS+DFBw1zljaQDqTp
	fR6uQGcV4MT+wcs0aZQeOhlHBW28bRQXHT5FlsA==
X-Received: by 2002:a05:622a:1927:b0:4e8:9920:be58 with SMTP id d75a77b69052e-4f4abbae21fmr207317981cf.0.1766484176218;
        Tue, 23 Dec 2025 02:02:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvZUZ2J6IwscWcY7RC74ES7QnMTV7pkYZ1I5E0GX9LHN3najl8MNqhxo5VDEyhUmehwO5Tzg==
X-Received: by 2002:a05:622a:1927:b0:4e8:9920:be58 with SMTP id d75a77b69052e-4f4abbae21fmr207317561cf.0.1766484175625;
        Tue, 23 Dec 2025 02:02:55 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:55 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:29 +0100
Subject: [PATCH 07/12] i2c: ali15x3: use i2c_adapter-specific printk
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-printk-helpers-v1-7-46a08306afdb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4026;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Z5y+uDYDLt8QrBK74QcxPQFJYMWolbieGXxGJWOf/Z0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmi+az3h2mjkdy8JfZt/+vwI7gUUYCdcxe1ji
 Aldb5AAaUyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpovgAKCRAFnS7L/zaE
 wwg1D/9/TgJ7+cyyriM7piIyunaQDjTvaDw+EBEL51hFHlX+lO4/jVLy2woMDI6R4fIvrXdW6ub
 Jpy8I2sZt3jMNDjOwoehDFb99d7nU9UhuOIfHRCrblhzfjt5iX1W+Qaf1pwx0BawuEPynomq6YV
 8YXynU/1S/jKFPWKtSwMhvDyUfo2IiEuj3+gmgLsn7gW5CUydnE1u2dyvJPDUz90YLOHV7/RQBg
 fDif1lvU3gfyFc+J2P/yOhXn8Kr9DkrvqIQyYJdfbes6fDpGhgG9OAIUUHhhKpTjuit3E9F9wMd
 FtxMUW3JOIdOouc90ODz/CCxB/bn3qYR+bY2vynlawaZQAFsb+nE33QJshh8AMF9esfFhUjNqQ9
 mebGDH5BMjgjuPJCLwlPneIN+MXg4aJlY2gZySYW2vtrMOreqUVOWaNaK/tECpvg7zY+wu/FNJn
 OtTNA7guV0cmbQHlOXLdjzKbklatBSK3hvb+0TUjfcli/xb2Wbpkvz1qhX4UorxXc7aW67O+Nh/
 K7+rXBRV+/VbEI22DeQ7FRSUA0shc+W1WZKDV/M7RO//k8q8g63p69ixoRUXzIqiiDjsm8oPizV
 thrGUnbGDKbK6jTyCj+ShJmpLpL9LIJ5RPRtEbMachuYbTpfqO0d0QWI58cXjGgllDLPJhR4Oxr
 OY84XabOoDPMwvA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=TOdIilla c=1 sm=1 tr=0 ts=694a68d1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=FH57a1SQlJoUzRel804A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 8RQMHi_j2Y7ctBt8cFtuZJ1ZZLdLl2Xr
X-Proofpoint-GUID: 8RQMHi_j2Y7ctBt8cFtuZJ1ZZLdLl2Xr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX4GdDIHvfdcMF
 Tid09I9qnAbyWNscH1Ict0y8pKJIVj7p6mvNEMIE3f/VqD4lLK1XClkRImOOdcPemttVH5i7hkI
 eir+sRwXRRrXAKWIStsONRxuwSFyHV+OTIq4OhXlqF58AyTYe1abRE7RcalH634BLm3f0rsGDDo
 GxZdYHNaLAbMNOnLOfeTSdQx0O+hC0ymlhbiksTYAbCJ47ATT29AjbK5B8KmaF/D2y949dW3LG4
 s1u9EOMifx7z4Rd/GKUn65Aevx+SJQBjs5ix6DewqKU6aAUUKyxZ1g1qQGbghzkgIazc8gZ69FX
 MCxKjMJ8GSsAw8ZqJuH6tdTDtCTq/y1USrmU9h+QUJQApzkeUbTxFhrp3WcroJiDuGnSWKDztnX
 c2IYLLqmsP6zuSZip2MeJuraZply8rAQFZV4XVcDDNYtmK1H+5D8RuCNn7Qzquf7RuUr7H5Zlca
 yZZ6BYR/0FFtGYL/xTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_020258_214499_369384BA 
X-CRM114-Status: GOOD (  19.63  )
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
 drivers/i2c/busses/i2c-ali15x3.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ali15x3.c b/drivers/i2c/busses/i2c-ali15x3.c
index 418d11266671e314aa2fb882ece025dc0ae998da..bd62aa8d645004bef121fa46efc1d7afc473332a 100644
--- a/drivers/i2c/busses/i2c-ali15x3.c
+++ b/drivers/i2c/busses/i2c-ali15x3.c
@@ -223,7 +223,7 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 	int result = 0;
 	int timeout = 0;
 
-	dev_dbg(&adap->dev, "Transaction (pre): STS=%02x, CNT=%02x, CMD=%02x, "
+	i2c_dbg(adap, "Transaction (pre): STS=%02x, CNT=%02x, CMD=%02x, "
 		"ADD=%02x, DAT0=%02x, DAT1=%02x\n", inb_p(SMBHSTSTS),
 		inb_p(SMBHSTCNT), inb_p(SMBHSTCMD), inb_p(SMBHSTADD),
 		inb_p(SMBHSTDAT0), inb_p(SMBHSTDAT1));
@@ -255,7 +255,7 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 	   then the BUSY bit may come back on when you try and use the chip again.
 	   If that's the case you are stuck.
 	*/
-		dev_info(&adap->dev, "Resetting entire SMB Bus to "
+		i2c_info(adap, "Resetting entire SMB Bus to "
 			"clear busy condition (%02x)\n", temp);
 		outb_p(ALI15X3_T_OUT, SMBHSTCNT);
 		temp = inb_p(SMBHSTSTS);
@@ -270,7 +270,7 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 			/* this is probably going to be correctable only by a power reset
 			   as one of the bits now appears to be stuck */
 			/* This may be a bus or device with electrical problems. */
-			dev_err(&adap->dev, "SMBus reset failed! (0x%02x) - "
+			i2c_err(adap, "SMBus reset failed! (0x%02x) - "
 				"controller or device on bus is probably hung\n",
 				temp);
 			return -EBUSY;
@@ -299,7 +299,7 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 
 	if (temp & ALI15X3_STS_TERM) {
 		result = -EIO;
-		dev_dbg(&adap->dev, "Error: Failed bus transaction\n");
+		i2c_dbg(adap, "Error: Failed bus transaction\n");
 	}
 
 	/*
@@ -310,7 +310,7 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 	*/
 	if (temp & ALI15X3_STS_COLL) {
 		result = -ENXIO;
-		dev_dbg(&adap->dev,
+		i2c_dbg(adap,
 			"Error: no response or bus collision ADD=%02x\n",
 			inb_p(SMBHSTADD));
 	}
@@ -318,9 +318,9 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 	/* haven't ever seen this */
 	if (temp & ALI15X3_STS_DEV) {
 		result = -EIO;
-		dev_err(&adap->dev, "Error: device error\n");
+		i2c_err(adap, "Error: device error\n");
 	}
-	dev_dbg(&adap->dev, "Transaction (post): STS=%02x, CNT=%02x, CMD=%02x, "
+	i2c_dbg(adap, "Transaction (post): STS=%02x, CNT=%02x, CMD=%02x, "
 		"ADD=%02x, DAT0=%02x, DAT1=%02x\n", inb_p(SMBHSTSTS),
 		inb_p(SMBHSTCNT), inb_p(SMBHSTCMD), inb_p(SMBHSTADD),
 		inb_p(SMBHSTDAT0), inb_p(SMBHSTDAT1));
@@ -347,7 +347,7 @@ static s32 ali15x3_access(struct i2c_adapter * adap, u16 addr,
 		temp = inb_p(SMBHSTSTS);
 	}
 	if (timeout >= MAX_TIMEOUT) {
-		dev_err(&adap->dev, "Idle wait Timeout! STS=0x%02x\n", temp);
+		i2c_err(adap, "Idle wait Timeout! STS=0x%02x\n", temp);
 	}
 
 	switch (size) {
@@ -404,7 +404,7 @@ static s32 ali15x3_access(struct i2c_adapter * adap, u16 addr,
 		size = ALI15X3_BLOCK_DATA;
 		break;
 	default:
-		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_warn(adap, "Unsupported transaction %d\n", size);
 		return -EOPNOTSUPP;
 	}
 
@@ -437,7 +437,7 @@ static s32 ali15x3_access(struct i2c_adapter * adap, u16 addr,
 		outb_p(inb_p(SMBHSTCNT) | ALI15X3_BLOCK_CLR, SMBHSTCNT);
 		for (i = 1; i <= data->block[0]; i++) {
 			data->block[i] = inb_p(SMBBLKDAT);
-			dev_dbg(&adap->dev, "Blk: len=%d, i=%d, data=%02x\n",
+			i2c_dbg(adap, "Blk: len=%d, i=%d, data=%02x\n",
 				len, i, data->block[i]);
 		}
 		break;

-- 
2.47.3


