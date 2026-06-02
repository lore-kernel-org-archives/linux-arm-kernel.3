Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38753C5DF71
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 06:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O7nLSxnJo2ojzbc9ZCEria5uzbpX3eTCBAbiyI5bsEg=; b=QgrfOLi64UP8N96A2kpKGwBWra
	V72FECxmXf7LrqOasAOLjh0mEMCqOh5DHfMz8tEOLReevD+VzUqXd8ZJGWySLSQbpXsNbIVYEmOa9
	Gs8jrSVLzY+no6T8v7qFn5vKrvNm+oGqgZyQ4VVh0HTwnxyUbCMpnDsIWuOfTbPqah3ft4e91x0Ke
	hyHUTA6dG4YvtX+a1AeglkHekgf3/yHVzkOWgPg62mpOQtVtfr55SoOFD3NzG00n919OnLB35YWkB
	rKHwJDLrMko/8y9oMDTyFqVKwC1TTi5+H0vANCyH3Q5WRp+DNjFTvKTk78OYgNyUPyX88lsjoxT1u
	+JodF63w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUIlJ-0000000COyP-3Dt4;
	Tue, 02 Jun 2026 06:38:05 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUIlG-0000000COxi-08Xa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 06:38:04 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-36ad15213fbso5331122a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 23:38:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780382281; cv=none;
        d=google.com; s=arc-20240605;
        b=Bm6UAxZbaSdbv2el4jePDksoP/Ux/VvdZ+3ifJyzah08FA4sZSp883SzmM6CNAXE6P
         RWMCNvVo5zNxJCZrJCahnMGk48iayKUy4KDfHhBgMdJid46IrtyhN+u+gKyoXINuykv/
         XedVa/E3NmCV2lHuQl/RvN3+/iFteAwUqTcbW2pHZl1A+GAjUo1SeQCTZBxK882EdKQC
         gwlKBaO4pxmt5bICVXWo05wVtXZ2OqCDmYvtmDH+P/TWuiIr8V1txIFAMQ23XNuhxtKI
         ORhmCyBcF5a2A2sOwaRelOWgzST9tTRMY35mrkSCmGw6u/hS5hxzDTyRHsDk81BM9DAY
         geNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O7nLSxnJo2ojzbc9ZCEria5uzbpX3eTCBAbiyI5bsEg=;
        fh=g13i+U0oIUSAhfbtXOT6LcpDdZjQeDiRX5K4ka8GoE0=;
        b=JP7DFwwUzpFNSNRM6or+54rLQICDWGwsbcyfwF0HO//nZPLifEn4DTWgy9ITNT1NC1
         NUaibZvaGQsQ1EXbOpojfLG9nhGrS13af1CwLsZLoD1m5WfIPNZ+/W1PDQjsK9uyMvzL
         GszFdzol0M9D980ZMDVkEyfPpdQDfvXMxKX77WK9+MixvXmIsDCi0eUkg86e6PLdA0LQ
         lwZ9+g2I4YFSKcQSOtHWee7TB5EQcyRtjpC1KtU5VaXRq2K+SixivMGiGuIF1Eu4sfTb
         kHjR1KtlLP0W+AaTcfFYKF9kdDHgWfxl7Q1Q/ZmfQScVUsD+aEXPszeDuq+cxBzcDBFX
         FE3Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780382281; x=1780987081; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7nLSxnJo2ojzbc9ZCEria5uzbpX3eTCBAbiyI5bsEg=;
        b=WebVUxWxdBF1o5cc2A1+zL+bIBtGSMVCJfrvO7o4piL7RR0xIeQhxblua+xGU35WXn
         eG8shEi/F7xttsU13rEYAUTWkWNR25OwZgbiXmM2pktgGHRK6XFPVWSo9alqTwkv5J96
         e5oHi9rdCcOHLxR7D1kDqIVzDHRufcQIydvvaF+jak3U7WTgrlsKlXHLAOU4YGmkSymV
         s1OsnTs/J9H36QKc66uZpGh09+MqNM+ZVgI3EUrz4QkuAejv+0BKO46Rc3blwbgffhk3
         7AIgQZ8M8S5RGvh1fjIlA3Ejvjkj/uceh13JaRK1bfvG9Fjztb9v9H797LINBUkztLFV
         MYmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780382281; x=1780987081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O7nLSxnJo2ojzbc9ZCEria5uzbpX3eTCBAbiyI5bsEg=;
        b=aYLad9J0zczJbiXbe9ylC54Sv4e43ZA5IAf464M3uFxWQTOBZ79nb7s+X/dsWakVyO
         gIRDY+F4y//yNHFY6W6KX38OoXOhKGr6c3gTG1EGMkS6uOClODpxRIZDdjcNEutZghtG
         sdPwq+XqU/kV21OdcrDF9T4cnYzTyVQo+nHjeYvKNY6hqH+StFGzYVnEJXZmoqGQbJ7m
         z7booVdjtyODw3hybbvWCkdfP5ytm/Yk63RucruPVpt39qOVJuJhtluAQqlQmVqpbaLe
         jBOBe+NSDNEW+/aA9M5LhQ+Nezn7+MohbdoQowv0R3sRqWSO45HV2qI5qHVqBgsvvWr6
         ti4Q==
X-Forwarded-Encrypted: i=1; AFNElJ/H1chBobj6cfFw2xMlw60/mK4apGoPwUvW4anjKbyprUuaHvlZfpUqOMSeYbPTrmnfjBfnfPauCRuA2SCMUNxK@lists.infradead.org
X-Gm-Message-State: AOJu0YwFq78ilL3eK8Z++Gp/MD+JsX/A1jKxMCJuLK9InCuC4wrYRQPP
	O8HXj5cFc68J4TByYjcnOKk5Y7AXd6A5Yc9Z/4K+1u3URhPTQp5uoMothv3yMPvo4IuJmcRvf5m
	J/X2njeDg7vNWOMZPHIOh13aQ2+9wxLE=
X-Gm-Gg: Acq92OGHxjps5o0wocJ0h6Lt+QIecBPT1h2YaX20wv4GjfqVbXlx9OlWqWIUMJmRdNw
	RYbEUVOSMx4MVydGgdrFbrP47GH9TuKVxCA4MJ6ON+9i7bW3Lo3d+VJjsDFvXgv/0oxnvI1dnFR
	W/6cVGYYdrVfWt2Twey/Donf6lulTyCmBGZy8YGs/FuJefmX7HiSJOu0xoSuUBuF+3UgTRLKcv/
	tYHyKsMmsoWX+3gsfbTNpVRPTuxBqN3S/u5vvgAMThwwSVtqzedygVWZKdT3M95YTHyjdNmYjTH
	zeKEU4EMJWBHhaxF7mA=
X-Received: by 2002:a17:90b:2747:b0:36b:9c70:3367 with SMTP id
 98e67ed59e1d1-36c501e8716mr14091662a91.17.1780382281075; Mon, 01 Jun 2026
 23:38:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAD03fjaBJGtNATBxaYO-PAxdKC=HxYgE+M7HQ_a0O+3Sp9Mruw@mail.gmail.com>
 <84d8f2a1-6562-47a9-93d7-2d7ff33c31c0@lunn.ch> <CAD03fjah2GMedDtauPQjP0++3USpy6tm3AUemgAjVHS=5Nirtg@mail.gmail.com>
 <8f7eb9c7-6695-450c-81c4-fb96643adbc2@lunn.ch> <CAD03fja5oG3-BrQoy4+LEmCWPYGW_JWDEkaPndjSVz=PbRj4wg@mail.gmail.com>
 <2026060202-wad-skittle-263f@gregkh>
In-Reply-To: <2026060202-wad-skittle-263f@gregkh>
From: Grewstad <dogestad24@gmail.com>
Date: Tue, 2 Jun 2026 12:07:48 +0530
X-Gm-Features: AVHnY4KvCpb-kqDRYenuUh8abdPrvzxl2AJlcWi_F64K9qRgblLI8vRI3yS8KdM
Message-ID: <CAD03fjaHmsYpLj_PU48AW7h=E6XdMpqKsS7wQtDQKnEkGpa93g@mail.gmail.com>
Subject: Re: [RFC] drivers/staging/axis-fifo: TODO file and subsystem direction
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Andrew Lunn <andrew@lunn.ch>, jic23@kernel.org, jacobsfeder@gmail.com, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, hjk@hansjkoch.de, davem@davemloft.net, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_233802_069955_44706B19 
X-CRM114-Status: GOOD (  10.36  )
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

On Tue, Jun 2, 2026 at 11:28=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:

> If no one is using it, why don't we just delete it then?  It can come
> back if someone shows a real use-case for it.

Yes, this is what i was thinking. These boards are generally used for
development and research teams can probably maintain a patch if
they really want it. As you said, it can always come back if a
user-space application depends on it.

One drawback that comes to mind is a development group may
currently be maintaining a proprietary application that depends on it.

Thanks,
Arihan Bhor

