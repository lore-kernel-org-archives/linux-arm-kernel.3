Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F81ECA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 08:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hqr2PkWeqj78bgEo/ix/HnyM3/D2QqFTKb1SDJ42Iko=; b=mLToLw0Qfn/8ZvQN/Ktof6irZ3
	mk45QDo3MxhiUc5A7i52FuP3ybFWMgS1MM7h9LXII5dc3lwVzDBQneODkcBABn5ptF+ONYpiXvCqk
	Rws1QNFKBc5u43vPJD+QpP136wYAIRq5OJra0PSFptaKgEn0pM2wdiJ26m/h2wKhAwNGw4hfJ7Dzx
	9OKJlQ+1fIvaP7CqRhK87h7E4OqRgIG6B7j+TPO7KKogP4JXIINnubjH3yd7/MUn747hdM+mJlhKe
	eLQ+UsPaN6dERfWUJR/1P+ZGQRxTJO9XhY9TSSUkGYL04zzI7sTtNJJm6Pxp7jz3e3tU032QdTKLk
	0skE4n8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMkT-0000000GBlE-0Dhh;
	Tue, 02 Sep 2025 08:52:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMSB-0000000G4Qu-2dDX;
	Tue, 02 Sep 2025 08:33:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 00DD460210;
	Tue,  2 Sep 2025 08:33:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC295C4CEF7;
	Tue,  2 Sep 2025 08:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756802002;
	bh=Hqr2PkWeqj78bgEo/ix/HnyM3/D2QqFTKb1SDJ42Iko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eexVNZZOyCZ752U7B0Hxcl7iDb0v3eqNyGVNEJNzf0PCN5A3mrQ0AScJt5LA06Hf8
	 a5sf4rqTHCA59xQlkbFYGFgseE5b3iaP3LEVm/20ZJspA8j5cy22VIF+SVI9igcSgz
	 0UlRax8yYiV6MUzZXJbGEAZWizY2Zbj39kpJnvfo8/I0NyNYCiVGbUpt2+IQaDmq0L
	 vc9Y3Prxj+tY0TBlksdY/5gts7JPJHy/mZCpxdYkUbWOgVxD7JuiK6wKZJbtvOYKwk
	 qPcfUTqYDxqxCBibyub+dc0VK8JsdVpshCG+MpMFB7DMdDvni4nEY0L6G7UG+G/O6F
	 AgY1n5wtbq6Aw==
Date: Tue, 2 Sep 2025 10:33:16 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com,
	heiko@sntech.de, mani@kernel.org, yue.wang@amlogic.com,
	pali@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
	jingoohan1@gmail.com, khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 0/2] Configure root port MPS during host probing
Message-ID: <aLarzJZI3E_sb7_Y@flawful.org>
References: <20250620155507.1022099-1-18255117159@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620155507.1022099-1-18255117159@163.com>
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

On Fri, Jun 20, 2025 at 11:55:05PM +0800, Hans Zhang wrote:
> Current PCIe initialization exhibits a key optimization gap: Root Ports
> may operate with non-optimal Maximum Payload Size (MPS) settings. While
> downstream device configuration is handled during bus enumeration, Root
> Port MPS values inherited from firmware or hardware defaults often fail
> to utilize the full capabilities supported by controller hardware. This
> results in suboptimal data transfer efficiency throughout the PCIe
> hierarchy.

(snip)

Gentle ping.


