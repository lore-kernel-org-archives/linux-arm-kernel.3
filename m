Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63F5CCD1A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 10:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:cc:Content-Type:
	MIME-Version:References:Subject:To:From:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=vd38qmen6NqGKwpBNmxeBxrmUMKgHzuu9w3FhQnzP9o=; b=IotbxfDgNN/IxG
	rkJiMSiMyJ8RyQFZ4eF5l9rAE+DG+wB0T+zDRbg+2NklEQ9mG7TsB65Wd0CSV/IguUDcYRRNU+910
	Ai2ApM1RNsXa+g5cEfPjjqyNAZE/Rt9MV/zT3zQL4QYbD6z4aHlleZK6xSDWJJY1TtB9+Bnp1tcQT
	sV1FK38ZST7bvsu0jwPO1bRNiLDtjGASpfvs0N0UFUrZ8tgHU/td9Mu1EKgmHnf6swe2oZF1XhDzA
	vjg18KjvbLnBbxikQMUWSOhLEq4gl2H+ktvB6HyTVCE2xApgeDxS/HI7DEEl3XiDPPUlamC9HWvB9
	6/K/c0X3Pk6f8TdWu/6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hOi-00000007SMN-2lZg;
	Fri, 17 Oct 2025 10:09:20 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hOb-00000007S85-0r7B;
	Fri, 17 Oct 2025 10:09:14 +0000
Message-ID: <20251017093030.315578108@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760695751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=vd38qmen6NqGKwpBNmxeBxrmUMKgHzuu9w3FhQnzP9o=;
	b=JcAYfksQjgseU6JQSYgkc8FtMvPTo+BADwor0oMs+Wk9DC39l2Coe+sbE7+SDOueo3i1gw
	JGzB712onYnG/ENdPxx83uMwA8j+HjvyScQpX1fYKd5Q17dKeeWxIiTfCL3yaPBBgYtJnH
	uxT5lmG/p6AnqJZto66uFkr03ODvm2yhfKyWqXt4x/QbgkX5jLrhxBYu7qGphXY5iJzhff
	zoDMEx2yQkwcNlf4yDJTV9VYxcYYVa3jqYOXQiu4upVIB8qxSdV6X4By3AdGKSX5BQaMpF
	xroG39Z+EO5YYcDq2HlRO5gltDwITYHsE485kHCPtUjH9mUI9sjTeWv64gY1Ng==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760695751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=vd38qmen6NqGKwpBNmxeBxrmUMKgHzuu9w3FhQnzP9o=;
	b=DnX8ZWmywsPakWjMIvDYYLxa0MyU0uYz7SqZaZDlR9T/Fn9DUAXcsl7O4z6oJS67E42bZ8
	CqhlmgxJxTHEi3Cg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V3 08/12] uaccess: Provide put/get_user_masked()
References: <20251017085938.150569636@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
cc: kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 x86@kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org,
 Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>,
 Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
Date: Fri, 17 Oct 2025 12:09:10 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_030913_389567_66799BBF 
X-CRM114-Status: UNSURE (   9.87  )
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

Provide conveniance wrappers around scoped masked user access similiar to
put/get_user(), which reduce the usage sites to:

       if (!get_user_masked(val, ptr))
       		return -EFAULT;

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 include/linux/uaccess.h |   44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -830,6 +830,50 @@ for (bool ____stop = false; !____stop; _
 #define scoped_masked_user_rw_access(_uptr, _elbl)				\
 	scoped_masked_user_rw_access_size((_uptr), sizeof(*(_uptr)), _elbl)
 
+/**
+ * get_user_masked - Read user data with masked access
+ * @_val:	The variable to store the value read from user memory
+ * @_usrc:	Pointer to the user space memory to read from
+ *
+ * Return: true if successful, false when faulted
+ */
+#define get_user_masked(_val, _usrc)				\
+({								\
+	__label__ efault;					\
+	typeof((_usrc)) _tmpsrc	= (_usrc);			\
+	bool ____ret = true;					\
+								\
+	scoped_masked_user_read_access(_tmpsrc, efault)		\
+		unsafe_get_user(_val, _tmpsrc, efault);		\
+	if (0) {						\
+	efault:							\
+		____ret = false;				\
+	}							\
+	____ret;						\
+})
+
+/**
+ * put_user_masked - Write to user memory with masked access
+ * @_val:	The value to write
+ * @_udst:	Pointer to the user space memory to write to
+ *
+ * Return: true if successful, false when faulted
+ */
+#define put_user_masked(_val, _udst)				\
+({								\
+	__label__ efault;					\
+	typeof((_udst)) _tmpdst	= (_udst);			\
+	bool ____ret = true;					\
+								\
+	scoped_masked_user_write_access(_tmpdst, efault)	\
+		unsafe_put_user(_val, _tmpdst, efault);		\
+	if (0) {						\
+	efault:							\
+		____ret = false;				\
+	}							\
+	____ret;						\
+})
+
 #ifdef CONFIG_HARDENED_USERCOPY
 void __noreturn usercopy_abort(const char *name, const char *detail,
 			       bool to_user, unsigned long offset,


