Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3651BFEA830
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 08:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MQnoxuo+RfJVqr7nd3qZJp1iTq7jEvOPdb9UXk5XaM0=; b=vRyx8ovMrSgHDRj75yKQ9rqIti
	txc3E3mzqBIYWu0zmm1mP0sxJksj2kjlzv3C8AbY7cm7ZIVhjDIF3bxnjLkDrp8M7PETL55RuL0bI
	DOuOT0Pn15mrONEFyMJL9JcPyNg6OtGUgSxOro5qjDhT8nZCeRT4U56jCltY9MzxLmd81/eHJZa07
	MrSvWoLLPo96MxNN+T02QxtpvSn3f+3t4hiaTrm+pfK6cM5Mk07n1bjNWqPk9Wn6+qP6N3Bkl5FCi
	tH46bNLw73qGlfp40BnCkHicVzZTf+iu4eNLyP2S37V14rTGPqH53v9/aHdqL/BBf4rejZpGkVKa8
	SFPwT3GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5JtB-00000002yst-3su1;
	Wed, 25 Mar 2026 08:46:57 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Jt8-00000002yrF-2r30
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 08:46:55 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4870206f73bso27318585e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 01:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774428412; x=1775033212; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQnoxuo+RfJVqr7nd3qZJp1iTq7jEvOPdb9UXk5XaM0=;
        b=aJddqQN4XvizdbKWritqSevENu2m31bftrLctPZFMyrQ/eK7SR/3OBKI42ARrBQfqy
         oyiEWM0MwslH+ODc+104VfrGQzJeYIKhZSsA+wLnD1+g9verNE3IEuZp5rdB6CNliZI2
         1L1JZI8zqkkEtPKSNPRf+Q2AqdYeYzEzw6TiwVOb63HA6//kD6IpYsawsO4wNgxPevsL
         zD/bsVsFEcxduX7ky0bjG/B1EgNDWVsaCWBRJlp6kmRqvE7t+cMXbQgOg40BuwrVcvTB
         Jxqu1JgMjfbi6N1exPn+B3/RN0TjSevua7IW/gM/seCo9Yrw5fsJzQ1eGynXVaud2Flh
         QX/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774428412; x=1775033212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MQnoxuo+RfJVqr7nd3qZJp1iTq7jEvOPdb9UXk5XaM0=;
        b=oDa7cc8xUNllqR3EgvpoXTWGF65Bk8OqSlYiCBdOD+mD7ACns06Rn6j08euHmAP8A0
         KdcYHvJkVcTW9y3nEQ+ZBbfEiBAK17t9K5QWXKCyVjEXdDieF9uqS/1uAcD7QbTcyeGd
         xPfA9rIvg5cjcpoulrwG2VWJtiEOS9FBC4eMkp1yrBCWrD5jZdb+CbQhfjA8TyJq7c3H
         uZT+EfkZztkZhbi69DlVfY2eCcK9JgwYsCpg0qi5JpKQ6ot2bO+z6XRirCabqDpjSQL7
         p5nAEe1u1QJkMWU0NrJ5OykdnFPYqPgdvhWFAVIwnrJPFBgwyoRSralWSHyHs4+jssd+
         Pb9w==
X-Forwarded-Encrypted: i=1; AJvYcCWy1c8G2yZINx2p6Zu6a+B9PexZ72AHjgtVGdUxWGOd38dndAJfveyUrGIehQjuWyYwq1ZpjdffchlAdlGObrzV@lists.infradead.org
X-Gm-Message-State: AOJu0YwbFFMlqOlizSFIw+SYvoqfb6EalQmfNhWczF+cQdPNgdhfDnj5
	J03kDTtmgVaIWjSqdOuUDGlZ20d8EEDJua0DLdzCCUNGbmtrGA1vdyfX
X-Gm-Gg: ATEYQzx/Cd7hSvUYK0iVGYG8n0NzErpDiqZeLJQW0G+1TNJ9X70IZbojXEjbJO2+pPX
	QsUlBWVVv1GCrEUTf8Vh/Qmncm0ARsZV35XxqulyjbrQq9/hLqoaxkOzv42XlwiBSVmfW1mzMCE
	3w68VCWzO4vIEXkDp7jortFHwPgq2BzAnmLjdG1r2steq+3JyU5OCiz3zXsjIYeJBAR6OBEBbJK
	nrrmeh8hI9GkKjq2n3ofPEbT8wIxVHp78Uj7WhyhCzXIcchh8RAeQNFE5OadxOHCjgk3CAAVkOa
	5V8BNQXtZx41nQvIAtfqzkvzMZHOY7lGqsUaHHO8bJ4CIDnpfsBguXC7hAcvY3qGHxG8kFLqK6+
	CVSzp2XR7BxGrEE5nY9m9QQ7M1BwZWrZ11NR4SnOQ+vgGLndPzi+3O8fHN4RioW04bPH2zI5ThJ
	W+tQqy0hFO4irRRF9nfV8=
X-Received: by 2002:a05:600c:4685:b0:485:3eba:ab96 with SMTP id 5b1f17b1804b1-48715fc3725mr41087225e9.3.1774428412054;
        Wed, 25 Mar 2026 01:46:52 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4871174f39dsm99718895e9.11.2026.03.25.01.46.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 01:46:51 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: jack@suse.cz
Cc: Liam.Howlett@oracle.com,
	akpm@linux-foundation.org,
	ardb@kernel.org,
	baolin.wang@linux.alibaba.com,
	catalin.marinas@arm.com,
	david@kernel.org,
	dev.jain@arm.com,
	hughd@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com,
	lsf-pc@lists.linux-foundation.org,
	mhocko@suse.com,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	surenb@google.com,
	vbabka@suse.cz,
	will@kernel.org,
	willy@infradead.org
Subject: Re: [Lsf-pc] [LSF/MM/BPF TOPIC] Per-process page size
Date: Wed, 25 Mar 2026 11:46:32 +0300
Message-ID: <20260325084633.906324-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <pqwem5hownnfwcqrubksdwwraqbkthpzucknhavrghmw5lyszs@vdorbx4fyyaf>
References: <pqwem5hownnfwcqrubksdwwraqbkthpzucknhavrghmw5lyszs@vdorbx4fyyaf>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_014654_735292_C3EFC80C 
X-CRM114-Status: GOOD (  14.62  )
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

Jan Kara <jack@suse.cz>:
> > Is there some other way for someone to block a page from getting evicted
> > from the pagecache?
> > 
> > We have this memfd_pin_folios() thing, but I don't think we have something
> > comparable for ordinary pagecache files.
> > 
> > ... putting them into a pipe and never reading from the pipe maybe (I assume
> > that's what splice() does, but not sure if it actually places the pages in
> > there or whether it creates a copy first)?
> 
> Standard splice copies data first (it's using standard IO callbacks such as
> ->read_iter) so that doesn't pin page cache AFAICT. Only vmsplice(2) does
> but that requires mmap.

Splice from page cache to pipe sometimes doesn't copy data.

That is why test program mentioned here may print "new":
https://lore.kernel.org/all/CAHk-=wjixHw6n_R5TQWW1r0a+GgFAPGw21KMj6obkzr3qXXbYA@mail.gmail.com/

-- 
Askar Safin

