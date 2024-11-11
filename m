Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7444D2E9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 12:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bCmkc8IhJg96cUKot6LTRxchDsOoI7gWkzDhDIbbynE=; b=d5Jvxmlhz4V7kxVQa9wsJvbAj1
	i6lFEO75/Qn/vnfiJZSJ/9/MWw+zRQqC5c8/klUzvsHP2nONg81MovNVcaQIeM+J9pAEc9kvGeVKG
	fsUMFy848haiKsYRI+GbQpgQDxDQWLFbSeSTGhpUFaMMulBZehq0O2cBXEZ3l6zHoDrmbEGDvzAFc
	du4W+yK1t1bOyHL7uxML2EAfluwGS/DeoEkRykAPcFrqadpeLBZ93jXQp4zKhF7wQ7bJNC0Bch6BO
	3+dz2Vu71zaUqRikyfZtW11GMfhYl1ZJd1J7vhyQfXt33zj25mpjv+ZwLSpL1HW3caw1YV/lPf/v4
	n/qXncWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tATLZ-0000000HZlF-2FvX;
	Mon, 11 Nov 2024 12:16:45 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tATJg-0000000HZ7c-2KZZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 12:14:49 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-37d4dbb4a89so442591f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 04:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731327286; x=1731932086; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bCmkc8IhJg96cUKot6LTRxchDsOoI7gWkzDhDIbbynE=;
        b=buTXhZXcAGfBf5izLfPEcbLET/AmeqO1saTWSwNS/Ro2FXrVg/7VCSYsT4jGSwn/LL
         FV0ExopxlLue8Rfy4pfNxKFa4LMP5ipigTXVp3VlgOoEP/LTxKEhnHpt+b5uVWSGocW6
         yHzHvToGmMqlQw2CeMJJgUDM3XIxD0xb8JIu/MvZTr7/ACJ6CK9xSilP0pH6nAhFwZSI
         b4KtJqvZQyXWFIQdvPZXzQScOoo2k+eomGdWc5wozsbMzc1WuumKTt8RY5/3CNf1ykvk
         OVCB88a3KBYqZCnOLQUhGxp43n3PRg5LYwPSlTmgXcCh8BzL62oXEILjSfolTB0g/g6k
         qM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731327286; x=1731932086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bCmkc8IhJg96cUKot6LTRxchDsOoI7gWkzDhDIbbynE=;
        b=p8KVn7EkREf94mxFrkchjd5v75qwMcpIPmQYWqnfSZg5QgZyOxYcFH4leFn4JiRLUA
         p8JY6nNSMABM/ZcZ02LYlHeubN2px+6+PBxG5DeUTrjAwYfJuvO+SkRUOzeSwnZl4SI2
         Wk3/OkeMbmy5s+nC+JBrgosJWcZJ+zRTnzQX9TZXTKoBaGSpQqiG2f5EYLkAh2XDDw4G
         c6F89mrsRprQDEaH73UVgj+0wwNTYS77ORz9bEFytIEEpHnFtmdJHa3JH8QWrIYxPmxI
         K2DpycmmtyTFsq7QWmcl7SoSCDrhYBOoBlLD8O+UemhgQXU1bRmYTj0AL9T9zvO+PIm4
         CxgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdAbunOiwvw6r0V4jQstNwpEtHuv2WUM4XEl404mB0F2GA7vinpn1ez8mDWiR4Dfy4q8fFm9yLXinQrz63mmLS@lists.infradead.org
X-Gm-Message-State: AOJu0YyziLMCI6LlP8sD3y0s/O0uZ9Kz+c1oqawKBWSaXa3bO90xkkiF
	zVkJBJAe3KT7qBJ9AftWq8e2pJ43mDFR6wcUnuDiv6TgZkB019vB1Y0iO+pN0uo=
X-Google-Smtp-Source: AGHT+IHCRPUSYQt4b35RRCC0MExvKCiN6ZaaIP+qXuxUzocpsZ6HQ17+o55xl13WnIQe42xbI8c9dw==
X-Received: by 2002:a05:6000:1ac5:b0:37d:4517:acfb with SMTP id ffacd0b85a97d-381f17143d1mr3889776f8f.2.1731327285838;
        Mon, 11 Nov 2024 04:14:45 -0800 (PST)
Received: from mordecai.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed97ec9fsm12916332f8f.42.2024.11.11.04.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 04:14:45 -0800 (PST)
Date: Mon, 11 Nov 2024 13:14:42 +0100
From: Petr Tesarik <ptesarik@suse.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Anshuman Khandual
 <anshuman.khandual@arm.com>, Ard Biesheuvel <ardb@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, David Hildenbrand <david@redhat.com>,
 Greg Marsden <greg.marsden@oracle.com>, Ivan Ivanov <ivan.ivanov@suse.com>,
 Kalesh Singh <kaleshsingh@google.com>, Marc Zyngier <maz@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Matthias Brugger <mbrugger@suse.com>,
 Miroslav Benes <mbenes@suse.cz>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [RFC PATCH v1 00/57] Boot-time page size selection for arm64
Message-ID: <20241111131442.51738a30@mordecai.tesarici.cz>
In-Reply-To: <aa9a7118-3067-448e-aa34-bbc148c921a2@arm.com>
References: <20241014105514.3206191-1-ryan.roberts@arm.com>
	<20241017142752.17f2c816@mordecai.tesarici.cz>
	<aa9a7118-3067-448e-aa34-bbc148c921a2@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_041448_629105_F82819E0 
X-CRM114-Status: GOOD (  13.61  )
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

Hi Ryan,

On Thu, 17 Oct 2024 13:32:43 +0100
Ryan Roberts <ryan.roberts@arm.com> wrote:

>[...]
> I understand that Suse might be able to help with wider performance testing

Sorry for the delay (vacation, other tasks). Anyway, let me share some
results with you.

First, I have looked only at 4k pages (constant v. selected at boot
time) so far.

Second, the impact of the patch series is much smaller than I expected.
Most macro-benchmarks (dbench, io-bench) did not see any significant
slowdown. There appears to be a performance hit of approx. 1-2%, but
that's within noise, and I can't dedicate my time to running extensive
tests to find the distribution peak and compare. In short, I suspect a
slight performance hit, but I cannot quantify it.

Third, a few micro-benchmarks saw a significant regression.

Most notably, getenv and getenvT2 tests from libMicro were 18% and 20%
slower with variable page size. I don't know why, but I'm looking into
it. The system() library call was also about 18% slower, but that might
be related.

The dup() syscall was up to 5% slower (depends on underlying filesystem
type).

VMA unmap was slower for some sizes, but the pattern seemed random,
sometimes giving even better performance with variable page size, so
this micro-benchmark may be too unstable to draw any conclusions.

Stay tuned
Petr T

