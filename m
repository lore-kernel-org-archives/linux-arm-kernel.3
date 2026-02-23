Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5F2E98E06
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ebs4592ZeGx4XEtowa9rtUzeO9XIr9Cws6MAkd96cvY=; b=P21djaUtmMDXHDenXQdIN+Xpcz
	yTeWAFMr8XQuXRBTJlUxIu0u5Yx4Neq8EIkrMAKROCf+VLT2cFJwhIEXu2QfRCcG6F+gaPPpSB+xi
	YAhtBhGz+z1nf6Gt0P/Ea6uOKvnWuP1QJYIRLvtPvhk/laZTfsTjEmx/ISIZiPZIinumTAg23XJil
	ATXUWDcFL2IO0JA4fqQUpLK1tKfaYEem6YFbSABfr31Qo5pyP/w63VAYM+GyQCtIT0Nc0qrK+OfS5
	S2iXRwajdxNKElla4pp5HsK/OWEg8sxaYIR3BN/KCwfiJZlZADfqte7zyp/+GEyDXz+lncq4b0t3P
	6ritAYQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRoC-0000000HT2a-01o2;
	Mon, 23 Feb 2026 09:00:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRno-0000000HSbt-40No
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 09:00:31 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N8M3S0331517
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ebs4592ZeGx4XEtowa9rtUzeO9XIr9Cws6MAkd96cvY=; b=Hvr7zPTzrCaCVx85
	+pWeuCaqk3ssZ3HpkZRf+BLU90H8Q9hwgIsSRvokmoMdvCIv/lykqwqQ1tVUhCyy
	0j9tZZE0BoxwcP+klWXT7MLXWAvCJQISCVuiO9J55chWHyHkCP/XhoZp/t4M4Y/k
	dFXBM4EPtwVa+4toWGGGGue3TaXQw1RivEQLz5Ypek8SioKEBaQVoDNT44NxHmEd
	Gu4ucWk0dWMeK/rCMfday9iyQ3Zup380LIaWK1kP0+m0RkY7MWFx4+0/Mn3+ysrk
	uiFCOmnQS7JElPU6r72eSg8NF6yTiIw10k+5nXvMMcpz7zsX5//azU1OEjB8BvoF
	pHcCbA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf603m2cv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:00:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3ff05c73so4119487485a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 01:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837227; x=1772442027; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ebs4592ZeGx4XEtowa9rtUzeO9XIr9Cws6MAkd96cvY=;
        b=SYbDKnHYriF88KQfelo4XOJsuOOWLztW7PXziTPGoLPo1EOk2Ba9fZg7oaI82O2hhz
         SkZtWlgzqwUmOiBWNy82GZyLyGJt/ap7kph76XFzxYXZlCVzY0zO8yEPG5MvtGoqJmWF
         wpGtT0hil2qkg/s1Rg77NQ0HPR5C1uSrQeimPDTN74JKXFY9iGdiBrxSp6KOUtw4cwMJ
         pduvbWXPe61X7SAh5cf5yvzBxT8BkmShEA08KRZAiJFdEkLkNPKvgiQiyvVFqox1ydUF
         LOHa6iXXzpjejYcXc25qus51HVidVaVypc3E7EclLd6edOXINAAwjYZ+JD+slGSNlGVA
         3iDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837227; x=1772442027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ebs4592ZeGx4XEtowa9rtUzeO9XIr9Cws6MAkd96cvY=;
        b=Fuxuo1DSTCv43D8TI3uFslPrbgNduoH9MHY5WbpLoAqFu78vH+ICT2+os0u+L17gH4
         opiX6tnzK0soIBifGkjnm0G/kYKyNMvoJAmpCNAOI9QGff09+Y5qR3U8J7dPwNYE5bCC
         Yk0YlNbSbjLUo/3p/AWT58rACpIu1gsi440RLXMIGpGRtuRZt/xBnMvUSWRZNCSD4/yX
         nwDteP3NWyEJPQSoIQBxJK+7h9Vk4Q1Xho/HX1saafkWFISfMcwPZ93Qf1x6f6eD/Fzx
         WaVVvUw1DfR4gRtWb7odcAo7av640waYQaKMFdaFlk79GI0T0iFI6U3YchcjJ6xWQfAJ
         30dw==
X-Forwarded-Encrypted: i=1; AJvYcCXXRLfPh1XE8efRZxyDDvzwCDaL0Vz0v4p9YbPXe/TCTXE1Hvr7QEYAA0MlvkSznxuG/v+px3j/uaz0oGcepmVj@lists.infradead.org
X-Gm-Message-State: AOJu0YzVcRgx8EnN20+AlUdlv/AakE93LMkwkEu0b+kWqGOA5taTYeXT
	WtAnZMr5UhhvNqxZO2vQ5ixFSz6ZE7r21GREP+1dsLDaJt6cyZylGQpcVEBvzEeNLisR8QHvWZp
	9nIbepmeP7AgvhJaD24RM1i00hdgIUpjPiRl4qjVOmNYSa/GzXpRRBIp91Yznrxz0oajY1MWE/I
	y4uQ==
X-Gm-Gg: AZuq6aKzXJWrU0fAMEQp24WeiM/P1wuUa10EznHcQXe6dYZ33MyG6PEx6dd55K5dI9k
	pAIMlJTatZ2v7abzNH7zYCv5OzmceEMX/yogG2+gqO1xoPcugUThO2KGi0nl2d4+QwANSP8rJxC
	5T1VUhtb6m8os3SbmNQ+CTwCdtazegHlMb3iR/iXi7U2Z+jxCJlAmaWOYH/vIq33o8FuarCmMav
	N1b1wdGLAoOftE1Ci7FxIDoq6rE9c5v4+cV2yvcKFAW9AiE9ikpo/rLNvGJaHY2vZ7ZqPOXRINu
	VrKjr1Ql61neE6lnxdujHk1irKN0jLpMf7Qe9YgCbT2yF3TVexi+aahh5dJF0bI94x1XZrNKzAo
	znOtImEaiDUawZFiCbf2D+8DZlZAABJ9Lus5Fjl9JTSf8FSR+2SRW
X-Received: by 2002:a05:620a:318f:b0:8c6:b258:dff7 with SMTP id af79cd13be357-8cb8ca8962amr979348285a.72.1771837226511;
        Mon, 23 Feb 2026 01:00:26 -0800 (PST)
X-Received: by 2002:a05:620a:318f:b0:8c6:b258:dff7 with SMTP id af79cd13be357-8cb8ca8962amr979342585a.72.1771837225985;
        Mon, 23 Feb 2026 01:00:25 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.01.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:00:24 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:42 +0100
Subject: [PATCH v2 13/13] i2c: piix4: use i2c_adapter-specific printk
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-printk-helpers-v2-13-13b2a97762af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1631;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JDZZ/6aGOo6nTpfOU40qBlSpYdHiADcGwoYL6QYt5dk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBcIdZYwirJnUNOGujgI7ogwb5RBbVsRgHzZt
 6K9WXX042OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwXCAAKCRAFnS7L/zaE
 w/1fD/9C9lHh11MQDFHNS2CdDlMZobYyoli8+SLRr7N1NFuXSbJv/+h//P2hoBy0ke6yXqTJ4+L
 axzRX/jM2FO3L1ru6ZrxkjvExiROejYsY2HigPuosAHZEcMJHX50dppFDbhFtilqHuGGRbQ91rb
 UdnyjHFtSkUZAtT/ahTl9re5M8Vighq8YxQKegyiyrIfT4o5mJMMyI5gs4cv9wWuhpByp+tchBj
 n+NVrFNe4cUBw0EgzHfbabeRPa75XEGBdgCLmD/0BOT4YBwTL4BmfBt/4kazL2DiuU1ogHEDSID
 3K7NJSMh+04p0We0l2P8ZxiEn6EMBMjvh0h8wQqUrPdCEzBCNe/1dVdSthVFXYEppwL4ofSvok6
 XG9a+P6zSiBBE+B1A2+hmabACNJNMQ0AvZY4GXpDWjhOiW7QVl1HIiQEiPCyiyi30W+rVH4lspI
 8JUhkGQuwW9zYF/NzbMusTvzOqoJ0XsNGI3vHJPv0CqVQLX4m1bPZnqaf9OW+ls0gPDcrrK+oeq
 r23BCzSbMK80frsQ8dtiZGTXaAxlemajkek9awA8vE6y3aFEynS4iquHJ2E8pWSbYo4ke7/5C0d
 GD8jLMRaKsY+SoT4O7JObjMnj/9nVkONjeXiLY+x3XdOiJsoVn+/Tx1OvpSG88jXqVllU0NwSqV
 ozIxTLR3zZ0NIZg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=XbWEDY55 c=1 sm=1 tr=0 ts=699c172b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=dY4OjmsCUpDc7DjzIskA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfX8f0LVxDm1HWy
 xEKuokg6pXVg6/zCTCsYfWLZJYspyIzicBV5+P3uBmAXduUdx7YxWhRZTujO5tcnnZw0MEIyINM
 pXykpTZapP9c73yyGt/5HkDTTpD62eew1NFYlDKwab97wf+27cNMQI0VkUM1TcxbO6qNyLd52f8
 9Eu4f+LSoCkuLGDxJpizRfqCJHWnL9RxmvSfF1eCQlmE9mlRejcI0dtlpD/zMByBegc750PFiMB
 Zyhxm70+im7Ii5FrwKjCisQ8/ei6zBUiT0auhjXE3LgLiuxuOBEuket6BlT+jk4BrTdcfbeIYjS
 XsluzoOLTEe/X6Y2UE12H2Gc0/dU8dlrYOPDteggTlkJJojlJXANG6VG+n6uTjDHFcucHn+2kBJ
 tWwIU2V+EvIhUx823OLN476URjDwCAsFMjJlyUjXMUrXg8nEqRBELNNjgiBA3cZbK0UG9abEMxr
 4oUxC1XIOhh5H6SI9OQ==
X-Proofpoint-ORIG-GUID: QvrQxXj4Py08p6G_M8UHPFJZtuaW48zP
X-Proofpoint-GUID: QvrQxXj4Py08p6G_M8UHPFJZtuaW48zP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_010029_137262_733A4352 
X-CRM114-Status: GOOD (  15.17  )
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
 drivers/i2c/busses/i2c-piix4.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 7b6a4e201be4a211c3b84e57fb7d8e0adc9895b7..d7fa2fbace908d1c2de66aae152e848bd1678fb9 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -650,7 +650,7 @@ static s32 piix4_access(struct i2c_adapter * adap, u16 addr,
 		size = PIIX4_BLOCK_DATA;
 		break;
 	default:
-		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_warn(adap, "Unsupported transaction %d\n", size);
 		return -EOPNOTSUPP;
 	}
 
@@ -825,12 +825,12 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 		ret = piix4_imc_sleep();
 		switch (ret) {
 		case -EBUSY:
-			dev_warn(&adap->dev,
+			i2c_warn(adap,
 				 "IMC base address index region 0x%x already in use.\n",
 				 KERNCZ_IMC_IDX);
 			break;
 		case -ETIMEDOUT:
-			dev_warn(&adap->dev,
+			i2c_warn(adap,
 				 "Failed to communicate with the IMC.\n");
 			break;
 		default:
@@ -839,7 +839,7 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 
 		/* If IMC communication fails do not retry */
 		if (ret) {
-			dev_warn(&adap->dev,
+			i2c_warn(adap,
 				 "Continuing without IMC notification.\n");
 			adapdata->notify_imc = false;
 		}

-- 
2.47.3


