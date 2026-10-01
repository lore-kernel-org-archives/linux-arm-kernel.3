Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F22ACA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 19:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m11GMEyvhzjd9E6+wwt5uc3aFkOwju9CszSHqjpI5h0=; b=IBAjD9DcU0L+0Vgcmrff7jWXwp
	S3+zhP8DQ0g4wkidzwZh2JOYHxfS35VuLO30Da8SpwUOxGlTyb4A2HIPseNxwSSZrgNZBWZsUvpCg
	j0Y9nGDtrrafLlnNP7JJDE+BzmfDrHULtY6zn1ozDdnjbvzvd9elX7wcCQbWrBqbr4zIKEQZtr9Kg
	vYXRro78KKNMAMN56DAGJ0GTsZDBrC9mmDGezvU5XmrgPhpWd9V6MTuWsndzimZC+F5grQoNdbwG2
	vQDZlq1paf00A0qfLwHs1v/53QA5J1oru4nRnaOFzsQerKGzEJwNfUqMQoSEtTyUGZtOBrVWb5+yy
	CAWeYTqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCMSb-0000000A4uW-1aSk;
	Thu, 01 Oct 2026 19:28:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCMSa-0000000A4uO-0jfb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 19:28:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6D94D602C2
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 19:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 218331F0089D
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 19:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790882931;
	bh=m11GMEyvhzjd9E6+wwt5uc3aFkOwju9CszSHqjpI5h0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XpHF0yEP2CAfUBo0dIKOgho+y53PMw4J0ynCzZzK3Bv5ke5J4Pt+TGBpaXZB/E7aQ
	 i+Li3h43sorfblLs2LronkcGQC8G1KB25jrahgfSUW7fLmOKWSmYKsa2/Yy9llZ24Z
	 Ycc1PTALVDSG1UpjJikuEf+C7j5qe8PDy7urlXiq1YiraQttIRFz5oKyajZNRT83i3
	 6WH5iuJkNOzLtB/Y19CwJ8Vt6Vt9lkRMS5+xi+p1R3ovbrDx3E7FdIBthcj0EoT/Q9
	 8z/iYPaxNfzr7d1UAWPyol5b93IXmPXhLO6evqUfTx8ar2kVNuMJQSTDp9HivFa/z6
	 0Kq4GSyWtTyng==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba3ae12b79so2096978e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 12:28:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxdQplHk92hAIQN/323DBwSH9M4qhIFNMpok+nuMAYmbh77yrHUc1bZVRz9cowqB5agVsvGLV1tTPZjW65B0m3k@lists.infradead.org
X-Gm-Message-State: AFq9FYJJ/pOSK4UOwUzePwsmHM2xnslRp6W5T4jpMMy/FRBXE/JmSGsa
	tdIfZNABI1xCmHDnSasEm/bdozk7R+mji4+fV3ByKLYoJT2DAav06QqMHgTfEs2M5ZuNlZvl7Id
	Tc5qlWqeJuNq5sN0EvS7+mqstkMQmLYw=
X-Received: by 2002:a05:6512:3b91:b0:5b6:4ae:8c02 with SMTP id
 2adb3069b0e04-5bb9bc3a38amr67418e87.29.1790882929875; Thu, 01 Oct 2026
 12:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260929203634.32998-1-pmazzini@gmail.com> <a15d179f-8a43-4b4a-8bd5-fc0afecad6e0@arm.com>
 <CAD++jL=wEKZ5nRofe09heO8uUa4Cd12SYz3+XPhsStioQ5XTXQ@mail.gmail.com> <d9e249b7-baf9-4ad3-a3ae-b9765feca5d8@arm.com>
In-Reply-To: <d9e249b7-baf9-4ad3-a3ae-b9765feca5d8@arm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 21:28:36 +0200
X-Gmail-Original-Message-ID: <CAD++jL=bhQ8Pj12wgCi8RaRTEUcrXzhHm+EYA67dBEvn8P_rCw@mail.gmail.com>
X-Gm-Features: AclHuK_wLU1qzQeRdKRPBZrb-Hz7ltUFota33qajxnsq0Ifw9pLY5cjoFByXrTo
Message-ID: <CAD++jL=bhQ8Pj12wgCi8RaRTEUcrXzhHm+EYA67dBEvn8P_rCw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: dt: number the IRQ banks from the first
 one that has IRQs
To: Andre Przywara <andre.przywara@arm.com>
Cc: Pablo Mazzini <pmazzini@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
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

On Thu, Oct 1, 2026 at 2:31=E2=80=AFPM Andre Przywara <andre.przywara@arm.c=
om> wrote:

> So we could revert the DT patch, and take Pablo's code patch, with a
> Fixes: tag, but that would create some broken combinations meanwhile.

I see it like this was a bug in the DTS file, so this if fine as-is.

> And in any case we should add a word to the binding document, to pin
> down what's expected here.

Can we enforce it with YAML constraints or is it too open-ended?

Yours,
Linus Walleij

