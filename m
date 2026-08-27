Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B2EC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 16:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tKKYzTTyUQNx49FteOTvUbeUFOC22ARPMGkTLmOUYjE=; b=u26GuXd3YbDsuFDZh7Vb2+slmB
	f3CGOMkSgEV4SYe6MsbNN7kj9MQV6IzMdG67ij0R1sYe1UiCxRLtBApOz2yTKDujpLuKv3gDoap4N
	oHMS4nwM4NLP/EPpivpKBZCusSN07iGoNj+pq1pewpOFn/9ZLgnSS8UGSZGwN+IR1bsv2ByBS1y0Z
	W9iOwm6yvAx2ZWXVZ7FoHAoWMQfJSFkowZo4GsJeDTZ6uPFPI2XGGLAbeeH2dMBimZbQqU6GN9Frq
	bYWZLljI5Pr9xhRLx4DaUZoikP/ahCVpReHCze93LE+WYWkZzLIi6ywZRGALW7d0vLmuafKvKzEMr
	Ti+9V/Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzd7j-00000004MWo-1tMX;
	Thu, 27 Aug 2026 16:38:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzd7e-00000004MVK-3z7S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 16:38:42 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFbuCo297107
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 16:38:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tKKYzTTyUQNx49FteOTvUbeUFOC22ARPMGkTLmOUYjE=; b=SaMxRdthBszwPxye
	ahAPAjCu8wN15TieayAgyNv1rpccx0g2otWevM0wh1Vxiou7v5lCf6Eji6kot0Hq
	cJfWmknf3m0iXl2a4/J4e6NkYhw76YbfNr6mkgG/psRCZcJ2v94g3pQdDNuxaTmp
	z+AaWYdFQ5aUgbtfdZUSYIQJnD+PFTNogq6Oc3lrm3pazT8fCFSodLWRN0LvQLH/
	RkhbLete0IpvHZGYV58U5iaRYVJBYMf0Cd14esQA1pio3Hr5sTjbSmFu0LhCowOG
	p9cji3oDM2wF681yaqVAhsq9GjG3rhn1XCjpbvhOhDQ8Q+/0nA45A4Eyd3enyIBZ
	xbyLmg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gam6fh88x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 16:38:37 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4ab4ca7ce3fso242919b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 09:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787848717; x=1788453517; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tKKYzTTyUQNx49FteOTvUbeUFOC22ARPMGkTLmOUYjE=;
        b=S+aLyMEyrKiBtbt/34fUG0vG2Ut7iAdKdG3PxyFG9kIVkLkQANReOISUT/HqBXm9Za
         kUFgdNR/eOGPnNAgKE71jT5SAlJkHpiNOjjrcD5lUX8udApP6sAtatsmdOQx2bjS21Ph
         C+TQcnIGrA4pFTL+xFjVXVYsDyDa+Qyig7UDzHzWKYc1SxMkEWQFXScnCwdJSq1MJD48
         0/qgdvoW20w4RbqDN77CHgrtRWxii8LAyPQiSVZDSNkfH0GB8NPKGOqEDpPpxRdDenAn
         JIJNwBNjwftoRYSjltCtfqrE++gqpO2ehMe/c91YPkB051UVDdYY5H2XOK3HfuATsOOY
         9NnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787848717; x=1788453517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKKYzTTyUQNx49FteOTvUbeUFOC22ARPMGkTLmOUYjE=;
        b=k8jhDphrjqJLAU+sPl3eYQjySYK0t2iTZhNcl1zdphOi3v0B8wFqcqsNWnwGu2STZ4
         ikxz/Y8+t/CbrgVRWrG/MVfJlqB5nRrQzHh7f7bxHOsirchIdQSyiBg9Lq7acYiXGJr5
         l5MDzCdrjjS5eIEzAdq+aBEEbHhQerdDc5AjHYvJACLHZoj4rhYe2BS0SOe0oDDwyWiW
         klgS3an3RjQI4UV17M6LVjaZ2Sfl7dSng39jBqky9T21LqA21QiH/oP/KuBMKJyVrPK2
         KdguK0dE4qLy7C68R4U29GNvkOxtkG0toIy87Ds9rlf9XAKDpoDWkzxwCeB23xGJD6lF
         dLgQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrj3+RXDGAqRc9TX2QwHka7uQA0tE/5oVmokqtIhDr5kPsM9C3FcuWQ3BePaWQYe/fOIGVukmlmF6IiN0uIS63c@lists.infradead.org
X-Gm-Message-State: AFuF++nbKvUGC2zOOVrRCOIr6oH+O1HMdWoWStYB40w2fhadV5n3UAwv
	D4nIDk60HxGWg/GSj1StVwOPxQ6pwEH2qMpq/sPih3XraEajQ8OOzWsypsVmOxk0yVnn8yF4z14
	DZHKZppaR72/2q81juG4gc9dS9NVCdDv84ptqe1/TC0TCjeCOWVhzh49gZ6HvxHdPtxc1Sdy1yM
	pKwQ==
X-Gm-Gg: AR+sD12KSP1JVHI/hhtP58D2CK/0hx7y7abEeLRGtpBF5Srw5ptgxTm4HNfnr76u8YJ
	Zql8SUkW9R0vmX2ibIkR4yCCCxY9qqFAZJWzEtxB7py6zhfNEiRnD/XO0nzCpaC5w+ohV+6HhSI
	7LJFqzBrJZD7qeagsweqUWkupIrjnM/RmBIFWhi4W2FGUBWp5nUz7KL6AsHMfqLr7Jra6jY1w27
	emPrqpumEH0OQbmVgBCLpJwk/9Bn4dl9RijWb7o3yvjfeefwm9f34KFUKNPmxNcCsXoXzGa5Dwe
	+r5ePzVPMwEwjcVY4xP3/P4OsfeXI79n9EidZDHDQ6UfyU6MrP8j9Rsk0i8ANYgMBA5XqpdLDpj
	RwezXELOYh/NXWDZApmQJZhfwxJ0wCaFW92pRvQsIMF4JARRy1YCy5fwiK2SfPUrsRC4IFyxHsG
	/zYB1AG356b6yV0o1/Prs78nc=
X-Received: by 2002:a05:6820:83c2:10b0:6b1:4061:4193 with SMTP id 006d021491bc7-6b1a01f68a6mr13170112eaf.0.1787848717206;
        Thu, 27 Aug 2026 09:38:37 -0700 (PDT)
X-Received: by 2002:a05:6820:83c2:10b0:6b1:4061:4193 with SMTP id 006d021491bc7-6b1a01f68a6mr13170053eaf.0.1787848716826;
        Thu, 27 Aug 2026 09:38:36 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a24bce78sm4253171eaf.3.2026.08.27.09.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:38:36 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:08:03 +0530
Subject: [PATCH v4 02/15] dt-bindings: power: rpmpd: Document Kuno RPMh
 power domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v4-2-dd34f235fc1a@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787848688; l=871;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=ZHsN8zM/JbhignLDIxWKpOEJ0dJLsvtVmGGylPc0eUU=;
 b=RdWF85ZMBnw5+LTfMUb/XNYcxEP72DT9HKX+qTDzgA+lEhyPfHN012Y7yPzPmglz+6fhKR4F0
 g2mkfFKmFy9Dy+hrx7vcKwg2/5OCovy3VzCQSV8WPXTRk3eBrdKwbof
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX32bhcs+lE+u3
 DtXHvthNlbLSxcElcGdqWd965VVbpqyv3394VGRjxm8IuqPd5SHe38eg/5oyF41nG63IOQ1Fdvd
 D3oza4wtG2RQOBZPsj89Wc51CXRBURw=
X-Proofpoint-GUID: 4D3M_cLIWhVkLdgj-Wjuv6tRxrNPaw9Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX7confk6By/RS
 VdodXjCEcdae3mPulr1nE5WhIZ9V2W5GPaH+h+iwaYEV3paq18ogwDoeZ9yBzVwcPY+TwWzDot+
 cY5ybQe06ZsS3aSSj6GMEAM5fqqQINQUi6HUpRsZ4/wqS2CkQ7LLMLNKBJjNNwEecalUqSFUCir
 jIvUG/btSnxw3MI/3NR8MSCsxQBOw4NDBeNLQG3Zg9iteWAAOUznmUAy4rTo8TYZ5IRh0nO0J8T
 jfH/sSOMGERyLyQPSxfqX/QwZH8xqgpNLwkmWjynv8Ezmol9/EOM9ydFs5lao4cZ1iHqPT/Ugav
 fmiPLfDmFv1fhCSIHyeXgWEf+WFOY1JH9XgkxBqc2zWdpW7t8xydZzAQac5W+0ZbotHBOZiuSwK
 I1khJ2Vjrx0+a6AGW3Qk+zNlSp+s13pD8hPJCrw4oNSKXXyNl1RZ+J2aBIduzHE1ANniiJfdHsE
 TC9mpmxtah31vD9DDmg==
X-Authority-Analysis: v=2.4 cv=eIgjSnp1 c=1 sm=1 tr=0 ts=6a90680d cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=lHgBgSUrZIjjmBdF2hoA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: 4D3M_cLIWhVkLdgj-Wjuv6tRxrNPaw9Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_093841_433397_D9AE9672 
X-CRM114-Status: GOOD (  12.11  )
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

Document the RPMh power domains for the Qualcomm Kuno SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 0a45e1f55062..7fc3927efa27 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -21,6 +21,7 @@ properties:
           - qcom,glymur-rpmhpd
           - qcom,hawi-rpmhpd
           - qcom,kaanapali-rpmhpd
+          - qcom,kuno-rpmhpd
           - qcom,mdm9607-rpmpd
           - qcom,milos-rpmhpd
           - qcom,msm8226-rpmpd

-- 
2.43.0


