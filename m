Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91609FD3774
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 17:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uAXRlKsSKgVHXRo/hlqcCpXBiAKwXP05ii0Mt1jrQg8=; b=X4wCX2Q2wCvuhCycvIypIMW1c3
	sQ+jshJk5aEyXJ7zWsh+SZ1TYvw7VIb/nxFnYLvp3vwb1GlHjwR3xaIjPKLwEH0r5Qf47/NHHSpWs
	oD4udHu8KOw0JIvGpgvf1ekmMbVikLYse6ZwA9SbAV77H5XEx6zjh+YPS1/UfGOWWD6MYIzA3M9tr
	mdKABI6CxJRFperdNUj5GZdWfs/gaLu42gnpJ2eFjuCTe0iT6xhkCV+o5d0Wui1M34WJKjJtYA8F9
	PYwHpAcH4aOel4v3BZooF3XLFDxuuCEBAGWNbY3crMXAHlhfkKKNMdKwvt/mp9UfZWRw3b3GKjygq
	F5MSUUNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvIQk-00000004cdN-0MDQ;
	Wed, 25 Feb 2026 17:12:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvIQh-00000004ccG-076z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 17:12:08 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PEkWoU3041175
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 17:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uAXRlKsSKgVHXRo/hlqcCpXBiAKwXP05ii0
	Mt1jrQg8=; b=B0KSE6v2BR2faMgYkKqV5TeNf1Gqsf5Bdwcu5HGNAhTwbpqLuh4
	53VT2GyzzV5skXuIbp+HAb8yViDEVPuKdNamsy94Ew9JGcHdV3I6CTZfZrwMGj9s
	FxBSQDlLw8+PF5lQYyhgU2Dec/6XAKcD48nxbyFmC6kAGWA/MfwXPImWI0NhS8Ln
	erbvfrP1scZuEfbdAhxEHFRcZoSTtBvNMlM42oT82ndi1cUSw5RWHXOjKCFlGQqT
	OhVFAB+zsfcDBEQzbeNBFIyC9ByxGbv99Ru8dj2PdvDay7SzVpT6M8qSnnVAiWuC
	fmLdnFweiXgdQrevL/Zqp1EYFd7jEAE+7xw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj350ghgd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 17:12:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70ab7f67fso4888855385a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 09:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772039525; x=1772644325; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uAXRlKsSKgVHXRo/hlqcCpXBiAKwXP05ii0Mt1jrQg8=;
        b=Zz5MBBE/BwfEUfwgbqTBIApAdVZDg0huowq3XeUVHJpd9+VU3mUeCtw1713s+n7v8k
         60QgbN+3pva5+uJaNK2JFQXdhVxeB/p0QnYwYopn22eznGtfMrhZ74BrB2Q+/3xfiqWg
         yqHtS9l6/nBbgtDRYA6ijBU1ZXIM7Y6Lxcx4w6Up9EJLkILQv59M9vAHSjbQq3bKeOXb
         dhJgYun2/Ifyq51lAWk0qfFfkgZfyRw2E1CCESsHcem5LbxB4D/0LkfkY7qVfXcwKkg6
         my0y2aCAZeujS+1TwZbad5JPL6b5RlJH7eLdet925rcwu8eueonv9nNlh7nXHm9HZ0yE
         H/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772039525; x=1772644325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uAXRlKsSKgVHXRo/hlqcCpXBiAKwXP05ii0Mt1jrQg8=;
        b=GYLORv9ok6UcZ3+pL/2auWcsGXRnTnXcuPXeg4r9GAFCu3ediOb2tDKoCFxvSKbDGE
         DX6c3F0OJeXWLZZPX6gDNtPVVh1qiMi2Wyp9m7T13Z4DGq22BY8Fu+WFiyg8fIoeX7aT
         iCFUuAtQGQ5rVI0WTm8SKSB9ZR0rML+DHJCLR8k5/z8z48z87XhTA6qTxlN/G2uua/Zd
         Uf8UXWVJ0WKtOMFGByU51WjlBibDRtMVWIDC7DEXOiv5hUqcejzAdEiAYm/Nu/SjmweY
         3uk7Y0Xs9aVLFs6DdYd2qHyErJ2b+ek87Wu1PWc5aDzU2bpT3nQujJlbr5xxpQcS+T7/
         b2AQ==
X-Forwarded-Encrypted: i=1; AJvYcCWl+nR6NHYvC9AJukf/HvHmWwTbOSwVq/iI2tsB4S3uEDx+h/cRZMKLqbRv8e0eYfMhkmBxmOh/7lSUb+dhX+vg@lists.infradead.org
X-Gm-Message-State: AOJu0YzFa+Sv3+G+hSwAE9BP5NXH/75Yhm/JwnTNCio+YeJsCG5bv4OA
	SetX0cZFwiu9EFu948+jJwUlO/q1CTDS7nnsNGP/U1Y3HmzN9qHSAUZ50uJ3b5E03YkCRcLPkB0
	repqudXf6o9vDLI2ZYAxxN49Xqpq7cnqSJf2l4enMtkiGhRzFbjkkbQM0NUGYVQyq191OyeADib
	Z4EA==
X-Gm-Gg: ATEYQzyDpnmoBJ2UIHGgqA/HPCoWNJK/2qtyQ74mmEtZkBn+MJ63qdvenR11v1DOejj
	iGDKZ+jHxT7GR8jxnFIIiAX3/VNMI6rf75jCk8oou2PxRTrnszCbQEJmOTV4uhbNpkWFRrQjsxt
	aiPo93lqT4jD+jvSpKGyyKKkxtcb6tF+5kxwPxA9VGG6QZ1aXLVULlNLDHWC+/CV1nTTz/4QQhw
	FkLd8no35YGK3FNZaVUhe7u9AWoePuTOfaJAHrmMeyQP0Z3JDuEqpStdN0BDeLRpdv1Tkjb6iN3
	FtfnLN/MgWspgoMFXbxRCHiEvcjT2y//jgA42OzaQ4WkUxspc3eSVmfYcCMQMe3PqW7poWUMjfY
	uhlGfIAHRkvRstVeEZLD/qU9JRzDWb6gL0XB+wg==
X-Received: by 2002:a05:620a:454d:b0:8c7:806:386 with SMTP id af79cd13be357-8cbbcf97f2dmr180915385a.34.1772039524761;
        Wed, 25 Feb 2026 09:12:04 -0800 (PST)
X-Received: by 2002:a05:620a:454d:b0:8c7:806:386 with SMTP id af79cd13be357-8cbbcf97f2dmr180885485a.34.1772039521931;
        Wed, 25 Feb 2026 09:12:01 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd6854c7sm186988115e9.0.2026.02.25.09.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 09:12:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>, linux@ew.tq-group.com,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        markus.niebel@tq-group.com, matthias.schiffer@tq-group.com,
        alexander.stein@ew.tq-group.com
Subject: [PATCH] ARM: MAINTAINERS: TQ: Orphan TQ Systems boards
Date: Wed, 25 Feb 2026 18:11:36 +0100
Message-ID: <20260225171135.122955-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1575; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=lUtIgAbMh/vNpRAdiwHHkrbPL+Vk6Sh4GYYNaqza5DU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpny1H1OE3Y0Zw2+jF8iqQR9ncHs2XAfCuD6jNY
 yg1lhx0aeyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZ8tRwAKCRDBN2bmhouD
 1z2cEACPrAM7M39NN5/GiyNmPWC51/WqMFstXNtfr92G2BKdF13xgZYoo/jFhKt4ed2CA4JRW/S
 d4SpDiefTVbEl2q7SizU7thmiKY80CUNa/5MzJ4D9aa04P0UjcT9sln8cX9sAxYS3WLa4en+jVr
 giCnZQaHaccNekgM0jyGyR0OgQUkp4Hnnae+fZHx3VsZ6HOY366llKj50QUST4B6v9zTEgxGjRX
 xlnXqhkyjaYcaTe6t6xxPwlSBCi2EvGALNN05Ab+e2Q/5Gmh4D6faGd/Z63wWPQEaLE5QH8jfqr
 voliSKNnogG/BAh2+AcK36XVZ66HkWosvbKH9Jw2zbeIyAoMHh7e8wAcTNT1R3NjMdhjHz0nIC4
 t6jnH7o1uChADZ4ZZGRZPMG0tyzdfSFl+osFpPFQeC8v/g09qGaVfmj1w8hcfUf/mgN+15d8h7Y
 A7ylhEHWQke3gGNo5iyd8CI24PZXmbeIFzKDUlD7PpCWzPI+aMTN34+dZFVjMaBRuztJTzV1xuU
 Gppujo2WK5PXzlpojUXx6diJWSPCKQohIEl3V7rMQpbnc6hRftU+lpfe4qJeRL5Rhds7EOcLx6j
 qR1IOGKSN9GZ1VxaVPsQxMhuh7zJhhd2qEWHQnlwg4QyINmC3mrWEOhSWWRyHwPhOZouDEZ75nS FLN8nE9LEL98+7A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZV22z8-xnV5TKnsw9UWqkrnCtCZJNKmK
X-Authority-Analysis: v=2.4 cv=Zs/g6t7G c=1 sm=1 tr=0 ts=699f2d66 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=8f9FM25-AAAA:8
 a=VwQbUJbxAAAA:8 a=1TEZt6uuAAAA:8 a=EUspDBNiAAAA:8 a=MG-3fz8axUtF_4d9Gg0A:9
 a=IoWCM6iH3mJn3m4BftBB:22 a=uSNRK0Bqq4PXrUp6LDpb:22 a=K6b9sarf6D5yyto29Wkr:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE2NSBTYWx0ZWRfX3271RFd5bbRD
 mjQm1fq1B3lzkmbcSglDyrvQwoBlp7Lz+JQ1CUsxVPLVscuzJow7n6xpitqEdZCYW4SgJNeYWCW
 /3l/8tStIZdQwNkCkTkP72HY+RMtJtWH/nJ4u2TnlIr3rzLIvUFrV/ecwjpW4TxO/RmLF4TRUIR
 y+c+tezpsc6H1g9uM0oEMV9bhQ/XRlIydJLfeKyLkMFRrovjFO1CwlDnxZ+xyWiZWAF+1wWTXk9
 TTnW0zYNAkY+Lmm16qKAbRDPMlWYebVppMSn46vX56n/frty3P8q6FFPFNhxSMYZFpZfupTIROz
 9vnG1ptC6NscsTWJY+yCti9kwZoZYXXmdG1GtQeb/ib/JKoT6GUUX53OFtpaWceNiVcHsBAy+bA
 BkdySh2BgiZydatcONAIpncl8lPtYYGWEh0IE+KqEkUaWj9Q1qtVWA7KsTH8feIjPvMzK5xKXLO
 tv2K6QJXAZ23DgGoK+w==
X-Proofpoint-ORIG-GUID: ZV22z8-xnV5TKnsw9UWqkrnCtCZJNKmK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_02,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_091207_238935_2730F72E 
X-CRM114-Status: GOOD (  13.71  )
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

Emails to all TQ maintainers bounce for a month or longer, because their
systems decided to block smtp.kernel.org.  This is nothing which can be
fixed by Linux Foundation IT staff, but aggresive and irresponsible
email provider.

There were no answers from linux@ew.tq-group.com or anyone else in TQ
Systems after my inquiries about this problem, thus assume the mainline
efforts are abandoned.

  <Markus.Niebel@tq-group.com>: host mx01.hornetsecurity.com[94.100.132.8] said:
    554 5.5.4 Your IP address 172.105.4.254 has a bad reputation.

  <matthias.schiffer@tq-group.com>: host mx01.hornetsecurity.com[94.100.132.8]
    said: 554 5.5.4 Your IP address 172.105.4.254 has a bad reputation.

  <alexander.stein@ew.tq-group.com>: host mx01.hornetsecurity.com[94.100.132.8]
    said: 554 5.5.4 Your IP address 172.105.4.254 has a bad reputation.

Cc: markus.niebel@tq-group.com
Cc: matthias.schiffer@tq-group.com
Cc: alexander.stein@ew.tq-group.com
Cc: linux@ew.tq-group.com
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index faa914a5f34d..f446fb30cf6c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26781,7 +26781,7 @@ F:	drivers/hwmon/pmbus/tps546d24.c
 
 TQ SYSTEMS BOARD & DRIVER SUPPORT
 L:	linux@ew.tq-group.com
-S:	Supported
+S:	Orphan
 W:	https://www.tq-group.com/en/products/tq-embedded/
 F:	arch/arm/boot/dts/nxp/imx/*mba*.dts*
 F:	arch/arm/boot/dts/nxp/imx/*tqma*.dts*
-- 
2.51.0


