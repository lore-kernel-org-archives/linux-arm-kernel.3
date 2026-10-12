Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C5B2CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 08:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZN2dzTiC+2BBssvLh2yHOghWh0HLc1sQSHswvJ543so=; b=zkKGpbx0gQtrvQw+Vmf1CRaOoG
	UGxbvgPbHZyyRb/QtlABmaGH572B0p+hkYq7m7b4vCDVcg6rGnCfdibW5AnRCTGKTHYxw6FnWHC28
	4L1j6eKz3EYsQPBGCZpt3mgO7ceHUJKzZse2gQX52XJOEgk9cncUn4jZBOxtnLPNwqvngtDyQyqs9
	vEzdyXwvQI0tVMJhZrRmEyowZavQolbA+/BjkugflHdttAjrUU/JEIiS2h3X2AZlGmzqjIpSTx8l4
	Ows+a0ufRwSgldypBbmQQFKMDhh6m69UE1Ay76DSEN62YeVMqAv+0Z3hi2ORF0CsKiOReI6KSw5WS
	AGxqFFEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGBlG-00000009zbZ-0tRJ;
	Mon, 12 Oct 2026 08:51:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGBlF-00000009zay-1W10;
	Mon, 12 Oct 2026 08:51:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 22E81423E1;
	Mon, 12 Oct 2026 08:51:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F6601F0089B;
	Mon, 12 Oct 2026 08:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791795117;
	bh=ZN2dzTiC+2BBssvLh2yHOghWh0HLc1sQSHswvJ543so=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ETjnOmAbywI1wneWq7BOKw4lGB2kkLvdv/6KXLwmxlZjfvqP9o+NJQThvZoFrUms8
	 f63ggiUz4KP0brhWLRhv2x7+QVl5scE6S1z6B+07a+Cuh/rNvtL/DeKO/WGwM4us/K
	 tzad4DgJ/0H9cQpP0TtZSFjlWnNwaJsYmadJzAaulUHh+ShNbrhNJoVt+vUN94QcSt
	 ng3p8Jq1R6MXudNMLjr7UaZ5uHJXlAaG8HbEf49lYr2yoteE2ERJwqTdDs5xLkna/n
	 FLLjyaG6T+H1iWUjfS83ZGnSXYRptXahGvCuS7jP4ZKr0Q4GOdID5kOVsuK4v0AQBt
	 yeoAk1qP58TIw==
Date: Mon, 12 Oct 2026 14:21:47 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-phy@lists.infradead.org, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"moderated list:ARM/Mediatek USB3 PHY DRIVER" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek USB3 PHY DRIVER" <linux-mediatek@lists.infradead.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be|_ptr)?b" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCHv2] phy: mediatek: tphy: simplify main allocation
Message-ID: <asyfMEwzhwJFOIZa@debian>
References: <20260812181857.64544-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260812181857.64544-1-rosenp@gmail.com>
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

On Wed, Aug 12, 2026 at 11:18:57AM -0700, Rosen Penev wrote:
> Use a flexible array member to replace kzalloc + kcalloc with a single
> kzalloc.
> 
> Shuffled some code around as __counted_by requires the counting variable
> to be assigned first.
> 
> Removed NULL check from of_get_match_data as it's never NULL per the
> device table.
> 

This statement is stale in v2 :(

- Mani

-- 
மணிவண்ணன் சதாசிவம்

