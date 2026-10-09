Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B536ECA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 06:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nIKpbv2RO8oGZRd2yIp30nXCo/En4v7x/XnTXfq6DPU=; b=FCFjd3rL1cUDKhevojmQXhlFkc
	uIt2xHGdgwHXIgIwXkkhJWrVaTBqYb0Niil3eL+aB0Q2F36kLTneEO8OeSOJ92NzWz/ff2Guxxy/h
	0Lqes52UwmGt4NLrTvzYtosMXf90+xDWaTTXiwx9XJhsvoaEgWVo0bskzfHP135tRY09HrNQaA1F1
	QD5IGPNIPu1xT8w0Xx12L2bDl38w+CmJmNPKNHX1ASMjgDb3ZkY9mF5f2qnxIWo7YxOgzYRF/0SYm
	P3CpQxemJrGCkcUUt2dwcYYnI6b6dGuKick5QJGLkeTX4jcOHWv6DwJPzdSx72MYN5+cato+QsksH
	NEjgB+yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF45w-00000005csr-35iv;
	Fri, 09 Oct 2026 06:28:40 +0000
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF45q-00000005crb-44Oq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 06:28:39 +0000
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-5c998d93153so2570900e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 23:28:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791527312; cv=none;
        d=google.com; s=arc-20260327;
        b=PkPLXneFvQ3wm5NUp7EYgPiPRzzFNE3o6SZWYN1QUqdSPf/bdM4GTz/G6JbRJGzKPw
         LP3o2VymYcrrof61qUaNpvF9Dn0fXHxdcWvIPt47pccl6kQM/nugqq+nEdj/aTX7Dsvx
         FxwS53cY4eudX7XFFE9VzpmUlz8P0wLDzTYKQbMC5uQ7qs5hcMSHdSa6rHYF7V7h0yEK
         oH+uIx9Ht32DhsBHufdcTvsTZDy03FLptuF3yhlTSJECbQYtv2URkZE+9bJM2rGu3/yM
         H0Yl3leauYsixVuPOsXml0CjZY1hdBYiydbSCrcsoT4EodvMmYfw2gQx7nI/vb6SXpec
         15DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nIKpbv2RO8oGZRd2yIp30nXCo/En4v7x/XnTXfq6DPU=;
        fh=LFk6sKzs2OcWddD7zy/Q3NjEtsSbqJXHOTyQ37lMVvU=;
        b=Z/2xNbTTVqRT/8yTw6fciR3jxnNCyeXyka8uekWgL7Y5I7/QwDyeK9EwppIMjVJlid
         l3YgBo6meiY6OiJPTjAS4QrFg8FwmckuJESbNpDee+9vtuv9Ksh2P5N0xQIw0z+qt70P
         duuhhWPQfAJJsi9o5ubdY2IP8Uh7tQZjmlciyYpNsMzrAspHIg4CG6R8eR0lGqWSWFqk
         zCN9D7KWA0mvQiE9v6h3PnNzkDzBtqckUXM0UNcqH2GqPpcRQjOiem4dywF7Yn/DB/kW
         4gBK70JRiVrlSXRSKhGDTQgkp/oIxqYB4RVHYx5xW4+RcKyl7Mk1rWDFw+cgZvyMOj6w
         Wzhg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791527312; x=1792132112; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nIKpbv2RO8oGZRd2yIp30nXCo/En4v7x/XnTXfq6DPU=;
        b=N85ynE48L4Zx9LN/Tqi5WRje7v9kU0rF4XB3UxbzO5jZl3O81mCc2Sm+0u1RflrzXY
         SPeumSS9Ww9MkpotUcGo6llURNlq/T634YH08W02RA+YJCFqT5Q8ntXaU+r2yOKorECh
         +Q8TU41cPh8l/AQFX1UmN1l0IvHNTItRqkrlJXDBlaqg/5B+vO/vE4xMFsyLbVneHw2N
         Jh+dLugcjIkrMl0Iq1lDTkiXgPJLs5EaXmSEQS5LOqy41se1OYj7Xr4EV+VDaA71Dgop
         jZkLJZ1Oid77sJvX5K0ZTfTpZvnqpR1OYYWgJAHMJiNU4ZMdrDHTzI6iZSQ0u80h+a5c
         G2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791527312; x=1792132112;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nIKpbv2RO8oGZRd2yIp30nXCo/En4v7x/XnTXfq6DPU=;
        b=svwmyJqUZ6v8EByQbZAgEn5dUpIoty9/36VI+mEa4Ji3zYbQeXKbAdtp6RaVF03Sxi
         THBZmLMDXkJMk2MNm8GIDKWm0rnRTo/U+Zz7/8YXSezwW+gtc83Wjx2McsHHtxd/soiE
         SitM0GPnm7EC+UCavEztkextm3bqTs3Evkcl8+o8ME6Mng3DnzyYeOC2uMRLKaYY2SDj
         S5+e8UZjjlQcmxHovbQNs12OclxPZp+wK7VvBgumrpkWy8HOFlkR3cRhOqxkwNbbegPh
         0jTS0aSBfNc6hp2OW5ZPXXI6xvRi4XhxR2dzMOAKvCs76NikIP5qQUiElwG23M7gR4jE
         FXbw==
X-Forwarded-Encrypted: i=1; AKwUvBw6l665ugZ1KpotDddm/7eFgix/5RfBir2W87BZzFFtPeto6ljSxjRopN+XQ2gcOFzoGHGUJRs2tCKT2fO+48XK@lists.infradead.org
X-Gm-Message-State: AFq9FYL/u9XmNeBsY/Sa7n2zy/8ytflFQ67jkbcl2Sl1w+niKBKoD5Vg
	0fyI7qD3+Z0odAWccFdZQWZgk4udjO0Ja/g36q8k+f9VP069AcodQcoeMA7W3ppO4yvF7gbHefn
	alvLIbHkPks/bhrvrcPtopxwoadldJru1nRq/5wPO
X-Gm-Gg: AYBFou1Y1QurOydpoysQDwte9pS7cPZgNji90f94X6Mx8weSMPlCaZqfxBETBEDUlSD
	wavJPi+EXUmD8x2AdmQBjeT7IzlEoDIDBteAafKEuurXLimZ5SHXrmyGiF1o9Ih7Cr6l9S+ucYH
	qIi94EQnknoK5mEdvrXuZ4xYDegZND9fycYr62LaKzbXEipVQkqcf1LPDDotFpHezIvnY4BOe/o
	HMy56pPUz+ZF0mQRpEqT5gBxQDGmXMbl3/SZYM52wyXNT8b4N/3El3BkEomUdQ+ENYfom92T//k
	s1hgHE5DhizOFGQuKT5YXxSnOFHNxCZakLi1sNcFAp2Myw+QQtaCC4Hjm5/eNrB69A==
X-Received: by 2002:a05:6122:e189:b0:5dc:aa1e:8a06 with SMTP id
 71dfb90a1353d-5e91f43f417mr266429e0c.5.1791527311933; Thu, 08 Oct 2026
 23:28:31 -0700 (PDT)
MIME-Version: 1.0
References: <20261007114335.440322-1-dylanbhatch@google.com>
In-Reply-To: <20261007114335.440322-1-dylanbhatch@google.com>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Fri, 9 Oct 2026 08:28:20 +0200
X-Gm-Features: AclHuK8g8wzpeXyMue5uZareIGGpfm7oWlT7bNlgcuKmGssBskC1rzSd82Cda-Y
Message-ID: <CADBMgpyF+QgmLjX9p9wfikZksFFg47QaQU6fHrnX=y58Wvk-gg@mail.gmail.com>
Subject: Re: [PATCH v8 00/11] unwind, arm64: add sframe unwinder for kernel
To: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <ibhagatgnu@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jens Remus <jremus@linux.ibm.com>
Cc: Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Song Liu <song@kernel.org>, joe.lawrence@redhat.com, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Randy Dunlap <rdunlap@infradead.org>, 
	Mostafa Saleh <smostafa@google.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_232835_015788_D5D1AEF9 
X-CRM114-Status: UNSURE (   9.81  )
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

On Wed, Oct 7, 2026 at 1:43=E2=80=AFPM Dylan Hatch <dylanbhatch@google.com>=
 wrote:
>
> This full series is available on github: [4].
>
> Ref:
> [1]: https://sourceware.org/binutils/docs/sframe-spec.html
> [2]: https://lore.kernel.org/all/20260505121718.3572346-1-jremus@linux.ib=
m.com/
> [3]: https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.=
git/log/?h=3Dsframe/core
> [4]: https://github.com/dylanbhatch/linux/tree/sframe-v7

Apologies, I forgot to update the github link:
https://github.com/dylanbhatch/linux/tree/sframe-v8

> [5]: https://lore.kernel.org/all/20260821195259.2688377-1-jremus@linux.ib=
m.com/

