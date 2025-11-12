Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B258CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 14:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cFiNysBG6OvNw9jo5O2oUZrLaPvoxn/0er906rz18Og=; b=IiFLGzsQ9Q9y9HbztcUghlVtOX
	nCozrL/24nBy4LrzcmJWgHjUFwq6Scz70NWZJ5QOTgnqSyyhOV+OciisjW4cj9nQkjQj+5Dc0I4/i
	HuIFZAtWHMCSuWEdF3YvLs31/A//y3smIQ9nP6ORfdTWimzsI0uhMNKgEijxr0jiMcMLz3AuDHdFZ
	n/rac/tMPJNptyA37h0bOExcJy/GDM89Pd/GbyxJCvvUc/s+//IQHw+aO8k6Dbn401YWKfUeeN3CY
	9ROFOg37Sz+uERqsUz/68eS2TrXh1gmnahkr813K5Iiw1EParLD1cA1lldJt8e/Grr3cc66NndGYb
	7q4dR61A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBQC-00000008tl4-43PW;
	Wed, 12 Nov 2025 14:02:04 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBQA-00000008tkI-0geX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 14:02:03 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-47728f914a4so5649345e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 06:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762956120; x=1763560920; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cFiNysBG6OvNw9jo5O2oUZrLaPvoxn/0er906rz18Og=;
        b=aY0QO2OPYpx3js/WOhMIbnAO6MDp7O29EanSHk6XkO1zlFV4XZG0wdFVpH3zjWQ9vL
         zyj/4vbvx11qQs1UNRhtuhOVIAFJvbJQ/CWNIj2UP13Ndg6TZgfB4gFso72wBly0d6ov
         9Lrocn5qALJ9sMXFr6lEnWgBibp6zNmgjQUSKtPlRNh+B0/c1h0+BjEPRoNmp6z4qbvq
         IJb+H4BsP7vVKzbxAAQ37DTmjWgATQ1kQuc5+9H/ngHIVab20nuYn0xtqF4ro+bTDkiI
         mN6rFtcV2FGZX6QFLm0Rb14Y5KcgX70A0i+OlQNEpt/ktfTLd+Jx9c4JJxO8OG0JWBX3
         pQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762956120; x=1763560920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cFiNysBG6OvNw9jo5O2oUZrLaPvoxn/0er906rz18Og=;
        b=aMy1M+JdKI8XVwn7I5/5byLLemjoZo0IK2htbQjo3a4uIEGYAHCkW+iNAfDQD2l5UQ
         242NTUTupPE/rsQBtlhkvP0/oJVbpSzwOs6El+h/z2rDY0wfmc3Omz+yMP2t+zKxnBn5
         Dr+mklIr81nQ+kPstZ56aD92XCwcnwOipCd+MD+1H/JjxJKoKeQ57f10XIqCZhXFuWFC
         Q7KusZ8De4tuIgYQKfLg7fF3dEXC3VZT7c9FNJDVEEE7eKqZKqO7PUnwoSO7HdPLOTeQ
         QpbQ7pfUn2/IpCh/hfYJBuIcomrkc3uWkYXzBxzbm6KcUOWdyWNVj922VhVBHLxArNuJ
         s3eQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRPlfRunUuwu9VVZmeEjYtbt6vhI80fNdpDbbmGdW4CLWrkxtHLcDGvpkDyh3c89cUzqF5m8osJYRfzeC6o7n6@lists.infradead.org
X-Gm-Message-State: AOJu0YxjdQSvWm29EXD8eCdqBnkjf9DS11jzk1BQIZsvjp4JMKVtAUyZ
	twrjqUbZK9qzRMkxwQWOPBT2E2UcOa5xXVGH31oZGy8vmI09UsH5aw5g
X-Gm-Gg: ASbGnctYkpDipvuktgFxWVVeX8y59pqy+CpHT8M3n/AzzuFxbU7VIDiEBZRGjrlCoVh
	FY0p4tHDmTMvTBGP+gIjijgLDeF+SJR7sHYBj0RpDHYHgTCTxZVKVsOpYSyUTyZcMRxM2UCFzU0
	hxzJEk7IXkfdNsbMJgtSm+lN12Lv2tnzjtyxEORkWXDokI5b4YHl0u6Eu/1ZbDUJWzJWTpd2k/H
	XoQlsFLiyorpwjg5K+9L5XhqrEJx/4Qay2fjpXa7FZ82SMNrgxH2o3Hay8DVvmNzTMXC3aHCzXq
	0i9G97XiIkUDUvTEqKLvpolqT7Fi2DadoGND19tJSiBBVemzbav7nE7cb1u4j61JVuzE9DndpTD
	sj8g1gbjymaI2QNSKdTi1ATM+5NG2qk29T8VBRDdHPskAEBd0h4sZ4TjHs1FQLODnXIajQfuio4
	YV/CJLvTWeZ3rrzbGQVI2zQ1Zvi1yX0/3PcpYAlBgFuw==
X-Google-Smtp-Source: AGHT+IEPEHr94PrGNc5EHN4MH5qDhAUHAyxSl1e3kw9Nt1S+if+1dRlR+YYzG83HBOq1lnqrURitPg==
X-Received: by 2002:a05:600c:3b17:b0:475:de12:d3b2 with SMTP id 5b1f17b1804b1-477870cdce6mr27931775e9.36.1762956119466;
        Wed, 12 Nov 2025 06:01:59 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47789ffea1esm16272835e9.13.2025.11.12.06.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 06:01:59 -0800 (PST)
Date: Wed, 12 Nov 2025 14:01:57 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Chenghai Huang <huangchenghai2@huawei.com>, arnd@arndb.de,
 catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
 anshuman.khandual@arm.com, ryan.roberts@arm.com,
 andriy.shevchenko@linux.intel.com, herbert@gondor.apana.org.au,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-api@vger.kernel.org, fanghao11@huawei.com, shenyang39@huawei.com,
 liulongfang@huawei.com, qianweili@huawei.com
Subject: Re: [PATCH RFC 4/4] arm64/io: Add {__raw_read|__raw_write}128
 support
Message-ID: <20251112140157.24ff4f2e@pumpkin>
In-Reply-To: <aRR9UesvUCFLdVoW@J2N7QTR9R3>
References: <20251112015846.1842207-1-huangchenghai2@huawei.com>
	<20251112015846.1842207-5-huangchenghai2@huawei.com>
	<aRR9UesvUCFLdVoW@J2N7QTR9R3>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_060202_215584_AA3BB1A7 
X-CRM114-Status: GOOD (  17.78  )
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

On Wed, 12 Nov 2025 12:28:01 +0000
Mark Rutland <mark.rutland@arm.com> wrote:

> On Wed, Nov 12, 2025 at 09:58:46AM +0800, Chenghai Huang wrote:
> > From: Weili Qian <qianweili@huawei.com>
> >=20
> > Starting from ARMv8.4, stp and ldp instructions become atomic. =20
>=20
> That's not true for accesses to Device memory types.
>=20
> Per ARM DDI 0487, L.b, section B2.2.1.1 ("Changes to single-copy atomicit=
y in
> Armv8.4"):
>=20
>   If FEAT_LSE2 is implemented, LDP, LDNP, and STP instructions that load
>   or store two 64-bit registers are single-copy atomic when all of the
>   following conditions are true:
>   =E2=80=A2 The overall memory access is aligned to 16 bytes.
>   =E2=80=A2 Accesses are to Inner Write-Back, Outer Write-Back Normal cac=
heable memory.
>=20
> IIUC when used for Device memory types, those can be split, and a part
> of the access could be replayed multiple times (e.g. due to an
> intetrupt).

That can't be right.
IO accesses can reference hardware FIFO so must only happen once.
(Or is 'Device memory' something different from 'Device register'?
I'm also not sure that the bus cycles could get split by an interrupt,
that would require a mid-instruction interrupt - very unlikely.
Interleaving is most likely to come from another cpu.

More interesting would be whether the instructions generate a single
PCIe TLP? (perhaps even only most of the time.)
PCIe reads are high latency, anything that can be done to increase the
size of the TLP improves PIO throughput massively.

	David

>=20
> I don't think we can add this generally. It is not atomic, and not
> generally safe.
>=20
> Mark.
...

