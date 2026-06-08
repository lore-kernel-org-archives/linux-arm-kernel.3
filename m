Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED70CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Rbn7wD4zfL1rg1LaDWefzl7m3050O9wzsCOn/zNYoU=; b=F2sGfEbJJC4WqK2O2MlbbOF0tc
	MlLzFXfJFuBw4J0DTPPK62XCHYWy2XssPP3NFr9d0Cu/Pfy+KomFZ1/XzKTmE9Qn3aB/1q3xAvtVx
	WpEronxbzYXdCpFxmFeivLvhfKuNEJFNoXFL9eXorg1vr9xDRNtLs/AGwlqJsPYP+ANXP0BgX8nNm
	Qv1Z8yVohIRCSPtFkHX9az9F/noXrcdcoGNnr6vvyhRoOMciZ7/y+gpaVzOezSrPwzR03B1ZdsFj/
	x1VdxwaDgGDtyx3sZ7s/puDYqxS8qLBKDxomhvrYTE4vx8h3wpgUQGVm2fcsSAmdL55B+SMk9CHj3
	LSgiJRgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbJu-00000003rya-2B5b;
	Mon, 08 Jun 2026 14:51:18 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbJr-00000003rwX-1CbM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:51:17 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-490bd64ca95so199545e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780930273; x=1781535073; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Rbn7wD4zfL1rg1LaDWefzl7m3050O9wzsCOn/zNYoU=;
        b=IwRaXZWPNtAI5Ig/C/8Hx/HEE+glLtKMZDT40rL7hly1S3BIEKnFeTCu52ZX6NFXft
         5b7nIvuyX7O2Eu7oBsPQunFHzV9AhVs6YdfFjsOoD2AyCQIy0R+1u224US/CFewxvzyH
         aXob5cyDPTwV/YyReNVc2OpvtCqOlxsazxs4BezXiGObEBLEPlewJgJtTNYTXd0266iM
         1PtuTtJ4ZIMX4qv2kNWw7GHlqWYQazgomx3NK/J70cpG6Y4rymkqgb6+AnWJRJ2d/OGX
         Tc7+5mrAB95OpmfC6rlc/+Cgw4HDBpJQnpY+GzyW5Ndx6mIdGmw7NNXUb9+9Mejh+7oz
         o5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780930273; x=1781535073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Rbn7wD4zfL1rg1LaDWefzl7m3050O9wzsCOn/zNYoU=;
        b=jwFYGttbrPrzJjVn7D7GopRJka63FsNo6RTueifC/TRPCPaqptKh05zN4kfSo7drMM
         kVySFzXYIw6hD1E9c8wXY9Kef5t8HF+/ZUsjlpKMUyZ4rrpJT4E+aJaFzTXL+z5I1XmF
         wxUQNsA5bXSeMfhpjQwmB9LjRGifgv64bW4+nYMGRX9dV1gY/DNPtnUzD0fkVjzOTyS2
         jlA4fEcJ5aoiwqW1oiFaqpo/Ktcrh+1gjyBspWKRw18T2gz+nN3to0ZIPyvvPtNTEWZ2
         jmFQaEtqsqoTF5w9nljJ0BmZa3/IxBHqhzWu/ZBXs9WPd4laoMu8Rho40t/ECm6IeBD1
         0Beg==
X-Forwarded-Encrypted: i=1; AFNElJ/0xkznn/ktQdXR/2hSn03pdYTB5UDwsfnR7QELfV0yKlpm5rFtwMV98OxohIsPfVPG7U6C32CVjw4wUg9xGE44@lists.infradead.org
X-Gm-Message-State: AOJu0YytYIHbC+nWoUKGA49XjG1Sl6z/jRpJKJ3ywzkqrojvKXod927l
	XvfdLcq7xOim7RKaveeJ19fI/UFxEIb8uqSKi5LRlMZwaFxpKNjU54x8kaFqiwAj7g==
X-Gm-Gg: Acq92OE7XcqbgEaW3uh8Dr3zkWmf1IXscc/5wedctNwpHyFSMf+92c9UNTDyZHqNwDL
	TU6imd/tn3b0cjOSkXV7jd8XdFIsqlPcOlqOOWuulcYYUw2arYf/2cXcoEnOfbczLAvQrLzXvHg
	76u5mZWIkG8gmd/mY+Q64214pSX2igbQ7E48UaW1sgcaZ+ZpAYcZtSSYrXtPuEAsBC3JJw82r/y
	vQ23XIAFeQF0Q54NIzyjNfuFrd8VSxX9EDF5LJUfQSke1QGQkFhSdgGJVYIEkiTSLuX3F872zBN
	4RSG73TyvPfwO7c7m6dFowwj5vz3+0S8eeGhU4w8vznJGzWWC5HIkGMLU4sKQTNBCC/sZmCwW7o
	YXPmWpG5VxJgLY8bNizN4ztdyDKfgDvPMBd49G7wdO2xL8VJz+65plit/3rdD884IqzlLq2ORc/
	xPdCc7c7a+n53g3J8BKrIMkuz1EUUCtFh7B6hY0c2npR/1sIl6qwbo193TtZ937Sba8RXn3dy25
	nE4d/ak
X-Received: by 2002:a05:600c:4711:b0:490:c2b6:de6d with SMTP id 5b1f17b1804b1-490c2c9d9e4mr5232255e9.14.1780930273097;
        Mon, 08 Jun 2026 07:51:13 -0700 (PDT)
Received: from google.com (143.11.148.146.bc.googleusercontent.com. [146.148.11.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351d40sm52211734f8f.26.2026.06.08.07.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:51:12 -0700 (PDT)
Date: Mon, 8 Jun 2026 14:51:08 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, catalin.marinas@arm.com,
	oupton@kernel.org, joey.gouly@arm.com, korneld@google.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	mrigendra.chaubey@gmail.com, perlarsen@google.com,
	suzuki.poulose@arm.com, vdonnefort@google.com, yuzenghui@huawei.com,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH] KVM: arm64: Forward FFA_NOTIFICATION* calls to TrustZone
Message-ID: <aibW3HH-TyzSpeAu@google.com>
References: <20260501114447.2389222-2-sebastianene@google.com>
 <86wlxgy00t.wl-maz@kernel.org>
 <afxuDpecPCVA56cL@google.com>
 <86se83xrwx.wl-maz@kernel.org>
 <afyd8u85L5XIl6dh@google.com>
 <86qznnxptx.wl-maz@kernel.org>
 <af3fW468-f1KXCrC@google.com>
 <ahmxiFXXTupafbXw@willie-the-truck>
 <aibQHiYimPP1ylk3@google.com>
 <aibUXmzfDsVWcZjY@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aibUXmzfDsVWcZjY@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_075115_346379_76378C5C 
X-CRM114-Status: GOOD (  31.43  )
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

On Mon, Jun 08, 2026 at 03:40:30PM +0100, Will Deacon wrote:
> Hey Seb,
> 
> On Mon, Jun 08, 2026 at 02:22:22PM +0000, Sebastian Ene wrote:
> > On Fri, May 29, 2026 at 04:32:24PM +0100, Will Deacon wrote:
> > > I'd probably structure it as a separate patch per call, tbh. That way,
> > > the commit message can talk about the specific fields that are reserved
> > > for a given call. See below.
> > > 
> > > > Refactor the handling logic in pKVM FF-A proxy to support checking for
> > > > SBZ/MBZ values. While at it, drop the do_ffa_mem_xfer macro and replace
> > > > it with two functions that make it clear that we re-write the
> > > > function-id with a 64-bit variant, to keep the same behavior as before.
> > > > Keep each handler in an array of structures together with a mask that
> > > > corresponds to the SBZ registers the spec expects.
> > > 
> > > Although I agree that we should be enforcing SBZ/MBZ paramaters (because
> > > we have no idea what they might do in future versions of the spec), I
> > > also think that doing this at the register level is too coarse.
> > > 
> > > For example, the VM ID parameter to FFA_NOTIFICATION_BITMAP_CREATE has bits
> > > 31:16 as MBZ. So I think we probably need to do the checking on a
> > > per-function basis, like Per is doing in his series:
> > > 
> > > https://lore.kernel.org/r/20260501-host-direct-messages-v6-0-3f4af727ed85@google.com
> > > 
> > 
> > For the newly added calls like FFA_NOTIFICATION_* we can do that in a
> > separate functions, but what about the other existing calls that have
> > MBZ registers ? that was the reason for the inline proposal in :
> > https://lore.kernel.org/all/af3fW468-f1KXCrC@google.com/
> > (to avoid duplicate checks).
> 
> For unused parameter registers that are SBZ, I think you could just add
> a helper, e.g.:
> 
> 	ffa_check_unused_args_sbz(struct kvm_cpu_context *ctxt, int reg);
> 
> which takes the index of the first unused register and then checks that
> all the registers from there to the last unused parameter register are
> zero. You can then just call that directly before you start parsing the
> SBZ/MBZ fields on the used parameter registers and there's no need for
> the table-based indirection in [1].

I see, will do that, thanks.

Sebastian

> 
> Will
> 
> [1] https://lore.kernel.org/all/af3fW468-f1KXCrC@google.com/

