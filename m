Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57CC7C5DF67
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 17:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hcj1jFC26/Dufc2/bYrj4t3DzvO2jGBOUyeCAQas2/U=; b=4i9mkHp0SH+sATB1s1bgDtriD8
	rr/FmT5iGBZGJjRpvGQzuKH9c/R7QZoj5N0O+N/fMDT1Ak8OglUxHnNhJ49Psx5A/y/vVFRdFUWfI
	hBi6fgjkbI4G22F+72TH6dwt/TSNJPFH0efVEo2m8MugrmBSI4R85/+JLOxUdFpa+v1JPQu0SlT4V
	sGBKleRwQiCeu0lkoiApUpasdox+hlXLLFU9S3DXnVnWBgTrvT2ibSp3uFjDOfWhd8lIIZJ9ZE/Js
	D0GgeUX0gTCi9y+EegT/Q9IFkqPW6JqdZIR/NvTErmkONPPLQh92nJomBRsTnjBJJO9YiF1RrVCan
	HJCxnFjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuYrj-00000001EJr-2HSc;
	Thu, 13 Aug 2026 17:05:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuYrh-00000001EHs-2ZiV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 17:05:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786640712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hcj1jFC26/Dufc2/bYrj4t3DzvO2jGBOUyeCAQas2/U=;
	b=LnU428zkuwhdRtceQg2WoyBwOaXeN978zlFY0qUixyaJUhrCwQhba3l3O66vpZsicTs+O/
	YjAuWsrvlXk+bMNLoApi9iqwprN5jUZ8Q/nwVpSmaXAVXFU7DHhSkiM5k8KEUwuDhFiqGc
	QrrmFwfM+apPvZDjlsYFj2M/3NbxM1w=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-482-LYHm2ovYMG-hpFzaOlC5Pw-1; Thu,
 13 Aug 2026 13:04:00 -0400
X-MC-Unique: LYHm2ovYMG-hpFzaOlC5Pw-1
X-Mimecast-MFC-AGG-ID: LYHm2ovYMG-hpFzaOlC5Pw_1786640635
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 72D121955F7A;
	Thu, 13 Aug 2026 17:03:51 +0000 (UTC)
Received: from wsxc.redhat.com (unknown [10.96.134.24])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D6B8A195DF9A;
	Thu, 13 Aug 2026 17:03:36 +0000 (UTC)
From: Ricardo Robaina <rrobaina@redhat.com>
To: audit@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	bpf@vger.kernel.org
Cc: paul@paul-moore.com,
	eparis@redhat.com,
	sgrubb@redhat.com,
	oleg@redhat.com,
	richard.henderson@linaro.org,
	mattst88@gmail.com,
	linmag7@gmail.com,
	linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	guoren@kernel.org,
	monstr@monstr.eu,
	tsbogend@alpha.franken.de,
	jonas@southpole.se,
	stefan.kristiansson@saunalahti.fi,
	shorne@gmail.com,
	James.Bottomley@HansenPartnership.com,
	deller@gmx.de,
	ysato@users.sourceforge.jp,
	dalias@libc.org,
	glaubitz@physik.fu-berlin.de,
	davem@davemloft.net,
	andreas@gaisler.com,
	richard@nod.at,
	anton.ivanov@cambridgegreys.com,
	johannes@sipsolutions.net,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	tglx@kernel.org,
	peterz@infradead.org,
	luto@kernel.org,
	Ricardo Robaina <rrobaina@redhat.com>
Subject: [PATCH 01/13] audit: log all six syscall arguments in the SYSCALL record
Date: Thu, 13 Aug 2026 14:02:51 -0300
Message-ID: <e869742712017760dec79f20748370a4ac8bfea2.1786626275.git.rrobaina@redhat.com>
In-Reply-To: <cover.1786626275.git.rrobaina@redhat.com>
References: <cover.1786626275.git.rrobaina@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: -NxlpToZlrjKjatqdKGAyAAzlbI4A8VilE8RZ9237Og_1786640635
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_100513_723346_898F265E 
X-CRM114-Status: GOOD (  17.82  )
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

The SYSCALL record currently logs only four of the six syscall
arguments (a0-a3). The remaining two are captured but silently
discarded before reaching the audit context. This leads to the
need for auxiliary records when audit-relevant data lands in
the 5th or 6th argument of a syscall.

Extend the SYSCALL record to log all six arguments, by adding
arguments a4 and a5 (5th and 6th syscall argument respectively)
inline within the existing record. Additionally, add the two
new args to audit rules switch case, so audit rules can filter
on them. Lastly, as a minor cleanup, rename params from (a1-a4)
to (a0-a5) in __audit_syscall_entry(), for consistency.

 type=SYSCALL ... syscall=openat ... a3=0x0 a4=0 a5=0 ...
 type=SYSCALL ... syscall=sendto ... a3=0x0 a4=7fff68843bcc a5=c ...

Link: https://lore.kernel.org/audit/CAHC9VhSjEt_-Bsra4AEqWv+Daw5Ff=gqy7dX4Ah11RVhdyCBUQ@mail.gmail.com/T/#t
Signed-off-by: Ricardo Robaina <rrobaina@redhat.com>
---
 include/linux/audit.h        | 11 +++++++----
 include/linux/entry-common.h |  3 ++-
 include/uapi/linux/audit.h   |  2 ++
 kernel/audit.h               |  2 +-
 kernel/auditfilter.c         |  2 ++
 kernel/auditsc.c             | 31 ++++++++++++++++++++-----------
 6 files changed, 34 insertions(+), 17 deletions(-)

diff --git a/include/linux/audit.h b/include/linux/audit.h
index 45abb3722d30..7306d7861159 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -324,7 +324,8 @@ extern void __audit_free(struct task_struct *task);
 extern void __audit_uring_entry(u8 op);
 extern void __audit_uring_exit(int success, long code);
 extern void __audit_syscall_entry(int major, unsigned long a0, unsigned long a1,
-				  unsigned long a2, unsigned long a3);
+				  unsigned long a2, unsigned long a3,
+				  unsigned long a4, unsigned long a5);
 extern void __audit_syscall_exit(int ret_success, long ret_value);
 extern void __audit_getname(struct filename *name);
 extern void __audit_inode(struct filename *name, const struct dentry *dentry,
@@ -375,10 +376,11 @@ static inline void audit_uring_exit(int success, long code)
 }
 static inline void audit_syscall_entry(int major, unsigned long a0,
 				       unsigned long a1, unsigned long a2,
-				       unsigned long a3)
+				       unsigned long a3, unsigned long a4,
+				       unsigned long a5)
 {
 	if (unlikely(audit_context()))
-		__audit_syscall_entry(major, a0, a1, a2, a3);
+		__audit_syscall_entry(major, a0, a1, a2, a3, a4, a5);
 }
 static inline void audit_syscall_exit(void *pt_regs)
 {
@@ -613,7 +615,8 @@ static inline void audit_uring_exit(int success, long code)
 { }
 static inline void audit_syscall_entry(int major, unsigned long a0,
 				       unsigned long a1, unsigned long a2,
-				       unsigned long a3)
+				       unsigned long a3, unsigned long a4,
+				       unsigned long a5)
 { }
 static inline void audit_syscall_exit(void *pt_regs)
 { }
diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
index 416a3352261f..cf2d9989e3fe 100644
--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -65,7 +65,8 @@ static inline void syscall_enter_audit(struct pt_regs *regs, long syscall)
 		unsigned long args[6];
 
 		syscall_get_arguments(current, regs, args);
-		audit_syscall_entry(syscall, args[0], args[1], args[2], args[3]);
+		audit_syscall_entry(syscall, args[0], args[1], args[2], args[3],
+				    args[4], args[5]);
 	}
 }
 
diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
index e8f5ce677df7..6726059d6df1 100644
--- a/include/uapi/linux/audit.h
+++ b/include/uapi/linux/audit.h
@@ -303,6 +303,8 @@
 #define AUDIT_ARG1      (AUDIT_ARG0+1)
 #define AUDIT_ARG2      (AUDIT_ARG0+2)
 #define AUDIT_ARG3      (AUDIT_ARG0+3)
+#define AUDIT_ARG4      (AUDIT_ARG0+4)
+#define AUDIT_ARG5      (AUDIT_ARG0+5)
 
 #define AUDIT_FILTERKEY	210
 
diff --git a/kernel/audit.h b/kernel/audit.h
index 92d5e723d570..83011b14af18 100644
--- a/kernel/audit.h
+++ b/kernel/audit.h
@@ -117,7 +117,7 @@ struct audit_context {
 	struct audit_stamp  stamp;	/* event identifier */
 	int		    major;      /* syscall number */
 	int		    uring_op;   /* uring operation */
-	unsigned long	    argv[4];    /* syscall arguments */
+	unsigned long	    argv[6];    /* syscall arguments */
 	long		    return_code;/* syscall return code */
 	u64		    prio;
 	int		    return_valid; /* return code is valid */
diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
index 7f791afe5791..4bf539d6937d 100644
--- a/kernel/auditfilter.c
+++ b/kernel/auditfilter.c
@@ -358,6 +358,8 @@ static int audit_field_valid(struct audit_entry *entry, struct audit_field *f)
 	case AUDIT_ARG1:
 	case AUDIT_ARG2:
 	case AUDIT_ARG3:
+	case AUDIT_ARG4:
+	case AUDIT_ARG5:
 	case AUDIT_PERS: /* <uapi/linux/personality.h> */
 	case AUDIT_DEVMINOR:
 		/* all ops are valid */
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 6610e667c728..7a9d65a6b1cc 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -728,6 +728,8 @@ static int audit_filter_rules(struct task_struct *tsk,
 		case AUDIT_ARG1:
 		case AUDIT_ARG2:
 		case AUDIT_ARG3:
+		case AUDIT_ARG4:
+		case AUDIT_ARG5:
 			if (ctx)
 				result = audit_comparator(ctx->argv[f->type-AUDIT_ARG0], f->op, f->val);
 			break;
@@ -1674,11 +1676,13 @@ static void audit_log_exit(void)
 						    AUDITSC_SUCCESS),
 					 context->return_code);
 		audit_log_format(ab,
-				 " a0=%lx a1=%lx a2=%lx a3=%lx items=%d",
+				 " a0=%lx a1=%lx a2=%lx a3=%lx a4=%lx a5=%lx items=%d",
 				 context->argv[0],
 				 context->argv[1],
 				 context->argv[2],
 				 context->argv[3],
+				 context->argv[4],
+				 context->argv[5],
 				 context->name_count);
 		audit_log_task_info(ab);
 		audit_log_key(ab, context->filterkey);
@@ -1970,10 +1974,12 @@ void __audit_uring_exit(int success, long code)
 /**
  * __audit_syscall_entry - fill in an audit record at syscall entry
  * @major: major syscall type (function)
- * @a1: additional syscall register 1
- * @a2: additional syscall register 2
- * @a3: additional syscall register 3
- * @a4: additional syscall register 4
+ * @a0: additional syscall register 1
+ * @a1: additional syscall register 2
+ * @a2: additional syscall register 3
+ * @a3: additional syscall register 4
+ * @a4: additional syscall register 5
+ * @a5: additional syscall register 6
  *
  * Fill in audit context at syscall entry.  This only happens if the
  * audit context was created when the task was created and the state or
@@ -1983,8 +1989,9 @@ void __audit_uring_exit(int success, long code)
  * will only be written if another part of the kernel requests that it
  * be written).
  */
-void __audit_syscall_entry(int major, unsigned long a1, unsigned long a2,
-			   unsigned long a3, unsigned long a4)
+void __audit_syscall_entry(int major, unsigned long a0, unsigned long a1,
+			   unsigned long a2, unsigned long a3,
+			   unsigned long a4, unsigned long a5)
 {
 	struct audit_context *context = audit_context();
 	enum audit_state     state;
@@ -2012,10 +2019,12 @@ void __audit_syscall_entry(int major, unsigned long a1, unsigned long a2,
 
 	context->arch	    = syscall_get_arch(current);
 	context->major      = major;
-	context->argv[0]    = a1;
-	context->argv[1]    = a2;
-	context->argv[2]    = a3;
-	context->argv[3]    = a4;
+	context->argv[0]    = a0;
+	context->argv[1]    = a1;
+	context->argv[2]    = a2;
+	context->argv[3]    = a3;
+	context->argv[4]    = a4;
+	context->argv[5]    = a5;
 	context->context = AUDIT_CTX_SYSCALL;
 	context->current_state  = state;
 	ktime_get_coarse_real_ts64(&context->stamp.ctime);
-- 
2.55.0


