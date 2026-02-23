Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 719BEE98E06
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bxUZab8aMhubY0N1zDEDqUt6vuYQLsqiJEVvXqBNr/Y=; b=u8Stg8BmlRGnUHXm82oUbEI7FO
	ot8yzYBwV7swJZitIkW22N6Ez68kX29Z0YeZuwoW2pWt6A8YoPRV8Pjo3ev1xhUrx63LbD0lML/Kp
	MS0I5UNsdkBK+UtxLE6hEZI7fkIv5sT7nDyV7PB+2SIYd3TZmQj0y0FIPr1c6NhdlogmbUWW+pGHC
	/milzqxMtzxEoQNNLjwuzXLlPunFstu6sHPjVkbukRPU7wD8U7L23zgS1btaB73Vh4+u+VCM+c0ga
	BToKwXxXIQLSl+DFr3vaMMORmVnnpH7zmOWAoUtqieDQaIH2/GrKICFszO/2PeBGc7fmlZ/JIZjF4
	ZAOGsx9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRnP-0000000HSE4-2E4K;
	Mon, 23 Feb 2026 09:00:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRnL-0000000HSBZ-0Ilc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 09:00:00 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMt6tf2001244
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 08:59:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bxUZab8aMhubY0N1zDEDqUt6vuYQLsqiJEVvXqBNr/Y=; b=hINeg6LE6NcTI4Ft
	rDmNwKGoUYDv0OLRpTbAcXmLs7YG3fwHy5C6TLgOWGmbUDcQOIdDNMZ8LMbFrx+K
	a/mGVE29+issiAEDumJZ+18H+qFyr8JpvRoHzfiBsmoHGkcqGpeTv9+2KfXvY8ev
	WKLf3G4rXue8CHf/xi6EMzdVcm24ed5OE1gIyUlz5c4h1NO6/B2er7AK5q41G/yB
	C1GV/tJu5f//GI1GOFCp7Fvrbw2Q1u2WBxs7NzZgxqeZ3/VPU+vZV/Ub/dKGmw9p
	YEK6QlzF/gSQaCndppVGGBQKWYVjLhxKJf2KBBT6di86iEhMRMbv9OWH3NZVQFkA
	2vtzGA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wav2b1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 08:59:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb0595def4so5265759585a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 00:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837198; x=1772441998; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bxUZab8aMhubY0N1zDEDqUt6vuYQLsqiJEVvXqBNr/Y=;
        b=jUpIq4KJaSa6oHreunq2SJHlS4oNJLEgr7/WhMAToj3r+ii95D9kTWeS+UgO8S5hbA
         LxPS6u8eSgEEisJPRWq+bgxTyre+8rgFMZddKusgIXXQ5UXGCqhGIzpSFS0OhXezOsFM
         sRgOfv45VLAXqp5+eL24/ZhKvgyJkaeXL4b/FY1ZTkPQHAqeHIx2orKjZH+0fvCoRFtg
         RDm14Iwsy7euEzDiVh5jg21TCQhF3Qs1KnGX7Oz/KZqhU9GHRz3Y2sAQI9h56eDKEM9q
         I85LpCcMzrevgPy8EPgCnXvspVTb/ofNW5mq1qh+5zqko8fy+fSim6C1m26UodhpZ8A5
         eMPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837198; x=1772441998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bxUZab8aMhubY0N1zDEDqUt6vuYQLsqiJEVvXqBNr/Y=;
        b=ZXVqxHpwQjVCaomuKXAjM9pV4Ge20gT3LLY7hrwN5MvINKfQz3SA4WB1LiPijyKv0j
         6WO3UCAzBOTP2klAR1u5jexTMCHRZKVMBN9EmzrJtA/nbUXG7NEF0kfsEb2J0m+euQcE
         nvgeF7hp4SUpsrfXkBIiXBvnFeCRYF4V03+WqIVlMhv7blUORKIz9KyZ+h9MV/5TqPt9
         hlLFQoOcJXRgA+3ztZzn8ZTFCP+7MVgNuVqNWk7x93+RY3uq2Xehv/dAKEJh8SnNiMWR
         SxTX7dZEsF4ZG2nV5aQca7BXDTpnHlbRKgZh+9KhjykFZlHnOrptFa7oiuwCzJmIzfbi
         woCg==
X-Forwarded-Encrypted: i=1; AJvYcCVWF9kX1K/+/3BK9aF2AdkjqZ8U7bH3XekMSXF7kf85HsofiaNd3H8fSleCLPmME7TT9rHUE7mhMX0zYFDsXZDm@lists.infradead.org
X-Gm-Message-State: AOJu0YwrCUOGnYAJ1sR3hq2sX9jrLCBOp2++PayHMzrYudnPnkrt//ZQ
	+LRvIJZ4f3OTw1alIQLhSxU8esfY4oh3F9MulxRwQom+Q324f2slFvFkhESj/u/2RxskADunv83
	1jZnRnQswH0rCN493dHjLnCepKbwRAuxayxXpEgWv4j5pP7r3dKcV64naudFqT+yCOkMf0dq7Y/
	dcQA==
X-Gm-Gg: AZuq6aIEechRq1l9nNDM8h2K/yYsRq6u1d9L9Ugc8mdSrPQli4P1UX3QFqhAb6aM0Yz
	1e7WxRoAvZUnbKtoUQhupuJnOsR8a0TzrC6g0In0ryVDSSdYNgwqQ/xUm9hkut6InUck+dH8EX+
	m6pYPJTiowji2ZQnluK0TZJfsg+vaMhOSP7Uv+KmzWJdRb0NFDlNtHx+ePhhREriZlKPKpYEazv
	6S2TWUoAn7cSbMVmLIRwrLYpTKive+OLhKRn+arfK6pPuv6QNYX0mwH7S9t0nK27bl5Ju9APgdG
	wqKAlfYGgkafdmRQoqyFe2lcFplPxVyiyTL8UW7m8QdqGIC+FRw3VEz8dr5hBhA2Lr6nAZMFXG6
	L1YbEH2W9YfZbSFo/KuQnSUYA1y3CHvI4JPkVHbz8ohnULik4yY1h
X-Received: by 2002:a05:620a:480e:b0:8cb:df8:e86c with SMTP id af79cd13be357-8cb7bfc91a4mr1729667385a.26.1771837197562;
        Mon, 23 Feb 2026 00:59:57 -0800 (PST)
X-Received: by 2002:a05:620a:480e:b0:8cb:df8:e86c with SMTP id af79cd13be357-8cb7bfc91a4mr1729664085a.26.1771837197127;
        Mon, 23 Feb 2026 00:59:57 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.00.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 00:59:56 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:30 +0100
Subject: [PATCH v2 01/13] media: saa7134: rename i2c_dbg() to
 saa7134_i2c_dbg()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-printk-helpers-v2-1-13b2a97762af@oss.qualcomm.com>
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
In-Reply-To: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
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
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
        Bartosz Golaszewski <brgl@kernel.org>, linux-media@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4322;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YqeGgXpqldMF8HxKB3uKGoGgFOzgL8+ZDrJlc8jiAJc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBb8OHlHHDWBSO8ZFzntsN3xbV7ZeexU+rxfg
 feCDFo3zIuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwW/AAKCRAFnS7L/zaE
 w3SRD/9kRjMgv00rIPHPHM9uZeGcfzBrrOW3e2CjD/Ba6V/M4ZeVfvzifGy9uG7Vo/bj4qrB5Eh
 vRIG6Ao9+a27vcLckM9zoaEffZgVxG8fjAntZaP7dxUhuj1kZpbOzuTQUFdstBpoJEQi3qx4s8t
 DVAvP9ZAZuPi5nyhg8sMTkXtV7OU1arFsbqNo5TJysZEiYHPwJRhTDK0pNzaApbkb7c4FUOLPhZ
 pYac4xlu0gK26Mf838V0KKmAZfkEFFb/MVFPWp51PKH+wP3pALiK1F+A/hN1PbkdVRDlsP2865t
 qfJzYUOuUzhyA3R1so7E6axACC311B1Ll1LGcU9uyUgtREDMDIhbKDN1cM9kcE6Df8Ki/FRgKf2
 5Bjboe7TjXXo/Kkjlx5I/HGCQrZjt4NkXOv1HNF3MhUfbZdymKm6xY4OYBTH7/a6SGguwuwL6bq
 bsUVAFIId7KTsCgpdVqxHHkHgzwHz+PQ3cyeNUDuhp1HCp82oAPOfRPLn3pAFFBpzog1PolQn4U
 fZ+UcPxnqCDy5uscllfkBC9sgnHoVrtcDtV1MjdlWQg2SZgc9ws3/oRzapN+w6NcQYHbRZ7rcrP
 taQSy/k5L9uCdRHDWd1dUOtlH8kkAanoWkUICVRJcSEonJfZRA/pCuZu6B9qVyReTmNnMMymi5D
 84Ah+S6uwmFMyAQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=KJVXzVFo c=1 sm=1 tr=0 ts=699c170e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=LDBv8-xUAAAA:8
 a=EUspDBNiAAAA:8 a=dK0ov3_ljch-J7--2m4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=DZeXCJrVpAJBw65Qk4Ds:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfX+umc0lmMZvkU
 t1W2R/7OeR1syLYLSsxyWKXMWt/9Ct4v6cx5Tfl/Exq8k/VoRfKFBkv0zMnN6RdEbMsDRXckDGH
 A3E4Bspy5nhzmUNe/x/vq4VXsa3y7GQslsbWwm+9BO633+ylTuNZYkCimaPwaM1UIYstCzT8Nuf
 VBZYoN9B8Av7MgHRmDwFvOVUsrzxlvquXe20ClkwyDXtgdBM/6Xp/dtGXuduUFFdekdJBbiAIec
 LoHMQxL1HlYEpHv6jPwcagALrGPLUlW2t4FJ6OFYX7A/Y9lrINmFcKrvSfubBpSTInWHtF711lw
 /ae7rnQc716sJ4boKjxIucjDWu0IlzNoM18gwt3qMGFAPi1FwpyqObX/q/YAtxVY3NDq7XJH2kD
 H8Iwv9UMia+7ZcIPaZkdEu3f1Muhq/zAlWd4rA8KYDHlzzRTM12cL/EuWWj9827wEDxGLOBpuYT
 JyCIJJqMi3i+cTi1vcg==
X-Proofpoint-ORIG-GUID: uXRXkXGdgTQYCgGkxnLM-QG6_9r12Joz
X-Proofpoint-GUID: uXRXkXGdgTQYCgGkxnLM-QG6_9r12Joz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_005959_126747_80896DC4 
X-CRM114-Status: GOOD (  16.36  )
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

Ahead of introducing I2C-adapter-specific printk() helpers, preemptively
avoid a conflict with the upcoming i2c_dbg() and rename the local macro
in the saa7134 driver to saa7134_i2c_dbg().

Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/media/pci/saa7134/saa7134-i2c.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/media/pci/saa7134/saa7134-i2c.c b/drivers/media/pci/saa7134/saa7134-i2c.c
index 04e85765373ecc0f0759eba539c20bcdc9716ca8..1164e91cbb7b7f5250dc02bc086f5cc06ea8f5a5 100644
--- a/drivers/media/pci/saa7134/saa7134-i2c.c
+++ b/drivers/media/pci/saa7134/saa7134-i2c.c
@@ -28,7 +28,7 @@ static unsigned int i2c_scan;
 module_param(i2c_scan, int, 0444);
 MODULE_PARM_DESC(i2c_scan,"scan i2c bus at insmod time");
 
-#define i2c_dbg(level, fmt, arg...) do { \
+#define saa7134_i2c_dbg(level, fmt, arg...) do { \
 	if (i2c_debug == level) \
 		printk(KERN_DEBUG pr_fmt("i2c: " fmt), ## arg); \
 	} while (0)
@@ -84,20 +84,20 @@ static inline enum i2c_status i2c_get_status(struct saa7134_dev *dev)
 	enum i2c_status status;
 
 	status = saa_readb(SAA7134_I2C_ATTR_STATUS) & 0x0f;
-	i2c_dbg(2, "i2c stat <= %s\n", str_i2c_status[status]);
+	saa7134_i2c_dbg(2, "i2c stat <= %s\n", str_i2c_status[status]);
 	return status;
 }
 
 static inline void i2c_set_status(struct saa7134_dev *dev,
 				  enum i2c_status status)
 {
-	i2c_dbg(2, "i2c stat => %s\n", str_i2c_status[status]);
+	saa7134_i2c_dbg(2, "i2c stat => %s\n", str_i2c_status[status]);
 	saa_andorb(SAA7134_I2C_ATTR_STATUS,0x0f,status);
 }
 
 static inline void i2c_set_attr(struct saa7134_dev *dev, enum i2c_attr attr)
 {
-	i2c_dbg(2, "i2c attr => %s\n", str_i2c_attr[attr]);
+	saa7134_i2c_dbg(2, "i2c attr => %s\n", str_i2c_attr[attr]);
 	saa_andorb(SAA7134_I2C_ATTR_STATUS,0xc0,attr << 6);
 }
 
@@ -160,7 +160,7 @@ static int i2c_reset(struct saa7134_dev *dev)
 	enum i2c_status status;
 	int count;
 
-	i2c_dbg(2, "i2c reset\n");
+	saa7134_i2c_dbg(2, "i2c reset\n");
 	status = i2c_get_status(dev);
 	if (!i2c_is_error(status))
 		return true;
@@ -198,7 +198,7 @@ static inline int i2c_send_byte(struct saa7134_dev *dev,
 //	dword |= 0x40 << 16;  /* 400 kHz */
 	dword |= 0xf0 << 24;
 	saa_writel(SAA7134_I2C_ATTR_STATUS >> 2, dword);
-	i2c_dbg(2, "i2c data => 0x%x\n", data);
+	saa7134_i2c_dbg(2, "i2c data => 0x%x\n", data);
 
 	if (!i2c_is_busy_wait(dev))
 		return -EIO;
@@ -220,7 +220,7 @@ static inline int i2c_recv_byte(struct saa7134_dev *dev)
 	if (i2c_is_error(status))
 		return -EIO;
 	data = saa_readb(SAA7134_I2C_DATA);
-	i2c_dbg(2, "i2c data <= 0x%x\n", data);
+	saa7134_i2c_dbg(2, "i2c data <= 0x%x\n", data);
 	return data;
 }
 
@@ -237,12 +237,12 @@ static int saa7134_i2c_xfer(struct i2c_adapter *i2c_adap,
 		if (!i2c_reset(dev))
 			return -EIO;
 
-	i2c_dbg(2, "start xfer\n");
-	i2c_dbg(1, "i2c xfer:");
+	saa7134_i2c_dbg(2, "start xfer\n");
+	saa7134_i2c_dbg(1, "i2c xfer:");
 	for (i = 0; i < num; i++) {
 		if (!(msgs[i].flags & I2C_M_NOSTART) || 0 == i) {
 			/* send address */
-			i2c_dbg(2, "send address\n");
+			saa7134_i2c_dbg(2, "send address\n");
 			addr  = msgs[i].addr << 1;
 			if (msgs[i].flags & I2C_M_RD)
 				addr |= 1;
@@ -265,7 +265,7 @@ static int saa7134_i2c_xfer(struct i2c_adapter *i2c_adap,
 		}
 		if (msgs[i].flags & I2C_M_RD) {
 			/* read bytes */
-			i2c_dbg(2, "read bytes\n");
+			saa7134_i2c_dbg(2, "read bytes\n");
 			for (byte = 0; byte < msgs[i].len; byte++) {
 				i2c_cont(1, " =");
 				rc = i2c_recv_byte(dev);
@@ -286,7 +286,7 @@ static int saa7134_i2c_xfer(struct i2c_adapter *i2c_adap,
 			}
 		} else {
 			/* write bytes */
-			i2c_dbg(2, "write bytes\n");
+			saa7134_i2c_dbg(2, "write bytes\n");
 			for (byte = 0; byte < msgs[i].len; byte++) {
 				data = msgs[i].buf[byte];
 				i2c_cont(1, " %02x", data);
@@ -296,7 +296,7 @@ static int saa7134_i2c_xfer(struct i2c_adapter *i2c_adap,
 			}
 		}
 	}
-	i2c_dbg(2, "xfer done\n");
+	saa7134_i2c_dbg(2, "xfer done\n");
 	i2c_cont(1, " >");
 	i2c_set_attr(dev,STOP);
 	rc = -EIO;

-- 
2.47.3


