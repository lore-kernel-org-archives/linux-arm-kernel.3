Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E14EFCB600
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nAzsYfyBwss8qjbiN9KhoiGNV9RHrAQ+UoLBq6ZtFBA=; b=C2mK34yAnr5etUAzxmrF9EiQfx
	EaCKosxRZvmMFIWbe/rEtDw4+aPKQkHvnTnviE6CfOOhmCPKZdi5667sfmtYjGcdB9I97qUm/nEBf
	IzeRkcm1PIcTAtqcnp5LwVaU+qBJQl3FOXIZlEdRFXE4S+8QWbV243Viqi9w08FVhJBsFgovVjVAN
	vgPmHDQwT5y2xn+nCNpX9nfJ7Gmc8hC/Px4HIRfon5J41yBuloJZrIpumbUlk+abJXTKGK4IhdLsa
	XNE7aOxkcd86Ip3HFm/oL23xn98TKXUSw2iQif78IPXgIbCRFiYtZnIKFPQ+ZvyLXONGViaFpceMA
	5Aw9x+cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWIg-00000003wLm-0e2t;
	Fri, 06 Mar 2026 14:37:10 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWHz-00000003vRC-1qTT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:36:30 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-b8fbe7a6f41so817515566b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 06:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772807785; x=1773412585; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nAzsYfyBwss8qjbiN9KhoiGNV9RHrAQ+UoLBq6ZtFBA=;
        b=UFkkA1X7aQpQ6PoB0Pv7jPKxUpvwDGJLpd+NS9tuCKAbumloZw6+TwAoYKszfYPe3U
         DLFo5I5KJBqqIZqPXiCzET+AhqjTwoBBiA3k318X5ME2Po5qSQVEHCHRauewtsQAGaK4
         AOxcfmmwdUyS4QYdkugsrOPhpMxxPzMrx2t/IWWaX44UMg6POuWDAapcgz1WoS4OHM+A
         pCk+9KA+qIJZqdbrwNm+TMozU6pdDVflWVW74yxLaPGq0/dZzmhT1QmbBjL5Q+3kxMsf
         c8a0tHPTkRrPZ9iwPFh3RArS5mk1U2saPRNqzl6kBQoyRJTQUSyharBA0RH69e30HF0y
         gHUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772807785; x=1773412585;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nAzsYfyBwss8qjbiN9KhoiGNV9RHrAQ+UoLBq6ZtFBA=;
        b=l2NeRGUEbVvj7UCaPZSRvPrW0KvgX243ejRaJvfx8g1V4l1kbgcQ1NSGTsae2WBM2O
         UbnHXDXal7UlLBoXmOisoa7vjjDNxYEfw97WLv2nWm67kwoOcD/RGHPDDMEV33wnppmc
         2fvslJnvqjiT3NKDWWh1HuR4D0NvijbiiUmi06CydD3sdRkXJhGQqA8+NzEhkX8K8vPH
         3mZFxyF8/EP/00SqLVcfvZU5IKSBF3yzNBnPb5P9sx8/QacfC/Fcw/vJPYOO8hPwqvTC
         Q1FxIfub+vkmrnd/DXD5CFTBSkzQmABsS8Jk4GRklMxMhRLv2I6uqfwm6nmq1mMLQRMF
         65BA==
X-Forwarded-Encrypted: i=1; AJvYcCXe05PkHKDA/geUmPVSA1D4gWCzraLSaRSfbVjMPaoenAGhKAeX0tRyD8AMD9xecLsuy1rpYAYdeiXPi/w1FEwI@lists.infradead.org
X-Gm-Message-State: AOJu0YwvZ7Z/Haz0XKeQFOKIbp2O3iilq6T7LKptMNNLEq0yhGfiLhjd
	WwsmrME06vYdZp9EXzPAGKggIIdlRCrpN/G9m3gsk7dEfzD3nlCYhgYaFQJ7N3YA1ogmerAIO2i
	TSoxQkkgd8woEYY/dh9RzRQ==
X-Received: from edge19-n1.prod.google.com ([2002:a05:6402:a553:10b0:65a:1fe2:dacc])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:944b:b0:b93:56a4:d6b8 with SMTP id a640c23a62f3a-b942e15531cmr137153666b.50.1772807784377;
 Fri, 06 Mar 2026 06:36:24 -0800 (PST)
Date: Fri,  6 Mar 2026 14:35:35 +0000
In-Reply-To: <20260306143536.339777-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260306143536.339777-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260306143536.339777-32-vdonnefort@google.com>
Subject: [PATCH v13 31/32] fixup! tracing: Add a trace remote module for testing
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	aneesh.kumar@kernel.org, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_063627_602081_39BAC0D7 
X-CRM114-Status: UNSURE (   7.14  )
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


diff --git a/kernel/trace/remote_test.c b/kernel/trace/remote_test.c
index e5023b9d2611..791128d7fd00 100644
--- a/kernel/trace/remote_test.c
+++ b/kernel/trace/remote_test.c
@@ -28,7 +28,7 @@ static int remote_test_load_simple_rb(int cpu, struct ring_buffer_desc *rb_desc)
 	struct simple_buffer_page *bpages;
 	int ret = -ENOMEM;
 
-	cpu_buffer = kmalloc(sizeof(*cpu_buffer), GFP_KERNEL);
+	cpu_buffer = kzalloc_obj(*cpu_buffer);
 	if (!cpu_buffer)
 		return ret;
 
-- 
2.53.0.473.g4a7958ca14-goog


