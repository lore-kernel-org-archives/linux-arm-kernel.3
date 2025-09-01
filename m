Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED384CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 19:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mAfKoAk3BjXDpYNpIdhbv1IZbJ+eBwXiufEhnDK/Dq4=; b=kRs7S8umCFYCcz0/CynhAuV59c
	GwtXXbHPC+6BxphoTJRYboJ6BMH61fMv6fkm+6leDS53yRfMy0aUVS4U+gxZGVW8PwIAmazkfguIp
	n0ae9K4eSX1Zimz/y9mTesRaV+sZBnm7+1u9vFRZ0Sm+CNRPOWO+FU0gcugUhgEvwLTdHr1GJXQ4b
	XLOD9d2OngrBGfk6BRihfc6svC40tbiQakWPgfRQKKrIszIxWLd8ch3Cix9ZOOFm/CnYSfAQpeiGA
	Ybxrh7p88KSiFilurOS/oQeEfHTTb48jnR7SuffyQYx5nLAdv/jNTBTloD8psoDgzlvce33YUbya/
	NL45xqMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utAXp-0000000Dh4A-3u6F;
	Mon, 01 Sep 2025 19:50:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut6eZ-0000000D9Jy-146g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 15:41:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ED0334419A;
	Mon,  1 Sep 2025 15:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37ADEC4CEF0;
	Mon,  1 Sep 2025 15:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756741266;
	bh=kd7FhV0h7tbWfakzhbMWN+hW8grh3fetFbtxrJY2Ng8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=B5wAI5/ZAs5y7f0CUJsq/+TTkHDzEYaDJlVtcOCZqjWnBx9JiyaMd32/MHUq4efU2
	 g7+/46Ssz+Z2W7EV9J1XQA8EWD6Ie6oAhT7q1YwdGXgXShtEoiCoxRwL4xOTEJb/zZ
	 4NC3NNX+jAaM8UBkd+FZZDo2hPrtaLxQ+xTSkoxhyzIDL6l/vfHKyyuDdo8fp1uji0
	 CreGVckPlu9eu5wktEiLpRzKr1XbHRtwrlbpIOLfZ5mpkZJEk5bueHPYw17kXCbF4I
	 kvkYmyLvJfbFXnif65s7B5nRXAqDEnXBI5Mv4rCEtoSsGAIyg1NxMnpojyUiMG0Q1I
	 MOjVAa8/+/dgQ==
From: Manivannan Sadhasivam <mani@kernel.org>
To: lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
 bhelgaas@google.com, vigneshr@ti.com, 
 Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: stable@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, srk@ti.com
In-Reply-To: <20250901120359.3410774-1-s-vadapalli@ti.com>
References: <20250901120359.3410774-1-s-vadapalli@ti.com>
Subject: Re: [PATCH] PCI: j721e: Fix module autoloading
Message-Id: <175674126281.14910.10970925698535914087.b4-ty@kernel.org>
Date: Mon, 01 Sep 2025 21:11:02 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_084107_316945_8265FF8B 
X-CRM114-Status: UNSURE (   8.68  )
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


On Mon, 01 Sep 2025 17:33:55 +0530, Siddharth Vadapalli wrote:
> Commit under Fixes added support to build the driver as a loadable
> module. However, it did not add MODULE_DEVICE_TABLE() which is required
> for autoloading the driver when it is built as a loadable module.
> 
> Fix it.
> 
> 
> [...]

Applied, thanks!

[1/1] PCI: j721e: Fix module autoloading
      commit: 9a7f144e18dc5f037d85a0f0d99524a574331098

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


