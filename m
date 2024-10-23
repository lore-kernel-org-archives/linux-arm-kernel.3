Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 146D9D0BB46
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 23:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BI6v3yvMOxexD3sSG5ohKly6PqVC6npk+POPlf5PUAE=; b=sIrTsg5EuuYOpj61P41qXPnX8V
	VBYbdOWuHBAKa1XO/N0FBgn3clc4Ljt9G6Y+1wLqJayUW9YLinFLk5vC0h0teLtU0C4Ql7pICqDbX
	+8/NjlXPPdc2LKN9VdL3Q35hWoOQ1569yXLAnk6hcaU50j06j/niRrd6NmP5RtSr8Zn65aYuxTEt2
	LU3Po07n0hSy3NTDgmDqYqJt0uGyV3R/jF4B0ko+NtIzrhRuiuXTVRI+kmOayBKWqKFI2otQBZNA5
	WhxtTU0C/pXD970TPkpVN3jtBRGx+TnRg+hI6R7/4wDQh4d8JHvkGNgQxBM/d4CIIaIegGJVEWh2a
	dxqMYQ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3l1x-0000000GFcv-0aIM;
	Wed, 23 Oct 2024 23:44:45 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3kzx-0000000GF8Q-3qw7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 23:42:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1729726953;
	bh=BI6v3yvMOxexD3sSG5ohKly6PqVC6npk+POPlf5PUAE=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=C6TuwGi+JuUDnThIMHcYfPM5VI3p40hN4IiRDyJfTzJUfUIeZt8tfLzWKK1QgMuD9
	 IdW88uxyoXan2U6yyhOcT+smXUXf7+v2s47kGuJ97r0Tn6zZFuLTGk7q5lqEZBaWdg
	 FGSUsg7UIHHz6cg4CvwE5q9KpIXPB8yKvzrSpf4XkNpSI1ToYFBQKyXF/f0Oss4rED
	 cxEO9uBgfoncQ9IRHEHCsoanag4T8x9/f9dovX7tcLULAphXD4Cp51ozAe59apxXPj
	 p5gHEc+LRApwAPvxJGx15Bl7kVrBAnErvsQh8q+VRMC0+iKP0olsOLHZY0xO8YrQOB
	 IGuOD3gCaJr3A==
Received: from [192.168.68.112] (ppp118-210-190-208.adl-adc-lon-bras34.tpg.internode.on.net [118.210.190.208])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 030B16494E;
	Thu, 24 Oct 2024 07:42:31 +0800 (AWST)
Message-ID: <f60e70982efbc3d1ea3379b0036b25c74f953411.camel@codeconstruct.com.au>
Subject: Re: [PATCH] pinctrl: aspeed-g6: Support drive-strength for GPIOF/G
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org, 
	joel@jms.id.au, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 24 Oct 2024 10:12:16 +1030
In-Reply-To: <20241023104406.4083460-1-billy_tsai@aspeedtech.com>
References: <20241023104406.4083460-1-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_164242_318265_8D2E4EB9 
X-CRM114-Status: UNSURE (   4.00  )
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

On Wed, 2024-10-23 at 18:44 +0800, Billy Tsai wrote:
> Add drive strength configuration support for GPIO F and G groups.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>


