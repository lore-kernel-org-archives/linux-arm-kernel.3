Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57225CF3942
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y7Ucs3kp0oXjJAHNPlew8LSoAGCaHnYy/9pb2BVOQfw=; b=dBnDMcW5c559rmmg/XBHyJrvb7
	IL8PD+FpB2GfI9ZgaYDCLMX31FdGLm4OCW8AUp+a5gEtkILviWN03gVXQxt5pBiemqZCPkYwzRMvb
	RWQyWvZgU8OlBg5/p3QWAl8n6p8rIsZgr0bmnGtliKKV/BpAHywUkoIVs4qkK38u9SwO42Aql1Wak
	qfO/ImgGj3/Yb/GOGHLkKPnlK5yTWvm8crCChs+KDD14zWGpehmNIQfu0uf2GqlzSjYSsuXMkdvwN
	P/EBevObxMrZ/AByuMaVL7D07nyztXHhD8c6l2bpFxgc40SMxBvrwwCicS4hHNrm/K743dm18JyX3
	CqnsahGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkOD-00000003XO8-3ykj;
	Wed, 19 Nov 2025 15:46:37 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkNY-00000003WWG-0EB4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:45:57 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-42b3b29153fso3747902f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 07:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567154; x=1764171954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7Ucs3kp0oXjJAHNPlew8LSoAGCaHnYy/9pb2BVOQfw=;
        b=MUFKQThFqkAYrc8jbPmZbZF4bn9Ge4f/CcAnHAdKCYHs78wwN1mFV5VmB9ZXpZaxkw
         NokzIUcoOVP2xXpX0ONsszH4pZEO+fpE4VVU04v5Q2z5f5I40Evo1kAjd3PtlLLoMwdM
         wHKj87ZIZouEqd4+jXOS3DU/Pn4TbJI+yUeSk/liaXTd6Ax8m13eRSqzZOmgexr3lgCC
         eJgvNUUCarbZoX89W+4q4LzRCScPdNKvSI5USSC4PxRkTbncPW9UJ3wkCH3rjC348ve9
         lC99NWbhrZ/WmhtpwW0x7HgjyQMGskkeh2GN+Dbzqk6U+ZLMDVQ4wA4x8yI4E+EJKCAq
         HDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567154; x=1764171954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y7Ucs3kp0oXjJAHNPlew8LSoAGCaHnYy/9pb2BVOQfw=;
        b=RVHU2aBVOLmeJ1pCeO9DTQt9K+x5Pgfx2XkNKVU2r8XPH50THp+kf3fAYQmq9B5ILN
         i7u4PPZTYQU1u8Cru30FiDuOi7iQr202upfgrYPNiXVqCU8akbCXTYJoCkw6t3yMq4kK
         5JhUWSDJfO/qP9ItgDCEerRS7hfE83E7ne9UdZga8ZwFw/HhdgSl777KWUP6/gQKtgUe
         Y3D02vIGnyA1FFztbDR2DXTxtCN0iDacS+R42Ub4h8IXmOgnZwhQEh5ASpmf14z01NDO
         w6FD8CSn0ScOwwz3GnQ+MrH16upa1z33EXEUBb1R2awLslOcJo4QdoZyawpwE+zOhZxI
         0zXQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+vP/nxOBttvIWrEJAhs+5x+/RLLzB89JyuL3YwG3XhVdKACZfTIXq6jhB+GTXOjIfnOrIO/QcERql6aYPdAYd@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2jLcdwSRFiXpLvGLg5JhOsWfv70dATVcVn3uqSVM4wshWWyF6
	t19TKdGEi0Uw1QMbe7rNOEDG+qhVqEtKRVvS27iSODfZkm2ertyZUFTEbP6iaTD2qJ4=
X-Gm-Gg: ASbGnctlz15A7gz1C/4akOw7mx4Q9qZzYKPL7Jd2WHy1d4WR7TrFIf3YV++e6PtY+qk
	UZi8J70fodgz0VFyb8cfjAdK9fItH3/aNun+bLUXeLQZlnb3/IngS4RzeEimHB/cxMRgFrrmikj
	il+BusqVkjaPn6JUrUnnBk/Z5rxMgBRUZuNSlASjwsndZYzoGbF9xcTsWgb0hvu2W1YQh/IihzQ
	QvmTe/uHO86chI0YciBz0s7Qetwyb+sHu9s6MazNFuXhbJ0Ldv+pcbGCnQ9yb9WT74PtZm8U1zK
	1xvZQZQuI6Sc3/DsbGnyyqQ4dTCCmQc9Tp05dJMq+4DB/c9975QF750bPPVsU3IQ0Ulkqnu8EEY
	tjkQutkHI6dul8u585jv0loP+qI5/Iqhks6lWdV8vcpbRqXp2eowpqs18jrCKU6nZGqDNEsAS1B
	N0vgqA3qud5nplQpc39oxofzeSsr6z3A==
X-Google-Smtp-Source: AGHT+IFMxVwxw3DtlUhFwveVzixkh9p9iHWd+faYE31GhqiINsGSMiGzAK7z2FWSCj0eS8F6/aaKoQ==
X-Received: by 2002:a05:6000:2510:b0:42b:3e20:f1b4 with SMTP id ffacd0b85a97d-42cb1f1de66mr3206403f8f.5.1763567153508;
        Wed, 19 Nov 2025 07:45:53 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:53 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org,
	tony.luck@intel.com,
	kees@kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH 21/26] printk: Register information into meminspect
Date: Wed, 19 Nov 2025 17:44:22 +0200
Message-ID: <20251119154427.1033475-22-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_074556_179846_2B3DF956 
X-CRM114-Status: GOOD (  10.79  )
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

Annotate vital static information into meminspect:
 - prb_descs
 - prb_infos
 - prb
 - prb_data
 - printk_rb_static
 - printk_rb_dynamic

Information on these variables is stored into inspection table.

Register dynamic information into meminspect:
 - new_descs
 - new_infos
 - new_log_buf
This information is being allocated as a memblock, so call
memblock_mark_inspect to mark the block accordingly.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/printk/printk.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 5aee9ffb16b9..8b5aba2527ac 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -49,6 +49,7 @@
 #include <linux/sched/debug.h>
 #include <linux/sched/task_stack.h>
 #include <linux/panic.h>
+#include <linux/meminspect.h>
 
 #include <linux/uaccess.h>
 #include <asm/sections.h>
@@ -513,10 +514,16 @@ static u32 log_buf_len = __LOG_BUF_LEN;
 #endif
 _DEFINE_PRINTKRB(printk_rb_static, CONFIG_LOG_BUF_SHIFT - PRB_AVGBITS,
 		 PRB_AVGBITS, &__log_buf[0]);
+MEMINSPECT_NAMED_ENTRY(prb_descs, _printk_rb_static_descs);
+MEMINSPECT_NAMED_ENTRY(prb_infos, _printk_rb_static_infos);
+MEMINSPECT_NAMED_ENTRY(prb_data, __log_buf);
+MEMINSPECT_SIMPLE_ENTRY(printk_rb_static);
 
 static struct printk_ringbuffer printk_rb_dynamic;
+MEMINSPECT_SIMPLE_ENTRY(printk_rb_dynamic);
 
 struct printk_ringbuffer *prb = &printk_rb_static;
+MEMINSPECT_SIMPLE_ENTRY(prb);
 
 /*
  * We cannot access per-CPU data (e.g. per-CPU flush irq_work) before
@@ -1190,6 +1197,7 @@ void __init setup_log_buf(int early)
 		       new_log_buf_len);
 		goto out;
 	}
+	memblock_mark_inspect(virt_to_phys(new_log_buf), new_log_buf_len);
 
 	new_descs_size = new_descs_count * sizeof(struct prb_desc);
 	new_descs = memblock_alloc(new_descs_size, LOG_ALIGN);
@@ -1198,6 +1206,7 @@ void __init setup_log_buf(int early)
 		       new_descs_size);
 		goto err_free_log_buf;
 	}
+	memblock_mark_inspect(virt_to_phys(new_descs), new_descs_size);
 
 	new_infos_size = new_descs_count * sizeof(struct printk_info);
 	new_infos = memblock_alloc(new_infos_size, LOG_ALIGN);
@@ -1206,6 +1215,7 @@ void __init setup_log_buf(int early)
 		       new_infos_size);
 		goto err_free_descs;
 	}
+	memblock_mark_inspect(virt_to_phys(new_infos), new_infos_size);
 
 	prb_rec_init_rd(&r, &info, &setup_text_buf[0], sizeof(setup_text_buf));
 
@@ -1258,8 +1268,10 @@ void __init setup_log_buf(int early)
 
 err_free_descs:
 	memblock_free(new_descs, new_descs_size);
+	memblock_clear_inspect(virt_to_phys(new_descs), new_descs_size);
 err_free_log_buf:
 	memblock_free(new_log_buf, new_log_buf_len);
+	memblock_clear_inspect(virt_to_phys(new_log_buf), new_log_buf_len);
 out:
 	print_log_buf_usage_stats();
 }
-- 
2.43.0


