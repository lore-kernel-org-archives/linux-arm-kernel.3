Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DEF8E98E0B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P5sVG0mcxnvXNxJS76KUg1OHt3/W4mYp9VRxOR5aqLA=; b=nSA/5lA4b8yOE8LBMNvUnywfG3
	+eOs41ODeKZh6uYKE5HEHIIXvP35w1+/gK5ECi1+vpFTAL1JNWXtkJ4vqv/weP7naJXgFby3u1HKC
	U2jEPErZLRXii7D1YwgxD+hzmCOisI7tmuyv6XTfAhTa4VyaB/G9L9DPvscdnhfB7aU8KUiXxfYWi
	Q1+F9hzDybSPDekRzlWraM4maqgp5f3veSFTw/pSfWIHb9IJfbB6e566Y7XgPiFwHOuFvOzetgbEI
	i5vtz8X0RynQ8SgtliPcZtsQoTVl543dWK6+nt98kByx7zK2Z0HXjnbwX/j8m6sIARV846N0nUTfo
	VeoyzzWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRnm-0000000HSZL-240m;
	Mon, 23 Feb 2026 09:00:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRnV-0000000HSH6-4AKi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 09:00:12 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MJUhSb2396714
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:00:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P5sVG0mcxnvXNxJS76KUg1OHt3/W4mYp9VRxOR5aqLA=; b=eVF9YC7w6LwSXWPh
	KNjYpPPqoIYhzE9ED3GDU8Wv7tD8JO5zXzzjCMB83Ee3Sdy6RfVL80wjLVNCmQUB
	cXk28xdHPXoFLnBxE7K0JK9eo5rEjdHRtdVmo76v2RLhXTs3PyX+bvLi7XOtMTnB
	W69yd8Onuhn+DdiL+30cQEXYzCTAtCQdjPxaSL9zQmSDFXZec2/qELgIOV9R8kpR
	WQLH44Ki6glnjLGV0OJhMOSYVEQbcl3uLTBSGCatKoLr7QwfOZp3Q0HNCIccc12L
	Qf4yIqyl3EFogFaBi85g8nbHNz8xX8S/aAf3bbzPICu34VOFLdHIZMitjBJOx8h9
	RhmmyA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vgv2j4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:00:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb4d191ef1so590635285a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 01:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837208; x=1772442008; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P5sVG0mcxnvXNxJS76KUg1OHt3/W4mYp9VRxOR5aqLA=;
        b=W6esMwUd2nwaEHopU4hja/7M/3PINXiNNwjNus6YHvhfsZ7fmELoSt3sPudBzcG1Es
         Gf/sfrjEaP4tLhcRp12Or3QuB+1tVOhM57iSAWlgV1Gjo/S/+9fRS7e/QOA852Z05jvm
         pYBht5TpI5yEPfR9ecYaPN6vLdCtecl8I/NO6YZ4tuqhzx94VEpV6QWxbXyaUIqRyPTF
         IuOj00edMpQ4Y0ptB2x2UQv+hNHyZp7gMgXI+bYFmb+evM9a8nSHPX/IvbtqTpCsSQFq
         btQhrTR3vaqA1xLYgXdPhcmf2irQbWHPajYKtgyzodi2rBhGgGfZyVs/HwiF9FIdcDYd
         Nr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837208; x=1772442008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P5sVG0mcxnvXNxJS76KUg1OHt3/W4mYp9VRxOR5aqLA=;
        b=hoH/bRrKaoLPEhstt3pQHwjxHeYstTphdStzxMn397Z7ZdO1DJGvJp3rWa99iYVEV/
         ohEsAbggpvOAuTJw6zFMlrWeEL4CgzTuxNhC1SeCiOkIsdIMBcVUmyp/8yMSwdQpZtpU
         JVb9xeEwGG4sfO7wSGGGVLqz7S1CgxHtDenDIk9oLhovcX7Yc6QR2xH9mkph1eHqkuaJ
         z/OtUlDZ4rCmgKv5JNLB9sJMDOOfyvHQRgdhk7Tf71yCR2wpnFw/9ynqZ5l6QyZLog/w
         yn703/Y7rgRR3imWmc5X5EAEGcf+WsGrOPDDgbGDVxFVL0TYDmfiDCPE9sugdf4Q3LmQ
         3wzA==
X-Forwarded-Encrypted: i=1; AJvYcCU0o6FlD/IcdMq6uneBSLaj2jHdyK89BYNosSr+Kem40x7DvLq5rnSn3/ouYE+HYtUJUCXRQRMNcDqAakooM2cP@lists.infradead.org
X-Gm-Message-State: AOJu0Yz82J2xmH5JM+bmCJlAt3qbBAa0FbWw6nnF+dWf6exkdjlP9adH
	a/7VlFQvaHocZou38q08PPpCPKaByqXHLIsInVelW8836mHy4lZfZLCa96ikZzyCs2+RcC1SsKL
	k42mmNmVFxKmb3dCyavHJAgM0tpChIAr2VP0yU03fCWUaavWzLntwDCN0wjqrymgaNU+DKe+68W
	Y+jg==
X-Gm-Gg: AZuq6aI1EsRMWxUzHRBXXfxil8qJv9y+igmxrplXsAqGTpa5wEuaKn+/quj0g5khErC
	QOQxsOtI0f1us6MhlUJsVelekKCFgCQ7lnpfIXDtlwVI2uRdJcE+2mTxySUateujdVopPUn3FBU
	Rd58eSnNOITPF5US/i9pwWljFW0jNssv9Of4rn//6QBtZOmFyF7PfE8TVpgVyeUHk1vpBeDKqea
	RKKrNhG+13tU0vbv1/hXme/ejTBO3sZWq9Y2Cnz+dlujuVL9eUBH8VNV/ra69Zkgo7SylGtN3AH
	p3muVVy+HlyPQWr/xc9RZQa9qfeBvQGMbd+4okcXNHVGcOImnY2uMwPKhuVBlFvl/AojLaw+5V/
	yg79QzfKqkD8HAkW23d2jjOHVKbaHiPs/XjZ4H84q7TDCRI7pKgEC
X-Received: by 2002:a05:620a:2a02:b0:8b2:9fab:d7d4 with SMTP id af79cd13be357-8cb8ca65d49mr901114685a.38.1771837207912;
        Mon, 23 Feb 2026 01:00:07 -0800 (PST)
X-Received: by 2002:a05:620a:2a02:b0:8b2:9fab:d7d4 with SMTP id af79cd13be357-8cb8ca65d49mr901109985a.38.1771837207444;
        Mon, 23 Feb 2026 01:00:07 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.01.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:00:06 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:35 +0100
Subject: [PATCH v2 06/13] i2c: ali1535: use i2c_adapter-specific printk
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-printk-helpers-v2-6-13b2a97762af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4099;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zLVSyj45uG3n1RodmZmb6MT/QpzgzyTcNCdqjEgFCZk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBcC9bXEdP5Sn4fkg7K34tcVggPIty362en86
 2bK5yUtOsGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwXAgAKCRAFnS7L/zaE
 w2HnD/9dfwrfuwI9JNyaou0gpSZMKALGt6siXFCwiP5v/VMZFa/ZAbYQMnscjI5Uj0upHdGpOte
 uqv13A9Rl/BBSCZm8v/xgj3mjDQl4VjYfz5ADx5CIRpYUQ/e4ytiY3HULkih/OqsNCi1U+xFrw4
 DmmV8F+k03bMBYhCuKCFZpOpH6JhA49t+dTc92nci1Bj2KgEmD1gX8vfZDPRnc2NxfZYEyWO7Mm
 xBOidJdFnjKag2twYtSUYRqpFO010jrP7usg4Vo5UIhfQvQESVDdvHIQbjSre2JCFw8E7aJHGWF
 byVagIDoYVo5MaIy7ZYzn039rnGioGGfd64riNEyG0hD/lrhIzw2Mhwx1oRRBvWPvve4I6vVD1w
 bMOV+YKP5B9S30WS4UCFmmbg5Z6hmXmYj97F6PQcOLEcB6wt3LHMrpxAjd+PrXwFNdPrqS90dX/
 NEcWQsQhTHwZujx2SmuqLDKGnyqFG0XfZzQj8TGu7UnuuhaiFGfhnwv59lkHlilT7BQ/Uro8IiX
 aLvs0jmh6qbDD4u5dNWoK8o3PycqBlZHnhJ7q2uxdJaZkLYYs6TlXM8RXYi4NIdN9ssO0yPzC8s
 W4YoVNx+K67HNjCvGGJlxEEi3Q6cCeWmYwcMbtLleh5YVV7W/SzvJpJUr3RTY5jhFuvwa3IcUxV
 rbVtGFew+m/UCBg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfX4aXJEhhRHbqe
 lO3HaWxMg5txxEaf61wI13clIFbvUkpxfjXpn8qek2jdfOiUQ2ASGWEmHwq6UXiVC9g5LRxAP6J
 CrJqBLR+pZxlIrr4f+3YafKFGmuLL0Bck9HIDtN3ksOFLjBL8l+4jvzA5XxyeRJPZnGSYlAiQw5
 /VaNqAHn/9V25MGGQmx4d2AxV8Lp3CRE15BLMXJq9eVKtdJlSXqdmIOxwI5ehctfwQKnJEmu07V
 +K/VlHlbhXt+THhfEK4WKhR2rMgbza/QjBQJbBXmN3pDmP6UiODK92hnpS5n3867+bVJDwEQjkF
 NnTU7i8coady7sR2fX9qwZp9ic7WALyBC2TDnkjlPa0s4EIRjj9USJnBtVtwfMJFsJWg+95CcqL
 0BgLiOIHosaUeVTfGJCr/hkJ3qziIrPKdqsPDkkYwXL98dqycvSNboORikNrcqaxbK4UiM/IpJi
 QIqDTTMBcBnQpnutptw==
X-Authority-Analysis: v=2.4 cv=W+A1lBWk c=1 sm=1 tr=0 ts=699c1719 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=qeKQattCTu4iihMYEEIA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 5pXIM1yWtcSqxDhCT0faBcV2-pYNq5Ul
X-Proofpoint-ORIG-GUID: 5pXIM1yWtcSqxDhCT0faBcV2-pYNq5Ul
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_010011_130311_CF8AD848 
X-CRM114-Status: GOOD (  19.15  )
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
 drivers/i2c/busses/i2c-ali1535.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ali1535.c b/drivers/i2c/busses/i2c-ali1535.c
index 1eac358380405838d15551e353605cab0a7e5e65..bf0f36450c5930f86b122618d17eecf1782dd776 100644
--- a/drivers/i2c/busses/i2c-ali1535.c
+++ b/drivers/i2c/busses/i2c-ali1535.c
@@ -215,7 +215,7 @@ static int ali1535_transaction(struct i2c_adapter *adap)
 	int result = 0;
 	int timeout = 0;
 
-	dev_dbg(&adap->dev, "Transaction (pre): STS=%02x, TYP=%02x, "
+	i2c_dbg(adap, "Transaction (pre): STS=%02x, TYP=%02x, "
 		"CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
 		inb_p(SMBHSTSTS), inb_p(SMBHSTTYP), inb_p(SMBHSTCMD),
 		inb_p(SMBHSTADD), inb_p(SMBHSTDAT0), inb_p(SMBHSTDAT1));
@@ -245,7 +245,7 @@ static int ali1535_transaction(struct i2c_adapter *adap)
 		 * BUSY bit may come back on when you try and use the chip
 		 * again.  If that's the case you are stuck.
 		 */
-		dev_info(&adap->dev,
+		i2c_info(adap,
 			"Resetting entire SMB Bus to clear busy condition (%02x)\n",
 			temp);
 		outb_p(ALI1535_T_OUT, SMBHSTTYP);
@@ -262,7 +262,7 @@ static int ali1535_transaction(struct i2c_adapter *adap)
 			 * power reset as one of the bits now appears to be
 			 * stuck */
 			/* This may be a bus or device with electrical problems. */
-			dev_err(&adap->dev,
+			i2c_err(adap,
 				"SMBus reset failed! (0x%02x) - controller or "
 				"device on bus is probably hung\n", temp);
 			return -EBUSY;
@@ -290,7 +290,7 @@ static int ali1535_transaction(struct i2c_adapter *adap)
 
 	if (temp & ALI1535_STS_FAIL) {
 		result = -EIO;
-		dev_dbg(&adap->dev, "Error: Failed bus transaction\n");
+		i2c_dbg(adap, "Error: Failed bus transaction\n");
 	}
 
 	/* Unfortunately the ALI SMB controller maps "no response" and "bus
@@ -299,7 +299,7 @@ static int ali1535_transaction(struct i2c_adapter *adap)
 	 */
 	if (temp & ALI1535_STS_BUSERR) {
 		result = -ENXIO;
-		dev_dbg(&adap->dev,
+		i2c_dbg(adap,
 			"Error: no response or bus collision ADD=%02x\n",
 			inb_p(SMBHSTADD));
 	}
@@ -307,14 +307,14 @@ static int ali1535_transaction(struct i2c_adapter *adap)
 	/* haven't ever seen this */
 	if (temp & ALI1535_STS_DEV) {
 		result = -EIO;
-		dev_err(&adap->dev, "Error: device error\n");
+		i2c_err(adap, "Error: device error\n");
 	}
 
 	/* check to see if the "command complete" indication is set */
 	if (!(temp & ALI1535_STS_DONE))
 		result = -ETIMEDOUT;
 
-	dev_dbg(&adap->dev, "Transaction (post): STS=%02x, TYP=%02x, "
+	i2c_dbg(adap, "Transaction (post): STS=%02x, TYP=%02x, "
 		"CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
 		inb_p(SMBHSTSTS), inb_p(SMBHSTTYP), inb_p(SMBHSTCMD),
 		inb_p(SMBHSTADD), inb_p(SMBHSTDAT0), inb_p(SMBHSTDAT1));
@@ -352,7 +352,7 @@ static s32 ali1535_access(struct i2c_adapter *adap, u16 addr,
 		temp = inb_p(SMBHSTSTS);
 	}
 	if (timeout >= MAX_TIMEOUT)
-		dev_warn(&adap->dev, "Idle wait Timeout! STS=0x%02x\n", temp);
+		i2c_warn(adap, "Idle wait Timeout! STS=0x%02x\n", temp);
 
 	/* clear status register (clear-on-write) */
 	outb_p(0xFF, SMBHSTSTS);
@@ -416,7 +416,7 @@ static s32 ali1535_access(struct i2c_adapter *adap, u16 addr,
 		}
 		break;
 	default:
-		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_warn(adap, "Unsupported transaction %d\n", size);
 		result = -EOPNOTSUPP;
 		goto EXIT;
 	}
@@ -449,7 +449,7 @@ static s32 ali1535_access(struct i2c_adapter *adap, u16 addr,
 		outb_p(inb_p(SMBHSTTYP) | ALI1535_BLOCK_CLR, SMBHSTTYP);
 		for (i = 1; i <= data->block[0]; i++) {
 			data->block[i] = inb_p(SMBBLKDAT);
-			dev_dbg(&adap->dev, "Blk: len=%d, i=%d, data=%02x\n",
+			i2c_dbg(adap, "Blk: len=%d, i=%d, data=%02x\n",
 				len, i, data->block[i]);
 		}
 		break;

-- 
2.47.3


