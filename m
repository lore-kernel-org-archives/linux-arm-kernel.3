Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7F9CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 05:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EpLC/YIfU6yMLW4SxxDWNvKdV2xI4uQU1cRoBBYT5xM=; b=hYx6+uv2siKaQOoFNWbI8NdJ6m
	hiNoT/NlumXaVcg03ruIhGxzUzdY+c3y8N6hj1WgL3Hu73C/DHUtmNrIbQeF3BTGTc5YxymbxE5J+
	8Qz6HWU6i/TvAdTol5iMimtyNpObmvrUTJcbpSMvAT7UN7AjoYv2YlQxk6lBRkv13eATjmkH5mm7F
	jJ1xLRXEAlRdHlR2d64tiMOyX0Y6rvKv6uYgeP50pIhEIhXqpwWU8UcbsquGtcRDIF6DfXOelmyHY
	ZSAzdjwe9pJyIx+LWjrv7wu2NvM1UoY6ADGJztJHcdxoqKSko6daUZ7dLKzShCnxOijayXsYt3TSL
	fwCBOoKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBo6Y-000000059e3-1LRI;
	Thu, 23 Oct 2025 05:43:18 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBo6W-000000059db-1L9I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 05:43:17 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b3d196b7eeeso92283266b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 22:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1761198194; x=1761802994; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EpLC/YIfU6yMLW4SxxDWNvKdV2xI4uQU1cRoBBYT5xM=;
        b=BhUylp+4jjDeh61ydIWFrAOvFrULT5p5otCN6kyvQzP2HEGD5uf4OgN2jKxZ8CmXxr
         m3MxXS6K37mUqJEJAysyxXiBsXBq6ecsAUB9OgjiZisT8A/JPFCK/zBpTPFvZmo/4viX
         XmWz17oBkHByexEfyxgBlPk8cwjpezFYYsSUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761198194; x=1761802994;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EpLC/YIfU6yMLW4SxxDWNvKdV2xI4uQU1cRoBBYT5xM=;
        b=Cu7TY1dvjmC18FI/lRKsdfbbmV26gNJaUONPtVaUSBQVIf+QLpHR9seXikk7Anv+al
         yvyN0CpAhGookxjlxSSiSOrZIV/ApEVZRpVOdQFXniRw0/tsHrFo/LhW/ArH0QWwrdEo
         PDR4FZjkx9h4moVMjyxPGOv80+c48MhhivrJApTwN6oZldQPZ4pem5BvDLA2Ix848aRX
         i1vTYioi3Ect+qk00doZDK69tUtUj1BuRpFiWSHYLCrHEgngmFc+Bu2ckSflXVQJRCv5
         VXiuVCB1TvI6MiBxKqmTxRmlfDEwZZ+ciEXyp5gHE3YReIsadt1VGQp82qDWuIk86Al/
         0H/g==
X-Forwarded-Encrypted: i=1; AJvYcCUccWSMPQlNfzgdmCkaPn5Sq0fbBe6jdKYbDBHHA91HE7C7bOzHg9Dz8u+4/60tYNwRFeinDWivgjYapKHA00q6@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+N7eibPSyYmkj1qdOQMpd+QUUmg6bYJ08vdWFVMo7K0umFm5l
	36TQjYHH1IARerY1TnxS3nxi0wActGVbz1hyFCTCvddxJQExwQahuCSO5dEjHHwcJxam8FyQFEu
	c2OWYr7nTsg==
X-Gm-Gg: ASbGnctFRS7029rUvwNxAtaOzNpZtC3iZb3FbUUeTaflOQEIdvLXRbsnjBKDWaf1myM
	AE/MQEF6fPOHSBkzXgJSuosv0QaTMyMh1AKFYVDVLvPuRH3qjwx5mLPPpa5jUvHWx7Vr3tTe8VF
	+cQgCq/4I7016q5TNH3p7Fp5EVbVuAWKKUVMTvBcefF8YH+SnX9b9EpinCh8fxIuGVlzcSYLqP6
	P/o+v3fwa0qg4LrBoQ/OVBSX9yVhzALCfsd/otErftL9tBzi/6KXxI/AvCvv3Wf6o24c+60A1UI
	ahNUOLBB8HZnaDcy93/UCWqNpz9IZ/qEDY952gUnElOMapQznZSAX+B/7hSbsod6eaVvCChY5P0
	c1ce27njAvQxbhQBlZxT3hacS0uIFeThiZ/0fhzVPLrQdLmqBVCTpoKVw+Zw8jLWSw4Wrjs+cc/
	ICS9iWKaFn27oPN0BJl8S+fug4xtfk0jD74f05dwjgmCfpf2ILqXVi1HE+0hYI
X-Google-Smtp-Source: AGHT+IHjc4uvaBLLbErHml1RlAzz/UNoLmHvQUh/L5APS4yzJ4ZwGKFGgRdUDex2DN/v5bZzDea9WQ==
X-Received: by 2002:a17:906:6a1d:b0:b45:8370:eefd with SMTP id a640c23a62f3a-b647254f631mr2592858666b.5.1761198194281;
        Wed, 22 Oct 2025 22:43:14 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e3f3349b3sm776962a12.37.2025.10.22.22.43.13
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 22:43:14 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4270a3464bcso271846f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 22:43:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUQhGWLZungJ618avV/m+9btRUN/FUYnCKQ9vJWsFA2DdnQ2oYTgVrs2GR7HuBpNA4CTDaZURTrto0sClkO/w8A@lists.infradead.org
X-Received: by 2002:a17:907:7ea6:b0:b41:c892:2c67 with SMTP id
 a640c23a62f3a-b6474940c41mr2905229266b.45.1761197863543; Wed, 22 Oct 2025
 22:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <20251023000535.2897002-1-kuniyu@google.com> <20251023000535.2897002-2-kuniyu@google.com>
In-Reply-To: <20251023000535.2897002-2-kuniyu@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 22 Oct 2025 19:37:27 -1000
X-Gmail-Original-Message-ID: <CAHk-=wjXGvUnmN5ZL3nhj_J0cbiVfeHsM9Z54A55rgHRUaVOfA@mail.gmail.com>
X-Gm-Features: AWmQ_bk45WJyQfjQIDpRb59HoMm72eRtwroHiVS5YhkseklDQ1bsOMejpvZJz24
Message-ID: <CAHk-=wjXGvUnmN5ZL3nhj_J0cbiVfeHsM9Z54A55rgHRUaVOfA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] uaccess: Add __user_write_access_begin().
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Jens Axboe <axboe@kernel.dk>, 
	Christian Brauner <brauner@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Alexandre Ghiti <alex@ghiti.fr>, 
	"H. Peter Anvin" <hpa@zytor.com>, Eric Dumazet <edumazet@google.com>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_224316_373451_1BE397E7 
X-CRM114-Status: GOOD (  14.25  )
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

On Wed, 22 Oct 2025 at 14:05, Kuniyuki Iwashima <kuniyu@google.com> wrote:
>
> unsafe_put_user() can be used to save a stac/clac pair, but
> masked_user_access_begin() or user_access_begin() introduces
> an unnecessary address masking or access_ok().
>
> Add a low-level helper for such a use case.

I really suspect that you cannot actually measure the cost of the
extra masking, and would be much happier if you just used a regular
"user_access_begin()" (perhaps the "user_write_access_begin()"
variant).

The masking is very cheap - literally just a couple of ALU
instructions. And unless you can actually measure some real advantage
of avoiding it, let's not add another helper to this area.

We spent a fair amount of time undoing years of "__get_user()" and
"__put_user()" cases that didn't actually help, and sometimes only
made it hard to see where the actual user pointer validation was done.

               Linus

