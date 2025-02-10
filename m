Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E298FC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 17:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dygthGKy02rDYrlNchis2XKqi2Fb8mbxUpVnQEfx7Cs=; b=t/eq397OPkhcFgF8AGhTzDKahg
	XZZnI59VGWzOXGhjZ0K6AZLcZcDnjAiNMSql6VUbuk8UfH4dRrD73fhydiRedjkPm28Gbs9wA4A5C
	qrVAqerrloE+QknG3oZG60Ki6rFNwssiNRAzDwHRocatUFQbJx46KTWY2pahj6b9rsZyPyaxgB0Eu
	xnSF/uZO5kT6glZbkx+pEnT1F4q6vFYXcfRWBY47gzCupEpB1DsFl5znSSygJLGBclyXv9wuiDYnO
	DQNqRtsfgX5pzkrshWU1iFcnH31rePb9pqQxW2ojmoxH88rGevhE5sEJ1VMWuiWqgB8GUWb8lo86P
	ouSLqX9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thXmf-00000000lUL-0Ux5;
	Mon, 10 Feb 2025 17:41:25 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thXTH-00000000hUK-0bsL;
	Mon, 10 Feb 2025 17:21:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DC72FA41C4D;
	Mon, 10 Feb 2025 17:19:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E094FC4CEE7;
	Mon, 10 Feb 2025 17:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739208082;
	bh=IKvRI5uf+aD+nZqPr2KfiHGfOxumlIrmYZ9wIyQhmLM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VxI04hkZoo5zoOfSQd+FXAaLIoEznbe3LKQjRcsfKe4KCOzoYJEf3lUrtp97K/XZN
	 4ZGraAAU+k7IXpFTBG0JO4TZVbj5vqoiIor/GUoUVyLQKt22hp3B3r7OS4gYDkESXf
	 YT1hYfCDqR1thN4NzfjaQu+ZtaEH1jmgfcwtIbOe9tGIfVTlZvRVrdXHtTtoTt86Pq
	 LOaauNhaoRLbHmUk/TBDzoz98Uo5LigAllJJrZfJRksLkXjfKD3lPIAQZDJWQqMwmS
	 XbUv+SVnJYcVtL/zUXVFtjsM8en4iPWKuMmRF57Os0wA+JtD4FKqu7vUffvBztJOU2
	 +xrQh43GHdVWA==
From: Vinod Koul <vkoul@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
In-Reply-To: <20241231163121.241543-1-robh@kernel.org>
References: <20241231163121.241543-1-robh@kernel.org>
Subject: Re: [PATCH] phy: Use (of|device)_property_present() for
 non-boolean properties
Message-Id: <173920807849.103786.14338216546875530681.b4-ty@kernel.org>
Date: Mon, 10 Feb 2025 22:51:18 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_092123_249002_41435BD4 
X-CRM114-Status: UNSURE (   5.72  )
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


On Tue, 31 Dec 2024 10:31:20 -0600, Rob Herring (Arm) wrote:
> The use of (of|device)_property_read_bool() for non-boolean properties
> is deprecated in favor of (of|device)_property_present() when testing
> for property presence.
> 
> 

Applied, thanks!

[1/1] phy: Use (of|device)_property_present() for non-boolean properties
      commit: 88c0053baed659acd85b87dd52cbd75f3d8806be

Best regards,
-- 
~Vinod



