Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91219C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 18:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KdM/4c0BaGsTBzjmE3nYXMTVYUgF5F0VUqduP5rOLl4=; b=eKcGB3clM0eEKm/fZyHlF1TZ4Y
	Mc9e6x5UeTg9dzSh7UjaFREBnHGzsxtnHRC9/2QvK6MmOCO9a8Vr2vd1/N0Jtgq4rr3iqN5xu3tkd
	/vT4Ts1ard5i9w5r8/A9MJRKVuSkZHwn9KnJEd5efMRgEpuuREUIL3839Qz4EJgrffjqN5ngUfi9e
	1uj237NSqUl/pLm1sGa8coYfUJNmsdnBk+mQBtgFhFokP7RPhvi5iWF0dwWBPtYEls6jPnpzdLfa7
	KrIcNHDsSNEliTcgoNUIZ4X9JEJo2TGVaDXLkL8SaNORuK1dOoV8dQbe3QNmZtYGEzDnI+XfLGxEh
	+nv02K5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhYDo-00000004GGz-1aCD;
	Thu, 31 Jul 2025 18:41:44 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhYBE-00000004G5k-2CV1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 18:39:05 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4589b3e3820so12857435e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 11:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753987143; x=1754591943; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KdM/4c0BaGsTBzjmE3nYXMTVYUgF5F0VUqduP5rOLl4=;
        b=UqOm9IL4sCYWJw4E7Rz26sKbXatBOTrn1bfdpitcqmjie99HiVhgeNlbDBPIT1Hwrg
         PYpuxPeEs6h6+Y3xaSmgDRMlVbUx93flZuKfCugxbE5nkcJ/L4F//vNsFjyoGr2e9hMr
         5UubT8StwrhHj4btduI08GqFf6bVwjrca2ZAnXRrEYDOtKVFAMg/O7zJGNeFwY8GG3SE
         wEngprh0YWznXdky2rj0mZEilcZVLE8qi1BA0EagacC6lBK2se2lnD2OEs8fBsTgDqqM
         L27iERxjv7NIIJfwNtWBB91lwXjEr6LPNgRvBFG7e/5eYi3iIN7MhMWLM6b4XDAxtSwq
         D42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753987143; x=1754591943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KdM/4c0BaGsTBzjmE3nYXMTVYUgF5F0VUqduP5rOLl4=;
        b=s9e4ValqeB4qOScW9ddHpJII+ePumH2zKN1mHl3WzQq8QTLKfkLHSnP+m00RtZeF/o
         VMrpeapHxsbi6WE+W0xccOPj02LIclKKMsdV2X1OppCs4NhIsHFVnY0mxNMutyKs+4b8
         55ab7CGUWb5+e71hivjOEntjI4GEKXrBV7H4XjCHH2gmrvwU2oTIul1Olx1WUVExtdxr
         ov4b1Z2xckizHZO5lQS3Uis5jbxyYhuaQPd8O/hVHSAwckZ8cNGZVpynIsW9VLUmQ4NU
         vo5TxRkwrsNzXAbHy5zVF/BcQgTu0hZO0TWLfq+slLP0wXY8/HHKbD2ZMciq4bCim9g1
         PeCg==
X-Forwarded-Encrypted: i=1; AJvYcCWo5TFAxdFBBKp/T3kMHLfJT9NjCbdVPEL1wgnzL0nPd9LKbqKm6yg9behFaluk/ICHoefv8Ij5UsZG+86O7DQD@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0O03LkqkDvtKQrv/qcka2UBeL2BnnMosTvVSGjiY12jK+TfLR
	XJkaejtGjjlpYc15aQRd7ufjsek7vuhA0A+7RY7nZ9lmRYC1Rc0GqUUnMAwGvOt7+jLAgwo++ym
	ylHKjG4EAu3h8Hfs0YBKsv3bcnWyKqiM=
X-Gm-Gg: ASbGncvVHgLRjt+QS7yb6Ns0/oXoUOJ6XOhopNaEAPbvfxsfWRRzmY4EDF6oOpvbtC8
	Ijx7S/ZFCkFSOZy4NiEOKe5fpfELBXwG7zSxCh9knCjE9VukUeZ/wuX3WWvsd+6IyIwP3PpZGvZ
	rUQSoPOJtDKKjMmQE1cbI46UyzSLG9dKlm3sk3QQ2mrzGeEshTZzVZlxhdxhhEyaZRfK9guLmL7
	/A3LZ9RFcjXShe4o82x6i4=
X-Google-Smtp-Source: AGHT+IFJL8NBAWQY02zy0tEAWl/qP3DrbLkDthNjpOnxX6jcZZ0At+S8eHNdcBVEIsN3QGpLJ1a9BHZMro9h9uBqIE8=
X-Received: by 2002:a05:6000:4312:b0:3b6:936:976c with SMTP id
 ffacd0b85a97d-3b794fecc6cmr6327698f8f.17.1753987142650; Thu, 31 Jul 2025
 11:39:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250722205357.3347626-5-samitolvanen@google.com> <20250722205357.3347626-8-samitolvanen@google.com>
In-Reply-To: <20250722205357.3347626-8-samitolvanen@google.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 31 Jul 2025 11:38:49 -0700
X-Gm-Features: Ac12FXw1CsiGw1xqnFICxDSaAwN-blfRuazTaEhPIwPWVxcnOPQAXUsIGCjRDVQ
Message-ID: <CAADnVQ+FeGjNAJFyvpF_POB8tZUMXDN3cz_oBFNZZS_jOMXSAQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v13 3/3] arm64/cfi,bpf: Support kCFI + BPF on arm64
To: Sami Tolvanen <samitolvanen@google.com>
Cc: bpf <bpf@vger.kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	Maxwell Bland <mbland@motorola.com>, Puranjay Mohan <puranjay12@gmail.com>, 
	Dao Huang <huangdao1@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_113904_562607_6300C234 
X-CRM114-Status: GOOD (  11.41  )
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

On Tue, Jul 22, 2025 at 1:54=E2=80=AFPM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> From: Puranjay Mohan <puranjay12@gmail.com>
>
> Currently, bpf_dispatcher_*_func() is marked with `__nocfi` therefore
> calling BPF programs from this interface doesn't cause CFI warnings.
>
> When BPF programs are called directly from C: from BPF helpers or
> struct_ops, CFI warnings are generated.
>
> Implement proper CFI prologues for the BPF programs and callbacks and
> drop __nocfi for arm64. Fix the trampoline generation code to emit kCFI
> prologue when a struct_ops trampoline is being prepared.
>
> Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
> Co-developed-by: Maxwell Bland <mbland@motorola.com>
> Signed-off-by: Maxwell Bland <mbland@motorola.com>
> Co-developed-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Tested-by: Dao Huang <huangdao1@oppo.com>
> Acked-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/cfi.h  |  7 +++++++
>  arch/arm64/net/bpf_jit_comp.c | 30 +++++++++++++++++++++++++++---

Unfortunately there is a conflict. Please respin.

--
pw-bot: cr

