Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 777C4C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 15:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+lhjfPz71eCEuGxN89X4itySV64JY5cuombe2gZzeM=; b=AYiOOnHp+17P04gVQk6sqorzH+
	XkRCllxdIr67432mq43rdbYfiOPublbRyifBcyOEehZFSQyArggf35CWWnO74HJU4vEDxQf3OjJLM
	3LIdRwr9HYL/OrWupLpmKcjo3ZlAQU7Hi9MSMyLE8SnDBlLTZPyp3tE+5BlTkNS6tqIcCSZmwrbIr
	30Zx246YrH4Ik2PEKLdTB9DuvjGKAj0ODxiwLGM2YRI3hvnFA4F9xwJ2IhCPwyU3+pTvrRZ7zXEK0
	M2o0YY1DtSzehU6vramWcVvopWZJVQiOeGw6H4GgGPMuFsb8RS2nD/DnHTaMsiUhW4069wVjD/Rfj
	sZm0jGzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3G48-0000000ED32-1sev;
	Fri, 11 Apr 2025 15:13:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3G1B-0000000ECXH-3EZ8;
	Fri, 11 Apr 2025 15:10:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 072F25C631D;
	Fri, 11 Apr 2025 15:07:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66AB4C4CEE2;
	Fri, 11 Apr 2025 15:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744384208;
	bh=nV7QUsY7pocrTLl7+krZ9Vjz4uByyHrtuPWZ3jHggtc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k8+ON3jDxuMhAktXI7jzW1oXlfLzIB/wn/r3nc+Dk4EvAvRM4zw0hS5E8lQgzb5sO
	 dhhX27snOzoNVidZH4vEhTERLUI8mcDyGIswXt3IY5A4Zw1paxXHqD4ZKwwSnTM9c4
	 pnn/+PZ74C+6gb9TOSa17oOdk+fH6s7xH11L1YSKqr5rdjIF0yLwVEFc62ezEK0Aaz
	 Gi1cff+pQIe0pNxrSCsMlycjFDmTkxKYfIMd2VQH5BJcNZH4AnnHsPKG07vnGDRRgg
	 KMlyNp9vrDGh9IKpm+XYkSpLQu2lTXW6xEBwT809wncke0+Mm10Xwut9NJbuDlVCGj
	 cljYUFggYDwSA==
Date: Fri, 11 Apr 2025 10:10:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Simon Horman <horms@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>, upstream@airoha.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Jakub Kicinski <kuba@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>
Subject: Re: [net-next PATCH v14 05/16] dt-bindings: mfd: Document support
 for Airoha AN8855 Switch SoC
Message-ID: <174438420580.3258271.14505351039830543579.robh@kernel.org>
References: <20250408095139.51659-1-ansuelsmth@gmail.com>
 <20250408095139.51659-6-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408095139.51659-6-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_081009_865851_3639C411 
X-CRM114-Status: GOOD (  11.07  )
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


On Tue, 08 Apr 2025 11:51:12 +0200, Christian Marangi wrote:
> Document support for Airoha AN8855 Switch SoC. This SoC expose various
> peripherals like an Ethernet Switch, a NVMEM provider and Ethernet PHYs.
> 
> It does also support i2c and timers but those are not currently
> supported/used.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/mfd/airoha,an8855.yaml           | 175 ++++++++++++++++++
>  1 file changed, 175 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


