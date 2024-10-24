Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B522CCE8E9A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 17:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yYax1c4EcHPuvhMblqzST6JvEaLizq8jVu6/eC35yLo=; b=zu9GBHh5VCOVYD0DEEbB2anwbf
	3L2RYFRA4AiqJVwwXi9irFo+oBgqCuO2V/WGAkZiVTdcyaqZrkxbVq70QhRe09eEtSpm9LOipa710
	8D+46VW30RHnbSzuaMAH8k5oovIbI2uFjNqzLXuTE1st3OlQ3w+V43U/ZqX23QxaqZ04ATS4twa2v
	z6MBhDHNkp7LQ6plm6aiQoy4EM6DlOB06cpi96t6qkcBANO/mdiA2hBfUHpacF3gS1HIujt6qFvPv
	gpOj05Rp4PwFKCI11Tjg83qyi55yuvSeqO67PQLWi5xLkl+S/yi7tTTZdE6riXcTAogwxlspaYtjG
	Jar9inYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t426j-00000001Nkk-0mH8;
	Thu, 24 Oct 2024 17:58:49 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t41nM-00000001JfB-1EQZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 17:38:49 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a99f3a5a44cso132858366b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 10:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729791526; x=1730396326; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yYax1c4EcHPuvhMblqzST6JvEaLizq8jVu6/eC35yLo=;
        b=XgrKBeMBZ24F0PjLKZB7mqxXJXsFGD7OUsHpJbGXeeElNBzR2s95hwAL3EamCm7YtA
         6gcvkp/J2zHKX2FC6usXb9qnGnc7MslOJyuP9cg8u6Xe7uU/kPskouNS0LD0w2tBubQu
         p2NSZyMMs9ck5yKO/347+BdCY/BnhTSkpN1EaIX3GhJH96tZRBFvbTprWXqorTCztt3m
         5y3Fsi90QIcZaQ693ePLEM1q5o2jMTal8AMa7K9i7/kXT9cQF0tE/YZQ1tjh9wAEntNK
         JDMLknK1wPXznvUKxgMvXxDWIT2KnQwDbpmXjU+X7fY2WgTEFarax+Istr/YQO6bEfz0
         LhTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729791526; x=1730396326;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yYax1c4EcHPuvhMblqzST6JvEaLizq8jVu6/eC35yLo=;
        b=NQM41pNXGxgFBVBR4Y/VCgfsCNF8Ga5iAhOyRyVSBkWxiBC8m1ZVbhu7O7NWHyBvmO
         kpWiM0CcDo3vZz6Tfd33QrWyASF6m5Xp5fpy18MydtH0gdtpKbEiImm26kCpwypKEpJZ
         qb0zZGJVLXCPFUqBzwKap0HyBCFdOWhoqfFT//MQAJzYt1GrfNr/8o2yehVCKwNTu+hg
         ss9hGtZyoANOS7xLFXTGjrN88ID6laCtTIvhrbvaFZKDLWw1LtxnVELJeerpzV8xApcO
         pvuz88FEUU7MkZWr7lfTRuFZC2LATLszYW6EJMAdSMNargueF9T+pG5d4U6zY/34+1KL
         xiJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJJ4Mf/CxqNektwlcQy3wBFUZ4Anqja5SDkI/GEd8f9V6UfCf1IYMe8sID0p4I5INbu2l3wII1zLvxVc4qtYb+@lists.infradead.org
X-Gm-Message-State: AOJu0YywUrWy+9CKdLGtlBDpDxNSRh0Fvz5yhbjEBdACwDtte1PS6Inn
	QIVrQuTP1VBqdc4Zc5diWlzonn6oZDwaacLR3GInuJwTCzmXn4FX
X-Google-Smtp-Source: AGHT+IGQijkEwwhyn+S+mnlYVM5n4XrYCdRooz1oxvJslidQBkR9XRDm1xeUlhBy5dOaYPMf48xVKQ==
X-Received: by 2002:a17:907:7b85:b0:a99:ffdb:6fef with SMTP id a640c23a62f3a-a9ad2814065mr285615766b.46.1729791525922;
        Thu, 24 Oct 2024 10:38:45 -0700 (PDT)
Received: from krava (85-193-35-80.rib.o2.cz. [85.193.35.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91598f11sm642982666b.193.2024.10.24.10.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 10:38:45 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 24 Oct 2024 19:38:43 +0200
To: Peter Ziljstra <peterz@infradead.org>
Cc: Andrii Nakryiko <andrii.nakryiko@gmail.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Linux trace kernel <linux-trace-kernel@vger.kernel.org>,
	bpf <bpf@vger.kernel.org>, Oleg Nesterov <oleg@redhat.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Liao Chang <liaochang1@huawei.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"linux-perf-use." <linux-perf-users@vger.kernel.org>,
	Kernel Team <kernel-team@meta.com>
Subject: Re: The state of uprobes work and logistics
Message-ID: <ZxqGIyvIQMXCyApJ@krava>
References: <CAEf4BzarhiBHAQXECJzP5e-z0fbSaTpfQNPaSXwdgErz2f0vUA@mail.gmail.com>
 <CAEf4BzacLW14OmuW1nV4s=cMcSqcrSAO2Y_0XY3jT2efGNfmuw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEf4BzacLW14OmuW1nV4s=cMcSqcrSAO2Y_0XY3jT2efGNfmuw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_103848_362781_5C67D0B7 
X-CRM114-Status: GOOD (  14.33  )
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

On Wed, Oct 23, 2024 at 10:38:54AM -0700, Andrii Nakryiko wrote:

SNIP

> > Peter, do you mind applying those two and creating a stable tag for
> > bpf-next to pull? We'll apply the rest of Jiri's series to
> > bpf-next/master.
> 
> Jiri has reposted patches this time CC'ing Peter, heh :), it would be
> great to apply those two patches and get a stable tag. This is

hi,
any news on this one? I saw the patches in peterz/perf/core,
but I think we still need the stable tag for bpf-next/master

thanks,
jirka


> blocking the landing of uprobe sessions in bpf-next and also my
> remaining patches will be based on top of Jiri's uprobe changes, most
> probably. Peter, please take another look, thank you.

SNIP

