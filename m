Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E028DCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 08:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:cc:Content-Type:
	MIME-Version:References:Subject:To:From:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=as4pbOCxyeTzYGzifOoPeMiju/LrgMig7nFy3Mj05oM=; b=bfGkBjYrmIojUb
	CqbtfKmz1xplrgsMSH81E5MifyTdaTphC8gcFrrBeUrc9qq0K3KkUlfJhowHeLhvz3Xogk7E65q7W
	iVvZds1bw46WXKUGSSDnaRfnGommsZBkugUWeQE+c7XpAoiGOIttMM7mtsAN/Qcbg+wUL8UchS75B
	PwWwz+oCXZ1AsHz1DW0sM3K3jvE/951l7BxodRISSHB1M+W8s+43mH57d/GPFzWi/PTxTJnrqAq+k
	zAUCfAoJvTSDqEYOiy2T7e1re7N0Dh98fH6imcI5XFKtFB7tTrv6zFvGjsN0E7mpwBU20xQunvaos
	ttOsAROoYzUIdY+C0Udg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIqC-0000000DOqy-02wi;
	Mon, 27 Oct 2025 08:44:36 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIpc-0000000DO95-3HRa;
	Mon, 27 Oct 2025 08:44:08 +0000
Message-ID: <20251027083745.609031602@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761554638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=as4pbOCxyeTzYGzifOoPeMiju/LrgMig7nFy3Mj05oM=;
	b=ZVzA63ZcU5mloVrwo8+Jfcyohj0YpcWp8iDv0uosSTIGcM45Tl8yQXKTF3WdtzlsM1z+mJ
	f8TA9NOrPnTyPyVmugWaX5MxqCnytrkuKrBuLV26iaNZqxMEtBr6xJ45WTbOR/vB+3gzzV
	0jNCxcRcapxFnr3bWoJY97mTfcv5YEKGvo7Tq4oSQsHCMrQ6FBCAcYDG+ifbE9gMHosLHb
	zkzf0SDgTCLBEJJbQ1BEUmbtn9GjOI9CG6cUmFHccokGfgEJjy/2JkinfGlDNP8ioNLaW0
	dnn85SIAnHnJayOM5hUUKyanxcds+OjyyMzirFKdQw9EW1wOg2U3qD+4JnQUmg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761554638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=as4pbOCxyeTzYGzifOoPeMiju/LrgMig7nFy3Mj05oM=;
	b=wry6l0YwTe1mHwd3wZkgxRkSddPV4gTf1dO6fAnvsK4rZdyFD/mI82Mc3upvCPaozRA33y
	FSBO9vnYcONdE5Dw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V5 08/12] uaccess: Provide put/get_user_inline()
References: <20251027083700.573016505@linutronix.de>
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
 David Laight <david.laight.linux@gmail.com>,
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
Date: Mon, 27 Oct 2025 09:43:56 +0100 (CET)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_014402_525360_A510E271 
X-CRM114-Status: GOOD (  12.18  )
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

Provide conveniance wrappers around scoped user access similiar to
put/get_user(), which reduce the usage sites to:

       if (!get_user_inline(val, ptr))
       		return -EFAULT;

Should only be used if there is a demonstrable performance benefit.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V5: Rename to inline
V4: Rename to scoped
---
 include/linux/uaccess.h |   50 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -825,6 +825,56 @@ for (bool done = false; !done; done = tr
 #define scoped_user_rw_access(uptr, elbl)				\
 	scoped_user_rw_access_size(uptr, sizeof(*(uptr)), elbl)
 
+/**
+ * get_user_inline - Read user data inlined
+ * @val:	The variable to store the value read from user memory
+ * @usrc:	Pointer to the user space memory to read from
+ *
+ * Return: 0 if successful, -EFAULT when faulted
+ *
+ * Inlined variant of get_user(). Only use when there is a demonstrable
+ * performance reason.
+ */
+#define get_user_inline(val, usrc)				\
+({								\
+	__label__ efault;					\
+	typeof(usrc) _tmpsrc = usrc;				\
+	int _ret = 0;						\
+								\
+	scoped_user_read_access(_tmpsrc, efault)		\
+		unsafe_get_user(val, _tmpsrc, efault);		\
+	if (0) {						\
+	efault:							\
+		_ret = -EFAULT;					\
+	}							\
+	_ret;							\
+})
+
+/**
+ * put_user_inline - Write to user memory inlined
+ * @val:	The value to write
+ * @udst:	Pointer to the user space memory to write to
+ *
+ * Return: 0 if successful, -EFAULT when faulted
+ *
+ * Inlined variant of put_user(). Only use when there is a demonstrable
+ * performance reason.
+ */
+#define put_user_inline(val, udst)				\
+({								\
+	__label__ efault;					\
+	typeof(udst) _tmpdst = udst;				\
+	int _ret = 0;						\
+								\
+	scoped_user_write_access(_tmpdst, efault)		\
+		unsafe_put_user(val, _tmpdst, efault);		\
+	if (0) {						\
+	efault:							\
+		_ret = -EFAULT;					\
+	}							\
+	_ret;							\
+})
+
 #ifdef CONFIG_HARDENED_USERCOPY
 void __noreturn usercopy_abort(const char *name, const char *detail,
 			       bool to_user, unsigned long offset,


