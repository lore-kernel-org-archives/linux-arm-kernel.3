Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A61EBCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 17:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1e86C8e3IWXqubUsFl/vjUmwWGVV15AJsQpCoxLfCDc=; b=XsTVNHrNvRMpBnL7TXpimwduk/
	Qt45twpkreK7TXEotQjnLhUoey33hhUkob+IIIKWLHC848slR0Hw/tcU8yvfBnLaptvx4kXPBbSZo
	Qmfsdv8Qr3suE9RxC2kx99CXkVynPVO/KK3FG2AiNXVfMDPSaU96plqD90zywKrLLKIQ35LpsWvwO
	secBXiVUucIKLpXbwgz29FQeiNtJGmcQhTo35oRQvmJ/aFSES/WME9BDlbp36A3Ih+/OSrKFYsPNH
	U0Sdgu/mdUMjTckpkfm46D1XIidnYteIXiVjfVKbGNKdYMcwyTrVP6PchZc/8H5/JFYff1xfFk6qM
	dvB5+IUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSvj-0000000DaIs-3xIT;
	Tue, 02 Jun 2026 17:29:31 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSvh-0000000DaIZ-2p7a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 17:29:31 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-bed2b9bfa02so320663866b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 10:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1780421367; x=1781026167; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1e86C8e3IWXqubUsFl/vjUmwWGVV15AJsQpCoxLfCDc=;
        b=Vz+ojF5u8CwJi4w2qnV825iPlTHhuZG17g+RI0XuKfZ+ku63cOPqYZpaZF57DgKvr9
         ONo3RIbH+AprziUlptsZRcALuB+T9Rrs8UIaFSlwey4AP48bsBoNfyCJkeYRkCau7wGz
         50iZYXID+584Z5syX0Nz1jERXEq+4+1M2lb0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780421367; x=1781026167;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1e86C8e3IWXqubUsFl/vjUmwWGVV15AJsQpCoxLfCDc=;
        b=bnDWh1ZQSodcIwuHIeNW/40C/+uTbdstxcQx6jB7u4O3kwyv8J/vRhzoj+8+YPTg3i
         +Af0j2DWUygBJvTi3Sdli/nuV0qCa+cFGF7Fv2zKsoVtfbDYRs9cSXiBHEF4tSE8UvLo
         Dz6+9HqpeoCDnd+VEAaq34DXnMThVAZy3BnhrlQz2as2nZuVMvdcXOtD0jqPOLESNRuM
         cA8UXisVPRBzvbHEqL0Lg+8KNnqay9/qY4Og7KKwmskhQB0CW3A1KGCRe47uCuk2VXMF
         in0tgFI5CINTZOEOkdkO1iOrl6YwHi6MwWG4pc+1aL0jZSrXPQ3DQnaXyvPoE982HIvl
         76Nw==
X-Forwarded-Encrypted: i=1; AFNElJ82qhSY8OS8zfKL/33vTU2rgLokAxSNDNsx3pGenSSmWMSQy6eN15oPaiqPxE7Y+SoxIl1kyGP15F1j8UNphyNX@lists.infradead.org
X-Gm-Message-State: AOJu0YzXGdbPubJeoQdMfClosFCQw80lMNilgbzHzugxpkFKJbqpiMb8
	NHMNbCg3vmF9Grmc8VlAXNuxMkyQV4piDy7NunUE7ylWnblvQBjAhdnG9Pxa/76Zv8tOC1OKPbc
	sp4QHKoE=
X-Gm-Gg: Acq92OEgehqAFQg3rV+z5qa7xEZxkCl+Zx/sn65XolY0Coo7+K5phkiDG79dQbRtOFd
	l4H14ILkoUv+JLKLqJxWEuBYSGcR2kApIsvXALUb+SKFTKERyTrLckQ3YdKRFbGCpvLap2Zjn8u
	qZPhlYjPjhz3Zq1/sepK8i01O9wKEQ1UN4903SGCASN1Lm9pexkXgT0jEFWg0AcBliyHhouFnn6
	ehPHdogf3bMR3dsTMte/6JcAH6cmTiNWKU0eVDKdat+EfVLB5qy932D0Uo2tLNAb7N8obagpdRa
	i57U9CBbfvLCKWQjn8RhwsN776BlXUaPhPf6n8mzmSPTg36vRBY3B87bdSPkGXef36JK3yFIo4q
	U3HSp70wgMGYZrQFPB9/DLqcdeVEkGar6f+OYrqyViwBhbe/3w1t1t385ofdcCO2XUCyYe60x+l
	0fzP40MN13FVS4wiTW/x9P+7T6fpXGBVGuJ05zKMtKXvwM3uvvkiA7iIVWa+IZZQFVmuVxiSS/o
	v6CdbKF0hQ=
X-Received: by 2002:a17:907:9717:b0:bec:228e:26ea with SMTP id a640c23a62f3a-bf05e6d1213mr34114566b.13.1780421367022;
        Tue, 02 Jun 2026 10:29:27 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf05177150esm21272666b.5.2026.06.02.10.29.26
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 10:29:26 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-beeba001887so233109766b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 10:29:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9t1Xy0CzbT6FqHNwPdx5dd8d194ictk2ZpfLad8nY2Tp3AlmNGbaGxNjBr2Ng+6gtOovAHzpnnyB6uzxB/zH6y@lists.infradead.org
X-Received: by 2002:a17:907:6088:b0:bed:7ce4:20c3 with SMTP id
 a640c23a62f3a-bf06261a692mr32768366b.42.1780421365921; Tue, 02 Jun 2026
 10:29:25 -0700 (PDT)
MIME-Version: 1.0
References: <7636fe41-9a6c-4494-b0fd-a55387b92f29@app.fastmail.com>
In-Reply-To: <7636fe41-9a6c-4494-b0fd-a55387b92f29@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 2 Jun 2026 10:29:09 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj=uJU0PFrRjqTuOKcYnN92V0FXyn_v+x7c6rWhLoJi=w@mail.gmail.com>
X-Gm-Features: AVHnY4JwG8vkxEEDUE-lF3DtF4IebX5U7ta8Sr6Fwn-szma_vB7QEtdj0pMqTDs
Message-ID: <CAHk-=wj=uJU0PFrRjqTuOKcYnN92V0FXyn_v+x7c6rWhLoJi=w@mail.gmail.com>
Subject: Re: [GIT PULL] soc: fixes for 7.1, part 2
To: Arnd Bergmann <arnd@arndb.de>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_102929_770103_4C6428F9 
X-CRM114-Status: UNSURE (   9.46  )
X-CRM114-Notice: Please train this message.
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

On Tue, 2 Jun 2026 at 01:03, Arnd Bergmann <arnd@arndb.de> wrote:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.1-2

That is indeed a tag - but just a bare one, not a signed one. Please
do make proper signed tags for me to pull..

            Linus

