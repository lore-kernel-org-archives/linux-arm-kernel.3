Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3F1C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 02:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fPd0jePCJEvRss0UdFXuGKLy+4PgCDrlaI7MbTAcvZk=; b=ZfRW9vWce76+T0YIUaUDm3B4H1
	Z5tssZAWFauzSElgZitj9jl8EoRGKuz823CpJ2jcOC931mcTmOZ5VBWs09prvIsQBDvctuv6kRazR
	MPKyuQj06PfQvwKS8HEFVbXF4pmynLXrrXMplaZPKpIyqks5Jx4Zjt/2veO58SB05ZmaiEndR6VGe
	4M/Cs3JVEzlmru70qoxkVOVsdihWzFj11yk+GFjKmuNnkFqm8C205ppOtJeYsiTNcVy91vVFWJTIH
	MKectdWqxh2mMY+XCULBXxs/ECexzWitfpVmU5n9vlqM6BeS+dE7j9T97C1T70Dfu9Gtoj5n+diWG
	UnH5F6ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtcXK-0000000DBNc-0cRi;
	Tue, 11 Aug 2026 02:48:18 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtcXH-0000000DBN5-05ek
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 02:48:16 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-383cb94f742so2794580a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 19:48:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786416494; cv=none;
        d=google.com; s=arc-20260327;
        b=dIVy0WyIplzy2JnyFcMZjelUqq9cE9ux5O0Xzv0L5VmVCc9YeL1FX+Pq8uBeZJhPlU
         h/9A9eOP3ywkTkbVW/zTX6njGfDvVjSz1BQdz3Wi/FEUb32X2pzS5GSDcodOOZP8QmVW
         expa7bdP+B8BkLfB/nEfmZI4ZfPgfna1qoyzhXB5WUwOrnVnsBVtVaeFdae0BExEH0hC
         k/XfLydo8L8c3fPXaRbhYELXhlB/rHxTY7boHan5npShIrC7edzQwseYg8b7uuFYgsaq
         w+2P7Prram4R2jo0bIeJMhD4Z111lx575LhaOhnTg130w5vQF/SK2SVeeY9pEjoK6vyw
         f1+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fPd0jePCJEvRss0UdFXuGKLy+4PgCDrlaI7MbTAcvZk=;
        fh=TQbmji50sO5jjPay6/QyeRv2j90oOI7dtDp0mxtxgtk=;
        b=arc9wmQf8cbq3PgqlHKmU36EXRl8z+SeaLq3kbBPfk9+BoSqqRcogpf5ey+VLT6uvK
         bxTn60PgInZOyfAlwxxudkt187xP6zA/gnktHx4gBAxb82mFsIXZr8cnmRJKNj8AuWJi
         3iX5keUIQ96irYH4tEFltNBGLVIYa2tAsavvSBxNUBkMF1IBcuBsOgub4m8gRLaH8pIp
         RZxieACpnocxEQUPlWSOdt6j91g7IUxlNgVW4FiFv/O4nL189d9eRfIe1a5Mfbe3rqeB
         j4WdBl0b4w/K1o7MVstAmE2AhEVrnCSCEjHqzbx1wlrb/t8v6Hubb0DkBsQs8QHYU3E8
         8WBQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786416494; x=1787021294; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fPd0jePCJEvRss0UdFXuGKLy+4PgCDrlaI7MbTAcvZk=;
        b=jZUPln5XQRZzwFsblzibBJrjL35gPAKk0N9KS5xfUpW0n7keg2b7bKPHhalq52rc8Q
         nggVqW0tQbN46k9vdihjPcAi9FwrtlrsCeaBNbavi8pkhPAUrEV/dmsONjm9lbkJzIpM
         qO+HsjTDN5kNGRu5jOyd5VCGjVhZRFYMNvofNF0E8/kpOurDHz1PABZSghE2GP5sxh1H
         s4Kpz6G/JzthToR3t8Qk85SSglT2v+Ka5iJ5uSHjBR/bQYN4fm4S+LOhpHsGVGLraAKk
         Yb8tdvShYI7KDkBLq0MbAT7lrJYA4Mhlu9Us1WjiKoJb6alJP90NnXrfMRN0pmoOukYE
         T0GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786416494; x=1787021294;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fPd0jePCJEvRss0UdFXuGKLy+4PgCDrlaI7MbTAcvZk=;
        b=aoVTDrENzw7pGmGxpxnlKCy4GUwBq33qin+yAIobt4W5hv5EsWfjnHp3q2YfmIf7Ji
         9qyi+TYiDBhhyv9HVpj52vUitBC2i8TP0BTjmw+/i1Fg1SYJtV43dh9pWk0KdIDbob6r
         Wp5ijy53u8hDKng4c2eCADRyCx1mSmEFupjLBQ9Q5ePAo02IQaO1XgKyPL1KRfNvgVI4
         KpIj5YG6lQkRaKDI2sv0sCOgzw7ARx0cb/2duSCPy5gyF3Y9jXqu9XWplkXSeiNWzKmh
         VMfOQYKy/C2gHjmec24P6YRi+IZ0+RUs4xqiwuDfNLQ6Fm2CxlHki2yubnywenAOGGSA
         iJtw==
X-Forwarded-Encrypted: i=1; AHgh+Rr7BwFFNMQlpjZybjXtyhjYg/6cMHLiQfm6DOEtJU1Uiq7YBVd/OJ7/pZiEpWmgxeQKAXIXJsgQW0W1+ery9wo9@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/sn7geDFoLCckkX6gvs21a3HBR4HTW30q4sLMbkbfuSwxxpvn
	d/YIn8QXIEYvKQC48Vz32x+GwNkqgBwjQiI7ZcBnNzc1INUpQ/UB5uYiL9zIhbit+n4ZpzRlvnh
	AFWnVVtBNv/Arh53iy3/clBiBfFKUeys=
X-Gm-Gg: AR+sD12HYYM0Lxn3Uf05mMbNK0s5jVmd/eOTIcG1/3xLjjpZa/MXVwMWJyJKQQwoMOU
	jWpO7YIrrhJT1OgVNhU9VzDRsIJZRHQZAJok97d/dqWlaplqpKbMkmnH/t0M4rUN61nrUSQp62M
	/8fdqVtQIH4MRGaDWBA4gz8clAZZF3C2/NrtOk7H1LDGh4FjFIFVUwC6QPWuqfJC7/RbEqVLBvO
	VwFQTBte9k5K/vXc+R2KV+llxVOW+c/HsHA5wZF/YFhefbBAbHoD6Ydjwzq7fy/kGT9mTE+5c5l
	vooMM4b4RM0Ir+EmPO0POElzUSbhkp3EHdS/tCodKu0xEDAjBKbgY/VMTL6anIFXXAcn/rDmVoU
	VLDYkBLyy4TsfsAjs3E2z5qqNt/wZeJcG6zJdiEkJ9vpN923yAKWB0UVQ
X-Received: by 2002:a17:90b:268d:b0:390:b41a:b92f with SMTP id
 98e67ed59e1d1-392ec6858abmr33121a91.18.1786416494009; Mon, 10 Aug 2026
 19:48:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260810053142.27938-1-phucduc.bui@gmail.com> <20260810053142.27938-2-phucduc.bui@gmail.com>
 <CAHp75Vcb12Ok=yEF_WqKp=yS_EW9SWS=G2+B7Fa7aLH=u-aR0w@mail.gmail.com>
In-Reply-To: <CAHp75Vcb12Ok=yEF_WqKp=yS_EW9SWS=G2+B7Fa7aLH=u-aR0w@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 11 Aug 2026 09:48:01 +0700
X-Gm-Features: AUfX_mzDDYkK2NK5jlqz0_lCJ5Fzf8I6GBhgUkKlRjmlPfvBFmCA__eO_V6VlZk
Message-ID: <CAABR9nETzzsjzE0JnnLC5tX7d=0yZW9bt+t8DuVxV=JSb1VsYw@mail.gmail.com>
Subject: Re: [PATCH 2/5] pinctrl: keembay: Propagate errors from optional IRQ lookup
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, robh@kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_194815_065201_5542A9CC 
X-CRM114-Status: GOOD (  11.91  )
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

Hi Andy,
Thank you for your review .

>
> While this looks okay, have you considered actually having the
> platform_get_irq_optional() to be optional in this sense?
>

As I understand it, if we decide to use platform_get_irq_optional(),
then -ENXIO should be handled as the expected case where the IRQ is
not available.
If we do not want to handle -ENXIO as an optional IRQ,
then I think we should use platform_get_irq() instead,
which matches its intended semantics:

https://elixir.bootlin.com/linux/v7.2-rc6/source/drivers/base/platform.c#L301

-------------------------------
ret = platform_get_irq_optional(dev, num);
if (ret < 0)
        return dev_err_probe(&dev->dev, ret,
                                            "IRQ index %u not found\n", num);
-------------------------------

In my opinion, we should not use an optional API if the IRQ is not
actually intended to be optional.

Best regards,
Phuc

