Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99611CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 15:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5p3iIWVRp3NUhUS8ltDIPiH8ErmpKdyMg8XkHtjDt5U=; b=WMo4lYQxE7Uyr9wSNoP4SZNZFC
	6y9wLokK6JI+xM1YRrA9xN2oQ/wWE0F8vS0Ews5uq0LVYY4+WQHJLbg8sGEYJthJ+kkb6xignlwxz
	Vo59cyZynu6hIKgEOfXlPpbTPWbjrCOjhpywIv+gemLHpK4NDroHDyBzBC93PJ5dtS6kqRrfjAcoQ
	6EujHPEv0fHa9v/WaH/6I76liDuG6QFhNUmMKZaK6ezwSLhZn6XmlXUrm9noLd1LP6Oz/2fluJHyp
	jTIbug79hOPMahRxtulMuWkn5NAeylX0bUIvNt8TRU1X+R0RURM425OOPvPx1uGezQTIkiY0ihRQr
	qvUM7ScQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBDx1-0000000HRdT-1QoX;
	Tue, 21 Oct 2025 15:07:03 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBDwz-0000000HRbQ-2ioR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 15:07:02 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b64cdbb949cso938955466b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 08:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1761059219; x=1761664019; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5p3iIWVRp3NUhUS8ltDIPiH8ErmpKdyMg8XkHtjDt5U=;
        b=NUWHxUuT57RNxlyrwfB5ur8InRXjL/qB1IlPBT0ALIVybWhAXsQALfEM32AmO7YQXR
         B4d1/eTO8ydMrI/Acl1VmduMFVC1hMvHce1yCZ6K8IF5ZUhmFtPfVp5nUy7YJWCdrI9B
         LMZC3aRAEEFAvWRaBBom2WT3kzPbIEybMZY6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761059219; x=1761664019;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5p3iIWVRp3NUhUS8ltDIPiH8ErmpKdyMg8XkHtjDt5U=;
        b=o50HE1fPz7V/2n+5M9hBYV04/69HYjin590gDpwIqQYvIzvvOptXeCEOv1gVMvo46t
         1ImBvpCDwKh4SICqutmqYtZJGrEC6ZMHzjDwJ0nbzbB7Ofto7LpMeIj8RW0RsOQeQ4C2
         /U8xpNPvOJMIsipQ8bSe/rgjc1tv6/kGebsFhb9W3NdXfiGP44XL8JbgiRPm3lk5hFCw
         +ukHKLsL0iL/HQEI174+6x2VlwSSpubwOUTFPyWxWo/hftE3S35ev05EzWq82lwTaB+d
         lcvo8SgPPuXicfjsBDX/HPAi+RfP8bK2GzLkyhoFL5Vm54mAN5ekNM1CbLoVvuHFRYse
         cg2A==
X-Forwarded-Encrypted: i=1; AJvYcCUhYI1zTyLphfF9YItS+6XOHggs3hXEWPAeenI5kEPibhZqrQztQGcL8s8YRXFx3CE6dBqiCdwPSGPpCf2CiNW1@lists.infradead.org
X-Gm-Message-State: AOJu0YxC26tq9O7c0fRyZQTSd1RcMddy5W/Kr5AKMKWdKyk7MLVgPKt1
	qMxujuAk74U4jdXPUYsqvHMkxmMae5s7YgHvtAQgrNjHCMLYy2zyMCi7ZYPIa/y/xp4ZJaKGSqn
	pb76Go1A=
X-Gm-Gg: ASbGncvzyqmvAD+nCx66+0XuO+dZNiHSdFEyIy5mWScFrxNjZ7i6/0x54Id7ksm6Kdz
	ZAKi9av4fz3oOBUzToIp5MJT+rf4/xHrHNMZ5+qQRx7Gr0mqKNt2Q727edjUVxOyKxRX9xg+EBM
	fyrEVFvFq1JWAcy2HVNHVS0LfrgB4zxUi3pTwKobdDrELcVxIUBrHXQF9XYhl7kJ2VeGCDQPWhk
	T7pYnhLF6CT9Zp5gxhF8uA7KyvoTsm3WABCztiQPGFwjBmLioszoYYiNnQevSMCFjz3aIUpaaSv
	OL68iZR1YWoCLfdpFy9m3dGqiKMPY1KN1OQA/lbyQWsT/daelbNmN/mR7tHhpthwIz6pGxUqQT2
	kEV1vVKpomK+nXmZRqcH6g8FRyPWLZUwrwoJf89N+5qGTLNQ074bKu1bB8JUoPxb4AKe0dZCvxS
	gUbZvmH59o9pY5AvZdaNT2EcD6Sf5PnFeIJL6TBVy8Pf5kMFpUVg==
X-Google-Smtp-Source: AGHT+IEJyeN35m4j3UsiQDdfrZjSspFsDwWe/eb+oUajB5+8LoHbjwZlmoCnCF5NTMtJRwuWT1d/jA==
X-Received: by 2002:a17:907:3c92:b0:b6b:d71:6d97 with SMTP id a640c23a62f3a-b6b0d71825amr959324666b.31.1761059218974;
        Tue, 21 Oct 2025 08:06:58 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65ebc42bc5sm1084598066b.76.2025.10.21.08.06.56
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 08:06:57 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-63e11cfb4a9so635757a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 08:06:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUoTxKIuEUYqJoNsPfRwgstvHpaiRlIpIAlTAbYhcDCvqEZim6vT9b1FurxN60h0Ezwe6y9N0dHaAvg0Mo8aQ+e@lists.infradead.org
X-Received: by 2002:a05:6402:1ed2:b0:631:cc4f:2ff5 with SMTP id
 4fb4d7f45d1cf-63c1f6c39a0mr15531402a12.25.1761059216055; Tue, 21 Oct 2025
 08:06:56 -0700 (PDT)
MIME-Version: 1.0
References: <20251017085938.150569636@linutronix.de> <20251017093030.253004391@linutronix.de>
 <20251020192859.640d7f0a@pumpkin> <877bwoz5sp.ffs@tglx>
In-Reply-To: <877bwoz5sp.ffs@tglx>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 21 Oct 2025 05:06:38 -1000
X-Gmail-Original-Message-ID: <CAHk-=wgE-dAHPzrZ7RxwZNdqw8u-5w1HGQUWAWQ0rMDCJORfCw@mail.gmail.com>
X-Gm-Features: AS18NWA4hFVtubdvPHiqdyKph2ZRKrwMfjnw6C6eEZqbhQOMaKTPF5q4gpdDvSA
Message-ID: <CAHk-=wgE-dAHPzrZ7RxwZNdqw8u-5w1HGQUWAWQ0rMDCJORfCw@mail.gmail.com>
Subject: Re: [patch V3 07/12] uaccess: Provide scoped masked user access regions
To: Thomas Gleixner <tglx@linutronix.de>
Cc: David Laight <david.laight.linux@gmail.com>, LKML <linux-kernel@vger.kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	kernel test robot <lkp@intel.com>, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, 
	Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
	Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_080701_753911_3F4792F9 
X-CRM114-Status: GOOD (  16.14  )
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

On Tue, 21 Oct 2025 at 04:30, Thomas Gleixner <tglx@linutronix.de> wrote:
>
> On Mon, Oct 20 2025 at 19:28, David Laight wrote:
> >
> > (I don't like the word 'masked' at all, not sure where it came from.
>
> It's what Linus named it and I did not think about the name much so far.

The original implementation was a mask application, so it made sense
at the time.

We could still change it since there aren't that many users, but I'm
not sure what would be a better name...

                   Linus

