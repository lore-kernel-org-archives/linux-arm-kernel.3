Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2451C369D7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 14:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y2eiSgJcIx957SG3BBo/znSw527SsOFhObhwd5gqvAo=; b=3ulq9KSuYV2LnJQH2CxzJ8XMhM
	x8XApjYoMnvpYYuod7PmEaImNYje7RBcmXG2PBQV8FpC0F8imWhTtspiFuMw6VuTOIMv1ioY1taqm
	3ms1jYXNO7cg2L4VuiytN0btpQ23JxtnUXSM14MW4++E7Mb5ktrGv78sUTmlIb57wllA0A2cuTVH4
	5YEN67XsokiBTjGxDlkz/69rcbP40ozfG9UeHiE2K+9VtVY+bakJ80i5s8SaM6QbBYR0QQupdvnaw
	whrKOu5rKowDNyzd0blhI7mxwoCrg9FXz5JMPJpfBAhEPwr9Lm/9u0hxGJVhDog7hPdNgwwMV38hM
	GyHUlAWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7b9O-0000000Aq3v-1NxS;
	Wed, 23 Apr 2025 14:32:34 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7aSx-0000000AfHV-1mvg;
	Wed, 23 Apr 2025 13:48:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 70424A4CF40;
	Wed, 23 Apr 2025 13:43:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7871BC4CEE3;
	Wed, 23 Apr 2025 13:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745416122;
	bh=FhtTxTGZzdDSVEvNHPZnCN6HydplmlNu6hhbDRLgF94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m2QLIIhA465PQj3ci+RSQMjXCQKXLCmaooB8zhyNTlZwDv1HvbML0F0jD/zMhqJwO
	 zAx7rxRtj+Fv+PT1qZil4gzcailjW3VWP+fA1kpuKWPnhETA/JV4R7E0IuvbSl5BGr
	 4pR2joftw5BbWpUsNlKl7X5Kl9XOgh2Gx0ZBUS3R51J7vqZm86R0j7rBaePvNxUK8V
	 4XpGkBJOsJyGFDcpuFR6GbEz/0W8/8+mVPIAoBdmXjaOsgXagJG0WUOHZRq13b/L/1
	 fTnJc4twdTw6ZleAr9BQmVCrRvheN5RFIpFTstFqRNW2Aew4isAPrMRvVk8Xb+SJYQ
	 r6d7GzsfIhZ+w==
Date: Wed, 23 Apr 2025 15:48:36 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com,
	heiko@sntech.de, manivannan.sadhasivam@linaro.org, robh@kernel.org,
	jingoohan1@gmail.com, shawn.lin@rock-chips.com,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 3/3] PCI: dw-rockchip: Unify link status checks with
 FIELD_GET
Message-ID: <aAjvtH-Y81Rsy8zK@ryzen>
References: <20250423105415.305556-1-18255117159@163.com>
 <20250423105415.305556-4-18255117159@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423105415.305556-4-18255117159@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_064843_527071_C66D7760 
X-CRM114-Status: UNSURE (   7.12  )
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

On Wed, Apr 23, 2025 at 06:54:15PM +0800, Hans Zhang wrote:
> Link-up detection manually checked PCIE_LINKUP bits across RC/EP modes,
> leading to code duplication. Centralize the logic using FIELD_GET. This
> removes redundancy and abstracts hardware-specific bit masking, ensuring
> consistent link state handling.
> 
> Signed-off-by: Hans Zhang <18255117159@163.com>
> ---

Reviewed-by: Niklas Cassel <cassel@kernel.org>

