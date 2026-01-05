Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CEFC79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 14:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KZioLkpanDZcBH1dgKOEf56mBqkNVVvEtciludwtIUw=; b=cChlO/aiK+xZBqEo1AaDE3HUSn
	mmC4HHHdzanHwd/RgEsbw3muQPl3O12wmeDbK5pMp02fvXQSGvbhWRdsvCFNX7JZnlmuwA+326Abk
	SMUjn5HITAMoaA0BhAetNQfsRspiSKVGoikij0faYpquyldrQ1tDkw/Sld7njfm+WllgTs4YmuZZ4
	VcpDqbSulqoPuPp/C85v4lWDjMXIDF6LGNLt+gWBHOkobevPzPbAHEo3B+IhGYzekwTA5YaWflrzM
	h9OYfnLVIaF0L48aF+0mFjMLbmIH6AZpTIllO/DeevglsO3sAtiqdSUQR6XNC12YkUEBg00QL/ucH
	cLIFKQDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vclhr-0000000BYH4-1YlV;
	Mon, 05 Jan 2026 14:37:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vclho-0000000BYF1-3khV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 14:37:14 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605BV2vm3520988
	for <linux-arm-kernel@lists.infradead.org>; Mon, 5 Jan 2026 14:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=KZioLkpanDZcBH1dgKOEf56mBqkNVVvEtci
	ludwtIUw=; b=ehNTYIkHAHXAHppeWDGRPgWTfA+ycLAEc2nK9K9HaDbIZZDK+vw
	jJeOxl+RVw2khR8ZrwyDWHIhPR4/lJ4Bckq1rrcCcNO6N8mTB3wBqjHO0E9GQWj1
	ukwXd/nRmrcDFaxN3hU4hHGkN9QndQ+CL6b5kype4UZ36zhZPT9lzbdEV0hRtWav
	K1jTULQE4L+i0CpUcRt42UhAJvv4fNMrLg00qJNV5anqYt8kVic29V7hEkNhzdPp
	uiiYHzLwX3QiKFNscPZO1k2N4prHDU/8aHlYqaZMOcs/kAFfEelg3otIU5Tpix/E
	WMEko5+9m8fi1CnZ2sSi4QYMeHxoXGGm1Cw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg6uu9hw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 14:37:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f4a92bf359so336892881cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 06:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767623827; x=1768228627; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KZioLkpanDZcBH1dgKOEf56mBqkNVVvEtciludwtIUw=;
        b=A1HtyuCVsszexlzHHZb8xofx2dkOwsl22sWe/SP1tcriiqT3/ymt29JBLsvhkZ0/PO
         LT/ndMcPupK45a3P2ieamEvn4TqJBovH8xZtYeo3B+GLtW3OdIraxAtDxhC6mheMa78K
         3T+YI6wKhMfE1opXL0qiHGHZvup0is4HG5HU3Zcl8LLg24KMnHypQW8SPLEm24ViwMU2
         J5/EGYc7R82b4wguGS41tptcnXWcjdJea5CPYXWwCttm4n130/Ld29pJ215u7NxfMwSu
         J74iMLiwuTXLIIYI92gEx3j//FnHkR4cLNzvlie3te7n/rOpVyGu4pPCe6BOMs2BPbRZ
         j2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767623827; x=1768228627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZioLkpanDZcBH1dgKOEf56mBqkNVVvEtciludwtIUw=;
        b=tLCA9ZxDO6fCFxRVEy8VNT5N1Jr3v4YQqV92MrUbBwVzB83DxH8I/7pmTay5/d9gqd
         gA3DS1FuJ5qT2DF4emIzVH+qKB3mMYFWRQVTpj/etsvWhFirXdvFJjzllmzm1e6t/s+R
         ajotU4E577oColl8nTYdQpejmUPoEBP7NSW4Rh9h1fjArUIEA+gQchRBLcRhNA2+8nlL
         kiYF8ZMik1D6d8goFoVuYRA6ZfaH+p4/cM3x5ZqOEjwf1u3hMfBpx1lYeaUQ1RKuxZ2l
         KsSy910I3JSIOeIgm533E2IuMpC5LavYBmEbkjD1SFS3Cx68oSYGABw5WlQlI//v0wrB
         gOgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjcIlr5WcncD5877bl3mWM01SgyrnkZgbwZQY7shJcd75rWvr1rI9rVuY8uMJ2b2eNHVfSGqnmMYb4XKINNwAx@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4Dh3zcc0QyubYumLxmZjIZHJsL5waPwcHCj6q03A5H2NJwOfM
	gy/uKsRtGKV8ro+LfQhLKPHAXgYkznR2bjIVMv544sTj1K1Ka9AsGUbILPOD1K05nf4CVEN0+m+
	+pX9iGsqZd1n8394TWSaCKBjy+Q7yl7yebcLPuIsSNvCRLDn7V/m3AsexwZQkq6UBHJYbhVrYWj
	S3fgQGctxK6A==
X-Gm-Gg: AY/fxX54Vnb9DSJssAPHAz2pDOBW5tXCGrZXM7Pq6C/MpLtGyHzknbCfYaJ4o0eoOOS
	p1EZqPbCtwHyq6qiONaifNAAJF9RSJvXteuQ9fdnaeuxkshto4+1jt5cwFGbseMzT/HGef/Aebg
	/XZ++wcoib7EpYJdRahfXtLC3bSytg4IZBUoDp9BLv4wSl4mwx1n2ET+bj+phlyUE1U7Og9qpi9
	CdLMmqd5PY+1EvlOb246OVb+yuVCyhjwPhtdtqxn5ZyfP+MhVfQelyITzN3J5x5LVeGSkI3kFfo
	8bTLfkVTW61I3U7QHG5oUfD0U2pfooTtCPQ72nV3oMey+OoGqiugjwRGoiJyzVHKNDLoaOxjEkV
	UtQIULI9LA7TqT7tBEgIUaig1eA==
X-Received: by 2002:a05:622a:a90b:b0:4ff:8da6:2289 with SMTP id d75a77b69052e-4ff8da62a41mr50044561cf.27.1767623827141;
        Mon, 05 Jan 2026 06:37:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETqa4wUKKN9lw1LQlEMOdwGiXBqLZKSYc2WvZI5mrVl4L0Pw9h0qnI9s0mw79oaM7Cdgi0Bw==
X-Received: by 2002:a05:622a:a90b:b0:4ff:8da6:2289 with SMTP id d75a77b69052e-4ff8da62a41mr50044161cf.27.1767623826703;
        Mon, 05 Jan 2026 06:37:06 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b84267ba062sm2914066b.71.2026.01.05.06.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 06:37:06 -0800 (PST)
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 1/3] bus: qcom-ebi2: Simplify with scoped for each OF child loop
Date: Mon,  5 Jan 2026 15:36:58 +0100
Message-ID: <20260105143657.383621-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1368; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=i65eVLxpMZsyFdDY2lrflFwXpIkctLvow8AmMXbS6yY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW8yJE93S4+M3e+01WVQV077ZGMVXwUKYuZDCy
 eXZDeO2BhOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVvMiQAKCRDBN2bmhouD
 18jQD/9QM/XaR01VMbGWrly6e4KidWj6Gt/bN6D014S4O9L5GkLa7tZ5FN3sINq5Rpnu3e8+Q0Z
 /W9VfJJKNsf7JvBOZn27KCvjH1dQisLMT6aAuS40QQVeHaTawiSZRPZPwe4/S5duNsFZvsLcje/
 3lj9SAVMjbONDK7fznomplvZdjJvyS3KBtCHWZ0hqcXWySEzSmWx5Kp4n+1U7xlytPwOqbyKsEH
 gmU554TqKuWZEWTQx11+GcX+40kaex+OWBBVy5wKbdCPcxjZpZWEZYNby21cpOHlbqCI60glMb/
 akb+QI0sZgvyyy77Ek4u5DuDMXFttmVrDzN2Cd25k3c2+SKgbGHcqvMcxwQmlSdcxTAPo+Ko1u3
 OOsOFvsUC2SqsQvFqhbJ62QYz5hVnwH9r7dF8p9XPZuwYdRn9ZFMDnZRP+Oy9g29+anCoiCO5MN
 L4UNOyGYoP9+0nw/HjY2WndtUL5M2YKyEqPKg46n/OQkYbcf1Yy+zUtN4fert4tdLW16SHbzVZy
 ZnZW4kgzLY7dwShPLlK+G5S6ToTRRO2fvvPB+49mW4IVgVfRfx4Pq+cti1JmVgoBRQpxFwh8Nvp
 eNb/a0ziPUnka4ivNd2MOIwDHfMmGQ2lGPQMs+2ESgKeb6Bcfvyw1P91rHT1NDv7Lg8hr1vqazn xbp1u9v0RS24Pkw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEyOCBTYWx0ZWRfX/L7y4AoA9dgf
 mm75zW03iWjkLHltL5yo9D8cDG/W1dBS+pPnHzGvii6NkmpHMIoxmiY3dOZ+RI5YWoXGzdMiiTR
 IufsubOR3TIgvf11/dWbIzBI+aqnoeP5N32tD4GsNAcmyG6/51sOvQXUsolf4e2Y9/M2u+dBpee
 kqRaKUVPu4gvDHmKjE6fLTB0np7Qrp0pTJitMh1jOW5+p7s1MJiNMTI4ijjcuPokvJUi/KwMiIl
 PkMuTS6dYTjPKTmWEvqoWb9nmDSm2L80TDeb5iSCF3q/6OM/zc6Iw182QYTXB7FqVWzATk0qGQ4
 1egrIN0+/QEFZvoFJocEPmbdg7hB88NqaQDCZQb/Mw9i/zm1Ti+5UyugG2Iq11tbtzKGOeFkiPR
 hXhLkM+AmVjD9HFqnOJ/MzXbBXur1wYyxJTb6emi6PqLMGPb8Cv/1siG6pHby1eplb06/LseRVT
 x+cY1SDJOucbEW6oQkQ==
X-Authority-Analysis: v=2.4 cv=eZ8wvrEH c=1 sm=1 tr=0 ts=695bcc97 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=mc1TC-L5zOEaToRhIlkA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: jpaGxiN0c-9iDL_Prryjc9NUdGSKyLDg
X-Proofpoint-ORIG-GUID: jpaGxiN0c-9iDL_Prryjc9NUdGSKyLDg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_063713_070230_885C12AF 
X-CRM114-Status: GOOD (  17.05  )
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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Add Rb tag
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


