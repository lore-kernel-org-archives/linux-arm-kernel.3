Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63066C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 09:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZtkuubS5pI3CbYDGv6UEmPir7ur7so+Ig6XN12YRWsA=; b=eqMfs4Qgu10CKVd2raXH/5odHB
	fvdc8ksmNPjocc2iIvJ4tUags7dli1+zITAoBSDpB+5xq9h/szNDzIH+wD0Q7DGj8AIJk/hyMJKz5
	fWrKKPlvus/yNrJCac4ljRKODF9NKN3uzZRGWeMqQOvE74MDsrEqAkjKaFt/ZM8y+pnVhEXvVxo6k
	J6l7S250aKHB60j1p4IU8IXFImPxW+4BAD2cXjE/Z7KHdzHpgC5D2pKrChMf61Yu84tuNCGAZ/Kd+
	JUOqWbmO9kSO8zB1MNkuM9Qd9e5+PQlnsPyYVLdbjL384gDqYi0Io200+aIZMCqrnmy1PujGU3NfG
	zsRYIihw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thmdV-00000003BWO-0QQN;
	Tue, 11 Feb 2025 09:32:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thmZr-00000003AW9-0l5T;
	Tue, 11 Feb 2025 09:29:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZtkuubS5pI3CbYDGv6UEmPir7ur7so+Ig6XN12YRWsA=; b=BbgfNz5nAsr8HLUX/C6nVo7bHF
	iJJIQR7bPXzV4qA2JBACUFsZPPvuAPT2WJicUnfDyjc7o8l6Fivk+gWHpdLlSZYLDG8fY6lMAVx2k
	/vHmcBieV5J/N8ijzfAlnvcRyffwg/EfMP2eZPrM3o5S/jE0x2GWpYgWaTy0Y20mZFH0ppWlTpC4u
	lDmUuLEdfykV88XDWdqZTOIrrL/wl66VC8YkL6S2P2KH1+kJTBxUz/5crQcV8GqsMBpSQkBzM9haO
	Nmc99rK6jE16bQFTg2E8VZW82S3ryfdDHZVpJYRS1gFQTMVzASpZkv8tgVMw6w9sylIZWQFEXxyYP
	CGKrWXkg==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thmZo-00000000Xoc-07Zp;
	Tue, 11 Feb 2025 09:29:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZtkuubS5pI3CbYDGv6UEmPir7ur7so+Ig6XN12YRWsA=; b=HnhRfVxXnjp2QFI1MYkeV/fyHc
	B1F/Qoqz7PVTS2QqcNwXyxosWsVXIDKYy49CS83+n1tSHEnPjNPLkmWY7f2xoVf9fuhefk4HxwmqZ
	2WjubP3u8B6d7SRj4FTAy2GdMOcYB+YnOi7vzavLwZFchxL+6iacqWdABGZvyeSIQ7fFh/Z9D53AH
	a8kGhS5eSy0X4P41wD++80E+weCMAUNM9jcyxLljg8j+Z8sQfBFl/rRLW/LcfIzZOvfiu7SJvUTFb
	f8hEh5de3MUfASW2YgzBtmQhRWE/hDaA6cnBtD00tjehVStrC3Wi0fq6tX75EKstBwRMsQJ0pbjI/
	igbp6o/A==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thmZj-0005mx-U8; Tue, 11 Feb 2025 10:29:03 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Jagan Teki <jagan@edgeble.ai>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH V2] arm64: dts: rockchip: Enable HDMI1 out for Edgeble-6TOPS Modules
Date: Tue, 11 Feb 2025 10:28:52 +0100
Message-ID: <173926612576.1219038.12843944709919002623.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20241227132936.168100-1-jagan@edgeble.ai>
References: <20241227132936.168100-1-jagan@edgeble.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_092908_350857_E23C0494 
X-CRM114-Status: UNSURE (   8.78  )
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


On Fri, 27 Dec 2024 18:59:36 +0530, Jagan Teki wrote:
> Edgeble-6TOPS modules configure HDMI1 for HDMI Out from RK3588.
> 
> Enable it on Edgeble-6TOPS IO Board dtsi.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable HDMI1 out for Edgeble-6TOPS Modules
      commit: 4a2fdf91e1239d9659d0317f3e8e37681ac555a4

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

