Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F71EC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 22:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tgz/COFsBAperIPw3jbaNsXNDBcCpCZIFlLHMRVJgqY=; b=YVsRsbm1sG8p1qr0c5MX2mJv0o
	0C8tDQjXJUH1r0EOjgzrw+6xxNXvt4Hs3gAqOZXj5P3kEk19cwHe6tz1ye1kVP2yqmH3iD/Eqb0HY
	XlumjPpLU3FzIUcqJ+loYriq/r5E+Mrre8bVN4N/gTaNIu38WwnCPng+nqndKtn0PwNH1NY7/F3nf
	edM+hSI4wpPRdbXw9I3Xxi18Y45sQGlUw2U1D7m/gFkdngje87R9jSbK6FPGVIVZ3mctzy8eSz9j4
	X6rlbPFT2I0XLjfw04jGpk6eiyjgSz/PJJU6MNLDbxWZexuGXRAbp/sKJWSHydx5ttm+AZNflRdF+
	CCIzHMbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSkAu-0000000Gj6g-37pV;
	Fri, 20 Jun 2025 22:25:32 +0000
Received: from mail-io1-xd49.google.com ([2607:f8b0:4864:20::d49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSk4E-0000000Ggyw-3jGk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 22:18:39 +0000
Received: by mail-io1-xd49.google.com with SMTP id ca18e2360f4ac-875bd5522e9so208226939f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 15:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750457917; x=1751062717; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tgz/COFsBAperIPw3jbaNsXNDBcCpCZIFlLHMRVJgqY=;
        b=XCIUJ6q9A12rVkUnthai4D/V1KoyhBdEoijVrGlHsIb9rIg+D5d57lG9s/XyVqUMA9
         /jNgfCzwhvIeZw6mklhgznuDbsC1jk6GefzY8Zh7fMH/KWWVyxlQkrmU4BiLYLQWYQzS
         i/d5qPvJlc7DASZoQZZEmv5OyhqV1PPyDKhD1SfUYRsOm2eLcEzO83llOGiHFvKdf/So
         hRNWenJgxIN2DeNPbU8BU/1XK7h0+9An2S/4P+qPKmtF66l41B76igvAc9m4VWEc6fV5
         u0g+kWpy+X1uLNwehyVjl8OKJmy/dr0BAbJheg9JLlp7x320Rpy0IX+2eYSEYfnE1dCs
         W0pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750457917; x=1751062717;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tgz/COFsBAperIPw3jbaNsXNDBcCpCZIFlLHMRVJgqY=;
        b=bkVBSI1MdKb2y5Vawu6+8rRhaEfwTnGVKkN4jZ+dzprum0fBd6Esd4K0zxTrnSglgZ
         dqT+NVqFXvFi15jx4sAM8h6Xq+qqoIYnz8CYXkW+N8Q/kU19YrRD6uFL80qI7aic7YKT
         9DPE3XF2yp9yFgSv0isaSt05/h62Xb0EdrBHvB3bd53VLbUmTEDOAfP2fvUrboe2/Qea
         WVzf0S3Kbfb3VzTXx4DrSTs4DnHdEdnK1Vb5CZOyXXidDWpZc+1wrzSlGx2KXhNOmwRk
         Tb9OSPzDtl3RJv2gf8C3MGDINbGYiUmYWK97R184Cccix8TvVeK7kgDL+kuI2coHh+9x
         JsxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUul/15TLogY/vWyrRbP0t72j+KzREA31gPmuxjjkrAmAcCxE5mXK3Ew2B80E6D1hyGFmgoSfBJmaZeWaQHwpP6@lists.infradead.org
X-Gm-Message-State: AOJu0YzM6yDLPPh3odxrkwt24kyqGE9igOo1IXcQc7VKFmlLOdiHfoqt
	tBjB9WW5RzqXH5DmUADLpQa5jfbsNYcOql7NFGhQahXWMGw6P9wnM4n/pJdm5GqCoWYjcrQi4aG
	aTap1gthFAQWc7SUy1EicSZMYag==
X-Google-Smtp-Source: AGHT+IGjEFFNY2ukf5QiVzn6d0Iwii2o/2bYlxITJ69QjxdmPFLoVLBssIQF8Rhp8gGY8wow9/U+VX25kMai0q6pUg==
X-Received: from ilbee13.prod.google.com ([2002:a05:6e02:490d:b0:3dd:bec6:9d56])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:1646:b0:3db:86fc:d328 with SMTP id e9e14a558f8ab-3de38c2e1c2mr57720245ab.5.1750457917550;
 Fri, 20 Jun 2025 15:18:37 -0700 (PDT)
Date: Fri, 20 Jun 2025 22:13:02 +0000
In-Reply-To: <20250620221326.1261128-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250620221326.1261128-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <20250620221326.1261128-3-coltonlewis@google.com>
Subject: [PATCH v2 02/23] arm64: Generate sign macro for sysreg Enums
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_151838_925030_8CD360C7 
X-CRM114-Status: UNSURE (   9.74  )
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

There's no reason Enums shouldn't be equivalent to UnsignedEnums and
explicitly specify they are unsigned. This will avoid the annoyance I
had with HPMN0.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/tools/gen-sysreg.awk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
index f2a1732cb1f6..fa21a632d9b7 100755
--- a/arch/arm64/tools/gen-sysreg.awk
+++ b/arch/arm64/tools/gen-sysreg.awk
@@ -308,6 +308,7 @@ $1 == "Enum" && (block_current() == "Sysreg" || block_current() == "SysregFields
 	parse_bitdef(reg, field, $2)
 
 	define_field(reg, field, msb, lsb)
+	define_field_sign(reg, field, "false")
 
 	next
 }
-- 
2.50.0.714.g196bf9f422-goog


