Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB2BC44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 05:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=usf/+HzMy5QNUILiRJd2VbwOtJqgY9KL8yy6nGvOQ84=; b=Wsup/a3ia7VGuoj5AbNjBSKj2n
	91weSiMJs/lzHGgMimXD++GKCG71/eZAqpIfmyXlRGzvhuevTxHgT9hAsmw1MKFZ6ktqGLrkLifnz
	TaF3syBNw7Ej1cwud9IK1Q4vysEEbjTCSJLfNVBTJlZWPVLKjsM6ihS3hogBWQ77Ug/9nSkRMrKB9
	orpGwp78wpfm46v5stTeHbMo6HsosUcrhVEjq6rC1eCJiBqbAMYL0smx3elWzDYrA4JxZ1BkDtgWf
	bPexLGE9G+bQIZNLH6IjwZOR1f4IXQ4WknrKXeHo+kNAfAOgLfvnZ2qK+ZzoPP0RUtGFY/Dm9OK5k
	a1lf48Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm33X-00000008RUH-0iMK;
	Tue, 21 Jul 2026 05:30:15 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm33T-00000008RQk-2tQb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 05:30:13 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1784611796; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JAZiciWAxdxaDBm2ejDbsi2u4MRQYwPOdjHpziQKaz+RowHBvMLWn+kLCDNKLLs8g4wtAVvM/FzolwdWcLSV4H47537+9qtUVThJ1nL3KTlhE2ERm2THFFbUnApys5fJymWy09ngFRAtityti0PZnb4XEAH7ahijy2VRGRabNj4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784611796; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=usf/+HzMy5QNUILiRJd2VbwOtJqgY9KL8yy6nGvOQ84=; 
	b=LPK/Wr8gDaTuY7nY2XrqDfoLOuo2JQbFFvRdeZW9M1jaMc1gMfXLA+tARUskHG8dY/xA+v3A2Ze7lt7GBqDY0xx361k/wP1bI5JLrcl8ihJ/sZQUfgS2Oj8A6iDkXYuQ6gxRNA8zt686L+qbYkFgTfISvym/y4LjE77KdUnlGEc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=yoavmoshe.com;
	spf=pass  smtp.mailfrom=linux@yoavmoshe.com;
	dmarc=pass header.from=<linux@yoavmoshe.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784611796;
	s=zoho; d=yoavmoshe.com; i=linux@yoavmoshe.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=usf/+HzMy5QNUILiRJd2VbwOtJqgY9KL8yy6nGvOQ84=;
	b=d3O4CyJ53P11soT2mNxOURxEvpxU4BlR180UjT86gX0AMs7wGKVUpN96CyeKLIEF
	SwFCQUWLCU926lM7CMz9Ue62NHNtklAmQCyE/p2Sw/wSXqfu05tu3d9+C4Pm7RPYGVV
	R467EkaGJjGtcUDv3/8FYFZkF8ni0gPvV12kYfPc=
Received: by mx.zohomail.com with SMTPS id 178461179350753.645045637920475;
	Mon, 20 Jul 2026 22:29:53 -0700 (PDT)
Message-ID: <3046e60d-509f-471f-bd15-3ce78c87500b@yoavmoshe.com>
Date: Tue, 21 Jul 2026 07:29:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ARM: imx: Fix suspend/resume crash with Clang CFI
To: Sami Tolvanen <samitolvanen@google.com>, Yo'av Moshe <linux@yoavmoshe.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 llvm@lists.linux.dev, stable@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260718111340.159896-1-linux@yoavmoshe.com>
 <CABCJKudqGL+BFFcz3qsuoJB6S_OAt-vs2yqePC_=oy+JzmPpVw@mail.gmail.com>
Content-Language: en-GB, sv-SE
From: Yo'av Moshe <linux@yoavmoshe.com>
In-Reply-To: <CABCJKudqGL+BFFcz3qsuoJB6S_OAt-vs2yqePC_=oy+JzmPpVw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_223011_796293_66ED4184 
X-CRM114-Status: GOOD (  10.92  )
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

On 2026-07-20 9:29 PM, Sami Tolvanen wrote:
> Would it be possible to just copy the 4-byte CFI hash prefix to OCRAM
> when relocating the function? If not, the __nocfi approach seems
> reasonable to me.
> 
> Sami

I gave this a try - I tried copying 4 bytes from before imx6_suspend
into OCRAM, but when I tested it on physical hardware (Kobo Clara HD),
it still crashed on suspend.

I suspect it's because imx6_suspend is written in assembly
(suspend-imx6.S) rather than C, so Clang doesn't emit a CFI hash prefix
before it in the first place.

Best regards,
Yo'av

