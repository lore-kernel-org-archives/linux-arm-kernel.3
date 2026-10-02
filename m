Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC9FCA5FE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/xGjEmegI8pTO7Ox5jxESlFHhUmyOfP4GxHY3lbaDc=; b=fWP4/uarXDO4OBXy7TCr0Tq/nw
	I2+Ji22/toVOVhnfoj05PgUQefhVP6ipK8lmI2a8Q3DRYpcbzg8Jc8bwNh/jeYlz4VFJDcFQ6CjW1
	y8y+Wt8Sk2o1G9L5RSHbP4zXQEy1FBy0PbcU/6jocCn9O7d8bnLViLnR+rOnDQ9sfwvY2sCVcjLid
	Wy6aiFQ25Gexhqfrh7f0yR82tAaOWE64NLfxj8SNXeP6an6jRzQu/MCrHj1BbWOxH4co6O5RhesJ0
	3ESlP/ZhOWTyKC2mhHeWFsMYv1W3VIpLwfT3Auie3BUHtkV8qTBzsGUA5avid5EK1Kw0cdTNNNQ4M
	bj25g2Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZZ7-0000000B94J-1nwP;
	Fri, 02 Oct 2026 09:28:29 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZZ4-0000000B91q-1TP7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 09:28:28 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so45096675e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 02:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790933304; x=1791538104; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9/xGjEmegI8pTO7Ox5jxESlFHhUmyOfP4GxHY3lbaDc=;
        b=vm0GYr5KV7cUN9BeiLDmaShrjgRvnc9A3aavmC7pKXEe37V/bSHcCLIUfQYGNE3DYs
         Jwwc9jOM5zkGh6gthtk7FpOlGnv7uY19Ul3NNuIJ3PXea7SZWycyRS6sN79PiBfseoEW
         jjsLIPtgyo1eqz/XeE4McHLNXryzPgE+qpAMjJlnW48xgJFR/KfxpgyQCKtu9jHfhe0X
         5L0YUcrSMrKN4euLNlk8hNW0S2HqHEuQWUSPa55YgLwTerOcrJDisSmVAT+5Z4dnXkKx
         mcvHliN/h2xl4/f7C6UNtBf2RZT4acrpah1Z6tEmbpHFxS5CXSjhNFeBUFzgzFjnKntL
         HH7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790933304; x=1791538104;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9/xGjEmegI8pTO7Ox5jxESlFHhUmyOfP4GxHY3lbaDc=;
        b=iIVerHdv1yYsxLT/czi6KJypX9v/CDU3mT6xmgyduGYr/YTRIaVKBsfcS9Tjai2afu
         uczL4ZZ9jTrm5A/7K4wqdev+5jooRwcofDCxE3wuChaK6zVW/tS5Juv6nYFBUiIiOpIk
         aVM6ZZNRVRFuCV7L8OQ0tAqMFapsOCT21XFui1KZuwSjN+gMSA1ZZGy46uqNP4223lHy
         txLpENrRBO+brL+L5wyGwSxY5ft+tJWT1JFigiY+JpX08nY+ievgzm/lPa8of93qGe62
         zCMjrt1P4k+WdlGBb3s+fYtH1/Pzma+wYEzlvMJo1L6L67+SJlxfOUAj4RMjZX0kT+6V
         hsoA==
X-Forwarded-Encrypted: i=1; AKwUvBx+AfBCBNr+0R7PxDj2HaPGhUZCuxLzZ354vRARjZhSdgyl10b3VYPhk32G884CYyBhHNZKatmqa4oWKdK182nf@lists.infradead.org
X-Gm-Message-State: AFuF++kVRp4eNKkShDTVJX6YSvha6GHVepOqIYtr+7VsYz1Gtsgbit+R
	8o31tJ01CurMvxxie9b1jtT+mZzyGyXPCSts9SGO1F/SRg4eLoUuGUaWg6igtU2URwo=
X-Gm-Gg: AYBFou1tJQM6ljolq/6YCWjiS4zMf9sLi0z+Ch4KvHVJvViWzInRDYsbCt92L64K393
	lGyHeceP83MHqcnHx+BnVe/x9w9bTCekmDDQW+QtCq+RmBoXK3ndvXFP2eltfLlososWrf850/3
	eH5NYzQ8vGs3gI7C9r8dlvvPFhpCC9efsZJNMzNP2cgyQLQDozfiM8eCDJ5MABxk6ocMIoae2sA
	shQaHA99VLLdodGeYOrCjHAZakydswgo5U2xqS2TypqB2g1C8l5mWsG97O3mk1q6EMZAde62F0H
	c6Qc0CIz64a1oOOPlJhWuBYnpF8zWurJXZ1c9x0V9dH8J6GEFlQdHiB3om4ite+jSCt4N/h2c0B
	Dv5Z3EMNhK/z3ZdFe34fUBJBUqgGri05BJbSUtSaph9RyvjFdbZPnEnLFpvCClyve9M/Y/ihHI/
	cCrCTCn247QH90jwC2exQR4YcITA1eMF8dVk9RCLDyg22evAB4R52Z/WjgiDAmBQ0nHtPnGmS9I
	vc/s7bMLZcfWpFtT+8=
X-Received: by 2002:a05:600c:840e:b0:49c:fc6e:a3dc with SMTP id 5b1f17b1804b1-4a0276ea428mr38917245e9.27.1790933304386;
        Fri, 02 Oct 2026 02:28:24 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03950375dsm22989995e9.1.2026.10.02.02.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:28:23 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Chuan Liu <chuan.liu@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
References: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
Subject: Re: (subset) [PATCH v2 00/12] soc: amlogic: clk-measure: Add
 support for more SoCs
Message-Id: <179093330346.2296861.8852172233922608550.b4-ty@b4>
Date: Fri, 02 Oct 2026 11:28:23 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_022826_414523_952FB89C 
X-CRM114-Status: GOOD (  16.03  )
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

Hi,

On Sun, 20 Sep 2026 18:25:02 +0800, Chuan Liu wrote:
> This patch series adds clk-measure support for the Amlogic A5, A4, S7,
> S7D, S6 and A9 SoCs, listed in the order of their release.
> 
> The clock names for the clk-measure channels are kept consistent with
> those used by the clock driver as much as possible, making it easier to
> identify the relationship between the clk-measure channels and the
> corresponding clocks in the clock driver.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.4/drivers)

[01/12] dt-bindings: soc: amlogic: Reordering compatible of clk-measure
        https://git.kernel.org/amlogic/c/b6dd5a5465bb1c24279c1b18d9ee738c996f9ec6
[02/12] dt-bindings: soc: amlogic: Add clk-measure compatible to support more SoCs
        https://git.kernel.org/amlogic/c/668232197683898b1dbab05d6f1e7f93084160c1
[03/12] soc: amlogic: clk-measure: Support more measurement channels
        https://git.kernel.org/amlogic/c/abb63af22300c59e0e8dca322c21ed186ba7e51f
[04/12] soc: amlogic: clk-measure: Align compatible entries with DT bindings
        https://git.kernel.org/amlogic/c/8c6e2215b7ce72901e6aa2fecc4166d75e60c7e8
[05/12] soc: amlogic: clk-measure: Add support for more SoCs
        https://git.kernel.org/amlogic/c/5508eab53e4b79a1b45f78713cab6e7154131800
[06/12] soc: amlogic: clk-measure: Optimize CLK_MSR_ID to reduce memory usage
        https://git.kernel.org/amlogic/c/a848d72aab71e19ea78180f2502ad7d12818723f

These changes has been applied on the intermediate git tree [1].

The v7.4/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


