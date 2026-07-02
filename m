Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E9FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 00:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b23V63BD9BdyYV2a2cLuU4Mh+dF+RSGxaY+1gI7BIEU=; b=Yy9SvdeDqC0cuEtbVj+zjmnY6b
	mv2GEtRdjlKwYkbGxB8j7s6kDpR8ZQDqYHLVxGgARcdpDWKLnHtYgtFHosNLkCFIPaET6F06JxmVN
	SxGeGi/0vo8rwIVB8nb/zNL/9sOIXCYY7GEahSX471PN/qHgLwBjTnX+Rq1PiYpETDQSqUZbR70UV
	MjckTDDnmr49MMHKXh8YFrio9j0OGhBuL4KFIEpPERMLFcerkbciojG4Qtmerv53vK38zf1xzC2Ap
	ju5/tz6Ftm/4QOovBU/UMllO4NDQL45edgoQ7dQu06s6nHk0a3Ube3jAY8iL0ZwKg0wD0S41qFA4P
	WZbLNZzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf5FJ-00000003Hfh-3aRD;
	Thu, 02 Jul 2026 00:25:37 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf5FG-00000003HeL-3Sm9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 00:25:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1782951925;
	bh=b23V63BD9BdyYV2a2cLuU4Mh+dF+RSGxaY+1gI7BIEU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=h3bv4x2WU3f1qVa7wLIOYvub7fxttSM9mZv8n11Vg4VoIPKJIsENJXvbd+HN3ds0M
	 cNISPiqb448GaEdzSxe5INSLK1lnf5MpWUaVphXrhLC2jQh4ncUfEdnPHBL+RuQeKs
	 +wGvEbXl5aZ3PeTvwmt+3z8oz3eXWAJGGk7SrnnlNbDg0ev2NzTvfzw8XK4vHiEkmd
	 F9sQLOXnw7VPGED1Zvqi82Gpr6J/HfVYUbWIYf5w2n7mkSR3ny0AeN1/6cPPWmQQ4x
	 scUrVFdffYKE8fBRFXe9Uc0GRxKAUcwpnpMzfcoT47eg29b5eVu97Edxvh2UA36dot
	 GGbRjlpj+sJ+g==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0162A65871;
	Thu,  2 Jul 2026 08:25:23 +0800 (AWST)
Message-ID: <33cf45f92e4aa2ca985501807c3e4f74e1a10032.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6] soc: aspeed: lpc-snoop: Fix usercopy overflow in
 snoop_file_read
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Karthikeyan KS <karthiproffesional@gmail.com>
Cc: joel@jms.id.au, andrew@aj.id.au, Kees Cook <kees@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Date: Thu, 02 Jul 2026 09:55:23 +0930
In-Reply-To: <20260701171506.338614-1-karthiproffesional@gmail.com>
References: <033f2657ae6a94ad13d22f717a2900afb75d892d.camel@codeconstruct.com.au>
	 <20260701171506.338614-1-karthiproffesional@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_172535_062654_B3B701BE 
X-CRM114-Status: UNSURE (   7.12  )
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

Hi,

On Wed, 2026-07-01 at 17:15 +0000, Karthikeyan KS wrote:
> Hi Andrew,
>=20
> Just following up, it's been about two weeks since I shared the
> hardware validation results. I believe I've addressed the questions
> raised in the thread, but please let me know if there's anything
> else you'd like me to do.

Nothing further required on your part. I intend to apply it, however am
working through some other priorities.

Thanks,

Andrew

