Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C9AC531F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 00:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MEeICHjtMij91JM5H//TSYr8sTPe1JzhDMQCFWqYwXE=; b=k4n8QMz8hrheeQMXp7LIJnaHRa
	RUF4HLSUi6aIb/NjPoDWWRXWch9LTg+qJZagrnMhrAU9gpp72dFZhvDUNgV/7ySFRI0ScFJh/c7ML
	Ksb40/F2FlnN64TVeJ/zZioIukkIqQvaN0QtRs7avyPsv1g7w+ZZ5oVEtQxEv5jQKxHH+f4z84Ot1
	bcDfgKQdBPcqPuAMdrzakSD7Ffd1IptSoiGv1LDoNzS71BFCGnXeKXAeIA94DV8qeBTrcIlXY7cSo
	a8HtfuUIvfllIEXVUQNEoKTICCnHMLNzqQAaGg75b1nCeB3/nFBKfCYlM5ANsD4uuLzb/AL991ohR
	cCLhtJ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtEbu-0000000CmR8-27A9;
	Fri, 20 Feb 2026 00:43:10 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtEbb-0000000Cm24-0AUh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 00:42:54 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-c629a3276e9so6690752a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 16:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771548170; x=1772152970; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MEeICHjtMij91JM5H//TSYr8sTPe1JzhDMQCFWqYwXE=;
        b=Cq680MGXpSy2EtfcUdjXF3hTfvS0Ca/knDAJ+gDN3nIEaPWwm0VEY+C1quZ0mBpaSg
         KDrNCaNGCS84QzwPmfsUHfNIdRfy1Xck56QeNarhrql9nEsBesAj8JEFbntwKl0LBfyQ
         dFAagZzH35GuN/hlwkPcpThJazkORaOkg61yYyu/X+9JybkK44P1+w4xvDrpyW+reKen
         QkGEHPRNTxE7zRb/G5ljgv/QXJWMXt5fcTZ7TAzExReEpzIe8bvqqPt6Ak1YgchPcsy7
         CKm3Knjn8flKm9QrM7uez2B6VIKTX+pc5A0iKEaFtEEZIBWu3jqMRh4xBlfo3+JDTuAt
         FZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771548170; x=1772152970;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MEeICHjtMij91JM5H//TSYr8sTPe1JzhDMQCFWqYwXE=;
        b=P2y/d3LxmBBggbQJWTlE05SxzNDsPY/jilaOckmkHlKcaPZ7aTSsjv7WpztPiWJVGN
         gj2nB15IGQBRN1QcKbwhpm7pwv/a0aPEkPbuKlGXshuB+w6OW+55J1lFohJXOyi2qo+0
         mYdN51AoYIVHd8HIpeTEu6IHnBMkR98dKepwu4gAM8qQ+yQ3ndp0oygHUKlxVm0D3Xg9
         81O87iEKy3FPK6XPK7bcitIloGBnpLDqeHPLuvPdpXSmHss3A6HSNEAku2FyoS5T8Gyp
         hRpzn/3jrGVCefO/5DBWOugeQJKcVkbcbLzj7mvqnIuIXjHIHwVzfJIOoq5cG02qBZmM
         DQ4A==
X-Forwarded-Encrypted: i=1; AJvYcCVEBrPHQxGtfaJt1jsKejM9H9ZDXKLri/eld7mDAVeuJ2NAzwpFXq74+J4ktE+xXT+S/XcQ3ZgpK72Y83eJWnHM@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1aKkeK9PkPPp6OOPNyqmnxd9ZX+9RzgxXrZoj0lwqMfWZERWP
	wZH19P0Me16QcG21OyQF8v5FAfrvOjnGpSo0PdeHbStk6W4MzmMj8N8c4m3znXPnqo+hbk7jQZU
	TYlht3SLB1e1Zow==
X-Received: from pgja7.prod.google.com ([2002:a63:cd47:0:b0:c6e:28c3:dd4c])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:493:b0:394:6208:6626 with SMTP id adf61e73a8af0-394fc2555e0mr6371053637.20.1771548169297;
 Thu, 19 Feb 2026 16:42:49 -0800 (PST)
Date: Fri, 20 Feb 2026 00:42:22 +0000
In-Reply-To: <20260220004223.4168331-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20260220004223.4168331-1-dmatlack@google.com>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260220004223.4168331-10-dmatlack@google.com>
Subject: [PATCH v2 09/10] KVM: selftests: Use s16 instead of int16_t
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Ackerley Tng <ackerleytng@google.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	Bibo Mao <maobibo@loongson.cn>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Colin Ian King <colin.i.king@gmail.com>, 
	David Hildenbrand <david@kernel.org>, David Matlack <dmatlack@google.com>, Fuad Tabba <tabba@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, James Houghton <jthoughton@google.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lisa Wang <wyihan@google.com>, loongarch@lists.linux.dev, 
	Marc Zyngier <maz@kernel.org>, Maxim Levitsky <mlevitsk@redhat.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	Oliver Upton <oupton@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	"Pratik R. Sampat" <prsampat@amd.com>, Rahul Kumar <rk0006818@gmail.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Wu Fei <wu.fei9@sanechips.com.cn>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_164251_112669_7E33CAB0 
X-CRM114-Status: GOOD (  14.57  )
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

Use s16 instead of int16_t to make the KVM selftests code more concise
and more similar to the kernel (since selftests are primarily developed
by kernel developers).

This commit was generated with the following command:

  git ls-files tools/testing/selftests/kvm | xargs sed -i 's/int16_t/s16/g'

Then by manually adjusting whitespace to make checkpatch.pl happy.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 tools/testing/selftests/kvm/lib/guest_sprintf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/guest_sprintf.c b/tools/testing/selftests/kvm/lib/guest_sprintf.c
index 8d60aa81e27e..2a3ab9c168f0 100644
--- a/tools/testing/selftests/kvm/lib/guest_sprintf.c
+++ b/tools/testing/selftests/kvm/lib/guest_sprintf.c
@@ -288,7 +288,7 @@ int guest_vsnprintf(char *buf, int n, const char *fmt, va_list args)
 		else if (qualifier == 'h') {
 			num = (u16)va_arg(args, int);
 			if (flags & SIGN)
-				num = (int16_t)num;
+				num = (s16)num;
 		} else if (flags & SIGN)
 			num = va_arg(args, int);
 		else
-- 
2.53.0.414.gf7e9f6c205-goog


