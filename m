Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169EECD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 02:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rR502eUyUGulNUaHuA3K66FOsgg/TzOZgtCKKl0teww=; b=C+YKRia58YmwDiCVaJB7Kqv7BX
	nd9toRn1ljOnCfh8VjDwkk7vV9eJPA39UALOLhn7WSzHK22aqgU7PwTC23ltvp2Sg1mNsOhvh7N5y
	6E0vK3deDJKfFPbUoVETn3fS8IZUw8cwQqL0SGjCR8KN/UcgFv3BiRLgigsMfBAf1fC90Mb1FRAGZ
	2mlgyAcD8R4w8CIAqiOkSaMNXSFj6ARFzLlgFHReoaqRE7+kqAi/KzpHQIv9y/14FszwTH37CBbqD
	SvsQyv0UqT+7gUuYtBfBMFA57pEK/4fC1yI4HxzH/8/mnGZU7i0Es1+IUCI2T2uGKLeYGRCzxfq1l
	5V7fB0JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waPOq-00000001wmM-0Paw;
	Fri, 19 Jun 2026 02:56:08 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waPOn-00000001wlu-1zX5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 02:56:07 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-37c5dabff14so326865a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 19:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781837762; x=1782442562; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rR502eUyUGulNUaHuA3K66FOsgg/TzOZgtCKKl0teww=;
        b=C7qk1C5emfYMlv8aEjP+/vkatdbjA6uWIfumX/XwjJsrEBBnUy8qRAz2hFgPvGkhcI
         KyautWU3WMuOvWHfbA7iIF3yAbmidbtCD4LyK4uhmvuMec7DHKniL6+W/oqxuS8zUpSJ
         qFwVveeRUtu3/d7qG3EruxQLaROjqC0wuToELmsK7oJ6VsgGLxcE2zmMNQm6s8wudc3P
         kDA85ro3td8jUZ1yU6WJd7J2hnesxTgpcmrs3LqGl8NkaI8PVdSYsAnjZosc7XEhEWDR
         z+uNJkH4nrSJm/DaX8X1pUv9yCYn3XCQNzrZNb5rguKtsZ2kqCY+yR6XQY/DsqKTUAMV
         XSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781837762; x=1782442562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rR502eUyUGulNUaHuA3K66FOsgg/TzOZgtCKKl0teww=;
        b=qkl3Ana6h9Z8C2DxQoM3FBlVMwgof+0gX/MDXu+3srxsMlPpmxst7c6YLCHhdAEifJ
         9U4/2/1ZoNYAYFL6MaO8nrc1BQaxR9zbHm0y02svyDx6pPYt5W642u3pF2zwxnQApC8O
         H2CjgYY0lPUVA9qjresR2wBi/OoXorJhc5Csd/Xt8xMjV5qg/OUymowf7v5GMZNVFZ2x
         VPrmx2B9AQ+AXro58ROPTRU0N5fDPDTSaW3/KtkQo4Ag10NesMiWq+mzuLWDTBe6V+13
         CUk8KVsKa5lDZWFw2/SqT6GU8QSwSzjLdJlgiCeIAi68oZ7PycmVEh3JqbSFYsM88VjL
         Voug==
X-Forwarded-Encrypted: i=1; AFNElJ/N7wT/98OaNi9rQnu4qEJ0rILXMEmfVkjw0rnXoF3yQlL+OTsP1bpfpDr7Yuxij5nZDJ9owUauMlcYvdeXHesI@lists.infradead.org
X-Gm-Message-State: AOJu0Yxfj5BH8roB8OsH6ogidR6Eov7YS8j6fsKr/2/7iIwTMYZPJvHi
	P/KRCApuiYRd7RNiISxNli8Dg5cHdaYiBKMP++3hnHIY9Q3Q2mU7w8L0
X-Gm-Gg: AfdE7cndtoOiLcfUqgIkoJwyTKKM/2x8Rr7yiqbJJ4E1WqckMrOXl/V1RI/nfnFLQT+
	z8DlzL/S5treU/Rfx/BvhJh1UtgILVZlgaOL1DIlzwDKNj0kPt7AbrJ3iKpjXmgrWAKx7uoiKau
	p737PrQH1r7ow8aABTP+p7y02zX+mSiqhP5XR/pmESUOHjQN59xnMsEuUrAaTvFRRb+Z3owHNeq
	3HO8qedv8S25gXRHW+5loK/v3wb0uT5q+XjyO/ouOdWV3K8Pm9MzNOyNKl6tfbZFK84epCHyB4w
	V2OtjznFqo8qgyuTBxMnW2Nlusjcb79rxk8hpId/6PHYWFuBRhbLa4aZjWggf2kbakh4UTw4gLE
	H4ximbu3BZSWl63r7r9qxW3yS6xYvUHqXFv8NRpGsdP4moUFYjqbUHKcPkMuZ2rjzr8/yB7R+f7
	Jm5pwhXG1fXBHnCAw8yfBVdrQnZD3UJ2566SF0Qm7ogvRWv5NcUgHZc1XV7ej74iyYtqMSVwPkz
	SQ=
X-Received: by 2002:a17:90a:d44e:b0:368:65d4:486b with SMTP id 98e67ed59e1d1-37d15e7ce51mr968458a91.3.1781837762400;
        Thu, 18 Jun 2026 19:56:02 -0700 (PDT)
Received: from fedora ([188.253.112.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d153601c4sm1081418a91.3.2026.06.18.19.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 19:56:01 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: david@kernel.org
Cc: xueyuan.chen21@gmail.com,
	dave.hansen@intel.com,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	hpa@zytor.com,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	yang@os.amperecomputing.com,
	jannh@google.com
Subject: Re: [RFC PATCH v2 1/3] mm/huge_memory: make persistent huge zero folio read-only
Date: Fri, 19 Jun 2026 10:55:53 +0800
Message-ID: <20260619025553.226940-1-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <0e5b23a6-4895-454a-9dfa-6dc21adc2991@kernel.org>
References: <0e5b23a6-4895-454a-9dfa-6dc21adc2991@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_195605_682932_EE8C41E2 
X-CRM114-Status: GOOD (  12.36  )
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

On Thu, Jun 18, 2026 at 02:36:25PM +0200, David Hildenbrand (Arm) wrote:

Hi, David

[...]

>Best to wait for some feedback.

Sure.

>I do wonder whether we want to pass an address instead of a page.
>
>https://lore.kernel.org/r/20260410151746.61150-2-kalyazin@amazon.com
>
>Wants to convert existing ones as well.
>
>That would imply that the caller must check for highmem.
>
>But then, we could just use existing set_memory_ro(), right?
>

Agreed. Passing an address and reusing the existing set_memory_ro() 
definitely makes things simpler.

However, there is an arm64 specific limitation:
currently, the set_memory_r* api on arm64 only support the vmap
region and do not handle linear map addresses.

If we go this route, should I extend the arm64 set_memory_r*
implementation in the next version? The plan would be to make it check 
for the bblm2 feature and modify the linear map PTEs accordingly.
What do you think?

Thanks,
Xueyuan

