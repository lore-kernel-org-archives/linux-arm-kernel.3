Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC979606A331
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 12:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ygqw0A8f;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dEVygYOq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bdazGzEMHpNo/xFZo4UuACj+NPbyfyXOOELqau7KKIc=; b=ygqw0A8ffJJGnq6ZChDt4XGdXn
	yuBv/bi7YKpbBgwxgn6uMDNxwnTGi3pR4Bvzms2yVRh+yvIVcLxDxGaOAzf4NhYoskb2wjUIrPzFV
	CvwFj780ShZq8rHxnQ0Wy4DJ0jkGEmik8gzPBx7mCDi7Klm0/S9MJQx6bPQ/tAx93n5BirtmZ1Upq
	Ec4pFUc9buL+PUx5UBEI0Hk09S9QQQKFwDOZsHqK+3xjxy/FvRSYW+/nwmIJOASt/6XSEtg8gby9A
	xmWE9Tkyp6wJ/w7KaqCSnZAKQLPHxQMY4BvhjLu8/OJMUMDkQsf0fSu2lqeCNYqHxrSnUU7lVIN+O
	LA6JEcIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPJVy-0000000CN4V-3hoJ;
	Fri, 06 Nov 2026 12:57:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPJVx-0000000CN46-0cEv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 12:57:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 962C3601BF;
	Fri,  6 Nov 2026 12:57:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D98F1F0089F;
	Fri,  6 Nov 2026 12:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793969872;
	bh=bdazGzEMHpNo/xFZo4UuACj+NPbyfyXOOELqau7KKIc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=dEVygYOqnRrT/sVNMu9qV4SOCkeLfSYdyomWHU2oiXdUiH9en1YWEYdmgfqcgbeS6
	 txS1KoPhhLGfx6EZmUw+giNlzPy4MFm1GCz+fngS9NM0ZUDHEnxt7vO5SFN73eTSeX
	 xp7c8Zrb3W+Z+Z2duQVDEFf3Kk6Y/FZ1oLyFNHveJOg20rJHSdf8yvlNA7iTQZmw9Y
	 rgknbdP7HeCFl4+3rABR7i77LhbDR7CpdYp6Ts9sVSgerBTQBq/AgZLLiQDtCMedHo
	 nzU0NiJq9EfXXM9WQNp4OfhY69bLuRoyyVwCwCNIl4157mEb4FM0mkRleIFrofs1iy
	 Sj9e6EIQQR1xw==
Date: Fri, 06 Nov 2026 06:57:49 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Benjamin Larsson <benjamin.larsson@genexis.eu>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, 
 Jonathan Corbet <corbet@lwn.net>, Anand Gore <anand.gore@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 devicetree@vger.kernel.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kursad Oney <kursad.oney@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Randy Dunlap <rdunlap@infradead.org>, linux-pm@vger.kernel.org, 
 Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, William Zhang <william.zhang@broadcom.com>, 
 linux-hwmon@vger.kernel.org, mfd@lists.linux.dev, 
 Brian Masney <bmasney+clk@redhat.com>, Conor Dooley <conor+dt@kernel.org>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
To: Linus Walleij <linusw@kernel.org>
In-Reply-To: <20261106-xg6846b-bcmbca-xrdp-reset-v3-1-d6adeb71afc9@kernel.org>
References: <20261106-xg6846b-bcmbca-xrdp-reset-v3-0-d6adeb71afc9@kernel.org>
 <20261106-xg6846b-bcmbca-xrdp-reset-v3-1-d6adeb71afc9@kernel.org>
Message-Id: <179396957046.2456734.10877146693637618600.robh@kernel.org>
Subject: Re: [PATCH v3 1/7] dt-bindings: mfd: Describe the BCM6846 PMC
 complex
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


On Fri, 06 Nov 2026 09:26:44 +0100, Linus Walleij wrote:
> The third generation Power Management Controller (PMC3) has
> different subdevices.
> 
> Identify the parent with the BCM6846-specific "brcm,bcm6846-pmc"
> compatible.
> 
> Describe the complex as a simple-mfd with a PMB bus child owning its
> register resource. Include the PMB clock and reset controllers and
> PVTMON, with its acquisition clock and reset resources.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  .../devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml  | 82 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 87 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml: Unresolvable reference: /schemas/soc/bcm/brcm,bcm6846-pmb.yaml#
Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.example.dts:18:18: fatal error: dt-bindings/clock/brcm,bcm6846-pmb.h: No such file or directory
   18 |         #include <dt-bindings/clock/brcm,bcm6846-pmb.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/linux-dt-review/Makefile:1726: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20261106-xg6846b-bcmbca-xrdp-reset-v3-1-d6adeb71afc9@kernel.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


