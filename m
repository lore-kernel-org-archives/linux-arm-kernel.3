Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8BAC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 07:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FMJhv9z5CFBD/YkX/TwQca6TS4xilF3ejpMM7qovAEs=; b=xl/Iojmi584ltuoXkL+TK7P9zN
	3zzPCnibJSPAvzIu2FL5FI1SYG598ovIqM43a5nHk5qZ1V9zQw9cWX1ssgfDAd/W3MFuywwc5/v/L
	j5dP8PLbmfd6vEDtYc/XNL01kBN+akICdGbOTCsKwgXPU0vSt7piij4g2zypwFMSexZx18wEJ0dPO
	LJmW1qbUJQ/BFqpVOJEBUGFLZ6LHPurhB8En15QKeU2slT/D4b4HFMr3g2I9+xnyHSDy4+81uv0+s
	SWXPlTqS7aO09JW1Uxew8PlJ1aZ/dPkPYbyuK2x6gsHBM6Oj1IIh/Kes7hZse9fsjOEIHs5et0WuM
	JCnbWbuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnAjS-0000000FjVm-3f6E;
	Fri, 24 Jul 2026 07:54:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnAjR-0000000FjVe-0Swm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 07:54:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C2C9440662
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 07:54:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A71111F000E9
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 07:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784879648;
	bh=FMJhv9z5CFBD/YkX/TwQca6TS4xilF3ejpMM7qovAEs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YvQiAVp9MazxyBxwP5VXmgsg9KK3hR6onJa+SwWa2GSNoLZvwsICKzFmolsAFVdUw
	 Nz4fDrAmcnGb8xgHG1wUi0ybgAz8ivoyM8j5TZPpZbZ+6tp+mYFJtWN5SFY+hWL8VH
	 aZ3Zv1lJlQS1UvPKqdbb3LP2YRc0TtFTMkISQ+KsfDywFaHE01LA2km1mhCsy0VNKY
	 wVZiceqgn7+p+4VAT9bdo2zuviTGvX/jvYsLNIlbEjRjDDIgPxD2R5i92WNEXSwqWz
	 OPRq3NIYUJAatK1Ij7C3F0zmQQcTgQZ3+U7kjzvHwp1yz3F9KAUKlqKy0JLtRvdV7q
	 GP8KnC4M74mhQ==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b2a4359d16so185841e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 00:54:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrurGS5MbKRDFCiDjxvttrdIOANMTZrUp/sLWeDjDSGA+h2Dj3jkPYOq0+mRmIupg4DpDNDPCHuAJDP0RhNjh95@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3Ea3LV/BIFDkUat/8Ld9n/r+xnL1HoBul/SUWJwAqq7kvejqA
	AuGfUR+D+Av+LkoccnGX1ESYpWYwRGpJBZEn7PdrKqoFqvYwrv6cFEIi3Wt65VQQFUKvUkzT8ze
	eyETAYQhWb+5YsNqbiDRgixEuVWBtIMc=
X-Received: by 2002:a05:6512:688d:10b0:5ae:b952:6c with SMTP id
 2adb3069b0e04-5b2b2e52ce3mr973333e87.13.1784879647491; Fri, 24 Jul 2026
 00:54:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260704121851.63805-1-pengpeng@iscas.ac.cn>
In-Reply-To: <20260704121851.63805-1-pengpeng@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Jul 2026 09:53:55 +0200
X-Gmail-Original-Message-ID: <CAD++jLnpDOEDOL8G1sV5gm650xgh7zCAyBs-v-GNm+nUdUiRSQ@mail.gmail.com>
X-Gm-Features: AUfX_myaOsUHmAi2ounLhxjoQxyNgxPF8s_2wQdYmsfAdnraAK0RHaizZHihegs
Message-ID: <CAD++jLnpDOEDOL8G1sV5gm650xgh7zCAyBs-v-GNm+nUdUiRSQ@mail.gmail.com>
Subject: Re: [PATCH] soc: ixp4xx: qmgr: add missing MODULE_DEVICE_TABLE()
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Imre Kaloz <kaloz@openwrt.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sat, Jul 4, 2026 at 2:18=E2=80=AFPM Pengpeng Hou <pengpeng@iscas.ac.cn> =
wrote:

> The driver has an OF match table wired to .of_match_table, but does
> not export the table with MODULE_DEVICE_TABLE().
>
> Add the missing MODULE_DEVICE_TABLE(of, ...) entry so module alias
> information is generated for OF based module autoloading.
>
> This is a source-level fix.  It does not claim dynamic hardware
> reproduction; the evidence is the driver-owned match table, its use by
> the platform driver, and the missing module alias publication.
>
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Patch applied.

Yours,
Linus Walleij

