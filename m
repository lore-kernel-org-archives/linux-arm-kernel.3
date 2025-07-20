Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E23C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 23:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jQBOro9F+MQuOHq8M96Qw8N61+pxhdSOIRbBbM/x8dU=; b=K/RtnTtGVU+LFzFJRE/unTFTYd
	4xozdBrsVl4L3rOdbgp0qDBnCoUXv73kkFjqBxBVRRhEmJbMsRvdl9+uV2wN62r0ghuRgXwdnrqUL
	ZzzGWJnXbUJQAQXog/FDnql+/henRqReD8p1RGKSzEXs29rqDTM6xw7dC1yhxZvgSd21RURkwbi0j
	3DW3ZtEjTCjvUhPvemKoP2OG0LWz4MsQL4fXeSLtR5Xu6VWYp5GJcoVMf5LXnmN+J0MLZppEhChXP
	6T17gGW3sHAU131JAz6yAHPtXh52s8xerfi7RrtpXTnrc9pDdizVR5GyKMir5DTwMSZbecN75IfRM
	I18APL8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uddsj-0000000Fqzf-3dyQ;
	Sun, 20 Jul 2025 23:55:49 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uddqJ-0000000Fquw-2qq1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Jul 2025 23:53:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1753055593;
	bh=jQBOro9F+MQuOHq8M96Qw8N61+pxhdSOIRbBbM/x8dU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MRsHJ5iZcwN7AfQyPyK0F2DbDWKlN516JqHY5HjuJpExPrJPh3NkdY4x3eYr5HuCK
	 rzQpZ0j/DSf7eVuKblwvW0hHcdcssQqUW0PcqYDKzVOr8u3pZKNFlWLVxvk2s4ZrDH
	 NHIUF7lhsQZG7pFRWF3oNMAB3WKLIwS1kqvrji/kMFBN3ljhEgbFfLvwQ3nHQFLRkW
	 2+HwQTjHSCDouHP9iHOdVJIkKB39WNjsMbmdrjeItdHUlCk7gTywAJbSGe/S85R+xr
	 /Y+FAx2SHbRABITnBYUxsgBU/iudzsMvVa17cPYcxS5t+Ci3UJT6JMHvwqxVUjkxDb
	 H2i3EFOYwGjxQ==
Received: from [127.0.1.1] (unknown [180.150.112.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9B2436443C;
	Mon, 21 Jul 2025 07:53:12 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Joel Stanley <joel@jms.id.au>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250703183508.2074735-1-robh@kernel.org>
References: <20250703183508.2074735-1-robh@kernel.org>
Subject: Re: [PATCH] soc: aspeed: Use of_reserved_mem_region_to_resource()
 for "memory-region"
Message-Id: <175305558159.1020373.9271236318462742119.b4-ty@codeconstruct.com.au>
Date: Mon, 21 Jul 2025 09:23:01 +0930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_165320_081734_BDB8499C 
X-CRM114-Status: UNSURE (   9.60  )
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

On Thu, 03 Jul 2025 13:35:07 -0500, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() function to
> handle "memory-region" properties.
> 
> The error handling is a bit different. "memory-region" is optional, so
> failed lookup is not an error. But then an error in
> of_address_to_resource() is treated as an error. However, that
> distinction is not really important. Either the region is available
> and usable or it is not. So now, it is just
> of_reserved_mem_region_to_resource() which is checked for an error.
> 
> [...]

Thanks, I've applied this to be picked up through the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


