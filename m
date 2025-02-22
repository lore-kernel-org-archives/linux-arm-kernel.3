Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DA4C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 09:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y7IbiKZDd7lNcNGugMRpMK/HiDlbn0S7hiYRdNAZLgo=; b=BpjMKVcQ5PoeU3RTqxpw5EuwKI
	XSJS4Bd8IKWTb+K8UyR7Why2eI4wH3ABaOSr8/rxePmFp+6OyCfHLJDscsI79YgXBsqZpqvGGfICW
	QJnXX6izKL1D+BhyqCITwae/nvQOLm6rwpmdPQuZ1YWrxVsF38OSE2N/FcKb6s3n2coDh8HWuoqnY
	g/30zqjNB/sT6aAG03u6ZzAkBpeLDCtu/80hIInNOzHbmpbh2YacITxSV2HlP7eaKfks2hdAp2kdJ
	8wsqz1v5MCOmT+dqBlg3jxkgojO2nqLbdRzmfsAYBWOmv2L4qqaUozIAnC7sobjPBKU3hqDXQzQ5U
	Y9/pV4WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlm7b-00000007lYi-49PX;
	Sat, 22 Feb 2025 09:48:32 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlm4i-00000007lCL-1aO2;
	Sat, 22 Feb 2025 09:45:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 678AA611AB;
	Sat, 22 Feb 2025 09:45:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3D91C4CEE6;
	Sat, 22 Feb 2025 09:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740217531;
	bh=+yD530lOGCPFmwWjgz2XLbqeuEp0ZxyaxcDKhfIMZNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SQH7rc+Q2YHr28OXGOnaugKDvk7349T3YGrvcH1Z+KVcbFT/IQlhGvGd5pn4io3sT
	 gFjCciWD9klu2NvJBVU346KNaZpHKsP/oOfY1PozAKQB302scObTcKi2P/oPX1yy/C
	 7e7q1twgNeUnx0mQqZkYpLzWF2amBgMZRhxIjDWU27749dtNTHus9hHY5xaMgokybm
	 YEjsQ87hA6IOAg2gTJpkGAVkdRLAikxYHg7lFmsRzfZrtgZSmMFIgcuZCeL1jrykMJ
	 rejtbai3OSWildxZpQpe+GOXes4kO91A9emkdGk5cG08A/c7X33lJ9oZT2h5izV0E4
	 YiCNGbzUtGAyQ==
Date: Sat, 22 Feb 2025 10:45:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Friday Yang <friday.yang@mediatek.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v4 0/2] Add SMI reset and clamp for MediaTek MT8188 SoC
Message-ID: <20250222-miniature-coral-starling-eda1bc@krzk-bin>
References: <20250221074846.14105-1-friday.yang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250221074846.14105-1-friday.yang@mediatek.com>
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

On Fri, Feb 21, 2025 at 03:48:30PM +0800, Friday Yang wrote:
> Based on tag: next-20250220, linux-next/master
> 
> On the MediaTek MT8188 SoC platform, we encountered power-off failures
> and SMI bus hang issues during camera stress tests. The issue arises
> because bus glitches are sometimes produced when MTCMOS powers on or
> off. While this is fairly normal, the software must handle these
> glitches to avoid mistaking them for transaction signals. What's
> more, this issue emerged only after the initial upstreaming of SMI
> driver.
> 
> The software solutions can be summarized as follows:
> 
> 1. Use CLAMP to disable the SMI sub-common port after turning off the
>    LARB CG and before turning off the LARB MTCMOS.
> 2. Use CLAMP to disable/enable the SMI sub-common port.
> 3. Implement an AXI reset for SMI LARBs.
> 
> Changes v4:
> - Use 'devm_reset_control_get_optional_exclusive' instead of
>   'devm_reset_control_get'.
> 
> v3:
> https://lore.kernel.org/lkml/20250121064934.13482-2-

That's not a valid link. Fix your email client.

Best regards,
Krzysztof


