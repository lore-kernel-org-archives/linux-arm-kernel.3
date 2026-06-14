Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DBC4CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 01:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x99akj77/CWPECxf2U1DcO2FzdRREIg1Xo6z2wg93VA=; b=t134N0YhJTiz9yp+0T5clh3N6x
	sXLRojSrW1gSi/qTqTLsP5Nrk0WE5xVbczUGpjGvkFGDWB82nxPOv3oaY/HeKleNgmEPq0Em3nGzR
	hpmnHUsT3q+pkMIJ3i7V8flkkXds2wYg4SJhvx6PqoRjQCA4CXQ/mwhdqL2rRJ1s7bDcb9+v9FxbT
	ok/ay0OvfoJQXIXl+Xs/LPNvqMcU2A8VPxnXRr50aVKA/egQ+IGZ8BX7Imz4U82spOa+2sHKxn7RK
	me+jtsiNyy6s2ymr6RXZGo/dDOE3FCrdEsA10gFo3Gq+JhdduzMAVhYHNojVZNH7sZoYOJbj4zOfW
	EZQbQRMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYa00-0000000Cfcn-1D9i;
	Sun, 14 Jun 2026 01:50:56 +0000
Received: from mail-qv1-xf44.google.com ([2607:f8b0:4864:20::f44])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYZzw-0000000CfbY-3UyX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 01:50:54 +0000
Received: by mail-qv1-xf44.google.com with SMTP id 6a1803df08f44-8ccdef9f3d4so25504886d6.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 18:50:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781401851; cv=none;
        d=google.com; s=arc-20240605;
        b=PCmwKIBI2lHG3+ZpYbVodkUOJ5QDKkkeL/JV+qjkpyJHmRHRtudYPeRiMDxDdMnxWI
         C+9XRr8F5mjNJfnY+WqMsip8wHrsnbLX5FJjoAtxeEO1tPmA//iPKEJur/NQTPxdWnQ/
         rot/CHmZMnaxS7ReEtrtlddTRWMzyRW4jmUkPaXvOSv8Dh4cUCAZ+K/Q8nlukrIGHZ4m
         XLBqVqh6cnPnnPNpQYeRrP17ROFTzXrQ5243pkpiCIQmGjOFZxC9EL7/nFRMgeHs0ZbD
         bn+HQdTF0GtdylIu5AX1XmBOdy5tS1yNfh0t0l73cgiv/+K2+GasV5mdr5fS+OHYf2at
         +FJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x99akj77/CWPECxf2U1DcO2FzdRREIg1Xo6z2wg93VA=;
        fh=1SuognFH5oeFb+EaFcQjbMq02tkevDOgbD9pqSgmHKE=;
        b=Z8NnTzRD/EsKJRF6yt1X+Y8xWam2xiup+x702Txnk6WEVgZ5lddDsRt6TkN3GStoI7
         ixc+tWfaimppIKmSVQl+UAs5vgCnOj7WbaxLV3nzklYaTXSLxMst0bxETBWzWCGMNbnT
         F2j3ZiwX3SNsPsj0LVP8WK4vVm/qVQZx6+CtDz0Qn6dEhr42Q57X5ZAzqxkiLUt/NgU3
         l04Qb2ApRpEN6ZSt71+lyQSFvwx0Lq8eTUWGT4fkeZBIii1TsiP1gmN+kNn0IkEX4EtA
         mXNOpzCSPFGgjUgI3ndVGFKCbILDNHn2iBy+2WwHIc+D5HGZMhUmxbz8cdvsdNjvOtVx
         nOtA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781401851; x=1782006651; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x99akj77/CWPECxf2U1DcO2FzdRREIg1Xo6z2wg93VA=;
        b=djhh9Usg6gxjuc1Jr+54RdgvxnQ2Bh/eWKsSCis4dmqj4XXI/swU1o8vMVxExR4Sb2
         ayfvWBUStJLOZSBsPw0yAPVYNaThI7rWNPGYzuoF8OxJedy0DwqTphyBEozkaXElLHwg
         Lv+jlEOAvqhcORrt9Rvy5Rk5ZIYE4XPXkULRAxY/+vSrzqTtVM4+RlObfDU8pSZVfX5T
         jRZRGtIDcEp2Y2NXBjdqofELZ/uuxBnffAyo2NRvgCr2P/FFgGSvQMXJ8ESZDu1jkFYj
         4ba65jrtxCYphQHGDlWN1pEHAcOBtioHOtIeg7aBYnLOn/CT7FQCEbDTaoP3GRey46E5
         s4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781401851; x=1782006651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x99akj77/CWPECxf2U1DcO2FzdRREIg1Xo6z2wg93VA=;
        b=D498SYOEl04z0N+DXCQs7vcBYmz8pC2sn3yoY3VUEwQq5Gwb2I6P9RGvW2hR8Lox1D
         dX5eUQPF5MTQJLlwGQ+H18nP2khDnqWpSZqtEhwrLi085Laq6L74r73OTkZnHwbWjAxI
         5gx8CKy55IUTmH6fJM2B1dmjEVyLDGKB+623+e7UV8woAv9AKrilNf7Rih623sHvLM7d
         YjisnodZe5sAJ8CBCVWIex+VnzW/B+7+YqhsS7i+gOCq2j1A2ZDBKB5EiVgI+vruhURz
         yzl7EvK6K6ciGEVA87Xh/AJRIR0lza12XrIJ7eXgoaSSAQnKzOhQ9XHFvglpydezSJJw
         jiZA==
X-Gm-Message-State: AOJu0Yz27LYlQBEVuMjc6hL3g3/usgIJ/LSpL+eBiRZiTEWQmRKu0uyG
	gmkOITe6dXOsNOjgEPNoYvtHzxaRB/tVtxrU/7hvCwli8BAd5MccTQIyoXyYXsKK1SQ1NvvRn/B
	gB0u7+vXVHUmrSGwC6lDPFPdAjM6zGkQ=
X-Gm-Gg: Acq92OHVpPI0KpAoypuO+492zKSzixl4am0ysZkMaGiDVYmVJa1Q1CEtPKoNUqxIB02
	nLwgh3TOwv+1IxusWl1Eoq5tSYWqAa9ssBDl4y3NEhIuVBXDOAjfSpvp82FLw4CZL/pGwwS8haH
	wWqwPighFg3MbOx0NVNLAZxwLZxkEkcoqzaHMMhlmu9GPwwEQg68qvLYnb3irmT3yMbIfMy1etS
	b+fsIFwdAepb3NSNCn+XSZemtCh/6YhZIva15Aug6/Dqx+avuzpldT1ydJAexhxRhXnAr8oA3KT
	tBBWiNWj3i1Y25qy5ziKmJB43d4PXhclBXvlgtUWKucvMwK7gyBGZJALzrzDMc989l7GjDhQBiq
	jvnIr
X-Received: by 2002:a0c:f005:0:b0:8cc:2a92:48ec with SMTP id
 6a1803df08f44-8d4500ba517mr92754646d6.34.1781401851289; Sat, 13 Jun 2026
 18:50:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260518014920.135011-1-enelsonmoore@gmail.com> <CAD++jL=0qYGoygUwGEXQL7C_ROnC7kfpRv8RA+H5tNWwYu+pQA@mail.gmail.com>
In-Reply-To: <CAD++jL=0qYGoygUwGEXQL7C_ROnC7kfpRv8RA+H5tNWwYu+pQA@mail.gmail.com>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Sat, 13 Jun 2026 18:50:40 -0700
X-Gm-Features: AVVi8Cc5EU0xQMoD1E6CDuHkdl97Fy1CwNREhWgyknBaYGC0dNIVP1zY3JcRrtg
Message-ID: <CADkSEUjsS8bOXDhgZ2EW40xifDZ-pk5y=YqyWT-+vQNd8JikUw@mail.gmail.com>
Subject: Re: [PATCH] ARM: disable broken eBPF JIT on the Risc PC
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Thomas Weissschuh <thomas.weissschuh@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Shubham Bansal <illusionist.neo@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_185052_932304_25DC1B9E 
X-CRM114-Status: UNSURE (   9.55  )
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

On Mon, May 25, 2026 at 1:18=E2=80=AFAM Linus Walleij <linusw@kernel.org> w=
rote:
> Looks correct to me.
> Reviewed-by: Linus Walleij <linusw@kernel.org>
>
> Please put this into Russell's patch tracker!

Done!

https://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=3D9477/1

