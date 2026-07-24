Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAD3C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 07:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2lrEW6umKYlhY3E3BvuqES7VO9dN1EW9u56o/eIvoMU=; b=CZzR8dcVtu6W1U7qyAx0fhgdA/
	gjRyDhDD7H5qkKb7TQZEabspdx9xRk3+NIyWgNxtlEbXtsKn9ZVmZOOVvo5TMrXPDHrK6V2w4Bdj2
	sCvzevEiBSHBUmzvAOPHYdBBc+E19t+WD1jKnVmpRTJcZ6InQcPTnvqiE+ldK8FO+DYdDVV5qoL8p
	KIihIbdhRDgaFLF08ytOm1Ms3XtwfMFdn6uQ03te1j6cZ2MiPrnVevoaZ7WVoS/oTRdgLopcn4EK4
	bWDPVemi449H1/lur5LiJ05D2Mn/OI5IF/4TzvIn5/eW2Y8b5bxGaswir02ODKcNwJLMy3oaswFVC
	n7Z1R4YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnAnP-0000000Fk3O-2Aqu;
	Fri, 24 Jul 2026 07:58:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnAnN-0000000Fk3B-1wuM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 07:58:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4AEC660204
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 07:58:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0124F1F00A3E
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 07:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784879892;
	bh=2lrEW6umKYlhY3E3BvuqES7VO9dN1EW9u56o/eIvoMU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jAaWIBOGp5zNOoya/i+FUbKCihhVfKIFwfdGfHNhPdkungLLKc/sW+8CV/cvFR3iL
	 jKGr67dAhPvfAqtDvKm/By/Xqbn082MbTwnWLFqeysztTATeOF0+vl2ypRaGiSSOCA
	 YndQZl0pHg2uiKDlN3vM0xYIihk9721nbYkB8mPe4meLgc9ffzhzJy6BaTaCzH4igQ
	 ExULC6N1DvtTp0MoqHc/bjRG/pptREZ3TzU+isscTKsAO6OGB61v50AFRgAgsZvyzH
	 AeJOUJqdeunRseBOFQZvW8Ch0AnVMMRk/eOuAP+ITtEGwCcR9MxpiGmVRXXPhVNEnl
	 HeUwCAJ3bEzkQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b2a8e4c77eso147270e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 00:58:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrLOkxhpXiTNhdBk1/fugEeWNYArEdmXOCssddBVJKqjNR0SKm9K/rfbXZ0m7A1+77u9PxjmSF/LP2cZYLxfZND@lists.infradead.org
X-Gm-Message-State: AOJu0Yxvlzr8XVbHHIxcrsLX0pmHyqv/zhPgw4SLg1Z6L0bF6H2JYjNM
	E2slojitB8iogMkSDZVK+0vSxaKMXUaV6bsyGXtGyhu/zBgk5oWLnEoQ+m4SVHrVy8uDVF6/30W
	4NdGmzaSskr5L39NGxuTSgFqhozSBjrI=
X-Received: by 2002:a05:6512:3441:b0:5b2:add9:d073 with SMTP id
 2adb3069b0e04-5b2b2f72b9emr810365e87.46.1784879890747; Fri, 24 Jul 2026
 00:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260722023523.42269-1-panchuang@vivo.com> <20260722023523.42269-2-panchuang@vivo.com>
In-Reply-To: <20260722023523.42269-2-panchuang@vivo.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Jul 2026 09:57:56 +0200
X-Gmail-Original-Message-ID: <CAD++jL=N9=jep8784xKQHq3r9O383Tp+BMt-WuzBTW8r2xY__A@mail.gmail.com>
X-Gm-Features: AUfX_mwn8nSCyGvNMUSn4Co7Tgf_ZU4MeucUIy4NZ0E3dwEaBLvf-qP8Cw9Tz94
Message-ID: <CAD++jL=N9=jep8784xKQHq3r9O383Tp+BMt-WuzBTW8r2xY__A@mail.gmail.com>
Subject: Re: [PATCH v2] soc: ixp4xx: Remove redundant dev_err()
To: Pan Chuang <panchuang@vivo.com>
Cc: Imre Kaloz <kaloz@openwrt.org>, 
	"moderated list:ARM/INTEL IXP4XX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
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

On Wed, Jul 22, 2026 at 4:35=E2=80=AFAM Pan Chuang <panchuang@vivo.com> wro=
te:

> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() automatically logs
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() calls.
>
> Signed-off-by: Pan Chuang <panchuang@vivo.com>

Patch applied.

Yours,
Linus Walleij

