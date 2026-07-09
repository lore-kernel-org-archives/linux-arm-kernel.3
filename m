Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE322C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 07:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u7PlXoIiOCrPIQKlfbRweJ5ktznIESIxsbV+6crBLVM=; b=Op00GinRhK3NsGwyenckGI5wcG
	OrCzYdAlrdbibqIQG4UOKMOh4uZbc+6JtdVHaipdwAwY+RmurcTiLr7E+cPIhXaJ+tmejL0zHu/4G
	5D1Wg+NSpgUb+ex6vSudwwQJAo6jWScyDnFP+rCtxrc8Dt5jWLHfH991DNoYoEjf4Dm/p5o9oQ37g
	1ADTIxugFlsMKxUe2KrPohy8sFmmNHRafDmrtcIzACKrdJw/BrNOzUhD/wD6y4o68NzYbH6MJaNHP
	LQvoQkpIGVZFETPe11bPRq8DKR0cA65cFzmTfswXxcyD3WsZYPLINMXAHwOvBomwjY+k/Fz818EiT
	h4rDA2XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjEW-00000001HtH-0Gy4;
	Thu, 09 Jul 2026 07:31:44 +0000
Received: from flow-a6-smtp.messagingengine.com ([103.168.172.141])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjEI-00000001Hna-1mJI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 07:31:40 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id 7EAEC1380140;
	Thu,  9 Jul 2026 03:31:27 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 09 Jul 2026 03:31:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1783582287;
	 x=1783589487; bh=u7PlXoIiOCrPIQKlfbRweJ5ktznIESIxsbV+6crBLVM=; b=
	sa7Z4+uB2yhPy8EDyrVi2APYP7691CdSYOMjEiqfYbdhqe0pAlKsBoV+xaqTxI9A
	w9yjRvmPe3fKeX74g/vPIL4hyrPG2JOb5BIl4QHsRnOwJ1RcKL+ex3+/ChlvUIXk
	ZnimqzrAZidqkWMWelVN1+o2zmTjOqZdALUb9ulMqmZqO0e6u7XDzOYUxOjDExzW
	QPEN9HZnOStV5/3Tcsdgh0CoffzQZhTGZZMCTZOx0G1+gF+vxKULDW9cEaLAQamt
	fT87qp8Ox6AyZwJkXj4k4lC/2fgNdTdajsojFK7tJtgjhIA0RFxWQ61uTS1mpWXk
	dgzZK3TBPXtzsyq0y32yxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783582287; x=
	1783589487; bh=u7PlXoIiOCrPIQKlfbRweJ5ktznIESIxsbV+6crBLVM=; b=P
	+9IFoSlOUQ54GDb+4js5y5Owj10xbad54ohXY7hYgxuRhdPk4GxPiZiW/let3M69
	+nULKQXZZhMQKSszyuaRKiVbpFRflnCvFJUsk/4CW+PMdd+avNYiCefI450kvA5C
	mZ3CyYhZ1QofLkSyFOuW+dPZt+UtBqF4PTPdx28+bK3EkGFxfPfwacN9hrqEBMw9
	9P43tYEquel+2yP3oDpddOGf+KaLYSJPc/+VXOEEzKbEdyAycRIsKuvd9lNIX6Mo
	1GMmt6Coy67czyj5ygwTrReCwYvp2xhESePqqvyLWzGv73w0cfycgIMyqtPJwNdm
	tgG2usq8UjG+r/KLOV1Zg==
X-ME-Sender: <xms:T05PagMu0KtmKKAThENdwEN38TVH3utSO9t_CPrFcSIOm6NKd9L9aQ>
    <xme:T05Par08DzhN4w7BJKx0HrS9iGyWwH2B9qpVi_P17ba1W8Z1IdyhY4vkhHSJe9sR8
    SJE3NC8f7v4FkpBODkjol3d28QJoX_44IEQd0L8g0qtADFjdURZTT1K>
X-ME-Received: <xmr:T05Pak27dsuk6qqA0qZSJk2C-1uVIcG42RvRR6oKkFpG9jCIkKjNI6BGLXNKPz7MC01uRRqhU4trkUI66nSt2ZGkfpJobIh5YLE>
X-ME-Proxy-Cause: dmFkZTFDgvji+KZOYa7+nDRYV5XjpiHYyZNb+S62U1l3I0KgY+OxJTHOccc7LleD76+n6b
    Vf0fTkznQWCQtUJWgIlosDWTwuMIFaBxPt3fTu/P9Cx41Cuvrk6EyPr+NNfcbSVCPT3+Dc
    C6efMtdHDRJF5NN4unR+Llnrm9yKKGkxbNssZuc0MV99+GgEHaiE4b6Jv7DPfedmhEtrjl
    UIJxXa0C0eF7kFlLWMf7rGql7KQXWx+/7Zo6i0e6y7H1udqz2uSFZ55rFZXpgMXMistz7D
    Zk29AuVpkBQ7eIeXTsIe1jlElcCjhKZ98d11EqdTlN+SxLlaQ0qYrg2hFiC7rk7Z0xHuex
    96SP6TUDNib5CWq8FO9WrL/spXSXAjPCh/lp2j0A+P7U1a7Hp4bIw1eCUCiuJjmxLxkdOj
    WLrsJ51jTsZr+Yq/yWTV07wXtJzPxaYON5PUNNTYucuLmSUTpzGnI46WyO+mEe5lokxeYy
    r3pNxnfOd0XEOgBicDrnzjA5rsgIRVz9Bp6sperVy5pbFEyR24bk92f3iwxbmKwbh4krGc
    RBJEv1R0Tu6DZuA3Hi2ODnVlUKTSJxDVaJX08Yz8NnarJ+820WGEVZEmtLFj+IrG9uasDS
    uDE2jBIccG/LkGST3ztEZGNHDBRtsZ/H9F0nzR9yY7fSYSI1DHs/pZpROYIg
X-ME-Proxy: <xmx:T05Paqy9c8v_-83UTRO0b1xxltdz9VtKqfpWFrAIhKMMu_qXjpatiw>
    <xmx:T05PanmjiDur7PQSfmf9vpWVbkRkI0y0DdYAqL9KT1N8qwAqA9_lfw>
    <xmx:T05PauyXwotjL1aZCXa0Al2ieGUOXyoGSd_qee5IfruvOjO59yNFwQ>
    <xmx:T05PamL3pVRFVOnDTaLSXfRq5C6JNQUtpUUtG8gr5mDJBmbsWNiBag>
    <xmx:T05PaqMU25wPu2t0l4cSlfHyOji2Pm5FLaoGHy8EcgQ6DHRyXXswYcET>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Jul 2026 03:31:26 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 09 Jul 2026 09:30:52 +0200
Subject: [PATCH 06/11] dt-bindings: watchdog: apple,wdt: Add t6030 and
 t6031 compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-apple-t603x-initial-devices-v1-6-55b305833123@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=929; i=j@jannau.net;
 h=from:subject:message-id; bh=6qF9+LQf/ahNi17synXQrvJc75Sa7pH4BXwkTf4Bvf8=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhix/PzvFvf4XlPbuml1waZ/n29NfLCeJJ32fscjQUuY5n
 4HoPjanjoksDGJcDJZiiixJ2i87GFbXKMbUPgiDmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKpZ7Bj+qfhfCMtJfy7iULYkTHPitNUuCW0WhQwK73VPcU6dnrVbipHhkMPCqbK
 WQW+NC2u+Pdoq01+Z8uVK+Ntz5pd/fGXuqW/iBwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_003130_820873_6F0C5D38 
X-CRM114-Status: UNSURE (   7.98  )
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

The watchdog on Apple silicon M3 Pro, Max and Ultra SoCs is compatible
with the t8103 (M1) one. Add "apple,t6030-wdt" for M3 Pro and
"apple,t6031-wdt" for M3 Max and Ultra as per-SoC compatibles.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/watchdog/apple,wdt.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
index 845b5e8b5abc..bef8255022fa 100644
--- a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
@@ -18,6 +18,8 @@ properties:
       - items:
           - enum:
               - apple,t6020-wdt
+              - apple,t6030-wdt
+              - apple,t6031-wdt
               - apple,t8122-wdt
           - const: apple,t8103-wdt
       - items:

-- 
2.54.0


