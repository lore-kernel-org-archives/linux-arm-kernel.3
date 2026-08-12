Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB40C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 13:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x0dBVTf1+zsv5GhKdmDXrH4C+CVNQ+zjeZPwcZnyxXY=; b=ixTWhkMHOi2MzwBkTkCeEY7UuL
	VmvOimkKWcG2kXCetkei/rsDVgKqFafk99hIsaUmCgYNvyK8BsUe5CMLwdWqEmDT6+5RjarnSGu+8
	3RBVTnx1EsgATH1TAuL2dsTwvR0I8QO7VJ9yL0UYIDN6kGKKEiOsSv4+emM+Fa2NIcCZKG2oaH/Uz
	/E+YPiVsDBeZj6LUYLcO73RGb7bge34465zV9sOMdGGzbPDHIw/kcDNNzC85J7z0jD5dfftqZDWHU
	znNfY2wBwzEvgn0vbW8ui24Cto+nuc8HAqSxj7zTxRWm07mNbQ4hijuU/XIRjz68DSCX5KtfWvDy5
	VsBzAo7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu9Gc-0000000GJhJ-3U1X;
	Wed, 12 Aug 2026 13:45:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu9GY-0000000GJfT-2WnK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 13:45:11 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CDbm6a3971646
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 13:45:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=x0dBVTf1+zs
	v5GhKdmDXrH4C+CVNQ+zjeZPwcZnyxXY=; b=oXWybFJ1QQQwTFUe4MR1DpXYnu8
	tDnBWvlUhcat6r9lZP57Fj2SCCLVo+wutak6ZaQ412oyQ5BnwikYXvkNJvDm3qig
	pdBIwBwJwfNdAHRFNH0NAnR7aq6yRBOTjCRAH4ruoOH/s1v4OswDo0v8wG6FYiNA
	Y0dQBnTM8CuprK0iccvllK0yRYnYNJ48OvhXOAl+rmIHWLSrz4cgKnc52yJLnGtQ
	pBxawrMQoi2iJjNgQeeFwfb2xS9g4CflqDRySNfH4r22pjbCT4u1RHNIl9MgQ8g4
	F4QNJIUPfsONBDz2DuLHr3ulMB/N9jAVhBjtne7qBnyZVSyxYlJHSKe0+Mg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0jgrhvyr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 13:45:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1b4d961dso9197341cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 06:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786542309; x=1787147109; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x0dBVTf1+zsv5GhKdmDXrH4C+CVNQ+zjeZPwcZnyxXY=;
        b=WoLEoCdx2s1o9ZQzulTiNkX9+SUfSOsu+MV4zCysHbXnZscWWd0fxh0MtnF6O2P6LN
         CNIdHYQHKLbBQHrsIwz6Pqa1jlg0BiGUWGvpvQq+u9kJb42KbntQMRTgp3DJOqn0JzQ8
         YXhZ6dAvB98Z6bt6olqkTfW17io3ZhFAD6RyBxsS6vq6f5gjoojkEJs7fBr8QWfr58ZY
         V/BDtrBWifE0pDpzOOCZnCBP1VNA/aFR7sCGXdR04pDbBk8v0S2WOhyH+Yggl6TQ8zgk
         cTxTfux7Ri/XmQqfPMUNtizejMG+yBKzmHe1+MpXisVYm15T7MsN6kEQKsIOtEk8GvEb
         GuPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786542309; x=1787147109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x0dBVTf1+zsv5GhKdmDXrH4C+CVNQ+zjeZPwcZnyxXY=;
        b=EZbZWsM+aGv8nYu/Y7G5QME2XplVA6T5UBNF/v4gJfQZL2nyJSjRIoXDlEbNGIiLeT
         JXpbA2OmB3w2Yu4510KWgXECsSzv2imtCBvQnpmwkyG+2dB0A7/WaMR4QZpV5cyPMSo7
         lFzPi+Ou6kjB2gOzMSjM6Wx2+bBLKVecKS0NEyKQT79hcVwX/bqlinO1JIl8E09GZZ/7
         MlGoGYAnr7el77kA9d4LX9wJtjOERmcKgA4kM2w7rL5ewvGeQiJITGg3sPiX3HAnRTlJ
         xNbC5OkwJbJeXlkwA4lB1Ssg+CuFkQQQSjxSoOt7qtHt7FFqmHMG3H3yqzJRtf4rPAtZ
         ah3g==
X-Forwarded-Encrypted: i=1; AHgh+RqzG4BrEbil+tfx8NI5VeOHcCdzOcxFCZcb3+uaVnmWvvS4M7NyD+24PRbt89eNVZQC+fiuBoDTY0xgNwIiSfW/@lists.infradead.org
X-Gm-Message-State: AOJu0YyEh103b/fmjlzGhgasryPnBnFmZVf++39B8BM4Po4igcLF3Swy
	Pg44Kz6sOSFd9GroMh+gqSQqE1Hi8mykmkB3asCE81xs4NcBOhIKmHqtJ18kSCxrd4BBVYypyaK
	IlYNySMfziQtuWbSBdcrpOQFnkQ5SyZz1O6mXuVaO8ROj18JYHoZBMwockYiPfAVLT3NtqPphxU
	mHFA==
X-Gm-Gg: AR+sD1039nXktSdt33m8/IPf1ulZ9XEbhI/9jr3V91c9teB1Nh285KM7fmhTtdPHYF0
	D2PCfB2K3NK9o6lCFsgf0wMg2bJgxZEnrhuD8i4iXBzJAxebodF4hc44jDHZ7W7HHgOcHGf1t7Z
	+ogYQ9o46z8VdslHZYMxmD25Fbjw4G6rGbpwSEC4Ha67iOI4Yx3n68FtYM7Z88s/4WaH/XrbOwx
	WiYVkh5+V2IMROJzh3WJTY5MeY37ayyY47umH2FoVNYtye6Rmb801y+91DMP+zUwceTL0nKQsTT
	cFzeSFK7Tn744mDi17mJ5x00pwivWaRjHG/aSQGPG3QFsKIV0mHaEgCE6j9V0HetR0mz6oWi9ML
	CVbs/yxtvAH7Zi+0I
X-Received: by 2002:a05:622a:5989:b0:517:c65c:4987 with SMTP id d75a77b69052e-52d603668acmr73266051cf.22.1786542308996;
        Wed, 12 Aug 2026 06:45:08 -0700 (PDT)
X-Received: by 2002:a05:622a:5989:b0:517:c65c:4987 with SMTP id d75a77b69052e-52d603668acmr73265111cf.22.1786542308419;
        Wed, 12 Aug 2026 06:45:08 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997c993d80sm52793265e9.12.2026.08.12.06.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 06:45:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] dt-bindings: usb: amlogic,meson-g12a-usb-ctrl: Correctly restrict number of resets
Date: Wed, 12 Aug 2026 15:44:57 +0200
Message-ID: <20260812134455.179663-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812134455.179663-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260812134455.179663-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=868; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=U3em6SwSlj4KrC81ebU+WoLSGrV9Shrp6KLnWRxbzWQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqfHjaqHSxeEusnijyOY1RwQeO1BnEIQ+M+NAdc
 bV6gEOLtCGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanx42gAKCRDBN2bmhouD
 14GaEACRSlPlA0NBNuIWvVPMZrLNYeUN/QZxBfr4ZzHA5INaIbkJQ3HToEpxIUjfiqfsEtvAV7o
 xlXprcj+0OewKUL1R1L9IJEwM0d7Naqxff1osrSCMGMyBr0oUg12lyGyJucr58iUnvNbpK25OfP
 /tli2TeMjx6BCHhZ/PfdlMcAPfiGWJaKC+i/hREwXuTptikahwcZ0NvJ1w49f0Gi6m5a9Y1qdi4
 YfDITaR4qnAfGh7iOxSi1LutiT/yeliuFlOcIdNVG7CFWcCi2fumTZBjfzhHSXGnUCeuViQ/kVE
 RB6ZRGsxMRru208hdYgBEfJuVQktRxhJg1Q4+0hrKhcUfDMd8DjhWhl9qOIRskpqnahs7+mRbgq
 Wd1bgr1ELgfIsDt5nawmkybHYiTNlP6LcbvYc4x+XOXR7ywsCtBE3a2OKXOLLVaQHxhjFYCJgwv
 EAvPF/MBP7qvBL318Soq3SCFU7k7j0X45c795Ap9J7V90aylQ62LNC5j2oSgU17e7yTpkawJyiX
 c8f1ZAZK7lc+WNnq/iZKpQkAyRhKjPap0DDiErYr2ZCoCMin4H2tg/ERqoLM5lkqN09uDvMido6
 wCfvBClZHbNy4JaN1pfTD6Ckkp9HM3C1uwebm14Y3z8un+AUFrIi4E+A/6u3nDj99Wufztqv3Q/ lYxeE/xPFwLLu8g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDExMiBTYWx0ZWRfX8d1NlS8H3LgG
 ms7qtq0GbZ/ya9QpxDZ9WzLaYmfCrWOP92ZTXRESSdq76BNuAAbgQh93qKXGOJyl/+HSqWw6nNR
 RcfcMrormw4iWoAbA94esFzV9BpRHza3hR1qzuXi7t+miUOYz8ZC/r++gNJfp6HkAJPN4CsJkV2
 OhGhixcPra+I4koZOgy0h8psWw6ZByrrUMOd1qY7ASFDym5NitxCq2R+h8QTX+XFwuZG7QShlR8
 DOKODKS1+uGFA6CKJOlcmPncUZQmmQ7QNZC10ZVlhqpifrxP+a89RZUvRYodjPdArXkcVsxHeEM
 1W9568ZXOL2Y1DKQw5wfOI5WphBeZFtv8TB8vRKtoc94iE5tagQyBv5ZAM+xQX54svWEGEeI1Nt
 LjJNdO0bXyhesOUQ7YSu45kya6Go+7h0tNgurYrOS7kvXeZoGjG1JMck+Y8hY1hGRUhymVfHvBF
 lZkQ+tmzJVq0Zxd6xXA==
X-Proofpoint-ORIG-GUID: MBg53M9gwL_3g3YNwyKVbEZyqQ4VAZGk
X-Authority-Analysis: v=2.4 cv=TNJ1jVla c=1 sm=1 tr=0 ts=6a7c78e5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=GaLJoJCzB-nc6VTDBBcA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: MBg53M9gwL_3g3YNwyKVbEZyqQ4VAZGk
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDExMiBTYWx0ZWRfXzFKnxgQVWB95
 PfTH2QTqbeIw8r2rCj4FpJ63PCaT9RpDwMB1hnu8eaQw1CT/TlKH0IeC7HqXEdVctKvJKc25gdL
 GNEQYSjYYWKtn7kIXRFK1eY55srBkrs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_064510_852844_D8E5F3BD 
X-CRM114-Status: GOOD (  15.02  )
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

Add missing upper bound of number of resets for Amlogic DWC3 wrapper
node, because "minItems" alone does not imply one and any number of
resets would be allowed.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
index da757c1155d4..b0ea8257e1d5 100644
--- a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
+++ b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
@@ -53,7 +53,7 @@ properties:
     maxItems: 3
 
   resets:
-    minItems: 1
+    maxItems: 1
 
   reg:
     maxItems: 1
-- 
2.53.0


