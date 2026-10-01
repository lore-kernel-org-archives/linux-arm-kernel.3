Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B036CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EU0sYZ/FO/mx2+yJVtb2c4Or0T6adefpzzLzs+MHc/0=; b=v9FTO1W/RpfQFyjgvspJzuB3ZY
	EsNClPBn/7wn4Du7rMyQTa6NiaygvZLBzFOTycPeGcLEKNRBI3AcbsYo4Keg7iJYCIkyMwqneXxbj
	FCNhup5Q/4cpsN9e4CBnkTgAsPz1u7Z18wgKGadyhRIqnzDEU59dEXR0xNRWPGL7PqmxHS9+ejbS/
	eCklXDBN+yijCYqgP7kbe0fnemllwGOIiNGPZsTlEeoPro44OLE1r/CfXufdSGIZzugjyCZyYnnH8
	PNWXlL4URfIr3ec2h95FKJLw/k5b2hRl72ygMHflW+QNjiAaXpcpogbNcEVNN8TtDZC+zwlSSDIhW
	pICzdGIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCCL-00000008Asx-1VHu;
	Thu, 01 Oct 2026 08:31:25 +0000
Received: from mail-vs2-f36.google.com ([74.125.227.36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCCJ-00000008ArZ-1zhZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 08:31:24 +0000
Received: by mail-vs2-f36.google.com with SMTP id ada2fe7eead31-7ba698eb7cfso995942137.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 01:31:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790843481; cv=none;
        d=google.com; s=arc-20260327;
        b=OO4MShhn5ilNAU/qOCZrrO3qDUGzXbcrILt0CD9Wv+dQv7qEmHYlg4t3zacAr2gRqD
         /E6czXQpkyccGqYdLjCJ0KZXlw1kZrJ8fsOwpXegiudVpp8wJPbsN/bWtkxZ+DdmX7Vz
         d2yT3WeBv2Dy6d/BqUbP068jATs+sICi0eB55wI9SAtP1SyvtPQi0TEnhGNiS+qe+1ji
         d9Pwu8z8o1T+0QpIc2PvwimU6V0PRFu9UhU4C+6Fg59GD+57z2CHZ75kPzwlu4csT9uB
         HEVQryxsgA8cQzavdjeCSDs9abcv3cHWsJDS2wITwhpWf1o1c2Ff1lHJ0zd6ieOokUn1
         hXYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EU0sYZ/FO/mx2+yJVtb2c4Or0T6adefpzzLzs+MHc/0=;
        fh=zmsJ06Aiu8uF4gAuT70+TPM9HfRF1Moc7IgQ4U3G5so=;
        b=JtbNsChfdpjxI3EYpVX75Yr3a2R7vIrn0WLekLtANmYZzTVRqz9ZImGd84JWjCFV+t
         Yse0QbOXLsBh4m0cYwyhxRWiz/7vts48iN+T8ZcFuxZX2nkjUyOxCLt/2xcmlMmMQBH2
         JBXEe668wrpoltopCAkdmsFS2kSgoXIyOzDymoRPKM62sBY7z5Oe2BP33dSnbcsK3DSY
         1xdfgTCKj3DBqY6KhdHPhPtzoaorW7g1rzMIb8ga7YF5aOeJhGHe5m6mQ+GU/r8nUAax
         v/zBGvp6h7mpSwbStyfermyOrBGqZ34UY9ikKzKPo74bKgBsNDcuCJz53WyWqXuLz2ym
         wKhw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790843481; x=1791448281; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EU0sYZ/FO/mx2+yJVtb2c4Or0T6adefpzzLzs+MHc/0=;
        b=Y7jSPw5xXCzFl2N45znrE7q2rdgHlzJrPZRXw5HuUK9EHD1lCrqX2yMjr3k8oybCLN
         twgEXkJmEXrUFZdkhq/GtfsCEl5IUem9AjtReBY2KHgTF/d++YHQxUxF9CvxzccPiEuZ
         G5X0hi5U3Pg2jLvIiJ3+PrJApzFTwqi/ZmTomonEHJoVorGbdwOr924p7Sr+q8Vss1BV
         GoUZUJf6Q/z/gG1p6Fgj+b+/ViiQYQ8YD0LfQkTAIcv972XiWrebRqYBthtM0MkMz3TI
         RByry4+mhOGbRiWrvM3aT4D/mYQQldfA0IBS5DNFEWzCyqZPsjyOAeYRYbUS58rM5A3e
         xBJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790843481; x=1791448281;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EU0sYZ/FO/mx2+yJVtb2c4Or0T6adefpzzLzs+MHc/0=;
        b=otv0cr6qckrWocDW73Yurc2lm+1Fsmo0t4ZTNVctFZ0RDFe1lLMOR3q0qS+5ZXe5ek
         +USeMj/juMw1MA/vgDSrqCSgqwu7kDrMKUB8JPubYCTpHb4LYx1m0ZxwW6DI4RJBttgG
         CzP+htcVr+mBl6Sg4/0+AMrVB20sGZy4dPXowwfbbu4dEn6+xTSt4VAqifR/faUEOWPh
         WOm/AGY1RRI198rz7GpdjmojpUTiuwqA2wFLElSaikrmHPjsNOr6b03uKXvVgYecNVLW
         kCZ0y7qM8gbNtPUhTFoLGSRYYZaYEb5U1NMzTSSaP1KuGbAj5uw2fZDHiqklMV7cdcTr
         CH+A==
X-Forwarded-Encrypted: i=1; AKwUvByTqYNWJ2eKs6b1pRwa/ujsv+qXDyuwqrXLK0or7P1/7rJ+gqFfDFGO343EHhCX3nryK7mRYIkwxNRDG6gfvaiJ@lists.infradead.org
X-Gm-Message-State: AFq9FYLWm7UXaWHlGoj/IfNpoSWTFNgSVGAqKN94OPbdyiVNisw7Hgoa
	jnZovRFkvf9Bi+VP0q2Pj67t+x/YU1TFUib789ZEFEPzL1ZzPrTFtQtxdpif0A2uaa8yMbqf0Am
	LiSB/7cvPi+2ue9erQRye/qZ3jHYRcE4=
X-Gm-Gg: AYBFou0JRUdWGCH8nR+rId3M4phuU3u3dr5TgSLgCqKYuZVGgiIR0PTel6SH3Ef6SI2
	+bJFERjCrtZi6m8wi6Ru7i8SoOWVu5kVjCjZ+n1fsKc/yzrYVY1XBuKZyOmXToRKE6AXl3bLjf/
	gLEDO9MN5LrZNXbznPdoeD8zUlXkL6rLsCVw5i/zTwdI08c5Oa6imwFaXwW5uMGW3M9u03QFplb
	Kap+80NfsLhw0zFnwLHQDqx0b8oBBsvBhouFylRSY2rDPrQFH06jABPMlmIZAsrcbJ9+e/UK0Do
	7tdgawHGjzKP+6bxTfNvfTt9W0nyPwd2WGSmO+KIYwosb6F5FB6XpRlHmz31fvD+cvOFIYF7XKt
	MX1PtQ0hs0tbP7Wcjylosj/PLpUvEvwPF5SbLQblxr2HQc+uzObshHt+6u/N0r6eITWmR2Ck6KB
	UZpRs6wVz9I2kxTHNXzPV2m5mK0sx/kebzmYvcEL/o4pjp
X-Received: by 2002:a05:6102:3fa3:b0:7a7:198a:c2bf with SMTP id
 ada2fe7eead31-7be735975ffmr902214137.29.1790843481357; Thu, 01 Oct 2026
 01:31:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260930-stmmac-est-reapply-after-open-v4-0-9d4366587b73@gmail.com>
 <ar4QgHsclh1vWVHk@lore-desk>
In-Reply-To: <ar4QgHsclh1vWVHk@lore-desk>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 1 Oct 2026 02:31:10 -0600
X-Gm-Features: AclHuK_sh2_y0gAgCI9ChdR_dvfCKXwH4PgjB21fl6342cXclcDVA9-LiyvPKRI
Message-ID: <CADvTj4rxCuL-BNq1P3KW=1m==0PDMvn7j1=J4WW1yZLJfw5DNw@mail.gmail.com>
Subject: Re: [PATCH net-next v4 0/4] net: stmmac: preserve and restore the
 installed EST schedule
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Jose Abreu <Jose.Abreu@synopsys.com>, 
	Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Simon Horman <horms@kernel.org>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Richard Cochran <richardcochran@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, Rayagond Kokatanur <rayagond@vayavyalabs.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_013123_571235_C1AE0F3C 
X-CRM114-Status: GOOD (  35.52  )
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

On Thu, Oct 1, 2026 at 1:49=E2=80=AFAM Lorenzo Bianconi
<lorenzo.bianconi@oss.qualcomm.com> wrote:
>
> > Continue Lorenzo Bianconi's EST replay series with v4 of the unmerged w=
ork:
> > https://lore.kernel.org/r/20260902-stmmac-est-reapply-after-open-v3-0-e=
72a6df5a7ef@oss.qualcomm.com
>
> Hi James,
>
> My plan is to continue working on this series (the code is available in [=
0]),

I compared your b4/stmmac-est-reapply-after-open branch at
e7a2792034e0 with the EST v4 I posted. The first two patches
(embedding the EST state and passing an explicit enable argument)
are equivalent apart from the additional sign-off.

The substantive differences are:

1. Preserving the installed schedule on replacement failure

Both versions validate the gate list before modifying the installed
schedule, so both preserve it when an entry fails validation.

Your version then overwrites priv->est before programming hardware.
If EST programming or preemption mapping fails, it disables EST.
However, TAPRIO keeps its previous schedule when the driver rejects
the replacement, leaving the driver and qdisc with different state.

My version builds the complete replacement in a separate object and
publishes it only after programming and preemption mapping succeed.
On failure, it retains the old configuration and attempts to restore
it, advancing the old base time by whole cycles against the current
PHC time.

2. Restoring EST before starting DMA

Your version starts DMA inside stmmac_hw_setup(), before PTP setup
and EST replay.

Mine moves DMA startup into the open and resume paths, after those
steps succeed. This keeps DMA stopped if EST restoration fails. I
wouldn't claim the earlier ordering necessarily transmits an ungated
packet, but the later startup gives us a stronger initialization
invariant.

3. Serializing EST across a PHC time adjustment

Your adjtime path releases est_lock between disabling EST and
adjusting the clock, then reacquires it for replay. It also ignores
the disable, clock-adjustment and replay errors.

Mine holds est_lock across that entire sequence, so a concurrent
TAPRIO operation cannot replace or destroy the schedule partway
through it. It checks the errors and attempts replay even after a
failed clock adjustment, while preserving the first error.

4. PTP prerequisite version

My series uses the newer PTP error-propagation fix already merged
as 8181678a92f0. Your branch carries an earlier version below the EST
series. The merged version also tracks PTP enablement and handles
platforms without a configured PTP clock rate. This is your newer
upstream work, rather than an additional change in my EST patches.

One limitation of my version is that rollback remains best-effort:
if restoring the old schedule also fails, it logs the failure but
retains the old software configuration. Hardware can therefore
still differ from the cache. Neither version guarantees recovery
from that double failure.

I'd suggest retaining the candidate-schedule handling, later DMA
startup and adjtime serialization when consolidating the series.

> I am just waiting other patches to be merged upstream before reposting in=
 order
> to avoid any conflict. I guess it is correct to publicly ask before posti=
ng
> other people patches.

I guess I had assumed since it had been nearly a month since your
last series that you just hadn't gotten around to spinning a new one
and figured if you were still working on it then my changes might be
helpful either way since I had reworked a few things while working
on a series depends on these changes.

Feel free to take back over and incorporate my changes into your
next revision if/as appropriate.

> Moreover, this is thecnically a fix so this seires should targed net tree=
.

I think the fixes you may have been waiting on are in net-next, which
is the reason I did not target the net tree.

>
> Regards,
> Lorenzo
>
> [0] https://github.com/LorenzoBianconi/net-next/tree/b4/stmmac-est-reappl=
y-after-open
>
> >
> > The PTP initialization fix from that series is already in the base.
> > Carry the remaining embedded-state and explicit-enable preparations,
> > and restore the installed schedule after open and resume reset.
> >
> > Build TAPRIO replacements separately so rejected updates cannot
> > corrupt the installed schedule. Rebase the previous schedule against
> > the current PHC when rolling back a failed hardware update, and keep
> > DMA stopped until replay succeeds. These changes do not depend on
> > the later datapath recovery series.
> >
> > Changes in v4:
> > - Omit the merged PTP initialization patch and adapt the remaining
> >   changes to probe-time PTP locking and current TAPRIO error handling.
> > - Separate schedule validation/rollback from open and resume replay.
> > - Reuse the base-time helper for replacement, PHC adjustment and
> >   rollback; propagate errors while preserving the installed cache.
> > - Start DMA only after the installed schedule has been restored.
> > - Link to v3: https://lore.kernel.org/r/20260902-stmmac-est-reapply-aft=
er-open-v3-0-e72a6df5a7ef@oss.qualcomm.com
> >
> > Changes in v3:
> > - Guard priv->est.enable update using est_lock mutex.
> > - Embed stmmac_est in stmmac_priv struct.
> > - Rework locking in tc_taprio_configure().
> > - Fix possible divided by zero crash in tc_taprio_configure().
> > - Add missing reconfiguration during stmmac_resume().
> > - Honor ptp error code in __stmmac_open() and stmmac_resume().
> > - Link to v2: https://lore.kernel.org/r/20260829-stmmac-est-reapply-aft=
er-open-v2-1-5e5ccb185e92@oss.qualcomm.com
> >
> > Changes in v2:
> > - Rename stmmac_est_reconfigure() in stmmac_setup_est().
> > - Rely on stmmac_setup_est() in tc_taprio_configure().
> > - Link to v1: https://lore.kernel.org/r/20260825-stmmac-est-reapply-aft=
er-open-v1-1-dfa80735e0a1@oss.qualcomm.com
> >
> > Assisted-by: Codex:gpt-6-astra
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> >
> > ---
> > James Hilliard (1):
> >       net: stmmac: preserve the installed EST schedule on errors
> >
> > Lorenzo Bianconi (3):
> >       net: stmmac: embed struct stmmac_est in stmmac_priv struct
> >       net: stmmac: pass the desired EST enable state to est_configure()
> >       net: stmmac: restore EST before starting DMA on open and resume
> >
> >  drivers/net/ethernet/stmicro/stmmac/hwif.h        |   2 +-
> >  drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   2 +-
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_est.c  |  47 ++++++-
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_est.h  |  13 ++
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  38 ++++--
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c  |  59 ++++-----
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 142 +++++++++++---=
--------
> >  7 files changed, 176 insertions(+), 127 deletions(-)
> > ---
> > base-commit: 1631d79ae57dce2c5f88ad278307028638a8b4d9
> > change-id: 20260824-stmmac-est-reapply-after-open-181d70a15eb6
> >
> > Best regards,
> > --
> > James Hilliard <james.hilliard1@gmail.com>
> >

