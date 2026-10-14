Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1B6CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 10:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JQDTRvso52jUuczv7UdtVuHK1eN+NxLIMYZKCEfei9E=; b=RQSII8nscufVatxH44lK7u4Mc/
	7FJQek3ch+yTLDE1jmq25ph2bdD83jjEAFhet31ObDHhTRP+Hclh6D3FmYwrKGwzKjKb9q3bxP0BP
	NCPGLs0OIgUUhiH1lXTKSlfuGpUtfyOsliPQ0Z6x1jNahBW0kcfNGCq2qJcubgroE0yE3FgOBcDkZ
	3ie5x53LO/GdnBs82w0tJPkzqnNZiuT6IhdLNGDKU2QouDrkxnbDfQUCSZIWixsY5Ed+CMq2Qjxd2
	EBy3BhRBiwEkqPR5fWseJ5GCeAEk6pTc9oMFF1hX5De2sVvcVJ8lEqon2OT0ck8zcly4fo73Va7y4
	8x8hmHBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvQn-0000000F3hy-30Co;
	Wed, 14 Oct 2026 09:37:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvQf-0000000F3bN-2sLi
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 09:37:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JQDTRvso52jUuczv7UdtVuHK1eN+NxLIMYZKCEfei9E=; b=nB/GR7ddvuO9lW4UQqUWwFhKCv
	Z+euAjKjhKRZaHENR0BJh7oVzJ9f2gZgJCPR4npE/ZgQ6hVoGrCPW50I1OF7bDJMk5HMtWuTt5Aet
	8OIf5TCvHNkvlm5qKUvIC7A394EFPs3qUmKLkr7VJvf3WHP2FIwiQ2ymgloMLv7VuPYivZ5Kqy2pS
	9+2WHdI4RCvvVQ70h7ObmpH/nbD35DUxV9keXMh9yCDpV0mCuQoVNbyn0GvQjZY7MtUTW8/N0C6Aa
	D6qhqU+oYVWyUwA3vIf1h56FvY924jAl4Q6v1Pu8rCbNsAvckRKi02rBclY8lx744wOostHJIGWvV
	q4wNJ9Jw==;
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGvQc-0000000GZUL-0L85
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 09:37:43 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48870973bddso2316416f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 02:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791970660; x=1792575460; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JQDTRvso52jUuczv7UdtVuHK1eN+NxLIMYZKCEfei9E=;
        b=PJwsObhF7Dviukp6afFXjnccC0n9c3kBSmfHIkM7x8Ddz55WPHHNhCOwMW8ZOpak6e
         36VfaHzOokWBSBRGkz3F4Knwr68W9arvAtrx/D0LBqJaUX8iP0Tv7gX18aPi6bkXb/G6
         X/O0aBk69653GjLzP97XCjEXYSDgmuChrkMli0fABV8MIVltSiamWXmeqh679O9fem4n
         AojuIFjbxTfEfxxfb5Vd6I0p1Qab29m5Dns5Gh4jglVsYdkjaw2N2+fgQfjctk+KGRED
         IM8AfsZngtXB12DRnkltoNAROyo2pjuvWnl0/VQDf/kA8V6q6PDW22QZq9fjL9H9BIOE
         UfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970660; x=1792575460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JQDTRvso52jUuczv7UdtVuHK1eN+NxLIMYZKCEfei9E=;
        b=iwBVHG5s0HW378R5swbZzUfn1biI5/EFcq6PYNHHYWOVBaDU/vmWkBv71aiDMUpAcd
         vMeGpK3N75o7rLeNCWinWj7cTKqgwTVTKIMVj11xNYbpw0WS4IyDP5FDkWvX2uPQszKq
         lTtuDCQKRU8ZLXBM3NxhN088R1fIm7CzmI60Vj0cFo78PHshCX80PHt9H+9mRFZNIArM
         /vr8s+ChGAdIsiubQEKm7JXaN5ZaAIM7KRaOtONicDBeGJHS31UvFVGO9wGxXC0CJ78u
         qg31AbWRXRNpBkeJdWzdnNK+w3j5j5+UCHjzV5b6v9M4CXQE2wHbT+7SlqIYAv1ac9q+
         MCiQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1ujvP/VIOx3e7EecBrJdJpRE3NHQOjOETOy2Q1mNGgnv+tBfYTMssc6tW0e20p5Y7mFbIZPd/TYAAB7Bcr8L5@lists.infradead.org
X-Gm-Message-State: AFq9FYKhhKbShMjkCjT+23B352oExMXU1G3aPr2e9Ht2+wSlRUWJ+sh4
	IqkoqJ20fYEaU0G7LPlRthEuThIVqFa/LR38hplSPsWb7e2uAtMxOytI
X-Gm-Gg: AYBFou1wMNThOQMXPYphgyvC5M36HWzn+3BLthvVE0DH5OdQuU8+ekLzXlYWx9yzomm
	tG5MtJEYE2QdLdrV6Wqt4z8foivE5I776qJ/UrmJOXKGlilHMuJHKd5A2dsHsA1L7I6ZMCcR/3G
	Ydqwb7HLnlpwwTpAWO2qxD/OZ2icrB0/6QVyzSoxMzY9AWUNkge5kzD3GwpQSU++Wxs6Km+vi8b
	0LiB2FrXaBBnnZb9FbZvpoLpIAqGnR6lKS5D7Y4kwsyjTDldleLTctl4Bb9rQn+RWe/C25KrWPs
	8J4PPW18DfJjl9qaVPuCuF2fFHfm8PNp7aVneUXNGehVb+x7W1jbWcYCz/5ewe9u5Zo9opqqOjl
	kHCk4VzlhHZy2Kb9VHdcvIz1IEc6j4zmQGkrYNF/A1CssOWh68AaEBOoWS5EI11mqLj/lVcrESS
	X6MXA9tAy1auu/XRlvz5u4gpsuzfSQAh7s+kI+RbVXFMNuBfE4AJ5U5ERyfjFFH3RNgzbulbfo4
	OXdUahnkPLvaJnU3jU4qHsoCw86zDIzvsJP3iKc+7knhvPY8SKuoVIX5SkHURjZX7FF/7mvuEPm
	nhVtA14Yr7aKekgGeoYbaIV+PjXbUTuLOjw=
X-Received: by 2002:a5d:5d89:0:b0:48d:ed0e:6bb4 with SMTP id ffacd0b85a97d-48ded0e6cc9mr2179330f8f.4.1791970659557;
        Wed, 14 Oct 2026 02:37:39 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm9365477f8f.35.2026.10.14.02.37.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2026 02:37:39 -0700 (PDT)
From: Fred Griffoul <griffoul@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Ackerley Tng <ackerleytng@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [RFC PATCH v2 03/11] mm: Add memory providers
Date: Wed, 14 Oct 2026 09:37:25 +0000
Message-ID: <20261014093733.90312-4-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261014093733.90312-1-griffoul@gmail.com>
References: <20261014093733.90312-1-griffoul@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_103742_478795_64942817 
X-CRM114-Status: GOOD (  40.52  )
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

From: Fred Griffoul <fgriffo@amazon.co.uk>

A driver that owns memory outside the page allocator, often without
struct page, has no common way to lend it to the code that maps it.
guest_memfd and iommufd each need their own hooks, and the owner must
keep them consistent when it takes memory back.

Add an interface between such an owner, the provider, and its
consumers. A consumer attaches to a provider file, asks for the frame
and attributes behind each page, and makes every mapping itself. When
the provider changes a range, it revokes it, and every consumer of the
file removes its mappings before the revoke returns.

A frame is therefore valid until its revoke returns, and consumers hold
no references. A revoke reaches every consumer of the file, so a
provider cannot take a frame from one consumer while another still maps
it.

A provider is found from its file: its file_operations sit in a struct
mem_provider_fops with the provider's operations, and FOP_MEM_PROVIDER
is set. Each provider file embeds a struct mem_provider_file that holds
its consumers, and the provider revokes through it. The core has no
registry and no global state, and struct file_operations does not grow.

The provider also owns the host memory type of its frames. Memory that
is not System RAM must have its type reserved, or PAT makes it uncached
on x86.

Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Fred Griffoul <fgriffo@amazon.co.uk>
---
 MAINTAINERS                  |   7 ++
 include/linux/fs.h           |   2 +
 include/linux/mem_provider.h | 211 +++++++++++++++++++++++++++++++++++
 mm/Kconfig                   |   7 ++
 mm/Makefile                  |   1 +
 mm/mem_provider.c            | 177 +++++++++++++++++++++++++++++
 6 files changed, 405 insertions(+)
 create mode 100644 include/linux/mem_provider.h
 create mode 100644 mm/mem_provider.c

diff --git a/MAINTAINERS b/MAINTAINERS
index f37a81950e25..6cab075a3ff7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17360,6 +17360,13 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 F:	include/uapi/asm-generic/mman-common.h
 F:	mm/madvise.c
 
+MEMORY PROVIDERS
+M:	Fred Griffoul <fgriffo@amazon.co.uk>
+L:	linux-mm@kvack.org
+S:	Maintained
+F:	include/linux/mem_provider.h
+F:	mm/mem_provider.c
+
 MEMORY TECHNOLOGY DEVICES (MTD)
 M:	Miquel Raynal <miquel.raynal@bootlin.com>
 M:	Richard Weinberger <richard@nod.at>
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 50ce731a2b78..f459f0e34ca5 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1980,6 +1980,8 @@ struct file_operations {
 #define FOP_ASYNC_LOCK		((__force fop_flags_t)(1 << 6))
 /* File system supports uncached read/write buffered IO */
 #define FOP_DONTCACHE		((__force fop_flags_t)(1 << 7))
+/* Lends memory to consumers: embedded in a struct mem_provider_fops */
+#define FOP_MEM_PROVIDER	((__force fop_flags_t)(1 << 8))
 
 /* Wrap a directory iterator that needs exclusive inode access */
 int wrap_directory_iterator(struct file *, struct dir_context *,
diff --git a/include/linux/mem_provider.h b/include/linux/mem_provider.h
new file mode 100644
index 000000000000..94e9352ebeb0
--- /dev/null
+++ b/include/linux/mem_provider.h
@@ -0,0 +1,211 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_MEM_PROVIDER_H
+#define _LINUX_MEM_PROVIDER_H
+
+#include <linux/bits.h>
+#include <linux/fs.h>
+#include <linux/list.h>
+#include <linux/rwsem.h>
+#include <linux/types.h>
+
+/*
+ * Memory providers
+ *
+ * A provider owns physical memory that the page allocator does not manage,
+ * and lends it to consumers through files that it hands to userspace.  A
+ * consumer is given such a file, attaches to it, and asks the provider for
+ * the frame behind each page.  The consumer makes every mapping of the
+ * frames itself, including the mappings into userspace; the provider makes
+ * none of them.
+ *
+ * When the frames or attributes behind a range change, the provider revokes
+ * the range.  The core calls every consumer attached to the file, and each
+ * one removes all its mappings of the range before the revoke returns.  A
+ * frame therefore stays valid for a consumer until the revoke that removes
+ * it has returned, and consumers hold no references.
+ *
+ * A consumer must not install a mapping of a frame after the revoke that
+ * removes it has returned.  It either holds a lock across get_page() and
+ * the map that its revoke callback also takes, or detects a revoke that ran
+ * in between and retries, as KVM does with its invalidation sequence.
+ *
+ * A revoke may also change the contents behind the range, for example when
+ * the provider moves a frame from one file to another.  A consumer that
+ * reports the pages written through its mappings, for live migration, must
+ * therefore treat the whole revoked range as written.
+ *
+ * A provider cannot take a frame back from one consumer only: a revoke
+ * reaches every consumer of the file.
+ *
+ * A provider gives its files a struct mem_provider_fops, which holds their
+ * file_operations, with FOP_MEM_PROVIDER and an owner set, and the provider's
+ * operations.  It embeds a struct mem_provider_file in the state of each
+ * file, returns it from attach(), and passes it to mem_provider_revoke().
+ * An attachment holds a reference to the file, so neither the file's state
+ * nor the module can go away while a consumer is attached.  MEM_PROVIDER
+ * has no prompt: a provider selects it, or depends on a consumer that does.
+ */
+
+/*
+ * Memory type of a frame, in the low bits of the attributes.  The provider
+ * makes the host's memory type for its frames match what it reports: for
+ * memory that is not System RAM, it reserves the type of the range, for
+ * example with memremap() or ioremap_wc(), before it hands frames out.  The
+ * architecture otherwise chooses the type of an unknown range, uncached on
+ * x86, and the VMM's mapping of a guest_memfd would differ from the guest's.
+ * On x86 the guest's type also depends on the host: KVM maps a frame uncached
+ * for the guest unless it is RAM in the firmware's E820 map, or a struct-page
+ * frame (DAX, ZONE_DEVICE) that PAT does not force uncached.  So the
+ * reservation matters for the guest too, not only for the VMM's mapping.
+ */
+#define MEM_PROVIDER_ATTR_TYPE		GENMASK(3, 0)
+#define MEM_PROVIDER_TYPE_RAM		0	/* cacheable system memory */
+#define MEM_PROVIDER_TYPE_MMIO		1	/* uncached device memory */
+#define MEM_PROVIDER_TYPE_MMIO_WC	2	/* write-combining device memory */
+						/* 3 to 15 are reserved */
+
+/*
+ * No consumer may map the frame writable: not for a guest, a device or
+ * userspace.
+ */
+#define MEM_PROVIDER_ATTR_READONLY	BIT(4)
+
+/*
+ * No consumer may map the frame into userspace.  Guest and device mappings
+ * are not affected.  The provider decides this for each page.
+ */
+#define MEM_PROVIDER_ATTR_NO_USER_MAP	BIT(5)
+
+#define MEM_PROVIDER_ATTR_VALID		(MEM_PROVIDER_ATTR_TYPE | \
+					 MEM_PROVIDER_ATTR_READONLY | \
+					 MEM_PROVIDER_ATTR_NO_USER_MAP)
+
+static inline unsigned int mem_provider_type(u32 attrs)
+{
+	return attrs & MEM_PROVIDER_ATTR_TYPE;
+}
+
+/*
+ * The provider side of one provider file, embedded in the provider's state
+ * for the file and set up with mem_provider_file_init().  It must stay until
+ * the file is released.  Its fields are private to the core.
+ */
+struct mem_provider_file {
+	struct rw_semaphore lock;
+	struct list_head consumers;
+};
+
+/**
+ * struct mem_provider_ops - What a provider implements.
+ */
+struct mem_provider_ops {
+	/**
+	 * @attach: A consumer starts to use @file.
+	 *
+	 * Called once for each consumer, and possibly for several at once.
+	 *
+	 * @size is the end of the range of the file that the consumer will
+	 * use, from offset 0, as the consumer's user asked for it: the size
+	 * of a guest_memfd, or the end of an iommufd mapping.  Return the
+	 * file's struct mem_provider_file, which is passed to the other
+	 * operations, or an ERR_PTR().  Return ERR_PTR(-EINVAL) if the file
+	 * is smaller than @size, so that the consumer fails the request at
+	 * once.  May sleep.
+	 */
+	struct mem_provider_file *(*attach)(struct file *file, loff_t size);
+
+	/**
+	 * @detach: A consumer is gone.
+	 *
+	 * Called once for each successful attach().  The consumer has removed
+	 * every mapping of the frames, and the core no longer calls its
+	 * revoke callback.  May sleep.
+	 */
+	void (*detach)(struct mem_provider_file *mpf);
+
+	/**
+	 * @get_page: Return the frame behind page @index.
+	 *
+	 * @pfn:       [out] The frame.
+	 * @max_order: [in, out] On entry, the largest order the consumer
+	 *             can use.  On return, the largest order for which the
+	 *             aligned block that contains @index is physically
+	 *             contiguous and has the same attributes.  It must not
+	 *             be larger than on entry.
+	 * @attrs:     [out] MEM_PROVIDER_ATTR_* for the block.
+	 *
+	 * Return 0, -EFAULT if the provider does not back the page now, or
+	 * another negative errno.
+	 *
+	 * May sleep, and may run at the same time as the provider changes
+	 * its state.  A result that is out of date is harmless, because the
+	 * provider revokes the range after the change.  Must not call into
+	 * the consumer, must not call mem_provider_revoke(), and must not take
+	 * a lock that the provider holds across mem_provider_revoke().
+	 */
+	int (*get_page)(struct mem_provider_file *mpf, pgoff_t index,
+			unsigned long *pfn, int *max_order, u32 *attrs);
+};
+
+/*
+ * The file_operations of a provider's files, with FOP_MEM_PROVIDER set in
+ * fops.fop_flags, and the provider's operations.
+ */
+struct mem_provider_fops {
+	struct file_operations fops;
+	const struct mem_provider_ops *ops;
+};
+
+/**
+ * struct mem_provider_attachment - One consumer's attachment to a provider
+ * file.  Embedded in the consumer's object, set by mem_provider_attach() and
+ * owned by the consumer until mem_provider_detach().  @ops must be NULL before
+ * the first mem_provider_attach(), for example by zeroing the attachment, so
+ * that mem_provider_detach() on an attachment that was never made does
+ * nothing.
+ * @ops: The provider's operations.  Read-only to the consumer.
+ * @mpf: The provider's per-file state.  Read-only to the consumer.
+ * @file: The provider file.  Read-only to the consumer.
+ * @size: The end of the range the consumer uses.  Read-only to the consumer.
+ * @revoke: Called when the frames behind a range change; see below.
+ * @node: Private to the core.
+ */
+struct mem_provider_attachment {
+	const struct mem_provider_ops *ops;
+	struct mem_provider_file *mpf;
+	struct file *file;
+	loff_t size;
+
+	/*
+	 * @revoke: The frames behind [@offset, @offset + @len) changed.
+	 *
+	 * The consumer removes every mapping it made of the range and asks
+	 * get_page() again when it next needs a page.  It must not return
+	 * while a mapping of the old frames remains, including one being
+	 * installed from an earlier get_page(): it excludes such a mapping or
+	 * makes it retry.  Revokes of the same file may call this at the same
+	 * time, and may call it before mem_provider_attach() returns.  May
+	 * sleep, and may call get_page().  Must not call
+	 * mem_provider_revoke(), and must not attach or detach any provider.
+	 */
+	void (*revoke)(struct mem_provider_attachment *att, loff_t offset,
+		       loff_t len);
+
+	struct list_head node;
+};
+
+/* Provider side. */
+void mem_provider_file_init(struct mem_provider_file *mpf);
+void mem_provider_revoke(struct mem_provider_file *mpf, loff_t offset,
+			 loff_t len);
+
+/* Consumer side. */
+int mem_provider_attach(struct mem_provider_attachment *att, struct file *file,
+			loff_t size,
+			void (*revoke)(struct mem_provider_attachment *att,
+				       loff_t offset, loff_t len));
+void mem_provider_detach(struct mem_provider_attachment *att);
+int mem_provider_get_page(struct mem_provider_attachment *att, pgoff_t index,
+			  unsigned long *pfn, int *max_order, u32 *attrs);
+
+#endif /* _LINUX_MEM_PROVIDER_H */
diff --git a/mm/Kconfig b/mm/Kconfig
index 9e0ca4824905..7085bf6666e5 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -774,6 +774,13 @@ config DEFAULT_MMAP_MIN_ADDR
 config ARCH_SUPPORTS_MEMORY_FAILURE
 	bool
 
+config MEM_PROVIDER
+	bool
+	help
+	  An interface that lets a driver lend memory that the page allocator
+	  does not manage to consumers such as guest_memfd and iommufd, and
+	  take it back.  See include/linux/mem_provider.h.
+
 config MEMORY_FAILURE
 	depends on MMU
 	depends on ARCH_SUPPORTS_MEMORY_FAILURE
diff --git a/mm/Makefile b/mm/Makefile
index eff9f9e7e061..35420b587f89 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -110,6 +110,7 @@ obj-$(CONFIG_CGROUP_HUGETLB) += hugetlb_cgroup.o
 obj-$(CONFIG_GUP_TEST) += gup_test.o
 obj-$(CONFIG_DMAPOOL_TEST) += dmapool_test.o
 obj-$(CONFIG_MEMORY_FAILURE) += memory-failure.o
+obj-$(CONFIG_MEM_PROVIDER) += mem_provider.o
 obj-$(CONFIG_HWPOISON_INJECT) += hwpoison-inject.o
 obj-$(CONFIG_DEBUG_KMEMLEAK) += kmemleak.o
 obj-$(CONFIG_DEBUG_RODATA_TEST) += rodata_test.o
diff --git a/mm/mem_provider.c b/mm/mem_provider.c
new file mode 100644
index 000000000000..5a2984afde10
--- /dev/null
+++ b/mm/mem_provider.c
@@ -0,0 +1,177 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Memory providers: lend memory that the page allocator does not manage to
+ * consumers that map it.  See include/linux/mem_provider.h.
+ *
+ * Locking: the @lock of a struct mem_provider_file protects its list of
+ * consumers.  mem_provider_revoke() holds it for reading while it calls the
+ * consumers, so a consumer cannot detach until every revoke of its file has
+ * returned.  It follows that a revoke callback must not attach, detach or
+ * revoke, and that a consumer must not detach while it holds a lock that its
+ * revoke callback takes.  A revoke callback may call get_page(), which takes
+ * no lock of the core.
+ */
+#include <linux/export.h>
+#include <linux/file.h>
+#include <linux/fs.h>
+#include <linux/mem_provider.h>
+#include <linux/mm.h>
+#include <linux/rwsem.h>
+
+/**
+ * mem_provider_file_init() - Set up the provider side of a provider file.
+ * @mpf: Embedded in the provider's state for the file.
+ */
+void mem_provider_file_init(struct mem_provider_file *mpf)
+{
+	init_rwsem(&mpf->lock);
+	INIT_LIST_HEAD(&mpf->consumers);
+}
+EXPORT_SYMBOL_GPL(mem_provider_file_init);
+
+/**
+ * mem_provider_attach() - Attach a consumer to a provider file.
+ * @att: The consumer's attachment, filled in on success.
+ * @file: A file handed out by a provider.
+ * @size: The end of the range of @file that the consumer will use, in bytes
+ *        from offset 0.  The provider refuses a file that is smaller.
+ * @revoke: Called when the frames behind a range of @file change.
+ *
+ * Holds a reference to @file, and so to the provider's module, until
+ * mem_provider_detach().
+ *
+ * Return: 0, -EINVAL if @size or @revoke is invalid or the provider lacks an
+ * operation, -ENODEV if @file is not a provider file, or the error returned
+ * by the provider.
+ */
+int mem_provider_attach(struct mem_provider_attachment *att, struct file *file,
+			loff_t size,
+			void (*revoke)(struct mem_provider_attachment *att,
+				       loff_t offset, loff_t len))
+{
+	const struct mem_provider_ops *ops;
+	struct mem_provider_file *mpf;
+
+	if (size <= 0 || !revoke)
+		return -EINVAL;
+
+	if (!(file->f_op->fop_flags & FOP_MEM_PROVIDER))
+		return -ENODEV;
+	ops = container_of(file->f_op, struct mem_provider_fops, fops)->ops;
+	if (WARN_ON_ONCE(!ops->attach || !ops->detach || !ops->get_page))
+		return -EINVAL;
+
+	mpf = ops->attach(file, size);
+	if (IS_ERR(mpf))
+		return PTR_ERR(mpf);
+
+	att->ops = ops;
+	att->mpf = mpf;
+	att->file = get_file(file);
+	att->size = size;
+	att->revoke = revoke;
+
+	down_write(&mpf->lock);
+	list_add_tail(&att->node, &mpf->consumers);
+	up_write(&mpf->lock);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mem_provider_attach);
+
+/**
+ * mem_provider_detach() - Detach a consumer from a provider file.
+ * @att: An attachment from mem_provider_attach().
+ *
+ * The consumer must have removed every mapping of the provider's frames.
+ * Waits for revokes of the file that are in progress.  Does nothing if @att
+ * is not attached.
+ */
+void mem_provider_detach(struct mem_provider_attachment *att)
+{
+	struct mem_provider_file *mpf = att->mpf;
+
+	if (!att->ops)
+		return;
+
+	down_write(&mpf->lock);
+	list_del(&att->node);
+	up_write(&mpf->lock);
+
+	att->ops->detach(mpf);
+	fput(att->file);
+
+	att->ops = NULL;
+	att->mpf = NULL;
+	att->file = NULL;
+}
+EXPORT_SYMBOL_GPL(mem_provider_detach);
+
+/**
+ * mem_provider_get_page() - Get the frame behind a page of an attachment.
+ * @att: The attachment.
+ * @index: The page, in units of PAGE_SIZE from offset 0.
+ * @pfn: [out] The frame.
+ * @max_order: [in, out] See &mem_provider_ops.get_page.
+ * @attrs: [out] MEM_PROVIDER_ATTR_* for the frame.
+ *
+ * On return, @max_order is also limited so that the block is aligned in
+ * physical memory.  The frame stays valid until the consumer's revoke
+ * callback for the page has returned.
+ *
+ * Return: 0, -EFAULT if the provider does not back the page now, -EINVAL if
+ * @index is beyond the attachment, -EIO if the provider returned an invalid
+ * result, or another negative errno from the provider.
+ */
+int mem_provider_get_page(struct mem_provider_attachment *att, pgoff_t index,
+			  unsigned long *pfn, int *max_order, u32 *attrs)
+{
+	int order = *max_order;
+	int ret;
+
+	if (index >= DIV_ROUND_UP(att->size, PAGE_SIZE))
+		return -EINVAL;
+
+	*attrs = 0;
+	ret = att->ops->get_page(att->mpf, index, pfn, max_order, attrs);
+	if (ret)
+		return ret;
+
+	if (WARN_ON_ONCE(*max_order < 0 || *max_order > order ||
+			 (*attrs & ~MEM_PROVIDER_ATTR_VALID) ||
+			 mem_provider_type(*attrs) > MEM_PROVIDER_TYPE_MMIO_WC))
+		return -EIO;
+
+	/* A large mapping also needs the first frame of the block aligned. */
+	if (*max_order && ((*pfn ^ index) & ((1UL << *max_order) - 1)))
+		*max_order = __ffs(*pfn ^ index);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mem_provider_get_page);
+
+/**
+ * mem_provider_revoke() - Tell the consumers that frames changed.
+ * @mpf: The provider side of the file.
+ * @offset: The start of the range, in bytes.
+ * @len: The length of the range, in bytes.
+ *
+ * Call this after the provider has changed the frames or attributes behind
+ * the range.  Returns when every consumer of the file has removed its
+ * mappings of the range.  The provider must not hold a lock that its
+ * get_page() takes, because a consumer may call get_page() before it
+ * returns.  May sleep.
+ */
+void mem_provider_revoke(struct mem_provider_file *mpf, loff_t offset,
+			 loff_t len)
+{
+	struct mem_provider_attachment *att;
+
+	might_sleep();
+	if (len <= 0)
+		return;
+
+	down_read(&mpf->lock);
+	list_for_each_entry(att, &mpf->consumers, node)
+		att->revoke(att, offset, len);
+	up_read(&mpf->lock);
+}
+EXPORT_SYMBOL_GPL(mem_provider_revoke);
-- 
2.47.3


