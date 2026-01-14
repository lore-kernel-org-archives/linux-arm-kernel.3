Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD14D37E3E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 15:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mv0nQD2Fz+xmN887PWY6S7g+L/xnSZWABnal0geai9Y=; b=DdHiSeVL0R/WMPZmy9gnKVyfFz
	wY7lxqqkc+CY5PqD2Mj1EWJ0csbVyPX4UwtHMa8nVXd3bB9KWrwrubjiwsjKzLGXwT4N2qWq1JLb/
	b+g8Tywm5cFqpj7pV//1jdvvJB/3sSPyNr4fDPsMrBP76qFv+I/WcHUxbfxRz6pAtF++Ge52zDDHy
	W/vmUVZJJrDznXEwEGF+q3vkPi2uNHRCSq4i923JN3p1UugGs0oAolEEVh7Lzk+91Cvkz5KAUa0b9
	8QuXn2TSdOdWi80k7I1lwbRlbaQtBQNUbgrJcI9XuJUwAfNc//zN3sGLtsxbA8+AtKaan2kjbKGpE
	+g27liJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg2pi-00000009hYT-3Hhr;
	Wed, 14 Jan 2026 15:30:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg2pK-00000009hH7-0ZP1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 15:30:33 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EChV9p3925445
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 15:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mv0nQD2Fz+xmN887PWY6S7g+L/xnSZWABnal0geai9Y=; b=Ja6yf+55fHq9cr9+
	3BmQxbt5bpN7SHtBWVenCY2tSp/rN7yEiuQCqdkiBXi67+06a/9pLEqUAeXLTdNc
	a1grs8LrblCreo1vw7SXp2xl5M9w4EIMROi0sTqscq5x2HqimEYP+t9LG7NSfIN0
	oW0mJSmKZfsrffOl10LCS9I+c68oIPg6PMdbu9NWlAbfYeIljtZ5LwgkSSYHwo0I
	3JOnKWXYOoVsAlspcsRJg5tELpY5u/wJniUo+jZfwG6wj8mYx63YcXGrOMDwboK7
	SOhO1+6gPKgS8ghvVXEQWk1ZVwZqbf1Hap0Q/5oJrgreJR5QtLCL1pFJaKpiTSIP
	2G8J/Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbdbrh8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 15:30:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52fd4cca2so247834585a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 07:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768404628; x=1769009428; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mv0nQD2Fz+xmN887PWY6S7g+L/xnSZWABnal0geai9Y=;
        b=iCSNs7xWUCaCFcdukRNGt3yYCjLu/w0BVRmAbqBGgKaao/SEosct8p6z1bGrixNFWt
         5O75UAyliEmufduaOKf0pKzCyb7Z1kMcDVHB2AwZ6XDGv88GDI8LXjCiL0DMIYWIyUKM
         I7Lu4mAP0TAGsNQ+vuDRRc/yYuFfH+gj9qEc7STIcYANNUu5FCNMnCoiYFs+wXhi3OxK
         evbOCu3VeqAZ8M7hDeiRv+72mKGCC8tR/PBv5uUh64HtIMl/7/lUWRkG9i5D8rIslBik
         GvYze1RRgLUspER0FauB0m/QmBsJDDRppKzjmv0+gXTvnNyC8aPcCQXf/ut0GI0/dn7I
         6u8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768404628; x=1769009428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Mv0nQD2Fz+xmN887PWY6S7g+L/xnSZWABnal0geai9Y=;
        b=gm9CsCI1mxf0dsGI0or4oAEkp270WGmpTgd8wZ+fFqFEwhUtwkusteqpI7sdiE3MBv
         b9O0MFbzIU4+P3soIZCIDYwoRTty5uX2KMuVsah5dMg5TlYSB+uVyFFTXLP49prB+Y3B
         Se24DmbrgZ0bkugZ+/XgdAx6T6DMXGBp4FvyCvA35QGc8dIFAnq7Vszb1RMYhUasBqCa
         0qyftSD3Ix/a4OJKchaEI2hq9HzVhL2HMC4JiQwmT5utxaHOg7LjE0v1zbh/NEeDx4FA
         OstetEibCIy4ZP1SwhZxWdOD7hUQIds1hKHrhQIAQ7VWTLpy/+E278T172HFNOmQi7jD
         5DxA==
X-Forwarded-Encrypted: i=1; AJvYcCU1SqVsdSg4ACWfKIO2w4/tcKFHPqvcbCeOxJ/JYCdSQhFMCM94iu5b0E4MK0RK2xsqESunQ0AExmiK9bvANcQ6@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp/9mvyTfrjekScRwUBtqUqCGnAUlULlwUGt6WrhPi0WQ3fXhv
	HdTG9aO0+FkDU6WlJsGONnuosT05BI3D8qt35W0lqS6BqIdMeU27olpiYc9TFhJQ2P/QRl2VSQr
	QrVTzFNsFJUgm6l7ELhWrOXKym+1cZqh4Fg+tw6t8IYwxeWu4ZkEvN5PpIfwuQG+aSfgjtjYWz2
	v2Vfoa14RpqQ==
X-Gm-Gg: AY/fxX6ggipJpRhtftCCTBhnN4bj+8/JqQcZiq2n350azUfg0m1R2qjdgf6IvTnWOE2
	QSkGlhTeWY0bxxJ1EuksI3EkDRUV81MFtfJl7vrnUDzTI7no7/aoh8iDvoLw1hoFrUyLjnIYd8X
	q7vNg6y3UxvmqHf6LgzplZcRnE2WazvU19UDvyabDf5xjbNQjGT5VonmIOD8x9V4WIQ4Loy2JPH
	LZxTaxbc5wV+6lnyjVW2qnGZfaTXLiCsl7u65AnShUF/TWerhh+0w9fQ0eUivjQAxdTPQ97CJv8
	dr8SFA14IrVGnz/wl3PrDCb9w50AAVXHs5Nc8UxjSDPlhW0S7eh8ShkConBUMA0E9j8uDa6snUn
	avgY3LFZ4DH9LWr1wW3W6TO6YBPaCalVChA==
X-Received: by 2002:a05:620a:4443:b0:8c5:2dbc:6244 with SMTP id af79cd13be357-8c52fbcf013mr422897685a.47.1768404628285;
        Wed, 14 Jan 2026 07:30:28 -0800 (PST)
X-Received: by 2002:a05:620a:4443:b0:8c5:2dbc:6244 with SMTP id af79cd13be357-8c52fbcf013mr422891285a.47.1768404627841;
        Wed, 14 Jan 2026 07:30:27 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf667fcsm22812989a12.29.2026.01.14.07.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:30:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 16:30:05 +0100
Subject: [PATCH 04/11] pinctrl: amd: Cleanup header includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-pinctrl-cleanup-guard-v1-4-a14572685cd3@oss.qualcomm.com>
References: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
In-Reply-To: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
        Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Hal Feng <hal.feng@starfivetech.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=775;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=KS2A41254/IzptP8+yKUiwH8wnfKT/gY+cirH/V2Wao=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpZ7aDV+noj7ZcYLzGFw85urth6DKCl65+zERGB
 6whzCjLMW2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWe2gwAKCRDBN2bmhouD
 13ELD/9w2SYmYalYA5vFc6Rf1PTVYZ4B1dYRonz1b2DQNyOu2VbPve8mcP3qP5S8Lunlmu9pnM9
 XxA6ShVzZzR8X9u1+aHI18FkeFftaZO1X/ipHiRgWYmwxHee50F43GoRYkUKtL5EeGs+pgVFtvS
 N35v5ZOaS4dRcJ97oRggrrqF3+rewugdNfcOjABy9z+5McTb/al3fNFk7obz1H3xjL77Jo3RQcb
 jKwvKaJYn+puhraiSHisoI1Q8H0GnWywr6Yq12zvOzY10VAU828u15UF1rvvfdSZBMNoDaZN8YR
 MY/C4aYFC0Y84PtJu62kmJ4n4v4JBd/PrIYVnOSEvIoAZkqMo4it79WoNtuEoNx+OhSQ0P0+FTw
 ncPMJVQ0RwPTjUhmgU+Siqc1uuFokQOIgc8sWxA187rXXifisB8e0Qz8cofr4vT2YdFLTDQlTtb
 DsVJhtQvL20afD8ktEE3e9SBn/kC2U5XBha9yUQiLszF7/SkefUvWkoLphBJoHJQesPlcSGwLES
 8ZjODkLNTik+YIzT+y6r9oBPDa+Ft1z/sPRZtZpjZCeGeSqLeOkBl2iH5kgzmgSjGANsVseb/1k
 xn+gb1RtR8rDo4/67L+lt6mr4ki4euFWZMFfg8c6VM8c7ZQonmBPCX9sGdbGnfFG3z8Loh8tgWe
 NlXvgC6SiJVTR6A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=NvncssdJ c=1 sm=1 tr=0 ts=6967b695 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=tMXyHTyi87mTYQFNLaMA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: tULlHhfKzjJgO2ZIZf1Hy9NDT1bKALHI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEzMCBTYWx0ZWRfXzceGaFbqfMhI
 jpzjE2HJ4OKZc1zcPTuyxD16oNU9QYhk5F+LM70F3xAXPUHvaUyHRfUsMWLEB027H5qAO25L1LZ
 tz1SsSwi5n1glpMQX+95YJn2cbTtG/cBOPLWUjAbQ4f69aN2hkTgrgukrKL8MJ61sYIdM8ysNx0
 mixV2Akl2RgyqQu8swGCt6ZXbo9bSBeXKYhCtb7L6dbcCqz3aV12ya4wbtBSPuY0j2jrLN8qax9
 dtBCjpWeLRjeaa7L8KlLZr15kMna2cU8DgYMMYkfy2svN1p2p3ORjyze3xG99/bn3h/hWUN5F6h
 4pU7N/zJ6l09SFF1eTvFWtZGCJ+HH/E3wm9MQokFEtz5CK6xNNGOsx2NlLUrBoP6vENrEpaBo3R
 KngEFaFYbHTlT6dIo7Q3pqh/gI/CDZ311fpwaS8pnYh367+UCvoEcWVvXor/cMI/Op6tYhNbXhq
 1KRWjPZ0liYiIwGaBFw==
X-Proofpoint-GUID: tULlHhfKzjJgO2ZIZf1Hy9NDT1bKALHI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_04,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_073030_305940_0370F864 
X-CRM114-Status: GOOD (  12.74  )
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

Remove unused includes: no lists and mutexes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/pinctrl-amd.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 2dac5c71eb00..2af94ef56434 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -21,11 +21,9 @@
 #include <linux/gpio/driver.h>
 #include <linux/slab.h>
 #include <linux/platform_device.h>
-#include <linux/mutex.h>
 #include <linux/acpi.h>
 #include <linux/seq_file.h>
 #include <linux/interrupt.h>
-#include <linux/list.h>
 #include <linux/bitops.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinconf-generic.h>

-- 
2.51.0


