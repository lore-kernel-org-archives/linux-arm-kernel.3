Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A65ACD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 21:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rzfx3/2Lg9FedtoMYav8nQPZl3cNmNWSkqzUmxYUKB0=; b=gL2glWxSBTQq1pHCAcfUH/cfMd
	2vmc7WH4O5mCnplP0LQmhJmONg6tjOsiWp+9b4qPLL9xNKeeMCC3dnraxFDe09iz6Epo2r1IpD7Cn
	mlGyJ4iyjmB0V2PJ23vSxxTtotZM/CDpMvCD2SMoNgMI2vJHUNKL9krgB7YEJOV3wBe3oAt6cHkCx
	incaycNX50oZTca6/Ah/QzdiOhE5qztzXSrB0uuhyqg/65f+tKUiyqdBTr9hGeo1TUu1UmTIKb9/v
	dt/w1C52X9uIJXbc4s6KAi5bISG2yedi6h6m8kML1K/ZeETTURIdrFIesOjm3ajU29KXd/CPKn6p2
	FMyHL4bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWh6o-00000004PJK-1832;
	Mon, 08 Jun 2026 21:02:10 +0000
Received: from out16-31.antispamcloud.com ([185.201.18.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWh6m-00000004PIu-1k8y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 21:02:09 +0000
Received: from s1041.use1.mysecurecloudhost.com ([192.250.231.249])
	by mx199.antispamcloud.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <dan@reactivated.net>)
	id 1wWh6f-004mve-0F; Mon, 08 Jun 2026 23:02:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=reactivated.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rzfx3/2Lg9FedtoMYav8nQPZl3cNmNWSkqzUmxYUKB0=; b=G37tR6IJQC4ThP9e1mxPGfn8DA
	qIFuCw+JS7LoPaGBorrrKy6yZ99pfq5Spb6dSbm9sbt2mb4LrHMr0HxeXHUwKUY+OfEvMIMeC74We
	JrSfKGxOyui0kJ8ZdP/oyKByyAcmsLfGT/nHpujuQhhuFqWgyCo4yH07uxA7u0B3QKhigdE3h0qAI
	ablDBrKJH5z/naPJpqcbFZ5IvVCtpB+9o6t81/cR0JEZFuhHj44OQc2W2coB1JlWSqdoF5yk0FxwW
	keBMEQTiWcdymI4IMdwxusicGkXjfX4nLXFJLU9UIn0kXMUFdzTs5SYCJpveDS0z5f/aL+5432ek7
	j2dlpr8w==;
Received: from [188.251.249.2] (port=48646 helo=numbers)
	by s1041.use1.mysecurecloudhost.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <dan@reactivated.net>)
	id 1wWh6Y-000000022ez-3X24;
	Mon, 08 Jun 2026 21:01:54 +0000
From: Daniel Drake <dan@reactivated.net>
To: linusw@kernel.org,
	brgl@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Daniel Drake <dan@reactivated.net>
Subject: [PATCH v2] gpiolib: handle gpio-hogs only once
Date: Mon,  8 Jun 2026 22:01:08 +0100
Message-ID: <20260608210108.36248-1-dan@reactivated.net>
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
X-Spampanel-Outgoing-Evidence: Combined (0.05)
X-Recommended-Action: accept
X-Filter-ID: 9kzQTOBWQUFZTohSKvQbgI7ZDo5ubYELi59AwcWUnuXD8nP0t5KbJKt1nTB5RgjSropx1bgdiqtr
 ZszKkmfHPCu2SmbhJN1U9FKs8X3+Nt06bFpPrNOlRAlE9AVLwR4uGVjKNnzF3nQoDoQtBifM84JL
 M0i5ZAms0EHrvcCaVIMNMtFmNil/JOMFlKm1w9vmGnT3EFAinyrilm9zau/FuzkQt9Nb4Ml7QXdk
 EetczWAg1NJkF77+oGQ+lxJlCrsUeB7itP8hgjDRserKv4bhb0/SRhwoSlflSk9103+2bwRWBb39
 uS1TjWG2Inx+Ts2QrtVmombMJ4e2pn5C0yBMHZ0fE47nEjvubMSTLAkKCKclZzoe+TZdeH39wA4E
 grA4pE2PuLHIFQdBY9qb1rRWgyz0f29FZkQs6Ir87R/YNAvW7iH+6DoE8NeDBUxImZIxHxsBXq5d
 3sVlH8/8/BVjaCxdqoPv0tTPBZ82RqaKH6ZJMkXL9fD6+WIpcQ2t8oQM/WEMAHr5BYwqeYfWeqTu
 1YC/tOVjI4dWyTvfTQXGjT+aEfC5mTBtCltny75g3MKubALAOajlmHbHzeutXs2uHosTaX/E9TB8
 42c3huE/T1c93SsS4aMXJmiJ2G0eb5ahq2kqyMRk6DLUUjpi54Q90umYmC9jerRVX9sTO+FXU2n4
 L0nk+TooPV1h2BXu3/c8Dfd/7JO6UaIAUVkvSizih0TzynhIhk347ucixeDFxznIHYi/jghIJpVk
 vIZQze0B3kz8gN6WZ2gYjiDJZ8+Xhccq6eblGj9pTfEleg7j+bhXujwKUFU8sFr6iwXfZAUpoMJ6
 ZvLBGAuQy7kKe35X8A4hD1HJK3j/SWnY9PEN+60i4mPHPjd3IwkPyc5LFKq/kOGb0cYHyPY2j2dm
 0K42EWNTFNprR2YbHabvwl5Tonl6S6BRBSooSF0jYMHjtHZIXlwnafkB5tRGEHfx/aXf18fhf5LC
 X5mVYquwf/zw2es8CVsONrMJuGzuoGnKTKcyg3bcd7cgjVVOyYbTvAjTK9NRUZyZh3i1BVa95w3H
 U/64kfarWNx6rm5P0Cgcvjq6fukZTu7P1CHYFiX+k4WJzymhN1wTLjVDHau03TfE9xTeNHk15Vol
 AGHS5rCXQKDy0SfOZK4LO/8RiwiQiWEeCWHDWbQkk7jdCVxF0EZ0jGH7WQnM6idBM1wpwQ7gvWTg
 fukZTu7P1CHYFiX+k4WJz5FUgW/lUuMzise8yz5SBwf2OKHH5lr9xXvSM4nM3avg
X-Report-Abuse-To: spam@quarantine16.antispamcloud.com
X-Complaints-To: abuse@master.antispamcloud.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_140208_486046_1F3B0579 
X-CRM114-Status: GOOD (  18.95  )
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

Commit d1d564ec49929 ("gpio: move hogs into GPIO core") introduced a
behaviour change that breaks boot on Raspberry Pi 5 when using the
firmware-supplied device tree:

  gpiochip_add_data_with_key: GPIOs 544..575
    (/soc@107c000000/gpio@7d517c00) failed to register, -22
  brcmstb-gpio 107d517c00.gpio: Could not add gpiochip for bank 1
  brcmstb-gpio 107d517c00.gpio: probe with driver brcmstb-gpio failed
    with error -22

gpio-brcmstb registers two gpio_chips against the device tree
node gpio@7d517c00, one for each bank. The firmware-supplied DT includes
a gpio-hog on RP1 RUN, and this gpio-hog is attempted to be applied to
*both* gpio_chips. This succeeds against bank 0 (which hosts the GPIO)
and fails for bank 1 (which does not).

In the previous implementation, failures to apply gpio-hogs were
quietly ignored. In the new code, the error code propagates and causes
probe to fail.

Closely approximate the previous behaviour by using the OF_POPULATED flag
to ensure that each gpio-hog is processed only once. The flag was
previously being set before the gpio-hogs were processed, so as part
of this change, the flag now gets set only after the gpio-hog is actioned.
The handling of gpio-hogs on a DT node with multiple gpio_chips remains a
bit incomplete/unclear, but this at least retains the ability to apply
hogs to the first gpio_chip per node.

Signed-off-by: Daniel Drake <dan@reactivated.net>
---
 drivers/gpio/gpiolib-of.c | 5 -----
 drivers/gpio/gpiolib.c    | 8 ++++++++
 2 files changed, 8 insertions(+), 5 deletions(-)

v2: move OF_POPULATED flag setting to happen after the gpio-hog has
been applied (otherwise all hogs were considered already-applied
and never applied at all, oops!)

This bug is only exposed by the RPi5 firmware-provided DT that has the
gpio-hog. The DT shipped in the mainline kernel does not have the hog
here. I'm not sure to what extent Linux cares about supporting the
downstream firmware DT.

I'm also happy to consider other approaches. This multi-gpiochip setup is
a bit weird and gpio-brcmstb could perhaps be converted to register only a
single gpio_chip covering all banks. I verified that the other drivers
that obviously follow this same multiple-gpiochip pattern
(pinctrl-amlogic-a4, pinctrl-st and pinctrl-stm32) do not seem to be used by
any board DTs that include gpio-hogs.

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 2c923d17541f..813dbcb91f6f 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -1066,11 +1066,6 @@ int of_gpiochip_add(struct gpio_chip *chip)
 
 	of_node_get(np);
 
-	for_each_available_child_of_node_scoped(np, child) {
-		if (of_property_read_bool(child, "gpio-hog"))
-			of_node_set_flag(child, OF_POPULATED);
-	}
-
 	return ret;
 }
 
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 1e6dce430dca..b02d711289d0 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1031,9 +1031,17 @@ static int gpiochip_hog_lines(struct gpio_chip *gc)
 		if (!fwnode_property_present(fwnode, "gpio-hog"))
 			continue;
 
+		/* The hog may have been handled by another gpio_chip on the same fwnode */
+		if (is_of_node(fwnode) &&
+		    of_node_check_flag(to_of_node(fwnode), OF_POPULATED))
+			continue;
+
 		ret = gpiochip_add_hog(gc, fwnode);
 		if (ret)
 			return ret;
+
+		if (is_of_node(fwnode))
+			of_node_set_flag(to_of_node(fwnode), OF_POPULATED);
 	}
 
 	return 0;
-- 
2.54.0


