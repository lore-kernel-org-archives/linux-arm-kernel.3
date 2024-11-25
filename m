Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9E7D3B7CA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 02:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCGa8ZvkOxMD8D42/bov6neNnItCmNSpdIPaLLzttPI=; b=gJKtWjVSroXngkWk+AwnOTXyM7
	6+EaB5B3xbqB+JwHxFMPDn+HtlKkjEvqaxhBLbknSTPfMO8qXqKccBhcopRXip89IqrcYLBlpFLJr
	hUrjC6wLaSzvXF3y+WCeW62EpQR+0M/a1RgvZOg40JOApplA4BGpwhv8YF39cc2Cooo7+/5fBDiM1
	ZURoNuzF6x0K5FOxJiYUd1+MlWQVSBtveMn6ZabDjaRFgJo5g34kjk3Q6QIyhglLK18U0AJBXnuxP
	vV7hhrdNL5isIyBJIL1QwQfmXIL3PkCt4c+gQsTumCHpuWG8ANHMOR0lj4we1aquMZaZXh8+fc28D
	4gBXxciA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFOW1-00000006uMs-2wED;
	Mon, 25 Nov 2024 02:07:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFOV4-00000006uEY-1OPv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 02:06:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DCCA25C5826;
	Mon, 25 Nov 2024 02:06:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B31A7C4CED9;
	Mon, 25 Nov 2024 02:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732500412;
	bh=Gu5Wu6oqy5RrPJGF75jiB8mV6u7GUvi00veqq4oAV6I=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=MYCyg9Na2ZSPDLA10+VfV7vvGR536PZbxkdwlN9SVGiZXCNzmI4JkyDU4ml3fYcz8
	 HOYLlKb2i8HldOFxv15S6gVnl2YWa8yYMfxL9gqs9YYgLXWpcE/DVzlDug1xD9AIUs
	 xgoTY0HkEL1a5n/pQBK1zMeJRptg9wNThp07WVrBCiIL5cFOpefCPGp8BjBHUqKHRN
	 Kbj7ZpslOPuKDpu1i7WKRP9xiMw7t1d3k3MO99sMOmwKaAaBDL0ISNZb4MUcli10bc
	 r/JBxZUf/mUqJvtjdoBd7DjhpSa0A2R2aT6B04oJ2vAL0JntI9gx2hsAYXZvxVmRzC
	 wk+GWhxiBC0VA==
Date: Sun, 24 Nov 2024 20:06:51 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, asahi@lists.linux.dev, 
 David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 linux-arm-kernel@lists.infradead.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Simona Vetter <simona@ffwll.ch>, 
 Sven Peter <sven@svenpeter.dev>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
In-Reply-To: <20241124-adpdrm-v1-1-3191d8e6e49a@gmail.com>
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
 <20241124-adpdrm-v1-1-3191d8e6e49a@gmail.com>
Message-Id: <173250040970.6667.2839660338071681474.robh@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindgins: display: Add Apple pre-DCP display
 controller bindings
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_180654_409457_A576DFFD 
X-CRM114-Status: GOOD (  10.73  )
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


On Sun, 24 Nov 2024 23:29:24 +0100, Sasha Finkelstein wrote:
> Add bindings for a secondary display controller present on certain
> Apple laptops.
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  .../bindings/display/apple,display-pipe.yaml       | 59 ++++++++++++++++++++++
>  .../bindings/display/panel/apple,summit.yaml       | 24 +++++++++
>  2 files changed, 83 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/apple,display-pipe.yaml:21:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241124-adpdrm-v1-1-3191d8e6e49a@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


