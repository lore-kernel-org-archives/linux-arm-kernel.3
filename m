Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF467CFD364
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 09:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ELqXi3aTJ51ICy7Ea6WVF/izBNkraKFroaZxuuWVbPQ=; b=NdYT03FFxJsAQ+AT8V40uyw15p
	o/d39ZCaCElScPA1w+y+18X13uDkTVRgX8uK4Rj/NttIfi422vcZshhov9TaQDV1WAapfMJnvnEYF
	jtFtwrsD4XqUtOITyLpn/UziiuzClaCSVW8gs6lVpZ0wGrsw4/jXkXKZB1b0NUWJM73pjCu5wOQun
	gGMqaRt2n4lRbf5T4FK/FoIGWwWsGjcDDYdVk3bSvE43csEgYHT1ns877HbnwSaoqt0iHwug3Pgxb
	g01yXteDbRLrDZsklCd6i55FNP2ncOvYS8gWagZy+tivyfGUdjB5XkJnT18lzLQYJogU0Rs1Ka0Qo
	N7uV00hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNpn7-0000000D3am-0MN8;
	Tue, 25 Nov 2025 09:56:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNpn4-0000000D3aE-2GVQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 09:56:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D440143C98;
	Tue, 25 Nov 2025 09:56:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AB25C4CEF1;
	Tue, 25 Nov 2025 09:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764064613;
	bh=0GPu1l3zNMQ3cknQLptiKbWwXLYqK3TMJjD3o6Letn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mvMXhxjU+avdAPCZMwmTLGrOugXisDV8TxNjFd/ckVYx57F7wpBupaEDQmOp6ic5Y
	 hAt/4BAitYk3j7TWIENR3TiWTht/Hgi2ESqIAelLSMdw8FuZ0apEqBEKROwVTvyxKu
	 pu5ynsTF+1yT1X5eZSvVi5sVQlFSxCFQ9W0GonYMbB+XSpm+qF4g+1KLKnXArbKVMO
	 mAOahH8DOXmFKBL/mZhbXRQFtgNXXz8DigJMKfuRlvM7ubIORdO58Aa5zlB+DuVuty
	 mixV1treB52IwXJUUnyOyeMOtWzN4Sa1nT6+93MDHJGLzeV+mEYs1iipWgg+x1XR9o
	 keERpBjO7epxA==
Date: Tue, 25 Nov 2025 10:56:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Amit Sunil Dhamne <amitsd@google.com>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Lee Jones <lee@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Badhri Jagan Sridharan <badhri@google.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Subject: Re: [PATCH 1/6] dt-bindings: power: supply: Add Maxim MAX77759
 charger
Message-ID: <20251125-amorphous-bobcat-of-whirlwind-afdab1@kuoka>
References: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
 <20251123-max77759-charger-v1-1-6b2e4b8f7f54@google.com>
 <d4455f4b-2a0f-4bc0-b897-14f2e27af3ea@kernel.org>
 <c9b059f8-9219-4219-95c8-23a3733fea58@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c9b059f8-9219-4219-95c8-23a3733fea58@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_015654_621308_9CD7A2F6 
X-CRM114-Status: GOOD (  25.17  )
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

On Sun, Nov 23, 2025 at 06:34:05PM -0800, Amit Sunil Dhamne wrote:
> Hi Krzysztof,
> 
> On 11/23/25 1:28 AM, Krzysztof Kozlowski wrote:
> > On 23/11/2025 09:35, Amit Sunil Dhamne via B4 Relay wrote:
> >> From: Amit Sunil Dhamne <amitsd@google.com>
> >>
> >> Add bindings for Maxim max77759 charger device.
> >>
> >> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> >> ---
> >>  .../power/supply/maxim,max77759-charger.yaml       | 36 ++++++++++++++++++++++
> >>  1 file changed, 36 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/power/supply/maxim,max77759-charger.yaml b/Documentation/devicetree/bindings/power/supply/maxim,max77759-charger.yaml
> >> new file mode 100644
> >> index 000000000000..71f866419774
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/power/supply/maxim,max77759-charger.yaml
> >> @@ -0,0 +1,36 @@
> >> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/power/supply/maxim,max77759-charger.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Maxim Integrated MAX77759 Battery charger
> >> +
> >> +maintainers:
> >> +  - Amit Sunil Dhamne <amitsd@google.com>
> >> +
> >> +description: |
> >> +  This module is part of the MAX77759 PMIC. For additional information, see
> >> +  Documentation/devicetree/bindings/mfd/maxim,max77759.yaml.
> >> +
> >> +  The Maxim MAX77759 is a dual input switch mode battery charger for portable
> >> +  applications. It supports wired and wireless charging and can operate in buck
> >> +  and boost mode.
> >> +
> >> +allOf:
> >> +  - $ref: power-supply.yaml#
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: maxim,max77759-charger
> >> +
> > This should be just folded into parent node, no need for separate
> > charger device or is just incomplete.
> 
> Thanks for the review! You are right, the binding is incomplete. This
> charger block actually listens on its own I2C address, distinct from the
> main PMIC.
> 
> I will update v2 to include the reg property. I will also add the

AFAIK, the main (parent) device schema does not reference children via
any sort of addressing, so reg here would not be suitable.

> standard properties `constant-charge-current-max-microamp` and
> `constant-charge-voltage-max-microvolt` to configure the hardware
> limits, as this charger device does not manage the battery profile
> directly (that is handled by a separate fuel gauge).

Well, still, what's the benefit for the bindings to have it as a
separate child? Kind of depends on your example, which is quite small -
one regulator and supply. Grow the example with battery and other
independent resources (if they are) to justify it. Or show arguments why
this is re-usable.

Best regards,
Krzysztof


