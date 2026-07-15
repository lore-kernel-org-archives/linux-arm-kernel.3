Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23467C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 09:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sX2YhaiL1OaBEzTxmNH0cLCppiEDR4r4H1OmjjhusSE=; b=JBZlRKZrutg4L96r+LZx3WnB2Y
	iKiSN+t74bJm9rjhFy/xrjkJDqqQ/M0GFxiash6j3qFm39/Y4PA2KND9HEE40qClARbe7puLDFvF6
	rbwLOUnt9ourJ0jsPhYje5/F8LfaCMF3wmglWZ9pzonTCyGACfD32y916Q/CRFiiqEfZw7FcynMsP
	KGf1lZPk9xwJbyjCPPDlvAbRIsk/ERZCUkDQllE8W8GBRP2rvF90ZdaOcbFrubcFMIJc9fH7YUymH
	072xcraeCnGPwXdsUX79mYbYIxAMhBJd5XqB/3QaovpqCGJGnfRtCq4a6ucx0stqTnjhP+UvQlpVA
	a4GGPT1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvfC-0000000EHWu-25d0;
	Wed, 15 Jul 2026 09:12:23 +0000
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvez-0000000EHMC-4AmR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 09:12:11 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 407BBEC01EB;
	Wed, 15 Jul 2026 05:12:09 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 15 Jul 2026 05:12:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784106729;
	 x=1784193129; bh=sX2YhaiL1OaBEzTxmNH0cLCppiEDR4r4H1OmjjhusSE=; b=
	BXMbElBVzxKSF+VXm+7pUA2QUopHRrhLo+EzMIuNGl/zClMftr0to67DJtfNgSp8
	uCLH4Tninm/FHHtfbtohTjtB3ix6yV6S+/pVCeUeyjG52cISakbpw4hHW//gMfIq
	onRTtonq3BLjmSrh4epkSTxbBxO4WxLG05g8SFXHxXmebAHn6Ou8JHz39a6iDXlz
	2jWaFWGwNaaiybBUELQ57oSOfxADyox4G9BhcUxCdf0ucOLo5kBjISzb2+Xed9oG
	hjHmfhPKvyQ0skKhxw1ojH7pVyhl2vA8zcSkQvXrI0Vf5Be+NusI+1r8qySSreW9
	YTGPcR3CVhs74K3/a0gG2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784106729; x=
	1784193129; bh=sX2YhaiL1OaBEzTxmNH0cLCppiEDR4r4H1OmjjhusSE=; b=B
	nPtqboi+OrhDfjoa3YfFbB2tSI8s8fUzmOBgwRgVHSFPOjzYRlHIsN24MSp86ynp
	mc8SpZpapCSNZqseM8VJUWiHff3DGAedokF0k8va0TeIRyqGA0F5Nz/mB0VXB5UX
	050c2y4RQMtHuGq6VlsRSPhO/9PHqHscupWgpDcUjyyaddiEj5kIneGUOZNdTO+w
	+WXUzzGMGQ+6K4WMwdEuOQ7PcOKULVKEex1IoSwGQ9yKWkcPw4IAKskYM2s6X4tA
	LJcNPoBjdlYR0TJgCmHUyaRoJM6r54m92FCQ6wOWdeguJ24b2W4bxTSNokKrCO96
	ZTFSDgQoJUECYZj+jvjPg==
X-ME-Sender: <xms:6U5XavIGHp7lckCLGBDe5uxVOzm-vDbWdSh04CEamc5S0-cQqczdVw>
    <xme:6U5XajgVLVrHgjGJqBVKZO7h7xpUl_PWzakAHOUZSAC_uoXel2aG-OPFzh7CPXUeg
    lyc23owt0Dkr9tkvnfiPC1jU7S6QRO9sHsu4Wk26g7xGH2_EAq61FM>
X-ME-Received: <xmr:6U5Xao1mnISWO0fxZb71bXKaROnpUtuKBvjJXLVZbrVzEdl-4vEryOiwYci5jg49QMUFIqB18aG9do4WRS2EGR2Oo1Q6CW5Xd44-Ag>
X-ME-Proxy-Cause: dmFkZTEW04HtTf+zNef7m5r/Wybx1ydSPmxeGPzAYI5SWVBIt9NF+gliEmmzRtNMmeyncy
    0yH12g4gcKN4bwgQ9/fxkVDLkA/oJQKBqhvmVPbO8YzIkt35ekG+/k0lN1XR1RUOe2vlYy
    9oh0a9s2MeN7rHW5UMydYFPb+rmR89Xmz+kCkWxhD+fm56RfXxSYKM4k+nBq3+TLUtm39d
    wb/YON6eLtDPA751fCTGB9EwOodztE2RbFbzkkek/KiqmBaiq89taQ8SgYyX4XMGIxWBrs
    FEpjBwG/7g2vXO1BGnw4zPV7vNeivmHu8Q5ocRpo3auKeu4wiZy38k1ASmncIsKxkpduds
    Sz8A4CKJFCiNQSm3kK66GT9x6nAm4tRGkzoQSFgZBb0hzEXbNp22UywqQQzvdm9uAm1qVq
    f6QOq1bWoZGzhL8pq5AWQw6uq0EGVSHYpqmR9uEpjcRxXRGSPzxRYyirWWdrpKol6LEp3Z
    XhZB0DkfiL3s3SNCE3oKYYClqFhG3qC2aMpWia4MZMsT7P0SUocfAXExVNAPUtiQm1ITtw
    mNQkl8lyLQujN4Wh7gaQ0WjPnjTSQY/C4OC4OPCKlyrCa8yi1r9ZZReamkpFw5jLGC4Bfy
    TEF5JTDDcOaR9AT8oZXnjfyseuVhT4qL18+WJhS4NLwbzHj1qflVZZJXMfgw
X-ME-Proxy: <xmx:6U5XakYJiGgG18ZT_s99oqpacKOdinlS1pBRHHVIAPHhrk4IbHMmCA>
    <xmx:6U5Xaljb95W0RIA9h_VKo8hXmr01ymwCVutl1XpOWE19wNJVknTtBw>
    <xmx:6U5Xakgcdbk-sHnEdDLitFUApMfzpuaeVh46t-eKOo0jAgISrhUDrQ>
    <xmx:6U5XaiBYy_bbpwSE-km1zP-qKi-LaqNMlJI0e1LBS-r4gX0_LKgIAg>
    <xmx:6U5XakahfFd3_uGKGocbFy3ySG8m86E-1i3tLeTF9Ag7xawFoOSeQ9q7>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jul 2026 05:12:08 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Wed, 15 Jul 2026 11:11:52 +0200
Subject: [PATCH v2 05/10] dt-bindings: power: apple,pmgr-pwrstate: Add
 t6030 and t6031 compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-apple-t603x-initial-devices-v2-5-df65b2485710@jannau.net>
References: <20260715-apple-t603x-initial-devices-v2-0-df65b2485710@jannau.net>
In-Reply-To: <20260715-apple-t603x-initial-devices-v2-0-df65b2485710@jannau.net>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Andi Shyti <andi.shyti@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sasha Finkelstein <k@chaosmail.tech>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-pwm@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1093; i=j@jannau.net;
 h=from:subject:message-id; bh=xaQwy2F8TJw7lpUgqNA+WjqJAIV4pUnYELH8HbbUMzw=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqxwvxu/ebWqG8zfqFy5sMewa7G941yFL2/W9HL/qrsZf
 uVkpqhPx0QWBjEuBksxRZYk7ZcdDKtrFGNqH4TBzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNXfQxn+p5TJvV4XXXWn50Ou7d2AnQWJ7oV/by/mZtDL5fy9yTX7LyPD5GdKTm8
 3HOiOXsL9w609P+NjngOX7daWA6uyt/FErI7gAwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_021210_169424_2F57927D 
X-CRM114-Status: UNSURE (   8.47  )
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

The pmgr-powerstate registers on Apple M3 Pro, Max and Ultra SoCs are
compatible with "apple,t8103-pmgr-pwrstate". Add
"apple,t6030-pmgr-pwrstate" for M3 Pro and "apple,t6030-pmgr-pwrstate"
for M3 Max and Ultra as per-SoC compatibles.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
index c9be097cfba0..e269f433524e 100644
--- a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
+++ b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
@@ -45,6 +45,8 @@ properties:
       - items:
           - enum:
               - apple,t6020-pmgr-pwrstate
+              - apple,t6030-pmgr-pwrstate
+              - apple,t6031-pmgr-pwrstate
               - apple,t8122-pmgr-pwrstate
           - const: apple,t8103-pmgr-pwrstate
 

-- 
2.54.0


