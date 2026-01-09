Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B345D26D6F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 16:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TVJbv/lv1mJxKEXbFe7HFa6qKPqOIW0YhqRLM00SXEM=; b=Q+h/xmBj4Jn0SDUVW+2m7/q1FW
	8kfn/Kuf9Z3i8N+k0QirxYzQS2hihOf9HrZ7sHJVCtoYI32CcD186Qb7mc6lFKAuguIi7T7aKzmn7
	Ff0MW9ATrmJTmr3hkeK8gz9Oc88mNTenSgva91RH8kDCHsctS5kPCk37Hur2CxpxZseqfvlME2ZHS
	J05KM9W1x1ft27dSDiSjAVeS5RWz6DiGYQD0u8mHGEh1oGFknO8eshtdAUTyx34SOWCmilNBpPksQ
	r3bIUDhYDcAdb48wqCr6ljw3P8MA637GrLPpZSX4uBQQHExxZyVO/kcFCW2LQagoupJaM5d9UGJp2
	GhEMifNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFoh-00000002fan-0lQQ;
	Fri, 09 Jan 2026 16:58:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFof-00000002fXV-0DnS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 16:58:26 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609CUCQL3542137
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 Jan 2026 16:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TVJbv/lv1mJxKEXbFe7HFa6qKPqOIW0YhqRLM00SXEM=; b=WlU1ri0iWmc40W41
	+yFJU0QbrSHlE9jWu8kujGIrwwbbXrxSuxPJvlKoj4NLiTOV2oZW9z+gNP+bdo0z
	m5XaQaz5fjNVAgWZDl1r38AjfaskEol+fOVBSBzrpztFHxQvABY8wW/D9KE8D34Z
	L751B/4CXiVvG7hC4/HAj8Rhp0jtR8djYUIAPYp+nSgnzLDiPi6ci+JGsrka/xqY
	oCJfPg+fNMaY/UJeC7YNrlirdQOmRq+V4ozFVCnNVq0UrcI/+QHcM0nS2jp3VDXT
	ZF9mJOzt80HwMaB9sBjYkqB0Q2IHLkFNFfLKMNu+/mksmHa+T2Pzh8oVnKzrPN8h
	HmBI2A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bju6b2117-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 16:58:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2217a9c60so1015971285a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 08:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767977903; x=1768582703; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TVJbv/lv1mJxKEXbFe7HFa6qKPqOIW0YhqRLM00SXEM=;
        b=RY0et2lGomGQRqjlBAkb481pAyszO+o0Nr4vxBOuIF71OEeTbrznK+QfV8WEQjtqr9
         Ic6qdcDPjCRug3QKf7ECFduUBahuATTCxSdjIfW2+1SDJKFfrkU50hps25yJu+NoloXL
         gQDS7MIFfs+hhlmZk58uNxZgcsV3K9XAIGZrVMNejMfSvVbFQSEl5ofj90LXXUqx4qwD
         o55Tr5pTomH8NIxNxIfchj/Ec5zXGO5iXF1qmm0OQL7yZK/cJNreTcDTpWIK5d4xWbRf
         iQcusJ66OEGXRMl66g/XXzHw7iTguyLYXQ62PqlGlWhIdqgHSmzwWdoB2upQWaedkIoP
         Kqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767977903; x=1768582703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TVJbv/lv1mJxKEXbFe7HFa6qKPqOIW0YhqRLM00SXEM=;
        b=bvKn5/XnrU599XEHKKj7Xqk7X2lWNfPYN0swlrZiV9BlluuFjupoIPZ2ayuaK9zwKp
         NtuH4xhz/x5vt5+ascuiVBDBAma5A1GcCaVkvxPExeq+uppywUi1aNPLWmnbTnoP8V7/
         Avu1b1V1m6G/jdMIQtKyIX7Bod4GD3kQ0CTDdkTh50O5dAQumogxvJlJ7cYO124W5zd7
         Wj48BghZKSt6zePp85y+th7sNNBMJLDmh3N65Qbmhm9L01JxgVElVsJK2VyZu84mIN2V
         JiAOgJACOFNxPYieRxR547JaEMMqYvKGhiryBU0oTvsLjw4/C4kZQ8sEkXruau4VNvNm
         /SDA==
X-Forwarded-Encrypted: i=1; AJvYcCX50zR2UvDUCyFgimlUvFK3Yc/1IkeE5FeyDACy8D/cCbnLR0miOGmbO7lVPo7Ry+K5hEUzmmzcvXnoSmBB9EUM@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0r93D/VME0w5BnSXwAm8YBD/E8V++/zAnZmagR8FSJ8FjTik+
	wpLdqRZZuY4YiDqsf2KwMNwT5jmIW+u0zEN3Pms7Yh6NjVLXqzde19Zni5vWQLt4cHcZgefz2P7
	5w9D3I9NtxN/XV9F+uCuCttePQtpSV0zJm/BwPYg56JeCHe4R7iQvvljYrkDZbgBAZ24MfJGEnR
	cQ6Q==
X-Gm-Gg: AY/fxX5tTN902992HMR+gbi4C+60bNhMWAHzJ7XA8bgjW6VfVtCnBAvZrrVxkIc+q5w
	vrrWqZeCiACEJeMXCHGZjU1uorMArLVk0NCmT9iCZEw0AzVw+KumpxUC/zFz7jtJXk9nCSrsNWJ
	YlisAHwuCkLy4Byuhm4f666hjGBm3XCQnaBKTgobC8fW2kUBtqQXxcPa029EZfT/VM1JNQuSb99
	D9MaMdmNAra4qTWbQKsTJSidPkNVTi7q/OnvWvALYBhxOFgfE44ZdTt9x8iPB/E4Ph6bPPAhNDq
	NsNj2/Yg0bBI6iioHZLiHnmH28cWO5Ex/SgKif9477JEA36UcG0s9MPzJXPuMoN4j5HrNc9Vh9R
	XYI5XkxYZz9dkzD5E/fyjiIeTn/CxgLcnUg==
X-Received: by 2002:a05:620a:4802:b0:8c3:7e09:7305 with SMTP id af79cd13be357-8c38936be22mr1435183285a.8.1767977903019;
        Fri, 09 Jan 2026 08:58:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErA4IpVIsA+Sdg4ABihyyJ8f7uZZY3fgBUgwNKuKAzxhY6GZ6Dv7hnyicoT9YujsNjruLj4w==
X-Received: by 2002:a05:620a:4802:b0:8c3:7e09:7305 with SMTP id af79cd13be357-8c38936be22mr1435179185a.8.1767977902519;
        Fri, 09 Jan 2026 08:58:22 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm23231784f8f.31.2026.01.09.08.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:58:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 17:57:50 +0100
Subject: [PATCH v3 06/12] cdx: Simplify with scoped for each OF child loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-of-for-each-compatible-scoped-v3-6-c22fa2c0749a@oss.qualcomm.com>
References: <20260109-of-for-each-compatible-scoped-v3-0-c22fa2c0749a@oss.qualcomm.com>
In-Reply-To: <20260109-of-for-each-compatible-scoped-v3-0-c22fa2c0749a@oss.qualcomm.com>
To: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1064;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=etPrXIm2DbWPr0yBMZ1LGq97W5bne6RQqRx/65G5X9g=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGlhM5Wh01oE3KlsXi1oRCb1ebqBEOJW+lH8G7ztv7v1zkNrv
 okCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJpYTOVAAoJEME3ZuaGi4PXv7kP/0jb
 +sneulwBx9dx7PbHub3lGdRzucikXzqpPxwEBwTD8oy+DEhmYBPmN2ELBeXlAV3yA3zxNQQeGgn
 gILtucbXtK+pd9MWYsXD9goHh2aokAQ1WKdq5rqv/BKQNKuWEWHj9nALLxrreu5MIM3CyLMf/75
 FZju/PldbhUYIWNLuBBHvnNQ7UWekhFoc9T3b+lsQsWD3S5/DJpI2+gs6QXftE+GN9ErHHSdmYx
 Jfbit39mvSJR2hPlcjjrNsC5E1Hd2234AHzcPAW64PlZi5fA+olx6o3egjYa7uZRatAuTiyToqc
 E35inBibatbJ2okonvpTmFUtduRaklEFtfQykDNxVGtRDK2At+jQuhhTwV2TsugiT7oDpNyq3do
 zHE4yS1kkwZ162UlE2nRducX6NDZDHPcy/3s9iOEMmy1HhmD1Pb+8YINH5eunx1E7VMLTU7r9w4
 7asY/VydT6D8OwPxVQn9nmPh3xmDXHXJBUQ4YaehsS/R4j8iymLOhai/woh76AgK/9VdxYfiFF6
 d81EpawWPRTxMOQPszdEkiBnuRWHfqwxU/HQUOBZwHbrv5HnuRjKnUEIgJOE1EN3HHIQV/n9dvR
 eOh8jyDFMajmozTKQ5EZFxCbS7N1/3OvjHbC/qFpL64WXCTvwIdZN8wQEA6KgdM4j9M459dGsGx
 vQ+6n
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEyOCBTYWx0ZWRfXw9Ns2Dy4q99+
 ReYWw7ZFVUDZ87vdBwr4Zze+iuxQtcQBnhn6W1XJ6ogYpzgHztjoWtUwaETQrkk3HKSjMuT1xP8
 d578HoMsHDfMjHqePZr4hAMny5uuCh0dgDYD8WA56IJ7eYurCKZ0Mw1DKxCcjRDQMsE/jlqC1SG
 hWAYF6k71pXG/56eWDyejsAoaT7rFev53ZPUchei4cW4mcxvLomXfKYmDFPDn7MdUr8sPw+6NBy
 4OIbRFF8OiwtoGkQQuv0tejL7ksx8fJqUg8rZScWRzAK/AVjIE2yGb6Lu+LsipkS4Y7+3e0ae3T
 g4kezGx2fBka/+eHILET4NPLef+cMgVr540G+4yCe3j4JCaikWKmISUy3SXzirFE3w9Qi37Vjzr
 wzNJpblvaV/fmAL1KuWWPdO9BFwQmnRI3EPqLa57D44Bcjnvt0iUYC/5Hy3Pr6Njt4FlVTqOlD+
 wJi4A7U3/jGEqr77qlQ==
X-Proofpoint-ORIG-GUID: J9zqu52G2iBnSxY65g9ohlXlfAaEtzaS
X-Authority-Analysis: v=2.4 cv=V+5wEOni c=1 sm=1 tr=0 ts=696133af cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=lBFd75AfmJVjEZM8J80A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: J9zqu52G2iBnSxY65g9ohlXlfAaEtzaS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_05,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_085825_227543_A47C3982 
X-CRM114-Status: GOOD (  16.04  )
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

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on the first patch.
---
 drivers/cdx/cdx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/cdx/cdx.c b/drivers/cdx/cdx.c
index b39af2f1937f..bbde529aaa93 100644
--- a/drivers/cdx/cdx.c
+++ b/drivers/cdx/cdx.c
@@ -608,7 +608,6 @@ static ssize_t rescan_store(const struct bus_type *bus,
 {
 	struct cdx_controller *cdx;
 	struct platform_device *pd;
-	struct device_node *np;
 	bool val;
 
 	if (kstrtobool(buf, &val) < 0)
@@ -623,10 +622,9 @@ static ssize_t rescan_store(const struct bus_type *bus,
 	cdx_unregister_devices(&cdx_bus_type);
 
 	/* Rescan all the devices */
-	for_each_compatible_node(np, NULL, compat_node_name) {
+	for_each_compatible_node_scoped(np, NULL, compat_node_name) {
 		pd = of_find_device_by_node(np);
 		if (!pd) {
-			of_node_put(np);
 			count = -EINVAL;
 			goto unlock;
 		}

-- 
2.51.0


