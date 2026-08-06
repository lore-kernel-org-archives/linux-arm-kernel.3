Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C423C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 07:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/kj9lcijXf8Z+ottqNdn7HYRtfi3O85gd2KLAnTf+mU=; b=OTNol8b8abkk+WNZ+hqrq/jPlO
	jETxhPGMGhtsljB/c+Kv3ERtO6xPka5ebfCNpaE80tnIU+EAJvozs7hM8kEhcl+273krbdbwb3i+b
	70sOiPMOvyeoQ5mesn/W+ilugtTMP0Ay3v2Ka/d6RsQaqOrgOVn94P4N50uAkJ5pkL06fPtJYGzZZ
	KXVmkS3xylaYZVKT9BNewAxHunShUfItA5Np8XmKocG/CryunoEQDMjY+8xoM1k4w7BOCPy13W2er
	J6tpyZdP2S3gRq/WV0IdMzYJtGqsueZWsA+N4jm2WboheJQQQl9YflYlfTaSknoPPvipInOPhc/3t
	HgJyaOQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrs84-000000056Pr-3BTf;
	Thu, 06 Aug 2026 07:03:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrs82-000000056PC-25YP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 07:02:59 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67669SHW1075209
	for <linux-arm-kernel@lists.infradead.org>; Thu, 6 Aug 2026 07:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/kj9lcijXf8
	Z+ottqNdn7HYRtfi3O85gd2KLAnTf+mU=; b=JB+fCSZPAspK2yCWrasDaOYBsZo
	bRQvGIlJCtf8RIk4HvWvWG4HZ4zEeknyS8Z4J3yt+ktKUEbAw8WebnERHJzdUktG
	9PS6YCv48QmV5LoLw05elTUvyLBB+EHH2KB+GVZ2KDqlalp4+izw3HygYrxSDF68
	mYuD0USDYlmzm/MnpKjGkrG/dFAI0aiY+4ILhekJ4PANpIe86Uh6YBu7CHlTSq/i
	jXNNYDLaJXFnGYbZVpvsShAceJrfH29Bx0ZeoW5FFkzA0pPv9Z3w7aX/ahYHWuF+
	9emvt0PsKZJnTeLpxvkKpAGNT2o+1oKlSFY7Zr+BQZUVNBC+s5rmsAKw0gw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvmrjg7ck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 07:02:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0199faafso20149491cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 00:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785999777; x=1786604577; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/kj9lcijXf8Z+ottqNdn7HYRtfi3O85gd2KLAnTf+mU=;
        b=jagr4uQHY7fkCGgq/4Bji3MQyONiRraYz6kpqVpCw6XRhbSHnnyxl762yVDkKWWshc
         Ic+JTmXUNUmQQVDmtDELF7Y+xakGH65rGC6k2Uw8z9NISm4aT0mM3yTe2zud2nxWpRUz
         IiduWHD+mjNLGMwFB/3w4lHJ3ER/DTlL0pLDNPIVRtYhcCOo12d+aYEHoQVbfR5doIpx
         1QtfCxCBwKMBXyl4cc0uBRGQRwNI2wvDFGh/HUZ6pZSnnHMmHGz3jbUDZKa+zvv+62Ci
         ePJWK42QbvcwB4F1sInivSYwB2ffb6CeLvt5U5+fAjbex+2Eeea+1XBHcTpKnbxMyioG
         uWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785999777; x=1786604577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/kj9lcijXf8Z+ottqNdn7HYRtfi3O85gd2KLAnTf+mU=;
        b=mIZAMVdQbMKHwr+8WIqZZqg1S3Yejq2lkuSTyjqQQYKHzOHOOqkoemKHWoEaahfmck
         Ulppc+PBErodJiGIeqDsThGGoX6tT5KyVEh28i2Eqi4V3l+273B+jvDQ196+EH8QUXbZ
         UT1U+poGbBtDAmr4plfR9xYKqkOixM3wQ31DU3KTCaSuEXFbzza8hpp+9Mm0XAXFZkSO
         StEfwroZQ8eu46jwvtw0ba4dym1QqEfr+2eNk0Y9FEjQ77DSTAeP6FEaa9yj4DeOHtPX
         mu0RaMfnd7OGolrsOS3MGBYVf/YyYCU967cxWtqh4jGUCs8wtszTpz7wnVvTcC3+gsj8
         t8vQ==
X-Forwarded-Encrypted: i=1; AHgh+RqMUOeFXKkD7CzCQYh1rg9nmXCkbu8eH0uSXePt2N9aZOGBoojx4TaJRiK25qGF0TUp355FSeAMuKRA6kBeU/H6@lists.infradead.org
X-Gm-Message-State: AOJu0YymshGQtoRpqo8NIVSR09PXqVLibo9HfSGcW56CBXeIbP2H3cBS
	OqccjTZC7uiEYfmtlaiAnro3bMLdauOFqH/93VCCCdEjzWGTRIAfq1NCfCzK7T6XOnE2eAc+b7n
	Y6oF0NfOh0mds7qyNsf+RVSpv7/qfNYvJMpik0F4FPkEC39fL+Ojm+XPSWTsCV9rsGt57bvREPx
	/meXsR1wdsvQ==
X-Gm-Gg: AR+sD13hMSNa7cTdO6lKB3Mb0FoTEooT6Jz8GETSRD9SlRWFvy3EhuB5L/RZrHTnrRj
	YdorWK9DdjpTxSkaBzHyI5rRPIyQklsin2D9gMvpkyaD0j5gLbyVT6q4MFrq8eoGS/4vLazkYiM
	+nYYH6q2sRpu392Unc9zJsCDL3+wDLe2llWr0ePuAoFwa5N7/nP/6BnUiuoe69QrtMT9KVQXRbV
	F5DJAmVOJjm8odtaRGyLlZSB0ph/Xb5hPLsyvaAYz8Dj5J4LHkXJjkfqwsD8P0OcmtrXbHF7AOH
	ZcQZjvCMmgdRE1Lau6lGxyTtXr/dFKIJtbk401DOlGamuU5+FOhjrjvNqEOVh6lKkWupz0i7/28
	vSNVir32GOipLec7A
X-Received: by 2002:ac8:7f85:0:b0:51c:1967:5091 with SMTP id d75a77b69052e-52ce6200bcbmr128643441cf.41.1785999777023;
        Thu, 06 Aug 2026 00:02:57 -0700 (PDT)
X-Received: by 2002:ac8:7f85:0:b0:51c:1967:5091 with SMTP id d75a77b69052e-52ce6200bcbmr128642931cf.41.1785999776650;
        Thu, 06 Aug 2026 00:02:56 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49954246f9dsm45206285e9.15.2026.08.06.00.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 00:02:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 2/2] ARM: dts: ti: keystone: Correct white-space style
Date: Thu,  6 Aug 2026 09:02:47 +0200
Message-ID: <20260806070245.40219-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260806070245.40219-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260806070245.40219-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1537; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Kyuc5bVBIK6jpa+JRhS5R+xtAmDE2ipSapb7f+2c6L8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqdDGWG3cuc0UxeXvBgKTmcgWGi2wiJBIXX/IQQ
 AU563GukXaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanQxlgAKCRDBN2bmhouD
 1wsbD/9AMTpPt4D5MoFMm/AhstEWEAcSwiDtIhSmaTWWw/1F9oZFnfoXepyfrlRWdgilyhgQoMI
 iSjWKeAxYqXV5w28DiAo/AWfkxozT01AU18tC+XbFU4B2tgVG7uozoUywghllJkMEHByYi8noiC
 HAIJ/0Hd34ClrJC3NIBltczD5yNIhteYPVNsMyOCpI22NUsIqn8GtGKs0SUjpY+SXzyYQaX80c0
 oq4R8At77GJPddmih5Ofbxm2+0Cyl5arrcIgVjycb/t2/xy5nKSM8VXxF3vt7g/h/8ZHXJ5uDgS
 LY5+lfoTtTlVWhyOn4cLe6v03/Wsl9g1PEZ/mq4mmfU3z3hpflVbteni9dE09E+X4rIOpMCTXo2
 cibj8Ct1CvnvcRlECUwbreqTiVojy13HLXpAAmZ79r243ry3HaMJTTp/HUeZPlI0qhwxnQJCJeL
 J0bmwvMYKctN7/Il0CJRFLlRT/+3+JwJDAUIq9e+qFrYkKBmChKtr3XSspVGD1oPixNXDCsiLQz
 YG6EyA59KgYCeu57vcuADDYvuAkFCdG+jw2Th1z65Mk5vFYSHYW9uJW/3zxYDMgBpa2ZX/+/C1J
 hxm6+dDhtstsEQfm4DGj+WSwVj3h+Pu3cymeU0D0mv9D9KHDlyYcGv5Cg2rsX2E6zK7pQsA200a zbfiHZTCYs7SyPw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VNPtWdPX c=1 sm=1 tr=0 ts=6a7431a1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=YeREbuiUy5DaHqWHangA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 78tG_IamtkvmbOd4fEU54z7PYMPbZcln
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA1MiBTYWx0ZWRfX8XaPeNkWzVKg
 tXzvlgh6mDdKqgjVNiOhJpjU3xB574SBQ4zx75pmuDlFb9gVEN05n7E5o0E0TWgc95k0FDooabd
 DntlPbO4dIPFP8BljKBhrx223Hcg51w=
X-Proofpoint-GUID: 78tG_IamtkvmbOd4fEU54z7PYMPbZcln
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA1MiBTYWx0ZWRfX/rb3WxqkCSix
 VpzaYEEF4KHfUReG1U9PClx7kO2ci36v1axa0Xy/1EradxbXL9Eoxat+s/7EYZLgEdylYHkmQ4a
 XT2Zzd9So1qf7ctDh/4yI7mi0+pjvtsOIF3vrGfNiTFE79ehDPoZQ/Da6kXP/gRLng4iHjYNr6R
 uJNqltvUFspiVDpc/oeWLbiH6GBoD2ORomXs/NTqYPaHwFio/63E12kSJDPwe2f7RBGbbUm97B8
 Hv+QFHGq/Ad6VD/3gvSo66x5iOJ1cLpYG4sH5tmuKK8bj4aOpWu3C03sgSBFB+4Kps07ACjquT/
 bME6f3q/pZN4FwprsagNISi1GaxUMrJehg9Et6UYmlY1I9r2Mq52EWyykwPu6VHxUzGTyhQnouR
 3DdyZ43sC4WZFSjJIZnU+LqAHXALAKywOBIRIzBKJJdwh9j7o0L/e5MH0vpoz1rn4crFAbrtHSP
 q4ANnZIvsF+K/J7z4rQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_000258_651614_2AF43B76 
X-CRM114-Status: GOOD (  14.81  )
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

Correct a few white-space issues, like double space after ':' character,
which will be flagged by dt-check-style ("redundant-whitespace"
warning).  No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v3:
1. Split keystone to separate commit
---
 arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi | 2 +-
 arch/arm/boot/dts/ti/keystone/keystone.dtsi     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi b/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
index 330b437b667f..d91a23bbf6bf 100644
--- a/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
+++ b/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
@@ -51,7 +51,7 @@ uart2: serial@2348400 {
 			interrupts = <GIC_SPI 432 IRQ_TYPE_EDGE_RISING>;
 		};
 
-		uart3:	serial@2348800 {
+		uart3: serial@2348800 {
 			compatible = "ti,da830-uart", "ns16550a";
 			current-speed = <115200>;
 			reg-shift = <2>;
diff --git a/arch/arm/boot/dts/ti/keystone/keystone.dtsi b/arch/arm/boot/dts/ti/keystone/keystone.dtsi
index ff16428860a9..cff549c447ce 100644
--- a/arch/arm/boot/dts/ti/keystone/keystone.dtsi
+++ b/arch/arm/boot/dts/ti/keystone/keystone.dtsi
@@ -123,7 +123,7 @@ uart0: serial@2530c00 {
 			interrupts = <GIC_SPI 277 IRQ_TYPE_EDGE_RISING>;
 		};
 
-		uart1:	serial@2531000 {
+		uart1: serial@2531000 {
 			compatible = "ti,da830-uart", "ns16550a";
 			current-speed = <115200>;
 			reg-shift = <2>;
-- 
2.53.0


