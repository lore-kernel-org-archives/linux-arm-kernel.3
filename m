Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA2CBCE8E76
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 13:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H22z+1DKblhixrrQFnavIFVOTl1pYEAvrFqvlkNkAyM=; b=ddUw/F5OVDdUtRZjzESCVjqIUi
	axS9xUNUnnihloDckW03VQkhNiartuQPP8up0NwOAoA2A+HpZ7W2Uw8Ix1lmL1VRJGi+Ve1pA4yUf
	wFpxa+XDKcsjTQcFsf1MHPPAMZJXdxGmbt8a8N6BK8liXqinf0oEtsIADqKvn5m321eki89btRHcE
	5PNOfg7voPNm47Pfbso0tPrP2xfA4FJ/wGh+ClXZVPufz5UdkM9kt7tiyOmxVea2p1nvCaIQFnl+E
	s6giPZApTkM07nbfqkAcWDdVT9UCfiQu0Ic9CuLDBIoqopMIWx1A9Nacr6yW8xXuTOfeDqM2dgQod
	xeeo+RNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3yBZ-00000000Znx-3qfi;
	Thu, 24 Oct 2024 13:47:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3y9v-00000000ZVM-3Y6y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 13:45:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5140F5C5FBE;
	Thu, 24 Oct 2024 13:45:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73AA6C4CEC7;
	Thu, 24 Oct 2024 13:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729777550;
	bh=wwPWvSBGUvSYbh2tv8Xhy1j32pV3xMYlKdte6yQ/l2Q=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=tvZhZ/WmfNUnyiKb5Ug+aYDARYpCaIaVruHf8RzheKEtrmA119942UEAyYXBDTIu4
	 Ij802krosYUO8QjsIiY7S0l0fkv7KWTLyVjKzJiRB/8+PTeYVyR2729dlbrS4xic9S
	 i3PNz0/nt5WYqKx5CZyeN+2RNC119c467bPSf2U7pLq/cBxS2XnRgjaLRKVD4e8Y83
	 +UUneGva/+KcjKgregL0zfY6OLdFOU1kuzilwUBX0YPJwC8zmbGVzpBYBfKWUQv4a8
	 t4htVWQwwVJ/KnXYfHbiTrWlisRfL6nwN8GK8ZwIgJSw3v0WKo6f8UMq9Y++my8OXd
	 vXDn+M6UHDTqA==
Date: Thu, 24 Oct 2024 08:45:48 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: BMC-SW@aspeedtech.com, conor+dt@kernel.org, devicetree@vger.kernel.org, 
 linux@roeck-us.net, jdelvare@suse.com, krzk+dt@kernel.org, joel@jms.id.au, 
 linux-hwmon@vger.kernel.org, linux-pwm@vger.kernel.org, ukleinek@kernel.org, 
 linux-aspeed@lists.ozlabs.org, andrew@codeconstruct.com.au, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241024071548.3370363-2-billy_tsai@aspeedtech.com>
References: <20241024071548.3370363-1-billy_tsai@aspeedtech.com>
 <20241024071548.3370363-2-billy_tsai@aspeedtech.com>
Message-Id: <172977754729.100390.12938687199677719303.robh@kernel.org>
Subject: Re: [PATCH v1 1/2] hwmon: (aspeed-g6-pwm-tacho): Extend the
 #pwm-cells to 4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_064551_952244_23991608 
X-CRM114-Status: GOOD (  11.72  )
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


On Thu, 24 Oct 2024 15:15:47 +0800, Billy Tsai wrote:
> Add an option to support #pwm-cells up to 4. The additional cell is used
> to enable the WDT reset feature, which is specific to the ASPEED PWM
> controller.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> Change-Id: Iefcc9622ac3dc684441d3e77aeb53c00f2ce4097
> ---
>  .../bindings/hwmon/aspeed,g6-pwm-tach.yaml    | 25 ++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.example.dts:54.48-70.11: ERROR (duplicate_label): /example-1/pwm-tach-controller@1e610000: Duplicate label 'pwm_tach' on /example-1/pwm-tach-controller@1e610000 and /example-0/pwm-tach-controller@1e610000
ERROR: Input tree has errors, aborting (use -f to force output)
make[2]: *** [scripts/Makefile.dtbs:129: Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.example.dtb] Error 2
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1442: dt_binding_check] Error 2
make: *** [Makefile:224: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241024071548.3370363-2-billy_tsai@aspeedtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


