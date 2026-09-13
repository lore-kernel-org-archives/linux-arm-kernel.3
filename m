Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2880AC88E56
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 12:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1FVSrZSbeNyVRI9EfrOQ8L+0C/xAEcmVpw5vCQ4NOu0=; b=sXMnmnIOHJHF800G2MIBEqi8aP
	DiHtiKilOJK93eDBuKPVXsNtz15UOpvLRt/S8bFLXAbd28sTUSa/exmW724NdMSWxJaICG3T56xjC
	nJuLO7jMS0uLBxKxmG6JD1raxepwrh4GyYsddbuYVLT5Wc+gJqHNy48/XkIQ4tJs2rJJzIAkuXI+g
	BH7YQjHelibJXfNVhY8VRJxUSHaYz+KA6LGDZNi1jDSiZqLGJZ7TL6PWD5lTr8alxNaLW+hhVydtZ
	DiChWQhep6x+WwSgO050kKtw2Hsv3YGt+IMLsNfEsfyLu2gac4KQX0d2vbCJl7ZdnVL/tevuPzZjq
	BJnvHoNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5jOJ-00000001eHr-22OI;
	Sun, 13 Sep 2026 12:33:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5jOG-00000001eGf-40qE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 12:33:02 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DAU2ZY2053440
	for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 12:33:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1FVSrZSbeNyVRI9EfrOQ8L+0C/xAEcmVpw5
	vCQ4NOu0=; b=ptoIEYc8lKy8y2QRKhUWP35dclY9m9UbCFlai3AzPjicmpj+7r0
	y0ktnyGz6g9aENFJemMsEUz7VhucT7WyPkfeC7K2pKXazaOUf/k+DWKNMMw7YySp
	2WvllfqJmSqb8d+qLyAab5J17sKaQZGXu2cX2fZPg8NCm+3EXV08/qYyQUHQbno4
	snHs+PhFlOV5isOl0/2hfqwdmEOtzhDyODvDGItfrrjF9SQGvxyEzy3uLOdbiAnO
	QSYTwCIrj5shipz3kOORPu8C4r9LUQGmAiTAYuAIHBZ41GlgyaNWTIslYZLlRQ8e
	A/+qrYifzy32ipNJt3N+K8EtUF10CGx1xKA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dk7gy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 12:32:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93918756165so459793885a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 05:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789302779; x=1789907579; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1FVSrZSbeNyVRI9EfrOQ8L+0C/xAEcmVpw5vCQ4NOu0=;
        b=VltrcuhyeRb6QNy5mUlNQIJis3cKuLf+Bm7n3wyebumHhcE2CibfOFN2G7lAsKYS0T
         /0kd5zKF9kEvPdywRPlk7XUPOp6vAwdESp2MwVMdRtBrtMpfOz8fVVH5l9uG2BFmo9yh
         /PZnsbWKZ1yG7rxE2Be9orJJXMrhw1gaWGr/qLKKTo0nNhEQmWdm2l/GfPRQJPd1uWRb
         yxf/LSjGR+pgc5K2vWLP6YjesreZhXo+NEqMm7jrYxBbgkNz3Eswc8L8h7VSEClOljTU
         cg82Y+x5TGkmRLAMJmM7lBWrABQRrhkphkCgrS76X1wV+6/9OkkVvkCMk3nTCvHhiakd
         PJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789302779; x=1789907579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1FVSrZSbeNyVRI9EfrOQ8L+0C/xAEcmVpw5vCQ4NOu0=;
        b=niWB7HGW+l5nFwRR58IEkuUEdPKOPiPtJaBkS6vBmzqRo+m1x3DNzEpsmNZVUaQ8bd
         LcVe5hj7K2eXsrHzO3KZGORXr/YiOKGryRAQYRo0qqsWbjGkrrmemCW58oiVkHlR6k1z
         VbTnXNs7YeYvacvecvRtvXmHYeH8Ix7PUWqCA+NH0W7nty1c29sj9wDoRAStm51M/VRC
         dqArav+6Am11ahhYQesRlqysqgiKSCWyunpVyljknFKEhUJ7lxPaEEGagO5o0mP83zyy
         o51ZdeX10TQEFfoMYLC6Toj+jtVkAw7x40a/zCYwSM/NWwXlC4+wEcSsPYpTt+Fl5uT5
         2ucg==
X-Forwarded-Encrypted: i=1; AKwUvBwTtuIQ+QvjP5I/xFSS4BRyiA3+OALna/EW4eXOvcNRudlBwku9JTAX7VpLUZWB70aC/OLaM54xntyLYqGkQ7Mz@lists.infradead.org
X-Gm-Message-State: AFuF++leVB0i5r3r6q+CnPcWUdyTeynf+bjZEv4hBxZY0S708IBWF9Ak
	5CBRFPb3rRziFyOtiVqZiZKu3OobveGKeNly9KXlsuugqvZV9p+YiEltSCsCy9Qkr08KtheaFNA
	fNl4ttUPUX2m4HSnZq3MWslk/yh/wgARxMz4Vgh/djl6f21dvKSVkxoURqCSKo6i17IJ4WS++JM
	ZChg==
X-Gm-Gg: AYBFou25Hl1UIY0vBKExG8KDwuv1sUGSQbjvRpaJlbyZ/Pf9rWAHwYAiCZ1EHusBioA
	bsr3M1JGRESGoY3w87PzFRknCj0DAVHzkw1bkloOYJM5efDhdxQR8yWixe03vSs1eCY5Q5xfMn9
	rtAdjGoEgTIrAGcjcNnHP6awNHYt30/f/SAIWjSzJF8l7Ky+qhJvCmKu8C0l/mFYR4oGpLGSAP2
	K+Vwnj+RLH+s5rG5n/UIZOuHRmzLfGCRoH1aflXeL2nkrLKZd+41ShgH2pjFudX1v0UGiXW/VnC
	Ft72J3sVu35BobTnkkunot9OruWxjr+58xVRhUFzgAE7XMYfjtfboD9MU+UKDXuY8z1B9zRTAX1
	XDkBJCLB2rr461QY=
X-Received: by 2002:a05:620a:2951:b0:939:d6f3:1268 with SMTP id af79cd13be357-939ea135b79mr1915537285a.16.1789302778868;
        Sun, 13 Sep 2026 05:32:58 -0700 (PDT)
X-Received: by 2002:a05:620a:2951:b0:939:d6f3:1268 with SMTP id af79cd13be357-939ea135b79mr1915530085a.16.1789302778211;
        Sun, 13 Sep 2026 05:32:58 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm296862815e9.2.2026.09.13.05.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 05:32:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Eugen Hristev <ehristev@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>, Hans de Goede <hansg@kernel.org>,
        Walter Werner Schneider <contact@schnwalter.eu>,
        Devarsh Thakkar <devarsht@ti.com>, "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
        Benoit Parrot <bparrot@ti.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] media: dt-bindings: Use consistent indentation in the example
Date: Sun, 13 Sep 2026 14:32:53 +0200
Message-ID: <20260913123252.100085-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=22575; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=wwlTQcPzs2frrHknWoo6bb9wxA0MjIK1jG08afo8UU4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqppf00l4dZQfHIMWsXISWOhadvBqqfHIX3/94s
 yvEr8XlTG6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqaX9AAKCRDBN2bmhouD
 13rWD/0U4ljiJDteSBU0H8yyud2cskG7YAzrc5o7ws/lDF3KLeMk5iRdtltV/EQJLWv3bWjgPAE
 z7emnFYoelUvGVc5qnasCReJ3oCrTlKIHg/pZvZodsq/FuU1P5ebg72dIFRf1Wy+R9PcznxQYBn
 thraY5MqwVTBscgCVXPpaC45I6xcVwqgMZQuMh1bYfGbLwtmvKVlqWZbk7Y2UdxZ9q9tNJlBo7D
 u6DqcPFDskmRxyUqT/qHF71mMYG1tblvnEUTFK4xUtmjHMT3qgnUyOiTdEVd0kZHwcrsELA9sqX
 dq5K1GMf339JBNURkiq/JLgHKMnoOA8cMxICY3yi7yi3yWC5bkaeedWMyOmy4Dn5w+p9H6synlX
 bWqhfeCwjdmuqC1qHfTTbL1fHQ0D570coYdEIct5fCWlUVG4aoQsG9IVPtRCFJ525LB29TMA/Gd
 2sEie5SD3az3FUi5W0Aso/DBCOk5EvDJm1DszrcdNLzj0JdJAZz/iOmSdG04oJAtBMs+0wASlgB
 HW/uqZR5MDz6HYas6Q8FXmkL25Bg030ncnTLTGWQXD7LeuA6blE6k0yXnmM4Ciug3JL0jFQupKA
 FF+Tn+YbnlMBmdsx8ZUMQ8PPT3bqwanWYvXpfEBbNQ8s3ama0bJgVqe5w0K2xNS3eZXefWoitwU kbLDZaEX4R6AKNQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7nms15-jKLniFtc2j7XZo5ATB8dmmQgA
X-Proofpoint-ORIG-GUID: 7nms15-jKLniFtc2j7XZo5ATB8dmmQgA
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa697fb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=C4CHKQPVujXnZafBmVMA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfX5j8RM4UMrl41
 bFXVxUmIvBdPUW0PAMiDodnSI5x0nf9CqgYp3cFLZO1+2B8uNKM5pYLh+7lgfNjQjeBT/OMXnAe
 pzXO8WR+c3DAGMpnys6jg6L6lmrxocg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfXzxB7J/uS4yjA
 VukYwEumVlanufCmPCiFEQegdKBd27RlRdFhzTwQ0HkfP24W0D9Ye5O2spkSlmrunQ2FLoFhvkI
 vVhRwjwWtKsoLN3tsF/cvD2fBL4RzfNsQt9gZrVO9F/pwvFeo5yRX9r2IhpamYwkQ52qtF8mWbK
 gc5WGhU+VcO+C7sE5PTmIu8UXktknb+f1rZAyZZdQETlEVZYvUz28HmKzZn8HGAlN4+6QWpG+5Q
 VZzaLCdO6K0xZbXU++qxX3EUIolGYmVNvgXp5Ojj+/yCQJqvsFnY3eGkwCdnK1gP693RVpHwBcu
 w/wg7+FtFTHhw+CyfiL8aydj/epQKIFrv8GDF5FpYrUA7XVAt/Avzw71D3k+BA5zlwqaXA9l/vO
 7iDkS67XDfRzoB4F0D0kf7J3HN5XwFkq4qUQzC5nxZmuTQ593mfLR1BiarhZjY+6U6qI8ruxYDJ
 0/5PeieDHVHgkKqGugA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_053301_486192_7D506894 
X-CRM114-Status: GOOD (  15.43  )
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

Correct indentation in the examples to consistent 2- or 4-spaces
indentation to fix dt-check-style warnings ("example 0
[indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
re-indenting entire example just for that is too much churn.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/media/arm,mali-c55.yaml          |  2 +-
 .../devicetree/bindings/media/atmel,isc.yaml  | 14 ++---
 .../bindings/media/brcm,bcm2835-unicam.yaml   | 10 ++--
 .../bindings/media/cdns,csi2rx.yaml           | 58 +++++++++----------
 .../bindings/media/i2c/ovti,ov2680.yaml       | 26 ++++-----
 .../bindings/media/i2c/ovti,ov2732.yaml       |  6 +-
 .../bindings/media/img,e5010-jpeg-enc.yaml    | 22 +++----
 .../bindings/media/microchip,csi2dc.yaml      | 52 ++++++++---------
 .../bindings/media/microchip,xisc.yaml        | 14 ++---
 .../bindings/media/qcom,x1e80100-camss.yaml   | 26 ++++-----
 .../bindings/media/raspberrypi,pispbe.yaml    | 10 ++--
 .../bindings/media/samsung,fimc.yaml          | 14 ++---
 .../bindings/media/st,stm32-dcmi.yaml         | 16 ++---
 .../bindings/media/st,stm32-dcmipp.yaml       | 14 ++---
 .../devicetree/bindings/media/ti,cal.yaml     | 48 +++++++--------
 15 files changed, 166 insertions(+), 166 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
index fc4fcd19922a..39af7ffc70b4 100644
--- a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
+++ b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
@@ -79,7 +79,7 @@ examples:
 
       port {
         isp_in: endpoint {
-            remote-endpoint = <&csi2_rx_out>;
+          remote-endpoint = <&csi2_rx_out>;
         };
       };
     };
diff --git a/Documentation/devicetree/bindings/media/atmel,isc.yaml b/Documentation/devicetree/bindings/media/atmel,isc.yaml
index dc8aba698d78..5c84f372e81a 100644
--- a/Documentation/devicetree/bindings/media/atmel,isc.yaml
+++ b/Documentation/devicetree/bindings/media/atmel,isc.yaml
@@ -102,12 +102,12 @@ examples:
         clock-output-names = "isc-mck";
 
         port {
-                isc_0: endpoint {
-                       remote-endpoint = <&ov7740_0>;
-                       hsync-active = <1>;
-                       vsync-active = <0>;
-                       pclk-sample = <1>;
-                       bus-width = <8>;
-                };
+            isc_0: endpoint {
+                remote-endpoint = <&ov7740_0>;
+                hsync-active = <1>;
+                vsync-active = <0>;
+                pclk-sample = <1>;
+                bus-width = <8>;
+            };
         };
     };
diff --git a/Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml b/Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
index 5fb5d60f069a..bfec4daccd0a 100644
--- a/Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
+++ b/Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
@@ -117,11 +117,11 @@ examples:
         power-domains = <&power RPI_POWER_DOMAIN_UNICAM1>;
         brcm,num-data-lanes = <2>;
         port {
-                csi1_ep: endpoint {
-                        remote-endpoint = <&imx219_0>;
-                        bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
-                        data-lanes = <1 2>;
-                };
+            csi1_ep: endpoint {
+                remote-endpoint = <&imx219_0>;
+                bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+                data-lanes = <1 2>;
+            };
         };
     };
 ...
diff --git a/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml b/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
index 6ed9a5621064..cbc6249e8803 100644
--- a/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
+++ b/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
@@ -160,50 +160,50 @@ examples:
         phy-names = "dphy";
 
         ports {
-                #address-cells = <1>;
-                #size-cells = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
 
-                port@0 {
-                    reg = <0>;
+            port@0 {
+                reg = <0>;
 
-                    csi2rx_in_sensor: endpoint {
-                        remote-endpoint = <&sensor_out_csi2rx>;
-                        clock-lanes = <0>;
-                        data-lanes = <1 2>;
-                    };
+                csi2rx_in_sensor: endpoint {
+                    remote-endpoint = <&sensor_out_csi2rx>;
+                    clock-lanes = <0>;
+                    data-lanes = <1 2>;
                 };
+            };
 
-                port@1 {
-                    reg = <1>;
+            port@1 {
+                reg = <1>;
 
-                    csi2rx_out_grabber0: endpoint {
-                        remote-endpoint = <&grabber0_in_csi2rx>;
-                    };
+                csi2rx_out_grabber0: endpoint {
+                    remote-endpoint = <&grabber0_in_csi2rx>;
                 };
+            };
 
-                port@2 {
-                    reg = <2>;
+            port@2 {
+                reg = <2>;
 
-                    csi2rx_out_grabber1: endpoint {
-                        remote-endpoint = <&grabber1_in_csi2rx>;
-                    };
+                csi2rx_out_grabber1: endpoint {
+                    remote-endpoint = <&grabber1_in_csi2rx>;
                 };
+            };
 
-                port@3 {
-                    reg = <3>;
+            port@3 {
+                reg = <3>;
 
-                    csi2rx_out_grabber2: endpoint {
-                        remote-endpoint = <&grabber2_in_csi2rx>;
-                    };
+                csi2rx_out_grabber2: endpoint {
+                    remote-endpoint = <&grabber2_in_csi2rx>;
                 };
+            };
 
-                port@4 {
-                    reg = <4>;
+            port@4 {
+                reg = <4>;
 
-                    csi2rx_out_grabber3: endpoint {
-                        remote-endpoint = <&grabber3_in_csi2rx>;
-                    };
+                csi2rx_out_grabber3: endpoint {
+                    remote-endpoint = <&grabber3_in_csi2rx>;
                 };
+            };
         };
     };
 
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
index 634d3b821b8c..83f84a7828bf 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
@@ -90,22 +90,22 @@ examples:
         #size-cells = <0>;
 
         ov2680: camera-sensor@36 {
-                compatible = "ovti,ov2680";
-                reg = <0x36>;
-                clocks = <&osc>;
-                clock-names = "xvclk";
-                reset-gpios = <&gpio1 3 GPIO_ACTIVE_LOW>;
+            compatible = "ovti,ov2680";
+            reg = <0x36>;
+            clocks = <&osc>;
+            clock-names = "xvclk";
+            reset-gpios = <&gpio1 3 GPIO_ACTIVE_LOW>;
 
-                DOVDD-supply = <&sw2_reg>;
-                DVDD-supply = <&sw2_reg>;
-                AVDD-supply = <&reg_peri_3p15v>;
+            DOVDD-supply = <&sw2_reg>;
+            DVDD-supply = <&sw2_reg>;
+            AVDD-supply = <&reg_peri_3p15v>;
 
-                port {
-                        ov2680_to_mipi: endpoint {
-                                remote-endpoint = <&mipi_from_sensor>;
-                                link-frequencies = /bits/ 64 <330000000>;
-                        };
+            port {
+                ov2680_to_mipi: endpoint {
+                    remote-endpoint = <&mipi_from_sensor>;
+                    link-frequencies = /bits/ 64 <330000000>;
                 };
+            };
         };
     };
 
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2732.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov2732.yaml
index 814fc568c550..b6b5145802e7 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov2732.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov2732.yaml
@@ -94,9 +94,9 @@ examples:
 
             port {
                 camera_out: endpoint {
-                  data-lanes = <1 2>;
-                  link-frequencies = /bits/ 64 <360000000>;
-                  remote-endpoint = <&mipi_in_camera>;
+                    data-lanes = <1 2>;
+                    link-frequencies = /bits/ 64 <360000000>;
+                    remote-endpoint = <&mipi_in_camera>;
                 };
             };
         };
diff --git a/Documentation/devicetree/bindings/media/img,e5010-jpeg-enc.yaml b/Documentation/devicetree/bindings/media/img,e5010-jpeg-enc.yaml
index 085020cb9e61..b6f80098beb7 100644
--- a/Documentation/devicetree/bindings/media/img,e5010-jpeg-enc.yaml
+++ b/Documentation/devicetree/bindings/media/img,e5010-jpeg-enc.yaml
@@ -61,15 +61,15 @@ examples:
     #include <dt-bindings/interrupt-controller/irq.h>
 
     soc {
-      #address-cells = <2>;
-      #size-cells = <2>;
-      jpeg-encoder@fd20000 {
-          compatible = "img,e5010-jpeg-enc";
-          reg = <0x00 0xfd20000 0x00 0x100>,
-                <0x00 0xfd20200 0x00 0x200>;
-          reg-names = "core", "mmu";
-          clocks = <&k3_clks 201 0>;
-          power-domains = <&k3_pds 201 TI_SCI_PD_EXCLUSIVE>;
-          interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
-      };
+        #address-cells = <2>;
+        #size-cells = <2>;
+        jpeg-encoder@fd20000 {
+            compatible = "img,e5010-jpeg-enc";
+            reg = <0x00 0xfd20000 0x00 0x100>,
+                  <0x00 0xfd20200 0x00 0x200>;
+            reg-names = "core", "mmu";
+            clocks = <&k3_clks 201 0>;
+            power-domains = <&k3_pds 201 TI_SCI_PD_EXCLUSIVE>;
+            interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml b/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
index b3a345fc6464..d06987680ed8 100644
--- a/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
+++ b/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
@@ -149,22 +149,22 @@ examples:
         clock-names = "pclk", "scck";
 
         ports {
-               #address-cells = <1>;
-               #size-cells = <0>;
-               port@0 {
-                       reg = <0>; /* must be 0, first child port */
-                       csi2dc_in: endpoint { /* input from IDI interface */
-                               bus-type = <4>; /* MIPI CSI2 D-PHY */
-                               remote-endpoint = <&csi2host_out>;
-                       };
-               };
+            #address-cells = <1>;
+            #size-cells = <0>;
+            port@0 {
+                reg = <0>; /* must be 0, first child port */
+                csi2dc_in: endpoint { /* input from IDI interface */
+                    bus-type = <4>; /* MIPI CSI2 D-PHY */
+                    remote-endpoint = <&csi2host_out>;
+                };
+            };
 
-               port@1 {
-                       reg = <1>; /* must be 1, second child port */
-                       csi2dc_out: endpoint {
-                               remote-endpoint = <&xisc_in>; /* output to sensor controller */
-                       };
-               };
+            port@1 {
+                reg = <1>; /* must be 1, second child port */
+                csi2dc_out: endpoint {
+                    remote-endpoint = <&xisc_in>; /* output to sensor controller */
+                };
+            };
         };
     };
 
@@ -181,18 +181,18 @@ examples:
         dma-names = "rx";
 
         ports {
-               #address-cells = <1>;
-               #size-cells = <0>;
-               port@0 {
-                       reg = <0>; /* must be 0, first child port */
-                       csi2dc_input: endpoint { /* input from IDI interface */
-                               remote-endpoint = <&csi2host_out>;
-                       };
-               };
+            #address-cells = <1>;
+            #size-cells = <0>;
+            port@0 {
+                reg = <0>; /* must be 0, first child port */
+                csi2dc_input: endpoint { /* input from IDI interface */
+                    remote-endpoint = <&csi2host_out>;
+                };
+            };
 
-               port@1 {
-                       reg = <1>;
-               };
+            port@1 {
+                reg = <1>;
+            };
         };
     };
 
diff --git a/Documentation/devicetree/bindings/media/microchip,xisc.yaml b/Documentation/devicetree/bindings/media/microchip,xisc.yaml
index 25f5f79d40ce..6a9e56c486c2 100644
--- a/Documentation/devicetree/bindings/media/microchip,xisc.yaml
+++ b/Documentation/devicetree/bindings/media/microchip,xisc.yaml
@@ -118,12 +118,12 @@ examples:
         clock-output-names = "isc-mck";
 
         port {
-                xisc_in: endpoint {
-                       bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
-                       remote-endpoint = <&csi2dc_out>;
-                       hsync-active = <1>;
-                       vsync-active = <1>;
-                       bus-width = <12>;
-                };
+            xisc_in: endpoint {
+                bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
+                remote-endpoint = <&csi2dc_out>;
+                hsync-active = <1>;
+                vsync-active = <1>;
+                bus-width = <12>;
+            };
         };
     };
diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 2d1662ef522b..bdf03a944fd7 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -289,19 +289,19 @@ examples:
                           "vfe_lite_cphy_rx",
                           "vfe_lite_csid";
 
-           interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
-                        <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
-                        <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
-                        <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
-                        <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
-                        <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
-                        <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
-                        <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
-                        <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
-                        <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
-                        <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
-                        <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
-                        <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
+            interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
 
             interrupt-names = "csid0",
                               "csid1",
diff --git a/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml b/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
index 5c0f2f7b1d95..36fde927382a 100644
--- a/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
+++ b/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
@@ -54,10 +54,10 @@ examples:
         #size-cells = <2>;
 
         isp@880000 {
-             compatible = "brcm,bcm2712-pispbe", "raspberrypi,pispbe";
-             reg = <0x10 0x00880000 0x0 0x4000>;
-             interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
-             clocks = <&firmware_clocks 7>;
-             iommus = <&iommu2>;
+            compatible = "brcm,bcm2712-pispbe", "raspberrypi,pispbe";
+            reg = <0x10 0x00880000 0x0 0x4000>;
+            interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&firmware_clocks 7>;
+            iommus = <&iommu2>;
         };
     };
diff --git a/Documentation/devicetree/bindings/media/samsung,fimc.yaml b/Documentation/devicetree/bindings/media/samsung,fimc.yaml
index 1bfba84f8854..1329d4ee0705 100644
--- a/Documentation/devicetree/bindings/media/samsung,fimc.yaml
+++ b/Documentation/devicetree/bindings/media/samsung,fimc.yaml
@@ -188,13 +188,13 @@ examples:
         /* ... CSIS 1 */
 
         fimc-lite@b90000 {
-              compatible = "samsung,exynos4212-fimc-lite";
-              reg = <0xb90000 0x1000>;
-              interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
-              power-domains = <&pd_isp>;
-              clocks = <&isp_clock CLK_ISP_FIMC_LITE0>;
-              clock-names = "flite";
-              iommus = <&sysmmu_fimc_lite0>;
+            compatible = "samsung,exynos4212-fimc-lite";
+            reg = <0xb90000 0x1000>;
+            interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+            power-domains = <&pd_isp>;
+            clocks = <&isp_clock CLK_ISP_FIMC_LITE0>;
+            clock-names = "flite";
+            iommus = <&sysmmu_fimc_lite0>;
         };
 
         /* ... FIMC-LITE 1 */
diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
index 7c2ddd27780f..cb0116176c3f 100644
--- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
+++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
@@ -120,14 +120,14 @@ examples:
         dma-names = "tx";
 
         port {
-             dcmi_0: endpoint {
-                   remote-endpoint = <&ov5640_0>;
-                   bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
-                   bus-width = <8>;
-                   hsync-active = <0>;
-                   vsync-active = <0>;
-                   pclk-sample = <1>;
-             };
+            dcmi_0: endpoint {
+                remote-endpoint = <&ov5640_0>;
+                bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
+                bus-width = <8>;
+                hsync-active = <0>;
+                vsync-active = <0>;
+                pclk-sample = <1>;
+            };
         };
     };
 
diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
index 162a0c526d5d..0bf7c674dd97 100644
--- a/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
+++ b/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
@@ -120,13 +120,13 @@ examples:
         clocks = <&rcc DCMIPP_K>;
 
         port {
-             endpoint {
-                   remote-endpoint = <&mipid02_2>;
-                   bus-width = <8>;
-                   hsync-active = <0>;
-                   vsync-active = <0>;
-                   pclk-sample = <0>;
-             };
+            endpoint {
+                remote-endpoint = <&mipid02_2>;
+                bus-width = <8>;
+                hsync-active = <0>;
+                vsync-active = <0>;
+                pclk-sample = <0>;
+            };
         };
     };
 
diff --git a/Documentation/devicetree/bindings/media/ti,cal.yaml b/Documentation/devicetree/bindings/media/ti,cal.yaml
index f1a940a110d2..c223b4f2d75a 100644
--- a/Documentation/devicetree/bindings/media/ti,cal.yaml
+++ b/Documentation/devicetree/bindings/media/ti,cal.yaml
@@ -136,17 +136,17 @@ examples:
         ti,camerrx-control = <&scm_conf 0xE94>;
 
         ports {
-              #address-cells = <1>;
-              #size-cells = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
 
-              csi2_0: port@0 {
-                    reg = <0>;
-                    csi2_phy0: endpoint {
-                           remote-endpoint = <&csi2_cam0>;
-                           clock-lanes = <0>;
-                           data-lanes = <1 2>;
-                    };
-              };
+            csi2_0: port@0 {
+                reg = <0>;
+                csi2_phy0: endpoint {
+                    remote-endpoint = <&csi2_cam0>;
+                    clock-lanes = <0>;
+                    data-lanes = <1 2>;
+                };
+            };
         };
     };
 
@@ -156,21 +156,21 @@ examples:
         #size-cells = <0>;
 
         camera-sensor@3c {
-               compatible = "ovti,ov5640";
-               reg = <0x3c>;
-               AVDD-supply = <&reg_2p8v>;
-               DOVDD-supply = <&reg_1p8v>;
-               DVDD-supply = <&reg_1p5v>;
-               clocks = <&clk_ov5640_fixed>;
-               clock-names = "xclk";
+            compatible = "ovti,ov5640";
+            reg = <0x3c>;
+            AVDD-supply = <&reg_2p8v>;
+            DOVDD-supply = <&reg_1p8v>;
+            DVDD-supply = <&reg_1p5v>;
+            clocks = <&clk_ov5640_fixed>;
+            clock-names = "xclk";
 
-               port {
-                    csi2_cam0: endpoint {
-                            remote-endpoint = <&csi2_phy0>;
-                            clock-lanes = <0>;
-                            data-lanes = <1 2>;
-                    };
-               };
+            port {
+                csi2_cam0: endpoint {
+                    remote-endpoint = <&csi2_phy0>;
+                    clock-lanes = <0>;
+                    data-lanes = <1 2>;
+                };
+            };
         };
     };
 
-- 
2.53.0


