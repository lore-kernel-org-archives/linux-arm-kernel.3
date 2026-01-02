Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CAB9FA3741
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 12:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Fp4+mJVKTQoSMQr4XwZyr06u9mVCIY8JRYJcNq2XkTM=; b=hLrtxjwg0ByKGwooaPRcl/ozGI
	wjp0ECD4yEa7/ntbrfGGXWNJ60R0woFDkA3dV2RjHnePwWUvOYTTpkTl0D2SWG+ENlV1AB8gCaPNA
	C3h7RERn+O1uTRZlyNBER4WFBDk6IG6RnfEp4ywBJoVUpVsceSpKBHLH+Notcj9gDHkr5LDMW0mac
	K6uKVZ3uxO0J1/fY8TjRFQ0KUK4VNdLO5VgQZXJkx/uDykAeCTmj3qOQ5w6P49SkLk6q7Kzwn4lAo
	NXMX/UcJrFeEWRR3jhUGfrdpeMeGkiz+oeA8rPZTpZrbPEHnDVQ7sETwnENORi7UIbtRyBCVua73n
	y8Idjx+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbec7-00000008FBe-3BEB;
	Fri, 02 Jan 2026 12:50:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbec1-00000008F7O-0aBi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 12:50:42 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029W3sf426888
	for <linux-arm-kernel@lists.infradead.org>; Fri, 2 Jan 2026 12:50:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Fp4+mJVKTQoSMQr4XwZyr06u9mVCIY8JRYJ
	cNq2XkTM=; b=kO+kmW0lNVd26lRH7eeO4vrCFpMkm3VdsG9TrpFeOIvLVYvXuLj
	lW78omeY+VGMmXCl3udEvj7JxFgTF9SI19bI4ItSgjLhRwFGNTuGwi7HtbodoZ96
	+gzAf72tSTeMbQvHUpign1x9gks310k89xww7rxTkoxyjsl1o6wTuBXkF+HT9lr2
	AOwCIzIT1OfC0pa50poVtLO034BCSlVovXiOlh0OBZ9NB17GOklwd5tzbLfiv7f0
	/0rXR9u3mn7jCHAfIVpjW5dUUf4VYODx+XgMd96uaWtCkD3zqkQtU0Rm+iXlGM1v
	bt7684Ls6CGWyClSF0StNBSWmlS6kNQbb/Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4be6fjrxsc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 12:50:36 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8823f4666abso299271646d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 04:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358235; x=1767963035; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fp4+mJVKTQoSMQr4XwZyr06u9mVCIY8JRYJcNq2XkTM=;
        b=FLp1JJu5uXW7vwtGiLB0i5UH54Wz0NUr07Nm/ZnIVqh2hFgexZU+fPYMPY7vQeC395
         fKHEbtI7Xp5vPihE1eD4v1+c4WmRyKzsscTPkQDLhZ/yvSYj6xh6/9QKY3THYwYOgTf3
         E+hJRrvVVBSDWWPkXmzgGYONrqU1UEpqqOGbLswxnqIqkRev+skOprxAwn8FR3ayfliw
         6AGY6W3GwMoPYjQosbGfz6tzMhupDnJPcSCXJ+GW2KM5m/OwEAp+JV1eVLe3AD7RY7++
         SX6meje56Ko8MA82H03vziP1GU5FCNjTll6PHXYL3+905wrzRCnLSASsgXy9mkVSKSLR
         cK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358235; x=1767963035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fp4+mJVKTQoSMQr4XwZyr06u9mVCIY8JRYJcNq2XkTM=;
        b=YDPtp7fTUl8YWsDw8PaEq3SohPEC/E5RPnKVLlhQ8Qe4U2rKjDo5jCaSwv8gTOJQBG
         OtVCQPxFyppFtFbQ22ljuOBsw7sHOeD8MmGtVYUEQxRpMmKGFDlgijTL2dzU3iOvP8Ac
         iKqHSJQCNEsKnXid4h88NRTn2oBGQZ04MAakpxYpYQ3qD+UM4B/h/idg+LQzBvByt25U
         MDN4wJUbui+hHww2p1rJNuo803w07Qxni9VZcX6IvOIxbY3PsDKgAzsvAT0kFl5rdPWO
         m2yy89/TcxlnSTWAhbHfcBqfck6T28adgP8f3Dn6Bk9qm3akxKduL7Alrn7X5RYB/Sph
         7d/A==
X-Forwarded-Encrypted: i=1; AJvYcCWNxFNz5grctQZ+l0NzQbm7oH1/4zRPoekMStzoH5juzihM3vA/T2D5GlLj+vJcqvOFiuqACKffQUqWJyW2ilHR@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6D5SGN6UUhKeiv6szNpesrv3eNVyCSl2LTkh+MddYXYtDkQ7T
	IoYoXqbV1BGgSVMbyd7UIqkzt3yopj1f2neHpK7DbcpKfXLcLXD9I8KaI9E9b9UCroGCVg9PYFX
	McDooH+9EE7FEoyrIRo/O00VJ3YnJsaMq7ahRDEmC7zpw9kJPCgAXaqSQbgfGCPSaBwN9wrZ+dp
	To4w==
X-Gm-Gg: AY/fxX6q6CZS/Z6PnhHfyegiWjQtOExgA0wFcYh5hCdm4nt/eagWZbL1gecePo/IbD2
	fNUTrpRK6vkiJdhnGwW3ODdlMNsK27BOEktE29B6yKCVgV8qMcH3voU/AGa6A1IG7JA34uJTS1K
	MwqdhOe1IcFgihmViyRe5jZbIXK5EZo/WmiTWXrYkVXvvE//jiC14z6l6YNpe1lXuEMpEwpGJxN
	xOqafnlqCr5h22Sx1AttFoJ6MeWvDFALr4hxHhv8CtEUOFIflfpC5mjxORkyhazcs3SOeq7HK1T
	klj4/8w3VV95Tzjf1IBO78e+x18Gcea7OFpFrSgczxjIUpD+yU4fjLG0KZvVIgTn2x9lJ1wCySw
	VB54RWPNTNBwondz37+sg3mKH4Q==
X-Received: by 2002:a05:622a:ca:b0:4ee:219e:e7b with SMTP id d75a77b69052e-4f4abdc6496mr664749121cf.77.1767358235603;
        Fri, 02 Jan 2026 04:50:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGhOqJewLADG+gjoDRNMsJwaKZguNA2D1Z8aonmvGmrKk0faqGUMW/pOTGdomDowabAEFPXCA==
X-Received: by 2002:a05:622a:ca:b0:4ee:219e:e7b with SMTP id d75a77b69052e-4f4abdc6496mr664748851cf.77.1767358235199;
        Fri, 02 Jan 2026 04:50:35 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d19346dfcsm889545645e9.1.2026.01.02.04.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:50:34 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] bus: qcom-ebi2: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:50:31 +0100
Message-ID: <20260102125030.65186-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1267; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=6VNzNxSib1wkBf9CiN0oOnbkb/ZpPRHIUAnKhtVhq3I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV78WJWOEQE1RlvmbLpGIzhsW70lWCb8Rfye3o
 cP203mpqqGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe/FgAKCRDBN2bmhouD
 11byD/46+NpegSknbhVdWe6q9ZcMwNzNNur4ERtJXs14JROinZOMIGkhhv0sG9IZmwuFjWvGjdX
 S8kM8GTYRxFbzvUwmjAgR2RpduZqOD4jXHXwB3p4Tl2oMBx36m3OP7yYjBs1Il7aNV1yOXFKwwK
 fckUpCVI9NxXQULZsYYVRiYkW7psB1LNwkgfaREvum03RSIFNOjOJWize2DF0lYOSAxyEhbCjEQ
 Rt1H6kJkXViUjlFxuuf32zsOI0oq8R4eW3V8N4iQ5dyVDRKrY3gqbo4SkT6srAxmjRRGFEgj3xn
 xTACmyMpsWVZ6vTzOenAV3it3qthTezkP/yZoaYywXFENtjLjhUvSnUXNppCTl9wcS1jqRo3cGW
 WL138RTvLXFsx/3u3Z39JmS83Euo/RgVVCnl1n3TmDzViTVYzwud4lGFOfYWvbOWRFimk0UaTGo
 gA6MwU2AbvHlixvLu0BvDhgS9jjep2su0U3VZfCFacbjPVzu/mX3Ek6JhPkJjXz44oK85ZY67yY
 qM+5bKnejU3CM7UiLcpATMhuRRpRUQvyIaU2faZ3/fz+xoSnfPVFRP2vRGlKH8sMEkQtaxS/X7Y
 /5qVLKkAB8FpEHky5pIVexTNZRVfJJlq90oWAlWai6mNQmTh62A6g9xM5hsRUY1cApwJCKgfTiK tSpbAD/9s3EJb/w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Av7jHe9P c=1 sm=1 tr=0 ts=6957bf1c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=mc1TC-L5zOEaToRhIlkA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: PFiqLnvxL62NdrbQrFu7mWBDTq9_-8d_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExNCBTYWx0ZWRfXx8EW/xHtRsYR
 0alvYT7ZXFEfLNXWbhzjv6asDb+cy0qpUqINE4GvDDAsNnvojrEHTTV8rH/BsB7J16bYRU0VfOn
 wgxeMIYeaMdXprM7llYZvt5yw2BeVphEsH6tMJw7vXhVlYyPAtn/SEw/arAvatbDvm+hSCyiBPE
 /GLiWMNlZRi+MGEDf1aFy8pw/mqQk2eIKdhvnyUX/V9nxamw7jl5dsxUxCI3EKe5KRxGqiMFza2
 6EdXAnommc5q/rs532rRsDDXWQv0xkASdf5hQWUh63EqblANx5fnqWGg0ra9dV6cMR1kQ0khsQA
 nKIPKCEJrzTs6/shnlMDf8nMU7yrFfuLXbu9YbGFg+x39OPaLdundzzwAKQ5YXGj/vd0kmx7ou4
 WrHcs4TVn/bwH9tOZJKn201A4rCRUx5CaA4MtxzvOpqxZabexEPel/WK64TDqgt45BHQGQS9QRE
 y+exvc/8G0v+MDBCvVw==
X-Proofpoint-GUID: PFiqLnvxL62NdrbQrFu7mWBDTq9_-8d_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_045037_193033_20439EBF 
X-CRM114-Status: GOOD (  17.54  )
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
 drivers/bus/qcom-ebi2.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/bus/qcom-ebi2.c b/drivers/bus/qcom-ebi2.c
index c1fef1b4bd89..be8166565e7c 100644
--- a/drivers/bus/qcom-ebi2.c
+++ b/drivers/bus/qcom-ebi2.c
@@ -292,7 +292,6 @@ static void qcom_ebi2_setup_chipselect(struct device_node *np,
 static int qcom_ebi2_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	struct device_node *child;
 	struct device *dev = &pdev->dev;
 	struct resource *res;
 	void __iomem *ebi2_base;
@@ -348,15 +347,13 @@ static int qcom_ebi2_probe(struct platform_device *pdev)
 	writel(val, ebi2_base);
 
 	/* Walk over the child nodes and see what chipselects we use */
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		u32 csindex;
 
 		/* Figure out the chipselect */
 		ret = of_property_read_u32(child, "reg", &csindex);
-		if (ret) {
-			of_node_put(child);
+		if (ret)
 			return ret;
-		}
 
 		if (csindex > 5) {
 			dev_err(dev,
-- 
2.51.0


