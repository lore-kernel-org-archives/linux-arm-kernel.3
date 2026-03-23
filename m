Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F0BD58B00
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 12:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YDciruzs8Ey3qf1jOS+c7GPDS8nO7KcVc/iFzTYFC6w=; b=ZthOfUEkBiC1LGebaia5h0laY1
	xydHB4weYtBHUprODfqa2qy7qwRsqygrELrhTnrENEhcl1eU07uJOzqyE5qjnZONWe8NYmbBJIgXk
	Lp/Ar/uqYPq1LUTZ/GuvUocfe190yxE5hY5kurHb40t+EbVZNfYpe36xSL0TtgWxqMtXLxYvTqW/z
	BFfS2S21nuN707/14/ed+1idIaTnwFj0E8wZS7fHiMrm9PtuEnnw+mK4CUYKF/69KYTOrI2zX2q2f
	JDT7Y7H8nQffG7DnU5aFk4z+HwiOXYpC/uDE/va5PnmkL3ZtiWJP33+WmBnWHEOlmL+FJmC1eL/dd
	X9Jqny3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4eU0-0000000Ghku-2dRv;
	Mon, 23 Mar 2026 12:34:12 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4eTy-0000000GhkW-3uc4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 12:34:12 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-5091ed02c54so1073391cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 05:34:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774269249; cv=none;
        d=google.com; s=arc-20240605;
        b=VYiH0tUIFh4kiNoEDmPH9ZnQOOWCje+NzClKeSzzTD/lWUNIg4s3yMOnyxjudArrmd
         UxpYOYvbfr9Orz9xsTLpiUJhSDSpRvhd/9i8hD9owwbH1fOrvetW4ubqvuhm9WeFRjEt
         Tqaa8gxYQrU/7sufnNVBAl+3aWOJ2JE7lXgTNv19wYEZZeSFQTMW/uOcFL5gWsTShCtp
         jUtKMsI3/R8BaRG1RBzgL1H1Jxm4N3iYulvPdvwO+mUPQ6IIZ8HaZtWrHGOza/1P0HYz
         bqUwmVaw9e3d8jkj9oob2XYIXIUNsdF58TIbuzJNAZTmkG2f1PK9o1Ug/jzOhIfFzkx9
         h0rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YDciruzs8Ey3qf1jOS+c7GPDS8nO7KcVc/iFzTYFC6w=;
        fh=5Q1gE9tIuRdfphz5cYuB39Ln6YlwhvSb7N+D/EZPXM8=;
        b=JxPhwkUdXiY4RyagvUqQGMMnl3mF/sMDKZUCqI9M53ZUuOeULrNG5kDsPjBPTcoJH/
         L/ZAB19QtqmZZT4tPglMzXdbFrC2kpynSPnudq0XHDozQJfXb59y96cQ6HI24aflS4oF
         1uLBiHzmdLqFvdQIjng2DUqa1dQR/Kx7SSc8Tpirczp+Pc6xRVqRnRZ5X93/6jTk2018
         nWMDO4U2cBHkbJw1lbXkKiteWk81ScUbcGG9BuDtGqSBkhaOUlyc/OWtFHWzsZ/R2lDL
         1JVh/zZZbwYqkie3Lv7CTXi9OjsxPO+xPmDP1lG/h13PZIgaXePFeLV/Kqx8hPSNkP8a
         NkQA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774269249; x=1774874049; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YDciruzs8Ey3qf1jOS+c7GPDS8nO7KcVc/iFzTYFC6w=;
        b=CWoT98xeTfu/Nj9VvLK1pKvCPV67ltLnKqnh/39ogHsRU+Ra55ykp1AtSMnUHdQu2n
         AZWvjavvBr5gGXaE1vy9Z4I54/IPj9lCEwLy7wUua34qiG0vRmQw4yv/xWpWpU3ccuCu
         bxq9AMBH2NLENQbbIiYE9I0PDhOQbCzUAAOABepgjxaWQRP+ZGJdoQn3ch2fVyJ1Prje
         10fOV83o/+bI1mXaHd0WJh7AOgSHF7bVywUsTV8YI2L9YBE3vv4Ja55CthOCSfDw+bF+
         SSQ5ghIghzeA3T4RKSO2ERdxJblfAiDudfXPqGBbXiSikh16kwJaKVQpnmPlPOKXjwbh
         RZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774269249; x=1774874049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YDciruzs8Ey3qf1jOS+c7GPDS8nO7KcVc/iFzTYFC6w=;
        b=iGm+egHCX0MtTrIGdPAAOxTE8o+uCqOKPJifuGMmoVtlBqi0xSO7I2fEyI3ktZG60Z
         EkUDCW2k1NgvdpUCJKvBOFFXAPl1o6sPTNFUS30PsQDUjNzTLyQ+OCnNq8OP3NYJUGgQ
         CKnLGP3th3Pv9dHE4WdOfidvmx9fL7pv533SItbgJ3pZ3J4zeVW0dfxafcwnRDilTKAk
         y/08IWcNc1vQhl/ttvgATuNBizoU5YXDl0WKyFYi8vwnh2IV2s+/RQr1+FEOEaZyUxfa
         M5HMbqQ/s2kg27WxnSBjhoA1YVZxpEbEzBBiu5Uh1JFA7gu0bbIAgYzAncPc+Gtu+rkM
         d4pg==
X-Forwarded-Encrypted: i=1; AJvYcCXM3ZogKItJS5t020kWS8Sd0fpiOg8mVPip65IigXWnSF9F83flJfMHg8R6LupANRF0OxwZ7euq9wmHOqUjqWz5@lists.infradead.org
X-Gm-Message-State: AOJu0YyoN2k3HnydmBRNk3Pd/6U1CJ6dgxOFfqvGZufdAPaviXaHr/Uz
	OhSHkRQlaDFMkBCSM6gYudkR5u8guycVD6cVkn9nTt8AR4WYSuA0jTlojgJ1JGK1/srGyDl33km
	Wyr4eRh6gbSM+GAj8S47SnBp7iJpdlAwRslA/ClVj
X-Gm-Gg: ATEYQzwH6uKtSjwLCCL22c2vMJebr3bMcVyo7GIJ/RXUwjczXe1Tp5TkyX+m1sYlqGR
	gcUk5H30y1jytzDMDOic+9UOPDgbS3aAK9cYN7Y4MVchcJnKv0CcUx/A8YMv/rFLSJhC/Rx3E6D
	89G+SbGR3B4qT0hE7PCWUj+EXlO83A6mXJ+BSQO3HDB2tevHvDPDZ2lqaRqZoA/9jISxeBSdbkz
	GJaSwbXGsHt5TiSqDlUzPP3gvNIrmrODNO5EEfMc2pFCvdrD2ho4HtgTyeen0G+4y82RR/Z4C0u
	dhz8EsWJhDPLGUov2BpK+AJqfEGStiz56aQt+aLdkw==
X-Received: by 2002:ac8:574b:0:b0:509:25c5:42b4 with SMTP id
 d75a77b69052e-50b480c27a5mr24589311cf.13.1774269248302; Mon, 23 Mar 2026
 05:34:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260321212419.2803972-1-maz@kernel.org> <177426391593.2932170.8726976984414575226.b4-ty@kernel.org>
In-Reply-To: <177426391593.2932170.8726976984414575226.b4-ty@kernel.org>
From: Mostafa Saleh <smostafa@google.com>
Date: Mon, 23 Mar 2026 12:33:55 +0000
X-Gm-Features: AQROBzA3qYHe3s8BaZ2dHYM9ZdaRsKXyWNR-mfM5AIq5nZXyLzrP-udG8vd73pg
Message-ID: <CAFgf54rsCocMTaP=OPfFq7BCwoxQKcEkcyad16BtnZ11XxyKxg@mail.gmail.com>
Subject: Re: [PATCH 0/5] KVM: arm64: pkvm; Rework aspects of the PSCI relay
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <tabba@google.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_053410_997029_72189F77 
X-CRM114-Status: GOOD (  14.92  )
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

On Mon, Mar 23, 2026 at 11:05=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrot=
e:
>
> On Sat, 21 Mar 2026 21:24:14 +0000, Marc Zyngier wrote:
> > Having recently spent some quality time debugging [1], I ended up
> > reading too much of the PSCI relay code and felt that it could do with
> > a bit of spring cleaning.
> >
> > To be clear, this series doesn't really fix anything. It simply adjust
> > things to my own taste, which may or may not be everyone's.
> >
> > [...]
>
> Applied to next, thanks!
>
> [1/5] KVM: arm64: pkvm: Move error handling to the end of kvm_hyp_cpu_ent=
ry
>       commit: 4ebfa3230b40728638a6acceb709f900f920f921
> [2/5] KVM: arm64: pkvm: Simplify BTI handling on CPU boot
>       commit: 1536a0b1386850b67a9ea840e57b7b475e895fed
> [3/5] KVM: arm64: pkvm: Turn __kvm_hyp_init_cpu into an inner label
>       commit: ba64e273eac3d7ec4a2b621b3620c4d3b0399858
> [4/5] KVM: arm64: pkvm: Use direct function pointers for cpu_{on,resume}
>       commit: 59c6e12d40a5b05038b68bcdb4690456fee68e8a
> [5/5] KVM: arm64: Remove extra ISBs when using msr_hcr_el2
>       commit: 54a3cc145456272b10c1452fe89e1dcf933d5c39
>

Maybe a bit late, but I tested with pKVM(nvhe and hvhe) that it
boots/powers off + hotplug through sysfs

Tested-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> Cheers,
>
>         M.
> --
> Without deviation from the norm, progress is not possible.
>
>

