Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DEE6C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 20:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FMzy7b0alE4iRCg/qLoVlr6ju1X2L/PcihNWB+BvmOw=; b=ok8AVsOJ/LuaYZyFSkWn9lJOa9
	VHRyKOIVhTVIY1yjIvzX7csVyak4MqSZbAciqruEmM+22WCskTRCsMxOAZF9zYBj5ypIOHSZhSH9S
	s9fLwEgw3ew0xAwCoUcVmfbwCpHKv1tUzZ0wPsn6tGYdEm/noN8rB4LLFel+qHgw3APxcjfIDdlZy
	UDo9AZsvtGLyRuIpZPFbIcLo/nrB36uwCsflb60lQd6E7OethkORPK4dv9PxQdexUKeefVP2DYR5U
	pgxcL2J75/S9FeTElwNhO46EsU1wHMNKw0/tG55cmseRYygm/tjbG4V69ySPoSOEL9u++aAbEeoP1
	bMoenbeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9rGs-0000000AiIP-29Co;
	Tue, 29 Apr 2025 20:09:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9rEx-0000000AiBa-1fEl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 20:07:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B5F7D49B4A;
	Tue, 29 Apr 2025 20:07:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3C70C4CEE9;
	Tue, 29 Apr 2025 20:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745957256;
	bh=HxUcW+K0ownBOPm+klHuYmAbEOpz4/+IawPZ+9mnLZo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OGo59lmS/VpGDV10MIvU8dVCgxetaeWKSLqkFS6tcac988lbdqZzIwPnctNV0TdXC
	 rIZHXHmPVjbSDMhgaqQm+86rdQ7PNyuJIBqf0VrCWzBED04yVQyuKOJjUvp+bIg6hl
	 lNgfQQWqFW3J6p9sZiawKs31VYfDs4wcldImJ1oQjjcn0P/0ENhpeIQfWCJeQycl2q
	 Db76fummc3mfdmnOxWVE7B+PKhYbEr1Y3fiPh6WJrxcWlNP60hXoJbQbduAwxobTfa
	 /dFkON3IuixkbrpdrNsrrpT54wHOA4kncp7PPZuAMDLu1dAKPXAHef5coThmp27DDX
	 jL/tADZAzZB8g==
From: Srinivas Kandagatla <srini@kernel.org>
To: Praveen Teja Kundanala <praveen.teja.kundanala@amd.com>, 
 Kalyani Akula <kalyani.akula@amd.com>, Michal Simek <michal.simek@amd.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Peter Korsgaard <peter@korsgaard.com>
Cc: stable@vger.kernel.org, Kalyani Akula <Kalyani.akula@amd.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250422142112.2364822-1-peter@korsgaard.com>
References: <20250422142112.2364822-1-peter@korsgaard.com>
Subject: Re: [PATCH v2] nvmem: zynqmp_nvmem: unbreak driver after cleanup
Message-Id: <174595725468.31828.5794331995738765114.b4-ty@kernel.org>
Date: Tue, 29 Apr 2025 21:07:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_130739_460592_CB1EA775 
X-CRM114-Status: UNSURE (   8.86  )
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


On Tue, 22 Apr 2025 16:21:12 +0200, Peter Korsgaard wrote:
> Commit 29be47fcd6a0 ("nvmem: zynqmp_nvmem: zynqmp_nvmem_probe cleanup")
> changed the driver to expect the device pointer to be passed as the
> "context", but in nvmem the context parameter comes from nvmem_config.priv
> which is never set - Leading to null pointer exceptions when the device is
> accessed.
> 
> 
> [...]

Applied, thanks!

[1/1] nvmem: zynqmp_nvmem: unbreak driver after cleanup
      commit: c708bbd57d158d9f20c2fcea5bcb6e0afac77bef

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


