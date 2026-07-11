Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42301C44508
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 19:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M4BS+cyiMRjg3qMYNzdPwvmaaM5ATYcZInIZ1L1twsA=; b=GUkshNTWBcwPrNEkdapOQFgLHH
	4jk1gf5X+X1VoFD2sMrmetyQ5ciRYPgSP93/+/mg2RI7C4NigPWlVzNZ6ljQEPU4SvfGi/xYyzuAb
	5sINeGIgFYZlXA5IBkL1wNS7YcDLS2hRQDuHQoXzEGICl6lAe2+JI+Yy2HrHjY2tL4z1bVfZsBka1
	KDpXYQXxNaEpH9pIdw0GVouQ9Byu57tpWaxM6F9QWHF/N4MtU4KPAq6aVyl3vsv7v0E0+KEe9598r
	OGYmALfTVYqUkr2JD/XYaQOoEd0zd4xssyybHAP6k/YLc8y2RRM0uFxW0phLT/6v3PHRmZnshjn2Z
	R+onP6Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1widNc-00000006nyL-1QZk;
	Sat, 11 Jul 2026 19:28:52 +0000
Received: from fout-b1-smtp.messagingengine.com ([202.12.124.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1widNZ-00000006nxZ-1hw2;
	Sat, 11 Jul 2026 19:28:51 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 8846C1D00081;
	Sat, 11 Jul 2026 15:28:48 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sat, 11 Jul 2026 15:28:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1783798128; x=
	1783884528; bh=M4BS+cyiMRjg3qMYNzdPwvmaaM5ATYcZInIZ1L1twsA=; b=H
	csimUW5bBqJiOuUKQrOV/dsPMRByP++d1dPN2j3Esawbs/W1JHNGQexOwFjQtfDD
	LxJokBKVu8Ld2QNevAppCSTLGce/hIdkhTHG/6AHNEFT7AL2BUMlRg1DzORC4bRy
	bF31GI7agPrOOgp7urbpV4f9uKAGrBeDyiu2yunFM5wyIvRjPAihPAQK0lOzBZon
	rnndzqCOFM+Qu9JcvMz90168BRJ9gum4rmS0R+mRvyA/Hhdwh9RrQ0HWru7a7/Ds
	1s6NsdhmTou5ATYw+YIaidq3pRmeK+EFO3POS+9UMdj7HmRvWbqxYb+xtrkJBaq3
	kBYSZQ+ZhP6DQ2WeY1Mcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1783798128; x=1783884528; bh=M
	4BS+cyiMRjg3qMYNzdPwvmaaM5ATYcZInIZ1L1twsA=; b=lZv+ahcQBeilXjDHR
	NO2PAv2f9pYeUknHwJcH66M57OGly0/Y1O75XDMZe7LDkB6Qecxbz49GN3mpZTbV
	QLLhJgNuM1kgei+pwi6Rzt7aMIa4+WUSMiFU6lhioM2Hbdv7Ty+KXz1PTtGgwd5f
	TZYpfiXMaZ1Y2O5pEVDNG66r1QYWVvBfyQcf0v2qPyX08XvvvuvRFIp/qu/3JQV6
	wX0LTwBrIuT4JZFokOPpKS5HzU73qXt77gS6d5kMcbRDBSzAdk+55BvXwJrtLpzu
	XBVL3/aHZf+fAPffcrTp1ddjEi2Dfq+RXhBqvnS6WtP/19IOHA/UI36YBcWa6ia+
	fyM9A==
X-ME-Sender: <xms:cJlSahjNd9xHpGjJfAZ4Saj0RtI_gX9O1BJydrw1lPcs7geiEi_w5Q>
    <xme:cJlSasiC08iNaKXeiiYQX-yKnr9UUqKlZ9lYU6erpIqGi3uNR5Hs-SdpV53zT2WSA
    r83HJvTuQVAWWQPEhHYdFwFSWjfFZnmgF6qbMFXSL6Mzijsz_6p8g>
X-ME-Received: <xmr:cJlSavFp2CJ48LQEHov_sfnDG6HrPjfU2eDvkQfpaX8SRtlR-9-wBXP0D4d5ikYXPnLyzfTvxMIrJmOTNvV3GwxpfMnZSgubX1ZutMPAWc2iunD3wBQ>
X-ME-Proxy-Cause: dmFkZTE2lBvkgiNL2ATTdX5mmuQMIgkvxqRNJsz/O/t4BhtsCbPdToHsQEtNg5auet71r6
    BC9ee8ERIpoud5AtONR+1p2Eucn/fF2mL8F4kd97QKfKSv+19Yq/C2Ri8wtXyErVvh9K9W
    18tm3uUeG9jt2a1njHO+xDjGuIJgwt6eMxH9YcoqpsOhAVG281rLYLINgEul13ETYY7dG1
    LRzck7QkFrTBGRF8OXeCxfpEh2m6G5Rjj73JH8Mafn/lvX8g62o3Z9M3a0J0/AosAWje8s
    LN6G+Ft7Ea/WCNdR7+Eh9qUSgmMU9sGTtB0o+x9jtkvNDElODMSQjlUS8rzObNdc489nCH
    iaBm8IigPPKpsh5Zu0426DaQN5yauvUGVBviIhFxWN+CmcBzX9hM+3eP9hOcxjoEvQ8s7V
    8DFB6fKBbnH+W1130c496SFPH2e+Bwq00LWqAZLVsyP6oKm1xuRu/WijAGfn6bci9qhIFz
    CtC/gpkyaFMIq2v0aMQPbjEBtcd74NGDaSJFu0CSNS8gaAyFY2ICdb7iUGxNeKotbprr0N
    uPmxu144LrejXf/K8MxY6cBMbfTn2bALVpuhG//6hFu2A/a5U0HijHALiGfTGlAXSMJEVx
    GvbuhHDIVf7auwkNR+2Jw/ZeBxitHrkTPbqzM1ZZ90nKQq4DAEFwVek+Sfhw
X-ME-Proxy: <xmx:cJlSapDtKfsCeYSyW5rqJe9OqxFV-G2EeVbOGzmKskDO5rvTagRfXg>
    <xmx:cJlSalBp9_Yjn2iLdbdwpW_Y7lhKxtgyh2SX3tfXfGJrQR8e6m1DFA>
    <xmx:cJlSanOqe4Nr5qdSR05egwyLDcBjI9UEGUhHyrWqq-z7FrPDmK0jqA>
    <xmx:cJlSapMyRrpdYeBpDj0NCzKxqKrNi3kY43ddeSLavpSJlC25hF4irQ>
    <xmx:cJlSasEWT2Ex_U5x0iYnMSWIiSNCmkyX_ESgQFBL1_KdTuUzA7v_hfkw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 11 Jul 2026 15:28:47 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH 1/4] dt-bindings: leds: Document "gpio" trigger
Date: Sat, 11 Jul 2026 14:28:25 -0500
Message-ID: <20260711192842.845048-2-samuel@sholland.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260711192842.845048-1-samuel@sholland.org>
References: <20260711192842.845048-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_122849_798253_30043C88 
X-CRM114-Status: UNSURE (   8.95  )
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

The "gpio" trigger is used to control LEDs by the level of a GPIO input
referenced by the trigger-sources property. This is already documented
in the trigger-sources property description and is used in at least one
devicetree (am335x-regor.dtsi). Document it so validation of those and
future DTs will pass.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 Documentation/devicetree/bindings/leds/common.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index f4e44b33f56d..e148b4277a6f 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -106,6 +106,8 @@ properties:
           - bluetooth-power
             # LED indicates camera flash state
           - flash
+            # LED indicates level of GPIO input referenced by trigger-sources
+          - gpio
             # LED indicated keyboard capslock
           - kbd-capslock
             # LED indicates MTD memory activity
-- 
2.54.0


