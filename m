Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34012C4450E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 09:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5BTmpGAAJIGxFJa3QZUQ84cSW7EHGx2SH3vpZ10Sshg=; b=RAm+EZUvayRvz/lI3nNyx4cthl
	1zkUSrrDXpvy5SdoA6vjxeXtcTLFpldCYYy4TKf7jKy2MDTfVOGuQKmlU4FYSB2+V9mhFf4a3yy+y
	A8MJXiaDDa03ryxdPvTXtf+qj7kIy8YtQgDfKgXJKLd7IKGl924PS/E8S9zmrBTRVjJpAoIXsiVZr
	R+31GQJuRagxzN/V/sJnh/hlw9MjXhHjGFxdi0xix8AUFUsHqTp6OZ1e+puhrt6TADsQdG0xbtned
	Bkf9S7iuWvzNO5ioGzK2hGCyXAoSWNdC9LG1oOJH3W114RrfZwx7TEdESQcAMdCreyompBoNNB9rd
	4EFCLQWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvfE-0000000EHZC-2j3v;
	Wed, 15 Jul 2026 09:12:24 +0000
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvf3-0000000EHPh-2wLn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 09:12:14 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id EA432EC01EC;
	Wed, 15 Jul 2026 05:12:12 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 15 Jul 2026 05:12:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784106732;
	 x=1784193132; bh=5BTmpGAAJIGxFJa3QZUQ84cSW7EHGx2SH3vpZ10Sshg=; b=
	gKEGHd9kRH83Cpz2+lX32RqM8hRCityf/8yrLF7Xa1rrQ++qby6ApG4eHLkF+0LL
	Sue4vt4V12pY56CESlAgfu2p0CKTFhaf3sOUBSp0MLSqu8T6SSI+XZyoutkOFnkU
	byWaR/Fr7h+nvkoIOdVsFwzG/VdHjaPe0Y4pglVYgnh8/rartNIrDcdKMsBSSfXd
	zuGuVAEbti39/ZVepNEl5DEeDcdli5WSyn1J/QFsRPYVwW39gjUhK+eF/iK/zgQD
	h4i6JJYqKWCijVe+PttS7wKnZ4OSoJ3pE38JG+VLptMXHssdYyM47jP52A5CbWxZ
	Y5E+qeQooMmazT6yLkxgiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784106732; x=
	1784193132; bh=5BTmpGAAJIGxFJa3QZUQ84cSW7EHGx2SH3vpZ10Sshg=; b=A
	oFdJSetKA/d0yA2OP9CIEeqMZ97p7OkdgBncwuDWGEPWeBmbaRFRXZRD54hyNiHk
	lu/xpKpbJ3QmzBTKKrNgnNGGGxoaz8u/pOKdx6IgIGQjwoxzkQfKk+0P3M57E6lN
	eHh894gkG/LIlqIFWkZw74zOGtJCD3KLc4oBLsNVPUP4pXQvdzWwoEIBvQ5aPm+z
	2PgzFLUXM3bXNgKiDe1sv5jxe0vnf6wl2oB6U1WPhGr3tnvhg4uSxSsZTWfAKll+
	e5Yi6e/UmZ0qSIGLeIwI9xDGumTHa6rvjP629/KZLBkBul/Z8T0pqSPKX6DdnvCH
	qlMTKImTL4DjrR2qnEwRQ==
X-ME-Sender: <xms:7E5Xap9lhHdMs6Fb7CS1IX4OccVcnuhq8boa1IB8cD_tG6LBddM2mg>
    <xme:7E5XauHSTjGxofECkjws8Pv4LS20XEceqFHvM74gHS47co5ZrwOAur8uyTbRwqljW
    qg0rdFKxYbw-kGHLDa4VWctO9_Z7YdDQtFRTYQLh9bYfrumfvMjvoM>
X-ME-Received: <xmr:7E5XaoL9K9RDXZ78A9jL3x-0ABumJp8nbabmD_ENBDSZhA6GDQrgXHcw_IasMN87YjlTCGKnMXEqsTaF6czm1QGR8MmuTENYa2ORBA>
X-ME-Proxy-Cause: dmFkZTGbEfTGVuHxOJuyKCFvk6zsdjnpTYAj03akCpyfO8+qFj/r9fUNl/dlR0wUY4Tkjz
    N8whbTOR/VZbolzdOo7RwWDDl+GFFDRX6xEYLButw8EkfRcs+qKzpAB3eI9bWeGQ+KZjDf
    vUjxxEC419LJG0p4lk+H/82r2oPAXONqCfgFlRnkrVqzMF3n4ZpgAOgs+drcWhplhSKo2V
    cExiHLUTnIX3eCBvpYgjx7OAUYt6zgl+tNWD/OKuHEYmIxB1ztf6XbODt0covZvJzlkiHE
    Y7hBjEUjZIPYOrZGRddUvW/Z6GPlxjye25BjJzBJOTpI0FPf5NjIM46nLCzefle7QRZCDb
    ZNVylJNjHCMYzMSzdYrbAQqyCjt1rHoy7JILcd2QYZSB81vTbgEa7qCV4SE66u+P9AE24F
    cbjwqCyV9pk2JDQrpUR9luietPVOcxUizCV/zHCX5Ycdzd68zF6fUkpW+T1zRt2W8w9FMe
    2DAgAU0anlO9KAZodZ2vaUG5M7ayMK+yRVmxRZu1qVVUkNe3HP6Eecz34PRg0kdrluqvVE
    KGF6giEbxec50ulr54BiRfO5BYs36TysYTd94vAWYJhhf4jdZd83Eqb98KyFOMcwD/HkXS
    ecqk8LkUbIfKBCRkhpx52bUDUb0R8FBmgOrADJswvhl/X1zpidffjLXXAc4g
X-ME-Proxy: <xmx:7E5XapdtJ-rMRg4fx3eATSj0LAprDOtUVyNaQkyXJT7rHnp9GCmfLg>
    <xmx:7E5XatVXorOhwbyEi30FbTzt66u8McDTMqMBCajp3O1L1AaLGqrQsg>
    <xmx:7E5XaoFrILCcJYK1EcvnqdIMOF7WNjG7_H2A1pedv5JJiX-86RnXTQ>
    <xmx:7E5XamVJdV2Tp3qdkbIuXB6aEkMVVamVqTARA-m-97fqkoIEgM-PAg>
    <xmx:7E5XagNB0V5UF3UKs73uOkXbimThhaNN_t4fhvAttaqpvQr5y2CARqSG>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jul 2026 05:12:12 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Wed, 15 Jul 2026 11:11:54 +0200
Subject: [PATCH v2 07/10] dt-bindings: i2c: apple,i2c: Add t6030 and t6031
 compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-apple-t603x-initial-devices-v2-7-df65b2485710@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=959; i=j@jannau.net;
 h=from:subject:message-id; bh=+Z+vDT5+Q+hqSjcKRrJYe+eTksVcbkAkmGk4lrETmLo=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqxwv5vdzbYJfD/KcuumzfXZXmDOzxRw86FjY3Xthc/d5
 3/qLbrXMZGFQYyLwVJMkSVJ+2UHw+oaxZjaB2Ewc1iZQIZIizQwAAELA19uYl6pkY6Rnqm2oZ6h
 kY6xjhEDF6cATHXNOkaGJz091Vz2x9IvfjLgnhwZnDQnd/3Cn/7HRQMurBQyc+0OZWRo/lD89/U
 D8XRWJSnnGzUTl7z4WmxRmH32zaWJzc27GaIZAQ==
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_021213_841926_5AD23F0B 
X-CRM114-Status: UNSURE (   8.30  )
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

The i2c block on Apple silicon M3 Pro, Max and Ultra SoCs are compatible
with the t8103 (M1) one. Add "apple,t6030-i2c" for M3 Pro and
"apple,t6031-i2c" for M3 Max and Ultra as per-SoC compatibles.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/i2c/apple,i2c.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
index 9e59200ad37b..d39f5e3f1df4 100644
--- a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
@@ -24,6 +24,8 @@ properties:
       - items:
           - enum:
               - apple,t6020-i2c
+              - apple,t6030-i2c
+              - apple,t6031-i2c
               - apple,t8122-i2c
           - const: apple,t8103-i2c
       - items:

-- 
2.54.0


