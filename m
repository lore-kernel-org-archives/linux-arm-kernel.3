Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADECF013F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 09:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZnLNDjXRmrLc93v5XVKHHUWhoTftzAtj9fQW7vodS8A=; b=jYBYeYP4dSDXUk6uX6HTFBQ4h0
	cmx2RRt551IwdVSoBWf+UO0DmGwF7kVdzzkm8XUMZyOCf/I6IyG78uoEBMan6CgWulflFCDSkSDcY
	iaF0WjHlIgoxMCK/lTms8X2HtShYC0LiTKW73VskTO43bY4swbt/3jMyFehG7qzgXQlWa1plY8ZA3
	qyQb4TBlNkP1PmtL8HycH4WCdP9fbpEWs2uMQyNeOt3NfnZX42rPdmvcKeFE4a+N2Crzb1fkAZdhc
	PgWdmocoi2pjicXcokipeG+fQQmwXDZxgVr6Xck+44OmPr6vzhIqZO3AzQCTdZANhbVzu7A0srvdy
	T/B54bEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24Ba-00000003d1Y-0YV4;
	Mon, 16 Mar 2026 09:24:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24BX-00000003d10-0wCy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 09:24:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DCD77441C0
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 09:24:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD510C2BCB0
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 09:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773653066;
	bh=ZnLNDjXRmrLc93v5XVKHHUWhoTftzAtj9fQW7vodS8A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=t5Vydq0Pm3Hy5I+94LdlrgUQE2eoX83qsyuW/AMjmRg+8K8bDT88z+3EkXdvgCD8n
	 yglFounJ/THRwBi97Ut6kNnRNIISeVpJs/3cbtg9ezsmalTGlE8vSvZ+nteofYyRAs
	 2Bq+AMV+4ztpA/SO2YTlqedn4ZhndR1v+Te0zJHdchxWEBdGsXttIjTpT6d981pMBR
	 M1o//gJycYkHxwf4WsygMt6EH/XBd7MW7SfeHS31WtxkfpG4zfMyS5snAfEFdpwMDj
	 pVGmgv0YFx2L4za0GrKIof5DFoxUg0fYezYLH2BhKRyIXe32CELBTHXT+73sGWjp3w
	 Ij4CzTzwy8krw==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79a46260385so7706247b3.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 02:24:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW/OMNe7xhk6bL6A9UpuBnPI3ACUEgySVOMuyU9bj6Kfqyc6d+YqzAFay+To/lRDVvSl0sSpVTDbW+li4NnWyJI@lists.infradead.org
X-Gm-Message-State: AOJu0YwHALqPW2RBqSftxPOCGM9gbLY3CI+PS86hmL5UyxnbUzkuyWt2
	sDb4N2+06bcnTalTmPhzAfgId65pKrlfmEzTo8BRn38LDWJVwHVSLELD8tx/XabIDJHYMMLwI/8
	OAvHrR0dwBb1djhUD1a3OfDNgQsov/jE=
X-Received: by 2002:a05:690c:6604:b0:798:6042:12f8 with SMTP id
 00721157ae682-79a1c1f1ac6mr113568307b3.55.1773653066158; Mon, 16 Mar 2026
 02:24:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260312081805.3020612-1-arnd@kernel.org> <20260312081805.3020612-2-arnd@kernel.org>
In-Reply-To: <20260312081805.3020612-2-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Mar 2026 10:24:15 +0100
X-Gmail-Original-Message-ID: <CAD++jLkdAAD2SNhxWvSCg0X5h94mP+Fqsb3SpJ7+eTV+o_kERA@mail.gmail.com>
X-Gm-Features: AaiRm52v3ufpixHupvPLX0Q4ClMALFB9XzDqktmpG1RxOvzrgbGN0bx9Ial3b_o
Message-ID: <CAD++jLkdAAD2SNhxWvSCg0X5h94mP+Fqsb3SpJ7+eTV+o_kERA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: defconfig: enable CONFIG_MFD_STMFX instead of PINCTRL_STMFX
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor.dooley@microchip.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_022427_366608_1630AAF5 
X-CRM114-Status: UNSURE (   9.09  )
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

On Thu, Mar 12, 2026 at 9:18=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> PINCTRL_STMFX now depends on MFD_STMFX instead of selecting it, so
> adapt the defconfig to pick the right one again.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

