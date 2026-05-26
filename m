Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17B5CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 17:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6gMLM31lPewnCBaPI066p1pgy4In0RFum6QqFLaJ934=; b=h/F9JHct6cqQU4UYRsx+5Lmodr
	n2ZLNm9w9EQHw1emGFRv3z/Y5lpRg35ft0yclDKOFpXZmxJb2/Jq5ygwnEOx4WZrgZ5XslxsFr0Lj
	UoLlowl6R//7Pr/zrN8EtRRDptvzvqojY9P0chJ/IflxtF1BGmhejTwD9ocIU/s9j3UfGhlzuCwdq
	H13oA+djlKJW6g9gnWipNak4AoSKreDacTAcllGCNas2p+SgKfTiHt/op0GUifj6J2kbSkxJVrDTg
	g3b2Ua2VVPCnKYTwkN4dsvsEI+LSg6oSh72JkLwfP0y8/FueKIMj/qhSWGBZLXaHJ7jlhNKFxTttb
	XDGWXClw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRvL2-00000002fqe-1UXa;
	Tue, 26 May 2026 17:13:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRvKz-00000002fpD-0x2V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 17:13:06 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH18m43086578
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 17:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6gMLM31lPewnCBaPI066p1pgy4In0RFum6QqFLaJ934=; b=JPII2p9yDr0AgFhE
	gBA7YeCXlr5AHJCIhlRaxmhzdJnXkug+hm7a7F9h/Tf+lgA8VF/w3obLVxis9HGY
	0P4pbPDPFA/Tx8G6yojWiFBpoKeGvduw/2WyjQw1/NMjq9dQGReyssObJwHfpcyE
	a1CxhObFWf9SYjmpKamTyOaKdCSzz5a5XjHDz4Oiz7ftccM+SuKrVWOHRMpPJMNt
	iIkO9Mi9KVhGOlMPjsWnL0R9ByMb9m6zSJ7gRM3Wrt/RfIBReADm4HnKQdrnwq5B
	lMmxAc8hPgh0PXlJtN2I0OsrpQuQ0W0knSD5VbJ6Huw357w0GaGAUpLMd2KKUauO
	N6yvRA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edeff0dv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 17:13:04 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c828acf7c1dso15151602a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 10:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779815584; x=1780420384; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6gMLM31lPewnCBaPI066p1pgy4In0RFum6QqFLaJ934=;
        b=ZU4XkjEQDB3Jv/+6yXZBt3q69cotBKKV9opcT4JjR/0C6VnLpEzTnS8uSff60HccaA
         6b8Rm0l9W+NGeqws+M26EVa5VJROQmH0Y+CqkEifXXKtLuBBS8cTnWZQm31JrTOfNQsp
         TP7d7Pr7ASfhZUBv0o0deYqMV3RMMwFpxUgWUs8UeDaJErVklBgxRJL4lNi9l8ObgCk7
         V7Hx53ibZscl/tS+8Rm/4Iah5qpNiq2nTl/q19CDw7QlcXH13ueZEPSDh0OUtk9jyBHG
         IhSchPiycCmra4yVlTFZLj6Wntb/Yy4H/RNznReiwEwxUav9/K/3PBiO11IbCYVwZ0P4
         j8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779815584; x=1780420384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6gMLM31lPewnCBaPI066p1pgy4In0RFum6QqFLaJ934=;
        b=oBMKvlzMedWUTwkQcEa70FXNm1KPdUhIbUS4gGfIYUQZTTN14uhdyIEaP3FUAFB82Y
         z8jg6kfua136DGhuZPWcxF4R6/NBbHIdGTyweluaQ/5e05AHJ5SrS/3x/Bq8vioYbp+u
         F86hdWKlUYuCSkhnXqJ4Nd6/nCk/93fvF+24CHqiv11zGTtMSztbTh/G5QX1GRzV+M/q
         APhej2pPdthSmSUxFAFKY+qMq58SuDpVbb2TUqvIW/A0ycfE3KUf6uj1f+DcDMu5OUpf
         fbkMbiO89qRbmy9cg5E6WkyMLl5dBLUg2/QUmRp2xC69pGuPcWSIojZZjXEBjtomU6Hi
         1A8g==
X-Forwarded-Encrypted: i=1; AFNElJ+tFcKdESFyo6nJRVHFCINxoSf1gOp5KTxxTaBB7c6NBNYQgpkCKT/tcoy54gW8XlgqLMl2JFRb+7mWHaEnWai5@lists.infradead.org
X-Gm-Message-State: AOJu0Yxjg6XyLEkFf/71mAHDHrMnrlE3aoBmCInHmS6pUmHfhA3OQdkS
	N3mcaRv4uMrYPIS4ZCl1Yek4NOp+VWD2FEYOlujXCkCGgshwPPamTFKRDwebk6ND2FIeInd0Jqm
	E7mrI7eIRbYZyzb+kXy/Kpn1KwvAJQUuuAlofQXijqLtfZHm3v0a5c6k1/oNzjg3pAYvZdVqiOk
	WJNQ==
X-Gm-Gg: Acq92OGh2+KCmOlV6UG7mxRp9v4WekkgslnqpVH6mw/eA8PErUJPJlhJGZzwtLES06X
	fXoNwFiorR7/4w9QKqwTPfslg8pOHibNsaD/mAUzWwh1N4FzRGyCfwIasQQSXN6PauOPIqAuI6Y
	tq4d8yktY9Ks4YZ3MZ1/LRy0ZGhylmq32pZuUsYj/mIMQ5yTi5LhRjqH4QA0YnsSoCTE8FI6NXp
	4oaFx3OzAWRRf1xJz9MvdGHfmXL+CKxJwnGDy6O0QIxmfkutcRReKMVO9SrVSF1I/KpSCWE1Fb1
	sz9Szivqu1alWnAaA0cfD/g6U1k7pmIRAmdbhTSZjywsh7W8M/zbuknhLK1Zlbx+hW4heTkmgQi
	XuWW8qhjqg31l97rYbTqNq1OHCDbAzGyLVG5j1N96n/Av4nllirN6
X-Received: by 2002:a05:6a00:3010:b0:82f:355a:857e with SMTP id d2e1a72fcca58-8415f68c23bmr19307751b3a.47.1779815583690;
        Tue, 26 May 2026 10:13:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:3010:b0:82f:355a:857e with SMTP id d2e1a72fcca58-8415f68c23bmr19307714b3a.47.1779815583182;
        Tue, 26 May 2026 10:13:03 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84165009761sm15736235b3a.60.2026.05.26.10.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:13:02 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Tue, 26 May 2026 22:42:45 +0530
Subject: [PATCH 1/8] dt-bindings: media: qcom: Add Shikra CAMSS compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-shikra-camss-review-v1-1-645d2c8c75a7@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
In-Reply-To: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=ONEXGyaB c=1 sm=1 tr=0 ts=6a15d4a0 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=TW5Qit177qQvJ9gbTQAA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 9plyUI-ZB1TTmpog3yc9ktreqcUGRCcy
X-Proofpoint-GUID: 9plyUI-ZB1TTmpog3yc9ktreqcUGRCcy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0OSBTYWx0ZWRfXxR4/cop6Kbj0
 Z13U5Mbs1+Zr2Kj8BwtsCi4rOGOKOr9OTj1WfzLQCRokrINguMhHxVMdu/znjmSR2Hw9HQn5Z7f
 oANgSytfx94LHgDmzarffjndXHI+XU9eFbGGmU5X+4bkCiVvH+1HZkELejgr+usNO+VSgE0Jluo
 Zgch/gQDa8IHXomoaCIa0Vuko/sx3G9iVThI/rXioJtzJEo/2zH5wtnKFZYq4vLOzC3YmLQP1Ki
 2/7m+TXUyyFfG7cYcDN3Ynp0dBsa5liu0YBCF/5WfCb7fMy0rjMkFswkR19fdfteI8AgWjsSWnu
 uKoUCrweGtmxpltC20oMfJxiJixpwyhBtewIINcx/Zke30X+Ct7LwqqxERQHTVycjREjXQli8Fq
 M3DcaVYEbYvsQFzIlJz0+EvqqBBSwvilTgqb8a1tFqLVGM/+TISoaYrefNCUbDKeGX2Vevbv6eD
 Xl30MC7ONICxk5R1t+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 clxscore=1011
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_101305_280030_063C155E 
X-CRM114-Status: GOOD (  13.30  )
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

Shikra uses the same CAMSS IP as QCM2290. Extend the existing
qcom,qcm2290-camss binding to add the qcom,shikra-camss compatible
string.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
index 391d0f6f67ef5fdfea31dd3683477561516b1556..7b1469d6a1601413a1a32dc452d7d1fc85aa9eb8 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
@@ -8,13 +8,16 @@ title: Qualcomm QCM2290 Camera Subsystem (CAMSS)
 
 maintainers:
   - Loic Poulain <loic.poulain@oss.qualcomm.com>
+  - Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
 
 description:
   The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss
+    enum:
+      - qcom,qcm2290-camss
+      - qcom,shikra-camss
 
   reg:
     maxItems: 9
@@ -76,6 +79,7 @@ properties:
       - const: sf_mnoc
 
   iommus:
+    minItems: 1
     maxItems: 4
 
   power-domains:

-- 
2.34.1


