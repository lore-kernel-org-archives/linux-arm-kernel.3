Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08767CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 14:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Psw23Q8CDCixSo0VTysz6iofpq+/aQRzLCdg5lEY87E=; b=DefXw/rDiCbAtqWbIcgm0LTMSc
	x5ajG+L8WHKNXXDE6zHQEGv/AbiOnn0QNqPEMacyAJBYn7O15eMMrB+6Y9WzCCudC+GuYaNGc9H3F
	Wq6FGaXFLQdpsSuI8+cQbwiBblaiS1D4Qn0kU7HNDvuI5tCetYb4BhNPWqhuZH+wT/gIEr+p9U26V
	4QCiAhoZapla2tAG6OxTF9IunejHKhz4cQ/G30cwnz1wNO2yfBl14ViWNE8NlzClGGU4bY8zXEoxi
	UMZtX302IgEOa5+16iyaXcsVDNjHJcEDVY6jk98E3DiWhNGpsTY88PzKnNxbr/UEvzQKBcaexHk+9
	PuP52sxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHnm-00000009OSi-1Rjz;
	Thu, 01 Oct 2026 14:30:27 +0000
Received: from mail-ej1-f72.google.com ([209.85.218.72])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHnb-00000009OGp-279X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 14:30:16 +0000
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c29959eb71fso667908266b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 07:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790865012; x=1791469812; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Psw23Q8CDCixSo0VTysz6iofpq+/aQRzLCdg5lEY87E=;
        b=b0l/UWnngCyE59/Ui9Kno7UCyHpaP3l+JAMgBdiZ1BW8T8ZvqviVN7eqEZE2U22ell
         DrZil+2c83nIgJxadPpIKRbxlHdIT3PqyEMr8DjVSlqqjmVvXCARnw1G0sllq2opHwI2
         zdJxMyrsol4p4ngN3NtcYlU20FqiQq1vXAZBOsEk2FJ4E3fHhYt+AoIUO4nXZi7lqkGs
         FZ5i255oPkwHKhhwWyq+luKFwNNITsY1NeuPK3ZVWwbgPiqJGverckkfEnmWIlWItxYn
         MOTinfpsWpbDD0AQZM0auX9+SeyG0J8dwftC+lI81L0dot4A+5swuaSThUlrYKS0M18r
         ghdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790865012; x=1791469812;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Psw23Q8CDCixSo0VTysz6iofpq+/aQRzLCdg5lEY87E=;
        b=zaqsmpgUZJKkL/Ih54jNs5Z5QWEJt7JhceyMMDs0+bDsTTKM4O9LUbKSxPhlz7B0nk
         +TisRTOk1MPWWLi2PXERqS6ADuujlX3wt4GsGKRZ84R/1yBUqelcR24ZwkYea/iY1QBz
         86YB0NHjyCPLz0b3Umb1aPpkewfSaqTuzL8iU4Zd/JoYngyVDS6klsMVjo+kjTx6CNoL
         3PxyBRQnKF/JYpz0rcmlseLMlsBOzYxqjRqvgUayW7H5pckX/BdK3vAJC/W8vFA6Fi2W
         BvRpuSSlCdDRWZQO8NyeAdRgEoffWWaoUh2QefCHlFCYccwwQeaIqE8JGukMFdQt9Sn8
         9ymA==
X-Forwarded-Encrypted: i=1; AKwUvBw0Wdhsrk2YxOrTo1sP8xk7TFY7HBFKvYwkAw+KTI76pR2U1nbuQWwn1zaInR7AxJl9bbYLO/5PDsSLzNLMnLwj@lists.infradead.org
X-Gm-Message-State: AFuF++m9dJqlYe9tDJL1Z4niBEp0fdIpe4YIVu1UsxXV0zZhtX//H/l8
	jf5lJOumFGipCDTBhv9a9jzBGxUq5FzfipsXULTu3BfnkbW8CK1n6fo5TDuzPff2STX7EGHMo+7
	IxpNzb2EXIrUdLlSaeXNfaA==
X-Received: from ejor16.prod.google.com ([2002:a17:906:5490:b0:c2e:410d:6657])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:99c5:b0:c29:555e:bf2 with SMTP id a640c23a62f3a-c2e23e0f1acmr372654166b.41.1790865012282;
 Thu, 01 Oct 2026 07:30:12 -0700 (PDT)
Date: Thu,  1 Oct 2026 15:29:59 +0100
In-Reply-To: <20261001143000.3371786-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20261001143000.3371786-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001143000.3371786-4-vdonnefort@google.com>
Subject: [PATCH v5 3/4] tracing/remotes: Add REMOTE_EVENT_CUSTOM_PRINTK() helper
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <tabba@google.com>, 
	Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_073015_601113_0B4B7017 
X-CRM114-Status: GOOD (  12.20  )
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

The current REMOTE_EVENT() takes as a __printk argument a string format
and a list of arguments, such as RE_PRINTK("foo=%d bar=%d", foo, bar).
Add a REMOTE_EVENT_CUSTOM_PRINTK() where the __printk argument can be a
function. This intends to support the creation of a "printk" event for
the arm64 nVHE/pKVM hypervisor with a dynamic prototype and by extension
a dynamic print format.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>
Acked-by: Steven Rostedt <rostedt@goodmis.org>
---
 include/trace/define_remote_events.h | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/include/trace/define_remote_events.h b/include/trace/define_remote_events.h
index 676e803dc144..78346ac77585 100644
--- a/include/trace/define_remote_events.h
+++ b/include/trace/define_remote_events.h
@@ -35,17 +35,26 @@ do {											\
 
 #define RE_PRINTK(__args...) __args
 
-#define REMOTE_EVENT(__name, __id, __struct, __printk)					\
-	REMOTE_EVENT_FORMAT(__name, __struct);						\
+#define REMOTE_EVENT_PRINT_FUNC(__name, __printk)					\
 	static void remote_event_print_##__name(void *evt, struct trace_seq *seq)	\
 	{										\
 		struct remote_event_format_##__name __maybe_unused *__entry = evt;	\
 		trace_seq_puts(seq, #__name);						\
-		remote_printk(__printk);						\
+		__printk;								\
 	}
+
+#define REMOTE_EVENT(__name, __id, __struct, __printk)					\
+	REMOTE_EVENT_FORMAT(__name, __struct);						\
+	REMOTE_EVENT_PRINT_FUNC(__name, remote_printk(__printk))
+
+#define REMOTE_EVENT_CUSTOM_PRINTK(__name, __id, __struct, __printk)			\
+	REMOTE_EVENT_FORMAT(__name, __struct);						\
+	REMOTE_EVENT_PRINT_FUNC(__name, __printk)
+
 #include REMOTE_EVENT_INCLUDE(REMOTE_EVENT_INCLUDE_FILE)
 
 #undef REMOTE_EVENT
+#undef REMOTE_EVENT_CUSTOM_PRINTK
 #undef RE_PRINTK
 #undef re_field
 #define re_field(__type, __field)							\
@@ -70,4 +79,8 @@ do {											\
 		.print_fmt	= remote_event_print_fmt_##__name,			\
 		.print		= remote_event_print_##__name,				\
 	}
+
+#define REMOTE_EVENT_CUSTOM_PRINTK(__name, __id, __struct, __printk)			\
+	REMOTE_EVENT(__name, __id, RE_STRUCT(__struct), "\"Unknown\"")
+
 #include REMOTE_EVENT_INCLUDE(REMOTE_EVENT_INCLUDE_FILE)
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


