Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA08AC44506
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 07:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6AeTQzIzHBeFMVZbMOHIYTBm0lF6jvBV/+e/FiVKNV8=; b=C+q+HG/0os5L548jHqQ6ijoZzD
	ix8ygoIB2Z57CNMamuyyzBhI9ToA3dmA9Vt2COdO1ZFeE/ubbF7vopwQS7saI8HZBWtUNU8z7Qs9t
	eWITj6/ZBqko341JMUTfmsHUWR31F/Q5GtAMAmHYyAPaqz9TqxrVie5atXrhh8aKZ8+1pjQua/FwH
	UauEAnLw9JQ4A3rJPN/+4dBsLh0nOhWHcnFh4CYBElLmYxVqj6egOdqaE3WGC5WVK/1o0CP+sPKaq
	zCkJTMEOX5eSzJUervylEAJIqTFY0rcXrwMERJB5p2G2f/UZBwzBzBHlPXCepuraUyeL7sgR2YQ5e
	xOv13ycQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjEW-00000001HuA-47pQ;
	Thu, 09 Jul 2026 07:31:45 +0000
Received: from flow-a6-smtp.messagingengine.com ([103.168.172.141])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjE8-00000001HlF-1YuM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 07:31:41 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.phl.internal (Postfix) with ESMTP id A0A1013800A3;
	Thu,  9 Jul 2026 03:31:19 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 09 Jul 2026 03:31:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1783582279;
	 x=1783589479; bh=6AeTQzIzHBeFMVZbMOHIYTBm0lF6jvBV/+e/FiVKNV8=; b=
	Hjj0fm4QY0sZpzWnVcpZPeISxW2xep7myJhp1XvNvABpE9dZZWMIS/rzEDqY7UII
	YM2xliZOqzAoVP25Hs3eFOK8q3QpE/YIZyjzXCZ1DjPe3CkgPEK2s+fPGmXZamm9
	q0ZqAottj3Ko4y556MJV/GJ9iLolUD9iMCgK2879XHjp7FVHR24gRE5xgtBE8Zm0
	e2VwjtEkK57Tf+BB/K9qiiiPBAlyNDt5bQiT9GM9eWfZp3seJjqE9LSTMghGNe5B
	IesBBQMrNPSq04vjVZdZgmDIYMiFrGRdDxrqyGN78xPVnJs/8hY/pX/16mUOmA/w
	or+20GpO45kE2A/m4UyGQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783582279; x=
	1783589479; bh=6AeTQzIzHBeFMVZbMOHIYTBm0lF6jvBV/+e/FiVKNV8=; b=g
	1dYVUsOiiSmSeEIlCtS3fPdvsdZDpHTY3mowA+41IrsmbKjhVSYC8++lJO/FDraQ
	eTL4uOfhDmvmND5j9LQGr1bEb/ZGuG3am63R9+NMyAnAYvfUnoDqUSIYAPOQO1Uo
	AyBSWrRJg5i3VTonN2/KyE5Rb9PdKsAIhob7PNHvqV7jf5+Lwa/mPtynVZf/N5S5
	y9FY6E74t+Zbt49n4BOxyScjWsVrsglxkMMsCabYdZ/Wx5NqHBm4pHCjK6nuHrUR
	anoJf/exuLV8tRRgTAkfzlr9z8edHf7hs7srJtiu91eN1hzX5cVDdUt3ZKZy7SDc
	6r0p7AgAW5H+GqBwDxZ5A==
X-ME-Sender: <xms:R05Pao7qQ7vrdZDYHl3n1nVpcIx09AjhCch-Y0OJOmlNpk4bpIJQjA>
    <xme:R05Pauxl3yHKP7r4hDw3K42xq436kAXF2XbBjFbLWdg1WbrW8dxkskipDuk1AerXk
    uVQTbFpysJ7mF0czEEMX_sgEbHsE8jiFDFeFC15Uz6y3kW3suvbJ0M>
X-ME-Received: <xmr:R05PalB-bBfrFOcdg7jVHNTYvc_giBOvpLSfC3nr3CymrDYd1fsQPHZWd1I5le-YeC2rUTxosLXmPXo5kVAP6jfe-abYAK1MKgQ>
X-ME-Proxy-Cause: dmFkZTGYKeAHgJKVIjqCymJpihoZrEqDQaRIPCKXxcc6uiPXzJNTDc4H4LzsUaMF9MJqYB
    2rpTe0oGhrtQRwfHcGfbJPzdaNrx81amtkEDFVv/fGamGt7vZBPR3jcucmA5JRiTwERHZr
    8zGRG/w0d07G5jQ4PlCj5gdYeuagoIAoYXQ4A9l2tOaakbVPoRmPGeCRSKDT6z7tQH03AB
    WTVwikV9P4YqczS+ivH9R0MDJM1iJWbkLmAFvo0DWmHZGz3C5uxbmrt35Eg98JoTPuzJKd
    X/sNvlqMxvVsFiGXNnL3d3+h2N4QVm3ifsTcrDacstkEioZW9DpvzWMrk8s16EPWaQL8MG
    ZAbowBZnyXLv9tsluktebIjGBtGna6618xVyGFC2mYgWtKZYeM+pQvke/silwCVX5Ge3VR
    Kg7Kj8Nh8cDYUIV9qspbjnjh4lj6p+MECTV8TEVE6tvqhAFuyYQEyw8IdZEb5ZIBjPa1gZ
    WXlBWiUNpUdEIxwSPN32jX/cjd/R9h/ZAJZdNRAfAMI2jSVo3IbyrUxuDz9j5CqSAQyRyD
    dXUatib5QbK2Sn/nRYOS4ZDYNaj/5mYDPKFmi9qp85y+KyqNBDvUJbBcmacBEiptS/a9Ng
    tA46s3a95YKozWlCKfGx9iaeADmTq467dhS8VPZ4CvI9FUXMjcNM+Ca4q/Dg
X-ME-Proxy: <xmx:R05PavN3EFFZrZP8Px0MZ7CYRrnBHDC2msytRe7JBSHL3psr-Z7kqQ>
    <xmx:R05ParS9EzpyT0U1QUFw4CQCdwLAwS9Uytt9uISdc7cN59Ps5dr8Pw>
    <xmx:R05PagvF8T6U1XCYXO8T5Bovf05W1sDdqFD68WNM3GtVY5Phy7LxqA>
    <xmx:R05PapUH2nyuuTysUxSSLPmMv9nI1t5WqKTjhUj3xRe2vx7DAlq6xg>
    <xmx:R05ParLi3iDwZdyHU-4VrqX60O9PXzhQEEQ5vBsQQE_DaznU0tPnLn3N>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Jul 2026 03:31:18 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 09 Jul 2026 09:30:48 +0200
Subject: [PATCH 02/11] dt-bindings: interrupt-controller: apple,aic2:
 Invert #interrupt-cells condition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-apple-t603x-initial-devices-v1-2-55b305833123@jannau.net>
References: <20260709-apple-t603x-initial-devices-v1-0-55b305833123@jannau.net>
In-Reply-To: <20260709-apple-t603x-initial-devices-v1-0-55b305833123@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linusw@kernel.org>, 
 Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sasha Finkelstein <k@chaosmail.tech>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1499; i=j@jannau.net;
 h=from:subject:message-id; bh=yxRKZLxoxk7Y1QKVW7z6u95eMhug7tWF1IITEe6Dojg=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhix/P5sv6jJlRW8OS114FsP4Oqdq+9xyk8CEU6a/JBb19
 tz4MamzYyILgxgXg6WYIkuS9ssOhtU1ijG1D8Jg5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmOr8ZQz/M63czQqvcbPlaRyW/xFw/+W+xdKPkvhi2Gv7Hu55EHNiMSPD6XOCv3e
 8im49eXe7xcO7+++KTLDSvXqrNON170PbxDZBBgA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_003120_929073_AEAA1C6C 
X-CRM114-Status: UNSURE (   8.72  )
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

The condition for 3 or 4 #interrupt-cells list compatibles for the 3
cells variant (not used in SoCs consisting out of multiple dies). This
includes the AICv3 base compatible "apple,t8122-aic3". This will match
    compatible = "apple,t6031-aic3", "apple,t8122-aic3";
shared for M3 Max and Ultra based devices which require the additional
interrupt cell for the die number.
Instead list the compatibles used for multi-die SoCs explicitly and use
4 #interrupt-cells for them.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 .../devicetree/bindings/interrupt-controller/apple,aic2.yaml      | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
index d0d9a90e96e7..a94787939d34 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
@@ -128,16 +128,16 @@ allOf:
         compatible:
           contains:
             enum:
-              - apple,t8112-aic
-              - apple,t8122-aic3
+              - apple,t6000-aic
+              - apple,t6020-aic
     then:
       properties:
         '#interrupt-cells':
-          const: 3
+          const: 4
     else:
       properties:
         '#interrupt-cells':
-          const: 4
+          const: 3
 
 examples:
   - |

-- 
2.54.0


