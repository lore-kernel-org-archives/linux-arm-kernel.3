Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5591C61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 16:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g085QIuW/RPpi7XOzVHapGAb7y2Bdr+tYpuspc8Gg0c=; b=RwcpVfkERS5TpchUrInGMoaDL0
	E1/Xnlgp7CT7+dz03l8Nvq19W+lPkJNAnmqpL+ESYf0mNlOxsGASR5UDjEwwiO7RKUC5scvvyZ+lO
	EKjpM8Xw9LK/pRipte1kUlYSox823fprCx2QKIixeVfflmFNsOVuSb7l4BzUJsvXcqK8SDIt2HdJ0
	J5DUdcwdNCeqMyeQGzVIBpcj9lNm7wOVNnSr5k7QSjoyNUYInq7hJTjWjpHXQTGKZIszJX2OGJBdY
	hV4e0H529dDq91ll+tNphbSlIAMhZaTEmrGczJDuTcv+HSWeL93iw/lMLOAHAlcenD4IVaKyTuOqj
	PaULWLBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdOS-00000004PaP-2mJL;
	Thu, 27 Aug 2026 16:56:00 +0000
Received: from sender6-op-o12.zoho.com ([165.173.180.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdOP-00000004Pa5-3TVf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 16:55:59 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1787849735; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WXMaM00TBSzjtx2SRRpFTDPC5kS6/EERPQ8V0QWwMnqgHBLc4YdDN6tEYOJv7AO1vcs/i/F3ZnEx+mlylgkOnswL4rLjOVcbgSx5igiNfryaxozBeEBKDfl9jmG4s/3HwymOWvzcrq1tIyiDQQSaH4J9gfTIzxE12exrFpUIuT8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787849735; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=g085QIuW/RPpi7XOzVHapGAb7y2Bdr+tYpuspc8Gg0c=; 
	b=JpXDmv/OMBvJJorvex7b/PsZvaW5VuzYaRv5oZnN0KYYk5qdW4PEsh7DOJQUtzw3KkQCX0bCdUf8+ywkqe3zaCrFxnP5o48gaTMZYnCuWo023nidVr4ZNGgZ4hH/rikSkpB0JVgz3wTPHm/FK+fF13wHiMlcp8YFonTkOmgxggY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=yoavmoshe.com;
	spf=pass  smtp.mailfrom=linux@yoavmoshe.com;
	dmarc=pass header.from=<linux@yoavmoshe.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787849735;
	s=zoho; d=yoavmoshe.com; i=linux@yoavmoshe.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=g085QIuW/RPpi7XOzVHapGAb7y2Bdr+tYpuspc8Gg0c=;
	b=gKMIzWU2Ms3HurNaOBG3rlIct4B6zJx3rifKMzpo6SidXA0RMSLyjcssVz9uiT5t
	geAvVLeaZ0PzsiPRZaow9/6wtbobuFDC3bKP/uZp8XzvsDtqssw1zE5+oFLBlE0X/rq
	jt8tVy34MVFQXQd839fKU/fYm1IzKop61/JtgEbM=
Received: by mx.zohomail.com with SMTPS id 1787849730914735.4941175159562;
	Thu, 27 Aug 2026 09:55:30 -0700 (PDT)
Message-ID: <ca86be7a-7439-49cb-9deb-8d565ca0b1dd@yoavmoshe.com>
Date: Thu, 27 Aug 2026 18:55:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ARM: imx: Fix suspend/resume crash with Clang CFI
To: Nick Desaulniers <ndesaulniers@google.com>,
 Yo'av Moshe <linux@yoavmoshe.com>
Cc: Sami Tolvanen <samitolvanen@google.com>,
 Nathan Chancellor <nathan@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Russell King <linux@armlinux.org.uk>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260718111340.159896-1-linux@yoavmoshe.com>
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
 <91cb0f21-e78a-4931-b123-937c6a01592c@yoavmoshe.com>
 <CAKwvOdk-JmqjhZWBiLjXTxKhEV+T3BAB6An+3Ara8oybmhAMpA@mail.gmail.com>
 <da6bffba-6c44-4ee7-a1a8-842f9e6de408@yoavmoshe.com>
 <CAKwvOdmT=Q+etTTJUna4ZAg1=eXwaT9cSDy=U0s15UT-3TOu1Q@mail.gmail.com>
Content-Language: en-GB, sv-SE
From: Yo'av Moshe <linux@yoavmoshe.com>
In-Reply-To: <CAKwvOdmT=Q+etTTJUna4ZAg1=eXwaT9cSDy=U0s15UT-3TOu1Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_095557_933547_CD9D9F82 
X-CRM114-Status: UNSURE (   6.68  )
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

On 2026-08-25 7:33 PM, Nick Desaulniers wrote:
> I do think it's better, but probably still needs revision.
All three suggestions worked great. cfi_type fits exactly in the
struct's tail padding so I removed the ±8 arithmetic,
cfi_get_func_hash() works as you suggested, and I've switched to
SYM_TYPED_FUNC_START/SYM_FUNC_END. I only kept a small manual alignment
pad before the macro, since it aligns the type hash but not the function
entry itself — I'll include details in the v4 notes.

Yo'av

