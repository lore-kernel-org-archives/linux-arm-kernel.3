Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB54C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 07:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YqNmEoIecbeBKwg0gN1zdSUEN9aM51sVudcwmIk3K8g=; b=nQRISg8eBxglZtvXivg3+x/oNC
	1xPE7U8bVFKpivjepWMbqLDHAzXNQfWR/7i25V31bPqyytt/Lv8OPdZJHN0oqdw1/V+aMmA3p2wF3
	stqS3uw7ayVEYDW7Cb5Dg3X7C8Q7+ZBMUrEe1iY8ord/sc1onqro/HQUz9AHgYGgy1bFoU+V7eH6C
	ECpGU/70iSLV41x87Aw8wE12UQLC1BXqXegupXLj7F1hHQy1qAxZDIFni/6HthxEk1pIQaINa0A2k
	7TgQ63+nl9h3EBCaH6Flxay7uY8oLh8o3+QnkSrKuEPUqYZofWOxM9e3agN3WapHAYmIKmA0GbeRO
	GCZ/h86A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujv4D-0000000HT2J-2VXb;
	Thu, 07 Aug 2025 07:29:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujv1f-0000000HSfM-1BUe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 07:27:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 58C4A5C629A;
	Thu,  7 Aug 2025 07:26:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6275DC4CEED;
	Thu,  7 Aug 2025 07:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754551618;
	bh=bb7LlDA7OpV7Qv2Xzhoqqi80I/uW8JaOPH4FzntEDfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RARr7oXYIsoOmGGKVYK80eGl+V7p9fEMpd6wq8gkvI2QAw3Pdn/Qza1dm4JMuQIrR
	 ckHcFFIbPjSyYXr/bDzKd9wTpftvlrtlWh15XwQH58GQlO6e+zJGVNp3500ZZn5QYD
	 5QneCWxxF3IjJSq5ND/6IsuN9KFsCuZch9rp7IJaEKeFaWa8yXIY41vKuTh9M5iowv
	 ulfCsz9H9JMuN7Rc6ASg0VhV8C/3QfmVDNQteffZ4he+83stLI7XNfGWr4Vd5y9RNR
	 e6HhbcXI/axVm5F+nI+ndKUr629ax2PLvQV26eyZ57qaiXWLKFxTy2cm/t4Tz3sNwv
	 ItroFzgrdWagw==
Date: Thu, 7 Aug 2025 09:26:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: imx@lists.linux.dev, Abel Vesa <abelvesa@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Marek Vasut <marex@denx.de>, Frank Li <frank.li@nxp.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 0/9] Add support for i.MX94 DCIF
Message-ID: <20250807-psychedelic-vulture-of-valor-d743cc@kuoka>
References: <20250806150521.2174797-1-laurentiu.palcu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250806150521.2174797-1-laurentiu.palcu@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_002659_357567_B3BA3B90 
X-CRM114-Status: GOOD (  17.88  )
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

On Wed, Aug 06, 2025 at 06:05:07PM +0300, Laurentiu Palcu wrote:
> Hi,
> 
> This patch-set adds support for the i.MX94 Display Control Interface.
> It depends on Peng Fan's DTS patch [1] that was not yet merged. Also, it
> needs the BLK CTL changes [2] that I spinned off from v2 in a different
> patchset.
> 
> Also, included in the patch-set are a few extra patches that the DCIF
> driver depends on for functioning properly:
>  * 1/9 - 3/9 : add support for i.MX94 to fsl-ldb driver. It also
> 			   contains a patch (2/9) from Liu Ying that was already reviewed
> 			   and was part of another patch-set ([3]), but was never merged;
> 
> v3:
>  * Removed the BLK CTL patches and created a separate patch set [2] for them;
>  * Collected r-b tags for 1/9, 2/9, 3/9 and 9/9;
>  * Removed the DCIF QoS functionality until I find a better way to
>    implement it through syscon. QoS functionality will be added in
>    subsequent patches. Also, used devm_clk_bulk_get_all() and used
>    dev_err_probe() as suggested;
>  * Addressed Frank's and Krzysztof's comments on the DCIF bindings;

What exactly changed? I cannot find v2 of one of the patches, no lore
links here, so with incomplete changelog I say you make it difficult for
me to review it.

Best regards,
Krzysztof


