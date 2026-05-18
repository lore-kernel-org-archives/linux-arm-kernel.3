Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253E6CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 12:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7AT2/oSiJdqVT/zn70Y/W9nkm60nW+UXqpoRWb5gyUI=; b=gKaHZCOz/iQnnE+rul3+KNeMqy
	N8PpQj6SWr6Nh8t/ce9xNEl7xJ89RIfl4SGEY+FUYoZVdbKnAxaPlQZ+g13n7BUttvDbGiGjKiKAA
	d87y7mtrWMkXDB1i5M7esnSPzxPEYJcurxABb5Jrd3hWNXQy3CqSjIf1vV9e3uCzmOnS66HdMGYvO
	vKcyiHR+xdZn1qoi969m9G1dxE3SnYzEge0Slz/hAOzZKC9+w5H5/bYOabqLzrZLAHHLhM9W75LCb
	p+KcDXMoUBhL/xEjxnT/39EBStekTQdKP+c60P4Z7vPvYrThH3cuNER+FhE+pyDjrikRc8lXlhSYb
	iyuzIDmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwmy-0000000FZbD-31q2;
	Mon, 18 May 2026 12:09:40 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwmv-0000000FZaH-2mnt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 12:09:39 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-48d146705b4so23636565e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 05:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779106175; x=1779710975; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7AT2/oSiJdqVT/zn70Y/W9nkm60nW+UXqpoRWb5gyUI=;
        b=n+ZXeVEqJoVApdSK+vqL0iumaSzrz0S3xj4ptZiXdjIxMnApm0TqqNqcMZWPgE4/+3
         gms01UoQvHkC9o74Jp/+BvkipAulP4svAyFDbIq4POOgEtacuRFeQzy+0L1uLmQDOWaP
         ZgxrPNKj351buWCzv05oBUdUEX6UHuZurKmwFrghuwA5g9CHWnsPefFijXuIZaRh7cir
         uzH+FzPnnPfG3WFA9djIwg3wYDiFUlPnGCf9/HTYtdM0ssdTQpc29ZL7tQTJuH2IrU0D
         7ZWSDPKDZF7sdVos9Xi3TceoYVIHLLsqYpyPI/7VXPjRNYBgovH8ac7RFMyXVA2HOa35
         74Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779106175; x=1779710975;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7AT2/oSiJdqVT/zn70Y/W9nkm60nW+UXqpoRWb5gyUI=;
        b=GiKAX7WXYCXWS7+o4Qp+Q6rTZD4qTfmTk9vzSgyx5XuSKjxZ+YZcdB8UoNcp+/IV5W
         nsPFe/auNRdIxn1pcMb336iIPbAInqTYxtBQCq0fw5Ebg77lsuxrG9RR8VBg/UbrLT5T
         tCbeLXUIY58QmCI4cOu8GIKSg9vhpU70eJYQVXYDtm8EtAKcdTkgEe3glWdxuDw5x7dI
         w28eXksnWCw8rsO1l3pFePwIUmBZ71eEmHvTEOADEGhaeYbfpsYXlkWEG3DBgZIp3mVM
         dXMXE9IUkal8sLWVMWrzStlvIpPZLo6oH3OXvTjJngPKDOIJZw/L0O1Dz84ETnYFFSsI
         AThg==
X-Forwarded-Encrypted: i=1; AFNElJ8+b5XfKLiPk3v11/TnlfMfxa8zyWyfcbgqdCnIB0tr1H/MQhNcIa0umncYAwae4zDCAvApFnkXEI70mo2Ul9YW@lists.infradead.org
X-Gm-Message-State: AOJu0YwVNraTCu4+OkjiAKJIBv+jLJfPGIrOSF9xFbStqSM1iW4zsaZW
	J7sNE3vRvD6shR3ZxTCHb36bLUWJZRLsv1lptx0VVdS4Eeeg8wuVhUOc
X-Gm-Gg: Acq92OHNxHpdK8/xNDfbW7wx06X11TS4nj1Ppl+9t8rJxIL+oOwWPISraD8wTfacfnl
	q912d3Nbcem+QxEu2IN5yHeoI5C5rE1sgHkm+kTnFn2N0CHPzbjftXdPswMXYxzEZK/oCVsgk5I
	smRnOItH6/7kfUxhVM3ke2s1bf7wXLlx0oS56WMpkSlGaWTsexSqEUJze0rdUx3+c4+hmYDOlLq
	4VuCgl7v/DJygWaNMzaz9Q8Z12bjew3K8EJHhtVWUhD0FO82+JiCx4pAgDo0TTqoyhPGYW/sr+/
	+JvLJcs1u7ROhjGxqm7HLCKuv1Tje9l1ncZdUbAixNk5W5mVMtvhGMgsEexRV6FqjrLUurWsvCs
	ynbQlWT6dYRwpzJ7Xx/TarFRj9BpFZSYvdy/av7JZNsv36r5mU689H3rhK/x+7OBtg7QqZ4HS6j
	uPkkGv6wRcIL0bb2sH8idC8adhAjpiuQJbhDLKlLhPCbPRpdT0LcfwcI5oj0tK+kvh+c5rSuTyX
	+Uo34CRbSd3mg==
X-Received: by 2002:a05:600c:a293:b0:48f:e6de:1cc6 with SMTP id 5b1f17b1804b1-48fe6de1e03mr141000945e9.32.1779106175444;
        Mon, 18 May 2026 05:09:35 -0700 (PDT)
Received: from giga-mm-11.home (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49017d7108fsm2250215e9.23.2026.05.18.05.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 05:09:34 -0700 (PDT)
Message-ID: <579c7c33123c4cd0bd486301e56daf5962ca55ec.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 14:09:33 +0200
In-Reply-To: <agr9m_tidBr6Cu2h@collins>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
	 <20260510201644.4143710-4-alexander.sverdlin@gmail.com>
	 <agr9m_tidBr6Cu2h@collins>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_050937_742996_F74FCF2C 
X-CRM114-Status: GOOD (  12.22  )
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

Hi Paul,

On Mon, 2026-05-18 at 13:52 +0200, Paul Kocialkowski wrote:
> Just in case you missed it, there was a previous submission for this
> board which wasn't followed up on.
>=20
> I also have one of this board and wanted to respin support, but it looks
> like you beat me to it :)

thanks for the hint!
Do you mean this series:
https://lore.kernel.org/all/20241227-a133-display-support-v1-0-13b52f71fb14=
@linumiz.com/
?

I've missed it indeed! I'll look into it!

--=20
Alexander Sverdlin.

