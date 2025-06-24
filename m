Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC9EC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 20:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V4OKSfi2JlQP9gCOB1g33RXWpet7pQAnqDSDRV/9A84=; b=fMRSB7kSyLggGvoenGDID2lmWs
	uEf3px5G6wylwC7A+ez49XmfDrc4HkcbqntBwbrcaTs0ja8QxVMqjw9gaDY8iuLTxbuPKK587V3FA
	oO38+TPgjOrJ857rji6/UVeOraGtGknIoWrNZEvsQ31nEL1oXqseD3/nSPWJ7o/UOrSOdgn2lmiKm
	dsGA63DEYrvAVR9k6sMSbuOJlzwER0QCqi8jniYGDTSvUL0O9myv/H0sUCIMATACEQU7sJ4B9ICLy
	kfoNVLhTYCiMiExX9KckEktxMqXBBQgDHzoapIhz+pk5gsdA/Pr5mEV6DBM8yY3aHsO2ig47+qfBp
	p/mnJ93g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUAKZ-00000006mNR-35e7;
	Tue, 24 Jun 2025 20:33:23 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4EA-00000005oxn-0cdF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 14:02:23 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ade5a0442dfso86124966b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 07:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750773739; x=1751378539; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4OKSfi2JlQP9gCOB1g33RXWpet7pQAnqDSDRV/9A84=;
        b=nQCU6kBWoL5MWSKGfHeMVK4C4l5hWSHOY2ziouk8A54vqXpxQODrdo0GLrpJnoTMih
         nNS31kIJpU3LqylcEPLVtCGvUUvDq//GDcGZpdB0v474txP7BVt3W5KhjAr6EVpkVmYL
         cFguz6gLIa+EneGbq0df9gZ5pxuA7/FXetijdBz9uAQ8RrSOQBLmXh/+5TlCXlaMGuFv
         Q03uqKOe4DJ6EkZ/pJYwrawk4ZJNCH4WC3ue2tYVbMB1BKcaCgXSo0S0m9Pny1hnFxTw
         B5G5W//5vntGdLVQJ9xvcXEppiR5+h5Lz6j2vXoLL/KTnBA61NnwSLjxay8HyuZoa+h7
         BhmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750773739; x=1751378539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V4OKSfi2JlQP9gCOB1g33RXWpet7pQAnqDSDRV/9A84=;
        b=uZyFSN8o6mM4FhZQNKYp8hOrBLc+wlvrCzFUoAxIamu74fdn7iILiZZU63ONvN/w8m
         MUFS9Shsy0G/tP474OPvQSNCnOPG1k80BniMus348tNSusXPg7EbultzkhmOKVZDF+Su
         TmH8RXEys7na3Sd4A+4gJgqD8wfJl8DJVagMcgoU+qSAZKh1cWTyXd+XjtSMC2R7GU4X
         MjJ/ybgfZbsz2ZcEPNlL3nIJG/urM+PjI/nqlM5nu5lk8K4s7XOhzr85G8woUP8SIYf4
         6jqfZlRsPBKldfq9phpvDpPLIfwEnO+nll0ZseF6cIE9sQuaMiDcSDFGj1Nfq1psY4vm
         Hvsw==
X-Forwarded-Encrypted: i=1; AJvYcCW4uDXx1e1qPPSDv4GfEegklyZNlzhKVjYZ166fDfWYSIfZmpP2CfeAgcSrqOJQPFTvfsDGZT6nJEK8OcD7GwB7@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9wcBE2XPAoj8Q93+EncD47A2kwTM1jSGyJkoYNQmNtTQ/yIvd
	I7oGNr+7+fiJrGHtJuuTNEZBSgWxQNpYJeP0Fhwu+cPbQwEL53Afbz4QZ+s7vZWPWF6LDj2JEW3
	DRh+hXxnaHwrmDcANrccbAyrfrKZAXZM=
X-Gm-Gg: ASbGncs75ocTEJYneokXj1A/fHC8V1IOKFApPJh0PIcMevb7M5h9qdOWLZtL28UAfLB
	2qdRd6u0ClRfWMFJ+y4e3UJpYeQnr1ve+2NxRGE4kbAmbKoFLSRG5dpG++IvwMNRFoX9/T5OTkc
	6yUhWdlXhl4OP1zw6gYpEaWEM/8hiRRbHVxl0TxsamVoo=
X-Google-Smtp-Source: AGHT+IHvYdE39EACJnF9L4Sa6mOr/QWcWxmXCZeLqDnLCkc5ExYvVVhUmUjlf0Ams2hNBk7cPyvbicFqdWi87MZP4js=
X-Received: by 2002:a17:907:da16:b0:adb:41e4:8c73 with SMTP id
 a640c23a62f3a-ae057bbd05fmr1741628466b.55.1750773738471; Tue, 24 Jun 2025
 07:02:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250510125948.2383778-1-xavier_qy@163.com> <99a0a2c8-d98e-4c81-9207-c55c72c00872@arm.com>
 <CAEmg6AUBf1wVjXSoqBseWffLbixUV7U-nY52ScKCeNXwrkBcqg@mail.gmail.com>
 <225fd9dd-2b97-4ec6-a9a6-fe148c4b901e@arm.com> <CAEmg6AW0ZoKf_8XK7EjA2sE6HEL3Tneg7-CKakTNdgZrd585Ng@mail.gmail.com>
 <20250622153410.1f74305615cbd089fcf943bb@linux-foundation.org>
In-Reply-To: <20250622153410.1f74305615cbd089fcf943bb@linux-foundation.org>
From: Xavier Xia <xavier.qyxia@gmail.com>
Date: Tue, 24 Jun 2025 22:02:07 +0800
X-Gm-Features: AX0GCFv3xGvkBtHxkXsYG0Ch3iAgAYZu6lie4hi2FnohKkQq5kO8wLkkg-uO8OI
Message-ID: <CAEmg6AXjb08+6f0YQGi=p72PWJJWmpGNeXU5Nm5rjr3RRMbgug@mail.gmail.com>
Subject: Re: [PATCH v6] arm64/mm: Optimize loop to reduce redundant operations
 of contpte_ptep_get
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>, will@kernel.org, Xavier Xia <xavier_qy@163.com>, 
	21cnbao@gmail.com, dev.jain@arm.com, ioworker0@gmail.com, 
	catalin.marinas@arm.com, david@redhat.com, gshan@redhat.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	willy@infradead.org, ziy@nvidia.com, Barry Song <baohua@kernel.org>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_070222_185504_B9870E6A 
X-CRM114-Status: GOOD (  11.34  )
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

On Mon, Jun 23, 2025 at 6:34=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Fri, 20 Jun 2025 15:56:55 +0800 Xavier Xia <xavier.qyxia@gmail.com> wr=
ote:
>
> > May I follow up: Does this patch require any further changes? Is it
> > now meeting the merging criteria?
>
> I think a refresh/retest/resend would be best at this time please, help
> people take a fresh look at it.

Okay, I'll try sending a new version. Thank you for the reminder.

--

Thanks,
Xavier

