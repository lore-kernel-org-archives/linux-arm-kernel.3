Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCFAC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 22:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ulR0t05oQC1aYq/PHkhH5FZiwJoFyTXIHcnk/CuN1Ys=; b=gBeomngXkq0GwPWQpuMCpUYZfg
	pxqj6Bna4gPJqiSsAVvPqBvXix0ZsrIYISoyKWZZKy4cGVgzxjGKNlK5+YM1DtFgxPeuYMTe2pKTY
	AioRY4LmpFxYNEloirEIfDbr4k2qViPsl3uUJnS0NEaJ5JkVoFwh/RtO/Y84sVrl+RC2tun0wDh4s
	H4pB1S1wxRIHT/YmRRmuXKPNKyob7tEHH4YUpSEpK0hJ/OlvCiF3H99n6TzoGq0M7yk5ZSzH2ZGJX
	0E2LAg/pOjTAtnXdQvascK4GMYd3gYF5zW4d5hyEhUw2kkbPrbMG9MsgQDlPOaxHb0n+rS+LLe/8c
	ZMoke7Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQhR-0000000DXhG-30Ky;
	Tue, 06 May 2025 22:23:41 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLTL-0000000CjpX-2tBC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 16:48:52 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3912d5f6689so2843179f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 09:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746550125; x=1747154925; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ulR0t05oQC1aYq/PHkhH5FZiwJoFyTXIHcnk/CuN1Ys=;
        b=A08kTNOaYsE2dFbMsnCEkooGcAyeo7SG+9zh7J479iaoTeXZtdHsWZgm2LzpWxJLp0
         2Hm7TN2NBTpH9BDoga7cQn+oGWliNUn+1oAyG5p9eHKFGDf+FjOZP6r4v5iedCTAgJ/c
         Sa9hWZUcPZRnIh7P6H9HTXwV8FxSiGx2sSHwidpSE2EnMkaKbCr7FfAPQ7hPH6drlvC7
         5hdKT34GB91xgTj6RoXfyDKPXg7ybQsUn0tOcGRtvGrJxdthOmOKHty6MKNikKTYPURE
         EQsSSCuEZYW5TfA/K8gSvTsFOnuI/oo0OknKl5/AXSFI6FbedmXLNdXsp5qvacxn1qNm
         gqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746550125; x=1747154925;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ulR0t05oQC1aYq/PHkhH5FZiwJoFyTXIHcnk/CuN1Ys=;
        b=ImtTvFyqkQgZtfSMNZa3eGOID7T6U6JhVtMRPEWxiIS3zkwJ53VbzFSy35/u5pHuzD
         nvqQnbx/qDqEpSZHvkV3Dl77/pU45SFdjdxXFky0UIs9Rcws4kNBVupsXvVILDmpUnho
         68JeD0kfP1AmBxAOCCJdJL0Vjt58mrZIT4JItWrtVcnVBTftkgZLdumBd4XNHJbRxuIl
         tdNoDSLUfo0MTRwMzXpoOcBOtPrAUTtfukUW0o0ZzQJizt+qO8M0rPebqbxn2g9EDDQf
         CVsDW7Oyvkf5l6cNX2sJ5b5gIUDedwkT9XiatrItjx4aN4pCt4wxrX9hMSHDq+359HTP
         fNrQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6sjkheQyAXOfR8XS2tc9sc2BAgLhzo4Jn3axEgrt1uXRzaDjbhIhW9DotO4uNmIffDD0q5GUSaft3Bfy+KpMi@lists.infradead.org
X-Gm-Message-State: AOJu0YzM/hsADwjfM0iSN1gT8yiw/xr7cYV0lCLrejMedrUMxcbAylqg
	2bzzOREmp/JkOAA20ab7jS7UptmCfUMDwghZy8Zh77OmdGe7/9iRs5Bch4uh9PhvAUne3sbV9nt
	kiem7HLiU9naJJvLTOg==
X-Google-Smtp-Source: AGHT+IG1v09/s12usa8mhNe5u/61861N0/kCY4NkyY380pXa7lF6ETtkjTMmugXHCVnG7wZDISxXe9P8kKhSjb56
X-Received: from wrbbs23.prod.google.com ([2002:a05:6000:717:b0:3a0:90bc:bf72])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:47c7:0:b0:3a0:8352:775a with SMTP id ffacd0b85a97d-3a0b49b5e48mr195832f8f.34.1746550125284;
 Tue, 06 May 2025 09:48:45 -0700 (PDT)
Date: Tue,  6 May 2025 17:48:00 +0100
In-Reply-To: <20250506164820.515876-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250506164820.515876-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250506164820.515876-5-vdonnefort@google.com>
Subject: [PATCH v4 04/24] tracing: Add init callback to trace remotes
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_094847_724990_582EF597 
X-CRM114-Status: UNSURE (   9.95  )
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

Add a .init call back so the trace remote callers can add entries to the
tracefs directory.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/include/linux/trace_remote.h b/include/linux/trace_remote.h
index 1aa99da3c96a..82d26d97a536 100644
--- a/include/linux/trace_remote.h
+++ b/include/linux/trace_remote.h
@@ -3,9 +3,11 @@
 #ifndef _LINUX_TRACE_REMOTE_H
 #define _LINUX_TRACE_REMOTE_H
 
+#include <linux/dcache.h>
 #include <linux/ring_buffer.h>
 
 struct trace_remote_callbacks {
+	int	(*init)(struct dentry *d, void *priv);
 	struct trace_buffer_desc *
 		(*load_trace_buffer)(unsigned long size, void *priv);
 	void	(*unload_trace_buffer)(struct trace_buffer_desc *desc, void *priv);
diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index 2221705f65f4..6f4b921f6955 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -479,6 +479,7 @@ static int trace_remote_init_tracefs(const char *name, struct trace_remote *remo
 int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs, void *priv)
 {
 	struct trace_remote *remote;
+	int ret;
 
 	remote = kzalloc(sizeof(*remote), GFP_KERNEL);
 	if (!remote)
@@ -495,7 +496,11 @@ int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs,
 		return -ENOMEM;
 	}
 
-	return 0;
+	ret = cbs->init ? cbs->init(remote->dentry, priv) : 0;
+	if (ret)
+		pr_err("Init failed for trace remote '%s' (%d)\n", name, ret);
+
+	return ret;
 }
 
 void trace_remote_free_buffer(struct trace_buffer_desc *desc)
-- 
2.49.0.967.g6a0df3ecc3-goog


