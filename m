Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343CFC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 20:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bfK6+5yvZwS++ZL1M3GTppwzhzu/JkYKf0pRnfCHdYY=; b=0Zd4+2B5uKUjG4XMpPPmUzXi1D
	vDpXkQOTNhQovz/h3jWkXRMASk9aRFyxaPY4oBfJ3BEmpUUnWMQHpQUKnXGom4EyQSoA+NaHlHr1e
	8eWhjUMexBUy81epRYjmaA11XLCRoPHfaMmZOqHRwgMu7PZN5oVsSZP0OQ+R1Iq8MYWHDT9LlZU43
	DyPD9fotjsoZN2av6EzjUQ5G6ebR+YyTGl62ijLQfTccAsuCZN3GLhEhMaRfFUZw9Ns9Clp0c2Cwk
	U7O9TeDxmTfDRC4A8d/SrjLMUAhIXoxEUxVRTyNSaj/n8CbApxbAD0m8EmmsVoL4u+KaNYhhLXHo5
	hjYOsDdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuddS-00000007289-32iP;
	Tue, 18 Mar 2025 20:34:02 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tudbk-0000000722L-43NI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 20:32:18 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-390f5f48eafso3926861f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 13:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742329935; x=1742934735; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfK6+5yvZwS++ZL1M3GTppwzhzu/JkYKf0pRnfCHdYY=;
        b=MrNNTGCLbbugcqqeYN4JkGUHvrXafgaqNHdRmNTRi3zfwLZR2UeYeetF44f2fsADJA
         e5bbbP+X7llSAXP537pqUCpgwlEzr/kyWYCPP3rbU4fkMfFcG/7yR1bvRJMybXV2u0Ms
         XB92j3Mf2PUftcUxFzEFoKyxW2hn5sXv3NDSMg+juVwUvoUtiUf/3o7eA5CWlWy/smrV
         2E0CmLwCw5bD1BKuogeC0UtKsVTbKIMotqiXLJjXjMh5hyNxCoLDCFsfc6IBCNEd0aYV
         9jsWilQxg/8nhu3d5VypyFeTifNOb9DczoOS/ZIs6eweL77XpOANXKKqhwwPEgjya08P
         fUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742329935; x=1742934735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bfK6+5yvZwS++ZL1M3GTppwzhzu/JkYKf0pRnfCHdYY=;
        b=kQIu1FgGyB4aANHLAP1lSEFT7uJT17hS8wQBYf8nQ1jR38ycvO35kul8N+XCgt2TwJ
         iBbu4b+jjvPtcl3r4Gu39CBIUHDI1mtDgS5ZWaaQBBg4M9B1W6BEHTUZ/59L1BAC6goF
         9snS8CSCeE5kwkBjBks6H8q4QN7uxi/6hBQlUck9LrvF7m1ZaGm2Ekg3wO5kJHM4BtdE
         BLQkSR2cs2MfvlW1gKtTVFmXK9bm9o6PCPXSdawnj183xdLNhFBLsAg5thrm42mA6qPG
         iAwghNV/sKbZdVb8TlLCHqrJsK1ZI0kcSrsmA2tqB6gZ/BDKw1Y8+DuJ77t9RkN4Uwuq
         3SOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWy1ecykoq4SF6FrAXYJa4a0Bq46vIwugd1Gs8WvM9wNAMp+teUhfJzdJFYd85cY6zU4SArddmZThk+u8y0Bnd9@lists.infradead.org
X-Gm-Message-State: AOJu0YyC6/fk5eUCfv6RMa4X4cR2zl75mqkW/uRWSRbO9bOpKW+f/BA9
	ZhNLNJ9hFNYmU3VfxB2UjneTTLvQdL9rkOQVBW1tNnjT2CeXIWRMAUNiucJEQHXDM+dqWYAvebv
	GD3iVbAr0Y+F7GyD3rm3ID/Pvxe0=
X-Gm-Gg: ASbGncsjXHJA4za4NMfw25+N8QG/ZTzNZq40woQRahEDAyajYsvGoE27gK0OG+eewJf
	4ArPG/20i5MzwoL17bY9LgJHZG3ex1FwOtIhDW9iXgrlLEUVyU8Maa6bGrwKJmgGmJtwwTrRqE1
	Gzgl++a2fgMB9QjFXjiMeajasBuGTZiUf3IUm9h+aAviw+wM+9bHxe
X-Google-Smtp-Source: AGHT+IGDSk690Dg2444bFHp255MxioGMVwnjaLZCAO/imq8VEe/4OCDb9UNwHAv0cZbd4BRQHTm4rkFt3vxht35PQpw=
X-Received: by 2002:a5d:47ca:0:b0:391:2f2f:818 with SMTP id
 ffacd0b85a97d-399739bbc6cmr184160f8f.9.1742329934452; Tue, 18 Mar 2025
 13:32:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250316040541.108729-1-memxor@gmail.com>
In-Reply-To: <20250316040541.108729-1-memxor@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 18 Mar 2025 13:32:02 -0700
X-Gm-Features: AQ5f1JobP-bE03Krm6-jbM9LaJhqeVyXw4w6hFEVc9Q5_eCpxQmJX24-8FItlbA
Message-ID: <CAADnVQ+Q+meSfHmang0QYjsbBJsNG5rJXifUxrRXC0GNQKUcnQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 00/25] Resilient Queued Spin Lock
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Will Deacon <will@kernel.org>, Waiman Long <llong@redhat.com>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Tejun Heo <tj@kernel.org>, Barret Rhoden <brho@google.com>, 
	Josh Don <joshdon@google.com>, Dohyun Kim <dohyunkim@google.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, kkd@meta.com, 
	Kernel Team <kernel-team@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_133217_006181_72C5CCC1 
X-CRM114-Status: UNSURE (   9.19  )
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

On Sat, Mar 15, 2025 at 9:05=E2=80=AFPM Kumar Kartikeya Dwivedi
<memxor@gmail.com> wrote:
>
> Changelog:
> ----------
> v3 -> v4
> v4: https://lore.kernel.org/bpf/20250303152305.3195648-1-memxor@gmail.com
>
>  * Fix bisectability problem by reordering locktorture commit before
>    Makefile commit.
>  * Add EXPORT_SYMBOL_GPL to all used symbols and variables by consumers.
>  * Skip BPF selftest when nrprocs < 2.
>  * Fix kdoc to describe return value for res_spin_lock, slowpath.
>  * Move kernel/locking/rqspinlock.{c,h} to kernel/bpf/rqspinlock.{c,h}.

Applied to bpf-next/res_spin_lock and /for-next branches.

bpf queue_stack, ringbuf, and various local storage-s need to
be converted to res_spin_lock in follow ups.

