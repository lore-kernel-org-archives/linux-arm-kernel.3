Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D00FCCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 15:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hjhr1y0YICSPSb/zCEi1m2kp2Q87b6w7/1CAYK4LNzo=; b=imqV1aLKa8d7ExI2QUFSGarBmf
	xzrxUsNZv7hGz3P3JXQ3kORW3/4x3fkww1v1MNTdc8y2bFFqMA9Err/DbS9vHNbqFjZCINY/ew461
	P3adN3lmii1mUKu3m+bHcKfIFn3I8afej0JU9ogcsGn+t7RhCCb2TQFtwzilmHZp/TKQCrR/rxUWK
	AbnGcluiVhedPY72ljT9oKsr9gFvoa1UQvSGJLUqN/w8RndQ8jmiiiOa7Dhu/uX7w0JevsFLFKkbW
	K0PW+l5rtTyG7YHouVNLytgHMcNjjzX6pFDJcDQXcBRbZemIJ8bfqyFhiODV7rB0zF/3SyJZcv6Km
	ar9jx54w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIwu-0000000C5jK-38OK;
	Tue, 04 Nov 2025 15:27:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIws-0000000C5io-0cww
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 15:27:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 89A3944019;
	Tue,  4 Nov 2025 15:27:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A00CC116C6;
	Tue,  4 Nov 2025 15:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762270073;
	bh=ZAOzcn+Y24e5q259yuXAm+6c2vpGYmPp9EQN94tzMzw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=MZ0uJvDesJeSlvWhBkhwz71q6x3yiKQT/CFDtGUdvrtydeFDablFzi3+dIlTT79+n
	 nGwQM6tE9sOsmnB0QtrAnRmNv0rmkeN2NHCH3ohJYnb5hutlND0QyQFzee5aFMaBYa
	 LjkUPgwuNj0+XWV3Y48VutUuGu3CrqiMxEi0nGOpQMox6XlRsqE+Va0hKzaR6e7jou
	 a+5+kVNE9FQJVk3byho55M1a3IvmYw+pKyF1UtRN3wnYIngQ48hbinp0bQmIS/YcXj
	 fZnUjb6qcGPhXJg1KyH6eMuuLFkSIylgp1rO/d18ybZwj8mITjBEKsMEnV+OecJR8w
	 30Go5VSu3jd6g==
Date: Tue, 04 Nov 2025 09:27:51 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
 Maxime Ripard <mripard@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
 linux-renesas-soc@vger.kernel.org, David Airlie <airlied@gmail.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Matt Coster <matt.coster@imgtec.com>, Frank Binns <frank.binns@imgtec.com>, 
 linux-arm-kernel@lists.infradead.org
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251104135716.12497-2-marek.vasut+renesas@mailbox.org>
References: <20251104135716.12497-1-marek.vasut+renesas@mailbox.org>
 <20251104135716.12497-2-marek.vasut+renesas@mailbox.org>
Message-Id: <176227007159.2279193.11820331773038712744.robh@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: gpu: img,powervr-rogue: Document
 GE7800 GPU in Renesas R-Car M3-N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_072754_226325_8333E306 
X-CRM114-Status: GOOD (  12.41  )
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


On Tue, 04 Nov 2025 14:56:06 +0100, Marek Vasut wrote:
> Document Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
> present in Renesas R-Car R8A77965 M3-N SoC.
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Frank Binns <frank.binns@imgtec.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Matt Coster <matt.coster@imgtec.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: "Niklas Söderlund" <niklas.soderlund@ragnatech.se>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: Add RB from Geert and Krzysztof
> ---
>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml          | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml:107:1: [warning] too many blank lines (2 > 1) (empty-lines)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251104135716.12497-2-marek.vasut+renesas@mailbox.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


