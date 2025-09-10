Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB34CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 12:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=skI9T+/xeLD/m7s7Qla7tjWVpYf4bhBPCpCvExBgah8=; b=cYDBFS6nIO3bUmrxBDZG/iTGDE
	Bg8m3mtADTOZG3ltvqyaKYviK3PJ/U4ZbQ8JkcUQ2/TYRTKfLeYjOfOni6XVcJwQpE+GLSWdjpn/j
	EXaQbhgOWxaNNDqqwrG48GuYoiap6TiiKz54RZqTGcQgh/JcOkjks6HQ53qyBlAflDeSnt/SUScOl
	kVQYLobZa4OllekZ03J/+iEj4SJ69GJ3TJRU/AsAVsRtuAlwfX4UiXrjFQewio3CfQdm645CDstRj
	AWaG38ZvK/3L1ZNyO/NF3Jd9wNlh359z7iUw9KgeJy2Pd2eg2bkG2jvrQlfNJh23IKoKwUDsoxXlX
	01SV9Rbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwK1N-0000000E8dG-2tPy;
	Wed, 10 Sep 2025 12:33:57 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwK1K-0000000E8bJ-0HSf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 12:33:56 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-55f68d7a98aso7972779e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 05:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757507632; x=1758112432; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=skI9T+/xeLD/m7s7Qla7tjWVpYf4bhBPCpCvExBgah8=;
        b=pt/5sr/Sh8mDXDSbq/wL0C2Bb0knWEFFjf3dXB3Mn3+MMkCCTARMljCNtzpFH4Rm3G
         ock/rqsAgwHbOlVxBzk9VV6C8PlU9w4ookQ2fraMORHuigJ/TCmFhXHs6tICi/nG/WKc
         tWn2lqB1JjgkINeekWCaBsyOFyY43uS1L3vc4AtE9/rwMkOXib916UjavFiwNV6atmrK
         /TgQ3uNSchAUbwV991PSrsIeJyGnyLI6nar1QywzU3wF+az7YdMtduvgX66QRqmdifax
         Hag9S5sLStA0aG9fOT1ZNp3hS1/gBLUzg7egNb+dK/JHpHamCb2+v4L9/HmeWIR0wzXP
         jlKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757507632; x=1758112432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=skI9T+/xeLD/m7s7Qla7tjWVpYf4bhBPCpCvExBgah8=;
        b=K8tPkdlFNvfTXBwc+uJopNyDxP3K1FzlFEMHgXr9HtQnvQfEFeQc5AQONzqkv6a+sg
         ykAz0/t990MxnP0XrAAm0Xjhf+ZbR7V5TeIAGhv+7ogx4jX/bq8LkiDg2aa93f0YmW+e
         OD88AdgbXX/lu7YuyJEccERshrEzNgWI6btol5LbXkcJA3OLCGU060r7aj+eQGl2iao/
         bnzm29K6utW3AI58nYqbO1i6muUGZXg8D3nPJJ5Jw8eFhG+gD85YQopzb67REkG7dcmX
         L8COZu20BkB3Ay6zIHDDE7eTEJ7rlaV+647Nw9p3ITFX/u75xlnE0w7Qv0GRsJwHOJGW
         9fnA==
X-Forwarded-Encrypted: i=1; AJvYcCWRC5x+8LNPZU9ajH2xunRTuoCldKvAJBOI9WxhvPvu+7kYK+X61+V6reyjyKb48QM2VZ3Nrq1chDsbGT4CpWU5@lists.infradead.org
X-Gm-Message-State: AOJu0YyB8RYBf20Wg8kksnUj9A1EI79qmn/xLrVU+5C5m+3nYS9vIc5J
	Yq00QITal4DyhEKPiZnZDfDrAgWzW15QpQGV+udK9rAvTRrqlyq8EXsQIWXZW98O/8uW2TacQsl
	ZjkIR+/K+TdB5gkhdBwSsYJrPHJ3uLQuVNTD5LsBSyQ==
X-Gm-Gg: ASbGncsNOkS9FIwI3QZpKz9D0WPYi7JmjQ4AcmDaEU0kUNf9rLSYsBYZM8Dairtwt5s
	2L//LUsPdngSYskpNtMGcYTGPfY3X4azEa22PVeLmMK6ARM9HskkJ336+DBpOxsWr7zGr+q/7EL
	pGVm/aVT9R+01EMKFvb/usZh+RHnCcFwOauLkNB4oM+SThGRZtUNL8gBsoNDTXwIpFN2TBhd1Wd
	XVzY3vLYipXb1z1vQ==
X-Google-Smtp-Source: AGHT+IEYoTvKtT/H8Cg1gC/hS69lPe2ANltBJh4zGTiR26j0Tk12U4lmcbqE8e5TQVcLgLIs14eG8gIT+xqllMez8WM=
X-Received: by 2002:a05:651c:235a:20b0:337:e190:67e8 with SMTP id
 38308e7fff4ca-33b526a8672mr46134901fa.23.1757507631985; Wed, 10 Sep 2025
 05:33:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250910-arm-remove-high-pte-v1-1-d0899882815f@linaro.org>
 <7dfbb373-fb44-48d1-9880-747faa47e079@app.fastmail.com> <CACRpkdZ=4n=_yeWY1MSDRuQ=H-P=QiTcQkJF_YDHMfRM2RgDZw@mail.gmail.com>
In-Reply-To: <CACRpkdZ=4n=_yeWY1MSDRuQ=H-P=QiTcQkJF_YDHMfRM2RgDZw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 10 Sep 2025 14:33:40 +0200
X-Gm-Features: Ac12FXyBaauWVqgGPolMGErAfsIOEC-HKcvur8Pwkz1xYkC_NW_HSeKYtjS3I8A
Message-ID: <CACRpkdYVUGuS5fJuC0gXxz_AUi=rgKQ8FDoVpCrE0V224xF7Vw@mail.gmail.com>
Subject: Re: [PATCH] RFC: ARM: drop support for HIGHPTE
To: Arnd Bergmann <arnd@arndb.de>
Cc: Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Russell King <rmk+kernel@armlinux.org.uk>, 
	Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_053354_117088_A7910E98 
X-CRM114-Status: GOOD (  10.59  )
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

On Wed, Sep 10, 2025 at 2:25=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:

> Ah, I was blissfully unaware of that patch, sorry.

Actually that is a weird thing of me to say about a patch that
I even replied to.

I had *blatantly forgot* about that patch would be a more
accurate statement...

Yours,
Linus Walleij

