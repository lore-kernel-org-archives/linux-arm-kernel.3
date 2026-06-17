Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CFDCD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 15:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kLH2EYfcnmjV4+OcjUuMrn5lYsdA4BHEscTR5GyJ3aM=; b=jRu5CekCR2fNsbtR3N6SusBhPD
	JMrNmJ+ljYNSthyJJX4+MsVGjPyFjgn2yHltFijz+aRXHpwIuTzo4YdE17qvyUvl3N46xEXPI9HrO
	j85K8dilUK4zcxVT8luee0SiZT1qv7OqEJrvo9oEU5G5ZcaqenR3KorlkmnjR/HsiB4rdWoy5Yd8q
	1xRxNiIJoqhhK3v5P4BG8OquRoZgymDajl9GBfmPolLqnOiksfeQhBsCQPo9sJAEvUHGEO7Woa5tn
	reW2vUjk4gmajHEh4GcmodvgtAPlhMVMheCiv26P45UL/VQKev6WeAyIaYwcvLryqAS+cYq75kH1D
	EIayVH6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZr3j-0000000HTGZ-3DB0;
	Wed, 17 Jun 2026 14:16:03 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZr3g-0000000HTGB-0jC1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 14:16:02 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-84237a0fd84so157634b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 07:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781705759; x=1782310559; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLH2EYfcnmjV4+OcjUuMrn5lYsdA4BHEscTR5GyJ3aM=;
        b=XuVlmPylF012yEFYXvVr3rYlCb4L9OQo49dCOCFsHUiMKkmaCaTlb3+78ryunzR5f5
         6f75a7ao8YF3dtFB72AjG8sakQlDtG9jCw0tvh7qWGudCfF/wf8wNXSO32QKCk2Kl7Mz
         x/bpsLdoLP5fwh2Tfk7L5bFERC7R5IB7wWbDXDO71his+X2STMzRI9+Gbn3iUO4/LYoa
         59jPZmeA6jfviBY7Y0H7EMQM3d4mzB52mGxA93aEfYClOH09eWG6VXDLhNHBsME5Dt2g
         QeMxKDK53penz1CzxzfV6izgmZ9cJmzeChxyZDu67bymoytcHs+zmL8ExbzzbvVGudnc
         Vklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781705759; x=1782310559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kLH2EYfcnmjV4+OcjUuMrn5lYsdA4BHEscTR5GyJ3aM=;
        b=MGEjGPNugbLfYHQwzwcVcYY05NnN65VhjkNF5PWfM2hH6H/et/pHBqi5ui49AGCkfQ
         K2/Jpstb6tbLWobdZ1nZx5nt6P6jxVjzNax6PAVMVqq6u4uUkT7iCXI7A9ZZvTp9b47z
         AUDTkrncvoHbdsT++ExQGPuoYpUJJnk9F7Q5pD+/fGXe2u3Rp+R/2RC+MDcqGM9R5R8X
         GEL1yEypvq/js1mvFXIiLPLVt0hBnICGJmtpY/oURqYyoqr6a1HaaTt2SfIJ+ha8PT33
         L/lUkJunEg/b5Tgg0QOdcIv/ZiNEjtML+j2SDIXglds0SnZFtHSZ3GI+OsfTBGbviV+D
         ypdw==
X-Forwarded-Encrypted: i=1; AFNElJ+XHO5kkn5vZGaYRNMnzYUdTLUKHertiVnD2dwqAS4PWOT+MlDXGDseLtaA4lwr8Jv8Le6tQVISFtineOk9RTRh@lists.infradead.org
X-Gm-Message-State: AOJu0YzUp0eqYFVXyATAsg9IHztDa5cbee3UHMalXwMWPjNoz9kIW9eN
	O2zjEEfRCMNtSlHx56/0SM8L5yod463T1TuW7LyKlWrlUYrfYznMzcsd
X-Gm-Gg: AfdE7cmxh6c0rMZAXItA6Enb5QEk55/CjB/5AeluXKHpK/FSDqNRYURMntp4tue1jWQ
	qobRq49boHO9Ta06Pir1lLNSMG5ZsspTczmvp30ZnY8D/sfbBF7xgDvn3HsNl/xMpNprffq43+7
	9jUS10A/ZOxpFGr7fXOEjvH90DU9JJb0RL62nPuMLCV8AN/QnbhYawfMoIOhmp9grEUevJNSEFp
	qXfxdy2T9CYgQSfDLcuTzqphvzsasxRk0ko+r7NDFt/rjhuqoohp0Xkzp9nc0P7MDlf1fDSVM7z
	QWSHA7EDjoIJXGkSgzSrBsAeJOIkqEc0LTKdEoi6/693/1wLeKbvP/txOtaBTvPN/hiE1cbqkxz
	guBs6DJxzezQVyn8JxLfZCe6gbHtmCOwPC4llQpisbmNXyjmf6orK8BIoEKy8rUV3quCSG3LwHp
	d1rfjWpMyjDHJkljMcjSt/fDuwtJ7pptE4C2qYlRE5BEF8bkHh8ygldLrI8TVK9N8YV2ZQg6B0B
	8c=
X-Received: by 2002:a05:6a00:3e1b:b0:842:2280:5392 with SMTP id d2e1a72fcca58-845247c66aamr2077327b3a.7.1781705758882;
        Wed, 17 Jun 2026 07:15:58 -0700 (PDT)
Received: from fedora ([188.253.112.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b040718sm16905766b3a.51.2026.06.17.07.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 07:15:58 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: david@kernel.org
Cc: dave.hansen@intel.com,
	xueyuan.chen21@gmail.com,
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
Date: Wed, 17 Jun 2026 22:15:47 +0800
Message-ID: <20260617141547.144275-1-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <3b20ad2e-bb69-44be-bad3-5efeb169c573@kernel.org>
References: <3b20ad2e-bb69-44be-bad3-5efeb169c573@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_071600_230866_A3C424A5 
X-CRM114-Status: GOOD (  12.71  )
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


On Wed, Jun 17, 2026 at 01:50:08PM +0200, David Hildenbrand (Arm) wrote:

Hi, David

>Yes, kerneldoc please.

Ack.

>
>We're adjusting the directmap, remapping a r/w page to be r/o. I think we should
>be very clear about which transition we expect+support.
>
>Also, I rather hate the "set_memory" naming scheme ... "set_direct_map" is
>clearer. Anyhow ...
>
>Now we are throwing a "arch_make_pages_*" into the mix.
>
>Should it really contain the "arch"?
>Should it really contain the "make" ?
>
>Why can't we just reuse set_memory_ro and pass address+nr_pages? (highmem check?
>Could that be moved in there?)
>
>Or do we want a "change_direct_map_ro()" / "remap_direct_map_ro" interface?
>
>

How about naming it int set_direct_map_ro(struct page *page, unsigned nr)?

>> 4. Should this new API be folio or page-based in the first place?
>> 5. Is mm/huge_memory.c the right place to define a generic mm function,
>>    even a stub?
>
>+1

Ack, will move it out in RFC v3.

Thanks, Xueyuan

