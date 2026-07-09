Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E297C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 07:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6cw29mlAkLYr8FXLoHcl6TTmhyQjc2qvZWL680Rsq4g=; b=TRpWVbbJ1RgZ2b3V3IHe7pqx83
	iog0JsE5sTke8ltuC1e3KbGk3zSXo7f7x5fx2/4ylOXuiP7tUSmNODRPeX1H26bmMWs+ixtyYCCZz
	Nv/m1WRnL0SAFNiQxlTjVdBCflMDP4yTIbHNR7PcJwi/7pmbsxVjsg8aveJPvybVqyKJ3HGchIZrt
	Xfo4f067wby+zuOuM/3YvVG62UZ3zmXeEGs5+tQBbZ+rReJHz64yv0i0AP311aamLyDC/93T08Ap3
	CduTz3HVhtJaRHadhwz9HHqxVpAQTmIdE3Zc8aeMUyfHFqXIyf67dh8E96PioizHy/etZlFUdzn/v
	RUmZcH4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjEW-00000001Htr-34v2;
	Thu, 09 Jul 2026 07:31:44 +0000
Received: from flow-a6-smtp.messagingengine.com ([103.168.172.141])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjEI-00000001HnZ-1mNQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 07:31:40 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id CAC5413800A2;
	Thu,  9 Jul 2026 03:31:25 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 09 Jul 2026 03:31:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1783582285;
	 x=1783589485; bh=6cw29mlAkLYr8FXLoHcl6TTmhyQjc2qvZWL680Rsq4g=; b=
	pA1yMmoDuuIDFRT3lNHde80m4TM+bn7gJYQEb2bCYMawWTRryPBgIklO2xMY70vM
	OdY+YKdDyLSGmf7ShmnrwviBDiCbYBKf7rshzOYENcb6JuLS816dd+cDuu9PR45P
	Muh8JhKaI6ZeYXnpmvqkTQAr2R3kLXnUf1eXWAQE5c6/Ko2nFlYzoSkjan/F7mTr
	K1jKOwY3ZCze0zWbbFXkmRNRqDnq+j+SaFI6fhUOVPYVLJrSuSaR+gRYbwgmW4r2
	W0L+mEJcXVYPvkJRe7bcB5YB8/38Ht7D3vR5TC1NQHDUso8wG8luAg1w4/qIeCl5
	O6ptPekuWEYN7E2C78RJ5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783582285; x=
	1783589485; bh=6cw29mlAkLYr8FXLoHcl6TTmhyQjc2qvZWL680Rsq4g=; b=P
	hrDLi2K2+kxA6ICuD4ssVIsqMFYMz03Y415DTfMCVokx0SiRF3P9Bv5ozP64pAU8
	tacpIlPVCJgQ1kAy7QhLUjjEXRX/1DA8mGdbDJ5pk65FCQIKFnrtjQmGkcaYDHNf
	yYeLFMwmwVJwNAOS3XSCbcmP6p+iwAQi0uHiOGT5iNKnOscONSSeDR7WfIfjUs1X
	CXPjlV5JYM9fThlgQrS+9fw0GJpj/B51+u+qpZa78HTC6k9NVuMvl8PVVjbBCmoh
	ZQlN7JxGcrGJB5Arcu31gghIIu3yT3HpMZ6waXgyVGUlySTSllewfvtQtZiC5pmr
	PVxoOvoc0eMQwx/rwEu5g==
X-ME-Sender: <xms:TU5PamJkQieoP5Oist3VmcZue47XWUE2x3Z4W_GTSwcRvEXKYNK-tw>
    <xme:TU5PajC9HeYS0i7iAj4wBoPTVDJ42YZ2PKF62GxuWzlaeLCYsKvD0Zgvl-C_tMd1X
    0kySzMW1q7ufLkHq5hWx7ZIsOwKA_EwO3l0R0OXkeR00GFssYe2qena>
X-ME-Received: <xmr:TU5PakS-DhOTscIlMCnG-cxHUT2emcZQ-kB6PUX-R4j7H2vQThLmR7STHWufo99CE-fvZAo9tus-JG32TDGNTgxQdix7XSifpOA>
X-ME-Proxy-Cause: dmFkZTFDgvji+KZOYa7+nDRYV5XjpiHYyZNb+S62U1l3I0KgY+OxJTHOccc7LleD76+n6b
    Vf0fTkznQWCQtUJWgIlosDWTwuMIFaBxPt3fTu/P9Cx41Cuvrk6EyPr+NNfcbSVCPT3+Dc
    C6efMtdHDRJF5NN4unR+Llnrm9yKKGkxbNssZuc0MV99+GgEHaiE4b6Jv7DPfedmhEtrjl
    UIJxXa0C0eF7kFlLWMf7rGql7KQXWx+/7Zo6i0e6y7H1udqz2uSFZ55rFZXpgMXMistz7D
    Zk29AuVpkBQ7eIeXTsIe1jlElcCjhKZ98d11EqdTlN+SxLlaQ0qYrg2hFiC7rk7Z0xHush
    K9qxGA9r9bA+DJsK+gvEQJDyEf/Nje3JyMT30TO/jD0s1jUq64OZA3eH2rX/baT9aV07uW
    /0N+FyM9wWpP0OQp/HyxcNnogudiUmrJVF2x+5mz0vn0or/bvBKyNGRHknV5jd6LctLRrs
    NreWOgvHxQuVgqrQhAqREE5mmN3QNL50aEvYQ9IYE185+CNuQXUwyhUVuhpB3YwemTtuVR
    W7fSDVX8syzj1Zwup62/44G1m/o5QyKXuhvTr2/+ViUz44giVbKmsoK0DcYYrLyhtZgveR
    pWsBextCNl2jhgbpBOKAcsAzCjzYtCxR/ikUDb5WDopHK7EDMtm8jgmNopqw
X-ME-Proxy: <xmx:TU5Patfqisel_f6GRr2GzkmMrd_mM3Q6uYJ1Zyy0itvvSkJxJer2pA>
    <xmx:TU5PasiAn1EusVAMJPuMW64NfAwrg0HxBnQ-1KVZy5i-CZ7swB3WuA>
    <xmx:TU5Pao_MJwVNMtJuQoUAh4kLwGksACxVfuy7P9PRVJrkhmFz-HoCWg>
    <xmx:TU5PasnSS9IQrhEl89kNqE-pAWvYUd6VkGkmmUMIdqYK9WPKX8MBOA>
    <xmx:TU5PanYmakzPKwNq4cqhSN0xrpn3o7hTRmvlzhBLatIZEAe_nc37rfPh>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Jul 2026 03:31:24 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 09 Jul 2026 09:30:51 +0200
Subject: [PATCH 05/11] dt-bindings: power: apple,pmgr-pwrstate: Add t6030
 and t6031 compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-apple-t603x-initial-devices-v1-5-55b305833123@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=994; i=j@jannau.net;
 h=from:subject:message-id; bh=6j04J5ZsMYC1glEYGPI5SeONi9pfivKJ6lbbwpnFQEk=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhix/P9tbgefVVBZPCFsibOmfd+rOtnb2kJPzPSw3W2Zfn
 8v8ZlNDx0QWBjEuBksxRZYk7ZcdDKtrFGNqH4TBzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNUGnIwMvf5TlF6V5sjNsHu8T/xuePXc1JwTP0O+HG7iWTi7tbOnl5Ghy17vlvD
 x1RZlC9ztBCPqpcTtLq7cGTrt0GZNzcfaE3bzAQA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_003130_875941_29442C74 
X-CRM114-Status: UNSURE (   7.80  )
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


