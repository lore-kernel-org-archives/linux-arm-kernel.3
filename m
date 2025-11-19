Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7206CF34D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1EgUtWpxUoehpDvVbPcVA+GkHlZFESzHxIeFdx8HGLc=; b=A1c15UwjBM1lDTb6k+7d9UyT+Z
	s9VrDf7xmaWRktmMjtZlgkmQ8vHTPUOyUiYgq1Uj1Or32oH7waLtKL6QXIwRhlTUYrx05hLJPjLdr
	Lw8dpi55GAizokyTefIZjEh1UD7D03cELq1w4rGex8aLTzdVqcU5tDqxVMFzVQCN2YOjtaadkK6Dz
	tx4gR2v21EuVERuyB6qB3ryMV+DWq3wvQ9Y67UHqSQSpvsUroMXPUEIjwf9E/Wp35lAXc6BftJz9B
	ibf0sSV7qZJttoy2t8CLKkZtd2zNtOLQRstJxzS7mBci1hgsmOECHbK99fQQg71wDsv5th3BpYb6y
	kPPhL7yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkNX-00000003WXI-1egG;
	Wed, 19 Nov 2025 15:45:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkNJ-00000003WHE-1LrL
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 19 Nov 2025 15:45:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=1EgUtWpxUoehpDvVbPcVA+GkHlZFESzHxIeFdx8HGLc=; b=UgTWSxm/4fsq21rez8C/Yw2MNN
	qM7duFSAsJ6sayFqZ/0pOoavR/HNUvQT6+I75MI/VxDLlLxGzgs7Gd1t+DFJrcD20vWRcAC1PkVWw
	erhWZd6yWE2/woNCMt69C49gByuaCBIjkbtt6NQIE+l+azCS5JMcIjGI0t9W0DgGUKP6+9L+9Thrj
	pGZSOpAqfvGKlX7NAMVun1WWAe538DQyjl2/7WlGL3AsNXW39tviiisGS6Qduyme5dVkVCFyRWwRT
	UPs195qPY6wHfBjqkHHTPfHSVAEOGuR+mbDG7iIKgwpyq7oJnKbiUcR7mRc5jbBZM7cPk8eVRNm1j
	zU0Ysimg==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjVc-0000000CYiN-3LZF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 14:50:15 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-42b379cd896so3987840f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 07:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567136; x=1764171936; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1EgUtWpxUoehpDvVbPcVA+GkHlZFESzHxIeFdx8HGLc=;
        b=CDiyoUVvhJYre27K0C9GZpIIaSSPKhEYLyJ6bA3lPP40/Zhk3SJXU6UZIcc4aYz2yp
         tdd08UiXGJ395VWfJRFCQh/mrf/TV9khQ4yvdJ7L/WOLaZya6aQVlppO5RxHLxcA6dmP
         DQm9c5oRA1PAL+HWRlMxaWzR+hiXRFut1PZHbkw/+FaKQuWbgZIFE34X6ChWUj07Od/0
         Cv7ahIPNfvAvVnN9f9pVaqPwjwzb4gQbkzlSV9CDtFzXQpXbWS/Fn35ifYu5DT0hH9Th
         jxa9boy+Oz454s7QH68n4GWfiCGWkPx+hR8LS6dAwVVSiw2o/KhSfaTicl3YcMVgHGGF
         oqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567136; x=1764171936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1EgUtWpxUoehpDvVbPcVA+GkHlZFESzHxIeFdx8HGLc=;
        b=H1iTUBJx/98j0XwqgGRF3lUdmbpQDKa3cCqVDNaHJVbAX1HE7nKeK3p4aJBKsyCeHM
         Cb2P47FPhlRqQP3BPEIwGRXnT9DrS0vNo+IAKO5+CONBbaR9VtQZdo6KoNtyw0Ya6BJv
         wb/8aghBztq31rXHzeLI1ta1BENZSODWbsu61uSalJsFXw6bnnFD+sjxkSDociweuBlH
         u2IyujXKywKAJJlbbnXRgKtb8+4ioIG3kEaavIq4bPI4qgPFlPcpkSzZtZwSAXR3FXqF
         kvu76x8OK1G4+lg6RBlSZvSEdNi/BJtCL73wAosixn5BnAswDN4VAZgXdMOLNwZsCdEi
         +bCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw3do/jqx48HAWTxtdxTX4jQVUYFYPx70cDLQ54fvrChPFbCetEdWuesxTa7BGAdijVAEn6LzwcLLhfTKN/NBg@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp3cm/JMsPnFD+JTk2SnvUK7kqJzC7MoGiLtHYiTD6oVhDgXd0
	sCueBr9NysQ7Jf1kMt+SxPahFcMm/NrLBm7j/P5uDb2hsW825zIVh/EY3t470lDTr+A=
X-Gm-Gg: ASbGncuez00TfpAUEl7V80/mdb0H6vecp8Rks859jTSufxg/9sjvOL5bmR7UAD5505w
	zX7xZaYgyaUWxsZG3Q2mLo8zjs0w93vt41tc6LJklsg6aGee4E9J802k8tvSHcRbDUbCUQQAzs3
	mhSLnWivvHQTSh5Cu+VHphz9jJ9ThjHl+2DAlNaVFvDp4kGljiAq3sbWKeZFWVYpEIJ015Rdb8+
	fQCAloIvd1OhhU3pys6xPArIQ71v0KFYuZKDRXsAgoT3c5rJxpIcwyWeO0iR85qzFb/S5ZoH+v4
	2ParZwvDpxQKsv4ZdAKMHp3fEB8ah19Zh8n5GEyOAzYx7OFzKq3a1OdNir/5s0FUhrMfB0cZ+In
	XCdlX/6RCEMz2x9xK3Vd3ZLSAfsFCk0E6dAjJLtv/QT/pPl0ZqbUT0r4KYiY/hbGX/24W7L0+Zo
	KCBKc8AkR2lGGkR3Sp5MXc79cpT7WeXA==
X-Google-Smtp-Source: AGHT+IGKFFWZ+AqolHJ3imLY6SMDSF30b2mMpFX+Q/YU64RzAj2P3ofwp9AZZn8blv/guB2oFBfRQw==
X-Received: by 2002:a5d:5f93:0:b0:42b:43cc:982e with SMTP id ffacd0b85a97d-42b595a497fmr21650580f8f.36.1763567135863;
        Wed, 19 Nov 2025 07:45:35 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:35 -0800 (PST)
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
Subject: [PATCH 11/26] kernel/vmcore_info: Register dynamic information into meminspect
Date: Wed, 19 Nov 2025 17:44:12 +0200
Message-ID: <20251119154427.1033475-12-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_145012_914986_B9CA69D8 
X-CRM114-Status: GOOD (  13.30  )
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

Register vmcoreinfo information into inspection table.
Because the size of the info is computed after all entries are being
added, there is no point in registering the whole page, rather, call
the inspection registration once everything is in place with the right size.
A second reason is that the vmcoreinfo is added as a region inside
the ELF coreimage note, there is no point in having blank space at the end.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/vmcore_info.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/vmcore_info.c b/kernel/vmcore_info.c
index e066d31d08f8..6a9658d6ec9a 100644
--- a/kernel/vmcore_info.c
+++ b/kernel/vmcore_info.c
@@ -14,6 +14,7 @@
 #include <linux/cpuhotplug.h>
 #include <linux/memblock.h>
 #include <linux/kmemleak.h>
+#include <linux/meminspect.h>
 
 #include <asm/page.h>
 #include <asm/sections.h>
@@ -227,6 +228,9 @@ static int __init crash_save_vmcoreinfo_init(void)
 	arch_crash_save_vmcoreinfo();
 	update_vmcoreinfo_note();
 
+	meminspect_register_id_va(MEMINSPECT_ID_VMCOREINFO,
+				  (void *)vmcoreinfo_data, vmcoreinfo_size);
+
 	return 0;
 }
 
-- 
2.43.0


