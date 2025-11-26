Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E5FD1118E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 18:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FjvE1QVe4B70hH5JXm46ugN5jOKun3TXkUk7Wnimmm4=; b=GXrR3H/tD6M4LXwI+ddNHvazUH
	WG1tdhi2kp4DGHwRWuDGfSjoEyndgQsTJaHVWUQTHAnxU4t2xg0UlGmYWA0ON7vKn2oa1YLnvmNz7
	daLVu9tbNNM4IrusVOtC9Ij2TwdGOygu0OEDgj2Fn2GnvzU5dCyOwCXCI8/8ZLzXgX9aKtU6SX0lT
	p/DwhXO7XIUbJbaH81NwpYd4X32C3/boCIzn6GiO62ezBmVojxOgnN6S5Wn973JXUCBULG0V8TpYM
	/8XkibL4B6YXYmk+GS++hY+SGX2WeSwR5mQQpXeAhUVDoWW3MNl1CRr9ycqtHCM/O8mOx02eU/YPr
	B75BT4TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOK5g-0000000FUQB-0q0h;
	Wed, 26 Nov 2025 18:18:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOK5e-0000000FUPl-0ZAi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 18:18:07 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQEVc1C2355325
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 18:18:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FjvE1QVe4B70hH5JXm46ug
	N5jOKun3TXkUk7Wnimmm4=; b=iCSDkEmoT1qNsJmCQMDSIhagJAqWWD5s39018a
	0A7OwlVQU84OQDF1jsFuf/0858LxwvQJguxl45ND9K6bzrh8tU2loOm4JpW4pTwz
	PXqROKu83zqW1uQdtiaeC9/3PQUNtjbet6n8viq4O8KD9upovy8arKTY4jLUqs/p
	MUFY4+4rsfjq7pmgIC+alsvrjKhXOKe0U4hoZT1emjO3lVO7nNHMIl+YKHg28euX
	eBl1VwwVIL6B1bk1ADAdVRrodGWIA1hHIXXNpZTMZZWoglVqwLygt5opxL1v3B11
	qqyXSKEDLY5smUB9yTjLMHt4O0jHzaKmGvgHl+XNpQxjDnJA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap3d1gpqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 18:18:04 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4530ea23ce6so46116b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 10:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764181084; x=1764785884; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FjvE1QVe4B70hH5JXm46ugN5jOKun3TXkUk7Wnimmm4=;
        b=SnbXddjbN4E41CKxhAARe5RdJtGR47eMc4Pn0hkBJX+xLacbxlz9t97a2g+QwDyUIP
         PAGLBhgPh6iO9wQqNGXxEOqK+f1oYJHlOulDsrSOBMXDyrTWQmpJioew2kzXB58l8n/z
         D5Yxcvp6prlFCFn+7qcED/mjm+lBZItV2ETR1MXCciUCItNLhyuNeOtY2n1D1gkGkhTB
         n/vDAhs+2vmwE3sn1mV5nZl7KoMl5olKt8+mEcbAAL8umVmm2aT6iivPWTqrq8ehHk4r
         H93ZhvRsVcGI9XvXeGuRQlUfWtZTO3MdyQjKV2cBGD9ZGotUo8vzujcqXK9eFmM6Hea1
         uCDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764181084; x=1764785884;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FjvE1QVe4B70hH5JXm46ugN5jOKun3TXkUk7Wnimmm4=;
        b=UARRmNpi7TkD9ia/XS+1m7Mado1cIDDw1nsG2gSZY715Ymp5rh1/0Ll+GufI4LWEvR
         ekWOoJEtdpKn/yv4Qyss9+CpRvQcj3KxoMJeGS/F9ksOxQP5IbBTa0SrLVkVm978Dmvb
         ZtIj3xWAXLvXapDFmd5baarJsbFcx6tVA1JMADjh51grStedQv4iP4ae7rJhwBwSP+L1
         eGxgjYRohBIJyEqSBwt1lvQEaB1xeLso2V4alKwdVHkicIjszZLqdrdQfW7E/wROgTFL
         KvpJWmEHoym/VY2lA7dzxOyIlc+Tu4DnlN1Yl/xOi5hXcRqoZ/+kctD5IUFNqLoqWSaI
         1ZAg==
X-Forwarded-Encrypted: i=1; AJvYcCX2ah6jrFo/VOrwZcPqqciCw40r+dp1WeAbWDdQ+kjq4h1ny8bnXWUkB5apxz1O5YvfBahlvXvx5RtZ2UiBxnLx@lists.infradead.org
X-Gm-Message-State: AOJu0YwVd35xmoVjZNpaHY64t64M3yXIcfGSFRDh3lY3YNUyO7LtNb28
	Uoj/p2RKTXchaVnN1zPmkTLKAv1PgisC5LjZogFrNrAKeqdUBD304oh6zoetUewWCrtfLHdwhyI
	ttTZEHTUEIX2KKO/JyM16pQS+JsYr2kOlpTL2A3g7kWWcQjPe4MMtWx7XlR7L3VUT+jdoiofZrW
	0UpA5fF4BeWg==
X-Gm-Gg: ASbGncsMF8Wfhv1NqpXT+vNk0yFUwudhvJoJEBvm1Ewwn//6tyWCD9n8yu2ipdS2cLu
	nNCXAVfcqu6Yz8VtrrXTmjertN1bgJcgYJQ3dIOpO1O72J2Dm/KEUq8CBFJfLAhUqKFmWDMBMAE
	chvhcjM7EeanzLVwBzFeiZiRj73T6lKThqjHG+/LnXrT24U71+AcXl9NTX2QexMPadbPtdfvbwi
	RcIlvlanHakeQn0biZLulxT8Hvx0ac6Y4gEAVNnpk+Q8jy9Dh7WWc5WJsgOwvIQkm4zOwuvMN5r
	X7Itf55XIbV0Ggc+Y43/UnJJpAlztUOctPIhupJlPfJtCbPxhad7bElsNFZfKztKM4yFQIbW4B/
	xptsNkg1nM+8cgVSgjur4dLHvtCLq3UkawpxNMawTS1e1/5HLrf8I/hXhASpMKcUUTOCNvdk+Es
	0+h8tdhG3t
X-Received: by 2002:a05:6808:308e:b0:450:ccc6:4113 with SMTP id 5614622812f47-4514e8281f2mr2907172b6e.52.1764181083811;
        Wed, 26 Nov 2025 10:18:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFyJ7GZfQ5RBalSjAIZ9s+ljkr7kRm1dEQQmUqaqiOTlTQTkbbuG9K+OBFVc4gyQVx1g3UeMQ==
X-Received: by 2002:a05:6808:308e:b0:450:ccc6:4113 with SMTP id 5614622812f47-4514e8281f2mr2907158b6e.52.1764181083451;
        Wed, 26 Nov 2025 10:18:03 -0800 (PST)
Received: from [192.168.86.59] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-450ffe2f361sm5808793b6e.1.2025.11.26.10.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 10:18:02 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 12:17:59 -0600
Subject: [PATCH] remoteproc: st: Fix indexing of memory-regions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-st-remoteproc-double-index-v1-1-3b0a8b21ac18@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFZEJ2kC/x3MQQqDMBBG4avIrDtgBq20VyldGPO3HbCJTFQE8
 e4Glx883k4Zpsj0rHYyrJo1xQJ3q2j49fEL1lBMUkvrnNw5z2z4pxmTpYFDWvxYmhiwsTx6QVO
 ja7ynMpgMH92u+et9HCcQ2o7UbAAAAA==
X-Change-ID: 20251126-st-remoteproc-double-index-29a2e40e74bb
To: Patrice Chotard <patrice.chotard@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Rob Herring (Arm)" <robh@kernel.org>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1384;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=FlVT79U32eh9Ed0tVqgvLmllW1Asj4LeuQZ8YD/p+z0=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpJ0RaAe1gOeUAMJQzhtgvPouCIxLwvnlXFN3r3
 Z4jlJ2K6ImJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaSdEWhUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcXp1xAA1ITwAZyje8voPinrhyoRPx3khozCtQ+vQPX1M8B
 EmTov0pk/HxsY+xxbQ9QTxBrVLmYaYrn/nhDxmOX82tcjZ59X8DENna/mUmvLvSXfJahmpHBBlF
 sCX8S4jcJu/8j57W//lVze5WHzqetCh0q3sKWBdDqHaFQG5T5WH+prM1AgxIMws0jj5XABdN0rN
 Cdt9t9baTg+sUrp+8A8v7FtNxmKNLl7E3gj3+B+0pmzAYrJiWPF+Ct6OKzkjVl0c7pJlHb7glcb
 wvbvljIvJUFJcHX3c9whZcDVHm/Lm2ZBhptDd88ZqCRCmR+4V9y2Qr10mpKfQyeLuepecL0VPQp
 b4j7wrg3Rov7abU6p6Cr3w2Phy10fd8dvs6xk64CP37mpHlRJeg4ETLqciUaXEZvR6SOZ/QFhqR
 Uh33sA2iYqHa/i7XS7xlqTP+ZTrDwlBF/abvb6drQc+6y99ShJAk8wehmnIFS5mcSq9yvwvYZ+i
 c4qRxhndB36zCKVV+waOqF060LU39LZJOinA0oanT2nZgEd1UK+a+O/8/RxlD4Cd1DK4NqnjrOd
 4PZPZdYW7qPLkAI/eZS794VNt0K/1YvXrBRSRlk2YRNe9R6yxX9fvuIfaTAaPuccIZfmp6ULFLP
 T7G2OCvRZb2okPc1FCVkfnBPk14dy+9jUESx3PftE8uY=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: Dj9wua9sYSKOeBHTD8d5pAg3R8p6WoUe
X-Authority-Analysis: v=2.4 cv=MIVtWcZl c=1 sm=1 tr=0 ts=6927445c cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=3V6DW-BavOlE3HfrtgQA:9
 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-ORIG-GUID: Dj9wua9sYSKOeBHTD8d5pAg3R8p6WoUe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE0OSBTYWx0ZWRfX9YaIdwyntOK7
 vkJ74GvPoJY8dPJPRSIBGxDSVXTupEToRFUrDVRaIm3xhKgrGw+BFJVnhlYzMWsiFTzEsJbmC+F
 gBuUjUx1iKFvmYamSSs+yUXqlvkhUDkcYN5WlzlwkOxGku+4dZ3/uX027X4B2yS+p5FhTq2WQPC
 1ylRoczA8uw/qwBKLl5aQ7aZqNMzuSL7KUdS7eV+ceytQ6Fi1EwaLFD7ASZiMkpdTEsF20hvyPd
 r0WkcjU1t826+dxgq2JCdMikr+SmISQoL27xQO4ZpQ2UmqBTSfNWPeZGYBEzhFPSkrUKf5CN0OG
 UUUEH0fc9PLikJDtD6tKeYjEUvXslQaoesbd7cN4a/gYuLzYFO1npcUGyV+JFBsHU+epiernRpB
 2jzSWjjQXDq7/l6PNdCPg4yBklIgNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1011
 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_101806_349274_CDDC7AAD 
X-CRM114-Status: GOOD (  14.15  )
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

The recent transition to use of_reserved_mem_region_to_resource()
changes the while loop to a for loop, but the increment of the "index"
variable was left behind at the end of the loop, as highlighted by the
following error/warning:

  error: variable 'index' is incremented both in the loop header and in the loop body [-Werror,-Wfor-loop-analysis]

Drop the extra increment to avoid skipping over every other
memory-region in the loop.

Fixes: 67a7bc7f0358 ("remoteproc: Use of_reserved_mem_region_* functions for "memory-region"")
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/remoteproc/st_remoteproc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
index 747bbe7f6f7c6be160f4f6a0202eb8df20dc5bc9..a07edf7217d21a3f08d26592e8a14814608507f8 100644
--- a/drivers/remoteproc/st_remoteproc.c
+++ b/drivers/remoteproc/st_remoteproc.c
@@ -155,7 +155,6 @@ static int st_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
 			return -ENOMEM;
 
 		rproc_add_carveout(rproc, mem);
-		index++;
 	}
 
 	return rproc_elf_load_rsc_table(rproc, fw);

---
base-commit: 663d0d1af3faefe673cabf4b6b077149a87ad71f
change-id: 20251126-st-remoteproc-double-index-29a2e40e74bb

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


