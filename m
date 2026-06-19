Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F203CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 20:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+39Us0l8jzl2sSkZosAXigE21lGynPqD4B+AFWDahxw=; b=JoWu5KaC3jXwpS8w3u8ZeE1ntN
	7kzgaXgWDKr1YEDqGUeRBZMfTC7VVA9nGW0nyPTjJGQ7B97CkyQsj+iJpYiU2msbiKtPmR4CJTGhu
	sj720qeRA2t/FcvOZMYr3egO7B6xb2UAsIvNPg+4IdSqpYfv4JeHKWoBlMwIeA/AprtQuuiBqbAJy
	IXFgOQGX53zvCmp0O+mJfWIHe4a22W9wOEpUOAPtKzkyjWFqb52818ETb7glf2lpSscYoYETeeszs
	cHEUMdLe7BWOJYOVWKYk5XZPEqTjTTq+Z0VZ78RzDHAOZIq9V8601IS+/U71XZqQ8CdGRiQ/IlHcU
	HubqncSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wag9S-00000002zhx-0rX5;
	Fri, 19 Jun 2026 20:49:22 +0000
Received: from out13-173.antispamcloud.com ([185.201.17.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wag9O-00000002zh5-36xT;
	Fri, 19 Jun 2026 20:49:20 +0000
Received: from s1041.use1.mysecurecloudhost.com ([192.250.231.249])
	by mx197.antispamcloud.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <dan@reactivated.net>)
	id 1wag93-00890c-3C; Fri, 19 Jun 2026 22:49:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=reactivated.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+39Us0l8jzl2sSkZosAXigE21lGynPqD4B+AFWDahxw=; b=w4jyc6Uyz0ac36MGyhdcAceZ3B
	yP4lSimBquYRufa/0PJjMOABI+YHEAczg2KnLkzVnyoQfUrS6lcCj4D14QQsl71lR8wqA5acz2OM1
	FVqQP3xljDg3rFoA1rtpE4xzyHOcmmoCU1QHGGMRPzPtlBNdBmXv9iyKtNZrLb8pn6pwrlfI9QjSk
	2dcfpKPzvxWiW5IyVGrXhvVcUOQnOVFy/kqhRbkMt0qg1qyoBy3YImSstWEaT3Kgj0OT/BgTPzM3p
	5XBTVo5+iaHZpmxSILssUYvFcIjbzzsU2J7OxCH5j4U6gqcMcEYwrYyCbVds8JRGOQ3S5qvpGKtGh
	QC6R/Jnw==;
Received: from [188.251.249.2] (port=44192 helo=numbers)
	by s1041.use1.mysecurecloudhost.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <dan@reactivated.net>)
	id 1wag8u-00000004qzj-19aO;
	Fri, 19 Jun 2026 20:48:48 +0000
From: Daniel Drake <dan@reactivated.net>
To: maz@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com
Cc: devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	m.szyprowski@samsung.com,
	andrea.porta@suse.com,
	Daniel Drake <dan@reactivated.net>
Subject: [PATCH] arm64: dts: broadcom: bcm2712: Remove non-functional EL2 virtual timer
Date: Fri, 19 Jun 2026 21:48:32 +0100
Message-ID: <20260619204832.586079-1-dan@reactivated.net>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Get-Message-Sender-Via: s1041.use1.mysecurecloudhost.com: authenticated_id: dan@reactivated.net
X-Authenticated-Sender: s1041.use1.mysecurecloudhost.com: dan@reactivated.net
X-Originating-IP: 192.250.231.249
X-Spampanel-Domain: s1041.use1.mysecurecloudhost.com
X-Spampanel-Username: 192.250.231.249
Authentication-Results: antispamcloud.com; auth=pass smtp.auth=192.250.231.249@s1041.use1.mysecurecloudhost.com
X-Spampanel-Outgoing-Class: ham
X-Spampanel-Outgoing-Evidence: Combined (0.01)
X-Recommended-Action: accept
X-Filter-ID: 9kzQTOBWQUFZTohSKvQbgI7ZDo5ubYELi59AwcWUnuXx7vJpnF6lBq6hkdASV9+OkedQUW0QyFWx
 GFqKMLRWBiu2SmbhJN1U9FKs8X3+Nt06bFpPrNOlRAlE9AVLwR4uGVjKNnzF3nQoDoQtBifM84JL
 M0i5ZAms0EHrvcCaVIP2mhp3lwZCcR+loQ9rUxFdGnT3EFAinyrilm9zau/FuzkQt9Nb4Ml7QXdk
 EetczWCulNo0fvnzmZPW3MC2/ZtQeB7itP8hgjDRserKv4bhb4U5wM0P14+8nxGHhzXnVJtWBb39
 uS1TjWG2Inx+Ts2QrtVmombMJ4e2pn5C0yBMHZ0fE47nEjvubMSTLAkKCKclZzoe+TZdeH39wA4E
 grA4pE2PuLHIFQdBY9qb1rRWgyz0f29FZkQs6Ir87R/YNAtTbKw/GxYwf231heSaMVJD3jtYeKQZ
 QbovbfYtT7PWp8pdSgmbkvrIIacvajJHtO3S72G/q9ziRoPKvNmo60WYDMXZ5YhhGUSWFJu3WKou
 EwQMVfCztWYwHh5jFD6dTwPfWGjEg64G/H9xJ2Y/CUklmGXi9rEnl1nptmzo1mQZBXsCNnEIDr2r
 S37r3RSowsgpmnyhr47o3f4p0IoMTDhsttxEE84eFRPQDFeOmeRXGFNiLZt/QXQnOBRD+jq1HsLJ
 QaIV/mxT7GP4i/LIyHAmHyxxk8Sjs3o9/k8nLBnptKmIYbwfwINR1tlyGDj4wlKVL5CXNSk/Azmi
 JysF8dLHRyryw85/rAZb27+VZ3biGmceXSkEeDVzkpbfiUL+7qzaJBtZgkO5qAu/YKHH207PElLT
 oU/bGYmMXNUpR96ykJejswBocUyWLb+nt4o5Q7Da0TeEmYYYhwjEmZXEzeR1vCrJPmnnTHzVkpyb
 MK7ZTcjS0BktKCLK+lOkK/WEj0VIEqAi0wzqTkXDhL9Md9nbUE2RN8rvsyYrGXJTMg5Y0yoXKI6k
 1yFeXmpEy95koyRa37QZnmyww5QtT8/R8Y596J1fhOzjF0b4LXcjJZ5lou7aqQiaNW3qhwBx9vcu
 F5G5dCB5dSrZK3Ai42bfKZFGHA0x+xwl3YvXKx4bI5c+WWiFcbBNf9Y5mOHdufFntjUUUv+K3yJx
 eej3LRclw6ozvoGUBjUvvpdX+2T7XXXOS8oCG7c9HKFAousr1fg0ssl+6RlO7s/UIdgWJf6ThYnP
 9TX9YPaVQqjeGKYJQApZcII8LuKYpMHXESnLscDyjGqrGhRTt2THEelqjltfp0dGXPWlFdaGOH19
 1uXjgjQN/afWw0QpVLSzwSAqmb7CWzsSvlypk4kswkWqo94gxix+ipXGdBzoZlVYBe5JAbg73gCe
 IZyBg7HvH2nIa17LbgjKuFO+2mEj3Ei2hTvWconvG7gOvC4mGrn5xNl9tGvdjUoh2dM359Vvgmke
 Sgio/ZYij6tMUpMEVczC0SBn8klXnJ8JIFnbEDUJ7Rx+lCO8WACeIZyBg7HvH2nIa17LbgjKuFO+
 2mEj3Ei2hTvWconvAtuK2cz9C7Kez+6+t8E/BA==
X-Report-Abuse-To: spam@quarantine16.antispamcloud.com
X-Complaints-To: abuse@master.antispamcloud.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_134918_820087_7752CDA3 
X-CRM114-Status: UNSURE (   8.12  )
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

Commit d87773de9efe1 ("clocksource/drivers/arm_arch_timer: Default to
EL2 virtual timer when running VHE") causes boot to hang on
Raspberry Pi 5. The newly-selected EL2 virtual timer does not generate
any interrupts, even though the GIC_DIST_ENABLE_SET flag has been
confirmed set via readback.

The reasons for this failure are unknown, however it is likely that
this timer was never tested. Raspberry Pi's original devicetree did
not include this timer interrupt; it was only introduced via a
suggestion[1] made in code review as part of the upstreaming process.
(Current RPi firmware versions do include this timer, but only because
they rebased on top of the upstreamed devicetree starting with
Linux 6.12)

Until more is known about this non-firing timer interrupt, remove
the devicetree entry to enable RPi5 devices to boot.

[1] https://lore.kernel.org/all/12363be5b11c752b7155cc0c416fdfd2@kernel.org/

Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/all/ea15cce1-b393-43f6-8d58-3d6f90f0c0cd@samsung.com/
Signed-off-by: Daniel Drake <dan@reactivated.net>
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 761c59d90ffc..09ff5e9959d3 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -678,8 +678,6 @@ IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) |
 					  IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) |
-					  IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(4) |
 					  IRQ_TYPE_LEVEL_LOW)>;
 	};
 
-- 
2.54.0


