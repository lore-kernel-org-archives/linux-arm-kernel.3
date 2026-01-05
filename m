Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF1EC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 14:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FqozQF9M5zlw+9sgUgeqaaoOc0kHvJsMdTuoFXpVzqw=; b=RnTNUR0c+fW+HEdOriWmQeIypE
	btmoaG5n2f/d8LTcb4Ck6vgDfARhklyyaxupJ6+XmZJM04hR55F206qXWjrNtp9uyHYNFP2L5Dk/3
	G3n/FkF+SVbXfwXwZa9Z1fRsirmZpfI5bJfetvX2wYnxw4OuKpTGSE/qa+oX9e3b4m5HqvifvHzI8
	OshJY9YguDQ6U7zROUzJvrb0jPJDGIq+SdrvopSLVF482mvmrcCauZelG1GRvOBGEHxQHc6ILIiz9
	1Kcix9n1Y1Yp9bDlLWrZqSs8TncqCIC+Xzq7UVBN3wO80AnXTplWPRW4tywCpPCCFzm+ZsiVuX1Vs
	+IXAUmFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vclhp-0000000BYG0-3gO9;
	Mon, 05 Jan 2026 14:37:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vclho-0000000BYEo-10cw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 14:37:13 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058516O978642
	for <linux-arm-kernel@lists.infradead.org>; Mon, 5 Jan 2026 14:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FqozQF9M5zl
	w+9sgUgeqaaoOc0kHvJsMdTuoFXpVzqw=; b=hT+urKRWB2PgUU+9W9m2vd67RTD
	G5sZqtP03NPU8xe2O4uRbZbmhxuHsqrSqoO4sOtbmof6cVwcdbna8bnnm/z1BVhD
	lx3PFkOboTzXIUxtR2FJI/aYVujyVeca0KB8rPvN/UzG9j+zgDpTb+/huL0YiHOW
	qNT17fnob5oFSsL9MWzcLvwShr2r94b9UygBl2ZaHHtEj/PHWGeSzE/CxlDJ2Ucv
	PkrR8TQ4xvJ7q2jW79Pqc8ng03Aohpm+r7bPxoRHzvhSDoK5rwo74bAT+G9oR/Eb
	X6K3EuaI9FbQwldOaTCAf1J8yaZt6OjvdJgT4AKdLI65wJAWErdwj6QsOsQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg9fth1vn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 14:37:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee0488e746so51578861cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 06:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767623830; x=1768228630; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FqozQF9M5zlw+9sgUgeqaaoOc0kHvJsMdTuoFXpVzqw=;
        b=cr81UeoLrDC6SSXp5xuMgwRxSUlcDzixwG+Xu+fBEttW9RIE8j/r9T+85iAqePwq8w
         n5MXashokwxys5HWt9LV2P6+lko8xbNcgqQ8D0JLg26yyAoyCtcZsGncDa7cqrd492vc
         bsqbD6iuD9B69sed1gfMeWIA8ZO+gK2DDrKXzY6Cy8drxtgbHpbsTr7TNO+5cuIAxD/k
         0iKYDHgx9AONA7OdUVBzapnXVTbqfm+qqxCJNm9OuyxWIwTpsr/4oOPVBpcjSfYsPRj+
         luC4MvB1p6xyFvU+T15IlBes53J3wPevGPe4oUz5s8nL097Ug+O5APlfWAoy2+BiC3+r
         SnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767623830; x=1768228630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FqozQF9M5zlw+9sgUgeqaaoOc0kHvJsMdTuoFXpVzqw=;
        b=t6dZdikBZIUD0h6OAX0e+6tmKme/c3b7KCeqflnq1YLsn/L/IGWl2wyz0OFRKQnZt4
         zrUdlE7iOkOyORapFNWQVLpAmbTf32mvVZdtT9u6mhG+x01sVyaXGllHiRLoUj7OGF/9
         9MrPjFsKDKHvV3ylekoF+yMr2VuGFovMlDYwkRqCefiAsJ5VbMKj1AgjH9QPVfZDLpuu
         1YaDXJPkJBMw6kEg72nkOSR0usLku8EmF4Inp8yob+sYVIb6taiUskEi5NqjlAzAAe2E
         7IBKotGf8y47mC0SwgvoiZwaAUAk48TqNjVeT2Dg5MMyXKcEbKqWOVknATgJJ6e1KHeh
         F12w==
X-Forwarded-Encrypted: i=1; AJvYcCUSNtvWnFT/hTqjHhfizSnbA1aR8YxM4Lz9hQWC5pkp/+Vvf1ORMWWs2/JK5WBHIXvrKvhghqfszGBiy4wZvUkr@lists.infradead.org
X-Gm-Message-State: AOJu0YzPT6nZqK7YzrO8N2S+C92Ks8Q/S5EHgZ3WOQ03Bzo/1lzX/rwG
	Y8zR05t6aQ5hy5Pm+pn3ETttPCBR05Wc85oThI7RRsxuiOQz/B8qcz8+oJs1LEboxKeSwPiWOh0
	bMjIjjxCTwhxEkgR4bh/Mh3m1KH0oNhWSOvW+9/dw79cFXO/+nG0rukcHSSiCECudNrAnpx0EhP
	wmrQ==
X-Gm-Gg: AY/fxX42EI7uzR6qpusPH9b4rbDoxuvsRCzcRcP4RlXz6GDLdnVpSngplHCM8XOL8nq
	6Y4+qDB2GK2wMrZh7Pd7ZkIhsFPd/r0Bt5hZ2NH8mOli9D+BeiV0x7tbPt+98J/907nyFVx6Vsx
	YJNT/1VndmtwTUcTml17nb1K2eNp8qwedarVZ2F0Z1GE8IXLt9LXpcJ04I2MExkqlsUgEOPJhfO
	pZyW38S93TqvpstVl6gPxvQTIBXxb6vvIbGxMgb+FLFq1bGqTZDnPjxERQlX6YR1VhSbAwDD8as
	gMbdA7Y1EO3vELh7fmYVJd9qe8mRrwxAnG+1fn2x2PrSHHVQl44sZhfF9iyhbv5R4v7BP6GdJD8
	B82EyWvjOhab7OaWGPRQmwFxWAA==
X-Received: by 2002:a05:622a:40f:b0:4ed:a2dc:9e51 with SMTP id d75a77b69052e-4ff46b05e66mr102381851cf.21.1767623830066;
        Mon, 05 Jan 2026 06:37:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJjWpZc2AHE030Ob1/BCoZ7+aZaco3pbYM4/m1iVzjjWTRyFsEiy5jveuZbG4ytMZcGxbzzQ==
X-Received: by 2002:a05:622a:40f:b0:4ed:a2dc:9e51 with SMTP id d75a77b69052e-4ff46b05e66mr102381391cf.21.1767623829493;
        Mon, 05 Jan 2026 06:37:09 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b84267ba062sm2914066b.71.2026.01.05.06.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 06:37:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v2 3/3] bus: stm32_firewall: Use scoped allocation to simplify cleanup
Date: Mon,  5 Jan 2026 15:37:00 +0100
Message-ID: <20260105143657.383621-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260105143657.383621-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260105143657.383621-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1644; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=JhtX/Jw0mKrE2rMCEG9hntzTYqIHi3SC7k8hVDUxXa4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW8yL/ba+hyOLq3Ya9b+2xC+hXQ9RLMEHV4Owj
 9LZU+4DabqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVvMiwAKCRDBN2bmhouD
 19uQD/0R9t/Sz6ycv5D28YQM7k6kABPNb9FjMVhuv7gGXPQ4VAxA/B8iZYtX6lCjaK5+BmF7d3h
 XrhlhtmK0HD5CAhdhNV7Ri2RixOpNXk9dNw6zAFog8FlcPZahMzIo4QT+wOlutTEWCdPK+W86bp
 1UerkQ74pVYKEjaB4gSO/gMFeSM1h4Jrmfa9aa7K6nTOOWXbSHC68m276IQ/1WLn0XdSVJGVrC0
 444dSX/teYoO8GFUN21SWIiDDBWNcRCIQ4aj1HnrNevjTnGqbnmqeRaeHHUpEghce6MIj/iC8Hu
 vzzsJAtynI6xDOe70/tFWbWQb3Evys3t6FNrvULVI/O8oDkYDjRZhdEOtTROmU8jwKPnK2RvQud
 jx7/I8N2RLRNMER/xIJ10OzPK8H4FpVqt16VYDalGUw55n19QNNYIXmHfu7ACFeM/iQ9jH/DHnX
 wy6LWfNqyQpzYCEWz3GFwPXcJTJqlIVRwxYaGVoESUIV30WD9XCvBq06DtsPD8oP3Hzi69LdrRw
 Ul+s9RgHzpF6liooHeDaHDZs4UeZpPnUdvwy28g+JWQ2k5RYM5nFaULfDXGXE5g5TOXtGqIUfkQ
 crp990mGt6mkGXi1r57MEGhLM3qnRkeDVBL3vn04sKrF+WFcjV4zrVQ90FkttV8V/r5Z/LWmSvg VEecn/h3toCBUdA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pnop-Kj0pIIDjvT4E2MTtCXEoaqfeUk9
X-Authority-Analysis: v=2.4 cv=GboaXAXL c=1 sm=1 tr=0 ts=695bcc96 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8 a=vwHuHT9Ri9izzjm89PkA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: pnop-Kj0pIIDjvT4E2MTtCXEoaqfeUk9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEyOCBTYWx0ZWRfXzqexKRj3ivtu
 QotVdGT/TwBK2ssJiFOissIav/upfN8svUpWkiLtx29X2YW05Tw6TGy0Ek/3HVwI3zwc27APXWH
 01yPo5fZh2l5bs1oAcmSQ34ob0FY3Ne5MquNoB1KAKx9AyMEQH98s99vq66aa8pS58+R1rGpImy
 MtIe4oMnF0dKZLqpuBsyQhtH9oC+iF4XfYkiOMpnwPmLm5oeLmvHBnlUM4MGdxQ4QUTivO/j7dm
 UUJ0M0MDRbl8oIKB6yTQ/7e1weUbRvflRlCutvq6tgtK/nLbXV9S0pIqLt4XdVAyvQBlb3FcDtV
 wBedp9Yb0H8EMFdySP6H21NRV7HV1PfWff9nHNLU7ru3L+JsbpIEZt/Cf6+LTxkhNamIFtWJtR2
 6gAMJs/Bk8NTyMVL85ndVrJnkTolHhpLUA4sGj6tUefgw5ijBRKQm4LFObm8+dPPGtEJrnthocE
 efp6w5OPatdkXKRfokw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_063712_396075_05977E64 
X-CRM114-Status: GOOD (  17.14  )
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

Allocate the memory with scoped/cleanup.h to reduce error handling and
make the code a bit simpler.

Suggested-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. New patch
---
 drivers/bus/stm32_firewall.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
index fae881cea9a0..92414a4c7bb1 100644
--- a/drivers/bus/stm32_firewall.c
+++ b/drivers/bus/stm32_firewall.c
@@ -240,7 +240,6 @@ EXPORT_SYMBOL_GPL(stm32_firewall_controller_unregister);
 
 int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_controller)
 {
-	struct stm32_firewall *firewalls;
 	struct device *parent;
 	unsigned int i;
 	int len;
@@ -257,15 +256,14 @@ int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_contr
 		if (len <= 0)
 			return -EINVAL;
 
-		firewalls = kcalloc(len, sizeof(*firewalls), GFP_KERNEL);
+		struct stm32_firewall *firewalls __free(kfree) =
+			kcalloc(len, sizeof(*firewalls), GFP_KERNEL);
 		if (!firewalls)
 			return -ENOMEM;
 
 		err = stm32_firewall_get_firewall(child, firewalls, (unsigned int)len);
-		if (err) {
-			kfree(firewalls);
+		if (err)
 			return err;
-		}
 
 		for (i = 0; i < len; i++) {
 			if (firewall_controller->grant_access(firewall_controller,
@@ -279,8 +277,6 @@ int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_contr
 					child->full_name);
 			}
 		}
-
-		kfree(firewalls);
 	}
 
 	return 0;
-- 
2.51.0


