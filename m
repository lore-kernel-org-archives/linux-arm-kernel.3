Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C08FCA174
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 18:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nrRcaBEzpRcULN7gKFTCVsNJUuuezDvP0uC3H3YtDbs=; b=uem9aNJWtsRV0NUvmMQ4WQ4lNA
	p5fG0C+BB+4ORzGZ8j8tPtrbkzc/Cxw4npXHvZ8RyrG++TC44DY9mOAkQ7kTmVxwDhPH2ULPxaijT
	J/SN6gpvpxvEsEguBlDslo4O0ESc/PAqSxv+LxC7Q6lfzfQ4Sqt8P8LBASlDV5xZ7zrR6hwc3ldl0
	9soHUMdHEp+XT/uUH/lc92vX7gLCo9RvYbQQtJajlpIh74ZHQJxsxKhEDbEvsVEYueG+4OTGFGPIB
	fDA1TiY+oSZsYMdvlvp89zSStehh4KUshTntORbwTpujba5s4auOM0ykLk1p5UJa42XL8ScDwoHhf
	IJYCm02Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzfRD-00000007uTH-3ClE;
	Mon, 09 Mar 2026 18:34:43 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzfRB-00000007uSm-1672
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 18:34:43 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-82418b0178cso6412151b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 11:34:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773081280; cv=none;
        d=google.com; s=arc-20240605;
        b=lfdRJWwHYygIK6DJgOce7M77giIT5PrK1nHXYzFadCDfcBMoyu+HAxml7nyvh/13x/
         B02/lfwEAsBWuRT2tACt/scZQXwIo5Pgr/8L8gep/4pBCGJt9VQU5WHYxgdxMTlPVs5G
         +lpQdP5rGwBNdfDKH9ArW7wFBCDyhzYb86o8QYO2aY8A/Z87q6Ng/g6khp940URRcCgd
         nj1QzZxWE7nrxTfW2fpwzSWjYRZ3BFua2uAqZsKGonNwSyz+h5TUR6nteEQZRs1VU6x2
         dFPC3YhbnXqtqsn7Kr6VTXr9EIpyS3fT83C62iaGQeFH51rYc5bffDvUeSznj5DysjKf
         VYDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nrRcaBEzpRcULN7gKFTCVsNJUuuezDvP0uC3H3YtDbs=;
        fh=0Lq4nfEUfTP95pLQxMWpMhSxCPqeH3ZbL0nsSxj5kU0=;
        b=R0055T6UNDIHPBbuA4D/giGj+bG8CRBUTKGc6RnzbnpXCpSPZc774n+TZbLBjozgtb
         WlyAUoOv3Otew1SFzkTgGC9M2hGfwZn2VEmyN3u/F5FIqxX3a+L6k6BF8rhF2e+XHt0B
         70ic6OkoZbR9mkIBp2n6Q6/H3TmKGaWAGIUM6QFh/tHP2Vpe30XLliVO08OJ8BWznxJ3
         uY73cMjnKmmZqhk0N82fEtBOLnWgbRxUXHXuOvBJRviTlCFBPKyy+NhvKsupyaVgMdSL
         cNGwpL2hIcQVSLnaAIh0mM33RDpBx/j/uawcbR9wogaC21ZnaHWmLXuC52eOV74gcEUI
         uXDQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773081280; x=1773686080; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrRcaBEzpRcULN7gKFTCVsNJUuuezDvP0uC3H3YtDbs=;
        b=i4xdUwvoMX5GT9CL3Bf+IDj0+NjWOs0n5KSxbsrCaUj4g7nfuURY7fcjP/G9427WtL
         VoQtWRPIDuzNAOA3q27JRnfGA/zA0XZBYWa1Rwoh8KUmH2h4MaobAi+dzbvEr0YiZDNN
         CwV/IubbR6Fbpcy66TbUwI2azlM1AO9YLynI4iem1vTMjD4UAu+HxNqFTcA0nbe1wPJf
         vC4gpaFMgK1tVFuWkTalvXOVoi40CPulMvLaSmVT4zMLikbW7OctSb2ePwFKcyIkspoX
         gLjOZk/XMT8aHugPY2XHeY74x803/18La9K+mAwoUB1C1AtxCCg3TIe0xaT7d6acDyZn
         T7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773081280; x=1773686080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nrRcaBEzpRcULN7gKFTCVsNJUuuezDvP0uC3H3YtDbs=;
        b=Qqy5hmXZ10Z0DF0ZwAChhUHXG0UpQFpQBtKsQuZCoZ9RSD0U65cS9LIRlmuK4OHuA9
         50XLqnN9kYpH/pEd71dT6Dl6bnq6SD9Z1salUG3fc66kTecp96erEfhBXWGao03te6IF
         eP8Oc68/Fgc+vESE0xr/FZx6RFR6tNzGEyTX3rZZP2YhWcZgJ031eBbpKyZfT3E5/Ctg
         wvdX7p8C6qnOccVDOd8rUwOfVXTPIzy7rCrIWnKiVK4oXTivWtOnnBcCex/isrH6m93v
         Ss5xyoCt6yJGCO9FLfgS0SZ8yWCbZW0Hgv/GewAxsH/E5I2Zu0fEXlPGYSsERpOfr/ck
         lsYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhIUeIraq1qAHGIeynHWFPg09cax6HwrA1d6E5A57d6Jx3MrXoO4rG1ll91C6Nt74h8emKFCfZJcJAd3xZHhHL@lists.infradead.org
X-Gm-Message-State: AOJu0YxhBOHj27pLMigXS7NC5sc5jQusF41bzukLFDjPmgBu2Wrpze6V
	RXc/aePgUVIidMIKgxvCDXRJBNbj+DzVNRBKtgcyx3TC2IHTIJtpdmgUtsW96+Op9Qj88cfUYEm
	rZjLLsK3dis7ozVHSDMRE+r5xh1fgn/s=
X-Gm-Gg: ATEYQzwGneo69gMn99+7jXpClFP+absc/XfsFYq70ZTtKp7/Vz95PGNfKNMmZ5hjYBC
	o4E8orjy7ok9w2GNEOpQgVM3BEoMoVRyqcLoAH3kz+KCWDCx0UYYfvAdzaziodvll95gKvwoJfH
	GtDM3YLWraiVmTRRQrBXoRFM2pduMRr9Ift0xnRrd4ZCO9oMW5/LiMHcrQNWNr2gxd9y9D+kPUi
	DW704ktusnH+PFE1ul/81Ir96U3zu8GNscAtOfhdviXHhBcpvpg/+jlEAMJoBvRvSv3xN11Tzqk
	CG4ZeL8aE2+BLtg=
X-Received: by 2002:a05:6a00:8d4:b0:828:fba4:f738 with SMTP id
 d2e1a72fcca58-829a30cd00dmr10989334b3a.63.1773081279962; Mon, 09 Mar 2026
 11:34:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260223-yv5_revise_dts-v5-0-fc913e902488@gmail.com>
 <20260223-yv5_revise_dts-v5-3-fc913e902488@gmail.com> <391b9b912492c07fd1fd7a737b7f49382d361fe2.camel@codeconstruct.com.au>
In-Reply-To: <391b9b912492c07fd1fd7a737b7f49382d361fe2.camel@codeconstruct.com.au>
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Mon, 9 Mar 2026 11:34:21 -0700
X-Gm-Features: AaiRm50UUFPrZASIttjIHF4s9Vp0-viz-S5hm4dYkV_SMFCL3uBX0HPxRWEoCcI
Message-ID: <CABh9gBe2BcgnONwx=cmcOAsT15HgVGjxSChgFMvckTAW_8JfMQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] ARM: dts: aspeed: yosemite5: Add new SGPIO line
 names and rename signal
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Amithash Prasasd <amithash@meta.com>, 
	Kevin Tung <Kevin.Tung@quantatw.com>, Ken Chen <Ken.Chen@quantatw.com>, 
	Leo Yang <Leo-Yang@quantatw.com>, Jackson Liu <Jackson.Liu@quantatw.com>, 
	Daniel Hsu <Daniel-Hsu@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_113441_304787_891570FA 
X-CRM114-Status: GOOD (  23.82  )
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

On Tue, Mar 3, 2026 at 6:41=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Mon, 2026-02-23 at 19:17 +0800, Kevin Tung wrote:
> > Add new SGPIO line names for user space monitoring and event logging.
> >
> > Also rename PADDLE_BD_IOEXP_INT to ALERT_IRQ_PMBUS_PWR2_N to match
> > hardware naming. The original PADDLE_BD_IOEXP_INT is unused, so this
> > change does not affect current system functionality.
>
> Why are these two problems being solved in the one patch?
>
> https://docs.kernel.org/process/submitting-patches.html#split-changes
>
> Essentially, your use of "Also" is a bit of a red flag here.
>
Hi Andew, sorry for addressing two issues in a single patch. I will
split them into two separate patches.

> However, on the specifics, why was the PADDLE_BD_IOEXP_INT hardware
> naming wrong to begin with? What changed?
>
Originally the signal was named PADDLE_BD_IOEXP_INT by the hardware team,
but the name did not clearly reflect its actual function. After
discussion with the EE team,
it was renamed to ALERT_IRQ_PMBUS_PWR2_N to better match its use as
the PMBus PWR2 alert interrupt in the system.

> Broadly, it feels a lot like you're revising platform designs, then
> trying to make the one devicetree fit the current design, and are not
> explicitly communicating that this is what you're doing.
>
> If that _is_ what you're doing, then we can come up with much better
> schemes to handle it that aren't a constant stream of compatibility
> breaks.
>
> I need you to engage with this concern.
>
Thanks for your feedback. I realize there may be a lack of knowledge
on my side regarding the best practices here.
Could you kindly guide me on how we might implement a better approach
that avoids a constant stream of compatibility breaks?
I=E2=80=99d like to ensure we handle this correctly and align with the
expected workflow.

> From inspection, I only find patches 1, 4 and 7 of this series to be
> something I'd consider applying without further discussion.
>
Got it. Should I split patches 1, 4, and 7 into a separate series?
This would keep the current series shorter by excluding items that
don=E2=80=99t require further discussion.

Kevin
BR

