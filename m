Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CB6E77361
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 16:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GhK7AdFtNADtztNLLZDF/NeiUiQNdwxsGIWV03jNe1Q=; b=AWWvoRjqVNgSfq+gwTNSSZJl3e
	BSTGdDs5CVga/S/MHAxmJqTWE14sJOpr95SMKhxh/OZojAjSdE9PMqB0gpGbXkOIToiFcle+UCNc8
	gJprtoss+WRmGTtOGb9Nia7LeW99CarAEIzvhgOd61PWUzGfNnQzG7NozbTRnTTRK4fuMclZP4Dqf
	DjZMyXPSq1hGvDydfKzCnYypBddnCQC61BO3Epp1Tvpg9pu6RcQkYef4MlxIBJnhyU1vKzzc2+r7g
	pfc9g1HaDfp2fKfVP1LxQWxKSvMs0pdc+WRDmbXQkkZRnAmDNSoV58mfafQUTTAmEu+J5YIpb3ey9
	771eS7xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYRZD-0000000HDy3-3IHI;
	Wed, 24 Dec 2025 16:18:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYRZB-0000000HDx7-3vF7;
	Wed, 24 Dec 2025 16:18:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:Content-Type:
	Date:Sender:Reply-To:Content-ID:Content-Description;
	bh=GhK7AdFtNADtztNLLZDF/NeiUiQNdwxsGIWV03jNe1Q=; b=gLO5rfF1Tqq1r88i6fjLWC6aJI
	kZzLRehXs7FTVCRxSwSCEywugGwxzw/HOhaIUDs0DE0JOuXGBkVzC64vqpjBCacAe0Jzo71hbiXB+
	pR526zCS0rcBE73I0S151Dh3Skq2PotQJUgME+bi8mzTnvvDW7MssJScbT4YQ9dlZ9z1YcdF09YC+
	xAUG1hiaVpXyixm9+boPZy739Su+1tYwo8pJZwGXq0NEcE/n/zwdPTi5mWTv3hBDCF1WR7ZT4MsCA
	U2UYGCtwVy3+ksN2lgeQLDeJdonKRpJOBZU4wsDmu+dKdMKiZ1BFxSeZIREqkg0047UjbFjxmuNrn
	H2p/7Jwg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYQge-000000001e6-0A9n;
	Wed, 24 Dec 2025 15:22:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B121644289;
	Wed, 24 Dec 2025 16:18:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61406C4CEFB;
	Wed, 24 Dec 2025 16:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766593098;
	bh=iMXkABTtT2jUhTkS7ZjEcPSXT6V0xsOrCKrSf5gKHPw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=D05z/P4QjZ7p4TL5L15ojXlcWgzhV1Gi/+Eo7Ufub27W7j34IDH06EmosV417zLWj
	 1ezFaVtg/V4eCjwHulpzhOV0evhWSpGqsd/myV66ya5pHJgkNpIMtGQKHqRXugnkF7
	 iBnC9GZFZXIEwg/+CkBMTiZPiIYGlGwe+cYiRd7s5Gww+0pX5FxfpvNube1wLW4kmD
	 0lbjjE3Hpgxv6aflGPeOsMlVMrFPy+f9X1EFGsXJJJ9/Dmw5hVXteYEdgoNSapPt7o
	 CEEf7DKnDFuhiye+PcbPoDELep/hpMRqxSbSYHPgB5ib7OLYrTUYtKo+20WC3FoioJ
	 tHIirx3VMMmcg==
Date: Wed, 24 Dec 2025 10:18:17 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: will@kernel.org, linux-kernel@vger.kernel.org, bagasdotme@gmail.com, 
 maddy@linux.ibm.com, krzk+dt@kernel.org, alex@ghiti.fr, conor+dt@kernel.org, 
 haren@linux.ibm.com, dan.j.williams@intel.com, jose@osyx.tech, 
 prabhakar.mahadev-lad.rj@bp.renesas.com, 
 linux-arm-kernel@lists.infradead.org, nathan@kernel.org, pjw@kernel.org, 
 linux-riscv@lists.infradead.org, catalin.marinas@arm.com, heiko@sntech.de, 
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org, dev@kael-k.io, 
 linux@armlinux.org.uk, neil.armstrong@linaro.org, kever.yang@rock-chips.com, 
 corbet@lwn.net, ajd@linux.ibm.com, aou@eecs.berkeley.edu, 
 davidmcerdeira@osyx.tech, palmer@dabbelt.com, mani@kernel.org, 
 linux-doc@vger.kernel.org
To: joaopeixoto@osyx.tech
In-Reply-To: <20251224135217.25350-2-joaopeixoto@osyx.tech>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20251224135217.25350-2-joaopeixoto@osyx.tech>
Message-Id: <176659309602.2305345.1814998732546100865.robh@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: Add Bao IPC shared memory driver
 binding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_152204_554451_9D7B43A8 
X-CRM114-Status: GOOD (  15.28  )
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


On Wed, 24 Dec 2025 13:52:13 +0000, joaopeixoto@osyx.tech wrote:
> From: João Peixoto <joaopeixoto@osyx.tech>
> 
> This patch adds a Device Tree binding for the Bao IPC shared memory
> device, which provides a standardized description of the hardware
> interface used for inter-VM communication in Bao-based systems.
> 
> The binding documents the following properties:
> 
>   - compatible: "bao,ipcshmem"
>   - reg: Memory region for the shared memory device
>   - id: Unique device identifier
>   - read-channel: [offset, size] for reading from the shared memory
>   - write-channel: [offset, size] for writing to the shared memory
>   - interrupts: Interrupts used by the device
> 
> This enables kernel drivers and userspace tools to correctly
> instantiate and configure Bao IPC shared memory devices based
> on the DT description, facilitating efficient communication
> between VMs.
> 
> Signed-off-by: João Peixoto <joaopeixoto@osyx.tech>
> ---
>  .../devicetree/bindings/bao/ipcshmem.yaml     | 99 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>  2 files changed, 101 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bao/ipcshmem.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20251224135217.25350-2-joaopeixoto@osyx.tech

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


