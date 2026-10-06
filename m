Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07944CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 04:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AY/4/mZt0eY3/2zGQJ4VfDnIKBzDcXDkb0pfkxHi03Y=; b=IxHBLU/N4uVZ/2QPIORyodqBVG
	0IRUseKDsKmEYjW2oR6djFSFpV6FknyYeu/fN3RLZLh7lRXwMjYAzNxDLt3PWllR3y7F2qk2WrfIL
	vwmsZbSTFnOLK5P139xYkFfbmIqyVWkYpLarakjcxJNYj+hq7RTH3J6TbiKTREh6M5AhzHmewv0w8
	puU96MOHnsxQf5DBdmGcxMYlwsnEBDqv8Xlt0axJnLuqRmn0ksaI12wOORWx2SHps9K000M5GZyxf
	sfzQWial+CZE/seNCn3E3tI2pncnCFTFg8OqiVr4rMpqaYA1zH92XObzsWzADpchlMJIj7CQCr9G1
	T9qe20qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDwvl-000000001pF-3tQn;
	Tue, 06 Oct 2026 04:37:33 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDwvi-000000001ol-0jkR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 04:37:31 +0000
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-7c19c6721a3so61152137.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 21:37:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791261449; cv=none;
        d=google.com; s=arc-20260327;
        b=pjthcQj+kzgekpKn82+ZlimxdUQ2tDg3PLP7da5GwA/FvwKlGuT2Q9Lek7xY79pWw8
         Hw+G7NR78SlhomPXoj0icEczHDGvg47bMhPR0GyXBUsn/A/thP2oWqNcd4/9pU6/trfy
         PxSFuA/FVMRe8Y6VRj3JMg/APmVIcJhZsGI9MNGmQs/XyZJhzCStgvKzUfUHZaFAaBxh
         f2QHdZHMxgAHspp/NRxJp6k34qzFG18FU1jbFzsLFvzVhrRkDeBsug52w4y34J4i23KL
         3Pj5lu+xVvX27Y6DdY3QBRwZkBEwj7u4Ao7S6JWARvbDdWlpkss42/nrXFjMkXhM3jx2
         pT9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AY/4/mZt0eY3/2zGQJ4VfDnIKBzDcXDkb0pfkxHi03Y=;
        fh=6/g1F0EhyGkDB4BabgR6iljnyzIWvJJcGFl/r5XM02c=;
        b=CsfllkxAs50XREC1/rN1wrWqd8OobnhhIiqdzWHltIvcFdDRG+vzPPvrt18xb6nep+
         rrexIKhfWH2KypuUG0oa9nJiwvDiQ/vAfafIUkeBtcvCCJmQJRtxjE6fR3ZIwNT2p5UZ
         +mcMhNgwybH4w2oU3JyW4i53Ada2rVksZp57z5ZyUBRCEeYcCmPKag0WrX/ZkT0fF5mL
         uJ09XcoLQ6ipi4OWKyMJkgFQxwJCTJyiYK7EcGSweSmo02p34Gf1oDNIjJDxKS4vPun9
         CPwX6/Vkp4WV9LQhhqEFPyJjixL76OBtpFTmGzb0jhRffrcl+Ae1FxnKWjjkmyJEyth5
         IWSQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791261449; x=1791866249; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AY/4/mZt0eY3/2zGQJ4VfDnIKBzDcXDkb0pfkxHi03Y=;
        b=XmyvQsb1yvoOpvshu1CyvQCNHj0FbTRe1UlzNzpxT3PgWDwr093moLT+1Mdt/MOykn
         g2vvMgRX0f35NvlvjenR+96ho1pJUb573x7NJIeWMjCA3QRFL47tO+b5uKQkuCymF197
         mqggSdd9RFoYIQ+lT9AKfgIeIJAmFKUd8mUT6mOCfNMcMIyF2ulCTo3S3gO7E/2KL3g1
         8/dwmvSgsFiD1sl+HavzwjquPPUPdGEDSvq5R/f5MmIBVaYhbZvoN/ZcPZfXUvjmQeFz
         ptr5k9Taswd8RrmYM60n7Az1Eke8CgEYtYTNSM08PaT4Zmhqc1S2pTfMkghi6I37nmDI
         7nOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791261449; x=1791866249;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AY/4/mZt0eY3/2zGQJ4VfDnIKBzDcXDkb0pfkxHi03Y=;
        b=ghmtalw04NCEvbUvXxi2+LAMymvAdX5GjXJSI4V342boNyuMiVauuC1/19s81jsFIr
         2LEFOJ7Q8INCJLreCyG/O3xG6RBgh3OfrD2CC76nSdo2LiiKAFqKGQMY4FnWNqTuv4Np
         L72892IeSMEXpYRCIQXbJYwKrk+0M1/9l0OnZ0L9aLQg2vTEKsKRODSwIa6RAB1MZaIO
         vjqvSNFPT8oMQUXr2FmAmRV+K6bskMU+25OM+3NfVRD2MSCqb/GNOri2i+Xzh6ksfcFD
         BM3VBHDb4Eb3D8pyfPeXRkmqDG5A1k1lHELD1zVLYGHfY5I1Mn6ZdvP3k7RngsuOb81R
         Cl1g==
X-Forwarded-Encrypted: i=1; AKwUvBwvoQORhjgTSLO5go4A3q43el9yJS3nZbsUXkQj95+imFrCoHHwYmaEvizORljlCVVyT9Nz0ynpugyAIjsYcXsm@lists.infradead.org
X-Gm-Message-State: AFq9FYLTCpymgWZDNgEFDqduZeCoFnLWsxS+ZxcUdaNgoOJFModr83+e
	xdDm2W6zTsKGXuBfdp2htCQW/zLj9jeyc8OTMbyh7MKtPAkH7OdMb4vbJ8FOoo4wlATRyz8qp0i
	1zajmeXBVdDonywdif67V60Db9YA7Xdg=
X-Gm-Gg: AYBFou0hiE24SS1dgDWZxwXCsyy7ucgTu1W5trd4MJUR7AGI3si66tqdWMJZDJEu/Lj
	+hSCJgM2rR+ZG71HIEXKSNvw5WJVKJgJxwdU/ydnpOmxLE/BhG/wN+CZ7oK+jh5kbQoj//7PFHY
	JJDA0Bs9DWzeoEshZ1OjnwLEqxRXYOOtgem5YwS3zu6s2T60iwXTMUTbYrVUNCNeACojw99Sd/j
	TxQqy9aqMozYiVlmlF8ewh9ug7X5OmMQ6jZeppNo2AY8zU8mpb2U4y4PdZK3uxCq2xYHMQOFSyi
	Ce5KDc/Hk5hnMzO1qcnNtwrOYOP/VR+nXVDNVB1XF7sMGFmzPvY4XUWDtljIAMMvezueCfO2B7z
	0Z01o0n6KbcUAl4g2ZVoPXh8WiLpmSZ7DWz3WVawq2A9okLJnEozecXYc+NLP7zlh2PrWIsXI1Q
	BhYrsQtTn/RHqJIxuOC3XRLbZkT2s6H/lerf6cBGtu1Pmn
X-Received: by 2002:a05:6102:915:b0:7c3:9b2b:7efb with SMTP id
 ada2fe7eead31-7c87a31a2demr29458137.16.1791261448899; Mon, 05 Oct 2026
 21:37:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260930-stmmac-est-reapply-after-open-v4-0-9d4366587b73@gmail.com>
 <179082834895.31693.4009727999698761506@kernel.org>
In-Reply-To: <179082834895.31693.4009727999698761506@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 5 Oct 2026 22:37:18 -0600
X-Gm-Features: AclHuK-ofFt6slNz98bqVopfHARNnkiLXB8RVY7WAXdbkjgJ1j-2L7i2_F7ye-0
Message-ID: <CADvTj4okT50YYV=t6ZHD12K+XEBpz2B-FxE6C8ApkQeKXLyt5A@mail.gmail.com>
Subject: Re: [PATCH net-next v4 0/4] net: stmmac: preserve and restore the
 installed EST schedule
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Jakub Kicinski <kuba@kernel.org>, Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Jose Abreu <Jose.Abreu@synopsys.com>, Russell King <linux@armlinux.org.uk>, 
	Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Serge Semin <fancer.lancer@gmail.com>, Simon Horman <horms@kernel.org>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Richard Cochran <richardcochran@gmail.com>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, Rayagond Kokatanur <rayagond@vayavyalabs.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_213730_249462_2F1906FB 
X-CRM114-Status: GOOD (  21.42  )
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

On Wed, Sep 30, 2026 at 10:19=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrot=
e:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

My additional replacement/error-path fixes were found by source review
while integrating Lorenzo's EST work into the larger stmmac MTU/resume
recovery series.

>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.

These were source-review findings, not failures observed on an
EST-capable device.

>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

I have not tested these EST paths on real hardware.

> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

