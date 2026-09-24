Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7884FC98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 21:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C1HITtr+aqcZ8nFC5kDWRbi3sk+xXAlik1wHbVlwcQk=; b=MYoCxxs3jQQSeJewrpMWZk5jxu
	NnF/GNL473n0rtXf3Tv43wZtDC6XVnNxw8+O05Fikpk1z3AeftQ/RWztcT7RG+q03nXlCs3MSCxiT
	iaSLKyyOeM2hI/F59oZLtBmmEyteyYFcx0IAH4DF0rQu+u/ucY6W6UD/oJEsmnFaDD5tAJFmyWriF
	X+XKuz54l3g1BA07l3W9dP1IesftZk1YNNDoBruq30Ld/u5LdAImEBifS0hzZ7Xym8zlzp9KjxenR
	8lWQxgdwlLkQlXGItUqy9B1h9sL20cJH6+6t6uy+y6eYtL7O3xKUCrvhwh20v2qfYwECADwC8QAz0
	1JD3Allw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9qjq-0000000CCST-2p9l;
	Thu, 24 Sep 2026 21:12:18 +0000
Received: from out12-31.antispamcloud.com ([185.201.16.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9qjg-0000000CCO9-4Aoh;
	Thu, 24 Sep 2026 21:12:10 +0000
Received: from s1041.use1.mysecurecloudhost.com ([192.250.231.249])
	by mx320.antispamcloud.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <dan@reactivated.net>)
	id 1x9qjQ-004qWk-Cf; Thu, 24 Sep 2026 23:11:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=reactivated.net; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=C1HITtr+aqcZ8nFC5kDWRbi3sk+xXAlik1wHbVlwcQk=; b=L7H03mcFPZ0n9WqOJxcaksQ4+/
	n/LRugw54a8O7mlOKcMXeoob5IvaXuG6ZRp9pGeR8IdaaPGRY2fWiq8ocJIqPxceNiLVJNM9Gc/k7
	sHKZlNRu6pmFjAgO/cb0bDsrNPMiU0W0AoPtRR3MqTzp8bwiOlTCfMZt6YsqN+thDt66JXStzLNL/
	Qh2rIn6JM91NbJS7h+5YXoRIXQjL/2GYb0DhjvF0N2PWEHKMnIujWAPYJZ34WMZdXFOdSwk5OHdNB
	tfnntZBazfAiHSR2m1Xv91Zzu7rIyphaotLMkS/n3WDlOMWvzrMfn8x32i+K3duQ4Knx8PMM62yb9
	jpmkzUpQ==;
Received: from [188.251.249.2] (port=56840 helo=[192.168.1.123])
	by s1041.use1.mysecurecloudhost.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <dan@reactivated.net>)
	id 1x9qjN-00000006M7u-0TIO;
	Thu, 24 Sep 2026 21:11:49 +0000
From: Daniel Drake <dan@reactivated.net>
Date: Thu, 24 Sep 2026 22:10:53 +0100
Subject: [PATCH v6 3/6] dt-bindings: display: brcm,bcm2835-hvs: Document
 iommus property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-bcm2712-iommu-submit-v6-3-7b3cace86973@reactivated.net>
References: <20260924-bcm2712-iommu-submit-v6-0-7b3cace86973@reactivated.net>
In-Reply-To: <20260924-bcm2712-iommu-submit-v6-0-7b3cace86973@reactivated.net>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Daniel Drake <dan@reactivated.net>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, nick.hollinghurst@raspberrypi.com, 
 james.quinlan@broadcom.com, Jason Gunthorpe <jgg@ziepe.ca>
X-Mailer: b4 0.14.3
X-Get-Message-Sender-Via: s1041.use1.mysecurecloudhost.com: authenticated_id: dan@reactivated.net
X-Authenticated-Sender: s1041.use1.mysecurecloudhost.com: dan@reactivated.net
X-Originating-IP: 192.250.231.249
X-Spampanel-Domain: s1041.use1.mysecurecloudhost.com
X-Spampanel-Username: 192.250.231.249
Authentication-Results: antispamcloud.com; auth=pass smtp.auth=192.250.231.249@s1041.use1.mysecurecloudhost.com
X-Spampanel-Outgoing-Class: ham
X-Spampanel-Outgoing-Evidence: Combined (0.02)
X-Recommended-Action: accept
X-Filter-ID: 9kzQTOBWQUFZTohSKvQbgI7ZDo5ubYELi59AwcWUnuUDtRfT7lYBuECIPudT1XzSU7TacCi0f13j
 GhHdsSURRiu2SmbhJN1U9FKs8X3+Nt06bFpPrNOlRAlE9AVLwR4uGVjKNnzF3nQoDoQtBifM84JL
 M0i5ZAms0EHrvcCaVIPqgfNcPdJXvbyUpLgnF1F3GnT3EFAinyrilm9zau/FuzkQt9Nb4Ml7QXdk
 EetczWCfZW7a9uhvfuE0J/hsBuu+eB7itP8hgjDRserKv4bhb4rodgkl+wsfxZHakHKRaVZWBb39
 uS1TjWG2Inx+Ts2QrtVmombMJ4e2pn5C0yBMHZ0fE47nEjvubMSTLAkKCKclZzoe+TZdeH39wA4E
 grA4pE2PuLHIFQdBY9qb1rRWgyz0f29FZkQs6Ir87R/YNAvXNJYSPALjIk1CrW/D5KV6hhIoFK2v
 s7u+GDFagW/56hdY10KWDe11L7IcB8KIVAX0ddipzuikhovwj3ZhlauoCGpSQ3YDiIuyc1oArSHW
 Z6JhwV5av+XQyyDMu89o9uPImyvadeKGjjJQWSFqkLDz7r2on3wj0x4ezS7JTqLnJdXFqoCaPGhq
 xOsFLn6FXrHoC90VuIq/wzRJuNyYmlcf2wvHbfwld3xCwVQvwEuT7xKb56pfSTPBxlVrsnJIzhEd
 i2dtActm1pKPAAGnfdVyej30Z3Gx8hXfff5gZXHdar2zTZYKe+y4VTLHb4QDZyhuR1U+n91YVqlR
 fRjPErXQYEWFSqUNAzHMtoQ0XumDZdCnPPqcrsJCa26g+1p6dnGqlgoL2vPcxoHP5fYm77ZLajhI
 /osHQYQOY9tKQuYhV2zSuqRaCWd5p5K78Cq+W1w0y2KsRWBIPw9nLpbNGPtYpG55mqwMpI5BYS8G
 lSNI2Ca/iJPEUj1bN/5NYVGLsL5Qw4IB9ToecrbmmnKjrsPhPgoNgiFdcZakx1C6U9RI/f+76sU8
 wGmOnLcaeINlh4D7gY7cv0cTP3w7F74GIfFgGZTlEmqqp+HcDRtShrxrNA4br2+mEmVJrJM4fd19
 PqjIyvGxWL1rN3cWjPD5viEZJolz8ClgrSFC0qV2pwUtO92lcKbdXd1aPKEJfyZsBP+3ojxAc8lp
 0sobbdB+F7B3Y8TjGBGmQjnZT0wGxghmQiiyHai0+C+cV2SwXGGBGRJoh9VoIekQHpwUfpYnEThm
 JIBq/vl4T589Eoyw88oKKzL2dp7mRKD4sMOHD4kTUbW5J5QyAL9UV03N5ANlY/XP/nvATdPRNfRC
 ogKUBoiGk7+7TY+LxsYMBY14CoC2k4ZFj2kpuIv/9gSqTljzmaSLiwQzKw+6v3CaIMG6s7LqJEBr
 r4RYD5fnTwa0tMnLz6SKQpgZ8zVbGmL5ozttECcg597p245AIcvvY28Ycjy4wUtEPn8DyQjjJgJw
 lknA97Qqa21qj9TEJmQFcQejLm6N02F0dRgAVZw81E22mZaseAdYAUt3zF2gN7skM/50TVH1H/aA
 warQpYDOYx/6JtUORHHV0k7mR0VPG9HQWV7dXfBjXbvxH2nMLfV+SMGovieHnQDrcLDN17YMjSrM
 Y2oTcPJOcrZu7OKsSObGAqhi7iERbInMiTBIUBbQ/Dy6Ip5s2Cc9h6F0bzi9eJvFy172Pif4H4Ku
 78pBi/ZAqnPyI/BjXbvxH2nMLfV+SMGovie1ATPpp8i1sHWZQrJ+tLuI
X-Report-Abuse-To: spam@quarantine16.antispamcloud.com
X-Complaints-To: abuse@master.antispamcloud.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_141209_061572_27DDB9F0 
X-CRM114-Status: UNSURE (   6.63  )
X-CRM114-Notice: Please train this message.
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

On BCM2712, the Hardware Video Scaler (HVS) is connected behind an IOMMU.
Add the optional iommus property to allow describing this connection.

Signed-off-by: Daniel Drake <dan@reactivated.net>
---
 Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
index 9aca38a58a16..8f8aae9f3788 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
@@ -35,6 +35,9 @@ properties:
     minItems: 1
     maxItems: 2
 
+  iommus:
+    maxItems: 1
+
 required:
   - compatible
   - reg

-- 
2.55.0


