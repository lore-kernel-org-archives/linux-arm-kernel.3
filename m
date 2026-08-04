Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0519CC55ABC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 07:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JeGckGAtU2mBLl8s4aGiYH7rSeNEpn0PkB09bYxAUWA=; b=IZeDAsy7y0m+5hdv+lnl9sM15Q
	5V1YSR+/uOedDxLgaFJpH937Tr8p5Ldy53B7mNR+Tc0XL9mS22y77P65hDscktBEp+zc29IhzXofV
	QDAMjsmPXnIUzkk9TCOmrHJqRoMcuajf20ZQ+JCCoCx1jqRw+zwYsvRO0lmAw42BjFdWIMBaR9q0J
	IuxeLnhLXTz8vuPnVTyLxnsLXNO8Gj8lT0YSovKOPmjpDL4OJo2d8vtH/Tq/Wr/gfsPEz7kshQFY1
	fyHhNqDhz2hhwQU5jF5MJrpMUSeIl1/+o992pz8CLZpj1cOkA3zAyf6H0yV5rDDKByfE8cIXKn0fI
	fjQZZmew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9Oo-00000001Cow-0pEb;
	Tue, 04 Aug 2026 07:17:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9Ol-00000001Clf-3HqI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 07:17:17 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67417RZi1670140
	for <linux-arm-kernel@lists.infradead.org>; Tue, 4 Aug 2026 07:17:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JeGckGAtU2mBLl8s4aGiYH7rSeNEpn0PkB09bYxAUWA=; b=CXiPuX2s/89AYhpy
	2QSuJq5nmOgj/EecpJq4bb7CzZ5YNO29lTKakdlQryXtbYs6WxOiMtB16ghW0i9Q
	PXDokzH9VN16EWq+efj3M8WK9Gb5cbzS8jwhGVak9ve4O0/p7RcPu5/buWrG3DaY
	8uDb2oddpp5st9lt+fPjXyrLvK6yd7G/AqNd++TlPGA09JsF/B7UOetA+tkjITIA
	vG3gOPAvzDCBiMbWcNjENkWQHn+VGw5U530obFJB95WGuY8/ANOgQHpdPOqnBkb1
	wo2CS7cgfP9iY7Wricm1hczUxKEC1ni6HBOzSpXVLmMGW6jAUzptsdDTmeZZFoG4
	U4Px0w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftx7m3cyp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 07:17:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1c7f135bso74688711cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 00:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785827834; x=1786432634; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JeGckGAtU2mBLl8s4aGiYH7rSeNEpn0PkB09bYxAUWA=;
        b=LNALE5KU4a+SvqT5/2XtNnXFd7r7ApOhPockG4yO6zjwIPiZxV0/sanJPzwWmKD2TG
         uwvCwgyat5zbCDwMENXOl5Vb11pQjrJiGEBP1WTAtuLgICx7FVum+v9U298hKQJjP5qz
         XBEfy9jc31d+ILAAkfUItyyDf9rH3H9jec3z/Q+nvvCm1LRHlASbwINYgvKahMargGnc
         3zb7fVk5t6RkgoUJW9+w+UXs85gBjhe1gcDiu3nqnMWZf3rfMBpzMtkjwvq5WG6msJtK
         SlGI/n0zp2yBrUBFs/JICDu9pYJw3/Zvtv4dyHZ5xS+hXjW8t/Iu18n/UGjg2u12elAd
         7KYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785827834; x=1786432634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JeGckGAtU2mBLl8s4aGiYH7rSeNEpn0PkB09bYxAUWA=;
        b=i7vxSzQA9czeVrhwRREa189ARdrC+OPLIVM8EURfZzj0tJWarCwcT74dcgEw8swUXf
         R4oDTY00R6Yvm5+GQs4WEyOBwI+asI9mUH6E3aoemNvRIocipTdO6AEuiCyMbojvs20n
         zv6k1K+tj+AUnGB8WMu0h0WE2tGpBNd0Z8RtSgWJHPLxQrRfdg1M3EdvhtZPQPbwpmZL
         zoN6uHgtbPNo+I6AjJdZvuhPa+E6URw7PS74+qFO5nIrYeYgAp7SblQUkMoGNtR4vmsa
         dFl4ClpgAnSzqeB4CyGlmC9q2CD62dOOklib7HGv9hnUxjK6QQTBsIfP6/WAtn1VMIWC
         Qs9A==
X-Forwarded-Encrypted: i=1; AHgh+RrunVgRwAtTglXpq1fp2+Fw0hN5zTdIjPWRBnz2YgT9AweBRlzR/PUGGsJQA5zZd45CtLHEAbcS/mEpRDiovBfe@lists.infradead.org
X-Gm-Message-State: AOJu0YyFa4bBI2j2889+L0nguElQBa1rxT7bFi8CCScJAhu5hPgjtBNT
	vJ4WDNBAJAC2ZHqPnAd9lfPmHEj5k7LsOZXmzNxc5MS1s/F0pTfihaf2rFAXYsmV05R8FLlNzr/
	q/C8Wms9PTJ9WhOrOyGuFwfx43DzaUKidH3kBBkG/RdG01Iaqrc4pMKEx+zMNdZvX/RpQCPKqOB
	PR2g==
X-Gm-Gg: AR+sD13z3q4HikGNkT+hh5dTNSJ+7B6/eFTKzXG8ZtGI0L2dpB0XSDT/PmcrVgfedip
	DLKTIDlKsdBbD7r24ldR7mIpn49L1UWJVD2NNtaeJeOkgQqrC+HEBttP4R4IU5e1gFDRgjYumDo
	NXDbfRjvuCXKkoJqVYtOMJujz/2/kyexbmY2PQ+3NTzU4hpWPqdmcOXIKZSlzM3ytiTWQtgbGul
	IpMmBq5kotrA4bKr4Ye4UKFx5FT3ILp3+Pre3QpAC9Dm3cKR0mGPVRssu7VljV50u+G5PtZPNLK
	3ES3i7BY0Q7uV44N2eJwLonXbBb+KcevaErqB9ML4QNIHFTcZWttYHw4xb+CMqYxWQkYTO3pwdY
	Yr4T1UYz8/OoWrA+AHIj+oUdh
X-Received: by 2002:a05:622a:5595:b0:51b:fd82:22dd with SMTP id d75a77b69052e-52b566af237mr277720051cf.15.1785827834410;
        Tue, 04 Aug 2026 00:17:14 -0700 (PDT)
X-Received: by 2002:a05:622a:5595:b0:51b:fd82:22dd with SMTP id d75a77b69052e-52b566af237mr277719731cf.15.1785827833975;
        Tue, 04 Aug 2026 00:17:13 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b8d04fsm420265975e9.3.2026.08.04.00.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 00:17:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 09:16:59 +0200
Subject: [PATCH 3/5] spi: dt-bindings: axiado,ax3000-spi: Drop duplicated
 type/ref
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-spi-num-cs-v1-3-4ccb13dcc7b0@oss.qualcomm.com>
References: <20260804-spi-num-cs-v1-0-4ccb13dcc7b0@oss.qualcomm.com>
In-Reply-To: <20260804-spi-num-cs-v1-0-4ccb13dcc7b0@oss.qualcomm.com>
To: CL Wang <cl634@andestech.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kousik Sanagavarapu <five231003@gmail.com>,
        Vladimir Moravcevic <vmoravcevic@axiado.com>,
        Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>,
        Prasad Bolisetty <pbolisetty@axiado.com>,
        Karthikeyan Mitran <kmitran@axiado.com>,
        Michal Simek <michal.simek@amd.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=822;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=WInEgTRazKi1bnlKIV6gud1U41TmUr3uidmStQ8pne4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqcZHt4dXqcY7dKQHz9rLoIIymozNceaLW8siy4
 E3lkXhNbwOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanGR7QAKCRDBN2bmhouD
 1zYpD/9OR2DVZGOVqQbA0kbXFA13Ja511qlxI0xkmyZKhih3Sdzcab9fYmwvHcKeTck5PYZiu4E
 UyEaeWzO0sKRhrq42QK+q+a/LluO8UAHaPKAPXiXF4Bsnd2pyKqGvvBnNCle0UdFONEyp7pAkfs
 lRvBsG7ZRpki7brUZxt6SRCdY5Y60CQujodnsVhemcBLvHn1VgpkyoJnXhZYc399ANWWGet7ZRO
 p/wt1A5Ph6utv7FDcCrL4QMtBOvEtZUUOJpc8aCQT53l6HTiRK1uS1tgYr5/GvbbPkjF5aVK/+5
 7XeGGu0DjHNuAI0Wfkuzusw48uLaKZ/eteo/9FLZ8eqmG6b2Luc7y/COUPGW3MtdoWEAIPVzz2o
 3Kars9T1bUt4X7MFcPsC+/JcgSgE/KhQcB22gzfpiGuyNFPQ3Kdao38LeHjZmGLNOOZwn30Ll9K
 VjauAHQb7SeC83Hi7Z1ZwqIH+/xIALFCd2tivfsYNtMBeRiyMjqxuMmYNyIt3A+d6DE7eQ1RNqz
 Q9ZmBuN0u7ndFc+oX4UV9Hjq3mFJ0E8JV2K5lHiGq1RJyEVVccvNxXNAVbdrt5WwghliuV7rEZy
 uSAW6dWo/Pel0Xt5okibP4D0aZ8iDA99CcvMsCskDdufmO6J0TOTVcWNLsxggwB4ZsXaNL8TRs4
 DPbUNrRMxd3BviQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA1NiBTYWx0ZWRfXzGK5M301CSh4
 6sEk9jeZw8ij1bBDpAG/CZjHJjSUktyOo5GpMhjz65ISaeTq+aPYfs8H7YuvOwZyJRZjTBDFLZ3
 4S45fZECCw4CI6vaCLdKApRS0NHkMCb/xPNhMpP+SFbJIVZATGMaasBOiyFO7RL+yiUZAkHqBxH
 AHHaEeLyfBed3Dke90RbRcttlRgzvYTXUDYGIdTroJn6F+0WO3HFM9YKntXLgUV7WHJ3S9U34bH
 zaNKAfG41YWVqP6egtesOjbccmKA2M0X9AOoL0u2/kF0PPEwJasE2OAF1JqZewPLswGlZOl4s5t
 GDdC9ScCx1Hjpj2FVVogHp0pGP7i5LA+Y8IPaSDNFoCzqg3Tj93M32uFoKt4grDG5IR5PaDA1df
 uLKvYkqyBYA4irNPjQAPIEprjfywZhhALpgciwvXlMypKRIooSal5zjMtSN13CkZBozENlilzoI
 54qSJeeQdtrwZpzTqQQ==
X-Authority-Analysis: v=2.4 cv=TIt1jVla c=1 sm=1 tr=0 ts=6a7191fb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=tRHPAiqlqGnVGwjNgokA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: KymTIwCog3ZVtcaiZKlnGG-HxSRZucQH
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA1NiBTYWx0ZWRfXyuDYr8a+f+YS
 mpOhrR5uNY7PFAn+hb3EMB+DfrBzvcJredcAtobZ5bGs+pHk58e8epeiBdCZFK/0EhDuhbGWSNf
 FjpDYbYZRDH8ZCdEGAmOAK4sHBdMHVw=
X-Proofpoint-GUID: KymTIwCog3ZVtcaiZKlnGG-HxSRZucQH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_001715_926385_CFD16FC2 
X-CRM114-Status: GOOD (  13.27  )
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

spi-controller.yaml schema already defines this $ref for this property,
so binding does not have to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/spi/axiado,ax3000-spi.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/axiado,ax3000-spi.yaml b/Documentation/devicetree/bindings/spi/axiado,ax3000-spi.yaml
index cd2aac66fca2..be258c1f36b1 100644
--- a/Documentation/devicetree/bindings/spi/axiado,ax3000-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/axiado,ax3000-spi.yaml
@@ -37,7 +37,6 @@ properties:
   num-cs:
     description: |
       Number of chip selects used.
-    $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 1
     maximum: 4
     default: 4

-- 
2.53.0


