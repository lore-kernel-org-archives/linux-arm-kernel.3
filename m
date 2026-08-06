Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9185C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 09:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rxssx1F9jirIGuLt/jYdKLTnwp1BKr8qLnqrQJiF24Q=; b=iMUJFrALOwTe7xfW7kPqgELhCY
	9sgCGeHdITRCSFcRRkUEFCwlRozJIrlT8q7dDDYnb2EQtz6HHJtL4aOnODTlSjaI2zhBQi9L5IGiK
	7ZcaJqKDIZEjc+MaTxCkc1e04HscBLeV8BlBbFJ61A+wvQBVw+nLoAE3yKNlrAc1yUAzaOCrQeQbh
	+hmi/b9FFArR9dZQpn+0F7K0tvqYEGjdeBh5dYwdoVAjTF5U3bAz+/o36a/NlM/e2w4pW6LSvWsvr
	4lG4aluxnSqtLvh85JuJbqCEeCprj++Zh4Eux0WC+pjngi3n3sZKXLhGt+Y2KbWQDyB01GW9qoPDY
	CnqZFl0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruWS-00000005Ptg-1ya2;
	Thu, 06 Aug 2026 09:36:20 +0000
Received: from mail-pz2-x00.google.com ([2607:f8b0:4864:3b::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruWL-00000005PnD-1IXJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 09:36:16 +0000
Received: by mail-pz2-x00.google.com with SMTP id 41be03b00d2f7-c96739a46acso1071116a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 02:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786008972; x=1786613772; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rxssx1F9jirIGuLt/jYdKLTnwp1BKr8qLnqrQJiF24Q=;
        b=catLnxlEqAboIhCc0f4K9d5FpSZTDYPbWSt3/UQfIPk645LrfEEIsgBrFQjNmh51Xo
         s1qvILZpkCv6+Fd4DFol3Ey4ezMKxvBjgy/4kvf6Ee92Fviv3lunbua0o05EYH5N3RiD
         eCeNFLXasaPpa40lVDb9NfZk2NGfxhVCfSBKQwGC8u63uQo47We8yeDdMjMXRNX4tZy9
         s2Y/1tMqC1zkKe014gIz+F13dr3gaqZQXesJ5Rg6+m1UKMJTmnD+kkwTOcW2RNvz/Jss
         ktyAwtXHsgTZ+4RLbQ0otLEPFFKcQt21+3/gkUAjbCSjgSTN5V7an58QmXj806e16pQg
         /CIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786008972; x=1786613772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rxssx1F9jirIGuLt/jYdKLTnwp1BKr8qLnqrQJiF24Q=;
        b=B2ZhP8YkQw80bIJv5ze/CP5xN0B7fn080YKh/YtRZzE8V5cFrD23jVeWIeOHzta88+
         ILDZkkyKIU2O79qP7bJASybqbSZ3SgKQtOJrerzO66LMnOVw/7LX9rqMwkaA0oQ7HGnr
         iOhRtodFVlMUkupEFJpWec/rWz/eTr1cUxzvOifmlmbbKdbeWRF23d3cUU4rYAwxBXsV
         e1MRf9vK86nM+MbuOuJBOAOerSDJRQuQk0ZxZY5edwrQ26Y62hgjMCqlpbdj+B3d2+yt
         3ekiJGbLq/0razCPEApyvlY6yEtLB0d+T2r+UJ6yFPjqAwTNlmLJNZKSwpZWHgPF/eSc
         8jZQ==
X-Forwarded-Encrypted: i=1; AHgh+RrMf9GoJUswb/osqHsgumA6AEHMdZ8w/1jFcDxnpfu5FasQud7G9O4Jad9T6F215uiXCXnflDk2mMVcpe+laEL5@lists.infradead.org
X-Gm-Message-State: AOJu0YwgGH+/sMjaJylj0BWFl77PApxzeLZIlb2MB5SR+SX+BF+JgVzf
	1FGYn01SHc9IOqFVY2G7K7hlAE4Lt5s3vtc9yGHnB3G56VX61bQYI/WE
X-Gm-Gg: AR+sD13CeJQA0hh5zgQRLp0kRebE23bctXPK9XEuqMg+qWzf4JxNiUnP2RfwqbKck97
	+VzOPUs42nYAN99Ts1Uzx2LsTXuK6xRjtWtAhsnmwlJnooaYXroEonMVOpB6G+GTzYQQ9PiIlSe
	F72T7HJRCbs5Jf9vNSI2wkqJoa10YLnzK02WIavRT5sgZe2DI0l3Xx9jV6AP3hTFSNF0S/FFGb0
	DQ+tUycX5cxKFVYzGF5SMV3ScWfITWqcJmPzBI4dlOASt0DHc2W4QgC3RTxT26RQrdnJY7BqPUt
	thhsgTJiXZORnrDHGIhhtldBIyLwcUC68ZSYV16XhMcbFqsOKZuGceKruEHVFvIL4wfxDMtBK+i
	uZmGmbmCed2j3ZZmg65BDzEM9o9LumOlnzm+7VZQOlnH94GeifJH0+q+S6xrT9GDiYwfCpHtPER
	SJPfQbujc0LAzvTmSy1ABZ+kMJKM1rTtd//fXNEMZpKUnxXnqeKx4CGmg8CW6Sq0dpdcyEv56U/
	A==
X-Received: by 2002:a05:6a00:80e:b0:847:e791:d5c5 with SMTP id d2e1a72fcca58-84f2e0dc989mr14792962b3a.35.1786008972602;
        Thu, 06 Aug 2026 02:36:12 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f453b0aeasm1043878b3a.13.2026.08.06.02.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:36:11 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	rppt@kernel.org,
	baoquan.he@linux.dev,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	m.szyprowski@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev
Cc: kernel@xen0n.name,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com
Subject: [PATCH v5 3/8] of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP
Date: Thu,  6 Aug 2026 17:35:14 +0800
Message-ID: <20260806093519.2907771-4-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806093519.2907771-1-chenwandun1@gmail.com>
References: <20260806093519.2907771-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_023614_601797_FF0001C5 
X-CRM114-Status: GOOD (  10.11  )
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

From: Wandun Chen <chenwandun@lixiang.com>

Mark non-dumpable reserved-memory regions with MEMBLOCK_NODUMP so
kdump can omit them from the vmcore.

The marking is guarded by CONFIG_CRASH_DUMP so non-kdump kernels do not
pay the cost of splitting memblock.memory entries at NODUMP boundaries.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 7b1616b9c6c2..f38d11df6f15 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -674,6 +674,9 @@ static void __init fdt_init_reserved_mem_node(unsigned long node, const char *un
 			rmem->name ? rmem->name : "unknown");
 	}
 
+	if (IS_ENABLED(CONFIG_CRASH_DUMP) && !rmem->dumpable)
+		memblock_mark_nodump(rmem->base, rmem->size);
+
 	reserved_mem_count++;
 }
 
-- 
2.43.0


