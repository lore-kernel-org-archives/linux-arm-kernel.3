Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 315FBC61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 10:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1G5/5gYVXEXCPKHHHcZdLaqGYg9k7UTUSZA0KKz4mo0=; b=MNSeeTmAHMd0WR/BeExtlIZ7YY
	CWNngnBOFSEB8+oqwVyPfDmWETAFs9ii0VWJq+nEhMV+aMNz3v/IzdfaqMbWqckGbndmIk8tPobP1
	Wess9jRaZEtFbwuQg7C56dyX69XKnbfqGVAjnbqFzFZhQs41u8CrGfok+bZ/4YAJ1bVZQzlSt+w5+
	cuhpj+s9nR3XKKv/m2f6KWEqon8HbtEfaCMiUUgUHLuOrIoeeWsse5wan+rqdd+WHLloMS5CJ2eK9
	FK2TKy6NXwX7HlvRiBLdgOQe92trFxNPKmDb19spVf0FcCfBcus1MnMT+Yz71P5bLFnBgjkfEC12E
	9mW1dysg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzAul-00000002IZr-2e1s;
	Wed, 26 Aug 2026 10:31:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzAui-00000002IZL-2Vfn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 10:31:26 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGr8e972289
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 10:31:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1G5/5gYVXEXCPKHHHcZdLaqGYg9k7UTUSZA
	0KKz4mo0=; b=VOt/TWOfyobZ56aTJLApPpTPwkJ5qjPBQRsCRDuCZDx7SgsXdc7
	/ke8ZTUPJ/xdv0cYF9Jhw3zrwbT1k3Nz+RlhI0wVG7TRDyWWMqtCCuohJw20+iCW
	z77kJtx0TYXtNpiahz3HX1LWu50czvXggxwla6eRkSEfmXJ74tI30hYg+BgQoIF/
	wvVluIQsUxmeKQBjsEax7iC/H3sutYNFhLM2n0IyLvDoVdmojYdLYhR47mEOmd+D
	j+Uq1FGvG78S9Mc2MtD4VQsShb09aoumshlWuh1ftP2Yc90d0wzCYugIuYUQ25G8
	tu+1Qukht53SuhoLRLSeXq7KmHKpiTwrIXA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r1ghkva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 10:31:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c01ff996dso7170011cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 03:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787740283; x=1788345083; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1G5/5gYVXEXCPKHHHcZdLaqGYg9k7UTUSZA0KKz4mo0=;
        b=dFwHA0XT6E77JbQ66vut//wnQdmQijV/iBz2bMcn9aKeJB6ICSyyz2652OJnO664TG
         5YgO2JQNMUm7LFCPrdj9lAzYKWiIXB8ddZHK8fO7wFmqgSR4Zf5ot7zi4MhakRWdWmcW
         /FCy5hIfsi17fnu3EGZ/iux4rnzvlj8jKuDRvBet9D7W0cDS66KwDTVHM5keGL7N5f7e
         wEJ2mKg0D/VmX39q81kIBgLG4/Yaxr++4vOLVV5dISgEtmiRbUdTnykngYudm5Q8FAIC
         no3NIesiJDqAxRJMvTvuj0tMCqPQeT1eaEvZX98TnDszb/DkCydi3PHvoWY00kRVZGjJ
         Bglw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787740283; x=1788345083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1G5/5gYVXEXCPKHHHcZdLaqGYg9k7UTUSZA0KKz4mo0=;
        b=hnTdr8PZyaXu1FZZkTuGWrDIXGc43WB7di0EElrMR+2T+SxINMqQB0/qdbakfSP9oz
         56/VfWVgv8ib3bO9Fes7fzf5y9bWaSfv8qCleJW0bZ4OI0/TkAVGU8KcRxU4oG9qyhRP
         uwSgRGGuiNKk+G6KLAg+A71b2YWYHop8D0HwZv3tP6aKIKkJnuKflgA5/7bSDkSs2tG1
         LAgKMAWiPdLbxgZxIfW0yXZl4K096D7jVkCConiFyp6r9akWPdKIgAI9j2mz8yNg1tbm
         axd+xnLnB3sXmrq6sFZ4S5OwWRXpfKftQFNC1sdzC474qwhLZNKr0U8giVBJnCEVIzit
         cPTA==
X-Forwarded-Encrypted: i=1; AHgh+RqXlgVcb5YjB5FvVaTAxoF3AvRb9vfG12F2YBUxv2qltWbFjCt4mJFM3R1QxhdP7CyszOJW71SHuvnI3fpmMX3v@lists.infradead.org
X-Gm-Message-State: AFuF++kV4tGXHd438d+KJ0b6vrqbY8QRSr4Bt7NP/3tUgwF55F7XKNGN
	nZ90FxEe0Eyt3d499OWz0jb9R1IzguWRzNguPPEI//6XS+HvrTYZErd3wthRYSdBfZi34yqtL+x
	BubctYJEHw1JYz0VOQzSds5TWaq7djd0UHjj5JjDxB+5JISUrbcGA4jJioecnSTEoh6qx7GkP8M
	3mHXY/82qOTQ==
X-Gm-Gg: AR+sD12+gVBUsqgLAkQtg1kAzTyxQ4ICh6Uc6BOlnjHPwq6WvsFTO181Lepappymi3J
	Z6XHdA/RAxTmQ12H7m1dZWQKQTBsFXR0s5p9VllAIJejwbNAAYWhH6hTaZMv8nW0718es55UBLl
	2fke721zmeuVopxXDs7UTF+oGkaMgwTVsYOdWtPKb56Trp2oyKAPQT5a/lUIKRFIsUaV+ONFXft
	B08z+z5KBfGdeTlD+6Imo7R7zlqP3JEdHbPzNjahjmTwCTH2OE9NBRiPcjIL2Jh/CLaV1QHmWZn
	hbp5Xx2d9JRYLO16u/k7430LXnPFTHQmoGGf3hn3VE+cShyJMAXCfq9KyS9IZkEbNuVv0h/mvCn
	U0AN1Iu4ZXM/J/ds=
X-Received: by 2002:a05:622a:1194:b0:51b:cdc2:fb99 with SMTP id d75a77b69052e-52e423221cbmr49164011cf.24.1787740282745;
        Wed, 26 Aug 2026 03:31:22 -0700 (PDT)
X-Received: by 2002:a05:622a:1194:b0:51b:cdc2:fb99 with SMTP id d75a77b69052e-52e423221cbmr49163321cf.24.1787740282195;
        Wed, 26 Aug 2026 03:31:22 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ac46sm468967166b.29.2026.08.26.03.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 03:31:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: i2c: xlnx,xps-iic-2.00.a: Drop bouncing mocean-labs.com
Date: Wed, 26 Aug 2026 12:30:43 +0200
Message-ID: <20260826103042.147735-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=909; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=2OYBYuITn3psg6Z1HtkzObrYTcYJqG6jhXiaM9WxoEE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqjsBS70xtCJ33tyNoF8tp1JvgWm9eIpjfeILnp
 NS8EYq0S9aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCao7AUgAKCRDBN2bmhouD
 1+O5EACSTM2gnMIwQuOlA0YIdHhC5/Z+dk6m2aO1ApbctozEXP9FbIgmhVfdd2ekGf2+wYnzzI+
 D5lrYd3yf41lg7C+fAugiwx6ogmMgtt9niUXMaJq38OZgpmc/cW8bNK9Ppg3PTFRLa1JWauAOhT
 IZQaZDibVkaOyiGdUFI0cpwEm/n9BX2+5d37Z87JAkLa+OtUzWYEshw2NX86BRyP7wrcEuIOKCP
 WCQf9s14tzGaC2PVYcfpU5QqxHc9xVzJGISaGCX31fjMTDeKR9woimFPAVsT5dfLHJ3FJg5HTWk
 /Pp4rfRjDwtSfcVsOO1cPldW7PAayZZEqmzUp9mam/qMVnYzJ8H84bCNUSBCNJJZ8JRPcUficaQ
 QJpzUCvnFpehthymqfblKLwZjebNZhkyxBDr/uHMCuFgQi7i15hXZh0Z2HhZESgNz7+nhbgxai+
 YfRmCEwwVdomGTEh7KEKgawd3oNmiFoBY9KUDlXyBXDzQLkQ5zlt+F7Nl8lLfmFw5Sb6RS9EVQn
 RP1DkRnvv6IBP9r3abpaJJ/rcjpSKOqE69Ok+F+dDDb0fae8WQmmyYsFAZm59R+RkaEFZSmQa8u
 Iex/9Uy95SDFvxY7KgKbfqucJq9th1iov9jK/eDJVw/uZdi/My7BR2wuTWy7RBzAVBKt2/4hT8L OnC7XGeV7BisYpA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2imx94DtTIlfQMveMvkDRUf9nGYC0OMb
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=6a8ec07b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17 a=ByJN7JjbAAAA:8
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=zd2uoN0lAAAA:8 a=3T8SOkedFoCXeTbM18YA:9
 a=dawVfQjAaf238kedN5IG:22 a=ruIbMKh5GUt7Tw4v482g:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX8Mr4OkNSZGvv
 Wc/T8xZKOV8MeGDzn8LJTe0xc2IJJe93tnTmyW/Ypmnf/z+OVzr/+qePc8YvfHhWyiEa3SGSnHC
 PmwrCPFOQRgzuZG7Gc+g90/ocvbk3Kk=
X-Proofpoint-ORIG-GUID: 2imx94DtTIlfQMveMvkDRUf9nGYC0OMb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfXy46YHdNA8d/P
 CMYPFTlxpUEGMSh1NonzBwOMa2zqYSYIJMctTgeSCHcesrk7MJm80SfdBlQ89SRChah27x5jXLO
 DNE+4UfWq4z9a9FRIQviuGYMpIKB7bgcXVHGBU+WUD3ezOlhVAVKYDeElB0moQ/WvuBS8JYDQtc
 kILlSW3KC+LojgqCXn/CqJqF8sSRUjrPRnjT9gR8V9ZccM4QWSNuu97Wc0hrKU7Op8OS3NVhUP0
 /Weu3JIybFqY1e87c5wtpFKZbxZj/v3ECUQ6UjlRPs4bQvi4/VTT9fm/v4EWdPEY6ymxKDJN0h9
 tH5cUhV7CkWrEOWiLbavweKO1SJreShRIzDRRmRYC3z2JNnHpgN/cKLgrutmKdq4JCurzcKsFo5
 FB6+4JhNcxgrt5FV8Wia/XV4EmjsUGftYg+umByTgnjD4EYsBjH+zYE9FeqT99CK1KkjpuvOnud
 nV0dBRzeHln0rClZ45Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_033124_750370_46B18C58 
X-CRM114-Status: GOOD (  13.12  )
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

Address info@mocean-labs.com bounces permanently (reason: 550 Host
unknown), so switch the maintainer to Michal Simek.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml b/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
index edd561d9733a..57caebe7af35 100644
--- a/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
+++ b/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Xilinx IIC controller
 
 maintainers:
-  - info@mocean-labs.com
+  - Michal Simek <michal.simek@amd.com>
 
 allOf:
   - $ref: /schemas/i2c/i2c-controller.yaml#
-- 
2.53.0


