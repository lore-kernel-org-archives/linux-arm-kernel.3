Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B57C531CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 19:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+8l2CuJj29/q9WU4sYROsZI8M/M6cU4ae8pKFk3sZ3Y=; b=tcgK+SsoI4V8fEunPWWYGXhTli
	q9bUS4fwNWFOhCuVk9yiAjPV78ofWgkSOukXPWRdeITcfrAT/VER+wW4K8EHiDZclRBH3pJX5xPDm
	vK+1jx14ZJ0yin/WYF1/78cwncma3OubKSR7UqdTT2682dhm2uIk8UzXOD8v6mX6lR61m2iMZLKt0
	cMoBt2PsyWU+WaOiYSCpVBHDTwm0jcGz5ivemg2QHF6b7QAyTZ2iStObCiypd0f8S9Zoi9t5sLmQE
	m2jOqC/oQsWebn5bo+VVqkN8aELJtD9akfzvbCxvziZ0i3kObWBCHmVXCN87BDpt6oOH71Cn3q81w
	ABNlrDoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmzWc-0000000F0ay-2WbS;
	Thu, 23 Jul 2026 19:56:10 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmzWa-0000000F0ad-0AsS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 19:56:09 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1784836553; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lCuCz8qiU79E2KM7pC6ns4c+KN+wN3MUMmKekj5UpeIkuVZUbZ0v819kUJg4cEC6qCOcB2mUZAdjEMulb5OrpYZdEX7g1TyXQPMKGWw4QaUag3KqelWrDWhvafo/FCY5846EJvL7oa9KvUyq5XEiGA9dPkSR0Tp9AOvCs6VkTXI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784836553; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+8l2CuJj29/q9WU4sYROsZI8M/M6cU4ae8pKFk3sZ3Y=; 
	b=oKawccNzREyJ/TJmcyxmvq5/kQ3OeuMyNPUK9Ixni15ugICKcT12+UQYRTkvVok5MzFa3Z7AsSr7BnTIOEEpPBYfO/kwcZd8F70yBby+ZeXosKc1w0bWy2Tpyn3P1jOC4tatSJS471vLEFRfmDFLC2MUM2O5kiuEdsIWvanFYJ0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=yoavmoshe.com;
	spf=pass  smtp.mailfrom=linux@yoavmoshe.com;
	dmarc=pass header.from=<linux@yoavmoshe.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784836553;
	s=zoho; d=yoavmoshe.com; i=linux@yoavmoshe.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=+8l2CuJj29/q9WU4sYROsZI8M/M6cU4ae8pKFk3sZ3Y=;
	b=RwdQAppcb4zIri7Pn7AjcvfwJyN87cEvPLUizLsGlboJusa84hYmEjSxXbEgh6kR
	QeJZmq4zfAs947qJhiGZljmnu7yRqFr229+wOqrVQGPpgc0/pehLm3ykZaSfxs19RUx
	0BgCcsXnCKfGxMjezpJGphoATzIpNs8EwfCcFedg=
Received: by mx.zohomail.com with SMTPS id 1784836550137418.0442233386244;
	Thu, 23 Jul 2026 12:55:50 -0700 (PDT)
Message-ID: <12a46993-82a5-4109-87fa-61b8fcf764aa@yoavmoshe.com>
Date: Thu, 23 Jul 2026 21:55:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ARM: imx: Fix suspend/resume crash with Clang CFI
To: Sami Tolvanen <samitolvanen@google.com>, Yo'av Moshe <linux@yoavmoshe.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Russell King <linux@armlinux.org.uk>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 llvm@lists.linux.dev, stable@vger.kernel.org, linux-kernel@vger.kernel.org
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
Content-Language: en-GB, sv-SE
From: Yo'av Moshe <linux@yoavmoshe.com>
In-Reply-To: <CABCJKud9B8vB-J8f0HLHw6EgEKVWzy+Q1PrNxpO_6yCGtEyi8A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_125608_170845_5967CAC6 
X-CRM114-Status: UNSURE (   6.41  )
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

On 2026-07-23 9:21 PM, Sami Tolvanen wrote:
> What's the value for the __kcfi_typeid_imx6_suspend symbol in
> vmlinux.o? I would expect the hash value to look a bit more random.
Checking vmlinux.o with `llvm-readelf -s vmlinux.o` indeed shows:

  a488ebfc  0 NOTYPE  WEAK  DEFAULT  ABS __kcfi_typeid_imx6_suspend

Yo'av

