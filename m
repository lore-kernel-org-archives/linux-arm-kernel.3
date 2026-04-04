Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D709DE88D87
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Apr 2026 07:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vxHSxQTiSROLSCEz/HR/Hur/9my7UlNa+rqcrvgfgaw=; b=EnKxv2N7EeRBn2Q2gYIfx1IXCH
	zfRDjM4end1wJ9Z9sTr2kyKc3uVpDEj966QUBR0owkLmVsp/gQphgTZ4YSgKvEdBRCkfZt+nO9Xnt
	yMT9ThLieOr+Zt8y9G20n4bGEyixWcM8ZGnCPj8SvvyyCPDYl11SFwo36KI3k0dXEqgzfmY3yG9Gw
	N9BxWRcAgsvF32NyQ1IkVvje+5AgkhEv7CitRg3tAd865KuEELc/QVkDNf5tsW9UUrYZrClsCaK5f
	WGzWwCSmxNFuBg/R5nOsXLbJvZSKKo68LYkRKVlaKb4yjmOgtT6kYmyCMTNhoGO/RvCLKLahUkeoI
	IB6vHuZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8vGH-00000003EXl-0NIE;
	Sat, 04 Apr 2026 07:17:41 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8vGE-00000003EXA-2woN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Apr 2026 07:17:40 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c6e2355739dso1043319a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Apr 2026 00:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1775287054; x=1775891854; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vxHSxQTiSROLSCEz/HR/Hur/9my7UlNa+rqcrvgfgaw=;
        b=MP1MPHPAbVuciyfBK5ezp0ZyFs0uX/Hhmky6feyfnRJP7vm4+AH2poHcdK9zxqR9Ky
         l3/tKvuoajzqIWFp6uYADkp38AufysqrrVednR/K8XgnQNmFlK6CeUdLb0uKszi7ftZp
         QesFeYy9tm5M1AMU2k4CMEDJsNJyq+UL1RelIJKdHNmVGQTAYP12/EWL3HJd2hxr/Pyx
         fERwhG7k8Ws+cKVbHC9dKYpplL6bB11+mQqRItQxvCFF5wGyiLDI57hVcg/aFeaplqrF
         976VSk6WSSRydn48pk8tMqkCKEyC/ldomC3rVHEL0Yu2urAvfSos7Si6pV4XfQNHCeEM
         z/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775287054; x=1775891854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxHSxQTiSROLSCEz/HR/Hur/9my7UlNa+rqcrvgfgaw=;
        b=kuvbo1AIqzHrM5McPPwbvj/Mwh6F5Bs2MmmLYUlhAlDZvb5mFPHiAVKTSm5kQc/o8A
         W3cmRfv8YeHoho23QFGI3455cI3tkkbkdSb5NUz9axV687q2fCnvGuCgrL0cp/n+Xuab
         apjhOdWkffmYjM7gOJvz/vL6IBctdoPZFjnRstENU338pmfqGNVVqau6fvmuykY+uEqx
         vg+wlRsjf3/e/rwkotctMRWB4iIf4QoaUum3YXQ4OrelOxECOLHtkKveRbIa8Kb5OvsJ
         QuDFKnZ/KPrJFisOMqJN9EuC7U1h6LNPksRQnQKnmARpUq6dvuOA7vSXAhvgs/aBy2EN
         GMrw==
X-Forwarded-Encrypted: i=1; AJvYcCU1smsJqZpzbHszJoSlppHXkDUgkU5WUvG6hI99oYEDug2K9vxylKXGmbXjAhQr7TqDS4gBt9pZLN2zXRjGBvGI@lists.infradead.org
X-Gm-Message-State: AOJu0Yxap1HYh5ftBcsV+cybCgI5Sq81xi+SGGG3kOSjygsaxI3Z4Faf
	4yGwYzm0ZiWhS2PzUr+km9BJTZty1axm8acRkcqEFH9Afg8llwq92LikuACEqP5vOMs=
X-Gm-Gg: AeBDiessx+dcSQ7CfqGoaKDMSN4pzHEihWx996sYhwaqortQPeaGqmSb7j9J744LX/+
	KgtB8CviNUFa6DWTTb+ifYle35o6gQhV+WFe7z4KS81zhpQM/lURLJGDFNlLXBJZUBr2UmVXTDO
	rcihMMMoeB+hTqrpiKrsiTmt1r6roa4sxGbCpctZ+vqdFPMqorsOhN7IuGmwehPXPnNflmeHSoj
	sLGNmJyNnio7DxMf6GRjRUVz8fS26/qu/01bX4w4d5kyPygsftvWPlW9xBJQgUcp1G0VvSdVEuU
	1ZS2fvNR7kY9YpNVnO9RiC82BJkH4a/D498xl+yRYOqM1QTLLrHN+QQQdU5yN0EaSNxKxXduobu
	COhWuiR8PM1bDTU8QZarJ7IuNnHfhAgoUZQRTuvY5TE9gh+6ugz9BqRwVPQxcRXfixwcDbQcoOq
	6r9qPaXbY6kF43dkPSeYP7vX29372VRhAk5jijtPY1IR0X5MqoS804kA==
X-Received: by 2002:a17:903:2808:b0:2b2:539b:d29a with SMTP id d9443c01a7336-2b28178ad30mr37104585ad.23.1775287054199;
        Sat, 04 Apr 2026 00:17:34 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274979525sm94675115ad.45.2026.04.04.00.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 00:17:33 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>,
	WANG Xuerui <kernel@xen0n.name>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Chaitanya S Prakash <chaitanyas.prakash@arm.com>,
	Yuquan Wang <wangyuquan1236@phytium.com.cn>,
	Petr Tesarik <ptesarik@suse.com>,
	Austin Kim <austin.kim@lge.com>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Alex Shi <alexs@kernel.org>,
	Chengkaitao <chengkaitao@kylinos.cn>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 0/5] mm/sparse-vmemmap: provide generic vmemmap_set_pmd() and vmemmap_check_pmd()
Date: Sat,  4 Apr 2026 15:17:04 +0800
Message-Id: <20260404071720.3577290-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_001739_006445_1615A841 
X-CRM114-Status: UNSURE (   7.67  )
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

The two weak functions vmemmap_set_pmd() and vmemmap_check_pmd() are
currently no-ops on every architecture, forcing each platform that needs
them to duplicate the same handful of lines. Provide a generic implementation:

- vmemmap_set_pmd() simply sets a huge PMD with PAGE_KERNEL protection.

- vmemmap_check_pmd() verifies that the PMD is present and leaf,
  then calls the existing vmemmap_verify() helper.

Architectures that need special handling can continue to override the
weak symbols; everyone else gets the standard version for free.

This series drops the custom implementations in arm64, riscv, loongarch,
and sparc, replacing them with the generic implementation introduced
in the first patch.

Muchun Song (5):
  mm/sparse-vmemmap: provide generic vmemmap_set_pmd() and
    vmemmap_check_pmd()
  arm64/mm: drop vmemmap_pmd helpers and use generic code
  riscv/mm: drop vmemmap_pmd helpers and use generic code
  loongarch/mm: drop vmemmap_check_pmd helper and use generic code
  sparc/mm: drop vmemmap_check_pmd helper and use generic code

 arch/arm64/mm/mmu.c      | 14 --------------
 arch/loongarch/mm/init.c | 11 -----------
 arch/riscv/mm/init.c     | 13 -------------
 arch/sparc/mm/init_64.c  | 11 -----------
 mm/sparse-vmemmap.c      |  7 ++++++-
 5 files changed, 6 insertions(+), 50 deletions(-)

-- 
2.20.1


