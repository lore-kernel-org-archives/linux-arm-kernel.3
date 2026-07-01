Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F6A9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 06:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d3/fteDdeaDUb7HQHKSHZdGzJyvgRky/lNVy7Qw3Av0=; b=N2dSwliwDkL+LGO09Bh1GUmTOM
	Z03kzyv5o7N6791Z3yK6k2j4z3fdyG0oIfoOwvcoHVanO5Zr8crnr84FtOwUFqe9h+E5+ZvMORh3X
	OnDnlzVgBdkgg7Z13QMg70XQJbLp19k6f2K0kbEJFwItf3oWNkFAH58hwUXPbmBnOrnb6oXhFg3Tz
	8fxNrn5bR4S+OR45q8QuqwH4wzety6TlKGs+zBL2/cAW0YHFIyNMtjlIeQwJRGzgKie1U+ICSmOTJ
	vwUb+xW3mLeP1cZYxPynyAbX4Tw/SpbGg2T4AxJxvTnrLzDHfBxwxe5bM5RawfFiMWFKiB8SLdKoz
	DIpyq91A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weoUI-00000000nxY-2UHC;
	Wed, 01 Jul 2026 06:31:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weoUH-00000000nxK-03Ne;
	Wed, 01 Jul 2026 06:31:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 496DF600AB;
	Wed,  1 Jul 2026 06:31:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A99791F000E9;
	Wed,  1 Jul 2026 06:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782887516;
	bh=d3/fteDdeaDUb7HQHKSHZdGzJyvgRky/lNVy7Qw3Av0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n4goOVL30pVwfTB+AWexMrJnCGhUNnc5KRtLRnmVDICyJwmPlpIHlcQUFH6RFYeCU
	 YuFXnd0CV25QivbFTHhG7sjMrhOrrG5YaeknU3tty6U8UGAdODODaoMvzNcSaJrtau
	 c7V1Elg/qE76Hw6OSqhag+/DBxjFsyLywPZznuVKd3V7UM4FbpwJk2p4DnLyKq8Z+e
	 oMZH0r4YPLFPZAzNH+i9DjEXO0QHb76VdoYxkZujq9sgO6FIkBfVhMjSFg7Q6NdbDk
	 ZY1i+FaFVk/48vAgEdIVfEGCmeAcwVE6Y4oUJ53F4qlAN9l6C/JjOWOJ2FeKMtmve0
	 kXpjPHzauO8jQ==
Date: Wed, 1 Jul 2026 08:31:47 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: gowtham <gowtham@ferryfair.com>
Cc: yue.wang@amlogic.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	robh@kernel.org, bhelgaas@google.com, neil.armstrong@linaro.org, 
	khilman@baylibre.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, 
	linux-pci@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PULL] PCI: meson: Fix PERST# timing by asserting reset before
 LTSSM enable
Message-ID: <5rf4ijh4kagydji7n4nuieunqzbwgk3cg5i5n2srjf4npzrjth@dcqeafnmrs4q>
References: <20260614095626.7afb7c04@slick.ferryfair.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260614095626.7afb7c04@slick.ferryfair.com>
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

On Sun, Jun 14, 2026 at 09:56:26AM +0530, gowtham wrote:
> The following changes since commit
> bb532bfaf7919c7c98caab81864e9ce2646e11e3:
> 
>   Linux 7.0.11 (2026-06-01 17:54:55 +0200)
> 
> are available in the Git repository at:
> 
>   https://github.com/GowthamKudupudi/linux.git
>   tags/meson-pcie-warm-reset-linux-7.0.y
> 
> for you to fetch changes up to 852811b11795ee389ea6a953ed0db69b76722469:
> 
>   PCI: meson: Fix PERST# timing by asserting reset before LTSSM enable
>   (2026-06-14 09:41:01 +0530)
> 

Sorry, we don't pull patches from random trees. Please submit the patches to
linux-pci for review.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

