Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37E1CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 10:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L+0aulJsKApTkmvzLBaKjR8wqqZe/Gm2cYIiLhYavTY=; b=FyLoYZ72iC4HbEml9fbIqn5Etg
	lN1GZPDKjsJleC8eqpi5JqOiWs6J9e6TKoToRGji1bW6NH8Gp+L4HvBTpmP0Ax+2NGDHRVPD2x9L1
	+wYM1KlWgeFeu9Jf7/mpkOuyZ0gXp7UfHS1yudBz4fBTsSdmsJ8Wk5Du3I16eVRkhQbDArT6voTD+
	RVdTUaG0aNIqgoUakmNKUr+4OmxllQ2wcI5URoS2G5hJcq30+1ESbtX8tK2WgdgPPn2Q3fRFx8uby
	04DLqHBrN/YgEA2hDW1MMduk7Ll//6VFM4SFjFXPjGbNGb1u4wd7r5JB0tgDmKXJieWszoMlz/UA+
	AX2D/q4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtnS-00000005Mis-0OwI;
	Tue, 09 Jun 2026 10:35:02 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtnP-00000005MiB-0v46
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 10:35:00 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2bf22c18ad3so503195ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 03:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781001298; x=1781606098; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L+0aulJsKApTkmvzLBaKjR8wqqZe/Gm2cYIiLhYavTY=;
        b=vVJnbVFF4yfTmWoTBzN/xAoEWvEj4Jefd4RLj4KfBDc8BU/b5mceLXfbGqlXP4HQky
         aghtgdRPTwZqSzuglhsH58ZHcjLdNXuhsjQhu8VjmVCOnavL3Bj44+Ho8hprYs4LLv5R
         DmmScNB2L1O3saydUInJM86TSLTEyguwSJK09gCWe2VZgUqbU6xcMIEVdA9xu2087XKQ
         5SUP4PJBVvqsjEGzBMidq4tc+o4T7zChJsPB5MXo3m8c6vpw5rKkHn53C+46vvDlNpWA
         EffsXdsR+88CgeP3UWdEFJbck0JzoY9ZGTimdDxL/vaWMtv+xpwmaRIOcbmJooLsAuy0
         ViJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781001298; x=1781606098;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L+0aulJsKApTkmvzLBaKjR8wqqZe/Gm2cYIiLhYavTY=;
        b=jtZ1aZrtDHwf89Peu3McscW7qt4Mp76xK6VRoP25YrAs7igTjeBccok6pfR47E+Ptn
         +PV1Wp5Q+mNXeKdPiBihVrmsiyRNTSGr0foBnxpah5T37KXHPGV1Bg833npLhzAAgp2m
         6JtJTfTWU3ECXAvtXTb9KA7P5xCWVdV+XItDbZPCnm/aGCrHOGGD+1weJgUGCBvKhoVN
         U6XM5rVBroFVMhnUSuTgE4taaDd8g4S15QWhEINM/etkDvEkeSJpr6K86Gm2EBAKcS5I
         bcaCXOJWFwu4GxXu0kDeQzmVkKkrTLcWuq/OT/GG9k4fl11q/rwWJ9oQAY3jNwQTKwki
         NwSQ==
X-Forwarded-Encrypted: i=1; AFNElJ+8RHyu1cTrTSn/MOKdHDajM+MYw9y81RK/7kD8kC27/E7V6IoZ9VdRjOGaEO4t7bpnIg07dJa3UcgGA81ryp4f@lists.infradead.org
X-Gm-Message-State: AOJu0YzfoMBQTcj4Ir+D0cjEXVuIlIM3VuUFiTxafkPp8MYyYaiAKJfi
	7WYLKkCefcIrUwgvNFhZ8eXH19zDlD3VuCPqYN4ZiYAnGx9cIlDjqXGExxlt5w3Hxg==
X-Gm-Gg: Acq92OFNgcEBOiJ+mAok1Gg6a6dI9K5jDSGlQLPKIWpK/i6eirds0+fbvhzqccmYYl3
	tSp1vcoLKXNj9DwrUx3yDphIdOouNjhcYaujx/RX13dKR9R3Q2ongKOMm94lcn/snKkjUuf3nXg
	U4Zut8Sq8PluZO/m4dOYoLCgqdAM6drBMdLacGHFbEpsof3m6J1/uY5FzAvXfEnarxuDvirdTGg
	4pGEfLxqyz97JSqEvm2h7VZq4Z3hR6xmaKy/7SSPvnN27PVIWo8Xdmfv7nsBf+kLUk+IyWFByV5
	qwQxJT9CymuHsFyIZGLmUDM+SSeSeTtf96/NFEl4EXRPN7oiBNA7E1LHSzBMGh4xSEjUWlFbiWR
	0y2r/ectScQBgKQcyIrz++7PN0tWGhJwVjCLQ4Pl0kA06iMqzur2CdKVmSlivWKa1j87C317FW4
	819sqTugRLheLkKJYqY3rW8l4g1E6KKsPwl5CDXX5gYtHWayr703JyKwrVjwQ5ue+6jwO6QSw=
X-Received: by 2002:a17:902:e5d0:b0:2b4:58ad:e987 with SMTP id d9443c01a7336-2c1eb6258c0mr8084515ad.17.1781001297678;
        Tue, 09 Jun 2026 03:34:57 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282220d1bsm22390753b3a.12.2026.06.09.03.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:34:57 -0700 (PDT)
Date: Tue, 9 Jun 2026 10:34:51 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Daniel Mentz <danielmentz@google.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 11/12] iommu/arm-smmu-v3: Invoke pm_runtime before hw
 access
Message-ID: <aifsSxEXX64J1Etq@google.com>
References: <20260601215909.3958732-1-praan@google.com>
 <20260601215909.3958732-12-praan@google.com>
 <CAE2F3rCPgnFU=d5At1zrOLhsuVEbsweogOHGz9gDddRx73zRtw@mail.gmail.com>
 <aiEawEFsnG-LIahW@google.com>
 <CAE2F3rAWZ4Ac23D8eyAHfmaVVkHv8pz45+_dpMO1M4D7+RVCoA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAE2F3rAWZ4Ac23D8eyAHfmaVVkHv8pz45+_dpMO1M4D7+RVCoA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_033459_588950_D1FBFF28 
X-CRM114-Status: GOOD (  44.78  )
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

On Sun, Jun 07, 2026 at 03:22:19PM -0700, Daniel Mentz wrote:
> On Wed, Jun 3, 2026 at 11:27 PM Pranjal Shrivastava <praan@google.com> wrote:
> >
> > On Wed, Jun 03, 2026 at 01:28:19PM -0700, Daniel Mentz wrote:
> > > On Mon, Jun 1, 2026 at 2:59 PM Pranjal Shrivastava <praan@google.com> wrote:
> > > > @@ -2361,8 +2394,33 @@ static irqreturn_t arm_smmu_handle_gerror(struct arm_smmu_device *smmu)
> > > >  static irqreturn_t arm_smmu_gerror_handler(int irq, void *dev)
> > > >  {
> > > >         struct arm_smmu_device *smmu = dev;
> > > > +       irqreturn_t ret;
> > > > +
> > > > +       /*
> > > > +        * Global Errors are only processed if the SMMU is active.
> > > > +        *
> > > > +        * If the STOP_FLAG is set (can_elide == true), the hardware is
> > > > +        * either already disabled or in the process of being disabled.
> > > > +        * Any errors captured during the quiesce/drain phase will be
> > > > +        * handled by the explicit arm_smmu_handle_gerror() call at the
> > > > +        * end of arm_smmu_runtime_suspend() callback. On resume, the
> > > > +        * STOP_FLAG is cleared before interrupts are re-enabled, ensuring
> > > > +        * no valid errors are missed.
> > > > +        *
> > > > +        * A lockless check is favoured here over a dynamic PM core check
> > > > +        * since the runtime_pm_get_if_active would return false during
> > > > +        * transient states like RPM_RESUMING & ignore level-triggered
> > > > +        * interrupts.
> > > > +        */
> > > > +       if (arm_smmu_cmdq_can_elide(smmu)) {
> > > > +               dev_err(smmu->dev,
> > > > +                       "Ignoring gerror interrupt because the SMMU is suspended\n");
> > > > +               return IRQ_NONE;
> > > > +       }
> > >
> > > Have you considered using arm_smmu_rpm_get() here instead?
> > > I can see two issues with the currenlty proposal:
> > >  * Returning IRQ_NONE when an interrupt is indeed active and needs to
> > > be handled. This might be interpreted as a spurious interrupt
> > >  * Nothing is preventing the suspend handler from running while
> > > arm_smmu_gerror_handler is in the middle of handling an interrupt
> > >
> > > I understand that using arm_smmu_rpm_get() also has downsides,
> > > including an unnecessary resume operation when the SMMU is already in
> > > RPM_SUSPENDING state. However, using arm_smmu_rpm_get() would make it
> > > easier to ensure correctness.
> > >
> >
> > I don't think using arm_smmu_rpm_get() here is possible..
> >
> > GERROR is registered as a hard IRQ handler, so calling rpm_get (which
> > can sleep) would be wrong.
> 
> You're right. Sorry, I missed that arm_smmu_gerror_handler is
> registered as a hard irq handler.
> 
> > Regarding the race, the STOP_FLAG is set at the very beginning of the
> > suspend sequence. If an IRQ fires after that, we return IRQ_NONE and
> > let the explicit arm_smmu_handle_gerror() call at the end of
> > runtime_suspend catch and clear it. After CMDQEN, PRIQEN, EVTQEN &
> > SMMUEN are all cleared, getting a Gerror should be treated as spurious
> >
> > That said, I understand your concerns about a real IRQ being interpreted
> > as a spurious one, and creating an IRQ storm since the gerror register
> > isn't really written. I have 2 ideas here:
> >
> > 1. We could have a "suspended" flag and check it with can_elide here:
> > arm_smmu_cmdq_can_elide() && is_suspended() to correctly return IRQ_NONE
> >
> > 2. We could explicitly disable Gerror in IRQ_CTRL write after setting
> > the CMDQ_STOP_FLAG. Even if there are Gerrors during the CMDQ drain,
> > we'll catcup to those at the end of our suspend callback.
> >
> > I'm more inclined towards 2 as it prevents potential races (execution of
> > an IRQ handler with handle_gerror calls at the end of the suspend).
> >
> > WDYT?
> 
> I'm not sure if I have a good suggestion here. Have you considered the
> following: Do not call arm_smmu_handle_gerror() from
> arm_smmu_runtime_suspend(). Instead, call disable_irq() at the end of
> the suspend handler (and enable_irq() at the beginning of the resume
> handler)?

I thought about using disable_irq(), but I think doing it at the
hardware level (IRQ_CTRL) is better.

By disabling in IRQ_CTRL and keeping the manual arm_smmu_handle_gerror()
call at the end of suspend, we ensure that we don't lose any gerror info
We catch and handle any errors that occurred during the drain/quiesce 
phase right before the power-down.

Thanks,
Praan

