Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04958108B8FF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 05:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7QxDv7wA5vy2wx/iALi99txiEfbwQ3ENlpnWZYhHz0A=; b=upu4iX43HIS4dxvZs4UpAdU2VF
	DKRBUhgWjp08sABkPzyREnEOK4Yf4R32X/jCxhh1T1dqkvjN7tAsGTnjU8Ds/WRBmKRkwONknGwsm
	xyCIKG/XMOIy9HeXwp+8dfwiXmOTEqvnz6SLjaOzBshSJVoBTYeEETyJKCCzhNy5TLHSL2JGyX8SH
	4NFniZRNTB6xI9BJ66y7zQib2EtshxXUthtUHqSnvc2rocn571SpTbLK0+zCMBmuQIbC4qsrNS8UY
	Vr7p52mSeaWB2O5PI5eoeZ8WHlAIvYr/rXuo6shJb/zEuigpTukGtyTaM+lClqCuJFQp1j4jNuXij
	IyMXi1VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ocP-0000000E40I-3MD8;
	Sat, 21 Mar 2026 05:11:25 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ocL-0000000E3yh-2qfQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 05:11:22 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c7412b07f22so1590110a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 22:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774069873; x=1774674673; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7QxDv7wA5vy2wx/iALi99txiEfbwQ3ENlpnWZYhHz0A=;
        b=bUB5JwHHYKYptmsax5FiwodWtbIJOAPGj6MtvcDZteioqwqjmo5pwzqwbJaUyZ7PsC
         76Xmw50gDF6bG1eQmQ5aj9alPrGdmg4XqPO210FlxZdJSXD2agXM2FYGH7DOys/+2Ykt
         C4prUM1KbQEho7jGjUJZCNGZHXhSs6F6/5+t4xvSq6q6dgZ1kwtxNY/aG34JZ/T54vLA
         jCPw3WNAuyRyksrWmG5UJ2Yisic4Vn0qy7Cf3FT0XrFPSIyCLPfV26H2gr3wp+aQxtJk
         tVPGnteyrN2RSsZ2i4r1XX06ky+AMTyjs60tqXQ+AasxrY3VB5b9TIkq83jlxZ05CRXd
         E0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774069873; x=1774674673;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7QxDv7wA5vy2wx/iALi99txiEfbwQ3ENlpnWZYhHz0A=;
        b=OnPDKJ19ohCltf+2bVTvDql1Yj1xrVU/5fpw9IQpaS8hCBXfUEldg6l9B7PyHxmlCy
         a+/atB6v9vMdLXvXatCl9usKRwNBeZKXsuDm91FiFu4cmDIq91C29d6nYrnWQmEGRo7x
         Yk4K7NhCE62n0vjOuq/VSu3FupEC62lHek2yzwMlaYx9HDQcAXFt9t2c2llJtpXa+x8f
         Z2s9wSGWWWb201CbTWzB2r8QH7ZSr0B5akHqiUwuA6eYqILG8TyxfGlid2mDCUlPzRpH
         8wGNsxnB8o/189ntZdWWpPAlhU3scSmV44zsOou1U5822t5meWCjr53JD0QGHR9nH/85
         0+xg==
X-Forwarded-Encrypted: i=1; AJvYcCWdVpL5YG0j0YNs15emMDs1QXiT3ZY/yBXf6AUFDh5rkvPf6//9SI4wmsQJV5xlq3hXhlRNq3GRHF6LKo/F3xwB@lists.infradead.org
X-Gm-Message-State: AOJu0YynMkPeBLtL5IA9XA0b2PQxAeZKKSRa/nY+1OKqjhASYUeykRoy
	QKCoOhxZYsT4n8DMHsIF12f3YNh3tsFxxO3yv73og5b/yMCcVexGfucs
X-Gm-Gg: ATEYQzwPL4wVY0Ro94fP9RTwo8R3eV+pRrHo98typPXAOFeWhUzunHuQH3kyZ4Pfps1
	Nf/164V76d4fpYwMJxPc935jbLZrGxHP0eDftS5UJxckF7VFbB9b9cRjDllvA+Jgy8v+XCxm0Kd
	8hqwRdnF5AcCFEukeUL9OhECJhTgyScbc8C9MqpB6fDwBhxlIogE5U4YtwGStnvzosKpnJ08zq4
	Fq0C+jR/Ln+VuMz+wZoizGUERcQponPk68M5LtGW6QmMi3xr4pnzdZ1sa64GlVs42Ht4h4K1yzJ
	kdEV23+6oepZE6ukFcNHjsyj300Eok8OwMwfFee2XI3C4TydjwhtAp6M/DCdRRkjmQl4z1Pb21E
	kloa7Yhprk+OpF0WFZkx2RR1o7eBh146/OX6zmugiFZ6/WmCu8n65r782dmCN9YlTmbeWhwKQFV
	oOYtsj3fMVxTcsFZJgf0fkFA==
X-Received: by 2002:a05:6a21:4cca:b0:39b:9c3a:f54f with SMTP id adf61e73a8af0-39bb25e7511mr8216718637.32.1774069873215;
        Fri, 20 Mar 2026 22:11:13 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a939af0sm2729778a12.16.2026.03.20.22.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 22:11:12 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org, david@kernel.org
Cc: ljs@kernel.org, Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, baolin.wang@linux.alibaba.com, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, open <linux-mm@kvack.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] mm: change to return bool for ptep_test_and_clear_young()
In-Reply-To: <3fa94c3c89fd93fe22c8cb59967f064787d686aa.1773890510.git.baolin.wang@linux.alibaba.com>
Date: Fri, 20 Mar 2026 11:27:48 +0530
Message-ID: <ikarxctf.ritesh.list@gmail.com>
References: <cover.1773890510.git.baolin.wang@linux.alibaba.com> <3fa94c3c89fd93fe22c8cb59967f064787d686aa.1773890510.git.baolin.wang@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_221121_905779_2F772531 
X-CRM114-Status: UNSURE (   9.56  )
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

Baolin Wang <baolin.wang@linux.alibaba.com> writes:

> Callers use ptep_test_and_clear_young() to clear the young flag and check
> whether it was set. Change the return type to bool to make the intention
> clearer.
>

Right I checked all callers of ptep_test_and_clear_young(). I agree, we
only need bool here. 

> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>  arch/arm64/include/asm/pgtable.h             |  8 ++++----
>  arch/arm64/mm/contpte.c                      |  4 ++--
>  arch/microblaze/include/asm/pgtable.h        |  2 +-
>  arch/parisc/include/asm/pgtable.h            |  6 +++---
>  arch/powerpc/include/asm/book3s/32/pgtable.h |  4 ++--
>  arch/powerpc/include/asm/book3s/64/pgtable.h |  6 +++---
>  arch/powerpc/include/asm/nohash/pgtable.h    |  4 ++--

I looked at it because of powerpc changes, but ended up looking into all
call sites anyways. So overall it LGTM (and I agree that we can remove
the unnecessary externs from function declarations)

With that please feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

