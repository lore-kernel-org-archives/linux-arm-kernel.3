Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0296DC5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 07:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iTSNicc+okuCkFtzHEeSEUokN2gPYtw2OOgCgXZ1BUM=; b=djjs+K3J10XjvyKMlJ/zDRE9Df
	FKJtIQLqXeBQUaiL6VICkG9ORUTFrtHsTzRblervQEgOZ/yHwsqNd65Gsn4T9SF+4RN99rsmYxqdN
	pKgPgYp2AjGVi5H3PshsUBRBn4n3zRzGDyvl5Z1XdW36TmRQhDfu88Zf8FEGvzXvOuppVkQl+8vKr
	fdEo/NSQGvFvqYAtXuargYs1OKYRugWaeFwKcmjmkC/Ei54EUaI6sVvJj24+Xa+RwoyHpk8YwesAa
	N7KnWUAGPoH0HPl76n6paAgGWDXW4stGWZqNqMlEBMhFB1OXvXfZG4CfhOmRcIE/y3UMeCV3ZR1rl
	F3BF3rUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFFv-00000007I8n-2Kq1;
	Fri, 07 Aug 2026 07:44:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFFt-00000007I7d-39AP
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Aug 2026 07:44:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iTSNicc+okuCkFtzHEeSEUokN2gPYtw2OOgCgXZ1BUM=; b=efa9WPVuB1b2L9sGU5aFpTKARG
	lwif+auP1vqIDyfUJJ4LqPLSsRUW8+SN5JqB8yxXM+CwrAoQgKvpaM0jPBZucVD4frhIjcL5Bf3EB
	lvZeN3vDQgTadAgiYIYRXd/ZIGdvaDTL1/3kjXog9t086vcTK/SMktB+Ql/nwi1rtDrV/dmREjBij
	qZMh+FvvQBTd0wNVM0KR4zsbYC+GbYsdHcptqjI6pgWMUSaFZCVaJB/QCc4uho1tdwSN+YTOQJp+L
	6mDC2ersg5qNs65VJr0F5f/iWQYGD4eQXwIWyQV4/rowSQORf+kpTJIZtLo0hakQk8UM6QalQIsG5
	Hs49XsXQ==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsFFq-0000000C9Zp-2u2Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 07:44:36 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso27960785e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 00:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1786088673; x=1786693473; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iTSNicc+okuCkFtzHEeSEUokN2gPYtw2OOgCgXZ1BUM=;
        b=wDARlYXwSgBTM0yDCryoyhY6mL13aCPPQzsFcpkzoqxoaPUnjJj754Bj5kgxY7YC5i
         Yr6jFqOKaRW18F98s7Nn1wksVs5HrM+uF4sYaXQEekkkvvIuFL7+M1KxPw+VLqhFsZwN
         NX9eV85+zFiMhwAZY7SIDh2pW95mF/Oi1QyLjRAx31KUCpD6sJt/piDwo5igzgSQCzHI
         dWSrRvtr6ijhd1+TUyTadvpMEiWF5KCXhYPdpzkLDOzYrDev1NSAmZlzE/KFIwtzgiPo
         LscyQW5dJYaW0JL3G+u64Fv7MvWIvzgv52hmAtIL053c74Hwu7TaN1eoHv3/gRxBmGH/
         a5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088673; x=1786693473;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iTSNicc+okuCkFtzHEeSEUokN2gPYtw2OOgCgXZ1BUM=;
        b=c9PuoCOxYr4pB5pLcOuDtT7ETJ20Za9wgbPP55raaEPX8TZ/P8IHqP4/7F8W+skhNK
         C5MOGo40+DZG314I12BPn9LIuIK/fPSdZgC7Dg292qyha1EhA61U4lP7+tuS/BqJqOKf
         /ZMw9YIaTdhWgqcLEPu7KHxqJnSrQwhMD6fEn9uDGk9lQ1Cu912oXNfPQZ9zmAvQf9Lc
         8V8nT3mS1zSnsR78K2MnsuaIN84iB1dXteivHU+F+sY09/lPGhSYO9BaOd2V9g3WLYBp
         ejsK+SaeDm2gracO2J49GDggQVTxusNrhHm3crWaS29gFSPnEO5U+KWrn1E8AZf2iZmi
         OWig==
X-Forwarded-Encrypted: i=1; AHgh+RpmIW57E0rjP0jrguw4HjD47D9GkdLJe3giDxoNa06jGa6v1GrF7A+CuvJeRJMEAcRQ5DU+uufRxTMz7CAWgoQ2@lists.infradead.org
X-Gm-Message-State: AOJu0YzJhXA4CHz8gSOBAlz8rtY/7tr3UdM1z9Eqwk2506AHQMT5nj/8
	MoUeTBckRdIJlK030QeesAYIhjSZMOru2Ul80PDJegsCilTUqyvH956biR+Z/mD59y6U
X-Gm-Gg: AR+sD13cDbvKLmJjIg0xvh0BlZ7C1MZPg2cLDhzHX0IXjnXhzhLBi2pxUC2+8Elco8D
	3VUFmPFcaepyRr4RmgIZah5/OF9q5+6ZsXuvNYUOH9cBvX2AsWTgoreheRMA5RDfB1sCQDvWXor
	+fcJOGu9A9uMVl0W4uCbwdxP+cFHFGZu7oYpNPwIluK6wgnaW6VozkdNwNy00WlX9NudWPZ/lOV
	14+Fay4pEtlQiEXLhjNnNEmKzgFpVGQ5aO5rsi+z5jx7XI8SYqzPFuA5aXDTAEz+heP3QVRlk5v
	hNZDNznJYn6KOz6ntoTmybD550Xbp9WxTWwUcmbpMTVuLw6SJ+c2W/XTKWY8Sk82ikhdR7rP0HY
	CJBAXhYivxsY76bfS5nzToZW5a/iI+f7ak6DIyLvw9erAfiyGZlJi+5miRtdpFH6HYMfSU/zC5i
	chCKsbjUIL1WI6VQAPfFEN5PHTuw3LZrlwXG+SsHUqXOY+xWrUKlfDDjazMlovjCf+TK/LkvGDn
	1hkHGYFFWpsUK6qIh1hFJMkdT1mTTcjqA==
X-Received: by 2002:a05:600c:46ca:b0:499:5e50:5be9 with SMTP id 5b1f17b1804b1-4995e505da9mr18485315e9.16.1786088673162;
        Fri, 07 Aug 2026 00:44:33 -0700 (PDT)
Received: from ?IPV6:2001:8a0:f59c:a900:2600:fba1:8d1e:1692? ([2001:8a0:f59c:a900:2600:fba1:8d1e:1692])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7a56c5sm40919585e9.3.2026.08.07.00.44.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 00:44:31 -0700 (PDT)
Message-ID: <96442d4d-ec8c-4637-89a2-9dcbca7bb98b@osyx.tech>
Date: Fri, 7 Aug 2026 08:44:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Jo=C3=A3o_Peixoto?= <jpeixoto@osyx.tech>
Subject: Re: [PATCH 5/6] virt: bao: Move BAO_IPCSHMEM_HYPERCALL_ID to common
 header
To: Andrew Jones <andrew.jones@oss.qualcomm.com>, joaopeixoto@osyx.tech
Cc: linux-kernel@vger.kernel.org, ajd@linux.ibm.com, alex@ghiti.fr,
 aou@eecs.berkeley.edu, bagasdotme@gmail.com, catalin.marinas@arm.com,
 conor+dt@kernel.org, corbet@lwn.net, dan.j.williams@intel.com,
 davidmcerdeira@osyx.tech, devicetree@vger.kernel.org, dev@kael-k.io,
 gregkh@linuxfoundation.org, haren@linux.ibm.com, heiko@sntech.de,
 jose@osyx.tech, kever.yang@rock-chips.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, maddy@linux.ibm.com, mani@kernel.org,
 nathan@kernel.org, neil.armstrong@linaro.org, palmer@dabbelt.com,
 pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org,
 will@kernel.org
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-6-joaopeixoto@osyx.tech>
 <5kjiicdwq2ny3zg4mooojsntylukuadx4ajhf7mn7sue4aedpk@j2xfslwvkwur>
Content-Language: en-US
In-Reply-To: <5kjiicdwq2ny3zg4mooojsntylukuadx4ajhf7mn7sue4aedpk@j2xfslwvkwur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_084435_052147_A1694CA0 
X-CRM114-Status: GOOD (  13.14  )
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


On 1/14/26 20:34, Andrew Jones wrote:
> On Wed, Jan 07, 2026 at 04:28:28PM +0000,joaopeixoto@osyx.tech wrote:
>> From: João Peixoto<joaopeixoto@osyx.tech>
>>
>> Move the IPC shared-memory hypercall ID from architecture-specific
>> headers into include/linux/bao.h.
> The series should be rebased to have this fixup integrated into the
> previous patches where the code is first introduced.
>
> Thanks,
> drew
Understood. The reason it is currently a separate patch is layering: the
shared header include/linux/bao.h is introduced by the I/O dispatcher patch
(4/6), while the IPC helper that would use the constant is introduced 
earlier
(2/6). To fold this away cleanly I will move creation of include/linux/bao.h
into 2/6 (with the IPC hypercall ID) and have 4/6 only add the Remote 
I/O ID,
so the arch helpers are parameter-free from the start and this patch
disappears. I will do that in v4 (I kept it separate in v3 only so the
changelog against v2 stays readable, and it now has a proper "why" message).
If you would prefer I fold it immediately, I am happy to respin.

