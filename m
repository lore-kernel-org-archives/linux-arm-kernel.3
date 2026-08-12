Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D785C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 13:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7ozTwiVg9+hl0WUjpZaz2ubQf+JQlxvOWQbg5M5ApFk=; b=pvoEczy38gLOEuv7O1ErYV9Z2F
	AdC9mh2YhdF99VP3RPmzrtRHjP3Kohxd6Dy596uT2t9wWiTA8Yt+/yb35xN9aEzRjcCxInGojWkm4
	Qt/x/+3B5lsb+0D/2+K2X+QnGK2qm3hB4gZxsHzfPSSBWNW2F6mNgvtel4tRu+HqiXv1YGcbmVwsN
	fGopk5K2Iz1fy51Bdr4qulgvQ9N6IopnXi2RJ7PQG8DVyrXr9YDS4T3l01zG4oJKJ57NrsrHabO4f
	k6+7I9ET3P25FhMN2f9lD193+sZxwpiD72jILt1nlqHtUmTH515iP0CnlLW0qNDOjIqfSna12ocYZ
	O7IpgK+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu9GY-0000000GJfV-2eKI;
	Wed, 12 Aug 2026 13:45:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu9GV-0000000GJef-3ptZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 13:45:09 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CDcOr03876754
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 13:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7ozTwiVg9+hl0WUjpZaz2ubQf+JQlxvOWQb
	g5M5ApFk=; b=h+/iCKZjnv/cnKLWsVPIhbnMwvAg9aGKVfDK/6aiDaNx+QgKLCV
	XM07kzAKiA11zXyPcaT1ZXPHZHKgOQjzP4pWuekcZ0lIdBV56pHJUXSLfjrUAKFs
	Yu1GuGdc5NEsiRvp2lrAqVkDgu1J0WX+f6m3SFkzJiyW0ebOvqkni5wYZjzWl8Y/
	bu6D5Y11eM03P3aHEVw6W12Gz/cOaSRGplsky4fh+0Kf1f/oJfRiMTGdvPoZRmBW
	jflXGjjvm3HGzhPKI+LNUKzHW9NSCPOm914Q+bxQi1lEaT2YOtogOd1gOFeDVc6B
	0cfFA6m8XUQ/09UaIdccEJczLx3p2/7a+qw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hj1j3vm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 13:45:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c20762d21so15279261cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 06:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786542306; x=1787147106; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ozTwiVg9+hl0WUjpZaz2ubQf+JQlxvOWQbg5M5ApFk=;
        b=Tb/7LWvkIZOYQdYzlG0WdWVolYkpY24g2fqiyagUCwMksTkc0jhMGO/kJLE2wofzph
         r4OxcRdnEOqFukcvHvioghg0KrxyVfHPbfn8PJPryY4kNe2ktFJEThNOGZPziQ9iik7F
         H+IQTM4opzzMj6aY348AFgq+Z22HGErs2t5Lkot8eeCrdcztwo5gmlihq7IFPpjP0So2
         rTUpSs7iN9acGRf2CUw/kaLjZgcOotfaJMn01RNDCD1hoOCuIAJM/HlOr8fbMODinZyq
         oPdAYAqfACPYQ1C8rDxWaJQrWEiRQBWZCjH7YWC8p9O8vZVHYWHzSsNPWZlL8j7S+0La
         o2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786542306; x=1787147106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ozTwiVg9+hl0WUjpZaz2ubQf+JQlxvOWQbg5M5ApFk=;
        b=NQ/r6sKUQz7lVSKgrJkdLLqog53Th/YGnuvp0fDHVJapJOWVYYbDsmDKawLckqrj6w
         NXPfHoF42zUT/QZzgkseGxz+YF6dPJXxIa/m+XhD3Z+Vo5jZF+FWTXGf/dcwomRD6GS5
         EPu3QJYXjInCzsToNtzyPUI1hNGv+8cv8RmMiE7fv0NryO+h5nYXfV7cvQ9zZMdKkWun
         fKC31FnuFXtgLaDjzi33TX509weOGQvxaJtO0BezbGGvCzzo1Xe+7yrVrNzg/uwzIcrP
         azlGZyelIWNYaoIJRVRmAM+hhN9WHtBX8rkixOhdc5jxDWvggiqVlBgnSjxxbxqsum5d
         QO+Q==
X-Forwarded-Encrypted: i=1; AHgh+RohpqQtLT9uw11o1PI+z9SSu5QkEoAdmMZO/a2LMWSvxQ+uAZ61ZdLbBL2VWLlU0dUSi15KL8mDi9kTiz2Rpg4v@lists.infradead.org
X-Gm-Message-State: AOJu0YyfADA4PSzg9uNxLNV3UrWSSHCNln/FH5+J7GlNx+W0FwXMIap4
	RjFx/wa5vRdakQfNt1Sb+7mNM1nNmPRRPKkOuHRl2TNoE4xovBR3PBFLPwshY2iZzXFFkU86wwk
	chUoYvLrFaEsXXrtkXbjBcW7d7cYURw68TuxzPFCEyRGsMBC11vNOWC/FuggCVbKs+LMA+Ww7z6
	55ug==
X-Gm-Gg: AR+sD12b0s7CMueS32+LufJsyKpWM5nYQNU1ArdIccRKkWVh41HWgPH+/nfw5R1iDd2
	BDIaTlVk9Sh0vogSAZ0B42OsI4AH60fF3RcVaTSUgYEl4HfQiV1CMJxFvKHwfZNm2kvFucscosy
	fKXuTK7mUEiEthBW5s/12pYdIYizEr5NTsn4WjmN2dtaaerkrtpBTcqksvB+HVNXDpYjd8zHezV
	rIoD3piw/IRLz8IqNNeKPVNY26sh63t5RiFgd8h8Nc75NlJnwyaZ/pL8WpzINk4JaGeScL7o/Bg
	tFSfpYmG0LX+M4bqzp3q0BIYqEFWR3HUX7Dp5RfKzSmjDERQ9nOhdnrLO2mhtRzAGH3TXCDK/+8
	yFC4NMTQbRV+NE8PD
X-Received: by 2002:a05:622a:6082:b0:51c:f3e:7819 with SMTP id d75a77b69052e-52d6482d9f3mr43867551cf.39.1786542305985;
        Wed, 12 Aug 2026 06:45:05 -0700 (PDT)
X-Received: by 2002:a05:622a:6082:b0:51c:f3e:7819 with SMTP id d75a77b69052e-52d6482d9f3mr43866781cf.39.1786542305543;
        Wed, 12 Aug 2026 06:45:05 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997c993d80sm52793265e9.12.2026.08.12.06.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 06:45:04 -0700 (PDT)
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
Subject: [PATCH 1/2] dt-bindings: usb: snps,dwc3: Correctly restrict number of resets
Date: Wed, 12 Aug 2026 15:44:56 +0200
Message-ID: <20260812134455.179663-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=989; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=dHXdSEWJo3Fjmi2CPPFQMv893oaZbPDhTb0Zj+OIl1Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqfHjXSTfXOV4HITJSOcYjrngPqPruu9qzNufO9
 f1A1xMOydqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanx41wAKCRDBN2bmhouD
 18YRD/0RZH97CUS5pDObp8zz2sZPR2WGr6sqRsKyMGxXbTa0Jf4R9Y4d0NS9Dia/oAuUiOoJJQS
 4RBY2jUH1v3SBqHOiPzzmwwgGmSoolkwlxEwfXtqbUh1XUH/N40ZwoHVKYTH7U8lv3ehhnoU+Hq
 ckFuX6smhWRrWZxO1Xs7YWmgbdyh6SJiLXD+z4FZoRbPio29gqoqSVrss1kIv3Y3BY6djPQHKHV
 r7xP64OY7XWA8RmZhD5eDNiWV4StHhAOvK956kCiUSsWVxQvZVn6rbV3x7ccW5jFFNi/YICAj38
 UXCIoPC/vXw/cPaSCVpsbguMGMdTJlkn8B1Nk7Hsay6MqhqQXXY5YKppXaxrrjvit8KcTqZfk6b
 +6bi1EVUsbRI4//+jDp3cLpwYiLwcK9NluozhFPZcwrMRN99pLAs+SJQrDUnNFts/L+uM6V7yfg
 qisjVbh+U58iBC66zZlFZvyAX6XhjtBwVCq+bB0Jo/SqLrYnA8flGPaGz5qQJ1DA9m5/N9XOvcx
 raAUUenaSeeqxd552EOTA2LEftoXZ52zsEgV2/SsxzCmjmj5XX+pyZR/msibe+DlRIq4FV4h4B1
 ho8HosizCz1KJkpGMtyr6qu1IBSwHRUJvyz/emm2VTznUKI4ZU+dtg994K2/eANSMhhsu1l6gsY CD+u/oBf7yL3X/g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8Yk_NZr2eu9Qxd8mIoxwUcEYuaaqQDWs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDExMiBTYWx0ZWRfX4spxspM8XIoP
 kVVPXSMDlo11iqZdx/v1ZXIuWMnUuehrEjtSdCH4MOVgloR6CXTQDKbxidV4yq6hbyGBEBf4H5h
 5i6Q94Kw5KNGWP7SgIWJEPKFRlX7GYERPGKvOYh6Bad0VVgafBj29EkXz5DN2/Q6PK8EH2Z9USl
 rzzA1uGaUvRaPTCmLspC9dVABWk9fbFJN1N45K53q6d6tHmlz43CVKD7L+Oz/FOBW1ftyZDnmss
 n31IkeDTMnUM2j4xe4i0L6tZo4f8GemvnP4y5J4slz7SfHInXIrFpW9ybv85t9jq7m5qBsa5COG
 /DDSEMM6XPLFY4oUg3AokazhVuKVa0LB1Sdtkk32C8pY00p9cnzUQShUIpq2vs9cUWgIXkldC3T
 i8XuRRie8zt/mKUwoZcvvGQvNmi8G3XVgpG5crrjptQLdM5AsAsS717wcU03D283KLMrqtp8bQm
 F/aXTWifLttMtfAia1w==
X-Authority-Analysis: v=2.4 cv=K6ES2SWI c=1 sm=1 tr=0 ts=6a7c78e2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=F0jcGj4a8BhWEZHBF2gA:9 a=ZXulRonScM0A:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 8Yk_NZr2eu9Qxd8mIoxwUcEYuaaqQDWs
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDExMiBTYWx0ZWRfX2tYksHaQgCbb
 gBwTed3Hx/LA7A/II0hVBh/c8Q5uWLacjxICbhAfZxuqv8KtmBpv2WhwcaY9EzYETfKaz1JqbUo
 YKR9EBDRpUNVwVunL2icSfUuBSYOkR0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_064508_061558_C5EECDA7 
X-CRM114-Status: GOOD (  13.63  )
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

Add missing upper bound of number of resets for DWC3 node, because
"minItems" alone does not imply one and any number of resets would be
allowed.  Ideally this would be restricted to "maxItems: 1" (as in a few
other bindings referencing snps,dwc3.yaml) but
arch/arm64/boot/dts/hisilicon/hi3660.dtsi defines node with four resets
and a generic compatible, thus make this one an upper limit.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
index 4380bb6fa2f0..6eb6a823bd56 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
@@ -74,6 +74,7 @@ properties:
 
   resets:
     minItems: 1
+    maxItems: 4
 
 unevaluatedProperties: false
 
-- 
2.53.0


