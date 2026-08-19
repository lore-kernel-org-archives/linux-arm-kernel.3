Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A832C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 02:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XlDge6YxBATGKL1stOyDVziDJiwE9SDryv9ROT1M1Ao=; b=aR/P6CYFh201DXPsMulIlNRfyD
	NWbw+BWOzSBQS6V6eyEML4sqO1qPPy2nY4XdWlHixqlIJWYAC7OTQzFyv7d9zpYnLQ4PZQ4fd0ERe
	GVQDtGF0CdgRWBhQSKh4inL95/92/eQbnZ/Y+TjgevH0LPL5x1KPFKNV07tpgUUOzp8lMDErvW66N
	7HOoSE9jcczeSB7Z7xc+tjhSDjrc9IfLuI/X0H029StpiFHxVuitAqpd34LtDNCCiedKIc64y/bAn
	sNa3fUVfiRuYEyunr5BSdlwfm54t5o3TSM0fE/O3nS/CG2H54QPwDyh1Bfn5aFl3FWbhbEBXBgohE
	YUSZZPew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwVxb-00000008roL-08oA;
	Wed, 19 Aug 2026 02:23:23 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwVxY-00000008rnz-1KAT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 02:23:21 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-92e50a650a0so33704785a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 19:23:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787106199; cv=none;
        d=google.com; s=arc-20260327;
        b=ULJHtrYkce7rQ5DN73He/q5C5hf8s15YKnJg+Pb3OIeDm/MBIDONpWdipPtSQd+EG2
         3v9Ob5/4f3fhqi8MnpZHf7icmWTz4xzc99gRYpZerihuT0Dvz441qiD2zaKxQ8sl4xU2
         dqXdlE2BPXBoPCxNitClg1F7owbeFqwMMZuZ7MPWCcROf+2QbOX4LPqMPCqjgi1lzDzQ
         ZB8m8GpWfaZmEpBKHSPSgusF6VjkJdx7ll8/eMOql4WNmJjKCoeiWBjj/O7If0lCHSrH
         JGyJT9+hvHYvu3ne+OQI01SBfKCdPiE8gl63DnBEdPox8xzvp3bV17eSBt4EFjt0LaFc
         C4ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XlDge6YxBATGKL1stOyDVziDJiwE9SDryv9ROT1M1Ao=;
        fh=rvx3SKhXPcLeWLHQW0Dag/Vr0jCbRWDw709b1Z6oj2U=;
        b=a2oEH+iWA3qB+1xuJREWWnsRV8gcurb2Zc38d4YbxRYx0Jl14801PPwXrOz0/dCx7i
         vHpNxfmTizadlYbKebGCK79f9ZlLQD4araNL8rNgkTcGTuAXrGkkDRoP47YeEONFZDjh
         Ut0IWuMw3k66s+cUb+kHQgjCrfr329ME7w2VxTMQ8JHpAUVBAKPiMbQVmLB7Z+tMg/4+
         DxesP3j46T3ucYk1WHovxsjP2IXYt11ZRPeliRbHRsLZq8JCxwOpL6pcG3vEi/Ofts7t
         Hl3E/sAWZkeuvlTp5XoRycw+e0Nr7dVRkVjBXecJvRBqUOl7MUYeo8CEl1PYsdNawguB
         UwSg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787106199; x=1787710999; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XlDge6YxBATGKL1stOyDVziDJiwE9SDryv9ROT1M1Ao=;
        b=K0eRuXJ/kQvnjXATl/8oMiCRsnwZw51BdPoWs+Pb92X/WFwaWPdL6/wKsyVdNdm2Rz
         rOTGZs63oJ8LMYivhAqNSTROuKDf+1MVxHMBeqSEoPmiGCTj0PWhC9l70yHsBxSKudjx
         RTqEZgomlqkouRMOLUNukki+cxRO2eyscvxZ+WwgAkTVRTlb5Nl/L8KHbnvRzKjNzz9b
         wwDf5PdszmDdPk5N35xLDb09vF1EpGbyepZw2e6m6yup80ft5TuLwLmjl5OTZKP/X2xc
         /+GPy+FaOSnqo0GbeUqwHwQu8biNH43pHwifXO0pB394ngn9Esk/t74Ku5BmC0gn7bfV
         vFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787106199; x=1787710999;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XlDge6YxBATGKL1stOyDVziDJiwE9SDryv9ROT1M1Ao=;
        b=Jdjl393Je12NOi4okmhBV8WQekzudiAewJQSgRvAUzK6oOXPkFhQDl8Q/KAumVjoC/
         VwxQyGpbhuIZx0EfUtEEC4MpwoaKWZEC5D2r3pUCerQEQwztHXq60nQXNalnG/W1gMMh
         CYBy3R/2avasMi2XUlj/jyQ3VHTPHgR3O800vMXChzkgGuV79aPqlGuPH7mAg6rBeT5u
         eUQdPhfZ32sliMYgD6zTAzZ1FuRq1umznthTz507IWIPNC8eDZ6JJouBc3LWimkTscJI
         h8mqinzv0t/f6n4stIIHGGRTIDwGCSP6g5gkegy4wwTuoHFQpj7qrKzijBVWIosPXXXD
         /Gaw==
X-Forwarded-Encrypted: i=1; AHgh+RrDPgOOcs9XY+5Qe9PEV0wOTCCyQ2f2DVRY8IHN4+1OxrSV3y19FU6DBp9ouq95uwx1kiQWI89UvfRv5FCLVMj+@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1SYyPUJjLznOGxKr+z22e5+E062z/uikSNk+OLUhiZ9HpfxrK
	ixaZiLehi7dI8vCLX6nsSo6758Hdc4S0HcEgUQmJWDYOFGjcy7EaSXsnqUIh0GTRD2FNgt2Z8iv
	iVKQc+1b4dtxIAtL5TCC7SNhWtRatW7w=
X-Gm-Gg: AR+sD12qKvOzO4NblvU7JtPSuc+2sfk3lyLBNarRxQiIYsdr3bJfF/058wUN2axy4Ia
	aSNKeiBzPw4+uONTL70ae+l0rDcwaKVyXp16dNzd/pLiSHE5Hcxv7CEPn4SW4novJU5WBSs+PaS
	MTBFw1wBwNRC7Ys1MYdKI+NtPr8TFM9cPF7NgbCOioyWid/rxw3N5fI1YyA9m2KNwscd+6ket0z
	psBxltrNtuDwiBW08VfXx6ZSXC4Y7+UudoXvvZvwPJked9eukyGm7sTcvhHV5ofByudX98YKZRu
	0KSrII68aty1Uj3i9XIx1bBRW1MS1ElZR72pfS2SW8aR5UWVL4GLGZU=
X-Received: by 2002:a05:620a:2683:b0:915:fb92:d599 with SMTP id
 af79cd13be357-9371e309098mr170749285a.25.1787106198915; Tue, 18 Aug 2026
 19:23:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260818132722.1852876-1-zxyan0222@gmail.com> <20260818132722.1852876-3-zxyan0222@gmail.com>
 <b53e9ebc-64c3-4291-a691-5b7ddd118cc5@lunn.ch>
In-Reply-To: <b53e9ebc-64c3-4291-a691-5b7ddd118cc5@lunn.ch>
From: zhu xin <zxyan0222@gmail.com>
Date: Wed, 19 Aug 2026 10:23:07 +0800
X-Gm-Features: AcwNN1VYxdQMqp_qsHCI7ov2YZB4D2SmRdcSpzWMh4qV3ou34Io6V35sVxe_n4A
Message-ID: <CAP7veT+OwAT15f==wqmKumZnc_Q12NYtS4fJFN9X1cTRm=+e0A@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/2] net: stmmac: dwmac-socfpga: mask
 XGMAC_TSIE during cross-timestamp
To: Andrew Lunn <andrew@lunn.ch>
Cc: maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch, richardcochran@gmail.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	muhammad.nazim.amirul.nazle.asmade@altera.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_192320_367242_946336C2 
X-CRM114-Status: GOOD (  20.30  )
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

Hi, Andrew

On Tue, Aug 18, 2026 at 11:07=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> On Tue, Aug 18, 2026 at 09:27:22PM +0800, Zxyan Zhu wrote:
> > The Agilex5 smtg_crosststamp() handler arms an internal auxiliary
> > snapshot, toggles GPO0 and then polls XGMAC_INT_STATUS for TSIS in
> > process context to learn that the snapshot is ready.
> >
> > Once XGMAC_TSIE is unmasked (done by a companion change that enables it
> > in XGMAC_INT_DEFAULT_EN), the DWXGMAC2 timestamp interrupt handler runs
> > from hardirq on every timestamp event and clears TSIS by reading
> > XGMAC_TIMESTAMP_STATUS.  That read can win the race against the poll
> > loop, which then times out and makes PTP_SYS_OFFSET_PRECISE fail with
> > "Wait for time sync operation timeout".
> >
> > Mask XGMAC_TSIE around the snapshot trigger and FIFO read so the hardir=
q
> > handler cannot clear TSIS while smtg_crosststamp() owns it, and restore
> > it on every return path.
>
> Did you look at the other system which implement crosststamp?
> dwmac-intel.c? Does it need similar changes?

Yes, I looked at dwmac-intel.c.  It does not need the same change.

intel_crosststamp() sets STMMAC_FLAG_INT_SNAPSHOT_EN and waits on
tstamp_busy_wait for the interrupt:

  priv->plat->flags |=3D STMMAC_FLAG_INT_SNAPSHOT_EN;
  ...
  wait_event_interruptible_timeout(priv->tstamp_busy_wait,
                                   stmmac_cross_ts_isr(priv), HZ / 100);

and the generic timestamp_interrupt() early-returns when that flag is
set:

  if (priv->plat->flags & STMMAC_FLAG_INT_SNAPSHOT_EN) {
          wake_up(&priv->tstamp_busy_wait);
          return;
  }

so the Intel handler never reads GMAC_TIMESTAMP_STATUS and does not
clear TSIS.  Intel is interrupt-driven, so it depends on TSIE being
enabled; masking it would break the wake-up.

socfpga is the odd one: it does not set INT_SNAPSHOT_EN, polls
XGMAC_INT_STATUS for TSIS in process context, and sits on
DWMAC_CORE_XGMAC -- the core type this series newly enables TSIE on.
So only socfpga needs the mask.

That said, the cleaner long-term fix is to align socfpga with the
Intel approach: set INT_SNAPSHOT_EN and wait_event instead of polling.
The trade-off:

  - Masking TSIE (this series): minimal, keeps the poll loop, but a
    local workaround for the XGMAC hardirq-vs-poll race only.
  - Intel pattern: no per-platform masking, similar across XGMAC and
    GMAC4; but a bigger rewrite -- stmmac_cross_ts_isr() reads
    GMAC_INT_STATUS (wrong offset for XGMAC), needing an XGMAC variant,
    and the poll becomes wait_event.

I went with the mask as the minimal regression fix, and can do the
Intel-style conversion as a separate follow-up if preferred.

Best regards,
Zxyan Zhu

>
>         Andrew

