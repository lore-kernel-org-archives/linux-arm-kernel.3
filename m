Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39140FED9EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 17:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sswj2hGPn7hACbzJu1C3kS5DGnqFPqoGYHrtWz1tGw0=; b=jk6XA5GhwvowXqnyy3CmBjeBrC
	Jfhi2qJNClNqRHpM7enzGoIAlbjeMf48U8gB6G3/P6pI/LOi6F89sQoMmQuThYd602gDu1+gd5VXr
	8l/jP7KIcTdYCbxNW9nEQ2XIqgnTCzvFGHb1oSh7UFenj4IzR7px4q5UK+KJYSPWk+iLe9vW1P8YN
	nX5V1LVYLbWwqugLi/AiNdC8OeAJQ9gbJ9NhJP6TcLpcLPK+6+zoIkAeXLVdPiue6H5GJ4+G1VDmw
	ClgRFhUpPcJgnbz5+JekOcUG5FMm1tEg9eyP/L2A9hgX+tPWbw4LAMxMZEP749cxe6jvrZgbuCfkT
	70AyguIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2YZ9-00000006yZ1-0r3P;
	Tue, 17 Mar 2026 17:50:51 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2YZ7-00000006yYJ-2VfV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 17:50:50 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-509069a7a7fso57051cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 10:50:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773769848; cv=none;
        d=google.com; s=arc-20240605;
        b=PwdI+EeWFlFM3XDasW08qq2AqgR7qnOdNWMzmU///tNqkiUx6ZX/vqXKqOHWXZr6B+
         GLLzDCh875T3bmhXL8x8EHF2ctcpdbtKIkL7aRGoft6xlzfP2woX043AH5k1BQrssA9o
         fltadZcq1r53na7Ry9KdgXZkzwTRQTeCt9v80NPCMJL/g97HHE4r32smU7R1FEhvXwQk
         4fTlfHH9YemE8/35czTZDCjEpbgBNxmBm+2f9RjG9NHYS398Lt7tcUdNUBftwEsb5hoH
         C4KPZ+WnglEBX7clVlR4D5/8VpsT4GfLqDYGLSOb0L9Tl3af2nCnUqw3F7rciozAoj0S
         RNSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sswj2hGPn7hACbzJu1C3kS5DGnqFPqoGYHrtWz1tGw0=;
        fh=FOjW3DJTjihPKv0lwgpIF/GdCtvAuWGDVUHDF5AcGcc=;
        b=KpKYGATqHmwim+RzyURXXOJgXMETW6zuCdG6sHv10Xb/ZaqMID1SBnYEoEUoj8TANU
         oZXlIdRGyDeFp7KoVA10+iCHti6YSsi1uxSm4RErT+zoPV/hH9rQbwZYoAJzyFAiQPu3
         IBiR4DIzoVpWT56dLYye+L79iFiojPAf1i5sZSXmZ8Dt3+PjOgoRPjxp+uqlozseu9FA
         jrjS/JsgMYOiiXjmOQzBlYt67UN+0MyTlpNeR4Z2NzXRNGz1KQcn5BdpBLIfG6qeLG2g
         y14CwFWBa3Xf24bbWTilviauJ7shlAleV5VQ34fccCrSqphsIZPH1vErz5QgLIwruibR
         9WHA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773769848; x=1774374648; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sswj2hGPn7hACbzJu1C3kS5DGnqFPqoGYHrtWz1tGw0=;
        b=HHPFhkCIJOKkQ65j5w9b1hQuTl7ko1Fdn8Re4K/wiJlYDQGer1qMhFb6BORlEKDLTv
         coWJwl1MR5rfOrntUTzYPm6FHD2OFchNekhJVwCJxPUpuj3ecIhPduePvWCPDdtc+7kD
         KEZU6J/DvAp8eLzzrMftAKsttyw8CV+GFdT02h5MthH1PkHfuGQlLhTPxGA04LI1D7Qg
         4TpTQtZIV32FcAfkzLnwQrW2AoshkjkHvi3R5x2QpwzjF/OdU9FWoHyBgGTP0wsqlZ4r
         cy9pBy571wrKQcUfGiVvxVvYLEi1cSDLcTsPk0W369r1CyxvF7vhJcQME/XlkTD7PkaO
         AL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773769848; x=1774374648;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sswj2hGPn7hACbzJu1C3kS5DGnqFPqoGYHrtWz1tGw0=;
        b=AzQLeBwfHJ/meY5iNm3BlJeaq6mfV2fsn0euMan42LvtruT+ETosiin53bQEW5ZtE2
         dWinOvS19KiMgv1+NxCbsaq3lH+TKeYWEaL1ZYW4SNGA9HR69Af6YYmlN98hq+FVBC60
         TuTnQiZRy1YKanvFxiRYzQl4t7KwtiT5caz512ibuyg5PQC+67mVVMsEt3DcJAR8Gf6q
         khJmv3sdtd92NG7PMxeGadeLMzi2qYUKMALb8zYv902N7eojs6jZn0JEC5GCSHphU1d1
         h1WLrfs7ruyUJg/axewmQZjT2+1QxoU6LWW6j67GFnJt8zvYGaF+xglW8vEzPxbcBd+Z
         /u+A==
X-Forwarded-Encrypted: i=1; AJvYcCWBppc9yYLyfrYdr5gDQDkbg8RRWq7aWNvjd6y/Megwhl/1evSGA88pdOUsr7K4BaY38KjvOZGGo2Eoz/SU3yes@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn20aO3u+XjpTPZcOXqHywjP9xbxz6FUraHhmltHl+oZxYMuqy
	/HBqBPvOgpbBwOKra6QrRZ5HPUCc6DnewdK98IOy+SZmNrI7mtN1vdaYybdjl9wVjt4KntJPTT+
	2IWHTeWVbbbvCsmdGjayR68IDjT7kF/5VlfZ+SuKc
X-Gm-Gg: ATEYQzwLuMJqUPgv5tkEUXIoDSRdwI9jFI2dsCGqzVYG9hsrE2HYPVdzX8UPlNQthcv
	bybJREs8eks9f1TCIeqrw7dBNOS1YdZIuCCqeuMxLw0p2tXrxC0UvE0gPV0P7h9po3+1trfiwNT
	d5s+8cDPvIEakuJ20nY35ta/0ZX4P2+m4WTAvuOsO01GJJy5mPpHbtjAQhmEBy1Kfa8iWyvELiU
	eMR6huy7sfLPkT87094LGAHfrz8Qr1Jw1RcB3ZH4BHer21PgUMxXS0VXmi24IMd4NK6518OwFap
	3+NcC3vL
X-Received: by 2002:a05:622a:150:b0:509:1c2c:866 with SMTP id
 d75a77b69052e-50b149575bcmr639391cf.11.1773769847627; Tue, 17 Mar 2026
 10:50:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260316175451.1866175-1-maz@kernel.org> <CA+EHjTyBtM5idopKisJf_e10aRifubtKEpbkjkEnmrOqa9-SPw@mail.gmail.com>
 <CA+EHjTy=MCgeKoi9sA_eDuiODucOdMP5m4CAciUW=rStgJggmQ@mail.gmail.com> <86tsue6ezy.wl-maz@kernel.org>
In-Reply-To: <86tsue6ezy.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Mar 2026 17:50:10 +0000
X-Gm-Features: AaiRm52IK_m_asWK40sjcdDbExP97mzvrGS5v04I-bgwMBnhcMwSUWouKHa66FU
Message-ID: <CA+EHjTxF9fLtjdTtJontFuziRsgGMeE0bvEjHYqr64hDK3wLVg@mail.gmail.com>
Subject: Re: [PATCH 00/17] KVM: arm64: More user_mem_abort() rework
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_105049_676430_4D711669 
X-CRM114-Status: GOOD (  14.32  )
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

<snip>

> > > The series in hack/user_mem_abort-rework is different from this one.
> > > Here are the first few patches:
> >
> > And I just realized it's because they're based on _my_ patches ... doh! :D
>
> I thought I was clear when I wrote "I've added my on take on top of
> it", but maybe not. In any case, I didn't feel the need to redo what
> you had already done -- I don't think I'd have come up with something
> better.

You were clear. It's the reader's fault, not the author's.

I'll send you one more patch that might be worth adding, but this
looks great! Much easier to reason about. Thanks.

For the series:
Tested-by: Fuad Tabba <tabba@google.com>

(might as well repeat it here)
Reviwed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


>
> In any case, I'd appreciate your feedback!
>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

