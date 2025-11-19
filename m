Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB59CF3957
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 16:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ELdM+r+IjqfOBK0TgIKHMPjL9L+UqvoSh1tlIc8LMCM=; b=LuZ0blyY6J8ZPfWkrUQevLk+Nx
	HWBV4tMAlundJt6Wdeg9SR0m8rX7rkS3x4K1FblFskx8ejSPtK/2wdFwd9rVCA8sdh16O74iEc5BR
	p5UV8uQ9wsmffNFhwxQg60oW9EsEznCmSVYVq/IXdNzNBMd7X3mZn6viQ5IZIX6eMKa2v/EPeBGc1
	Dcfx15zyR+KYHSdmehLSYep0qU5ESV4TiR8lFlslvzdfkyH8u1VJh0mfXudappb6dRNjvt59C1XVJ
	PuMEIJSBz//9F6brMz2TQuiq0gNdnG/lymrFzvVfjS/N1ogHn0RjwIcoOK34HKPPNyy9OgRfQ134F
	vkAMTd1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLl7U-00000003iG0-2ZUh;
	Wed, 19 Nov 2025 16:33:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLl7S-00000003iFm-1vqE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 16:33:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 87C9C60171;
	Wed, 19 Nov 2025 16:33:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AFF2C4CEF5;
	Wed, 19 Nov 2025 16:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763570001;
	bh=i7tu3yLM0VynVlcY5bqcs6DeJo41e1PUYhoSNib7lwk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=DVDFHrJk84A4zymiV57X3ExnwuLvW0CE/LGPojju+eu4wWuy7NJcmGzR0WD7DMXPC
	 AR7po6HBkGfMn+DMQZAO/WfAqULzdm848KNna+EoU8nTyUHFyvcKIzqdQ4v+KaQkYN
	 8MmjEa1NIFK0dl+BkmW0tETpK18AwFc28h6WQCq9E0W/TN8S3eKWprf7yCc749NBi3
	 cjKnqViCC70PjVKaMtt1MqZwAOk0USTkCrD8nNBf4qpIKnbJqc+R8gpd9sbtvoZh7g
	 BEC18R6G+GcBu2mVDYrReRdyKMAuKyeiDrTf1nnUuAxDd0ju9L+s+dkjzexN8nR1zb
	 wxU1oQwlYLUkA==
Date: Wed, 19 Nov 2025 10:33:19 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-doc@vger.kernel.org, rdunlap@infradead.org, 
 tudor.ambarus@linaro.org, linux-kernel@vger.kernel.org, pmladek@suse.com, 
 linux-arm-kernel@lists.infradead.org, mukesh.ojha@oss.qualcomm.com, 
 linux-hardening@vger.kernel.org, devicetree@vger.kernel.org, 
 mhocko@suse.com, rostedt@goodmis.org, tony.luck@intel.com, david@redhat.com, 
 linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-mm@kvack.org, kees@kernel.org, corbet@lwn.net, andersson@kernel.org, 
 linux-arch@vger.kernel.org, jonechou@google.com, tglx@linutronix.de
To: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <20251119154427.1033475-26-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
 <20251119154427.1033475-26-eugen.hristev@linaro.org>
Message-Id: <176356999980.2657652.14038918040469312144.robh@kernel.org>
Subject: Re: [PATCH 25/26] dt-bindings: reserved-memory: Add Google Kinfo
 Pixel reserved memory
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


On Wed, 19 Nov 2025 17:44:26 +0200, Eugen Hristev wrote:
> Add documentation for Google Kinfo Pixel reserved memory area.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> ---
>  .../reserved-memory/google,kinfo.yaml         | 49 +++++++++++++++++++
>  MAINTAINERS                                   |  5 ++
>  2 files changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/google,kinfo.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/reserved-memory/google,kinfo.example.dtb: /example-0/debug-kinfo: failed to match any schema with compatible: ['google,debug-kinfo']

doc reference errors (make refcheckdocs):
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/google,kinfo.yaml
MAINTAINERS: Documentation/devicetree/bindings/misc/google,kinfo.yaml

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251119154427.1033475-26-eugen.hristev@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


