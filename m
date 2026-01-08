Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F01CF6A9B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 09:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nlafj51NZlRLZNcCQvX26YM1leQgX4PdSsjSMwzfNK4=; b=pA2nd3YYbf1Xyqr65cUXQqNIjb
	tj7T+Uig2HtyKfiMgat2QCmaYtUp4mdCA+zriqbYRGijMqjyCSpejV/OFxIu22SdVzVkbYHQsdFtz
	74uEbu0xEm3vapl7PMpVABkLHF9ZV+9dCSSDa50+zqiaOFhZ9Ofs9cYAzMckOYu0aE7wQfZtnSQHQ
	tgdB3eTaGa57CDnkEsj56sZXDiBbIMdhT7KNFSQtH5bB16tg5k5h2Pl/aT3KzwjZnapjnrB57HKj3
	R8Xi6lRGV3vQF5nIX51/RP3r1Z6EtabAzZ5ybSZsLYz6vAEp1Lu7ywkTs5SfYjZ/tSq1PIFIx860Z
	5kkpkSHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdmKr-0000000GTCA-2u38;
	Thu, 08 Jan 2026 09:29:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdmKq-0000000GTBg-0GEF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 09:29:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1F34F6001A;
	Thu,  8 Jan 2026 09:29:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D5BCC116C6;
	Thu,  8 Jan 2026 09:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767864578;
	bh=W8DJmHThBYvxGSmtz4McDRjOmfRywwR7+XCWBWBL1l4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f+u5DmplBkq203+bl7h8gv/gMn1W3Ksr4DnuBjxBUikh8Isjso1UliWw+z7+Uy3K4
	 pfedbjT0JAncz0yLgOoDmicTWKkQ3UgggOvxVRkGmjpwsy+4bakGPgtLXGZpXxepcz
	 pTtGtO1Md+MBlPv1cLaWXioLGd0FbN5YakLkVqJ/yS2en0MCa7QK44Cw38A/WDHrTj
	 hdoUS0cGjV3cLvne3L3sejbUSY7fwNDS6HU8ZCDJP/Iey7FPNGlWh5Q8OEBrmjlh8o
	 LZaXsaU7bnQZNW7FCuknupcNZmvMNIYAIo5ZP8fhJ0oSFfwvHrDKfWIhdtzoY1L8t/
	 PPpIdqb/JcALw==
Message-ID: <38385033-5bf6-4ee2-b227-f46677136d86@kernel.org>
Date: Thu, 8 Jan 2026 10:29:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] ata: ahci-dwc: Simplify with scoped for each OF
 child loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Niklas Cassel <cassel@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 llvm@lists.linux.dev
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20260105142944.372959-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20260105142944.372959-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 1/5/26 15:29, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes and switch to
> iterating already over available nodes to make code a bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied all 3 patches to for-6.20. Thanks !


-- 
Damien Le Moal
Western Digital Research

