Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B902103E165
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 11:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wR9AMTR8ItIvFVs0Nnm3qG3RmglLx6erxP1oN+Z3AhM=; b=s23613xUcmf5g2kDshad12s46h
	Q5CNSv3GH+Buspsjhzyujlv8EyYRtNqhEGZnJugR1f+WtKW1uepN1mTrYAHE4ufU3CwwkHp4AUrVQ
	GqtdJwyMp7RhCNFDRdkRiaiOnoaaIoDTuxH4VK8IosD6JklegZsCHThElZVjKqHAu04AxzW/yzJqr
	BSdllEcGTAn1HVuru6hLHs2wT/bD638uVH2GMyAspGql6ba6a36r7kGanWuA6mkEAtWD9XRJapbUp
	wMWy6SQX4sAULzWl3amAgix07psCPhXuivWYrXjnS5PErd00FJKeLDslFkK6yiS9sjkzd/S/44gYQ
	Nt+rHJ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2olp-00000008HXE-0qL4;
	Wed, 18 Mar 2026 11:09:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2olm-00000008HVP-0WTy
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Mar 2026 11:08:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=wR9AMTR8ItIvFVs0Nnm3qG3RmglLx6erxP1oN+Z3AhM=; b=qX70UEHrTa9kPOcgDk097xvuXs
	2RbnovYfoTjUFocErtzsfsUOm1Y/Z/meN8NQngISMB4gLQZQLVUVe0COb58I6fZWRK68pLxIeDl/d
	UMux44Ydt2iLhPrFdRwNHkZYxz5HI1tWWNS6KGrHP5HNqVHSpPHAJPR2xhpd45S0s3wJrLHtX1Xzs
	cjXAufi1HbuCDSS1Pyh6SUhzUB6w/KToyEo/krH5lTq7V/Kbruk5B/EBdUBH9eMesneZHst1evBWo
	QOtkxn1o9MO/86Nbpq333sCRopF5JeYRuJaqvjI1SD/vpvX6bcD7F25KDHE5n4g4PPbgMzFPonbCh
	4EZfu4yA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2oli-0000000B2NA-1XgB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 11:08:56 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I9NJJr3281366
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 11:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wR9AMTR8ItIvFVs0Nnm3qG3RmglLx6erxP1oN+Z3AhM=; b=Wad3rk0SnmL5ZVJn
	dpXTzwHKSYsJaZLn3qZjfjHbPGxp694yAGTcCdvtSOO3L3GvIxMOOEEFEz+G1r7h
	Lelc8SqdvjSsNqWQBIslSm9dY/d+ZhblAbdtP44uPuN7ACVQ7mRF0NinkjzTCvvd
	ygz1PFa8oORAEIhJfVcrwrLJvovkW5wgzJ3m6wLJ/ssLAQ/Ylt0Q86Q3FdKC7U72
	IBv3kguccWtr20mp4lpRXB9SWydDYq3xQpWoRfujahACYWxi7ft57l4Uaf5OtMhi
	kXDvjRMMmmXxIAmNbTp6aZN1yA55ymWev2q1JhM+oZ4DiCgk2N4eqRfVkpQAEVHu
	pxVyMA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cya62v5ad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 11:08:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093025ffecso51739871cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 04:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773832131; x=1774436931; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wR9AMTR8ItIvFVs0Nnm3qG3RmglLx6erxP1oN+Z3AhM=;
        b=U9vN9d7DJOfU8S2s4L8bVjlrJOEaaAT9YK/FIwZEKm72gPbC7KwM7EU4mqIPVsztMI
         frKXl8jICtSZzM0CUDS4ZgKAcRPVvQkxC7pcL8kvn0xyLKfLpILAwE7O85wXYicosD5T
         eKRgjQFfvQUXq0ZGxIvh3NcAUzQuxM7I8t1yJRGYVF2WLhG55UZVFvb8xgTbVXMwqAV9
         8ClyVg71wm3VjPU/AohuzTWkxtSTMq12CHf/l/gm654nxqRCwZo17mzP7qH8Yoe6PW5y
         6L4z3qRNd/Xxln3fnFz7o6PWyZ+ksNGoyd0Vz0rv/QgZPlobnzf+XvWhOtcC9Lx/sqKb
         lYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773832131; x=1774436931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wR9AMTR8ItIvFVs0Nnm3qG3RmglLx6erxP1oN+Z3AhM=;
        b=Ki3GFxw/zdZOHDpMcn0iVWGIDRfr7ZXmDFFOolfRCTMwMD6mPrJ21Y1GRls6VjhL+M
         C7WINEuHIENnBJ0WVRTrdZNRMI4IOyA0P2b5jCyKsP2gdVl6hXVajkqeqZqn9UgaEo4U
         E85E+9jVp083Jz5D7Ix8r2HASMttRA4j/2TsOb5Teqe0hFL2JfjBoiEIxDUXi4V2yJ6B
         G8Et2IISc548EYSrJgsAjmawYKmSWCGhAyG8xjWKAxnBUjrxTbGRRnp5V6W1YwF5eXto
         RgVnIIPN2MI7yubXUoh0Fz/RfZGVSEKRIFYTP3iP14rIzBkyy28a7amQIVHUIhpsNDx0
         fdEw==
X-Forwarded-Encrypted: i=1; AJvYcCWptnM4UkhNSFj+Y5PZL2jGag1e8ONsi6I6nkCZ9fIs5LptVQjaQETUvcqGuzLQ6lvd0GUrQpT9PQypIC+7J3b+@lists.infradead.org
X-Gm-Message-State: AOJu0YzKb2q7/uChb6t3lJv6wo2tfEtBh2rPdSeyUg4hmwl1W1aYR231
	omJnv1n6bEU2fLkw4h6Z95n+ZYNAoY4oOMq8navYzg3ZmaQ/ljrZVt1C//WUYeFnkRUB2WNVqiF
	GMQcKChKbK5NSb5wYzLXVC60TMx07Ll+b1v30K67RsuIeWvZ+WRy3dQNmKiI1sjN7vZjXL1yCbP
	l+qA==
X-Gm-Gg: ATEYQzzF450zLopW/ZmNb6RlJTXneofVMO8FVfEvbUiUci5h+15159Yw1SFH/c7bGyl
	JKBwR1jLDFV4EqVvaXeqEXlYm11RTUeZ6h7vVBNYfqY5DGHty5ocJv7STxPfGdWIOmGG2SEXEHN
	vmPbHSl7mfKQvWuI1TibsWGQF2pGjypfY2cHStp41BLF0TFyDKY7nsAN/kUa25cIELAIiWuIM9l
	mo8bbogIQzNtUkSho85tXKpF+y18FYR8kEtKzeiLG3jolI58GypUYkaKBfnlJJRw8THlNEDtvZj
	U6C27Uj8bspJDw8NJwH0Rk18GGQ5ezbVYQ7SMLPTpzQ126w+gj83TmQC1TeUDZl1TNAOMKykdje
	aJkcs/EDiTDOpI+Hg3UKs+1LFLf+ZrYmh8GoUEjJBfQ4x
X-Received: by 2002:a05:622a:18a0:b0:4ec:f2e1:483 with SMTP id d75a77b69052e-50b14869854mr32484731cf.26.1773832131443;
        Wed, 18 Mar 2026 04:08:51 -0700 (PDT)
X-Received: by 2002:a05:622a:18a0:b0:4ec:f2e1:483 with SMTP id d75a77b69052e-50b14869854mr32484201cf.26.1773832130763;
        Wed, 18 Mar 2026 04:08:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51805291sm7523646f8f.0.2026.03.18.04.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 04:08:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:08:40 +0100
Subject: [PATCH 1/5] clk: qcom: kaanapali: Cleanup redundant header
 includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-clk-qcom-headers-v1-1-d5c6a3b11b67@oss.qualcomm.com>
References: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
In-Reply-To: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3783;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7hyg1XXvT5j3mOuyK22QBL9DKoIwlwiMnknBQSnTpeA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuoe6gR9bvfg1adntW7DiNK52kg38RdUAFpdOQ
 IXra6l1f4aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabqHugAKCRDBN2bmhouD
 1/6uD/9ZAAGcvO3kTn/UshqbTfg0k/YLc5NItNNgKuTLe+1MFzJrxMI29Vl/+25cC1UD9daLQsG
 bt+zzp6Ue02o+vJ13Bh8etpYPLBWuF3MTXGOl9D9LdYI7kW/3sLuVJ0IZg5WulI9GKBfDKtXmNz
 AAWcfeLObmuasvBK+u0bA1iWGa3e2U6py9KryG3qFGIpjpIo1HpjzkYwUk4LZ8Z5RwN7q1UcBh4
 B/xGEWUahLpFQVqWCPXTchouENIMc2uYixnyvN9++yNr7lPSBlFrIgsGVvncXT7roblpUify15I
 R1vnHJum7RG4vqgKy0KsZlpx6KVaUPcVxpL/tL8C91sMnUaMzKKn0KLgvzaPeZ80Xfp5VgTN5Hz
 7OhsDRu4iYy4GahSTuWbPPSZ12TLrgXhbn+wmpQlBRt8SdrM7+7sFu5g53BZjJyv2FfbjnwG1pj
 7MpmZtu/ly1UrNpY3JTwX7v+OoykNJ0CYYpJ48ca4fYIpQYOR2L78w2nw/sjgxX7iG2Xu7QlqFc
 bWIbLpYabbwxV9Tb6eUkQrMNjt8s61TJ1ikMAGHxiA9bic7F4vqi9D45sawgcO3wEn2RXv2ZXyw
 BjdhkjPzxmoBudkh1PokAEqY2tgGgxKXV15W1EWgacDaTBwR5Dp7yY6YIpvK0yCI192m2WRoZ0K
 pmph9cv0QhJg2lw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=Ns3cssdJ c=1 sm=1 tr=0 ts=69ba87c4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=BlA2PGTryg89HV8owXYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: taPOYsmDoX4SKskH1r_aVXGz42dk_1YM
X-Proofpoint-GUID: taPOYsmDoX4SKskH1r_aVXGz42dk_1YM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5NCBTYWx0ZWRfX3k2CqPCNPTwk
 WtHfN0hUOq/dJLPYKkf2VfZ3K16mu37eeK/L2lDX08QJkMLJMA6WhTzags7wm59N91LBNJdVaOf
 jskm9/tcTdjVvsmkKVqPDlB8ZutvyMtxrNefuus+/620CDitKo7J8YR66Pgmq+ziioTfnCO11C1
 uDU6c5Vmw0kglUca8C7X+WH8RZp4AwrRPNoLId5CsSIWO5qTudGYpFwt2tvOuDiRV3+hTdmWdeA
 hG2+SWYxQyR59lHnUB5eKtWQTJ5gd0ycJiUZM5Z2A1XeFBkQT+dC8lhuawsEG7LLJBE8JhyGxOr
 bcZPkSlQM9kT70fbpKWuBzbR3YjjfKhbZHgiZu87F8c0Z/omd+WI9Axkr1nRZv4BV0AqBqrViYl
 Biv4DRhhDJGWa7gb3hRdjArMYFBLfzZ3yU3h8NTrLQY8itX+7yPKJvLowXkNhsdEe/jhXctxWlv
 0x0FaQW6WcArxt/L1Cw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_110854_848363_807CFA5F 
X-CRM114-Status: GOOD (  12.50  )
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

Remove unused header includes - drivers do not use any OF or runtime PM
API.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/cambistmclkcc-kaanapali.c | 2 --
 drivers/clk/qcom/camcc-kaanapali.c         | 2 --
 drivers/clk/qcom/dispcc-kaanapali.c        | 2 --
 drivers/clk/qcom/gcc-kaanapali.c           | 1 -
 drivers/clk/qcom/gpucc-kaanapali.c         | 1 -
 drivers/clk/qcom/gxclkctl-kaanapali.c      | 1 -
 drivers/clk/qcom/tcsrcc-kaanapali.c        | 1 -
 7 files changed, 10 deletions(-)

diff --git a/drivers/clk/qcom/cambistmclkcc-kaanapali.c b/drivers/clk/qcom/cambistmclkcc-kaanapali.c
index 066c1087b0b6..6ad912403b8b 100644
--- a/drivers/clk/qcom/cambistmclkcc-kaanapali.c
+++ b/drivers/clk/qcom/cambistmclkcc-kaanapali.c
@@ -6,9 +6,7 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h>
diff --git a/drivers/clk/qcom/camcc-kaanapali.c b/drivers/clk/qcom/camcc-kaanapali.c
index 82967993fcff..c848ca99e9df 100644
--- a/drivers/clk/qcom/camcc-kaanapali.c
+++ b/drivers/clk/qcom/camcc-kaanapali.c
@@ -6,9 +6,7 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,kaanapali-camcc.h>
diff --git a/drivers/clk/qcom/dispcc-kaanapali.c b/drivers/clk/qcom/dispcc-kaanapali.c
index c1578cd07041..5ec4d2ab6b67 100644
--- a/drivers/clk/qcom/dispcc-kaanapali.c
+++ b/drivers/clk/qcom/dispcc-kaanapali.c
@@ -6,9 +6,7 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,kaanapali-dispcc.h>
diff --git a/drivers/clk/qcom/gcc-kaanapali.c b/drivers/clk/qcom/gcc-kaanapali.c
index b9743284927d..210ec7afbb67 100644
--- a/drivers/clk/qcom/gcc-kaanapali.c
+++ b/drivers/clk/qcom/gcc-kaanapali.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/gpucc-kaanapali.c b/drivers/clk/qcom/gpucc-kaanapali.c
index 52be48c15c67..d93d06067fbf 100644
--- a/drivers/clk/qcom/gpucc-kaanapali.c
+++ b/drivers/clk/qcom/gpucc-kaanapali.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/gxclkctl-kaanapali.c b/drivers/clk/qcom/gxclkctl-kaanapali.c
index 3ee512f34967..795ce40e028b 100644
--- a/drivers/clk/qcom/gxclkctl-kaanapali.c
+++ b/drivers/clk/qcom/gxclkctl-kaanapali.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/tcsrcc-kaanapali.c b/drivers/clk/qcom/tcsrcc-kaanapali.c
index 4da77367c9e0..db46d639edb8 100644
--- a/drivers/clk/qcom/tcsrcc-kaanapali.c
+++ b/drivers/clk/qcom/tcsrcc-kaanapali.c
@@ -5,7 +5,6 @@
 
 #include <linux/clk-provider.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 

-- 
2.51.0


