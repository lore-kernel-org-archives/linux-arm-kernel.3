Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6478E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 13:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=29v3SXT9Ffvys5mgEj1UJ5xZTZpwErFonfp1Kr6gROc=; b=sEkiTHmM4LGByosgd4ElpBRltG
	yMjkoew5s6x9x7Em4oDNgSDs+56y513YOoQxdPUIkTdLBBy0J4D6N0xry7eBgvMAN+1glgDK3xcLy
	8vz/doM88wCqBcMoNFAQOHQYb9+GLfzIXTC21exiGcKaLdnvxO5/yLnITuwC0ZBl4i70yPX0JOeTK
	dHpMRqSJdQ+tay2Q76E2tVZZN1Ho9SFeHQ08DdC8fkua2ysZfDlSCHEudoe3YJBp0RRyQ2eeTZXHs
	jFBjFhHzMPamo66kWGis6B6HkUXq4enBS3k0bWvNxILeLILafXhcgAvWg9OUdbmjrZOU7TTLRtoJO
	1xPkMDRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIpID-0000000CfHb-1N8p;
	Wed, 04 Dec 2024 13:19:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIpHC-0000000Cf7o-0dc1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 13:18:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BFA375C5DF6;
	Wed,  4 Dec 2024 13:18:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10ECAC4CED2;
	Wed,  4 Dec 2024 13:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733318325;
	bh=TAtHKYWCoR1GL0UUMdPzrLKHlmmmfkDHR9X3xB5fKEY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nvctxKCum2d6ej0vjNutgyLBtwWMCMMlMaz65XUAQFbiQERaOXEoG+UKzFMK1u5Co
	 1u6YvF1xpCJTtjaSwekhfkL42715ZuX14hzb5g3vEtxnveVP8yhOxE35rVry4mcCsZ
	 pUENYBBZkvHu64x7FDArYYXDvNbooO+gPFjMB6iRsD8jdxruw+2/CzoejqTj6WbaRE
	 y1e+Fl2/4WyDJHnsx9vbEafU29BgphKQ2GiG2V/SGZqyaxdpTIp9MlL5yR6HN1pOJl
	 auik38Q8PpFOfgXc2RaAQA2+q7wja+9nuqUsxJ59bVIQYwMXKjHF+2cW7J/cM8PdEz
	 BGemHxJ885PRQ==
From: Vinod Koul <vkoul@kernel.org>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241124-admac-power-v1-1-58f2165a4d55@gmail.com>
References: <20241124-admac-power-v1-1-58f2165a4d55@gmail.com>
Subject: Re: [PATCH] dmaengine: apple-admac: Avoid accessing registers in
 probe
Message-Id: <173331832270.673314.2577106831553574713.b4-ty@kernel.org>
Date: Wed, 04 Dec 2024 18:48:42 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_051846_235704_F2D3A7FE 
X-CRM114-Status: UNSURE (   6.65  )
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


On Sun, 24 Nov 2024 16:48:28 +0100, Sasha Finkelstein wrote:
> The ADMAC attached to the AOP has complex power sequencing, and is
> power gated when the probe callback runs. Move the register reads
> to other functions, where we can guarantee that the hardware is
> switched on.
> 
> 

Applied, thanks!

[1/1] dmaengine: apple-admac: Avoid accessing registers in probe
      commit: 8d55e8a16f019211163f1180fd9f9fbe05901900

Best regards,
-- 
~Vinod



