Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01823C44532
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 17:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5IBnNKjFpX4h0Bw883YP13wsIeX4UwbQCYYcGQL98/c=; b=xUrS6SSFGL+phZUnmq03LLJwfo
	jNN73ohVdrXiFJdytyVCCImyWWpcabTSPmATc/zGQWlb7ayKJATnB5FylyT7RKNKvAyf6d6mgC30F
	8oofyMwdsnjqHJn4t3HNjPoBn1uDQyLfLbxl9OB/LuxDmnFiIBHERWDzClLAyBTq9A0joi2zeMMFP
	uqJmlODPjeIio4gKugerJ/Y+N2/QJycq+QTMSmVwlVnOQpVIHxNM8c6XlHfzJoXhMmjJ4lkwPiHEB
	u4fctchdxcoFBncMDEHFqk3zt4InHwawfaNk8kcpxshKBCr1ZxLfVlrwnQQHSbtIqFjb2HUZP20Zx
	7NHDMV8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmaTR-0000000CQHx-3wFJ;
	Wed, 22 Jul 2026 17:11:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmaTQ-0000000CQHd-0jqq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 17:11:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 70F1A60051;
	Wed, 22 Jul 2026 17:11:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EC551F00A3D;
	Wed, 22 Jul 2026 17:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784740271;
	bh=5IBnNKjFpX4h0Bw883YP13wsIeX4UwbQCYYcGQL98/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CK7sXvlW6Hxdlu4AfJEbAArnsSEg0XC99sMwPdapxkzWS6lfQHVEjLbKVchA28HiQ
	 ev2d1c0zafdn/Pce8r5I/eIUlZRKRArl/sRA9dFmDMk2UkDhNaxggska+6+yPUbIql
	 Tl8/r36qTileL2G1SVsvkMuomWakSZkIQ6royDGKfHpQ4308acSMZdPcSHAdmXwS35
	 L1gstCY5lDivDwSRSB8UvGhF4Or/NAXg/4Hceh65ba6Ho35zY6tvRBdMa5kF9iJNCF
	 kYNaEnThvDyxQ083o89Pg4doOLatISY8KslxYSzSlkFHWEO4QymY2C0Jiiw+XeXV5S
	 b+RGFAZaLDo5Q==
Date: Wed, 22 Jul 2026 12:11:08 -0500
From: Rob Herring <robh@kernel.org>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	John Stultz <john.stultz@linaro.org>,
	Moritz Fischer <moritz.fischer@ettus.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Andre Draszik <andre.draszik@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v23 06/13] dt-bindings: arm: Document reboot mode magic
Message-ID: <20260722171108.GA1097879-robh@kernel.org>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-6-e7453c548c21@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-6-e7453c548c21@oss.qualcomm.com>
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

On Tue, Jul 14, 2026 at 10:46:34PM +0530, Shivendra Pratap wrote:
> Add bindings to describe vendor-specific reboot modes. Values here
> correspond to valid parameters to vendor-specific reset types in PSCI
> SYSTEM_RESET2 call.
> 
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/psci.yaml | 54 +++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
> index 6e2e0c551841..11b90e8affb3 100644
> --- a/Documentation/devicetree/bindings/arm/psci.yaml
> +++ b/Documentation/devicetree/bindings/arm/psci.yaml
> @@ -98,6 +98,37 @@ properties:
>        [1] Kernel documentation - ARM idle states bindings
>          Documentation/devicetree/bindings/cpu/idle-states.yaml
>  
> +  reboot-mode:
> +    type: object
> +    $ref: /schemas/power/reset/reboot-mode.yaml#
> +    additionalProperties: false
> +    properties:
> +      # "mode-normal" is just SYSTEM_RESET
> +      mode-normal: false
> +    patternProperties:
> +      "^mode-.*$":

Since your example violates naming rules:

"^mode-[a-z0-9]+$"

> +        minItems: 1
> +        maxItems: 3
> +        items:
> +          - description: arg1 (vendor-specific SYSTEM_RESET2 reset_type)
> +            minimum: 0x80000000
> +          - description: arg2 (cookie_lo in 2-cell form, cookie_hi in 3-cell form)
> +          - description: arg3 (cookie_lo in 3-cell form)
> +        description: |
> +          Describes a PSCI SYSTEM_RESET2 vendor-specific reset type. The string
> +          after "mode-" maps a reboot mode to a vendor-specific reset.
> +          A vendor-specific reset takes two arguments, a 32-bit reset_type and a
> +          64-bit cookie. The arguments are encoded as up to three 32-bit cells.
> +          Each mode property is encoded as mode-xxx = <arg1[, arg2[, arg3]]>,
> +          where:
> +          - arg1 is reset_type and must be >= 0x80000000.
> +          - In 2-cell form, arg2 is lower 32 bits of cookie.
> +          - In 3-cell form, arg2 is high 32 bits of cookie
> +            and arg3 is low 32 bits of cookie.
> +
> +          All values should be provided as per the PSCI SYSTEM_RESET2
> +          specification.
> +
>  patternProperties:
>    "^power-domain-":
>      $ref: /schemas/power/power-domain.yaml#
> @@ -137,6 +168,15 @@ allOf:
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
> @@ -260,4 +300,18 @@ examples:
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
> +        mode-needscookie_64 = <0x80000000 0x00000001 0x00000002>;

Don't use '_' in property names. This is a W=2 warning.

Rob

