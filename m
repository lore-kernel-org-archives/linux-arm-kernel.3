Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E30C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 03:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xQDR48WjHEqsMRL2A1gJmeKRcqUr2W7BIowYB3PxMEA=; b=vt75/077gl3bsmCOVGNSfE+KFc
	MJolR7zNVMptsCjFh8z0zNy6XOrOPsHPGge1oFXOMcLDvO6lX7QgLQAd8JAqgYU1YtUgcNPI+Y+Rv
	Z6VXxUcjA2ONvu8+fMOwZqG2t1J8EWfuuJX/8/q1jTzT1QYmDW5NJh3IhbofJ+co4+d+o1c+gcSRf
	+f3CrTI6YsU15Td2ldyOwGpaP1INuhU2x/ngX2xrZ2ckKxE+Y4Vpi+nNlX70i+fW9fItRVS0buYA/
	Pn8YWT+AkAgJfaQ0fsggYdjFox78G9el1grAhOASv0OA7SQYdhafb12268Hags5pfx8B8OWiZR3Gf
	shDYjWOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6gm5-00000008Gq3-4C1E;
	Wed, 16 Sep 2026 03:57:34 +0000
Received: from mail-lf2-x11.google.com ([2a00:1450:4864:36::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6gm2-00000008Gpe-1h6D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 03:57:31 +0000
Received: by mail-lf2-x11.google.com with SMTP id 2adb3069b0e04-5b5e4f18010so430579e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 20:57:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789531045; cv=none;
        d=google.com; s=arc-20260327;
        b=YJxsZEHVCIeww15dDYcvn1AmJZZO/uM6yBsy2Tlgy7RJpI8vj3JLHevLnWBNNqkX8H
         0pZKv8wLvNpDkn+gfoVVG0KU4x/01p5OTGx0scy3Tw8Byp69VC33W0q27FIA4lBEibFu
         0xvK74x73sAH57CBpUG2zbcII7+zuCCw4yuIfb+907Y/yp6v+QFfPVwZmJpn7Tlh7GKl
         rnmHhpHj9DJ398DrOqK6z8gP2Nm/eltDD1G8pC0UL7JzW0i22bHticE2wXULY7GKje+w
         lUOod1A/dXfGct4HHLvBSh+VwO+v72ogYjE2t+NrRmfI2nce34OfuypwfKt+mQd7deXr
         x45g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xQDR48WjHEqsMRL2A1gJmeKRcqUr2W7BIowYB3PxMEA=;
        fh=8QalpKl4XYB65OO94AV/IzjGpib2EYD/gBex6ard5l0=;
        b=no8KT7oBMlZc60kZzJJsxox8aJKsxRzY4xYOfO/gRw9KWsKsNUWlQ26ePELuDKMUlW
         Ir20QXB6IInNESy7y3+0IDSA0u7jKs4YfNAUpRP4DUFpYFw+eLgjxpjc8dFGhSP66Mu5
         O0HUZXePaRQmUNWYLbsOYnYcl13NkhaRWyw9NGsrzflvU4qHT0DZ5WPIfDD/EROLVTKC
         25Jjz4qxKViYff1d1ZDk5L1RNUumXxie2Yd8+R/NvEc3JqbJheCYut5gdZzvW+Dv8Hen
         lra+Y5+v4VtOggaFT/lXd0a3QL8q4IZFv8IteH3BOqyM7h/iUs26naHuXoxasE2TpqB/
         J3nA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789531045; x=1790135845; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xQDR48WjHEqsMRL2A1gJmeKRcqUr2W7BIowYB3PxMEA=;
        b=cof5to0o3jtlYr6fmcYXRtPMcSnx1dUmPHBaOmXa02uAaUGWrAq3knEhXCSGkcTjso
         BoyDXQOTVrBTjRXX1+cC9AYf8hqqlrehZ6oEfyMPiQLsrYKDwtV8Hh+BxgFoXgL8Ueun
         aV0vjoboBJ+MFegfrMnWt0XnJ8nAzOPrIICWSbA22sVNjWDbY31J5oPpy7Fmvw2D7ADX
         NmJ3slOoLIlmFgXch5/JwUXAxL5Xi73lyjq2SvxoHZeACGo7UHuBJFsA3LM9YbNtccdr
         bvpWRmK+MJWmVkBXEualxQd2k5iXDHt69PqQIxy9ft6Qu6IUfZS8nVaflxDCZaAiaFNW
         I4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789531045; x=1790135845;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xQDR48WjHEqsMRL2A1gJmeKRcqUr2W7BIowYB3PxMEA=;
        b=QQUsVCLm3BO8qxdxmaFizyGEbE19PqwhiFL9f6UDG3Z7ZX/LsGGHf64a6FzlzT8NoL
         e7FmByWuanyQcQyWbcSigS3mo2G4n1kusXEFVLRqvU8y5wiDmlPdppIvvzrd0c1zVp+c
         ayUWe2hb4ZilYS/YEwaoe+DZm2tv0s2yondj3/DkyinDEIIhx4KHYv78fzPXe5eb2mEL
         Q6BtHHH08c/GlKBxNi/SmwSutbtxP9VlXU50lC4grsOHoElEv/DM6nF+h0NQ/aNkNA7V
         1oMrOAFVqOT6GA8JPuQUG2KL4mxdFhnPPq/xz+1+mB6Xri+FThHaiAKIGACGNsWOqS4b
         6Tgw==
X-Forwarded-Encrypted: i=1; AKwUvBxquCno410EJJUOdOTy1266pvv9RKTLKRYatAwYavK8WxDNE5JrLxF7mVrrThtfLhxUWVmf0l/RpVxG/3sjsXCN@lists.infradead.org
X-Gm-Message-State: AFuF++kSPrxlWuSs5EiCo21iQleamCr9UtlBTtePugs2qi3hV4yG8aSi
	DWz+eOGIt3Wg5AprUzMkFZsJqjTQvlpEN/45eUW2vO6UgQAxo5Y18AHOyIJp0r/FH/Ji7PrYD9y
	RyiEMugW13gm7K8zl3KfUS+ZvXfIDgnYRfe6ZqkA=
X-Gm-Gg: AYBFou2y/PYtdJEnYb5q57Tf/9aBfHkBGUELBVcskk/xGS53bzsVAGJ5/juc6G8wguV
	Rz3CKj/j/uBgPcZBaauiqFym/1yUo/iJzAy0tWK//xeX3vct96qoeCwWWMuaOxfgTFvLfCWknxd
	DCPwDlxzOre7HYgUqWuqdMl7EJuq4Rpg2cUTabnsQnAyDze9wLLGaghiF4+MddePOCsNPmDn7Vp
	KqsVleU9URq4aHlZtErCoiOnn/HpUI/rC00YvbO2vy54VLv+LxqiYFc1rhzOgY7kUe1piQc7sQS
	AWdoWzI0LzcJQ8YiHz2Hts4ddRJ1hpohZW6/rM4hhNeTyEbb9Ir6og==
X-Received: by 2002:ac2:51c3:0:b0:5b2:158e:9918 with SMTP id
 2adb3069b0e04-5b8b661e3b2mr186213e87.19.1789531044560; Tue, 15 Sep 2026
 20:57:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260915065534.102249-1-maimon.sagi@gmail.com> <6acfc82e-7690-4759-90df-22b64a5441ba@lunn.ch>
In-Reply-To: <6acfc82e-7690-4759-90df-22b64a5441ba@lunn.ch>
From: Sagi Maimon <maimon.sagi@gmail.com>
Date: Wed, 16 Sep 2026 06:56:58 +0300
X-Gm-Features: AcwNN1VE21f4CHLNHevQeu2epcwUcVn4gToPTCHI40hLednW88eNlo6h6UQyzGs
Message-ID: <CAMuE1bHKr_-cE7VpSMc_8nYGgaH9Y901XMqRLzvKYodn8CHiXA@mail.gmail.com>
Subject: Re: [PATCH net-next] net: axienet: add a TX timeout handler to
 recover a lost DMA interrupt
To: andrew@lunn.ch
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, netdev@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_205730_499351_5702A828 
X-CRM114-Status: GOOD (  29.49  )
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

On Tue, Sep 15, 2026 at 7:15=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Tue, Sep 15, 2026 at 09:55:34AM +0300, Sagi Maimon wrote:
> > axienet_dma_err_handler() is the driver's only reset path, and the only
> > two places that schedule it are axienet_tx_irq() and axienet_rx_irq(),
> > both on the XAXIDMA_IRQ_ERROR_MASK branch.  Every route into recovery
> > therefore depends on a DMA interrupt being delivered.
> >
> > If a completion interrupt is lost the queue stops making progress with
> > descriptors unreclaimed, and nothing ever schedules the reset: the erro=
r
> > branch cannot run because no interrupt arrives, and NAPI is not polled
> > because it is only scheduled from those same handlers.  The interface
> > stays wedged until the driver is unloaded.
> >
> > Add an .ndo_tx_timeout handler so the netdev watchdog provides a route
> > into the existing reset path that does not depend on the interrupt that
> > was lost.  The handler only queues the work; axienet_dma_err_handler()
> > then performs the reset in process context, as it already does for the
> > error-interrupt case.
> >
> > .ndo_tx_timeout is added to axienet_netdev_ops alone.  On the dmaengine
> > path lp->dma_err_task is never initialised - INIT_WORK() for it lives i=
n
> > axienet_init_legacy_dma() - so scheduling it there would be a bug, and
> > watchdog_timeo is set in the same branch for that reason.
> >
> > Tested on a Xilinx AXI Ethernet MAC by clearing PCI_MSIX_FLAGS_ENABLE
> > underneath a running interface to drop completion interrupts: without
> > this patch the TX queue stalls permanently, with it the watchdog fires
> > and the interface resumes passing traffic.
>
> Have you seen the hardware wedge without faking it by clearing
> PCI_MSIX_FLAGS_ENABLE?
>
>         Andrew

No, I haven't seen a naturally occurring lost completion interrupt.
The scenario was reproduced via fault injection by disabling MSI-X delivery=
.

I do see occasional hangs on my development platform,
but those are caused by an unrelated FPGA bug that clears BAR0 and
PCI_COMMAND at runtime.
In that case the watchdog fires and recovery is attempted, but reset
cannot succeed because the MMIO window is no longer accessible.
I don't consider that relevant evidence for this patch.

My rationale is primarily structural.
axienet_dma_err_handler() is the driver's only reset path,and it is
currently reachable only from axienet_tx_irq() and axienet_rx_irq()
on the XAXIDMA_IRQ_ERROR_MASK path.
If a completion interrupt is never delivered, NAPI is never scheduled,
descriptors are never reclaimed, and there is no recovery path back
into the driver.

The watchdog provides an independent route into the existing reset
logic that does not itself depend on the interrupt that went missing.

I'm happy to reword the commit message to make it clear that the
validation was performed via fault injection rather than from an
observed field failure.
If you feel that scenario alone does not justify the additional code,
I can drop the patch.

Thanks,
Sagi

