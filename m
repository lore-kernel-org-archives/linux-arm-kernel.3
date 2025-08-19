Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C51EACA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 12:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNvWpWlRSblGZhC69PPUhVZpXXNc6RjruDTqVBFIuKA=; b=exkw971CxGFuzutDmEpdrQJ9f3
	4yPNNf/FZpqfILTcqw4RE38E1JjAl3zB7Md2cp8x8EYtOjNo1BPwgqupskkfVYkKbKqqZgxUSj2r8
	OKxM9dBxYHR8nyZLiLUZYQzqwMQW2F1w6NVNJIIeStCbc1oIyatO6Ig9yeP/cm3/oirQRT6k8iAF8
	0Q7jpKDk98n+lw1XNeNxQafQCDGOpVu19cqoU2o98+SNwpWaA0Qlf70A0MePRbhLHMrla+LnVvKep
	SaeTT+iYi8dhOKfN7I5jIqjhaATrKtNuRKo0DW0tfNv6Lh9TksfDPNDVfHASNrFIM/3NFdrZ2gzf5
	NcSoUinQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoLw5-0000000AVjN-1B6h;
	Tue, 19 Aug 2025 12:59:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoK5h-0000000ACx9-0uaR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 11:01:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0A0D24625B;
	Tue, 19 Aug 2025 11:01:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6E3EC4AF0D;
	Tue, 19 Aug 2025 11:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755601280;
	bh=LLuG8UUhpyncc1Ow4ZHRPwCCdhOwxCqGMAhjDj7ySoI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ZZvyTfZmerde8pNhMfOL3u+TomyGc1qsh/jorWa49JCyGoe4OWFVjjKr7f5oXBfG4
	 QMLiauXOd7UIw8Wzsd2SqefGzmrUdDuciqVYKUtLp7CCznE+tX/chq99np5nuWhBbf
	 K4CdcvMXIUL5/h8C2TGbu4N8Lk4MgO+HmWIuFZtr4GINE5SiD9i6WSq5MydMn7A2jG
	 5YRuO1DfX5y7jWvHtv6wLPDKE4N4g4HdRsymWuAPXqNU7T8uR0ZZlYwTGQ1Zl9zR7s
	 CT04yyJajSDE+u0oiFNut8uQ2H1K5JF40w99h9HWpX9y16x4PJO7YoOZDWSPEgbqdb
	 n4LCyT3l6tOAA==
Date: Tue, 19 Aug 2025 06:01:19 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, 
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Christophe Roullier <christophe.roullier@foss.st.com>, 
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 dri-devel@lists.freedesktop.org, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20250819-drm-misc-next-v3-6-04153978ebdb@foss.st.com>
References: <20250819-drm-misc-next-v3-0-04153978ebdb@foss.st.com>
 <20250819-drm-misc-next-v3-6-04153978ebdb@foss.st.com>
Message-Id: <175560127329.3969258.11704849224286577096.robh@kernel.org>
Subject: Re: [PATCH v3 06/13] dt-bindings: arm: stm32: add required
 #clock-cells property
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_040121_277639_6C3A0C6F 
X-CRM114-Status: GOOD (  13.06  )
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


On Tue, 19 Aug 2025 11:15:59 +0200, Raphael Gallais-Pou wrote:
> On STM32MP25 SoC, the syscfg peripheral provides a clock to the display
> subsystem through a multiplexer.  Since it only provides a single clock,
> the cell value is 0.
> 
> Doing so allows the clock consumers to reach the peripheral and gate the
> clock accordingly.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  .../bindings/arm/stm32/st,stm32-syscon.yaml        | 31 +++++++++++++++-------
>  1 file changed, 21 insertions(+), 10 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250819-drm-misc-next-v3-6-04153978ebdb@foss.st.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


