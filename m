Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 604E1C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 20:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pogjioNrCPU8tB4PVX2EwY4WFCYTF+eohhDC6CPnHkI=; b=QbjraE0gN6GmVygDaGbRchvdl2
	/SRdK7D+z7IIUNkAvdHwqCQJ+LQmxnIXu8v4JA115biGfIopVEX66fkMIf93u9bzgRRAG/SsvT+rX
	NtYWLgsx98ZDZPGebV061O83wuUaisX4JbP3FVEtdvr5GtO/95hp6+TLCik9CpzTYfzXAa8av6JKo
	4AfiDLOJSZq2f51u/M5QcJNc6wpZdYjnw1GVZEr30jq1O8R1Rc4MeqeavQzaY9RurBwGXa45fi7gv
	ee8eHWS6+kBz8CubtxInuq/U9AEvMqIMDsrtquXbrSEKUVidPBBDjbrx2qECpO/lqjMsgro3aGRu/
	ecezwWkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttBmF-0000000FFHG-0akq;
	Fri, 14 Mar 2025 20:37:07 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttBkU-0000000FFAI-2jNZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 20:35:19 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5e5b572e45cso4538540a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 13:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1741984517; x=1742589317; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pogjioNrCPU8tB4PVX2EwY4WFCYTF+eohhDC6CPnHkI=;
        b=VfIB3uF8zeIgCPnGKEllusQhqkA+D8avR5iM4XZBCUYi6wcRCgvf8i75piDoyt4eCM
         V0vv7iWo5QJjlXVHsdXyZYfL2AooBKN6YsNyIzipol1auzYLlsUKiLzMEkoPhvaqxrbB
         s9p//bY3vY+V8ITZKdK8agu25TC0zhE7eCkGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741984517; x=1742589317;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pogjioNrCPU8tB4PVX2EwY4WFCYTF+eohhDC6CPnHkI=;
        b=BCTn6fBqwHSGdHVNIZOeQxhxTgV7tI1tMfbQjr5rYpPvgiVydA04ikrk59MZrfhyC4
         Jj8le+KCRv+5s2f4Asf6sJ1Z6aGhxGlT5LmYhZVGF6FzQrf4hxEAowFJS8zdfK3ClBrx
         HFk9LwjJ0VEaf+7dTTO2SNWCpHadxdcH82kbqYt4GUAzEU2gClYBPoMNWKbYfNCwQtcZ
         A8KGD4vzPuK5sGhIvA74go5sOmFSNST3J0gd3lbdWqvqXfX5v7vML1CNAORUkHsJyCs/
         7dtx2yq7d5qVlgByPSDEV1MMpJd0UrCbbDgsmsUr5ls2zOEclqH/jAXwcEfWnrDNyK/L
         uSwg==
X-Forwarded-Encrypted: i=1; AJvYcCXBIlasPAVOpj75mfi9RJ8lbsXXdPX4nvr3kOFJA104wi4yT3chvIdPzVEqpfe71nhy5xuPJEElwWootj5TnU3S@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv7b9tymY58T93Ej3GumAOSGya/VqU3oTYPpTXNxq6exlyrZ4c
	JIh0xZx73i4gg4KwqStr1/ndbtcXhtMAuuf8aJMFim0bOxTMIZzzQ1DdbYLSvbK80elsR9+JM8D
	X5wg=
X-Gm-Gg: ASbGncvBpOjJ5bYzl1qa1jIkR6EUYSsd/N4a0spA8trQ/ORn7nVdzLhy71IYCR8L50Z
	Lxe0L9LYKALyFBcmBvCxe02gPsVpMELZ9vK9ni/coBL+RT66pmwI4Scm52zqmSImJfL/W9SjYIG
	yZpQnmR7eoB+3guI17SdKrzoTrwS62qY7zq/9ZC0WrRKrdFwZginMFgkvVkq/MOjZXAaMI1Bpmh
	EiNlnl+70I8sprhhlsl3/zJ5zoLcej82Tfv1l/oYkAxXg2qVhTOX7D+v+bV9PQFXctiortVfvEy
	Eb1LX1VkkPEVxVpUpnz6NF+4DHl9B6tSAQHjKrnIVBfoutOGWWFzwLcccsbVTTpAJ8neG6DlQth
	KQaX6yPP1qESrYUQeGXo=
X-Google-Smtp-Source: AGHT+IGubpZhhxZPIgHpA++yz5LE1e9RNiD4r5Z/BKoh7zxtyEKx4rlaLL73is/IeXbpsxvsOvbSVA==
X-Received: by 2002:a05:6402:35d4:b0:5e7:c42d:d8ca with SMTP id 4fb4d7f45d1cf-5e89fa44f3bmr4198879a12.14.1741984516682;
        Fri, 14 Mar 2025 13:35:16 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e816ad27ccsm2439005a12.62.2025.03.14.13.35.15
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 13:35:16 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac25313ea37so502256866b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 13:35:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXiDVRRDluBhl652ejKjtwQgenkpIQxBsiyduRqtfzQqXeN0nkXEuOdC+IXqaUt3xlEaz3td5jahAIUAVwwp9lB@lists.infradead.org
X-Received: by 2002:a17:907:9713:b0:abf:4c82:22b1 with SMTP id
 a640c23a62f3a-ac330284c14mr404711766b.32.1741984514750; Fri, 14 Mar 2025
 13:35:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250314160458.GA9438@willie-the-truck>
In-Reply-To: <20250314160458.GA9438@willie-the-truck>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 14 Mar 2025 10:34:57 -1000
X-Gmail-Original-Message-ID: <CAHk-=wgiX0q0WCL+SFwVCYtG7JR3=2Rshse-5J3AO2Y4AgT7Jw@mail.gmail.com>
X-Gm-Features: AQ5f1JryKZLnw2-ForjqZas2k5iB8R4KsSVk5Q8oMuZFtCfIHNVaIuQqepQJz1U
Message-ID: <CAHk-=wgiX0q0WCL+SFwVCYtG7JR3=2Rshse-5J3AO2Y4AgT7Jw@mail.gmail.com>
Subject: Re: [GIT PULL] arm64 fixes for -rc7
To: Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_133518_717529_D3AA5E61 
X-CRM114-Status: GOOD (  12.25  )
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

On Fri, 14 Mar 2025 at 06:05, Will Deacon <will@kernel.org> wrote:
>
> Summary in the tag, but the main one is a horrible macro fix for our
> TLB flushing code which resulted in over-invalidation on the MMU
> notifier path.

From a quick look, that macro is still quite broken. Maybe not in ways
that matter, but still...

In particular, the 'stride' argument is used multiple times, and
without parentheses.

The 'lpa' argument is also used multiple times, and the input to that
is typically something like kvm_lpa2_is_enabled(), so I think it
potentially generates lots of pointless duplicate code with that
BUG_ON() in system_supports_lpa2() -> cpus_have_final_cap().

Maybe the compiler figures it out. But that macro is bad, bad, bad.
When it looks like a function, it should act like a function, and not
evaluate its arguments multiple times.

The most immediate bug may have been fixed, but not the actual real
horror of that thing.

             Linus

