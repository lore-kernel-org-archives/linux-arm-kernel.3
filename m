Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF926C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 11:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C4dED4f5o2myIqCG1VHhBlhf99ylae4Dlv7pmEi0lts=; b=cKaLlG4pA72QtzuU6TRvuIMeOT
	5MU9FAtjTnqixANJV9FY8p6JEz91+9/hhcaC6khSvXiSmGIgVezn83LRyEh9vGStgAM8FdjN23pc2
	ZDpxecofJPE6GhtQBojxlB73vfAf8KZ1ozFAAkNa/ALCFKNE5rgAKgucTLS9tMZ+BLZk+Dg8Arxyz
	ju1Eqo4VMa50Gcl9yK+OiS/BRihQowVBs1P8YulJallzBBqmxHcO6bVqQC8f63AM4zVWRjjhWLn4N
	CdplqoBjr6cvr85lzahD5uU9hRNZGA6hUOpx6PXh4C6k+X8ZbS2d/UwQ9zN7kYaVyBcHIowZ6m7Dy
	3+QnMSbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcjT4-00000004jaa-41cW;
	Tue, 28 Jan 2025 11:09:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcjQj-00000004jJ0-3g9j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 11:06:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738062411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C4dED4f5o2myIqCG1VHhBlhf99ylae4Dlv7pmEi0lts=;
	b=T8XAQtapxipW2Puw/vpggNiBpMPuFtJjg4NJUV/5i8KwoFrg3PzXDa5rNrjheOx2DhMX/o
	xf4M8mSDldQ5cjVYv+f0bUupjoOVnJ3p7apcEE4iAN6YhkPx/D0bu07oOGd+29iOod13WZ
	v7MU5P0fewNSPSz4Hv2htPS43oRIthM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-ctxGTI7PNJqcMeb3R35saA-1; Tue, 28 Jan 2025 06:06:50 -0500
X-MC-Unique: ctxGTI7PNJqcMeb3R35saA-1
X-Mimecast-MFC-AGG-ID: ctxGTI7PNJqcMeb3R35saA
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-436225d4389so30623085e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jan 2025 03:06:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738062408; x=1738667208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C4dED4f5o2myIqCG1VHhBlhf99ylae4Dlv7pmEi0lts=;
        b=Pode5RvNivY+Yuk5YM0uN60fx8b6mSbxYEu/lRtJi4hoBEmh4MFJiiu8BSkKOPmXL/
         QtfvwVrbefGHV/RdzR4mRlWZ+GPHrOgbpN/+99oaQZXdf+GgyoYkqT5iihYz05X4nEia
         +kSUvdUKvG4yMCKJ0kwsjJmndkf0sTpVcmupnjh2U2iTI0u0Y+eS9KL08XHYw0Y/CrPk
         L66ROdiSrTOHNJF20SDjypmPei4c7/NxOQVElBzrfebPIByCu/hpGxCI8jsveA7lfxwc
         vP8VuF0T0NghVdiLWUCefd2/pp7+965AfNJlpq6NjEi0/Zq72Zoe2zUJox1MKiw8pjtb
         Fe2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVmj8Eo5/VUEf7sXpgdqsNOWODrph8CGK8STuUuwyGrvPmd54hIzGkAiAhXgF1cS178ys7uV4SbpTTAYmWP6gSK@lists.infradead.org
X-Gm-Message-State: AOJu0YyOCBPKbX5pf4Rymuco/hCz1Fu6kKmPWOj1GS7qKeaB+T78K9Lw
	45GGl4Jd/2eJmL4DqNldW4s+i0SZnCXEOXmdDXa2ShyqcPx45nnEQaCRgjGu4DuHKeFk0Sy/ZZF
	7WCGQhEvfsoDzHnZcxs2oUWlPSzkzJ/M6VCgFkyxlDZpR0G2Utowe70iyg7DOW2LmmbKwwSPuYO
	YYYb3k6P/W+p0RNvxsM6vM7vd23wy5tC0NYMr3C5qNFSqshP43jwhwdIPbAfcF
X-Gm-Gg: ASbGncu/BCj0QS4sGNk40H7z/o/2vTTGqE2Vgcovm8ibGJMWdEo3THz/fOKuCiT+05+
	opgolOZZcEVuZL+USlAUp99BUG8uS8EW1yS1yFqikhP74YtD1rdml+GJNW5XW0A==
X-Received: by 2002:a05:600c:46d2:b0:434:f1bd:1e40 with SMTP id 5b1f17b1804b1-438d596d1bamr21290475e9.6.1738062408493;
        Tue, 28 Jan 2025 03:06:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWyWVs2N0UuwfaV3cDUVKifXy8RbfG0lA/v1j3PLyEEzHNjGObyJNKJtrazg9HHmaq51oKRWzuY/Pb4n0MEFE=
X-Received: by 2002:a05:600c:46d2:b0:434:f1bd:1e40 with SMTP id
 5b1f17b1804b1-438d596d1bamr21290295e9.6.1738062408203; Tue, 28 Jan 2025
 03:06:48 -0800 (PST)
MIME-Version: 1.0
References: <20250128110151.GA26808@willie-the-truck>
In-Reply-To: <20250128110151.GA26808@willie-the-truck>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 28 Jan 2025 12:06:35 +0100
X-Gm-Features: AWEUYZlVbEx4ODVaL0eLIv5X-7deZvzPLUxZMEPJ9VphX2T09DZlOXxnNGh0z8Y
Message-ID: <CABgObfYePuasEYAeC5NK2vNrNMAJ7b2GrGmyah9koAufZ2fayg@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/arm64 updates for 6.14
To: Will Deacon <will@kernel.org>
Cc: torvalds@linux-foundation.org, catalin.marinas@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com, maz@kernel.org, oliver.upton@linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: E6Acf0j03-fqD8-035SBBcNnHnn-N12czplFMW049WY_1738062410
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_030653_986958_D1D98EFC 
X-CRM114-Status: GOOD (  12.16  )
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

On Tue, Jan 28, 2025 at 12:02=E2=80=AFPM Will Deacon <will@kernel.org> wrot=
e:
>
> Hi Linus, [+Paolo, Marc and Oliver]
>
> We've had a slight hiccup with the KVM/arm64 tree targetting 6.14 in
> that Paolo mistakenly forgot to include it in his KVM pull request [1].
> I understood Paolo was planning to send a follow-up pull request to you
> yesterday but, as that didn't materialise, I thought I'd better send it
> via arm64 given where we are in the merge window.

It was ready to go from my side as well, but I have no objection to
Linus pulling from here. My apologies to Marc, your pull request was
good and timely.

I had a couple more x86 fixes in my branch, but at this point they can
wait a few more days, in case I get other fixes from submaintainers.

Paolo


