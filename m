Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 246D6C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 21:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wZ6WGIl+AUHgbUP8huP5qzCstVAL4wh1yB31nQNV5A4=; b=Lp9v8xBbPiZQGvtcr+xs2WWNBh
	sZgEtOa6W8Acw20hpM3RMmd80c3ilLSWcYTA6zVtORnBfORpnH2JyKir370OwMsRchaq9IRW2myh7
	PkXN8UQXczGONq09Oy2qbdPoCjrJP+/Rt7ulU8WnLNQYISWCtAjGFg9wA/tJOubu/28mtwszlyGVq
	SwBzyFYE474ljK3386SlVBlO3Z/10gdEy03SH8e9oZCUeiV4xG8khmnV8pRh+tuad78jscCg5atc/
	VIeTN6qv63i3rbuyPd92XldEBY7WR99c1PIat5sjafYtmQ56VFEvwdZwpi0vu6mGYsEdAlUCGrym7
	ezLGP1vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn2OM-00000001WlQ-1ltD;
	Tue, 25 Feb 2025 21:23:02 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn0w9-00000001EM0-34RR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 19:49:51 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-abb90c20baeso773885166b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 11:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740512987; x=1741117787; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wZ6WGIl+AUHgbUP8huP5qzCstVAL4wh1yB31nQNV5A4=;
        b=TGFTt+WpMnotbz0FrfBU2ZieDOaet5z6f3Az9E3TqQzNeX6IzZOGkr29+nnGb/kgvV
         PGZPJXJtfFTX5af6X1w2MVYLEMQkwhgwnyAS2Tzi0Qi+gwGEx9Ab1rLhsZW3pbNKA8/D
         IYli12pJ5/gt0kfvgJCPn8xRo9jLbCBARhJALZqB+WQGFCn8/GpaR9hvWJ4VMGSm0dxx
         Zcv1ELdAwrMvJWNyOn7lIehjoVCc7fDZyDOPLTW5IE7s2IO2I4HzOnLKt3BnBlJyH3Cr
         TAaGkLIwSlRPSRoqwRIVjUEulQZQIb9JXkQV+ZKX719R9bjhlX6RKpdgoR2UpFeMcQjy
         Nh1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740512987; x=1741117787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wZ6WGIl+AUHgbUP8huP5qzCstVAL4wh1yB31nQNV5A4=;
        b=UYzNtv/YvgD/lo+sLk5ptGpRKTxn2hnWZK2v7po9kwOoOAs65gWgu1NnfRCJyXbt41
         d+KS0ZRukhrii19jpmdcNjcGCtnd5sWRzFOLV2AR4Dtl+BDHmbBvi/1h3PcvvrqimCaG
         ekMbkpwOGyf4c7QRBoilDY1GucatLGtVUK2IxhB80/kxFCUWLcF4iGzLBU++vT+BhTe6
         o7/OQRrkoA8RFLPdhz+meBFGLWi7ZoAExape/LGV3kB6wdkmI+E+9h+nEx04lFufLDBO
         osgTpzD9r/dmFLujrcDQWYtqJ1jS9ScxlkAd1VjuLrAC+s91dtbyQ3I301x9rXNapYm2
         vw2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWP4Fp0tijAA90zUMGVK/f2Sl/RBgPn1VHPbIqHwy6lYIjmfsUFdMh6BGhBaipRuLKgVVIQYQ14HFkFVpR7xYUy@lists.infradead.org
X-Gm-Message-State: AOJu0YzxwTXNPmS+I1jgMV/tl75e1T0S+PSu+FhPetCBra1uY4tmBTvP
	6H2+SaTdg2sCfMjN9xpa/bja/fRBJC9qxS5VracIPCX6SyMciOWpRPuQ+zQQmw==
X-Gm-Gg: ASbGncty0iZNreUiS9qVF5eGy5XzmiWk2o2pSG6vXcT9tIdrVWYChr+x+2W13X/s4a0
	sNONSDqz5N7HouDX8pZqasxOdrzacEJw12VOGpPph5PTg1gsiNxgwKbKJy2PCeGod3zBOny6b39
	IuFYTi8rXl6S4yeDs6awm6VnH7ZrUdcfqSgBVom7YxwEAPno9P4Abw6Z2I1lNRTqcJwIQ7TPTXs
	BY5uhn8RcBsgvbJL22hLWTGXymtp2iTkFuX2yKdzJjpQVs0hRPfUAO1ukPDGNuLfBAD5yIcaphP
	Fpi7DaqHGS2h9IleHkyppJ8jm0nAu/EbxJUn7MKOhOVo5X1kuBvwcQuQ1sVoIl0=
X-Google-Smtp-Source: AGHT+IE77LDENhumCNSGLklTSxZoktkRQ6fz4LwYMz58A+ZoJ1Oh18Qlz1D99LVTBsuhgIMY2PKmoA==
X-Received: by 2002:a17:906:6a22:b0:ab7:eda3:3612 with SMTP id a640c23a62f3a-abc0de4e63fmr2092625666b.50.1740512987199;
        Tue, 25 Feb 2025 11:49:47 -0800 (PST)
Received: from google.com (229.112.91.34.bc.googleusercontent.com. [34.91.112.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed205c7efsm193351766b.149.2025.02.25.11.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 11:49:46 -0800 (PST)
Date: Tue, 25 Feb 2025 19:49:43 +0000
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] KVM: arm64: Don't WARN from
 __pkvm_host_share_guest()
Message-ID: <Z74e17vBiJAgViHQ@google.com>
References: <20250225015327.3708420-1-qperret@google.com>
 <20250225015327.3708420-3-qperret@google.com>
 <87jz9d299h.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jz9d299h.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_114949_780160_6E8B90B9 
X-CRM114-Status: GOOD (  15.65  )
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

On Tuesday 25 Feb 2025 at 18:02:02 (+0000), Marc Zyngier wrote:
> On Tue, 25 Feb 2025 01:53:25 +0000,
> Quentin Perret <qperret@google.com> wrote:
> > 
> > We currently WARN() if the host attempts to share a page that is not in
> > an acceptable state with a guest. This isn't strictly necessary and
> > makes testing much harder, so drop the WARN and fix the error code.
> 
> Are you really fixing the error code? You still seem to return a
> -EPERM. I guess this was never reachable thanks to WARN() being a
> panic with pKVM?

Exactly, this is really poor wording in the commit message. 'Fix the
error code' in this case was intended to mean 'make sure to return the
error code properly instead outright crashing the device'.

Happy to send out a v3 with a better commit message.

Thanks!
Quentin

