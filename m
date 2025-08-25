Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BEBCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 01:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EN6ZzdP3i0zcjEggG2p78XDuwapKqNbwvZSSMTRqchw=; b=VXY6P+d+VPbQ+adgCCyaQ2RAzh
	/gsxzlegWAg86+VpvZ41TplFNZ2sVO54hH1KfN+672Q8tsAmH8qxJvYb9nR3M/KCzzhcrcnapXWP2
	mGTh6hK47WVVEbdq83YqjSQWV57rNLXr+LGnpaXqjPcP8FkEjx6SnvBpxepBdU2JMzsWQSKK+SNeB
	O7olcY10Dm0j0XG28jmYpzr7vYeYrpjMnX9bNPl2sdwYK7y2wkbYDjiDsCf1Epd3c8wFoAW9TMLr9
	uUlqZxVndZFLpj/GQlLBc58kpSUoyG1pxhGzmCGLRhG466pzo5YpoZACJ0peevnlqnkBmC8zpZc/k
	eFdlQ4bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqLw7-00000006gH8-1y02;
	Mon, 25 Aug 2025 01:23:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqLtR-00000006g6n-0OKI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 01:21:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756084863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EN6ZzdP3i0zcjEggG2p78XDuwapKqNbwvZSSMTRqchw=;
	b=KiNcJk7ZY8KydszYotLuLpeLozxtHLUdr4PPCe+gbzUhdIfNacxboW+B9nbh1vRNq4lsDe
	eswCAGfHGf/Db6g5+zRzfYrvdCerpt1x/kYbAcovf9iKfSy9i7fu8YxHaHOa76xvkNoObi
	uBMJ1N70jGPJnzwUkoou0pJYCeL8Su0=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-5-kniEnhw8PTmrQBfDNb65fQ-1; Sun, 24 Aug 2025 21:20:59 -0400
X-MC-Unique: kniEnhw8PTmrQBfDNb65fQ-1
X-Mimecast-MFC-AGG-ID: kniEnhw8PTmrQBfDNb65fQ_1756084858
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b474b68cff7so3181415a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Aug 2025 18:20:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756084858; x=1756689658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EN6ZzdP3i0zcjEggG2p78XDuwapKqNbwvZSSMTRqchw=;
        b=sH41EJ0L0RhzvqsRuQy5GpcjBEgpfYoC6BsaOaL7lxL21woxjqcqIntPsaekH0M0KA
         0z/lkytXRiKd0VyDIq8uWbTN2fpweEmgBXr9pfT8XEIFhYjEfvcuzED4YixU7NrruklN
         CSXO9oXIa0ImmcJM9zCv0sdqc0ysjJ3GdSABknJA2Et83J42Vz14/9j+6T4U86PthHjX
         lay757e1Sq9a/J2EvTouYaEGQ0ddaI7VhxHCNK77/IcU086BwvcFV3sA93KTK+HUEgb/
         pMiurempCGJyLjmi3tDWRVJWL5oJDSkZ3MK6Wrg4XQzACj5AOKBxAAHqF4grYSQT8occ
         b1nA==
X-Forwarded-Encrypted: i=1; AJvYcCVofBCxVo839B2m4CV46G996D6QC98QYKAN3zeLOqHgM/bmoMlJM74sYUZEErrTaLZzorm0tdXlE1dAXYDYaBs+@lists.infradead.org
X-Gm-Message-State: AOJu0YwrvOAsiVe/Z0eDqzduUtQRVwD20C14s/9ZFY9unyfUcN701fNI
	efccaZqDEvWimBO9C+AzPlAu+3U4matfa11tcW6D3zuHUoYYTDNPoGWJUyn/tf+EU0Z5Il5V7XJ
	xXu3fqIAyWjNu1fKIKhrcvzaplyPJjwkP8e3oGC+i9v4JqRPkL1mb5EuUbwo5d1AHerdK2DhmIC
	pp
X-Gm-Gg: ASbGnctKFpt5sxnE7qUMBIfUu4oIsQdX6C11wJzCDP/fTdlGQLfi+sQa25IUNY/Iey6
	YiMFKz/T5mD4ad467fUK+ACIplKNt7CnMjeyBCDlrPIYHgHwhsVGlGOur6iU2wFtPNYhfQXy3fm
	xuVgk1j7rYd3D/DDSBTXNwn9EylfUYNr2+Aj13X4wDoDBgC2/sSJm67XHk3bol991rnKU89ut72
	jNeFQVXYk0pO+yZOQoQ/l8R1letPmlfNfxbA3iUcWa/x1XbokfNTf4DpCn5upqa5LQnmBN3xzqr
	DZyUNAJmexGF8pmUO2rWYkuWJeaADZs=
X-Received: by 2002:a05:6a20:7d9d:b0:240:387:cee with SMTP id adf61e73a8af0-2434081ccd3mr14767784637.0.1756084858451;
        Sun, 24 Aug 2025 18:20:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZ52vj5/0XeOFHIZn6b33Fi9CgvtFLe7y13b+QMfcBUf40D3kWJXZtVu67hRZNEFoDn1nUGA==
X-Received: by 2002:a05:6a20:7d9d:b0:240:387:cee with SMTP id adf61e73a8af0-2434081ccd3mr14767754637.0.1756084858035;
        Sun, 24 Aug 2025 18:20:58 -0700 (PDT)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b49cbb98e8asm5143369a12.38.2025.08.24.18.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 18:20:57 -0700 (PDT)
Date: Mon, 25 Aug 2025 09:18:53 +0800
From: Coiby Xu <coxu@redhat.com>
To: Breno Leitao <leitao@debian.org>
Cc: kexec@lists.infradead.org, Ondrej Kozina <okozina@redhat.com>, 
	Milan Broz <gmazyland@gmail.com>, Thomas Staudt <tstaudt@de.ibm.com>, 
	Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>, Kairui Song <ryncsn@gmail.com>, 
	Pingfan Liu <kernelfans@gmail.com>, Baoquan He <bhe@redhat.com>, Dave Young <dyoung@redhat.com>, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Dave Hansen <dave.hansen@intel.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>, 
	Jan Pazdziora <jpazdziora@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 1/8] kexec_file: allow to place kexec_buf randomly
Message-ID: <yng55a2z25m5upehczerzhi6zawe3j4ka7amfu4vw4cu27bbg2@x2lgbuk3iqyf>
References: <20250502011246.99238-1-coxu@redhat.com>
 <20250502011246.99238-2-coxu@redhat.com>
 <oninomspajhxp4omtdapxnckxydbk2nzmrix7rggmpukpnzadw@c67o7njgdgm3>
MIME-Version: 1.0
In-Reply-To: <oninomspajhxp4omtdapxnckxydbk2nzmrix7rggmpukpnzadw@c67o7njgdgm3>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GHNuD9m8X09g3dLVJIdeQE4BFqtjzVG-dkPNYiAJzh4_1756084858
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_182105_199568_5BB23D66 
X-CRM114-Status: GOOD (  21.57  )
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

On Thu, Aug 21, 2025 at 04:15:53AM -0700, Breno Leitao wrote:
>Hello Coiby,

Hi Breno,

>
>On Fri, May 02, 2025 at 09:12:35AM +0800, Coiby Xu wrote:
>> +static inline void kexec_random_range_start(unsigned long start,
>> +					    unsigned long end,
>> +					    struct kexec_buf *kbuf,
>> +					    unsigned long *temp_start)
>> +{
>> +	unsigned short i;
>> +
>> +	if (kbuf->random) {
>> +		get_random_bytes(&i, sizeof(unsigned short));
>> +		*temp_start = start + (end - start) / USHRT_MAX * i;
>> +	}
>> +}
>
>On arm64, I am getting the following UBSAN warning when accessing
>kbuf->random:
>
>[   32.362428] ------------[ cut here ]------------
>[   32.362488] UBSAN: invalid-load in ./include/linux/kexec.h:210:10
>[   32.362649] load of value 252 is not a valid value for type '_Bool'
>
>and line 210 is your `if (kbuf->random)`.
>
>Basically kbuf was not initialized in arm hosts, and probably has
>garbage.

Thank for explaining the problem to me!

>
>I am wondering if we should have something like , while the support for arm64 is
>not done:
>
>commit 2608bd8c26b62a9a7cc50106e93d3a1ffb1e1188
>Author: Breno Leitao <leitao@debian.org>
>Date:   Thu Aug 21 04:11:21 2025 -0700
>
>    Initialize the random field of kbuf to zero in the ARM64 kexec image loader
>
>    Ads an explicit initialization for the random member of the kbuf
>    structure within the image_load function in
>    arch/arm64/kernel/kexec_image.c. Setting kbuf.random to zero ensures
>    a deterministic and clean starting state for the buffer used during
>    kernel image loading, avoiding this UBSAN issue later, when kbuf.random
>    is read.
>
>            [   32.362488] UBSAN: invalid-load in ./include/linux/kexec.h:210:10
>            [   32.362649] load of value 252 is not a valid value for type '_Bool'
>
>    Signed-off-by: Breno Leitao <leitao@debian.org>
>
>diff --git a/arch/arm64/kernel/kexec_image.c b/arch/arm64/kernel/kexec_image.c
>index 532d72ea42ee8..287b25e674d76 100644
>--- a/arch/arm64/kernel/kexec_image.c
>+++ b/arch/arm64/kernel/kexec_image.c
>@@ -76,6 +76,7 @@ static void *image_load(struct kimage *image,
> 	kbuf.buf_min = 0;
> 	kbuf.buf_max = ULONG_MAX;
> 	kbuf.top_down = false;
>+	kbuf.random = 0;
>
> 	kbuf.buffer = kernel;
> 	kbuf.bufsz = kernel_len;
>

And also thanks for posing a fix! The patch LGTM. Can you add a Fixes
tag 'Fixes: bf454ec31add ("kexec_file: allow to place kexec_buf
randomly")' and then send it to kexec@lists.infradead.org? Thanks!

-- 
Best regards,
Coiby


