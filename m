Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC827606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 09:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P6VgrvIw;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K3yrovMq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Y53QIYpD7wjqmJYR8fzWA4+4yo7uKK86RU2Kss38ssY=; b=P6VgrvIwIYSSx1tRx7PF5d9YbW
	XQnrvuqIh+b6ES+zHCZc+JlveSlCq+otZhMb7wikZ2uBHb2R/h7kgIkzgepvQoElFm5+1I3l2Th1d
	b8ELLAkd4Y5Oz5fHJ6kkFXoD8hZuSfJmF8t1h3bTfDp7ov1qNUKaqEw26PFwp9XouTKWe9FUtGVGj
	qIA6UUVihjx6UzwQTgLXVCVdRxINPD1p6uzrycVJgTDCVr4PHDiTdJvZgWQTwTlX+IJ0u3k34AQkM
	91/tf8CvwYc9hZng+PPbYWuqrg/tbdmqF+SE0WdNEicYQrJn+mwEaEhXj0wojJRMlWQxUnS92M8sN
	xwswgATg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAlK-00000001k9T-00Cl;
	Tue, 03 Nov 2026 09:25:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAlI-00000001k8z-1JRH;
	Tue, 03 Nov 2026 09:25:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 13DE341882;
	Tue,  3 Nov 2026 09:25:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E21911F000C1;
	Tue,  3 Nov 2026 09:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793697899;
	bh=Y53QIYpD7wjqmJYR8fzWA4+4yo7uKK86RU2Kss38ssY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K3yrovMqdy6HhmOPbm4Ti0es2kgNpyacjrgDG2XoZVRiiVLu0G5H2da3S8d05b9/8
	 F25G+k7Hbws5INlfoVJyodRN8+tqKBgNLv3xBa+p6v3ZjY4D8UNwFiBVhzAW7We/Oo
	 iInPY9idqDd596i70NbQkSZBL+/tooOLc5y681PjOKaXIog/+gKNpeOagk/tD4jWPB
	 moTQRizAWIp3QwGwCqxy/DiIlWUwNdR/dC6z0ZYnz3e3LvbfUcmsCH7qkmWX+N2ndV
	 fT2z2TPd6EXmtl1JAzKEs2ouxyltBOCHOEL5U3B8c1TCOyqGFSnowgZXDcbjVxycrW
	 54WNB0JVOz8Hg==
Date: Tue, 3 Nov 2026 10:24:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Dom Cobley <popcornmix@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Stefan Wahren <wahrenst@gmx.net>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	linux-perf-users@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v16 1/3] dt-bindings: perf: Add Broadcom Raspberry Pi AXI
 PMU definition
Message-ID: <20261103-electronic-teal-kraken-5ebcec@quoll>
References: <20261103041416.2940213-1-irogers@google.com>
 <20261103041416.2940213-2-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103041416.2940213-2-irogers@google.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 08:14:14PM -0800, Ian Rogers wrote:
> Add device tree bindings for the Broadcom Raspberry Pi AXI PMU block
> found on BCM2835, BCM2711, and BCM2712 SoCs.
> 
> Depending on the SoC and security configuration, these PMUs support
> either direct MMIO access for the System monitor or routing via the
> Raspberry Pi firmware mailbox IPC for the VideoCore VPU monitor.

In such case, where is mboxes property?

> 
> Co-developed-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  .../bindings/perf/brcm,bcm2835-axiperf.yaml   | 50 +++++++++++++++++++
>  MAINTAINERS                                   |  7 +++
>  2 files changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml

...

> +description: |

Do not need '|' unless you need to preserve formatting.

> +  The Broadcom BCM2835 series (including BCM2711 and BCM2712) features hardware
> +  performance monitors on the AXI bus for evaluating memory bandwidth and
> +  system traffic. Two monitor register blocks are present: the primary monitor
> +  evaluates the System fabric, while the secondary monitor evaluates the
> +  VideoCore VPU fabric. This block is distinct from the BCM5301X AXI Trace
> +  Module.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - brcm,bcm2711-axiperf
> +      - brcm,bcm2712-axiperf
> +      - brcm,bcm2835-axiperf
> +
> +  reg:
> +    items:
> +      - description: System monitor registers
> +      - description: VPU monitor registers
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pmu@7e009800 {
> +        compatible = "brcm,bcm2835-axiperf";
> +        reg = <0x7e009800 0x100>,
> +              <0x7ee08000 0x100>;
> +    };
> +  - |
> +    pmu@7c012800 {
> +        compatible = "brcm,bcm2712-axiperf";
> +        reg = <0x7c012800 0x100>,
> +              <0x7ee00000 0x100>;
> +    };

Drop the second example, redundant. They are the same.

Best regards,
Krzysztof


