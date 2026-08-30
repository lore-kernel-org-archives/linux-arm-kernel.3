Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B46AC61DE5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 07:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lBV4SRjso+EkgLj4PkYZQJzo+GNlBWOlH+QTKJh25O4=; b=F9Dph8OWaQYldpzLhuNRODECHV
	YGqt9e76oucFuDsK1IBQfRcmhQ2Sex1dDoCcTJi1ejTP4hwseI3O/DJWCd86FNnoGabYXLZNQzTj1
	pW0eVsugpZCkfMJeMMt3xbar3UMBl2tWSoTtJ0wh3T8bcsPTJF/F8giFdwSml3J7ESOwG/86VOQ0K
	Kw/PizT8Dl+ghEZysc6HkCy8q2UEjl8gqIzu+m+0Q3QZZxiAgMaBaAL3eFNwPD7dP2Laz5bIDsfEq
	sAIat5b7G5cB4YC7UYi4FKJY054jSXtk+TxCDkIGiUdJjAT3nNCfOjtaGhoLnWYdWfzwSK4Sh1qpl
	3a1DcwzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0aGz-00000007YFf-1hKo;
	Sun, 30 Aug 2026 07:48:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0aGx-00000007YEm-1oCp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 07:48:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 472016020A;
	Sun, 30 Aug 2026 07:48:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E3281F000E9;
	Sun, 30 Aug 2026 07:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788076089;
	bh=lBV4SRjso+EkgLj4PkYZQJzo+GNlBWOlH+QTKJh25O4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=C5WEFdIxnZu7NyCEa0917/q9m8RAavDxTcdqoLLl699TQIsq4EeOhuxI+szK6oUPX
	 BBIzv3+IJ6+fS9FQmBehVilOS0JWGi1UM3ADz5QENEJkQ7B/lCi6MWuSsmh9d24gC/
	 xqZO9ZbJgzAnKUPKUwFxOq36/mp/Mjxngs08R/Q2YejbbFqe90lyuLn5rhvLGud3X2
	 EVKuB+T3cucf4i8ZuJBhzJEXqmfg9dO6oauWM/ZNRbde/XgSesB8Mx+xxgTVU6krb/
	 +wgLp1Rk81AU4bDORSu6mDLNfdNz2kcvtvVoz/m10gaevkyEoeDi6cwxlvkD5TYLbP
	 9ZbWSJno7s5+w==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Sun, 30 Aug 2026 10:47:58 +0300
Subject: [PATCH 1/4] char: xilinx_hwicap: replace page allocator calls with
 k[mz]alloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-char-misc-v1-1-05e2ce44f291@kernel.org>
References: <20260830-char-misc-v1-0-05e2ce44f291@kernel.org>
In-Reply-To: <20260830-char-misc-v1-0-05e2ce44f291@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Brad Warrum <bwarrum@linux.ibm.com>, 
 Eli Billauer <eli.billauer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Michal Simek <michal.simek@amd.com>, Ritu Agarwal <rituagar@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
 Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org
X-Mailer: b4 0.17-dev
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

hwicap_read() and hwicap_write() allocate temporary buffers used to pass
the FPGA configuration data to and from userspace.

These buffers can be allocated with kmalloc() as there's nothing special
about them to go directly to the page allocator.

kmalloc() provides a better API that does not require ugly casts and
kfree() does not need to know the size of the freed object.

Performance difference between kmalloc() and __get_free_pages() is not
measurable as both allocators take an object/page from a per-CPU list for
fast path allocations.

For the slow path the performance is anyway determined by the amount of
reclaim involved rather than by what allocator is used.

Replace use of __get_free_page() and get_zeroed_page() with kmalloc() and
kzalloc() and free_page() with kfree().

Link: https://lore.kernel.org/all/635405e4-9423-4a25-a6e7-e03c8ea0bcbe@redhat.com
Assisted-by: copilot:claude-opus
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 drivers/char/xilinx_hwicap/xilinx_hwicap.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/char/xilinx_hwicap/xilinx_hwicap.c b/drivers/char/xilinx_hwicap/xilinx_hwicap.c
index 9bb5fa642fd8..bbeb9b6060dc 100644
--- a/drivers/char/xilinx_hwicap/xilinx_hwicap.c
+++ b/drivers/char/xilinx_hwicap/xilinx_hwicap.c
@@ -382,7 +382,7 @@ hwicap_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
 		       4 - bytes_to_read);
 	} else {
 		/* Get new data from the ICAP, and return what was requested. */
-		kbuf = (u32 *) get_zeroed_page(GFP_KERNEL);
+		kbuf = kzalloc(PAGE_SIZE, GFP_KERNEL);
 		if (!kbuf) {
 			status = -ENOMEM;
 			goto error;
@@ -412,13 +412,13 @@ hwicap_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
 
 		/* If we didn't read correctly, then bail out. */
 		if (status) {
-			free_page((unsigned long)kbuf);
+			kfree(kbuf);
 			goto error;
 		}
 
 		/* If we fail to return the data to the user, then bail out. */
 		if (copy_to_user(buf, kbuf, bytes_to_read)) {
-			free_page((unsigned long)kbuf);
+			kfree(kbuf);
 			status = -EFAULT;
 			goto error;
 		}
@@ -426,7 +426,7 @@ hwicap_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
 		       kbuf,
 		       bytes_remaining);
 		drvdata->read_buffer_in_use = bytes_remaining;
-		free_page((unsigned long)kbuf);
+		kfree(kbuf);
 	}
 	status = bytes_to_read;
  error:
@@ -457,7 +457,7 @@ hwicap_write(struct file *file, const char __user *buf,
 		goto error;
 	}
 
-	kbuf = (u32 *) __get_free_page(GFP_KERNEL);
+	kbuf = kmalloc(PAGE_SIZE, GFP_KERNEL);
 	if (!kbuf) {
 		status = -ENOMEM;
 		goto error;
@@ -479,13 +479,13 @@ hwicap_write(struct file *file, const char __user *buf,
 			    (((char *)kbuf) + drvdata->write_buffer_in_use),
 			    buf + written,
 			    len - (drvdata->write_buffer_in_use))) {
-				free_page((unsigned long)kbuf);
+				kfree(kbuf);
 				status = -EFAULT;
 				goto error;
 			}
 		} else {
 			if (copy_from_user(kbuf, buf + written, len)) {
-				free_page((unsigned long)kbuf);
+				kfree(kbuf);
 				status = -EFAULT;
 				goto error;
 			}
@@ -495,7 +495,7 @@ hwicap_write(struct file *file, const char __user *buf,
 				kbuf, len >> 2);
 
 		if (status) {
-			free_page((unsigned long)kbuf);
+			kfree(kbuf);
 			status = -EFAULT;
 			goto error;
 		}
@@ -516,7 +516,7 @@ hwicap_write(struct file *file, const char __user *buf,
 		}
 	}
 
-	free_page((unsigned long)kbuf);
+	kfree(kbuf);
 	status = written;
  error:
 	mutex_unlock(&drvdata->sem);

-- 
2.53.0


