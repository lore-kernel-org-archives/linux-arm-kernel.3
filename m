Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3AD0C55172
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 07:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZuMU3HRIoQauvAlgNljZqe/VSI9nMSTFSr9/NCqpk0o=; b=vdpUF1h5XmzAuG0CSWnKUm2sxi
	KBfsbNO4VHmmpb3Wr41KqhlnLVSeec8JvJ9zyKEbNrsBnye/UQouxWAKP4W59zZ7bYsd6Fh7rloQ9
	PbyNntg6EEaiQL5o/ExamBHrHAxS6udnet7P3JJC4VKqIS0UCMW3gh1Qx/V09UADN8wRjQt+RYty4
	HU7f9eo5EfwP8kGw/fDp46kyxqClKm6RPajqR71/DDCXhIDve/iFrxKjMlGSWwsj4ROvOCtQ7YB+K
	uP4tHkxU+viKGMCFdWqdez1T706HwPEy/glBgN/J1hlX6eHUCsVKmj409JAEebigRI3lhZtQw9cKJ
	oe9XT+NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9Om-00000001CmH-04ON;
	Tue, 04 Aug 2026 07:17:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9Oj-00000001Cj8-2tZY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 07:17:14 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67417RlE1670137
	for <linux-arm-kernel@lists.infradead.org>; Tue, 4 Aug 2026 07:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZuMU3HRIoQauvAlgNljZqe/VSI9nMSTFSr9/NCqpk0o=; b=VypR0j+MjGJRAhGR
	rEZZb9um11lUSFhqBe1s3ZEVMvHATOuLoMrWUaNmwIrzzpOV+/RKGw+yowL3n8bi
	pyYRb1rvIP+iTD4+pUY+kd9XpsQe99gjObuNv39hVG2hg+PPmbRtQaOGVEbNl+cO
	Sj7QXJgtuqwgJp6Bh9noXUk/bn6gMGcTp4/nuRvp95NYmY0pY/T8J2+x0sP73iI4
	o4+mEVsO7ZIdAN0G9KO+2V1WS3zL7u98/lP+CSxJ3BjIEBgjsM7GNT5Limxr3B3V
	3OZ0w5SAmHbaBm9PxvOQEn+N6K9urqSL7R3Bjbim82ua/jAcH19X9xlPFt6sykM6
	vyQfrg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftx7m3cyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 07:17:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1b4d961dso6349791cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 00:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785827832; x=1786432632; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZuMU3HRIoQauvAlgNljZqe/VSI9nMSTFSr9/NCqpk0o=;
        b=BPYdvJzkAEMRfztLEtvAI75ydrKCf3S0j6WbDoansyor8T3nOTgIqZh+iqZZoolC/O
         D4p0l7zm0xLuIXokfHM4lWZSBnwS953Cp0q9g2EQQSidUVBxyEdEgrrG228VQd4Z92lP
         lrgs533h4qF5bm+dM697xIWgqXUqBfjKp5W1dLuL91Jn/6VoN4mdWvx0vg0XPzmS4aYs
         QAzEqQOjYZ1V3Vs38p/Fmm9mfuxl2iJ9SwY/zEdeSvjJH1A1S0BxU8zNoU+xD6XoA/Ed
         9d0rRt7LdgSicf58L6CBIr4SADjtZb1G6y3LS/WfDGccDsV6vZ5BTAZBdkyr/j6w56cZ
         GkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785827832; x=1786432632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZuMU3HRIoQauvAlgNljZqe/VSI9nMSTFSr9/NCqpk0o=;
        b=kNw8ff5UDfKIulAGQMxT7fU0lZDrwNStmatpYHld9J7E9nNM9XWTWOcVk7AOqqh1sx
         ivRQ7VR9HwyCLRojtTcY2V6hj0S8IUwELRGF89StrrhZe3sc6In+lYbI7kozMAIm0xDa
         W+HmZ3qH3OKmhtoSq7SUA9t1Sii/AE4Yh2RktCOjH40IBzLaVuOEiJAn9SzcC9IvIHYI
         gZ+U+VGDpvpnNzOo94/QBscWnIju7N3i2srZgLSk8PHykhBcxWuQnZjyUFgXwRIShcve
         7hJhYNetRZRWJUqZGDBB6Nf+Xp4kFramPvs54d+26uNU7c3Z/NWM9A6GCAuE3xudh2uN
         qQug==
X-Forwarded-Encrypted: i=1; AHgh+RpGf93Q8WvEBVab7IQuAcHZWZPBkx1FQQ8w4G/opIHZTcp8KdyiUPW2LC88Bcdt5OLWrqs9hiuSb3V5p9ah5wnn@lists.infradead.org
X-Gm-Message-State: AOJu0YwxtJrKUR6IIGsUXGI0Oggng6NB4FB6ADA/MKlffitvnh7dEvtF
	/7htTnl3WVtk99RYhwvgYEBUQzY1Vqdxqbw3uDXVOB0sGod3DhcUB1sZq+i4AefGJ1oTiw/y/8f
	ljB++Vf8OECwqcJYshWV0CkON0yt9XHBUTzaBHGhtQdwFkP6Ae2Kr3AFJDehgU8E3MK+CgmWpLa
	Sb3g==
X-Gm-Gg: AR+sD13NG0M4FGfhwCjJJmV5wqR4a4sHLXk2c19kVgljG4+bIIgqvrC1qv64aHYRXtr
	9/oAAuHljuMSBFCTYbvuOUcQ726iT8j8ATspkA5FgBoxK05xpGEyVweROojx30Ccl0rGQJg4/1P
	DD7+TrsoO3ZZu5y8QeqR/CEcCZ1I2QvvxAkKyapDLq1kp6wtXaNGZ4GjNGlDCOdARqvtKLBKw96
	8u68WciIN4Pkm73TtqGwaq/ddxSQqZbA+xfUtCuFgT36mFF6DrA20XCpMiBWri1R1d9H5m5YKRe
	LHvxF79cfwfD4dWAAxebgb9ib7gfKEjn7iUXNyLczObcJu5TQlIPf1b0cA7ic+NRJwpExCIaSBf
	HjkTZ4LpDhrYOaaTT10x7hmY6
X-Received: by 2002:a05:622a:4d4a:b0:516:35fe:5524 with SMTP id d75a77b69052e-52cd3356ed3mr49122271cf.5.1785827832329;
        Tue, 04 Aug 2026 00:17:12 -0700 (PDT)
X-Received: by 2002:a05:622a:4d4a:b0:516:35fe:5524 with SMTP id d75a77b69052e-52cd3356ed3mr49122031cf.5.1785827831945;
        Tue, 04 Aug 2026 00:17:11 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b8d04fsm420265975e9.3.2026.08.04.00.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 00:17:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 09:16:58 +0200
Subject: [PATCH 2/5] spi: dt-bindings: marvell,armada-3700-spi: Drop
 redundant num-cs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-spi-num-cs-v1-2-4ccb13dcc7b0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=977;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NCCwN1szetFQ6aTYWDyorxmsLSJn745QpATW7kLPexk=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGpxkeyiitHJEq4rXOCGBWHGfJ2hH1hlqt4FC4VbI26K+8ZKP
 4kCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJqcZHsAAoJEME3ZuaGi4PXrEcP/3RI
 FOJNWAVk9Gn1G3HJNpDwNSNFxz5Vvg00cI4fzYwqELVzjKrQPMd1RqbFkOlRTo7ugCGm/ziPjrH
 4xiCDceOmh7Y7lMTZKSsCupr0rpSoJSHm1EWRv7txe26AtQfdloWkZ1irga3Dup8hKFOHSZIj1Q
 bHfe4QWL79S4zcLTLOIfweTkYSZNYRtIjg6A3hzL6YgrNy79qvOnSagJPqkz0MJPu9egGIe8VKW
 zVUdlL0VOZ0IXUe4eng7OhnDC9P2kGPDmIYQICCDG68gZXNW8gIUFbTMt8ib0k1dixTp5i/zvM2
 eo+Jn1dwdftmXZ68NDJTHks6vIdCBNXVUX/bSKy95ZQoGhI5HevtNv7ADVV5TTeTkjruEAYKUen
 4vsKR+OEkVZTHq2+TDwZ+kQEZY7hDXkT6q5NEDMkQox4x5sHPP82u1HewddLCFmz3tfCYkJQu+U
 x2EXsn8RM9knYJoy9Fpy8P/0oPcdU5nGQTMWA38B+E+qsJFq+sl8Tl8fuHV4OBrAEFX6/XHTZ+C
 LBDQYTh8LrHJ3P3TkPTXYisijSbqFG0YbiciBFjZXAXTw7DIe+EZbhroejuaBKL+rqXO7ZzCjLh
 X4Ca9wiVp0uKir8UbGmRI12LJAUzzhjA5eL9WQhM6op98MAapK+VtCTPh3WcWnf1R7kwOvGtxam
 lTEap
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA1NiBTYWx0ZWRfX0StD+p1YcQrx
 oEAnIpGggFy0rqb8mFZteexIMIIzrdCjKwU92MsePq9esyNeMaaO6DEtxsm85uWaYBgSiuZUGs9
 8YsPyyYE18+HQOCJVNFxhykx8AduuBsjAo6s/vR6fr0hc1BVcQQYgt6diSprwMw3B72oQZJ+9lP
 SJFCfmES7JTZC6HMybZg67hXacm8TP4XtAlvCT2EUOBUQV37jYdaqe8Q4kWpmejyR4qcdmgTsCY
 wvRu/VqK3/s8iEl77Pc8b1lzwDOpM0fXpKXQ+wLFKrMzLbKMBSbcUGrUJar18msn1SHTaITK1Y+
 Ake3odREJUW9JXEXBNiC0cof+6loh0qDzfZyth8phyNPpTMLLEwSSCcZh5++Hyt/ACZmOF42XeK
 zWPLFvhRMtRWOmpej4ZveyyJ8CHSPFX6jVmvyyn9GHpgCcoLe2AxHYZgkUdhu3mswEE49eqJP66
 dH29BX4mSXnUn44ofvQ==
X-Authority-Analysis: v=2.4 cv=TIt1jVla c=1 sm=1 tr=0 ts=6a7191f9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=h_P405bTkPm-sLWfBjsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: NQB3Ytyzaat5bGHRP7qGtMMZ5hXTAmzx
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA1NiBTYWx0ZWRfX+VypahbkIATF
 k6AO/+D04ugBZ3XP97Pua4SLIS7tdZxK4SkAp7q13R/5h+muZpeJENYWUeu+tSvEJjudsVunq8i
 nuhfDsWxIBzQqAWkzk4LlFIWSQLWhnI=
X-Proofpoint-GUID: NQB3Ytyzaat5bGHRP7qGtMMZ5hXTAmzx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_001713_737135_4B407EC1 
X-CRM114-Status: GOOD (  12.91  )
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

'num-cs' property is a single integer, thus the binding should not set
maxItems.  This could be replaced with proper min/max constraints for
values, except that such constraints are not known.

spi-controller.yaml schema already defines this property, so its
presence here is redundant.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/spi/marvell,armada-3700-spi.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/marvell,armada-3700-spi.yaml b/Documentation/devicetree/bindings/spi/marvell,armada-3700-spi.yaml
index 61caa1d86188..75437c46e65a 100644
--- a/Documentation/devicetree/bindings/spi/marvell,armada-3700-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/marvell,armada-3700-spi.yaml
@@ -28,9 +28,6 @@ properties:
   clocks:
     maxItems: 1
 
-  num-cs:
-    maxItems: 1
-
 required:
   - compatible
   - reg

-- 
2.53.0


