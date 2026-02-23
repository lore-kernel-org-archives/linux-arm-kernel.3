Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA26AE98E06
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=or9DvhQwaxtsrAqBQKF2R4HMkZA0UWyOfpa2BBt7/z4=; b=Cu7dqtdqzjjGNuJ/ULWe0ssMtm
	uLqnq/e4V/i48k7jp4yaN83U3pyywhQvtzuTFNMewu4s3G0Pi3wA8A5S8AGk/CR3vTkZ4iMA2cwhh
	57jgt69UkVaRq2GcO1qrlcA2aCC4JDi+79DtKZ+SSO4Yz4RZOkCMEmPwdwV3Q64mm/5CTmXGWtNrc
	GixloW6Ptz5Hmr62dejEqWBiOReMW8wV2fPzHWz2wqjDsPqJCMHbCC7KdVT/I7fEBR8JwhqIm4aHY
	EBZ85+2L4G67vKWmDATHbzOyBIGu6OiGi1e7gsn1+afX9a//0G8fFwPFOJPYeuW5NnRqY8bWXQ77E
	e4Z6byrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRns-0000000HSiV-4Aaq;
	Mon, 23 Feb 2026 09:00:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRnk-0000000HSX1-0afK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 09:00:25 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MJvlf82146284
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	or9DvhQwaxtsrAqBQKF2R4HMkZA0UWyOfpa2BBt7/z4=; b=NwlSGsPoajg1cdlN
	7FzImz3K7gmzTZflY85WSUFFFjqKsV0yoyy9AHVsFMHPRdjvX7zEz4bKOz1FdcrY
	aXWZagVZ5ZFd2Z8FuByy3BgQuM3L4E+3cL2iEwk1Or8o4Hl3TBZvuLcAf8Al+GIP
	gbbubkB3pBEdfiIBubRvwcIdXXX+X+sHj1qa6ABgHM8t+GK0EyS9xwNLk9cg+YYw
	cqeSfSWK/1rjya1QyF89zZvbxZdJqxYN4d08FAjDFCkN4X13IOMkNcA0FbpHWbqu
	kmDGlwB+M5mfh4a539DIBSjhclF2NtGHv9PdOFxL+jQiRY0Pogby/kcckwwNoiz2
	6v0j6A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wyv1t5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:00:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb390a0c4eso1077944985a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 01:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837222; x=1772442022; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=or9DvhQwaxtsrAqBQKF2R4HMkZA0UWyOfpa2BBt7/z4=;
        b=IXMdoLqiXrs3ogfX3TspD17rf6yeh8+rybX5FBD2xvyo6E1bEyK+P03G1E+GzRohyt
         QZu4fcC9ILNis9+BrlwLQdPKA8FNEXQLs4Yb4omea8PQPlWCCt0Pv0MMJnPcrBYACpqX
         UMZLa89clCYgRBXII01q+8ewgD1tJTKFv2+ap7UyKNMSZKZLn8iKwEXU0WLTy88mptWE
         3G9ipdjqKlkj3Czgq/G55m9AcWHgKMyqGLkmR/twqbwiOpuGy1Ork6spDVxIT0WUsjFK
         iMRRtrWK+fw73x9WW7jmR+PmB0Or18r/X54FwVyHUJzv/zglZUk0qqT36Zv91RViFXkb
         lXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837222; x=1772442022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=or9DvhQwaxtsrAqBQKF2R4HMkZA0UWyOfpa2BBt7/z4=;
        b=dsKHxRX+nlVJXJP1qvOZJyHzl0kS7T+GptFMHK69wcwwKqHGCE+rkFoZ5fn91h08O9
         ODVi+1fjVhXG/oPxr4i4RdmQQZj6hLYyRPGyBzVhXF6ZJXBHP4yxRBLtZC3Ow5Mg7+Zc
         gG04sW2y1sOwq15mbGmNj0mKYbC5W6Zkp6+mLkvxBUCqmO0grMw2aZFteiwCjbMzMUK/
         BGcH794H91MtklMyq+aKt48GOTO9gQrHUyH2kFNdvmJOZbGp4W9lSbYfGO93kPtsxFaO
         RnvUDQTktbepaFZKZcgQS6aCOpdBrmqHOUEypmJRXh/aub1nEL75ZKfsytlwK4gVwuCU
         hudg==
X-Forwarded-Encrypted: i=1; AJvYcCVxY+mo+ekPCGobfQO7XSp8vsORWtZEDORy06EW6idsHQ/vrklOepbMHXHEKEhZvNMNCQMFir7IKLIN6KqL/pLt@lists.infradead.org
X-Gm-Message-State: AOJu0YxlbA9TZwXSUeCsV3qhlrGUYbsEDgRCVLAzRZiHZjr2K53SJDBC
	CN9Z53UxRbd202+7ItXUiJtZr/cB+rzckhYWmziQQ/fWBX2IpyhM4hCDcFrzP1UfsVT+1Kp47CB
	e5I3kasKkQRiLp746YsLO53Z0lIktnUvY02+Q4e1e31j+hSrhvHgE8hb20XNvTo/DRkQ7u/rkH3
	YMwQ==
X-Gm-Gg: AZuq6aKfUyi0xbiC5dM+083Kw3f+FKctFIzkVHVFDen0mqogB6p935zRtuzjDKGgjo1
	/KWw5kxMR28dAgacZ4CL5vALUAziwjhrRTXvQJZyGjpKE+7TY7qqxMnDfhdbIg2eLE6q2DzLza6
	UgRxaax9jr7b0Out69WToKtemH8RUVfdp3e4OFFi2QsaQXRHDXTcxrxUzqcMgdBc062dszR7ids
	e91P18SPibMqdhH7GTokM02yfBp5nODCQjPegZDJZbqhS9VIWAWk2tZHA24yyOwTCK9jQBwTwgt
	ZSpG5VB+fCLneGdn8HyK/YKj3/3CbVUDWUOhTU8aYQg7EgE84gib5pwqs7sRZrzWh+lhbOVga4b
	ibwNkg83hY+tz9nC84lNdW4tSkonbwvhvicJIwjuYRBEJRo1Fz5NF
X-Received: by 2002:a05:620a:4555:b0:8c9:fb26:dc6e with SMTP id af79cd13be357-8cb8ca65ae1mr991090485a.38.1771837222306;
        Mon, 23 Feb 2026 01:00:22 -0800 (PST)
X-Received: by 2002:a05:620a:4555:b0:8c9:fb26:dc6e with SMTP id af79cd13be357-8cb8ca65ae1mr991085485a.38.1771837221857;
        Mon, 23 Feb 2026 01:00:21 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.01.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:00:20 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:41 +0100
Subject: [PATCH v2 12/13] i2c: amd756: use i2c_adapter-specific printk
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-printk-helpers-v2-12-13b2a97762af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3679;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=dI851BmOduiioly8u4iYfe+Rr//GzNIkYCteXmln3Ng=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBcHDR72fg/RLmfqEfX9o8DKYkAT9RN+UOU/R
 RWoY8UXtcqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwXBwAKCRAFnS7L/zaE
 w6GID/96qWc6HzdW5LSb/XKz9++1uSGtny1zn/Y2Dov7vn78E1+wi1vBGY97PMuY3wBXAFWHPkg
 je0bVLHjsDEv+4uqAr3C4T0MelEgMHgYx+EcA/vRYlrZsDTah14vhyIVVBAgU+LH/qnqHJ9vnb/
 R07bjiuhq0RygoZggbvZxDp2/psEw1yfOq2Tv+rSH51jenKvSShvBbfDzpmXNvo1WIKFKuxObtb
 y+L/xfFlfq9tSHkwKnLFytYKBRgerLwkqFANPeuHYpPL9EXoqHjKuvAt1CJqc55EJVNzGZFkFIT
 eYid0jiEyP0q2IDoJDYUbTPpGLIDJcrrC3Tc7J9uLALV7BTKVrJjdR1lZD0FA50vtH/UdMmTlKt
 vHba0Q2n68Kl5mkhjCDGHPg02it0MuFVgFFppU2bT+u1rTNlfSu1dZpebdQ4uCu55REXTij9N8i
 v3EWewd2H6lkniqel+JvZlorsNA+W42Lpxj7xHgKVQnd5Q2nvPKVGmneLlRQfVn9fpQ/WBaxBuo
 aCNzM7qDoUqFEYSbjFfwq4Tz2MUfkkPH6kT6ZQyMiw1U8U719a0prDzVkG1x9m3lkx7W4zcsGF8
 /9P/DxDJVq94qbo2A6aa9ouqHJR7NFgwxXkhLUoE7sqoBb2GDX0+VLb4wUCGtORmHX3GC0ps1yv
 kOomrQu/puIrA4g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfXwhFAI2vJoKox
 xeoPp0S8+2MVECxvuirEyvXEoVxof8ObseIBXwl+tZgquSdErfw7U2w6xMw7AVL5FnadI87YgRF
 7O8YPkGhHKopiyCcf+ClO18XZ4+LOOcxN3fkqaSOrDgFWiX3MAz+l8xHwgqTkhnlSVLTi7ePeTG
 GK5fgBZ80eU0IIzf/FHF5YHl0mCCm3SA+fDiRsNHYCuZ1AVEfvcNisfYf38zb8F1nfu7EFnl7jY
 MROItoxgOr0MJHC2Iqcfh0nWuuvzaFtkRMjMgxXk+nZF2GQ/G7qkFX/Rak5QfWKrVH1wtmKeTAd
 tn2BWdPzworP92K6L76gvv2sEUccUTE8I8L9470Zso4aOB55lsmuf5H0D3mm09eCCXYEkqTyHYr
 5qsU19iQpCMZEroCR/JOuof5f14jLr9EKdIQC3EqKwNqkTC9I+uZuQ6jwo1ekcoM0PRm5b1rFs1
 YCezJJPypqXXXfj/4YQ==
X-Authority-Analysis: v=2.4 cv=UO/Q3Sfy c=1 sm=1 tr=0 ts=699c1727 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=IUzV_G_aAFXi5cZUTYgA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: gmoTCwMCpmc4NPGvdNKaMS1RteXNjSia
X-Proofpoint-ORIG-GUID: gmoTCwMCpmc4NPGvdNKaMS1RteXNjSia
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_010024_238229_C6977378 
X-CRM114-Status: GOOD (  16.73  )
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
 drivers/i2c/busses/i2c-amd756.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-amd756.c b/drivers/i2c/busses/i2c-amd756.c
index 3621c02f1cbabd8c5e9d8a4ae1494ada78726b15..629da0b8024b88cc4d51ea5e785147b462a1281c 100644
--- a/drivers/i2c/busses/i2c-amd756.c
+++ b/drivers/i2c/busses/i2c-amd756.c
@@ -99,14 +99,14 @@ static int amd756_transaction(struct i2c_adapter *adap)
 	int result = 0;
 	int timeout = 0;
 
-	dev_dbg(&adap->dev, "Transaction (pre): GS=%04x, GE=%04x, ADD=%04x, "
+	i2c_dbg(adap, "Transaction (pre): GS=%04x, GE=%04x, ADD=%04x, "
 		"DAT=%04x\n", inw_p(SMB_GLOBAL_STATUS),
 		inw_p(SMB_GLOBAL_ENABLE), inw_p(SMB_HOST_ADDRESS),
 		inb_p(SMB_HOST_DATA));
 
 	/* Make sure the SMBus host is ready to start transmitting */
 	if ((temp = inw_p(SMB_GLOBAL_STATUS)) & (GS_HST_STS | GS_SMB_STS)) {
-		dev_dbg(&adap->dev, "SMBus busy (%04x). Waiting...\n", temp);
+		i2c_dbg(adap, "SMBus busy (%04x). Waiting...\n", temp);
 		do {
 			msleep(1);
 			temp = inw_p(SMB_GLOBAL_STATUS);
@@ -114,7 +114,7 @@ static int amd756_transaction(struct i2c_adapter *adap)
 		         (timeout++ < MAX_TIMEOUT));
 		/* If the SMBus is still busy, we give up */
 		if (timeout > MAX_TIMEOUT) {
-			dev_dbg(&adap->dev, "Busy wait timeout (%04x)\n", temp);
+			i2c_dbg(adap, "Busy wait timeout (%04x)\n", temp);
 			goto abort;
 		}
 		timeout = 0;
@@ -131,38 +131,38 @@ static int amd756_transaction(struct i2c_adapter *adap)
 
 	/* If the SMBus is still busy, we give up */
 	if (timeout > MAX_TIMEOUT) {
-		dev_dbg(&adap->dev, "Completion timeout!\n");
+		i2c_dbg(adap, "Completion timeout!\n");
 		goto abort;
 	}
 
 	if (temp & GS_PRERR_STS) {
 		result = -ENXIO;
-		dev_dbg(&adap->dev, "SMBus Protocol error (no response)!\n");
+		i2c_dbg(adap, "SMBus Protocol error (no response)!\n");
 	}
 
 	if (temp & GS_COL_STS) {
 		result = -EIO;
-		dev_warn(&adap->dev, "SMBus collision!\n");
+		i2c_warn(adap, "SMBus collision!\n");
 	}
 
 	if (temp & GS_TO_STS) {
 		result = -ETIMEDOUT;
-		dev_dbg(&adap->dev, "SMBus protocol timeout!\n");
+		i2c_dbg(adap, "SMBus protocol timeout!\n");
 	}
 
 	if (temp & GS_HCYC_STS)
-		dev_dbg(&adap->dev, "SMBus protocol success!\n");
+		i2c_dbg(adap, "SMBus protocol success!\n");
 
 	outw_p(GS_CLEAR_STS, SMB_GLOBAL_STATUS);
 
 #ifdef DEBUG
 	if (((temp = inw_p(SMB_GLOBAL_STATUS)) & GS_CLEAR_STS) != 0x00) {
-		dev_dbg(&adap->dev,
+		i2c_dbg(adap,
 			"Failed reset at end of transaction (%04x)\n", temp);
 	}
 #endif
 
-	dev_dbg(&adap->dev,
+	i2c_dbg(adap,
 		"Transaction (post): GS=%04x, GE=%04x, ADD=%04x, DAT=%04x\n",
 		inw_p(SMB_GLOBAL_STATUS), inw_p(SMB_GLOBAL_ENABLE),
 		inw_p(SMB_HOST_ADDRESS), inb_p(SMB_HOST_DATA));
@@ -170,7 +170,7 @@ static int amd756_transaction(struct i2c_adapter *adap)
 	return result;
 
  abort:
-	dev_warn(&adap->dev, "Sending abort\n");
+	i2c_warn(adap, "Sending abort\n");
 	outw_p(inw(SMB_GLOBAL_ENABLE) | GE_ABORT, SMB_GLOBAL_ENABLE);
 	msleep(100);
 	outw_p(GS_CLEAR_STS, SMB_GLOBAL_STATUS);
@@ -233,7 +233,7 @@ static s32 amd756_access(struct i2c_adapter * adap, u16 addr,
 		size = AMD756_BLOCK_DATA;
 		break;
 	default:
-		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_warn(adap, "Unsupported transaction %d\n", size);
 		return -EOPNOTSUPP;
 	}
 

-- 
2.47.3


