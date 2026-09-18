Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6C4C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 22:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sdkH+9Eyo8lwBnyWL3D0AXJdYxWgcTzyUyAN9ex0Fds=; b=XR7YxDtI5SqJpVlf9002Wj4RUM
	OvSx6vJsdrvCpI9UiS7Na4Sk99l0gLxru4iY7HwoyFSUrnBYa0OYPTM7lFOrmwd/q1TDHaAowz9qv
	SLBPDotz4RNSasHjG7PCN/pSmThVwOehwkbbouvy0x50YS9hetJFYimcQypc+OHYE6ii0RNaSLnO5
	Kf0myTxViaFrA/9HM/zytKeIPMcPwGwb9KeNbri+4xJgUMQAJJP4I89NmReaJZ/b8V0UzqTaswg9q
	eGuIuSBDKYnJ9TSocaODuiGqMzqiegUkJGENeVcpkyPsmmZwjqL3egNyGu/loknPHPs6zW669uat/
	0ppmAwWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7gj7-0000000Fc45-2X9u;
	Fri, 18 Sep 2026 22:06:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7gj6-0000000Fc3z-2U86
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 22:06:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B3EC44205;
	Fri, 18 Sep 2026 22:06:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5D6B1F000FF;
	Fri, 18 Sep 2026 22:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789769196;
	bh=sdkH+9Eyo8lwBnyWL3D0AXJdYxWgcTzyUyAN9ex0Fds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dlVldnl793sIzCA+QOGOpldMSTPn+NoZMEZeCGm5bhJCO8q2JcX7ccwfRYmlVBKT/
	 +8uQjid3nEOdVeZrg8T5nlETCUAVjTreiu0IP2BEz+aYFlKOS6J14Tu24PWqd2Gh2w
	 KxEvQJwf1TV+FrjB16PbBRzFK/5rauXPTzc7e5dOMd+/XxY2AYQaz3N5EwkHd/mjix
	 /UN4o5DDWRVqQ2yj06BKUXrTriaZx2AVekXsV1SsEuNrUW6EvP/ru3omAjVf3HS8fk
	 7PFRofebNSd1Q4ovkxbWzaFZ5d4QgSEx1uKhRjh74tVxEZURcKNXlqI+DPPOduAmVz
	 n9xCx7E6n4WrA==
Date: Fri, 18 Sep 2026 17:06:34 -0500
From: Rob Herring <robh@kernel.org>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	John Stultz <john.stultz@linaro.org>,
	Moritz Fischer <moritz.fischer@ettus.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Andre Draszik <andre.draszik@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, mfd@lists.linux.dev,
	Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v25 05/10] dt-bindings: arm: Document reboot mode magic
Message-ID: <20260918220634.GA2441717-robh@kernel.org>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914-arm-psci-system_reset2-vendor-reboots-v25-5-4aaf5c09b5c2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-arm-psci-system_reset2-vendor-reboots-v25-5-4aaf5c09b5c2@oss.qualcomm.com>
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

On Mon, Sep 14, 2026 at 08:29:09PM +0530, Shivendra Pratap wrote:
> Add bindings to describe vendor-specific reboot modes. Values here
> correspond to valid parameters to vendor-specific reset types in PSCI
> SYSTEM_RESET2 call.
> 
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/psci.yaml | 60 +++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
> index 0d04389c81fa..8b6a28b81ed7 100644
> --- a/Documentation/devicetree/bindings/arm/psci.yaml
> +++ b/Documentation/devicetree/bindings/arm/psci.yaml
> @@ -98,6 +98,43 @@ properties:
>        [1] Kernel documentation - ARM idle states bindings
>          Documentation/devicetree/bindings/cpu/idle-states.yaml
>  
> +  reboot-mode:
> +    type: object
> +    $ref: /schemas/power/reset/reboot-mode.yaml#
> +    unevaluatedProperties: false
> +    properties:
> +      # "mode-normal" is just SYSTEM_RESET
> +      mode-normal: false
> +    patternProperties:
> +      "^mode-.*$":
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        minItems: 2
> +        items:
> +          - description: arg1 (vendor-specific SYSTEM_RESET2 reset_type)
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            minimum: 0x80000000
> +          - description:
> +              arg2 (cookie_lo in 2-cell form, cookie_hi in 3-cell form)
> +            $ref: /schemas/types.yaml#/definitions/uint32

Drop. Types are per property, not per item.

> +          - description: arg3 (cookie_lo in 3-cell form)
> +            $ref: /schemas/types.yaml#/definitions/uint32

Drop.

> +        description: |
> +          Describes a PSCI SYSTEM_RESET2 vendor-specific reset type. The string
> +          after "mode-" maps a reboot mode to a vendor-specific reset.
> +
> +          A vendor-specific reset takes two arguments, a 32-bit reset_type and a
> +          64-bit cookie. The arguments are encoded as up to three 32-bit cells.
> +          Each mode property is encoded as mode-xxx = <arg1 arg2[, arg3]>,
> +          where:
> +
> +            - arg1 is reset_type and must be >= 0x80000000.
> +            - In 2-cell form, arg2 is lower 32 bits of cookie.
> +            - In 3-cell form, arg2 is high 32 bits of cookie
> +              and arg3 is low 32 bits of cookie.
> +
> +          All values should be provided as per the PSCI SYSTEM_RESET2
> +          specification.
> +
>  patternProperties:
>    "^power-domain-":
>      $ref: /schemas/power/power-domain.yaml#
> @@ -137,6 +174,15 @@ allOf:
>        required:
>          - cpu_off
>          - cpu_on
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              const: arm,psci-1.0
> +    then:
> +      properties:
> +        reboot-mode: false
>  
>  additionalProperties: false
>  
> @@ -260,4 +306,18 @@ examples:
>          domain-idle-states = <&cluster_ret>, <&cluster_pwrdn>;
>        };
>      };
> +
> +  - |+
> +
> +    // Case 5: SYSTEM_RESET2 vendor resets
> +    psci {
> +      compatible = "arm,psci-1.0";
> +      method = "smc";
> +
> +      reboot-mode {
> +        mode-edl = <0x80000000 0x00000001>;
> +        mode-bootloader = <0x80010001 0x00000002>;
> +        mode-vendor = <0x80000000 0x00000001 0x00000002>;
> +      };
> +    };
>  ...
> 
> -- 
> 2.34.1
> 

