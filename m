Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4BC5C44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KwC9/5DR/xlDmwacOOm4dJ0IPWsgd23ip9EROve8gMY=; b=2djcrl3Mggy97I5jYUM8g8mT6e
	HehDboT7ttkHdnlMJOsdvlgvuruortYFeklv+Q7J2rUEkBbR6HMXChB2UF7pu9x/K/beXz6iRiw//
	4GSKbtoPpOFbRDuHlIozZl1Zp0I8VLFCEYBPV2d8UrdvOXhIdLYjA/HihLOuqhcJET/gt+Ernj8rz
	ymDA2SP7VLVeIXtkFrsML/uLA3PrHHCTKtD1IgA3JdONu2L7nMqVcNXaqKU8QWzJGFJqCuq79gzLX
	8/o2+sUWuN8GYNqg7WXHPPvQhwmaYjlbgpZvxW8v5bfg/WjZTvtvGGsfKWjn7N+ovskoF/6082pK9
	KGYtXAyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis81-00000006st3-2k9J;
	Thu, 22 Jan 2026 10:41:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis7t-00000006siv-1jer
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 10:41:23 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M7LXh5483542
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 10:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KwC9/5DR/xlDmwacOOm4dJ0IPWsgd23ip9EROve8gMY=; b=nh1XT9t75VOthVRX
	HMtTxcv8+fy7GpWb5N7uCpSHEyd1Y/aSEqbNLDJSjAqoXDAn2YgViv+zHUfyfxsH
	qemzZ4c9sJjaGYMdZRKy3RuT00v+irO9T31lICxXr+F4xjWibNhqwlQK2xzAaevB
	r8o+rR//5jG4v92nwiMj3vKXnqYlFFvfEOVjn9Q6NxIv/nCpNf7n5Y+zuzb8Slsz
	p48GytUmOoWEYg9Rqbuz6CS9R+rRTFrKdvvk9utR5YOrofAcyrwatKkD0g3RV3LY
	rDMRuCxCpLRnLczuFuLa9y45978+/NDVZg9UemE8QuAFn9TPDUCXJcuUBjATYYbl
	EzkSdA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu6pj24wk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 10:41:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c538971a16so245571085a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 02:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769078479; x=1769683279; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KwC9/5DR/xlDmwacOOm4dJ0IPWsgd23ip9EROve8gMY=;
        b=CBPAzV01gRo50Wg9YvvO2myHhjqc3EvvB3RD3KhtVjcpLZWDSjOircbL9mOemCYJZd
         h008JEWPU8CouOMbzOr3/m2feJe0Pc5oFcYpvwIcehgW0YWn2bTd2lIpDcRXt04m7+dT
         qL+p5n0YvDldP3FpfnNqS6DfPVIPCAY4gt3MsHQ9OxNNoX4+4fqPOnnpUrOnyW4vZ4PL
         8sRYKC99PhH+ZJuyiix8qn5tX/mRulYE5Hk14xiqXNckMzwWAInI5X+Z4RGPVo2OWaUx
         Kl+pb0SbU9nUoUDNOCz+1J0KsC0pETDVjC68Gp9ODzfzfTPAARX7pmdCMYWSekeO83CY
         ycSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769078479; x=1769683279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KwC9/5DR/xlDmwacOOm4dJ0IPWsgd23ip9EROve8gMY=;
        b=pwGQBzbCKN4KkjYZgdqIGBVMGzjVa9IKlqA/fSTBxhBhAFMTtaVS+itUQGs9OdttQJ
         G3fSDz86tulkZiYd2Zp2jgOCkiMtYeZHWFE9CaOKA8fMnqwnIW4xvQuTDoYF9bBW6AKH
         3K0QyB28V0hYjYdnVgdmIcpJpHOwj7TETTbwVdIyTvO8gSkFi7LGHQakF7OuVR7xaVHo
         eVGU7YhfCJGfaqZMmwOT4ReLfZIQ4lO6djha/9C/ms2MJKg7opTFkCwRSETpIMmrCHK2
         YFlm+aX0Ae7cg76ceQNvBRlI6QvHAu0copDmD9z2wszR6BQdCiO+hKjwGt0/f78a6AtM
         cbIA==
X-Forwarded-Encrypted: i=1; AJvYcCUkgJxu5F1LB7NB3SceaaiBv+uLn5hoTUtYR6cYtSrb7aBCx6O3Nhz2fxjL/W1nMDmyoxznwCbjafPnUJbbROvF@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9xzFqEzFfABwunF+laYcm6JGrJwl9TPZumKQrx4h0FWbjDqlC
	4PigDjIIRXXIMcm3FmpMkFu6SGmUw6l6UOIlYnHcx/fXkA3Kx1lJVOTANuDe2zBZ3N3AZXXgO6g
	XZtAaFTE39l9/2/NOeB0LRDMK4Ee8EUFt0MuwWSs/dXVmqT7YGtFhuRLhE6KUGc17dNE4Wpw+M3
	yXUQ==
X-Gm-Gg: AZuq6aKJ9AGV7B1Jw4gI3x82Vyf7r9ueO0nzNLOuIcW2Ai/jR6IBU4+phTHqZhp8jM2
	S7N74nKoRrGDY1PV6ztk18ujzkd9VVGeoa9QZQSujy+TpXMPStaRdGWqyPZ/LC/wD1xEI2GQFz7
	WKfL+G0k8hsOnqEf2zAsWe5xWWEBhAR0OeJEXjfNo7AkGoV3/2TNYZfMTssjOk688QiK3eLiN2k
	8Mp/T9pN25rtXJ8ZQP1YcmtNI64xewjCrqFObxHydvEJTGKxaB/xwnhBv55Dz9SVbMSaBN+PDz9
	64ks2Gi+PxcGULZnJX76Yk8krUol4GRrJmgQfvO24+2Hsw4XZswTATW9VB2JREjyP2k2Wa5y4ux
	6fz9ndsHOqBKxXJCDIw7zkXK8r47xhBYMX6oiAasAth3eeZbmtBaAbT4xiQ0sSjYaH8lSB6LM1W
	bU
X-Received: by 2002:a05:620a:19a3:b0:8b2:77aa:73c8 with SMTP id af79cd13be357-8c6ccd9b1b2mr1001003285a.16.1769078479432;
        Thu, 22 Jan 2026 02:41:19 -0800 (PST)
X-Received: by 2002:a05:620a:19a3:b0:8b2:77aa:73c8 with SMTP id af79cd13be357-8c6ccd9b1b2mr1001001485a.16.1769078478975;
        Thu, 22 Jan 2026 02:41:18 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a7260229sm1387868685a.42.2026.01.22.02.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:41:18 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 18:40:47 +0800
Subject: [PATCH v4 2/5] dt-bindings: i2c: qcom-cci: Document sm6150
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-sm6150_evk-v4-2-a908d49892e7@oss.qualcomm.com>
References: <20260122-sm6150_evk-v4-0-a908d49892e7@oss.qualcomm.com>
In-Reply-To: <20260122-sm6150_evk-v4-0-a908d49892e7@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769078453; l=1338;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=05p3WSQeINtZKVSYvGmsEKNVBC0B9Jn9M3IpPDE6QNA=;
 b=rD2dN5adAIxAGRJ8S8E2CUYLxHGTa+3f/kXvrE4lm6mRaajo/bEdkmlR06eYX6tVWEgBumgqK
 LPdNEc+/gziA0P09lKs9ONVb95cxLTNqqoMB5/nwLd9f5NiVaVkzyhj
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=D8pK6/Rj c=1 sm=1 tr=0 ts=6971fed0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=E-b4n2RehmlEprTZI_0A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA3NiBTYWx0ZWRfX35+LZX7zussV
 baUHGG5O+IyIMuUpDdk7gFpahghwfQffc64cW9Io3YV9RE0XyDA9+bEOmhNwrn6sqPhJzypdmFV
 fUJL4cMzeMoQxSONderC/F3NV3kvd3tEojq86Dbm5j0HjRk8h4wxpPglxLQq+4ianns+Ps3RRDR
 PFLsF999Cy7oBQtwB6y07H/TdmTxen9ymPc+KZzXajXeFUWWC4sleGDoXEdli3Dl1YnvhiY2/WO
 vzfoKviMUX3OI6db04VU8b1sgBbluNb5hd9qo9hwFSe/1FTnobSu/oLDYfn+2vCF9t6gR9oSrXc
 Cz5vDRxXmGGv3GdRXhntrUUuB2PcDRQNXxxnScRM9X8VqyXpL1YZAhqAAzsjBzIEdxVP2ZuHKBO
 UZO5fG3rV0XPfQ4fGpr2O0MIHHLZGt4K701R40GamNwNm/mE5fDQJpngzFF0eP7Roe2G6zCYaXv
 /ufoGGywAMUR923LNgA==
X-Proofpoint-ORIG-GUID: gHGhYzw22tY08zqP77AtlEnMv6ogwuV8
X-Proofpoint-GUID: gHGhYzw22tY08zqP77AtlEnMv6ogwuV8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_024121_552263_7FD7A96C 
X-CRM114-Status: GOOD (  12.22  )
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

Add the sm6150 CCI device string compatible.

SM6150 include three clock:
bus: Bus clock responsible for data transfer.
iface: Interface clock responsible for register read and write.
cci: Clock for CCI core operations.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index a3fe1eea6aece9685674feaa5ec53765c1ce23d8..d3f87da54fcc14a8f808f34c94551583d8deaabc 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -33,6 +33,7 @@ properties:
               - qcom,sc8280xp-cci
               - qcom,sdm670-cci
               - qcom,sdm845-cci
+              - qcom,sm6150-cci
               - qcom,sm6350-cci
               - qcom,sm8250-cci
               - qcom,sm8450-cci
@@ -249,6 +250,7 @@ allOf:
           contains:
             enum:
               - qcom,sa8775p-cci
+              - qcom,sm6150-cci
               - qcom,sm8550-cci
               - qcom,sm8650-cci
               - qcom,x1e80100-cci

-- 
2.34.1


