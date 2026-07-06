Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58ABC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 10:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/R0UR0KqbpWYYbudtpGSvsUKkINFSCvAyxXAwv8+WAw=; b=wDaXvLQpIciNMWHeqjQULWcAt5
	2ZzxgbVlfpMhYQDY69Fenb3+tFteRz6OjrOOiaL838lgsFZGk5PfFZhcF/zCDXFXj5wPeZq1wwX8L
	KrK+IoAdMl+fxT19M0fq/TAd+lM2e9rvrY3QYpTIFzCUcC1oCW11gl78ZpZcra1Mn6+FEqn1a0XxC
	HTyhnEvr8IGKcPymHXVjQ5yMNYsc6Dk8lVyi1iS1Wt6g+cnOo0rZ1LZSOqtnym7h53SCarT6Vuvtu
	9kqYgFLbAkyKUK4tTiaPMJrOsJAJEPKEL88kEy4JCBHhjlpdU8HLbp1L3HaC7sarWXKqjo2f6wx2d
	JOq940AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggQG-0000000CBiD-0JdS;
	Mon, 06 Jul 2026 10:19:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggQA-0000000CBcz-3DmB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 10:19:30 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693ucH4151598
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 10:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/R0UR0KqbpWYYbudtpGSvsUKkINFSCvAyxX
	Awv8+WAw=; b=g/FqHofyrjtKP8lmI7JGxxZjUohdd+y4DCC8ntAndOUlbKy+ZGn
	lyHYBqWZ5yRAPc1EqgBN52Ozl3acAXhe91ZhFWArquimP1BkFRmWClw10WNQalGF
	/MtzxXGejrYb7E2do7FldKLmNbcxnmYP+hy6cIq2gmOEJz7SnFIxNtMFURYXo7ye
	MN7jFqkSZY8e7BHztOhmeHMhWSQlY5KQWGPq3zKSAEHSV61arJ2KS9KCg6TqFLqq
	s1Hj/quNUoQ0bXOtRjquFFfB5S0K0VSfb3FLo7ZRikk/XnkzbaweHBf7gy7ZM5ON
	CfRtewzpBlmnN6vVErTHZrEf7JZWce/17vg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hs8jj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 10:19:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e538afe65so271058885a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 03:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333165; x=1783937965; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/R0UR0KqbpWYYbudtpGSvsUKkINFSCvAyxXAwv8+WAw=;
        b=Iw/wqu1wSGHqPEXZFP8N+vSF0YjXDZGFAo0wywtMSEJHb+rujr6fpq/pNKJO3zx8ta
         xRwbPpHFOwtg2hT0vKJ0Ulwyg4XDcBkel4Sdud4lTAk8KxEJNG9Jo+pOsmTHZLPgODPI
         TefQD/WsvDpNkcOd1rLP3KGhY1DT1wVbeXYfefRMiZeCwglkEUqewAcqE5Ehb63H9ZVi
         kHrsykj6vtPf/1Ph9ZJJL7DPe68t/eHmRhXJ7OXGhTcyv5XyRaOmDm7TnDx4vKn69LSd
         N8MnNWupSC5ZC15+nX2CL4vyJtJDLm1DJc4COmBXWO4jQbWmNo4qkVnggreq4nlavDii
         2kkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333165; x=1783937965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/R0UR0KqbpWYYbudtpGSvsUKkINFSCvAyxXAwv8+WAw=;
        b=QiQNZee+JJ0vEkPmxTAsBcedKMzY1nuSulKiTeymFsIl1Rs4N2QjHafbRpq8T1wbL9
         ul1xNZ2QKBjZEkoFNyrb1Ulx7KFHjUXMKRdu11072JzqUqRzYtZHb/C4GBWhFhdHWwDQ
         AOrJ0wiIgLIbsess7+SwjwBOUCDKbT37lMCR6QA0pLYQrPwzRwTa/RTA0psSwjs5Z5CJ
         8r3AFq0UU+zPgiAFpjT0Ug9jELrj6q4HS9ikGV8BHFStZwxduzFp7xJSmWk3TKiOG3W2
         FYY+LmaFTxO6JlpTJziZppy8XTJmg4dxjXi1Lmgg9zTo6ZgATFGQ8bU1e1bdj1nxyxeB
         l+SQ==
X-Forwarded-Encrypted: i=1; AHgh+RrkaTf1FUVQPE3lc4l2gNi9xuvv/pYMucZrU+hy1aZRTD/Q4gOdVfPKr7rmmwF5iH5pXc/gRus8i6tGrktaxFpf@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7lNv2WWwIBT0i5COuZ95D+aRci9sN15SNlQNzko6E0qKdxOST
	4+f2CpcrcTvEGigffi5+hEtiXXwpWSh9HtoBl5l1bwe2tVcKSNjKVm3Ia1lg7Ge1w8E9vNl9lxC
	NPmgItF1fAIdOFpwxRuO4sAU+uTBi031QfEUO2ryzh5IcYkMeJMICf5jiIQS8M3VE8057i6Zqwk
	s2Cg==
X-Gm-Gg: AfdE7cn8xjnFdg7Td52LPlyqr4bvdiC9K7t+6SLm28veVcfVu6uyY5E+JcTi1P4Obo2
	zwn53JMPS7Xa21cpu0gyqMcTUmx4BZX9bD/XtYQk+Fh2N9Okpz05oA8dNMDKV8F2XgwfKF+XF3u
	wdcaUlOJWXPtgOynk5Qtz8icxc7cL3wxDXRFufOH7jguj4JYPhved9Vf80GD7VMhtNTMf/Dw1jt
	dJ9m60RzF6ZdLKXV4nN+7pMVSwzrPigZ/Z3aRbxk631st65dGpVIuUw0qUzSFKXVZtK/83LS9Z6
	hWSQEFGVvja1n80gqO4qOX2F1fbWL2iQHy/gDSTMFLVzqPqzITrruobwdTUzF4uXbznJpozrYrp
	CcAj8FDbFnLC1z2z1AlIPDy8JUFQ=
X-Received: by 2002:a05:620a:2552:b0:92b:67e6:8ab1 with SMTP id af79cd13be357-92e9a4f2798mr1258754885a.59.1783333165167;
        Mon, 06 Jul 2026 03:19:25 -0700 (PDT)
X-Received: by 2002:a05:620a:2552:b0:92b:67e6:8ab1 with SMTP id af79cd13be357-92e9a4f2798mr1258752385a.59.1783333164790;
        Mon, 06 Jul 2026 03:19:24 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d8f1sm23472714f8f.3.2026.07.06.03.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:19:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: broadcom: bcm7445: Correct indentation
Date: Mon,  6 Jul 2026 12:19:21 +0200
Message-ID: <20260706101920.341586-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=934; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=7dT1rnwDJw2CShE8t7sxuVTIlJ+TFysprvo7cgK07qg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS4EpPDSD5pa9obhkMqq+J7902LwJe/IH7h+hG
 hOgiJuIKwSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakuBKQAKCRDBN2bmhouD
 11RND/9q3Ere+0+Hq7zrm4mcw/inOIvCQRbxkpKKfV6ft3qYAMJWHRI9ehYiNC3lA94QzX/kkmX
 SHLvpLNLK43yfjJmPMl1XecUOmfE6vvhnEXV96QW6xaL0NaNHYfO/kfu+O77IZXjG1llYPWfr8v
 xogL3e83vyMPTSwnuPSX7k+mTwDgvKFJlMMp9jcc2jA+ACR1VBgGr9AMjEohqlaiohPrAgyWAJx
 DyU5fvMBHaeKaB3WM8+CusM1osnXvc+nl2aGOp9KXdR8TO5I7uaLm3zx4X+XdeNHQdAvAJaX+VB
 yaES4HAtm6yd7NhXZKOUuJr9q+6eN+C1kbcWKi2vddEskuRfIRho7jrAKVLxpJVocToZW1FqERS
 5VdhD3HJp98/jzeftQRNn0ktat5NEpqKI4HBqFrs6lQw8k6nhbC7tsMqpsCg82rl2WwLApvTXYn
 ILGWQD90U1MXXMvj+5pM429KMJnxS2N/svFaPuAubLExbmTNSru2AYp3tM41+7Zm57QTspjwDoc
 2d/gKEnjOaYU4UUHm0Cj6+xnYJNfssNVzgYel6z8irsIITV75w8HrtSA7023pKk7fTUHSpqV6a9
 b+K0IWNbdl0uOqsxyNijCNCTkKxmRHGGhyIShnW84hVXPyA5ysFWhSnnvulgFjlZMy9iKRHmtG2 xZmPfSemqcrIp0A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: XbI-KYbG59jmagDcVOvKlTaio5UVqxBd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX19iUMchJ6XOl
 wnrcZZqiiBbvzuumldrI5Y1dd4gO8nX7X4rPONuspT2MhAUAmbVU/SnDiryVX7RvFKABqN3qTOi
 JChVxyD9A5j+UHBLJzwMXYfPn6PSLw6/xjQS2B0bYT1LZuw4aI5zZOHRwEeGA7uWuXak7Zv8XR6
 k9VKAieOCgYIbbTtloM/rguJD9Qc58x7MGnXCwef+czmzjgJxJqsIERuUWIfjf97yEQW8DfoiW4
 uVmm5qc/H+ViuV9I7vOU4YS+B6jikXou8PFzg43j8GizcFpWu53J4PGiRVfcqBwiA9MNiqOIN1n
 x0vFBJe68cKGs6TIhYycFHDXsiWL9nQ6j2xihyi+8G70qrc98A1QbCu6UA0vm3s1Cgy6SqQwA4B
 SI8xAvVun6Gc8ZHUHRipijcgxucHIhC8T5dDquLsmlP7Hv2VIxN2GvLN24uepQv4xmjEl++h5YY
 tSQ9wQTKbP8ZYV0bHQg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfXyuLlL3tcWjB3
 l/RSL/sWzzeoOtdrqs1RKKBCcfV2fiQnnVPvyyrwnNmasGZZ0LCSHOUqtBQKFmyZbzyqeCn1QvG
 oMPg3x4YbfxxL8OAED1BANe4vhGkhzg=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4b812d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=tLFoKwMCRvoQtr3NvW8A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: XbI-KYbG59jmagDcVOvKlTaio5UVqxBd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_031926_957400_BC9534AA 
X-CRM114-Status: GOOD (  13.91  )
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

Correct spaces or mix of tabs+spaces into proper tab-indented lines.
No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).
---
 arch/arm/boot/dts/broadcom/bcm7445.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm7445.dtsi b/arch/arm/boot/dts/broadcom/bcm7445.dtsi
index c6307c7437e3..7488781e0301 100644
--- a/arch/arm/boot/dts/broadcom/bcm7445.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm7445.dtsi
@@ -132,7 +132,7 @@ hif_intr2_intc: interrupt-controller@3e1000 {
 			interrupt-names = "hif";
 		};
 
-                aon_pm_l2_intc: interrupt-controller@410640 {
+		aon_pm_l2_intc: interrupt-controller@410640 {
 			compatible = "brcm,l2-intc";
 			reg = <0x410640 0x30>;
 			interrupt-controller;
-- 
2.53.0


