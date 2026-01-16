Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59244D48995
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 12:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mi5C2RjIhBWHQ4b9al8Pcu5M4rgSXenEslgFD0XFaWQ=; b=OR70fg7kgpaOvJTZrsNSXGNabg
	ZKd9PQymQsEV6WEDM+iuc0Xl9pnBS9Y2mFMiRU024uGbROh3fJev7VI47uXXuGNK9kCgYQ9ygM+Ru
	xWbgMuPSCxobCT9Aeh4f/VpVE/tG+9yi8YHTb8JTiLlnjWCyMcH/O6NYbGXt9KP0aP4gW2+La6gQz
	pj+9K46kXXwtL7pjXyCO7iTefg8CksWsmUR6mKTJ5snM/JCAbonL+zoZ79N4F1h6U/yY/PuiBpz30
	/fWpUBD7N9yOh3ucDPSIap5POQCoSiWYsCVXm7rQsPWyB5qFWyNo9IBiO5zxaxPjpZMaQz8HctM5c
	IBG0mDzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgieZ-0000000E5Ug-2nEr;
	Fri, 16 Jan 2026 12:10:11 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgieV-0000000E5Tg-3DdX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 12:10:09 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-430f3ef2d37so1444365f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 04:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768565405; x=1769170205; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mi5C2RjIhBWHQ4b9al8Pcu5M4rgSXenEslgFD0XFaWQ=;
        b=IgvVUccN/SWGBprEZcRzO2hzEk0YYF/ZUeToS3f3RSoNGenuPuYlBulvwypx5GOJat
         Vd95oRXGJCEwtDSbmIxOGtizEJRExUzDZwETFh/DGamaBA9/cL7LPuEsdHF5Mtu9KWhf
         wYSNNivOeHSmTBrwPV/bq2VX98GBEPhQVIy8q7l/BBig0SaY2jhQufMDcZ/Ea2vEzyga
         CBb8V1FERtltyAsrmjN6QQCIy7IBOG8ZldYWGKon2hmWpiuzygenXDI+/NVUgUq+7b8m
         Vo3t0b0/0aQ2Hmm4TZc1WoHzTxaPazsyRqih63N1LOgaIJ0jNhv6VIHdz2HU+2ca3Sac
         VWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768565405; x=1769170205;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mi5C2RjIhBWHQ4b9al8Pcu5M4rgSXenEslgFD0XFaWQ=;
        b=vDXm/+UcPu+xDyxGGky13pQLAmj583TIDe/+N6+ZeTZczAxW/QSbFBzRezgPbt/6Gh
         U2HjtH3xnP6OzIE41mKWLeN3jHImSybQQANBR6Qd2lQ1qJLog3lvlmUUE+UJCG8tKv9g
         xKpHJUDq/feVo6tlZM/SEar+FalLby1M6S+9QuBtavkhUEpJbAdlJQrJvZdJ+pU3aaH5
         imVbrhzK1U7vAYXdRMwi1wHAYcVN8NwjRkxl8ZOQu6qJ83/mEY9qlcsSz9sQhv5V+QBW
         NvXVfckST4oi5u9A9qUPyKmkxYxXvvxO02qZA/cnLeFZykrxJ25OZ225+Iaco7Skrq1a
         1XTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7sxKoKfmMdaC+quN4qDlRZ+/UZ0t1gEBfLSTDSIxjnnjTJflSDVMxbvLMClN1twQNMV0XDvsVW0ivpJ8SfH3D@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6L3XH6U4fWyfeOFou3scT2DY6FvdjBZgjzT6YwHI/CSTjfHtT
	5D4/yD5MKGRXJQRNUe8K5Uhu5uerpqrnEAxloxtKjR92iAJ4W3VQGmbfeCXvjqO5Jmg=
X-Gm-Gg: AY/fxX7EqQaEgbiat5cv72Zh7KYc2HbD7pi8MFm/LgKOYUnOAaQdi4/sf79kdX1xcaK
	7/LM8UWC9EXaVwL/9nbFfzBE+gJRgTXlDhaDASVZF7dERsq5MQaYjv+x2ScmKnL9ZtA2lgNLIME
	DlHAE8VxUJyD8JWDYNI/FWSVcPYdycU7L5Tl8MuEhxbk8Dkz2aUswVtN1ZR2oIORmQkbF2vWxNK
	GbVYkJaErIKiMWlrApQCir+7X7Hl+ChyxZL1fj8l2mJDg5ZcZCRBOYqp4OvnfzlHSE9LDw+sKr9
	3eKPb2YR0jhedg8KS23P/74lwHHfu1Ds0DiXOpltoyN4/q8A4yboPimrBNkyBW6haXk7mrQHaFE
	b87AubJLkiq9h8NLVMJDLZDoAW/rOaCXC6rCdnkG7ilHO9vOAxI1Sq4Ux2x9NSKvvXEElRrJYeY
	IleW2ANofuyABTkroXZCClcAS+zDA2NDgr+93nkTXLZhSX0Q7E5NlClflTlBULk5oGArfRVBBco
	A8Pi7QqNsT81gpkkUbb4C6kufUIHSJhHWjlA1j2F+DMye027wQmSD/OCGRKl6eO3Q12sTgDgqL5
	i1SQOhI=
X-Received: by 2002:a05:6000:2c0c:b0:430:fdc8:8bbf with SMTP id ffacd0b85a97d-43569bd0e34mr2813514f8f.59.1768565405191;
        Fri, 16 Jan 2026 04:10:05 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921da2sm4927533f8f.1.2026.01.16.04.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 04:10:04 -0800 (PST)
From: Daniel Thompson <daniel@riscstar.com>
Date: Fri, 16 Jan 2026 12:09:37 +0000
Subject: [PATCH] iommu: Fix NULL pointer deref when io_page_fault
 tracepoint fires
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-iommu-io_page_fault_null_fix-v1-1-6c20c2e62987@riscstar.com>
X-B4-Tracking: v=1; b=H4sIAIAqamkC/x2MWwqAIBAArxL7nZD2ILpKhFittWAWmhFEd2/pZ
 2DmYx6IGAgjdNkDAS+KtHsWmWcwrcYvKGhmB1WoppCyEbRvW2LqwyyorUnu1D45py3dwrZyrLA
 d60qVwIsjIOd/3w/v+wHzBVHIbgAAAA==
X-Change-ID: 20260116-iommu-io_page_fault_null_fix-f81b4e8b5423
To: Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 linux-arm-kernel@lists.infradead.org, Daniel Thompson <daniel@riscstar.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1396; i=daniel@riscstar.com;
 h=from:subject:message-id; bh=wzqwRBKyLSM4GRh0kCYODc/MRx83ikN2FZc7umGbfq8=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBpaiqObiokix9ae2QyYoXTSoETuIWNZIj3AJUUG
 dcO25z3zdCJAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCaWoqjgAKCRB84yVdOfeI
 oWobD/sGxlA1+2P2xosSrO13NYJuNZAvTUSac9q9A0JGt+RfbDnbjNkUz/OKwmpHoGl+ylFcOE4
 xHMYQEmtqKF1KkXzkOPGr0IEN/KdKhvka+YTz+Uz1MhWM5GX2ayo865KyFqCrYXoexOiNDG/FE3
 lSZcRReKaQ7mwbD5WfIiBtLJMIG7nPZv3TnBJUVnZvPOBGp8/4kERiYfaudH0y/EX8NuQEfXnJ6
 6QvFoGHo9UUK7SLHbfjjA1UwECfGVHvMG6J3fj14t9rbSaQJNn23qhj6MqnP9RPshash32ysBFB
 NizeW7gcbGu0kHH6XW8dzfoJIa78Ue4O2Rmt4SAvCEB+qZl71K6+lb8b5qWv/c+tW76HFSHZRQo
 sNmT/9n2Qo6VIvTQ5lbSNZYemcwknir239IP8uf4PTBf/7pK8HhAbUa6uca/paZvJstYMLzZS4f
 Pf0Q79d+7ymhZvM5xgo7xB/KI8nk/x9ynnfRED6nl/S/yOY92z8RpnH7Kj5AmdZamfX9jJsAaWE
 aEJ10qFthfAZ6gcBLeZ14fK/lMIWA9iUv/GViESqtmXmzNcLgajTildIRTwsV7KMLwtqC84W762
 IvCXiwv48f6E99w/KL8qF2IeUV9/moPd0y4Mh4DQyE8oR/eWC/VzoTQggoMKgSdiXXXBGsqMmID
 TURsYXBqfWJlzzQ==
X-Developer-Key: i=daniel@riscstar.com; a=openpgp;
 fpr=E38BE19861669213F6E2661AA8A4E3BC5B7B28BE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_041008_082440_327E9CAF 
X-CRM114-Status: GOOD (  13.54  )
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

The arm-smmu driver is unable to allocate the blame for a page fault to
a specific device so it calls report_iommu_fault() with the dev argument
set to NULL. Normally this doesn't cause anything catastrophic but on a
system with the io_page_fault tracepoint enabled this results in a NULL
pointer deref (resulting in a fairly spectacular crash on the hardware
I'm currently working on).

Fix this by adding logic to the tracepoint to safely propagate NULL.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
---
 include/trace/events/iommu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/trace/events/iommu.h b/include/trace/events/iommu.h
index 373007e567cb827458a729b8200bbcc1b7d76912..1315193f13b8812ad4e29e6b0c0c66ca806ce08d 100644
--- a/include/trace/events/iommu.h
+++ b/include/trace/events/iommu.h
@@ -131,8 +131,8 @@ DECLARE_EVENT_CLASS(iommu_error,
 	TP_ARGS(dev, iova, flags),
 
 	TP_STRUCT__entry(
-		__string(device, dev_name(dev))
-		__string(driver, dev_driver_string(dev))
+		__string(device, dev ? dev_name(dev) : NULL)
+		__string(driver, dev ? dev_driver_string(dev) : NULL)
 		__field(u64, iova)
 		__field(int, flags)
 	),

---
base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
change-id: 20260116-iommu-io_page_fault_null_fix-f81b4e8b5423

Best regards,
-- 
Daniel Thompson <daniel@riscstar.com>


