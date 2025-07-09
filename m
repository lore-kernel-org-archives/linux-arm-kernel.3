Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC30C83F10
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 22:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CEkPKw3M8obzlysqjDzuJ0l8ChAy9EN0Uu/m/zS8TW4=; b=B9l/ErGnZs7b+G21uTpu1trP4P
	KCVabEsVgxCrt59ynR3sAigtHb+y2l2YVI0LfxlS4WdYHkW53I8tOj6XjaaPS5OHmNxJFny17XkFZ
	62lAmmL1UCRNQk8dEdFNUdTH6Trs99GLJBDxmRyQMgMhdDTgVvupUxD5EEjddHQG/gr/3K1GYO6Tr
	bdmxbxDkoY8irTbMeikcqCFRhhXlzWoKn65CIhosuC3lPMYCZrEYqZucI4v3oNpLA6OzZ9pES28lV
	uFeWjEGDL2S0ROdFX3OrU9QY2OU+3BOBkX3PJhHeIGuPnzCBaWNTDiXadEAZxs3x2gZs3nVkL4K+u
	0Mqbjg+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdkC-0000000ABxL-3yyp;
	Wed, 09 Jul 2025 22:58:29 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdEc-0000000A5Ox-44Z3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 22:25:52 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b38fdc93c22so114315a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 15:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752099949; x=1752704749; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CEkPKw3M8obzlysqjDzuJ0l8ChAy9EN0Uu/m/zS8TW4=;
        b=KyvGM5P4Kn9u220Mk098/e6j5iF4wQ20ZSJMpNIpoZ2aiPJMIbCygigJmY8JSwY+G4
         9RLQGRshCA0NmUw1xXpLgAa0qelsQLIMVa8BlatHdQgKDLlqZBo389EI+f/gvGHBKs4P
         WrEZswI0QKyCRQ35UNGYACugQe4UEK+qgY91fnn75znpa7eAWhGv+QHZqN9t5Zdc2LO/
         kGGsMkr2zeoO2n3x9jdDUAQnWl79ffmkunoyCCmxP+WqX24vPJK15b32PQWqoRNw27hT
         BXifGwh+EG2FDpu9vpHHiipi4uFiMlBZSpXccWkAm03pPQW0Vxpm4+0WjYtLjuQRq1rc
         F7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752099949; x=1752704749;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CEkPKw3M8obzlysqjDzuJ0l8ChAy9EN0Uu/m/zS8TW4=;
        b=MBfq5Ep9ATBZtgJZq9FdQcZINkgJDeaxsrm9e3LnKuIYetNRFloIgcWCFWDHY4e/Su
         4ix5QDGEKxBus5Bdt4HNhLgWniV5kc9D9zLZson3xakIy8pq1dm5aeN5W8EZL/6cQD/M
         7yiR5dS+/S2d7/LAnHFTAa53FsB9jN8KOYCY4wLhzIZeVoy6rJ6KVjznW0UMTMYDl+LC
         /9LXyUQL/lRN/7eHYiZ2EN/U3ZImtRHc+WNYXBBhRLx9XiD8d6QgompIdTYooMi+ThuD
         lwXhtpzHqOJkh+E0mkstvxklkSjCy9/+ZStzibRJo5lVGweFvWEdjiKJ9ee5rDDSHvHI
         venw==
X-Forwarded-Encrypted: i=1; AJvYcCXHRTc47D+8ycxjY9Xd5WBoGvuNr9nwGNayaRXJhK2xFmCjmf9jKVATLBoAGQz+/LI006tlPMd8Q69QeV/HBE2N@lists.infradead.org
X-Gm-Message-State: AOJu0YyTbORZjYgt48AP2tFkiqFjD4YlBephY91KlUbLx4pm0BQ6VtkD
	1ifP1mopYK5LQu8rnS55v+n/4D29pKVvPhshbRl90XihqcyV/eRecMjkBAxvgkksRFKhLR+tPfj
	/1t97+A==
X-Google-Smtp-Source: AGHT+IHzaFg8XpZkeBot1MQe7M9Yb3LfWilFjWjxq3XfLXBIK/XNa5kNoc+2CdqHT487bCXwnmwMfiMG/dk=
X-Received: from pgjr1.prod.google.com ([2002:a63:ec41:0:b0:b31:e758:d80])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:502:b0:1f5:6e00:14db
 with SMTP id adf61e73a8af0-230040e3516mr508970637.14.1752099949457; Wed, 09
 Jul 2025 15:25:49 -0700 (PDT)
Date: Wed, 9 Jul 2025 15:25:47 -0700
In-Reply-To: <20250606235619.1841595-4-vipinsh@google.com>
Mime-Version: 1.0
References: <20250606235619.1841595-1-vipinsh@google.com> <20250606235619.1841595-4-vipinsh@google.com>
Message-ID: <aG7sa2fju7noUS8L@google.com>
Subject: Re: [PATCH v2 03/15] KVM: selftests: Add timeout option in selftests runner
From: Sean Christopherson <seanjc@google.com>
To: Vipin Sharma <vipinsh@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, pbonzini@redhat.com, 
	anup@brainfault.org, borntraeger@linux.ibm.com, frankja@linux.ibm.com, 
	imbrenda@linux.ibm.com, maz@kernel.org, oliver.upton@linux.dev, 
	dmatlack@google.com
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_152551_001006_85F4277B 
X-CRM114-Status: UNSURE (   9.77  )
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

On Fri, Jun 06, 2025, Vipin Sharma wrote:
> @@ -48,10 +50,13 @@ class Selftest:
>              self.stderr = "File doesn't exists."
>              return
>  
> -        ret, self.stdout, self.stderr = self.command.run()
> -        if ret == 0:
> -            self.status = SelftestStatus.PASSED
> -        elif ret == 4:
> -            self.status = SelftestStatus.SKIPPED
> -        else:
> -            self.status = SelftestStatus.FAILED
> +        try:
> +            ret, self.stdout, self.stderr = self.command.run()
> +            if ret == 0:
> +                self.status = SelftestStatus.PASSED
> +            elif ret == 4:
> +                self.status = SelftestStatus.SKIPPED
> +            else:
> +                self.status = SelftestStatus.FAILED
> +        except subprocess.TimeoutExpired as e:
> +            self.status = SelftestStatus.TIMED_OUT

This needs to grab stderr and stdout from "e", otherwise there's never any output
to the console for timeouts.

