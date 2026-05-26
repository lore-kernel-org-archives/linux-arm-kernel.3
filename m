Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB2FCD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 12:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YHjPWhLuYkDH4+fqjN1tzfTEtaV0zDhulaeTcgzzM9c=; b=RmWL/5jIBvdLr9KOMb2nWk8oJI
	5+QB4Gt8RcVUdkbBgs9vnWbZKCNHTbwzX7DRIGPHk8uc0tA18CWYgpYa3PwKvqqVGBZQyUNVFCXCQ
	XCDBMZ7srF2LNW9X5gdglgGd6Lyn3NeTAX/cbQg3TPSwZll9Y+7ZQkuvmEZWKT8SHLs2aX5Sbb/sz
	wizD6TZBssOAWpYjRbyBcdWxLpJi8JgmCRoP5YylV4TuDb/3c/Z+kfab7QTlkOMiNG6ZJM4O07vUj
	iZiT8gf+60eoonxi80fnG/f0Rmq4F2PTa3P138rN1IzkyVcmiopHsSrNxuNorq552lrjmeo62tVzk
	53L3t4rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrBN-00000001xE7-2RAm;
	Tue, 26 May 2026 12:46:53 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrBL-00000001xDL-0oBW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 12:46:52 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-c81086bf930so7032416a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 05:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779799607; x=1780404407; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YHjPWhLuYkDH4+fqjN1tzfTEtaV0zDhulaeTcgzzM9c=;
        b=XW9+ZB25G4IX7kb2YCKiZzuvDfR62BC74alyGdgTEs0vA9pAXxywCyhIayIyvus9T/
         iHG6ACn2qg1j4o6Al0sQnPNfFn+YEWlzAtBj/NgW+OGgwQMoHydmiwX8aGlCFA6iXQH4
         Vb5t1HFcJTGi9qYefoVWuW1CgDNnqpAZxeEjd2OKUhoKw7MhKWZKgTQgfryTNQHFA2Ym
         qrFx8K810G782M1L19s0DXXU7Zbie0iKxL6OFJzEHrX0KX2udV13LPeUhI1dMlCM7j68
         lQFH+7IOkhJRG9BqDSO1getWwc4p3i0pCv6F418Q2LzANhu5RHJfI1FXI6zMAfe54Ux1
         n7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779799607; x=1780404407;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YHjPWhLuYkDH4+fqjN1tzfTEtaV0zDhulaeTcgzzM9c=;
        b=eCUwocT4axl5Y2NmVNGMI3/PBqcwxk6oNoqA2qOiwBRwqrA2DkcIIKmzEfoE4WyFYR
         vYBtD+eCbN73/9Jhusnthz6Qc7tcx5huiDIfqG0fAiYQxT/Vqeywn7TwsYqYcdjlX0en
         c8zRu+zWzPk98iDcUHtjMUZypf7qaJif7Na5lWp7D2lCd+zRKaNYsdPppj2Xi3lh611o
         IVAd2V8ea2tZrQAmodUrxgnndRjV5oFTUeRj5XQBkomRKDyAQd+yVlCK5cElftLt1i7m
         GmZtwDNGO+lwcnMMYBMpVXaMuPEpKWCgBAIHCvrbt1qSKN6UUhOhsc/XL1mNSpxlnAfV
         TFag==
X-Forwarded-Encrypted: i=1; AFNElJ+wMWWBWQD7h+eWNS0oCilJK6dWywhH4Ii4Rn0ogQtPbNiNhgwA9OijL9AKJo2pSNXbmogY2m37AMHNYv/BNKGI@lists.infradead.org
X-Gm-Message-State: AOJu0YzB2K7HjKtXAs3O5NFBTMJeK5GnTNFaFPtVXR+IpOOZnZOR2C7D
	w/Qk6Dpdvx8bcNld4DgzJxihw6qTMA5i6B4T7rlEZ9mgnlVwOUA6sjFzfJnR0WvV1eDfjdTwbNz
	GzqKZmkHpdYr+zZpEjNWRSAkqTA==
X-Received: from pfvo11.prod.google.com ([2002:a05:6a00:1b4b:b0:82f:8e5d:a777])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:3c89:b0:3b3:dd0:a624 with SMTP id adf61e73a8af0-3b32978b421mr14638532637.23.1779799607252;
 Tue, 26 May 2026 05:46:47 -0700 (PDT)
Date: Tue, 26 May 2026 12:46:45 +0000
In-Reply-To: <20260526123903.GF2487554@ziepe.ca>
Mime-Version: 1.0
References: <20260526123903.GF2487554@ziepe.ca>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260526124645.2494330-1-joonwonkang@google.com>
Subject: Re: [PATCH v2] iommu: Allow device driver to use its own PASID space
 for SVA
From: Joonwon Kang <joonwonkang@google.com>
To: jgg@ziepe.ca
Cc: Alexander.Grest@microsoft.com, alexander.shishkin@linux.intel.com, 
	amhetre@nvidia.com, baolu.lu@linux.intel.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, easwar.hariharan@linux.microsoft.com, 
	hpa@zytor.com, iommu@lists.linux.dev, jacob.jun.pan@linux.intel.com, 
	joonwonkang@google.com, joro@8bytes.org, jpb@kernel.org, kas@kernel.org, 
	kees@kernel.org, kevin.tian@intel.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, nicolinc@nvidia.com, 
	peterz@infradead.org, praan@google.com, robin.murphy@arm.com, 
	ryasuoka@redhat.com, smostafa@google.com, sohil.mehta@intel.com, 
	tglx@kernel.org, will@kernel.org, x86@kernel.org, xin@zytor.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_054651_230652_82A67B74 
X-CRM114-Status: GOOD (  27.80  )
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

> On Tue, May 26, 2026 at 12:36:06PM +0000, Joonwon Kang wrote:
> > > > From: Joonwon Kang <joonwonkang@google.com>
> > > > Sent: Tuesday, May 26, 2026 2:58 PM
> > > > 
> > > > > On Mon, May 25, 2026 at 03:29:24PM +0000, Joonwon Kang wrote:
> > > > >
> > > > > > Currently, the only known expected user of the new kAPI is our team.
> > > > Since
> > > > > > I test if the patch resolves our problem before sending it, I believe it
> > > > > > should be good enough. Do you mean more than our team by
> > > > "accompanied
> > > > > > users"?
> > > > >
> > > > > He means you cannot send patches like this that only serve OOT drivers
> > > > > to the mainline kernel.
> > > > 
> > > > Hmm, it gets back to the chicken-and-egg problem. So, do you recommend
> > > > deferring the patch submission until we find a new in-tree user of the
> > > > new kAPI? I believe we will not make our module in-tree anytime soon.
> > > > Or, is it like I still can send the patch and get it reviewed although we
> > > > cannot merge it to the mainline?
> > > > 
> > > 
> > > It's not chicken-and-egg problem. Just always send them together.
> > > 
> > > so let's wait until your module is ready for in-tree review...
> > 
> > Since adding a new kAPI has this limitation, what do you think about the
> > idea of adding a new boot parameter to enforce disabling ENQCMD at EL0 and
> > using the non-global PASID space in that case? This way, I guess we could
> > resolve our issue without having to wait until we have new in-tree users.
> > Do you think it should have the same limitation?
> 
> No, you can't hack up the kernel for OOT drivers.

Alright, thanks for the confirmation.

Thanks,
Joonwon Kang

