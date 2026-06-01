Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347A1CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 20:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s14BrCNKw5biHzAbTs/7/BHxIivmPKRyhGyt3zFJ42s=; b=N1g/V7mVQ6zxbQGmuC5Ijx7Syk
	2mzVAMfkLwk5we8GOkiYcbVjFXwpSxpCEt0vdhEzXmLpL1IRWIaw7tRSYz3SjAruGR1RdL0WF6hMa
	WS85TsLFBaD4JorBZZ+rhde2oFZtYWhXOahrA7XP9hpCRFT+3CpCFAha/4G1CN+WZKs+Ysp74I44w
	3829+RoPNKh8cO9U6rVgGYcOWtBaOlvH2/6uQ3vmJJsgVDRd+1DBFOocZPvz1qsiKI2HTbVUocLtK
	67D/DTRJaaf3YD29KWhom5P2Cv44ddAdjexKNsWpFGbEpd/XfVQo48EEf5OGGW3UlaFoe0ZuaSLgG
	K0lY/9Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU8tt-0000000BkbZ-1dU1;
	Mon, 01 Jun 2026 20:06:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU8tq-0000000Bkb4-3pz9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 20:06:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 55E30402C7
	for <linux-arm-kernel@lists.infradead.org>; Mon,  1 Jun 2026 20:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A41D1F00893
	for <linux-arm-kernel@lists.infradead.org>; Mon,  1 Jun 2026 20:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780344374;
	bh=s14BrCNKw5biHzAbTs/7/BHxIivmPKRyhGyt3zFJ42s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kLQxdGdNOe4WAEbHBkITeF72kb2AlxBmTVmE3SUR+hxPNzSrxMJ3Dc2M8M3fwuDhb
	 dMA+dyw0besE/LJl+JFci2ecBZdwLXJJZGxXRrkuJZMNIUUTCF2nHBuDrLlLHIGvwp
	 1x3YsaXmjrQt2XDXtF3TV5gijfYdJq52cj2KoouXuMbbzvE2AOxMLEtQk2HB13VbfD
	 LUYlJvdW0+ZLC0IdPNdLNIppnxjLDAvwdNlAec2Oc1VPhxr4OUIZFhZBMt2zakDqjX
	 FKiliHyUxtDVmdvCqgyx8TGYSIga8SqoYqU7l0ywT/PQJGktU0i7Dj1qKwIgrXLtcy
	 Ct35td3mH45zg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aa5e0d57e5so2010430e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 13:06:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9FlPk+1pKlWb0q5+TYczshhevAjHSe+OF7E0q68kcFZ/upTGlYk1/D8UwfCWxiEP50NWR63CBsb29LQHML3CnR@lists.infradead.org
X-Gm-Message-State: AOJu0YwH3xzReKTnHHys6VaL2AL3q1rNmfExu/XxNUbRrkxPlH5FddhF
	mDi/cHm2V7a1B3ThueLM0vv+W3819xnJrHOsrGJ06EZ3KZmex0e2dEtr/xm6FfgNLJc/oZl/QH3
	KBK1TlgQyoeIyrHxQM2hmHFyf8HGZ5g0=
X-Received: by 2002:a05:6512:1250:b0:5aa:6cfc:771e with SMTP id
 2adb3069b0e04-5aa6cfc7c86mr1598474e87.2.1780344373039; Mon, 01 Jun 2026
 13:06:13 -0700 (PDT)
MIME-Version: 1.0
References: <16fc7412-c470-4f3f-b6c8-55c35698a424@linaro.org>
In-Reply-To: <16fc7412-c470-4f3f-b6c8-55c35698a424@linaro.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 1 Jun 2026 22:06:00 +0200
X-Gmail-Original-Message-ID: <CAD++jLkiZD6tyUW6k2wt_TD3MeLNVDZNa0N+Rhwb0mAAGfLMvA@mail.gmail.com>
X-Gm-Features: AVHnY4K0SnpwSd7TlxazfH13zL4pKXTV_yuQj-jItkV28NmyUihecMzf4bInR58
Message-ID: <CAD++jLkiZD6tyUW6k2wt_TD3MeLNVDZNa0N+Rhwb0mAAGfLMvA@mail.gmail.com>
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v7.2 take 1
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: soc@kernel.org, arm@kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_130614_997105_D8D69220 
X-CRM114-Status: UNSURE (   9.00  )
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

Hi Neil,

thanks for your pull request!

On Thu, May 21, 2026 at 3:19=E2=80=AFPM Neil Armstrong
<neil.armstrong@linaro.org> wrote:

>        arm64: dts: amlogic: t7: khadas-vim4: Remove invalid property

This commit has a problematic Fixes:

commit 6f14ba3c3fa3d67b72e052f431f6776470eb2cbd
Author: Ronald Claveau <linux-kernel-dev@aliel.fr>
Date:   Mon Mar 30 14:11:21 2026 +0200

    arm64: dts: amlogic: t7: khadas-vim4: Remove invalid property

    Fix introduced invalid property for Khadas VIM4 sdcard regulator.

    arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb:
regulator-sdcard-3v3 (regulator-fixed): Unevaluated properties are not
allowed ('enable-active-low' was unexpected)

    Reported-by: kernel test robot <lkp@intel.com>
    Closes: https://lore.kernel.org/oe-kbuild-all/202603290828.5gt393t6-lkp=
@intel.com/
    Fixes: 60eff75ac67b ("arm64: dts: amlogic: t7: khadas-vim4: Add
power regulators")
    Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
    Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
    Link: https://patch.msgid.link/20260330-fix-invalid-property-v2-1-228c5=
1c8de93@aliel.fr
    Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Commit 60eff75ac67b does not exist in the SoC tree nor in Torvalds'
tree.

What's up here, it looks incorrect?

Can you look into it?

Yours,
Linus Walleij

