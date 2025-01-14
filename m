Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC339E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 00:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=96OHoOwSN+R+9ZgJ6AGbG6E0JjTK7ibX/wrqTSKXGbo=; b=aIjYpmOmzI0upu9hUd8ZWG3A8r
	ppbYTyVpUJtDB8sDPKoXzgNLsovmqPlLch7aAEChoh5JWVzKkCUcbKufI154Fjhg6Boy2Pnj0KGdK
	A30Ea5H3QG4XUqVZB32zni+2Gu7gPZbrn+bSpM+uf0xhHtBCLUz9C2lQZBVahNF7EO+ukKt4Y90Fq
	IBD/7g90IMP6LCf7+wVdX7xi0lghML6t7gbhzVVxzULsbOTFyFehPTEdEMwNE6KL8noICGApEEAn3
	CrElwa2Vm0RmkBmVqJdxlG7ZwcQ9vA4POCfdi4FGfji7qkuEdxGRsscmK8UXy5EbwbdFRKa2sFhg2
	AcyqCMCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXqph-0000000AA29-0DCj;
	Wed, 15 Jan 2025 00:00:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXqnH-0000000A9ij-1shv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 23:58:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 33BD35C5A5A;
	Tue, 14 Jan 2025 23:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66EA0C4CEDF;
	Tue, 14 Jan 2025 23:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736899078;
	bh=tpzPtlhfSg1oMQzL2Ct27bJY5cpUAeZYKUcwY61RUAs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=YR4jv4VqMwHB30SIKNMX6+CkulB9Ga/HxazCKrQ9IEhW3b/hkvOihD10wmNx5Zwep
	 xgfu+TfRDvQSNWzq+8nyUNAmlBR4NBhplr8wvhekLzglPGcNjTNu9GPdn6wVp4yCMJ
	 cB+8b70SUbUZECxB/C9SOvcS993DDbrPCKVhNekVJsEnDJ23Rywpi2j2yI8IRb8KSi
	 ndbzYFzP7E/ezdJa8n1pRKj9+3TwSEnWczBn2EHciN9COm2PPFSXlCg3fUbT5VkQIs
	 t4uAsa9uobHF8IBR1P+LB6GGxx3R0XxsgDAoDKZjatJ1Nc5cGFNhYhFuvAIUy2jqGB
	 FVzZJOsLOGrOQ==
Date: Tue, 14 Jan 2025 17:57:57 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: andrew+netdev@lunn.ch, pabeni@redhat.com, 
 linux-arm-kernel@lists.infradead.org, edumazet@google.com, joel@jms.id.au, 
 krzk+dt@kernel.org, linux-kernel@vger.kernel.org, 
 andrew@codeconstruct.com.au, devicetree@vger.kernel.org, 
 davem@davemloft.net, kuba@kernel.org, 
 openipmi-developer@lists.sourceforge.net, netdev@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, conor+dt@kernel.org, eajames@linux.ibm.com, 
 minyard@acm.org
To: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <20250114220147.757075-4-ninad@linux.ibm.com>
References: <20250114220147.757075-1-ninad@linux.ibm.com>
 <20250114220147.757075-4-ninad@linux.ibm.com>
Message-Id: <173689907575.1972841.5521973699547085746.robh@kernel.org>
Subject: Re: [PATCH v5 03/10] dt-bindings: gpio: ast2400-gpio: Add hogs
 parsing
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_155759_526379_6E3920B6 
X-CRM114-Status: UNSURE (   8.99  )
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


On Tue, 14 Jan 2025 16:01:37 -0600, Ninad Palsule wrote:
> Allow parsing GPIO controller children nodes with GPIO hogs.
> 
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
>  .../devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml       | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250114220147.757075-4-ninad@linux.ibm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


