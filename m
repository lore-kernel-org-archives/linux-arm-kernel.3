Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA7A105F7AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 14:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D6Y/n2o5yEo+tuZB5cloL22Tzkf84YmlhIt4ugqI5/U=; b=EPsJy1I9MQUbNmTr6YAfrPzUrM
	5gBsuLI0ahV9s53ryV81DAU2DlFV4vmCxmKNQucXjXc9Dii3YAoKs3wCUblvcrxoHlUp7UMfZFh2s
	JNmKYOyopwKOaImZnee+Dhv7GIAbRDwqMmo/Qs2N0CQMNpCniOUDr3R2X6jVHMjoOsbL4BBOpzpvg
	y25gAIsqYc1TiuqrUfNUiewr7jCIsLHuHP5EBkNK+7sHp1Nos+WlHKe3SZf9xiBoJED6c/GAZKpu5
	GmK9128HUUzfyRWuEvN/Tap5zbOcq4Eh4cU8d+2LOQ3tXcCg1OnuHNBiTed9mjKnrckkbvu0FWpxJ
	pLWS6b+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13if-00000000Pmx-1LRx;
	Fri, 13 Mar 2026 14:42:29 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13ic-00000000Pln-3KWh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 14:42:28 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so27515675ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 07:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20230601.gappssmtp.com; s=20230601; t=1773412945; x=1774017745; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6Y/n2o5yEo+tuZB5cloL22Tzkf84YmlhIt4ugqI5/U=;
        b=JQrsE1rJ1Vtqtos3lzetGcOXa+9SeuAQdwzTIYbweSycScLDrb3BqQRIB3wocUFTM6
         hzkvT8cxhLGwFawt9KRhfagFJfWR1il4j/YjxGLdKyQA4YnpLzWo84QkkQEeJWO5lGsD
         0KGHaOmdxZ7GUeCKvqypufinL3Vbsq31anx1ysV9zRtp2/Qqb3PwU3KhUiIl+qu31Eza
         9MDCuEXJFtXCeXEoTu6ozCAI5AC4irOFhLxT6upif++lWuyIJpyfRX2MT40FRVyhlL6m
         2u1o2+sq4WkST9AzHx4Y0T8nptqXfnTvdxr5Ra6351+zxEsVIddxWGAIjO9uCG6H+fH1
         T65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773412945; x=1774017745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D6Y/n2o5yEo+tuZB5cloL22Tzkf84YmlhIt4ugqI5/U=;
        b=VMCGBOQIS53MIu1tSuQtNK8c3BsvJ+CrL+Ye129lxmwMGESGv5PzLRaEnVsaQoZpPi
         DqHiyTqO7aN405envtgUoEiBlSvMf5p8kJnE1xtpTbxsZF4bs8D3dqIWQ/37yVarCKyi
         sDfsPg3v4Iz/b5HVu11E8gK7gqvgVspoC0JTOLuNhyww/DrWx+0VwC/knlbRykpF1qVs
         7iX1ReInKyNxLzAq4G3v2sPwe9FsjGmKc6KZh003ZdRxVG55tNM2ekDJ/c4P6JPAAiZd
         25sTw7MQQThHPyN/Y69WwpGIk/iiV4D4tGzkJVFQPL6vKGfBwJmtEiYlkK5LDNPIuXlR
         sX5A==
X-Forwarded-Encrypted: i=1; AJvYcCWLSVtP/htgau3H3lt6crOnQePpwCkEip3H/llNz71Yz+3E7AHEB3s18y4+ZiOC7dsHK6SS/OrhX+E8JGHIieoG@lists.infradead.org
X-Gm-Message-State: AOJu0YwlyUUttBIWvm92dYJi13t1wDczZcqFnJU2alwDdDv9yB2uMGqx
	M4YS6NYPdecR2JjkP/4HKuoAtpSVNTP7vtfEBA4yTwhQu9JlpKjs56cHFU828FLSR3A=
X-Gm-Gg: ATEYQzwxc042m81ar2ecALr8ntwtDjufVubWOrPV17oA0+kmXphT6pvuF8gyMwJhrO6
	DzGjNZ/Lq+O5aInb9Qec6GgH0N5aBOMvhL+gZRv7qYhQkB8gK7QZZE/tO037ucP8VDjkg2Ciees
	clb7gLmJtNm3aQT7t7KhzUB1yPEgnKbvmG9TOOUU7Lmov6J08HV2bIjL3yi9aODpt75UP72VtHB
	se/gPFrLNaeHc+0q43EP90mPjuE1M0AnTeoFA9xhli67A7AzZzmSZ9hjbpL+2vCT3SlOheti5v0
	SZrsWpa0N30gh77R0NLxpBtn7L71fH7Wphxs8L5uqs2qEhdS3z6mLz++F356nrgCbfHKUQV3TMn
	3w8JqK9yBagvGr9tLgAgyqSeaCoh6xTofB8Yu3Ct+cEBkviU3bbsaPY6NO3VJhvBp59ZgcxrklH
	RGa6pygxq6VkQ=
X-Received: by 2002:a17:902:cf12:b0:2a0:c1ed:d0d9 with SMTP id d9443c01a7336-2aecab32ec3mr35478735ad.46.1773412945451;
        Fri, 13 Mar 2026 07:42:25 -0700 (PDT)
Received: from gpc ([2400:8902:e002:de08:5754:7dac:85df:935a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece7ed9cdsm25651935ad.60.2026.03.13.07.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 07:42:24 -0700 (PDT)
From: WANG Rui <r@hev.cc>
To: usama.arif@linux.dev
Cc: Liam.Howlett@oracle.com,
	ajd@linux.ibm.com,
	akpm@linux-foundation.org,
	anshuman.khandual@arm.com,
	apopple@nvidia.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	brauner@kernel.org,
	catalin.marinas@arm.com,
	david@kernel.org,
	dev.jain@arm.com,
	hannes@cmpxchg.org,
	jack@suse.cz,
	kas@kernel.org,
	kees@kernel.org,
	kernel-team@meta.com,
	kevin.brodsky@arm.com,
	lance.yang@linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com,
	npache@redhat.com,
	rmclure@linux.ibm.com,
	ryan.roberts@arm.com,
	shakeel.butt@linux.dev,
	viro@zeniv.linux.org.uk,
	will@kernel.org,
	willy@infradead.org,
	ziy@nvidia.com,
	WANG Rui <r@hev.cc>
Subject: [PATCH 3/4] elf: align ET_DYN base to exec folio order for contpte mapping
Date: Fri, 13 Mar 2026 22:42:13 +0800
Message-ID: <20260313144213.95686-1-r@hev.cc>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310145406.3073394-4-usama.arif@linux.dev>
References: <20260310145406.3073394-4-usama.arif@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_074226_832674_46926864 
X-CRM114-Status: UNSURE (   9.85  )
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

Hi Usama,

Glad to see you're pushing on this, I'm also following it. I first noticed this when rustc's perf regressed after a binutils upgrade. I'm trying to make ld.so to aware THP and adjust PT_LOAD alignment to increase the chances of shared libraries being mapped by THP [1]. As you're probably seen, I'm doing something similar in the kernel to improve it for executables [2].

> +			if (exec_folio_order())
> +				alignment = max(alignment,
> +					(unsigned long)PAGE_SIZE << exec_folio_order());

I’m curious, does it make sense to add some constraints here, like only increasing p_align when the segment length, virtual address, and file offset are all huge-aligned, as I did in my patch? This has come up several times in the glibc review, where increasing alignment was noted to reduce ASLR entropy.

[1] https://sourceware.org/pipermail/libc-alpha/2026-March/175776.html
[2] https://lore.kernel.org/linux-fsdevel/20260313005211.882831-1-r@hev.cc

Thanks,
Rui

