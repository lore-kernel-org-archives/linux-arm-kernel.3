Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B56CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 03:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b2CWcYPdL0RmTHJYZikl61tiiXDfBQjGyNirYnlHw3o=; b=VwLsHQJWGxPYMF/HG0mXKz91D9
	TiGwwN3yoJ9WIdqiTZuUlK4rhTv6v22DLHSjEQQSYBw44lYbOfApdNTfF5jeQ7ivAuz32JlirWch9
	eNcb/Jzm9PAs4gi+qO5YIIvlRxcL0atXxP06koYFLEUmK+VkkWKfvShWbC0Wgny/KkNPN9B/T2chx
	O1BIJKZ4atwdiG0JqTGLCMuUygAZWPJ0FI9J3HWyMN0fuWSUirZ9jdyYjtL5b9x3Mr9Nn397q+c4U
	GIM1+eoJ1lR311RP/FnoEnPbIcoNgeDv1Zc9sOKxO8YU61Z5rqSq40u97uc4R4+N/xYpPlU3icppP
	KDUykmRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDw7M-0000000HaFl-3Qyr;
	Tue, 06 Oct 2026 03:45:28 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDw7J-0000000HaF6-0riR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 03:45:27 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5b2b92065ffso1120211e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 20:45:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791258322; cv=none;
        d=google.com; s=arc-20260327;
        b=Tg/tJxoDXJQlqXYtNO5gH1AdTjlXPcyyNehMuIkbxM25Nlpu14bRatG1PDc1rvBZ65
         2trmyQC4HXlTyndoXKGg018IctWDZ6InL66t/oSYJGIkkCyIY8Y5wvQHWewLo8fE1N6A
         L4lz0BYzL1xnmrdfXUudBZSPhw5ivBONxLpB6c41ZDzplTrXiBbIR4k9XX2liBYbD90m
         oznxINAsc/6n93MEdC0xL70LytMr2UBNkIhBXfLNQKSpQeD5q0WHNNSh9GEyVGvce0w/
         8qxjFWMhxVKPd7E0mpVc7sjcV/PUqBXeMq0NlViXcaU588QVw8vtSzGEqExLjuRmx1bZ
         +iMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b2CWcYPdL0RmTHJYZikl61tiiXDfBQjGyNirYnlHw3o=;
        fh=hq6358dI6OdcuJhyCPxUEyD4wAcbEJtaMxKoDSqbnBA=;
        b=qcsCutQVCybRbNw6mBo7LMSBidUHqZZYBXKOc1iI8O+pWy2dZ9gSWLYOuxtWnw/3oJ
         WTx0ipNnbJ0ueqOPOMqyB59bW6x8E89rYnl9XV6FFbaEpwWkdu9P6nruGnk+b/4Wtpku
         sYrAs8FygAMC8sQkEeOzZu5yQyS8v5JKZTNLACt85BllLixtC2Bocryq9rOOXPzTIXxy
         1o/0lffBEoP4+Tiq8SJi0Vu9DCDE7oE68bmFs9sek0LRVjzgua1ZUzpj6NApHuVVgfms
         Nqs4lJEVt/TFSUZz+mtZvsrXv8MTgdzQtNsYoq0MvmxH8XCHyg99gTZ1kp6IT5KVQ3Rk
         Z68g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791258322; x=1791863122; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b2CWcYPdL0RmTHJYZikl61tiiXDfBQjGyNirYnlHw3o=;
        b=Rk6bYKUh8b0aTd8YnH8SI3lv9CxyGpH3VJkJNLKLYyIxOG94WQ0Yy0S4B7ZxmGFpit
         HZhWT8HvhYiiGiu1coRwmhmoDlPsJoydpkBndJkxs1dT4jfOiVsS0+NrF66xP7UJmmTO
         JXlW9qFQmt5lEWb2dx2JWTIScdvl+613Qf13UpbW8vtaquKOdsFCRr3IG4IzCO2LCDnF
         g4GNnLXkaNzZkCAU3XKIg8lIYR3H8bap0Kd/PZPAd98cCu/4iKD3rJDo1TSjXw7l6vFj
         lt8YcGcA0oY5CXakuwyoO3SiSeGjaXpqLRtsoRxwW5M467h91mWPNBixEdy9ucy/QeIP
         FNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791258322; x=1791863122;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b2CWcYPdL0RmTHJYZikl61tiiXDfBQjGyNirYnlHw3o=;
        b=Ym4WNWEPp4latDRDLVBlUk5/qqICVyzCo+Y5u0oyN9w3YeozC4BZf7n+OUte5u1cMy
         mbo4gEup+poCbwDPFxDeekwbTvZUgkAXL1lTJDm4KgNqh/1cLhsTN+nszI3dJjb7F8Rl
         a4ZzcWCfbNNRG0zhbBVIXt385/vPPPyVzYMC0EpcmOqQuo1KsnojJ6tmzLJ7PKDJcR9T
         kjvhrxuo1qqik1OaqIWpazbrMLzpA9KCjfaqU7A/Cs0xdxPDbRRaCDU90ZtEdnRVsSg4
         VaRvqjVPYmVdVtAxblT9HLegwacd7CUWNT0n8rMQdTanXXedpE33u+5gBn5QsKx+foBE
         KkIg==
X-Forwarded-Encrypted: i=1; AKwUvBx9f4WtLUvqYgYjstD/AOg/9iLtuubKa2oA1J4jmx8Jch79EJbSejWq2uboNuvqdpSChZuQ2oAkOhsCs+dALvAY@lists.infradead.org
X-Gm-Message-State: AFq9FYKcQBS2RrSC/rAu11/9jgxO9PPcm1TS9fB18nB+syq5QB45AIeD
	XWwoQdLnKDHO0ON8MoSTqag8i5PV5jaSPHDavlRAnECZpF04jV0SagHs6v+0fFOs2LBDPeD8kGW
	rOQf9x2PB9JZsHcloeOwo8/kD5sHZ69c=
X-Gm-Gg: AYBFou38l0YJgHFEZ648TZAuphjwKVgfhLP4zmd5yo78k1HbuPtOLav6V/WOVGAZ1MN
	VZ/HzlTTnQxnY+wkzTKwQlimdD9tsQcVecGsERtGp8gEJnxV0VHNdn/NouFBHrV36u8efDE1gYL
	9IPCvSstr/h9Yl5/NhySAKcT3EE3qJcSeHYDTgNrOXDDFtGBkvgi2gCJten40QjWr7SyOuZygIb
	rvpqpQ5PPbBnJaASXnv/Si5IibaGNyknNw2R8NZbvBPRiv0I6mzb192hoGpyLOSvZ3To4zMpPHs
	X0NIi+lgY8KBMK//WrP5PkS0hXjb7M0yVIJO0kPA5iHnTQpEKL016w==
X-Received: by 2002:a05:6512:3991:b0:5bb:7829:741c with SMTP id
 2adb3069b0e04-5bccc6b594cmr64148e87.1.1791258321918; Mon, 05 Oct 2026
 20:45:21 -0700 (PDT)
MIME-Version: 1.0
References: <20261004083759.1016519-1-maimon.sagi@gmail.com> <asQ1pF9AAqOiEo3r@devvm20253.cco0.facebook.com>
In-Reply-To: <asQ1pF9AAqOiEo3r@devvm20253.cco0.facebook.com>
From: Sagi Maimon <maimon.sagi@gmail.com>
Date: Tue, 6 Oct 2026 06:44:55 +0300
X-Gm-Features: AclHuK9PN1lCiJLlPnCC7s8Qa_5To1aOEypzViWt-JVLXj9lXdRlnfiN5UevbJ0
Message-ID: <CAMuE1bGXcNwKKX1firkq6eEzymkrDOp8PnnowMzz97SibtpoSQ@mail.gmail.com>
Subject: Re: [PATCH net v3] net: axienet: free outstanding TX buffers in axienet_dma_bd_release()
To: Joe Damato <joe@dama.to>, Sagi Maimon <maimon.sagi@gmail.com>, netdev@vger.kernel.org, 
	radhey.shyam.pandey@amd.com, michal.simek@amd.com, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	daniel@iogearbox.net, jacob.e.keller@intel.com, suraj.gupta2@amd.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_204525_278201_E2C7ABFA 
X-CRM114-Status: GOOD (  31.52  )
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

On Tue, Oct 6, 2026 at 2:41=E2=80=AFAM Joe Damato <joe@dama.to> wrote:
>
> On Sun, Oct 04, 2026 at 11:37:59AM +0300, Sagi Maimon wrote:
> > axienet_dma_bd_release() walks the RX ring to unmap and free every
> > receive buffer before releasing it, but frees the TX descriptor ring
> > with dma_free_coherent() alone.  Any descriptor that
> > axienet_free_tx_chain() had not yet reclaimed still holds its skb and
> > its streaming DMA mapping, and both are lost.
> >
> > axienet_stop() disables TX NAPI and stops the DMA engine before calling
> > it, so nothing reclaims those descriptors afterwards.  Bringing the
> > interface down while frames are in flight therefore leaks up to
> > lp->tx_bd_num skbs and mappings each time.
> >
> > Walk the TX ring the way axienet_dma_err_handler() already does: unmap
> > every descriptor whose cntrl is still set - axienet_free_tx_chain()
> > clears it on reclaim - and free any skb still attached, as a drop.
> > This relies on axienet_stop() having stopped the DMA engine first, as
> > the RX walk in the same function already does.
>
> [...]
>
> > Fixes: 8a3b7a252dca ("drivers/net/ethernet/xilinx: added Xilinx AXI Eth=
ernet driver")
> > Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
> > Assisted-by: LLM sparse
> > Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
> > ---
> >
> > Notes:
> >     Changes in v3:
> >     - Clear tx_bd_v and rx_bd_v after freeing the rings.  v2 only caugh=
t a
> >       NULL tx_bd_v from a first open; after a close followed by a faile=
d
> >       reset the walk would have read the freed ring (Sashiko).
> >     - Reword the comment on the skb free: a descriptor can complete aft=
er
> >       TX NAPI was disabled, so "never transmitted" was not always true
> >       (Sashiko).
> >     - Say in the commit message which hardware the test ran on.
> >     - Kept Jacob's Reviewed-by, as the changes are small; please say if
> >       that is not OK.
> >     - The hardware test is v1's.  The changes since only affect the
> >       failed-reset paths, which it did not exercise, and how the freed =
skbs
> >       are accounted.
> >     - v2: https://lore.kernel.org/netdev/20260930133851.663023-1-maimon=
.sagi@gmail.com/
>
> [...]
>
> >
> >  .../net/ethernet/xilinx/xilinx_axienet_main.c | 26 ++++++++++++++++++-
> >  1 file changed, 25 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/driver=
s/net/ethernet/xilinx/xilinx_axienet_main.c
> > index 09443623a3e2..c88c671f8b2d 100644
> > --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> > +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> > @@ -186,11 +186,34 @@ static void axienet_dma_bd_release(struct net_dev=
ice *ndev)
>
> [...]
>
> > +     lp->tx_bd_v =3D NULL;
> >
> >       if (!lp->rx_bd_v)
> >               return;
> > @@ -221,6 +244,7 @@ static void axienet_dma_bd_release(struct net_devic=
e *ndev)
> >                         sizeof(*lp->rx_bd_v) * lp->rx_bd_num,
> >                         lp->rx_bd_v,
> >                         lp->rx_bd_p);
> > +     lp->rx_bd_v =3D NULL;
> >  }
>
> The added null writes makes me think that centralizing this code and usin=
g it
> from both axienet_dma_err_handler and axienet_dma_bd_release (instead of
> repeating it) is a good idea like I mentioned in the last post.
>
> The code seems right tho even tho I don't like duplicating the logic.
>
> Reviewed-by: Joe Damato <joe@dama.to>

Thanks for the review, Joe.
Agreed on the helper.  As on v2, I kept the fix minimal for net, and
will send the helper to net-next once this has reached it, with both
axienet_dma_bd_release() and axienet_dma_err_handler() using it.
Thanks,
Sagi

