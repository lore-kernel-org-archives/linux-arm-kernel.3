Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6FCC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 15:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lkzdnHLNDNYqM7UpPRV6i14OmTu1unpa7gOTpfiF2qg=; b=u3StfjCUcff1EM3eAwroxGXcMq
	6wcKQ4OHsxsEGKJkSDUxGRrgFM1g1GHN+AC4F7cpYkm5HGh897pFxnAFfUd8KNimEmX1rPP9mEShx
	SVo7YX5riG1UBLIYbKx8mJUs2UWcUbNzlGY4cfezR+rU3cwq++Y9Dn3pHXbzO6cGbRknoRBvZMNsF
	UCDOZYxWCtvHnAKWF+rM10Y7bVbA+z+mjYyPPK0BbYMQ452KKw3aMi+v0npVecGDz/3Pez9LwgJMA
	NxQxrwBKjotBNSRCGPMdP1nIATR6HlKuj0+YApvjZkzBEqG6F/xAf5ypmVw39h6L2mIPhaCBWYwa8
	8bP/hOdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bIx-000000079kJ-2oDu;
	Mon, 07 Sep 2026 15:30:43 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bIu-000000079ir-33fy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 15:30:42 +0000
Received: by mail-ej1-x641.google.com with SMTP id a640c23a62f3a-c169ae1cb26so809116966b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 08:30:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788795038; cv=none;
        d=google.com; s=arc-20260327;
        b=HtmGmIfgwoH6O3oOz4AggD7bC9zSaTTJXw14c7tVFO47fwURs5ggdr2YXrMTtx7pLX
         tqugbJpWyk9q3OHAkHsr9ZRS419ZAJpuuIsrSCn/4W12odOwQ0nRNOG1Ahfg9J/qiUAb
         f51inoZcqDKL5S2awRKD8eRBHipWGIA5cWwyZ720T0PeNyDqy/9OO1DufhapXF+WhZ0T
         TKeVd++or2jBjb+VPt8ivZx8qjN0jlABdqZVifNZvMm68X1MW0Acqv8hEXXbhBqT04cI
         j8rbiyCHGT1ovnsOE9J19Djls2gj9FvuV9sI04QbJF5ptRnHv4+F0J5a4hz1Tq4YrGuJ
         H2xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lkzdnHLNDNYqM7UpPRV6i14OmTu1unpa7gOTpfiF2qg=;
        fh=o8VF0apX7pzY1DRm6kdFzYadCyyM6Uos4mqs5YI12/s=;
        b=Rgm4ppLOw10BocSvEQ2KVbrLgwpKXZjmGlXuDosO0GfqzC1gMcKYVj4vuLYorqAS55
         TLFU0aCfrZD5Weltcd5w2wHhanOYSM3YijAutc75SSWxYfVQC4CSKYAxstCXKX6SLSOo
         fGDXURAbkCJwfYBVRYLqM0AhcUsfg0HTSXGRMFd723hBvou86UqV0U53c7dmYHCnxZuq
         97Ucs0n2QwF+DydPYHRH3m4hgcmL6AQFMT+JeQitklveN64VTac93bOmpR+gnPXtZllR
         4JQru+6wiYN4ysh1msdCAU5VxG7UsTt6QyUFxTdUJr9qLf8BTlMROGxfH/ETXrbc9ruN
         yYhg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788795038; x=1789399838; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lkzdnHLNDNYqM7UpPRV6i14OmTu1unpa7gOTpfiF2qg=;
        b=eXXRnu6KzW4xTtxlEjCLbDCBuIGIvNWx3BXQoFsIZErVcKbTUAlK+BhKc0aK42I0jC
         4U/5Qp+paousPP1RGEBu2CGzhfLUu6ixfkcGCrFKFRhhCtNt8aXdHlUiBwWCsCrQ5Gnk
         Ck/xGRFyzXGJZMzAu8NVuDj3z0Acsd7Q/YAG8XbMZt5rxLnxBFFqjvZQvOmAXBdL9Jz4
         aBT7fymbQuDDYDQDbeMWEwyWbaYL/hs+ZaV1rTrAe/zV3boDt2HHZ8ljKbwTC98zv3Cs
         jQT6oYAT/p/kDbOvQj7fzagG3Z1tevqtq2dkgtobDo83ffp9a5Q/lFx5CsDeQkWQOicj
         Ij5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788795038; x=1789399838;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lkzdnHLNDNYqM7UpPRV6i14OmTu1unpa7gOTpfiF2qg=;
        b=kd8+NF8igs1ALtkrCvRbL/vk1n6iprZNSEjAgVPqedNC38rM4n9nWQWJVXCe5p08Sz
         +Or+gzXjSkG74L5r1CPaVcO/DfURHHn+xjRoJ2XUZ4HabprEd+KEz5WKlLhdqjzWG0W9
         s7S6x4h3DBmzpkb1/YK6+C1vzjqdJWqW2W655mZG800LVJBelMbgAcANMl/j3kh7fann
         VfHJ5j6MDfT2q/13HJYPvbSyLnfH9UR1v7cPgClXzap3uK/49eAgPv7mQwWG8Tal5Aaz
         PwalNWxvhTLqnL9BlEBQ1UAUAalCx+HZgPBaNiWMjeSI4S2HkGZb/Xnmj0hi4dhMlHmP
         iRgg==
X-Forwarded-Encrypted: i=1; AKwUvBydSrDX0Z87bDxjq6sSLZpYEqSm+Z7ZB7OMp7RKHbKcfyd8uoh5QTwNDH8ebstBfIglB0Ucni8d+4bDs0SrYg3Y@lists.infradead.org
X-Gm-Message-State: AFuF++kNaIUjcAmlPtKiN0fpKlIKRPTkkstLXXeB8mpEOzfEvW1yjpM4
	8/2JVhCmir9nBfy6PCG3Jmhu5dd1oWl2QjbxNohxH4qCU0NEk0uQ7XtmuKNI8S21xZXJkP0D8HG
	CwZxKFOWxSWnXR28LX0tR71gUx8SuT9U=
X-Gm-Gg: AYBFou2wXKVh3H+M18iettJEMnz35AOP/Ngdhlasg7yvfILqA8fREPdi+/D0F772kS7
	cs5NbvDOHQbVN8bn5Po/Tp7WzvCZMpamZtziPgKAfRLN0pF4qWRiPPIhzjxu0aJPX1BMMZ0MZ1R
	dWdYBL3wF3QfzpZ6f8+V+mt638PJdmRsjivt9nIr8zoOr0/kEyYnSlyqaTpPrzZGQ04UPIjhc2U
	+9x5Ja3FDrkvFDB2WVuJz0ofJ7BKPM7Rcv7CaSJ2/w83G1wOG0YfUFewWNJp31x3asPVSBA1wUP
	yiw3xauvlDcMCYg10NPONOPHzYtaIAr4kvsdd/l5aSXLlqQtGIzIeHtl4A==
X-Received: by 2002:a17:907:ea8c:b0:c25:4d9e:bb28 with SMTP id
 a640c23a62f3a-c25efb68285mr1154227766b.3.1788795038010; Mon, 07 Sep 2026
 08:30:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260901150111.141037-1-coiaprant@gmail.com> <20260905130002.554a167a@kernel.org>
In-Reply-To: <20260905130002.554a167a@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Mon, 7 Sep 2026 23:30:26 +0800
X-Gm-Features: AcwNN1Vvl2lnQu7OUmDQrL2TMEu35axYNEauRYInB38b5Eog8jJzDQ2t3ClFiz0
Message-ID: <CALj3r0grty9-s5FoXN-SHOrLkVoWgW+Ot5nHs=1wYzxV3hbC-g@mail.gmail.com>
Subject: Re: [PATCH net-next v3 00/10] net: pcs: add basic support for RK3568 XPCS
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Shawn Lin <shawn.lin@rock-chips.com>, David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_083040_791648_CB33A43C 
X-CRM114-Status: GOOD (  12.48  )
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

Jakub Kicinski <kuba@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=886=E6=97=A5=
=E5=91=A8=E6=97=A5 04:00=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue,  1 Sep 2026 23:01:00 +0800 Coia Prant wrote:
> > This series adds proper SGMII support for the Rockchip RK3568 SoC
> > using the integrated Synopsys DesignWare XPCS, along with necessary
> > fixes and refactoring in the stmmac core and XPCS driver.
>
> Not sure if this was already reported but FTR this series
> breaks allmodconfig build
> --
> pw-bot: cr

Yes, it will be resolved in today v4

