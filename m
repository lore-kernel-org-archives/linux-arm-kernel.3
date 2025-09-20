Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01CFCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 05:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C3qgnqyGh5+o5ESd3ctmpVVcjB5jxjUDF82n7+gUUGg=; b=kPvgC/AgzH3VFBpRGq8upxxu6d
	revlBO6Wd9o82bqbmjxgeCqqJpaU2MIcUKa4eQqWWo4bZ3i6bf+fyzHsAHXPB/z2Rv4NGiydYtI3l
	BhUbQwALbpY1qBp8TIfWmVyKEyunhPrJUJsEwgUTY6JJ2bUuxKyd8rTQsAbbA8WHY9fyfBXtHdqFH
	2m/w2DlJtDOFq3HJgXY0T4am5ID/OEo8CoktvcIfCJJI55fd37uZm45iBQhXYFN7zMNKaZgX+mOTe
	Llwy0U/iBzMUV3fkzick9Fj9whuTxrtGL967ryGHV1BAebTxJcYfaGEHSgSc6AF/nnT2O4EcquoZt
	d53CJwiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzqEz-00000004op1-2RHq;
	Sat, 20 Sep 2025 05:34:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzqEx-00000004ooP-32rq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 05:34:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A7F74173A;
	Sat, 20 Sep 2025 05:34:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FABDC4CEEB;
	Sat, 20 Sep 2025 05:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758346470;
	bh=V/+Qy01EmZ0PCln4OM3El4G5dCfh6SHIukCmzi2Z+hE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=JzegsISH0H3t4svbmqnQnDyNezfc/r0jPVr8wtNnTDaE+sKWjZy9gIqOsVpzdnJxE
	 uhpabUtXJWqSn7FzYYF0YNVthy7Q0rhng73metmwGlIgM+/BdqZuvH4HHgYCybdBbY
	 uGhyunLC43HOaidf8haNZacIhma0xv1wJfSgWycHhbJGexrAzRQeezadiyVOlSDQk8
	 Ewupijr6Rlv8wq8q6ZtxhRooXuSSZXhjTcsAVfs9bp/d1yhLH326WAc8fakCLF0czl
	 LxmSPDNmPiIIXPybWb492ETfm7EILWut/82ZQfV0Br/0Mb8W5AXr+5G4d3xreNgVXz
	 UQ5i5soWyTThw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d36c5597-e26e-4ddc-93b3-222d8b40dab7@broadcom.com>
References: <20250901-kona-bus-clock-v6-0-c3ac8215bd4d@gmail.com> <d36c5597-e26e-4ddc-93b3-222d8b40dab7@broadcom.com>
Subject: Re: [PATCH RESEND v6 0/9] clk: bcm: kona: Add bus clock support, bus clocks for BCM21664/BCM281xx
From: Stephen Boyd <sboyd@kernel.org>
Cc: Alex Elder <elder@kernel.org>, Stanislav Jakubek <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alex Elder <elder@riscstar.com>
To: Artur Weber <aweber.kernel@gmail.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Ray Jui <rjui@broadcom.com>, Rob Herring <robh@kernel.org>, Scott Branden <sbranden@broadcom.com>
Date: Fri, 19 Sep 2025 22:34:29 -0700
Message-ID: <175834646902.4354.13114906749225372224@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_223431_784305_1CAD3C2F 
X-CRM114-Status: GOOD (  11.56  )
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

Quoting Florian Fainelli (2025-09-04 11:28:34)
> On 9/1/25 10:07, Artur Weber wrote:
> > This patchset does the following:
> >=20
> > - Introduce support for bus clocks. These are fairly similar to
> >    peripheral clocks, but only implement policy, gate and hyst.
> >=20
> > - Add matching bus clocks for BCM21664 and BCM281xx peripheral clocks
> >    and update device tree bindings to match.
> >=20
> > Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
>=20
> Stephen, are you OK with taking all of those patches through the clock=20
> tree? Patches #8 and #9 have a dependency on patches #2 and #3.
>=20

I don't normally do that but sure. Is that a Reviewed-by?

