Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259CDF43844
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 15:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZZ9MBeGinL5cKg3LaYZTrFFidLDf8L6MNP8Brjr8zM=; b=AJSD8plCNrBpmrr9WXIbb63twj
	+GhIqO7vIynrHgMl+x20zDea/JrWiKe+HMRoi0SW+ygELmtf+xncRmCi9xv6H5tUnY+9vMVO7N9dn
	FxAgMCQLyZRapSK0SRfx8TfKVYN7QqLhd5Q0GZqnU/ip7ieBL8jbVfj6QIxecCG6JNSJvYk+2EW6L
	inA8OcAews6Fg9/GfnHSbKmXkEuwVDY4Bzr/RkXaH21VBHC+MOz2ZiRWHgnftVdyURsBJ3yiovIGe
	pCB0hGDUucRIUxSuIgsoDezxzXGdsL1AMmy5Ri1t+N+gH5oIp2PSfHlvXOvgdhi/Wb7ssABW3VE4v
	V+I3XUJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD2DE-00000001KaQ-2A8Q;
	Wed, 15 Apr 2026 15:31:32 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD2DB-00000001KZv-48zd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 15:31:31 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c76cce85bd9so2694232a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 08:31:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776267089; cv=none;
        d=google.com; s=arc-20240605;
        b=efkS4cShzvCQth5ovynzn97PfafSA0SruBV7XTYxBRSEoYMdH4jYLg5XGF30bgj+aw
         NI543j/gMgLnFQXRvLhQHVIEASEu6IRg28HHCciduDU8P3mPOnMnJxYJ01tSpbJn8nXI
         Y9sEwvS02m4LNTzjdyt2sXyCjXNvE/XMy+QDK6hwyIo5pp+dGxW0AP8VN7A0mox6GEcl
         8K4fe+Nr1A1c+kZV9tLYxd6Wh3jEv1BBMleLAR8p7HnRTuWHYisTMqgrjl9DVkx+TUfT
         LRH1p7DR7i6rarJ98hCO0gvfz72bAh0CHSpk/WDsWq+NPgzT/oKpBVuZtAtdiAiil7k9
         UKtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eZZ9MBeGinL5cKg3LaYZTrFFidLDf8L6MNP8Brjr8zM=;
        fh=PNO0BxKeF6BO0dWSn347TifxxCIG/Zw93SIbh1yIB5c=;
        b=OxkoSS/YRrJGe5BzfYqT6v4QZ4t+3iwsYBurkR5PS2tjnJUHHokRq+ykJmImb8PPeF
         lawfIpNdIA9ymJvN7hGYUyCxtpf7fs+SoDXjeETR5jTf/S/9B8sk0f4PSRtcwvxEOtdn
         LxgkRNP5400BItnfVDJ2vJnfeuXrozKlhlAb8fTYFWxaME5kQn2OED5nZUtkc08DR9hS
         GV3ilPq2usJZqSnQOj+0lxq0xMutP5ZVib6B9DWStfpJDbb5pqbKg7Dxj7tQLiLNMEPI
         iGFC8s7Hdt72kNILCMDELt3Q6Kg4XaRbKMPxRpRbj4ypwJ23XuG+8Cv6ndYYIBE5pHdB
         oxyw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776267089; x=1776871889; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eZZ9MBeGinL5cKg3LaYZTrFFidLDf8L6MNP8Brjr8zM=;
        b=S8/ioe6QY3pXxqA1fXVQxK6iPLjyfghv9vo3vWQaRiiO9HPawr9eSxSDFy7+sI9ZSy
         PB9zH5qgSCHCXTtI35wz1pt8mpptUgmYNt2y5/lipEie2l2cVGFFlh/WQxovBK7sguKW
         T7EsK8c87H/cKKM4WPA9htXm2f3Ry00vRPgQy2qhmknVahoBVOiOwqCsQwMEcpMeJn90
         sLmTG3OtsYXBRYcZCios0Bb27KhwoT2bs3w0YF+4oFzNRc6K+bPbKEsTB4CR2CBBliEs
         FwgCt3Wz0M6VbwwRTGhVn414AeAgD2rI5pOgrqQEYcFS2jmR44mE0/pvCVZZ9cBwj0EE
         1TUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776267089; x=1776871889;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZZ9MBeGinL5cKg3LaYZTrFFidLDf8L6MNP8Brjr8zM=;
        b=oMlTHHEuiLQdN1To8F0X8/fYjbH/T/RBirNROUqbJDW3uBVWItgl1vVnZ5Ny3QxshV
         8Dv4EugPGDgTS+iX0ZPJwWGoWdheVEyCMUDZRbrryoWlHnAZuAgFo1gpnsu2aRq7lyak
         iskzA228/noLGtlY8tBgkvGW6eTR8kiKEMLkjhKr1INGEB8fbIFUm6uQ59B68q6FgasU
         7UMx7MtOpUyxw/XvRcu0rs9g/7U3T/kdTWeJ2ZedIRVqyKXZT3orOPOW75C5m++GFzz2
         kVSReaCyRH2+YHPLwqq5njQTdJGNMHoIs3wOsugTbtYek7E+BnkXP5DvR/7smXbVTWie
         HOxQ==
X-Forwarded-Encrypted: i=1; AFNElJ9dFCSIfir13JBj2I6AaHr2zMxVVnBLhVBMQ5X0n1n+QxtMUIZSsN4ahWuRxrt+Vuvoi6SlEIWxZrj2+arsaz64@lists.infradead.org
X-Gm-Message-State: AOJu0YztGaBw5rfGmTI2xHmAbtUNr0Kd2p8huUyzi0zrKfQcaVSPqjRl
	DSckwciOYqcryiffFYLXnnmonyHO4qidl81dk6xI/lLHgF7pYvcYTW/mj5LTBL27O1H9aL1sh56
	ebRO4kurTB8Odskd6iNSWiAl8ksWmF9sM7w==
X-Gm-Gg: AeBDiesOlzBFb9UFrdjZGRRwpv2sYduOEsq+qAkjT0lcmbvkSXv+qxH+VDMkCg1hXKX
	D+FT/EN+3GC4W37O3Zy4MTekM6OEowAFG5wrDEys88KnbcuI34VqFCtcHepb0nQgI2kHlcyEje7
	faW+nqr89ZTsgoCkRH1q5nOErnP/bbfHDbdkXS9MWpJfzcn9REKp0ScslJG6HM7qLs+mBD7r4zu
	OzTNua1TqsT6kuhYZr2wtF4nlfCplCEElDvRKEUQh6SEDDYu2FiqZRx1Ak8bqpksi2FW8jlqFg0
	yp/5WhpWY0hR+VxpHDJvOikjI/n7zQ==
X-Received: by 2002:a17:903:1211:b0:2b2:4b4e:e4d8 with SMTP id
 d9443c01a7336-2b2d591b8aemr215377705ad.4.1776267088525; Wed, 15 Apr 2026
 08:31:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260407-brcm-prio-v2-1-3f745edf49af@gmail.com>
 <CABBYNZJAEqwfTuVqbFAnx97HBSjcwn3Hb+y+r4r2C=MMPxFoDg@mail.gmail.com>
 <CAMT+MTQ6orj5tpiGL9hz8m2TGiBjA-9D_0e1iLt=_dXBFHcOgg@mail.gmail.com> <CABBYNZLNR8hYS9jLLKeB=M9XVvtSFtf1wi4DmcJKBbQVvHTPaw@mail.gmail.com>
In-Reply-To: <CABBYNZLNR8hYS9jLLKeB=M9XVvtSFtf1wi4DmcJKBbQVvHTPaw@mail.gmail.com>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 15 Apr 2026 17:31:16 +0200
X-Gm-Features: AQROBzD-Fi9TwOA2iNwLMvKH3PB5XbyRvKB5pMzjCowARYCArTwXFPUUzeFibBI
Message-ID: <CAMT+MTSdVnor4+3vXhyfhye2kVp5-UPgg_Fwm4rH0mJHM_FuAg@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: Add Broadcom channel priority commands
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Marcel Holtmann <marcel@holtmann.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_083130_049162_C33C028D 
X-CRM114-Status: GOOD (  11.19  )
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

On Wed, 15 Apr 2026 at 17:19, Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
> Ok, then maybe we should decrease the priority, so it can only go up.
> That said, in a multiple connection scenario, we cannot really tell
> what should be prioritized if we cannot momentarily decrease the
> priority.

I believe that the priority is only per-connection and is not designed
to be used per-packet. On Android they change priority when an
A2DP stream starts or stops, by sending the commands from
userspace and are accepting that other things using the same hci
connection will also have high priority.

