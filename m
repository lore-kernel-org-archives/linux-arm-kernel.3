Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2950C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 07:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kX4jVjMeEtvNf+e/+zPa2nRUpF6fl0hMQ8tg2YCObjU=; b=OQmf5/6w4pOrQ9ygP+jFjbG/Xa
	F0REiOSHj7XPUKgyH5XKOzueSUittQ/0+cRT65Xd5B6OxhKIIcYxO50wYGzCP6HUyDITKkHRCN+WT
	gHq0iFcs5urDmloGv5AJS9GMurAUwTQ7ytRcgL0MdNUwMXI6WeNXCy0E1bQK2gaTfpdHgfx6qmGzj
	V3LTdHXLOqoIz2Qjuj7a7IvEn0vNAuzwWGmxf/S1EnG6shqaoMuf9mq3mN72/ovm3rd+EefQmUF74
	H4dTNV+Pg7MKAip64/ycs+AAmoGWXjVHW4BVVySt9BL3NipMwxYdNRXwfTa4+Up4pwy6KW4/r7Jma
	BvoJV3bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7TJ-00000001f2U-2mOG;
	Tue, 22 Jul 2025 07:31:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7Ov-00000001dsq-3r6M;
	Tue, 22 Jul 2025 07:27:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 50AA2437FC;
	Tue, 22 Jul 2025 07:27:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94E14C4CEEB;
	Tue, 22 Jul 2025 07:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753169221;
	bh=kX4jVjMeEtvNf+e/+zPa2nRUpF6fl0hMQ8tg2YCObjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QI/8PSMm+0FvCxJWAU94AXrriQPRXIONz78aRf9CawzIcjgyiKOJBxX2lJwJaPSib
	 CuiLLiGT0RWY2Eh+JWwMGNKs0pIIKvyYHdWTZIv/AvQg5WegOuCxGxICOgGB0oxv7a
	 n63l3abcJAS73Fg0dEhAQ1MLU2KIIxscUs/7d6xutUQ8OmxUpUrTzkiSsNQvBuSDSp
	 K1WBLbIau9/kx39CbzVIXSC40CvSJrJmYcvRVOyqZ0akXezBYPlscWZCZM92DZda5W
	 AVphlhK2eu4lr7c/7AYVTaxmSKbLFAMYO3Oja3ZA792tNdaz2iXO7yWQ8+Qw5ALERu
	 I0XUqVBaULGtw==
Date: Tue, 22 Jul 2025 09:26:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Nathan Hebert <nhebert@chromium.org>, 
	Arnd Bergmann <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, 
	George Sun <george.sun@mediatek.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Subject: Re: [PATCH v1 7/8] dt-bindings: media: Add MT8189
 mediatek,vcodec-encoder
Message-ID: <20250722-lovely-mustard-scorpion-e07e92@kuoka>
References: <20250721105520.5625-1-kyrie.wu@mediatek.com>
 <20250721105520.5625-8-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250721105520.5625-8-kyrie.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_002701_976728_441F5B3B 
X-CRM114-Status: UNSURE (   7.40  )
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

On Mon, Jul 21, 2025 at 06:55:19PM +0800, Kyrie Wu wrote:
> Add MT8189 encoder compatible string, which will reference SCP device.

And the device is not compatible or is different because of what?

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


