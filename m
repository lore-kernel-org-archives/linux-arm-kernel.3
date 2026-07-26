Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E33C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 15:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x7TPMOFy5N7Qt3AEzaq7fEAwVHo0rxFfUpnGX0hgRII=; b=ogFVRQkOVc9T6wlWyLn6Fs+rH1
	bCIWPHTab/0eKlHfD2iuFToPi9FVQCleX5nI71XN6pT0GZqxivti7jcWF9E7YM4Di2ermrayGikb7
	25PHIC6fTaVslWFlyQt3KbZPm3dGoLHpgSzSJ2Z0FV3sgt5ptHlSEQvg+tL7RFnysRPMLKy4iNufL
	55bx5biiZj67DdUq5JaROlhFC/gYhninx5fnrFoyMN+5mfBAwCBWJmzy/ZXWJs9Mb25HIfCifuZlG
	iOkSUBSTuQFWm0iikTpbvvUUhKi8UfdxUbZe2gDyDPxZx9Pz3jShOfIOAHhyWJk2U2LnpYVlnzKlj
	L25jjkVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo0ua-00000001IdC-1RYA;
	Sun, 26 Jul 2026 15:37:08 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo0uX-00000001Icg-2HU3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 15:37:06 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1785080208; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UQkiHcR47z+NddFmPqTtLtUT2swz187cbX/2AVnTJtSZ02EZbiqbDcl0Akb082IiNoeBN2qWsolXCQaRwK8q52PlKZrUgNiexAEc5z2kSoZyWk+VByKkCRA77ctXHxBvHozhGf71aa62EBqeKnC2aYROlbYUPJw6tahKbqGKqxc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785080208; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=x7TPMOFy5N7Qt3AEzaq7fEAwVHo0rxFfUpnGX0hgRII=; 
	b=eXcNIGq5cR0e8AUPw0rYOwRRu4okpnbbwiD1Bx+PtezpjmtWe/USiIeH3X215ERL2pG8/+/gbYqMT93W9oHGViOIdVqcvUZBUUQfUXxVyaoIqjllI7DPi6H5rRMHNmq+tFmnGgxQYl8yCnmNuFlCQGHoSae4uU6VbOwOI9G4NW4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=yoavmoshe.com;
	spf=pass  smtp.mailfrom=linux@yoavmoshe.com;
	dmarc=pass header.from=<linux@yoavmoshe.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785080208;
	s=zoho; d=yoavmoshe.com; i=linux@yoavmoshe.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=x7TPMOFy5N7Qt3AEzaq7fEAwVHo0rxFfUpnGX0hgRII=;
	b=YvcB1De+mncJrPRAlk5ny1KEork4Szs9K+6dGJZPUai2/MnH6M5GKuWbmoB24pX6
	vm+jYWQ/lKLP78ywllGhmMCZO0iLMA1WD1hePr+i7bBn4o7d7d4G3i+pRcDV3++iS+U
	ysxBxBXL7mpSq8uo0i9KlD2nKSW5ycZhLal9Xnyk=
Received: by mx.zohomail.com with SMTPS id 1785080203910869.7147545207597;
	Sun, 26 Jul 2026 08:36:43 -0700 (PDT)
Message-ID: <91cb0f21-e78a-4931-b123-937c6a01592c@yoavmoshe.com>
Date: Sun, 26 Jul 2026 17:36:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ARM: imx: Fix suspend/resume crash with Clang CFI
To: Nick Desaulniers <ndesaulniers@google.com>,
 Sami Tolvanen <samitolvanen@google.com>, Yo'av Moshe <linux@yoavmoshe.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Russell King <linux@armlinux.org.uk>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260718111340.159896-1-linux@yoavmoshe.com>
 <CABCJKudqGL+BFFcz3qsuoJB6S_OAt-vs2yqePC_=oy+JzmPpVw@mail.gmail.com>
 <3046e60d-509f-471f-bd15-3ce78c87500b@yoavmoshe.com>
 <20260721180950.GA3684684@ax162>
 <180001f5-bddd-4e58-8442-f7ef3c979500@yoavmoshe.com>
 <CABCJKufhvTxmVm8y7xr4RWWKsoZk0h8UGBnem+F5fknnimaqPA@mail.gmail.com>
 <7f273a08-b29c-4e15-b340-898b251efe57@yoavmoshe.com>
 <CABCJKud+GsBVv+XMTsi_4QAaTHo7jXD2Hyvi9wqKd7x3i2xyAg@mail.gmail.com>
 <415ffa24-a30b-43b2-aa6a-a1cde3bd4ef0@yoavmoshe.com>
 <CABCJKud9B8vB-J8f0HLHw6EgEKVWzy+Q1PrNxpO_6yCGtEyi8A@mail.gmail.com>
 <12a46993-82a5-4109-87fa-61b8fcf764aa@yoavmoshe.com>
 <CABCJKufoQ0fX797M01t7CkTgMEwNCELY1=ptZsxr=jWOR-KAyA@mail.gmail.com>
 <CAKwvOdnaOy-nyZ=8oLw4N-_hA9JZVdP2BhR8cweCAOhsy4VG6w@mail.gmail.com>
Content-Language: en-GB, sv-SE
From: Yo'av Moshe <linux@yoavmoshe.com>
In-Reply-To: <CAKwvOdnaOy-nyZ=8oLw4N-_hA9JZVdP2BhR8cweCAOhsy4VG6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_083705_641295_51BA6243 
X-CRM114-Status: GOOD (  10.56  )
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

On 2026-07-24 10:49 PM, Nick Desaulniers wrote:
> Yeah, Yo'av did you test further modifications that explicitly copy
> the hash prefix? I assumed Nathan's change _plus some additional tweak
> to copy not just imx6_suspend to OCRAM which I assume the code already
> does, but I would imagine you need another change to copy
> __kcfi_typeid_imx6_suspend into OCRAM just before the function.  Was
> that tested?
Yes, I tried that as well and it unfortunately didn't work.

I tested Nathan's change along with explicitly copying the 4-byte
prefix from before imx6_suspend into OCRAM right before calling fncpy().
However, when checking the compiled binary, "&imx6_suspend - 4" just
contained padding rather than the hash, so the copied 4-byte value
didn't match what the call site expected.

Yo'av

