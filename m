Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E020FEF36FC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 07:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XXAIEgYyFDyPErTcRTxhZ9EI3l+0Jp6O2Qj1ystvIg4=; b=S4kAAbFnSMXKNQUDPcEwV4aAbQ
	vhPrPdTc9vSmmaKqMrCEQc1+l1cmiR6csoqm0MAa1uMC9iHeRIxa6+euZ2DZab2VfoVTIIKRrm2Go
	va8BDX6DRMz+wx8vZB1r9g/ThyEyXhfqSwn4cxApzdXFckfk4jbMsxc1M4RfEm24dUMpqqIlWVGRf
	ECMDOgqmp1wfl/tiL64nadz2Jl1Rd4VyjSFFWSSDfSD+5zokAECn85bEH94MSmo98RN7LwUHfVwui
	UeGOt7ubfw6Y6hXlR7jzC7Al/YZoNBD9aSaBtr98o7ag2nwNIwY9ZPx4UssxglLLPzWXZfjvf0BLG
	KNOsN+FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzVJx-00000006pQq-2CRw;
	Mon, 09 Mar 2026 07:46:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzVJt-00000006pNW-0NBH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 07:46:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BD0B440417;
	Mon,  9 Mar 2026 07:46:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A935C4CEF7;
	Mon,  9 Mar 2026 07:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773042388;
	bh=iwUlxC4sI4L/1Bt81ev07M3Jllw/0mil1MXgWHdhGwM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Apu3b/a+dVdHUhfrPdcCVL105BrCwJ+D0wYJTE0ibN2b4+FF61w1wYMIeAAWMdp51
	 sDWOM3d24GXynPma/1wci55PefXmawfiGebrcOZr/VwRQjcWBpS9ua6InwgGzGINwS
	 McntL7v+mrSkhkeRFByTj6qXBjLitr7QZJKcaCyya0XQFmzQNDbs0jfjw2rn6h9V35
	 nFyBqaACd8JcT2baURjT3Jn70nMp/IQVLV2pRwc8dwc4Aer2+hVd3lf3tOIELEHQH0
	 XFd9HYtmufqxdcSOXJaYgmrp7C2GTzcwzu0eyiClPd9DhVlHHCjpgIHEEbSgVY4sns
	 B9BpnJLRfbkPA==
From: Vinod Koul <vkoul@kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michal Simek <michal.simek@amd.com>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251224124531.208682-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224124531.208682-3-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] dmaengine: axi-dmac: Simplify with scoped for each
 OF child loop
Message-Id: <177304238675.87946.17739384709818604272.b4-ty@kernel.org>
Date: Mon, 09 Mar 2026 08:46:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_004629_157533_BFE4B829 
X-CRM114-Status: UNSURE (   5.59  )
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


On Wed, 24 Dec 2025 13:45:32 +0100, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> 

Applied, thanks!

[1/2] dmaengine: axi-dmac: Simplify with scoped for each OF child loop
      (no commit info)
[2/2] dmaengine: xilinx: Simplify with scoped for each OF child loop
      commit: fe8a56f098fb87dd489666d6e9d6498be73a92e6

Best regards,
-- 
~Vinod



