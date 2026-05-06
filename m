Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B898CD343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 14:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yXHnTFm/jz6IOHwyiTUt/ifrClYh1+7TWnaI7EM86Wo=; b=YYywGowaOZBc6LZqQm39zkgFME
	S7Gv+ftVbaswq+sZPrnDXezq94TpVJXwvNoZVKiKCpk+6P1QolrTgh3uW+VrE7nBXM0vldq/mhOLg
	HNz4TC4hzfhFRi2ejQt0hs4pSaTDNQ0jCRMTCQ+MNT3N3pcTfhMkD4J2MUkjY3RJFv1vFHtpinTJS
	0vavRLZC8VkbxFWPt6NOLJgXoiC+0oZeztsMIZiFFdq+hDSzlqnWPXw2bUswUORSZTLdVuh+qMqZP
	LiQfh0z+goy45YQw9gjtjPihuCOA5D3Qtm/VUMPgYg7TkLXZKfAlCNh9Tk/64TD9/JEsWON9lFCOp
	bpnki/nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdRe-0000000180Q-35HZ;
	Wed, 06 May 2026 14:41:50 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdRc-000000017zL-22iQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 14:41:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yXHnTFm/jz6IOHwyiTUt/ifrClYh1+7TWnaI7EM86Wo=; b=AoMib4LR186B7JTqrzSkG8NmF+
	wZcE6eNSzrAKIMfytyuJy9EcHrDK7oMnx3JWmj8KgUckTWPo5naYsc+nyyz1otVq5e78E5/Anm+FJ
	E3e1veare/NDykhAtq5qpOLog02PaWwz/vdwJ9N9X1SOkQ2irAzQbWKmXBM+6ETDOSNVxXZBh3DyK
	rcMggHor8T8qXgZqRr8ZVZuZADLyOtG3YwnUxEM2XurEzdkZHhZu1qAxrRTvgBjxbZXUozhgOHYXo
	26cAB+9/cb2Y4P4XCdxyF0zCcv9nRiydCyPlSwa9p+8u5DVAoB2RY/zp04ad2NXFnJi0M18R+7moh
	HtRyDy9A==;
Received: from user-188-33-36-99.play-internet.pl ([188.33.36.99] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wKdRX-00000002h7y-1JVL;
	Wed, 06 May 2026 16:41:43 +0200
Date: Wed, 6 May 2026 16:41:25 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 0/4] Add hstimer support for H616 and T113-S3
Message-ID: <z4qz6flhdnwdpmpcr4ufpcbjpor3x5pc6xw3vdjl5efqssayn3@jzz6vt5ux7te>
References: <20260428-h616-t113s-hstimer-v3-0-7e02178a93ee@mmpsystems.pl>
 <9ca77795-ebd2-4157-9e74-1fa1001e750b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ca77795-ebd2-4157-9e74-1fa1001e750b@oss.qualcomm.com>
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_074148_994537_123B1557 
X-CRM114-Status: GOOD (  14.50  )
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

On Wed, May 06, 2026 at 01:28:22PM +0200, Daniel Lezcano wrote:
> On 4/28/26 18:26, Michal Piekos wrote:
> > Add support for Allwinner D1 high speed timer in sun5i hstimer driver
> > and describe corresponding nodes in dts for H616 and T113-S3 SoC's.
> > 
> > D1 and H616 uses same model as existing driver except register shift
> > compared to older variants.
> > 
> > Added register layout abstraction in the driver, extended the binding
> > with new compatibles and wired up dts nodes for T113-S3 and H616 which
> > uses D1 as fallback compatible.
> > 
> > Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> > ---
> 
> Applied patches 1 and 2
> 
> Thanks

Thank you.
I will spin shortly next version with suggested correction for patch 3.

