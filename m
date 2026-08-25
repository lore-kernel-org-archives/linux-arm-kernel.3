Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC33C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 08:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=igLyui4KrE++QY+Q+/cMeUhr4ggDBdcJ0LhU2V6Vfjk=; b=ikJlGSqWXSN/76LsoCdA18LHuq
	S21ApSSWujABiZELANX75u/6y9vfBrK6YRwvnSWLQaDFULdkB927kXc65E8VEdJhzpzGXHOS5o3CN
	tFyAfuNAnqDgLym+IzpLgfgYPXoWAuha5yERA3LnzNC/iMWrgEy7kaxNFwCwDNGMiwzqjs6v3TYw7
	gRM3xyzxCO3lSqYJ699yauTspqf++Q+Rw7E9Ymm1J6jGnRj+SHzFKPc7O+OfqbYkyxfP3I5qviyxW
	bYdT9iduX/nDNZ8hq64rAAIv3Tr1Gvv8jJaawylTPTS0bVDLwMucvfkXq1pZcf6LnyRQi1F3UpYUZ
	QR94K7Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymnS-00000000Q31-25Qz;
	Tue, 25 Aug 2026 08:46:18 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymnP-00000000Q1u-08QI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 08:46:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5CF684E412E5;
	Tue, 25 Aug 2026 08:46:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2EBAC604C4;
	Tue, 25 Aug 2026 08:46:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A97E711C7A151;
	Tue, 25 Aug 2026 10:46:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787647569; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=igLyui4KrE++QY+Q+/cMeUhr4ggDBdcJ0LhU2V6Vfjk=;
	b=q+xCtlpwowWtdtxnpteKqaQ6Tc+7ZoJpBGpEgaeerAI1wtdi4Zlw6FNJKl2E40ij5kqx45
	h5XUHuvMMd7miKv6oeqGcQ1YjRRl8UpXPDtpC0hxuO0xNxm/yB36bIhTp0ZBE7Y0kfgzuL
	k6KzKS+imiJzgquawWGtjMnplXgFv2NOU3XMRKntLD+4fqW6H1Yg6BFFfrBbxtjEnfZ1YB
	xMAsT+5SCDaP3M+9Y6i8LUxHUMI/FjLfeuz0qJhcz3m6exzXv6ouw4auV863x0Ah+s0SMq
	fY8ht24dWPL6csVTmcvqVXcE+E88CkU0p0Yf9Z31VM/KWlLEDDOR/jIruxUk5w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bruno Banelli <bbanelli@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Andrew Lunn <andrew@lunn.ch>,  Gregory Clement
 <gregory.clement@bootlin.com>,  Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>,  Ben Peled <bpeled@marvell.com>,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: mvebu: ap806: fix legacy binding failing to probe
In-Reply-To: <20260820214721.11879-1-bbanelli@gmail.com> (Bruno Banelli's
	message of "Thu, 20 Aug 2026 23:47:21 +0200")
References: <20260820214721.11879-1-bbanelli@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 25 Aug 2026 10:46:05 +0200
Message-ID: <87fr02k2pe.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_014615_215550_EBA4BAFE 
X-CRM114-Status: GOOD (  16.33  )
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

Hi Bruno,

[...]

> Before v5.4, ap806_syscon_common_probe() had no compatible test and went
> straight from reading Sample at Reset to decoding freq_mode, so the
> legacy binding did work.  The commit introducing the test described
> itself as "No functional changes", ap806_syscon_legacy_of_match[] still
> advertises the legacy compatible, and the warnings above state only that
> the binding is deprecated.  The breakage therefore looks unintentional.
>
> Accept the legacy compatible in the AP806 branch so that the legacy
> binding works again as it did before v5.4, keeping the deprecation
> warnings intact.
>
> Fixes: be69e55df9af ("clk: mvebu: ap806: Prepare the introduction of AP80=
7 clock support")
> Signed-off-by: Bruno Banelli <bbanelli@gmail.com>
> ---
>  drivers/clk/mvebu/ap806-system-controller.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> Found while booting mainline Linux with U-Boot's control FDT on a
> SolidRun MACCHIATObin (Armada 8040). U-Boot's arch/arm/dts/armada-ap80x.d=
tsi
> still uses the legacy binding, so any board booting Linux via U-Boot's EFI
> handover with the firmware-supplied FDT hits this.

While I agree with the report, I kind of dislike the fix which
re-instates a clearly unsupported compatible, legacy since 2019. Maybe
we can start by discussing the need: wouldn't it be more sensible to
update your DT? The switch has been operated in 2017, almost 10 years
ago, with a big fat deprecation notice (which you hit).

If we *really* want to fix this situation, I would prefer to avoid using
the long time deprecated compatible. Could we instead have the callers
(ap806_syscon_common_probe() and ap806_clock_probe()) give either an enum
or a *get_sar function pointer? The former would only provide the AP806
one, whereas the latter would still go through the same DT check.

Finally, if we go for a fix, it should be backported, so stable should
probably be Cc'ed.

Thanks,
Miqu=C3=A8l

