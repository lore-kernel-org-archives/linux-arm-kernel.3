Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B502BC61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 17:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0IHxnV24H4g+bgPWSaSq+fwKQsetvjQ0EzADtleBBa8=; b=y1a/cN05feh4f4yAExUHCpYG6/
	cLJDJcC4ZIQJivS5xnLGj2zt7U2f4OlqoENj2eB+pSkdegQBZRCMmIh3XEUFEq8xiSU9FWbm16FmP
	2dl9bdOPItLSd+9gv3SNQMx5lS0PkWM6fwJFvj8HZvzP1gXI0kErqmkkCR2vLXGC35dnUm7LW8vLU
	OwNQObUbL77xWPw05fEnt15Eh+KjmZ7XyEoq6an0C8Xx2jCBvztauQUUzK7lcTgUND0YCa1ThhYkR
	1MA4woYXtD3DksUP2m6/Len5Ml/GFFn4x2r67tPFSPcfDfTK1q1ots7Uo0lQVfc6kBHGTdsRyotlc
	I9ggQEFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0NBY-00000007Blr-0OSL;
	Sat, 29 Aug 2026 17:49:44 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0NBU-00000007BlU-3VtH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 17:49:42 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-495590dde14so19542865e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 10:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788025778; x=1788630578; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0IHxnV24H4g+bgPWSaSq+fwKQsetvjQ0EzADtleBBa8=;
        b=AIY8IJzpsUTw/ySPHilYX3YD8163/qgsP5xBiw9TC4Hjsm1VWBQqEY9XRi33Tf3+fF
         ML6N43VR0iqJZRdPCoJ7xd/L9/JmNjE/PkNOsJAHZKsl3zdx3XpZn8OQfEwUu+Oh7mJV
         xj4aeROLHApBPb8eqqZmGgfBbdvs/s/+3YSuDXbgpPDS6xTBKb8zzGb9Sggzyr4AiVWb
         nl63mqMqXYxEwDh/PIkl9BlSNHUzhU+HAWduOjK8HkYYa5AGyf//LSz627WrVxtas/qr
         Czrb+fvA/yINgELykYl2oL6eBTNUJiCBRxxvqkJGVvC/wa7baa610D4Ln5HCxV3RALAQ
         dxvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788025778; x=1788630578;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0IHxnV24H4g+bgPWSaSq+fwKQsetvjQ0EzADtleBBa8=;
        b=J0TLVFAk30ETGSf6F0dKb253zXlchXLkqdGJWbw86HoYzgZQEcZ8YQPc7VoBk0M7GU
         2fiH+9SaClrbr2PtnixjS4y65U0A2QevXfOrUuI4i8alkoL5/c76oSbB759wvlexNfSG
         0MXTsQG7Ivrj9mP4gjRfMR4e8FCjkb5gT6vBJCPeTMxK9JfN1LN6epTfDmJyK24w2gna
         O0fPLLuu5IPdPG1CVJW1bvk5n0g5YKy91sq7TWuApt7IZI/R6E6hjKxWiNC6FiHvsnZL
         l82nZYgVk7eUY2Shss+OzXKlGxvbGKoEA3hpGYFHXrhIk8qpb2ZV330JWd0XO96s57zB
         gwgg==
X-Forwarded-Encrypted: i=1; AHgh+RqNgqitsrEVEjXIVxj8/I1AwQuDl5MusOBMb1n9pd2OqtRPlVJrvDQWBjrg9C5KSfwCbT09bk9eeWEQV9nbimcD@lists.infradead.org
X-Gm-Message-State: AFuF++kl+42P58xfR7V8KZSXXvLGXH0iNyd0IiJY2jCJIyjz7OA5IBBs
	IQR8mV6j9JsAesqjfyqoQeYlN5eKT0DbpFO3sg1ykyXETjPPLvVa/MWgpHU8n3yD
X-Gm-Gg: AR+sD11dcW54CQPNYCEoAT/PJ8JgqKyUXfxLnqmBEqcQCRy8tQEeuNlNNyJABpywxLb
	h3xjpaZ0PL5jdE32DZckhA334cQmpkfvPAymc+w8WTym6/OQ9701nhPnh0PGC0H7h31QngDs9Rs
	95IZZuInPwQG/pnl2vOTflYEormSg9CEP4ERlIXTptArRjzkBAMNKFClueuVKAQVZu7oYzL/vEo
	Pk0inhKzd+Qdu+mZqaEh7VNwPg4Qr/PgjjHta5UjtsCbe7htKZQAJCp8DM4pBXpTKoLhBQeHUOb
	6zXQMoMy9MM/kI5Scw1F/0zsUAtWFtElfpOMmioylm05Z2fTdGHIJTruHeBxglh+WtqxSJFAauK
	2rGOO1XX7ki9dVXU89ZrsnsndOPtG01uLFN0NnQIdOi4lCCJuWTQaCKfLqlqiu7Ne2KA9msNMQm
	mJpbOkF2XvliC0ymQpHG1wK1MoSxRz36G0Xm0bJ5ePoIKlXN76WDAOyyjjU1N54ZFPTuCgF72Cx
	BwTk6wYtulPD+3vvE5QTmcnDB9BpoXUcfYrCqfrAQNwLl5ATZeRRE5LDP5NwJnMqj3vEQtCayOF
	PBI0SIjM/QOFtEmU3RWTdyYcSbwSqzTnuuqYqjixtxG+gabdt/mw1otVa9i8DX5H
X-Received: by 2002:a7b:c30a:0:b0:49b:8c63:dfdf with SMTP id 5b1f17b1804b1-49b91c5749fmr180067375e9.15.1788025778047;
        Sat, 29 Aug 2026 10:49:38 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-ae86-1b01-80e2-8851-4221-68d8.310.pool.telefonica.de. [2a02:3100:ae86:1b01:80e2:8851:4221:68d8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dc1076sm141898395e9.3.2026.08.29.10.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 10:49:37 -0700 (PDT)
Date: Sat, 29 Aug 2026 19:49:35 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ARM: asid: Do not replace active_asids if already 0
Message-ID: <apMbTRLqPV2s_BeR@gmail.com>
References: <20260809180600.6049-1-kmehltretter@gmail.com>
 <apAQ4gc71DiGmDO2@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apAQ4gc71DiGmDO2@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_104940_888979_A2693C00 
X-CRM114-Status: GOOD (  14.85  )
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

On Thu, Aug 27, 2026 at 11:26:42AM +0100, Catalin Marinas wrote:
> > non-relaxed (cmp)xchg is used as in the existing ARM code.
> 
> The patch is still valid. It's safe to use the relaxed accessors here if
> you want or maybe do it as a separate patch for other atomic ops in this
> code. I think at the time we added the ASID allocator, there were no
> relaxed accessors in the kernel.
> 
> You can send it to Russell's patch system.
> 

Done:

https://www.armlinux.org.uk/developer/patches/viewpatch.php?id=9493/1

Thanks,
Karl

