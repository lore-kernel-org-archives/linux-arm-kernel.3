Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABE9C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 08:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=br6wxqCRuh7twZ5JvsCrHoqed6mXVOFXEXTgRzuIa/4=; b=1o/AGq8FoTeYSwhGS68f0pd4WW
	KFig39eD5Z41p+lzJ857pQJwH9tlNx11dNlU+Ymj1N8d6CdTFPN8Y/Wx3AfJWfs7gBagMsM76Anjw
	ta+J3o/IQ9xW9ScVFvjYiw2kX2vI/ErZMEqLXePCp0ZkCU+K8g6MaPit7/dQHm8T9JgofB243+ZdP
	zOvMxEyXfTGmrrSPtwiTL/D/FmcK9j5c6cNtS+agi5Bv2oymSS7b13Zw4VRBl7aTVn8nH/Oesz4Lm
	L9Ah/x+Hi/kZhuiDoWOkQ13CALlr2QZohY46RRrUhmu4YcdZ1XmygGIGf1E5stMCwvVtjeT9DPvyf
	+Ec1e+hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiUCp-0000000ACvN-1UIE;
	Thu, 13 Feb 2025 08:04:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiU5e-0000000ABUV-3Zsq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 07:56:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A0A145C4D46;
	Thu, 13 Feb 2025 07:56:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50A1CC4CED1;
	Thu, 13 Feb 2025 07:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739433413;
	bh=Iw7l11wmjpe86HkNwFn62sRLFVZeqZaemNraot+F2wU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=quqrMz3uae0Oo1jl94HETvKATZAtuY6Grn6QVvedAs+nhmiWU8iCf+PIUUT7Iu1xw
	 7nxDal0wUQhsjviUmX1uPIMG4lyuTPZhKuZ88TJebIcXLgk0mfUHMnQ6OeeDuSEfnF
	 jB2WzNmyh+d12OSzhCxG6Ji03eMbFciaMXtvJLwzZqRwe+eudo8nI0VzWTuuODYGbK
	 0yOvGYX+kX/lOji/xeGL+dJOfCPCQesBt1gUgRJ5g9zxMwgeYFhU23A6+yE6/PlLNf
	 t/EBJx7NytUfUgxyERrzXkug8Zj9wkBpQaqtSEtk0fObmkhyR7t1XRXgkfJ6sfTwBv
	 1zK6LVJ+zIoxQ==
Date: Thu, 13 Feb 2025 08:56:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: patrice.chotard@foss.st.com
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, christophe.kerello@foss.st.com
Subject: Re: [PATCH v3 0/8] Add STM32MP25 SPI NOR support
Message-ID: <20250213-lush-rainbow-moth-0f5e18@krzk-bin>
References: <20250210131826.220318-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210131826.220318-1-patrice.chotard@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_235654_947566_50503A7B 
X-CRM114-Status: UNSURE (   9.73  )
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

On Mon, Feb 10, 2025 at 02:18:18PM +0100, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> This series adds SPI NOR support for STM32MP25 SoCs from STMicroelectronics,
> for that it adds support for:
>   - Octo Memory Manager driver.
>   - Octo SPI driver.
>   - yaml schema for Octo Memory Manager and Octo SPI drivers.
> 

You combined three different subsystems in one patchset and nothing here
explains why and what is the merging intention. Either split your work
or explain dependencies/merging.

Best regards,
Krzysztof


