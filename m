Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF76E6F06C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 16:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QUMHVY5Pc5ujaPIETtg1OV7OoMZH/DlrlEhMasUvFWg=; b=PASAPKoKAsY241VBktL3ZwcycM
	SGuhCXuHADpQpeDa1+cJl/aONvqFNB29McVSlJiD9j43NhQT4deAt9drTZkpfLltG1qqttwXdSKmI
	R357lQeJJgx/gTk+opmRAUglMdsDp7Sryno1xzisCJaE7LIqhVAlw1ObuL0R86QKVkZf89ivy0dKz
	snJ4/aXbg1vRZZn8fA4dCjOVKtu7lW+gyIrug7jcGPnsO8YjykacWtMpeZmmn+vDr6UzgHx/PAMpt
	H4oI93gDs4EHxItnxO69+5MCK3VH/DFiO3Xyax4Qt5RT9l64piriSCdZ3rXGwBX2isLBDW4II+8R2
	CHZXKQgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ua1-00000007grm-3zM8;
	Fri, 01 Nov 2024 16:32:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uYN-00000007gWs-0p15
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 01 Nov 2024 16:31:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QUMHVY5Pc5ujaPIETtg1OV7OoMZH/DlrlEhMasUvFWg=; b=A9DqY2yKQeXaUtIAf2pqlUTovj
	OnojkQWEmzJ1FYHtR/JSsUoSON6885IF3boqmcs1PLEQvejjsqTh03bipDScQGy2jlZWGcXCYKUAR
	goC8F+KYxW3IXdMoBt7/vw7EdXIL/jc/ZGHUs1/28FHrn5uOw6sJqWA99m8AYdvoC+J74BykwswO3
	ZR/2EOtjR4JoAXGyUWEt1571Atkwv0Mwi8bo/YuELQUQ/K2e62h5XcJsqDx64WcUsjArf3DmDtFCg
	zphVAjC7t5+ils8HzQ2XdhK5Pi8waidaOjbtOOKjQ1whxUoXMPgflWu1B1HzqrxnQ7Zdqle87HLi6
	XjYL5D9w==;
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uYJ-0000000Alft-3UQT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 16:31:13 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e3d6713619so36490677b3.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 09:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730478667; x=1731083467; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QUMHVY5Pc5ujaPIETtg1OV7OoMZH/DlrlEhMasUvFWg=;
        b=n/aFlmQpNNRbEryVz5u4+GUhf5FpeKIVwPDl7Nb6bwKu6fzwlWcOyDqqpUZ9O42u9m
         jTBwU/ATSQjXhY8ASscxKI9mXi1bW6+A1odgWWAyR8Mv8oB51I7p6ZpT53bT0EFllmwb
         vkagnvsWBZ75ryj6Yru9P+yhnGb9LXeZXPmKxMFcfwRbWTv7Vv8trv9TN5jHCoGw4hVS
         45v8kHs5HnmppldLXN09mfdfasqE8JYFLUmcZ7IMi3LvyWviEVCSikGheMLWS4myaeQZ
         ljKtnc16fJ4wEwiZcNr3P/nsyxR1ySUERDBljorfTdl/LqDzebtXo3KEjJ+pBsY42cg8
         Prbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730478667; x=1731083467;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QUMHVY5Pc5ujaPIETtg1OV7OoMZH/DlrlEhMasUvFWg=;
        b=MllC1mKTJJZv6SeWDsgv4p48RIexFc/ZdKpbUWLNW8+Hgo/ROV+1G8m8XxQoLN/exh
         w0OnZBiMdc9AC5mWQI/NW617zOC348Jb5VFu7DdhbYozQVCvKxJc9DggEwUwL4urZYhX
         elnSAFaGvoWGwuSaFrUX671agBAfGSd7aRuNjIEvUMvTg1E4v16Cw5BRSa7ktmuQSZC/
         6onfn9ICpgNejGVMjplL7qkPDy3jwMFRS35ryt/xy2/La8iRFVfLim5nvDc0QHB5HL+G
         KMV+fPDfNNFYe0xJMIKNH5lW48DPJ0nXhy+kE8YVNQCYi83ta3bmCLxA8f6vV2CX0PGS
         0nqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXStUuSKktDYxaq1TLZZD+8TTJiWz/Goxo+GlYdFI77mloibTZ9746qduqR0XzPCOskinE0N93+WN+WRBSgGDkV@lists.infradead.org
X-Gm-Message-State: AOJu0YyFm0H2uz0+syOi2QBYiaHzivOFV2JyTGdhvrD626JfGPyW5aar
	YB98JP4Kgqr2+9OOEq81I7J/10TWgS1AV/XYviSx7a7qqWo0bJoZWbW9exxMNHGqMxoGxVvP1fx
	WtQ==
X-Google-Smtp-Source: AGHT+IHjSky3TikiN5BvrlqT+n0lNdXJaonGgodvNxJp+r7LiGTo8fiUiA/fuWajhuo5hdeSs5DxJ2eOWac=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:c8c6:0:b0:e33:111b:c6a4 with SMTP id
 3f1490d57ef6-e33111bc836mr1008276.1.1730478667415; Fri, 01 Nov 2024 09:31:07
 -0700 (PDT)
Date: Fri, 1 Nov 2024 09:31:05 -0700
In-Reply-To: <ZyUARgGV4G6DOrRL@linux.dev>
Mime-Version: 1.0
References: <20241009154953.1073471-1-seanjc@google.com> <20241009154953.1073471-4-seanjc@google.com>
 <39ea24d8-9dae-447a-ae37-e65878c3806f@sirena.org.uk> <ZyTpwwm0s89iU9Pk@google.com>
 <ZyT2CB6zodtbWEI9@linux.dev> <ZyT61FF0-g8gKZfc@google.com>
 <ZyT9rSnLcDWkWoL_@linux.dev> <ZyT-6iCNlA1VSAV3@google.com> <ZyUARgGV4G6DOrRL@linux.dev>
Message-ID: <ZyUCSZEv4w1yXwEb@google.com>
Subject: Re: [PATCH v3 03/14] KVM: selftests: Return a value from
 vcpu_get_reg() instead of using an out-param
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>, James Houghton <jthoughton@google.com>, 
	David Woodhouse <dwmw@amazon.co.uk>, linux-next@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_163111_999886_13A5F845 
X-CRM114-Status: GOOD (  13.76  )
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

On Fri, Nov 01, 2024, Oliver Upton wrote:
> On Fri, Nov 01, 2024 at 09:16:42AM -0700, Sean Christopherson wrote:
> > One thing I'll add to my workflow would be to do a local merge (and smoke test)
> > of linux-next into kvm-x86 next before pushing it out.  This isn't the only snafu
> > this cycle where such a sanity check would have saved me and others a bit of pain.
> 
> Eh, shit happens, that's what -next is for :)

Heh, but I also don't actually test -next, which was another snafu (not my fault
this time!) from this cycle[*].  Testing 6.12-next prior to the merge window
wouldn't have made that any less painful to bisect, but I think it would at least
have allowed me to detect that the issue specifically came in from linux-next,
and the bug report would have gotten to PeterZ almost two months earlier.

https://lore.kernel.org/all/ZwdA0sbA2tJA3IKh@google.com

