Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6E6C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 07:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aSYQ6Hen3CMyNgjH1etqMkMNKiGDMJrXBqBRp7LU9i4=; b=T4GS4k2eyQw7dfbLWJFlAFaGQr
	32jzYHUI5s+T3vkeEmAUahEqe6X+yF3hkth+3g7V4haFWCIBmccjLI4KkrFY5lr0Xf+GP/6MkG2mC
	D33ANWU2TS2rJfPlfeT8SSOYgQ7pSxabp5835JBhr+ADpry5z2adDG/jqNlFU7zJPc8X5z1r13fCy
	GxnOBdg2mOe2O90dE4uvuRiin5VVokNxSlg+4Yt98gVhaJkSbuGIn+zw93lIGuKET8ZQgM0NhveSh
	3Fzx5CC99905HB5ANlEEpAZBy6cWKplDTMw9SZ3qmg9xBvVOJssMT7KmWKY2rG5wg8jq8niugDX24
	wT0R09XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFCc-00000007GB7-3g4j;
	Fri, 07 Aug 2026 07:41:14 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFCZ-00000007G7A-2XiX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 07:41:12 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-47de008b020so1077719f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 00:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1786088470; x=1786693270; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aSYQ6Hen3CMyNgjH1etqMkMNKiGDMJrXBqBRp7LU9i4=;
        b=SxZ2POX1yVtHg+yZAYkD7ZsQl2+zqycJ/3gL5S7irii0HAN1MFXXe+sHh6Wo4EDE7g
         B5D17zRmx0jnwqxBetWXfMua/PFptR920qbQtmmemNHPkj6zcBqYsWVcveBBQzMVuWxO
         MIdtUakuvr2/8q3/6IyBput5bAtIIawoNJbiPaKHgHtZpoSY5y5hVtOXC6/wBQisJXoD
         f3WLuTj1msCa3IpCWSdGSqLmiCvSr3gbXjPsAGTYvE50c9KvkmUz2auerQGS0Gorpi52
         x5izb6R95QB5omwjM8DMK3YAi6xsKYlDvFUNPa5EI343yixm3dgvgXNcBH60Gx77jBNk
         RiGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088470; x=1786693270;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aSYQ6Hen3CMyNgjH1etqMkMNKiGDMJrXBqBRp7LU9i4=;
        b=PROLsBg/9Mwz9hDINzlvTLuzYpYUGpaS+KIrAEjl+NFzyCfAa3dBe8lbqwC6b/PwwT
         iI6uYWL06Nqt17iKmAUxxS/DH0m3glWgVgLDIe1cWa0uWOMnrUaV+JS2yqJqmF+1sojl
         GYwwHTLrtpohJ+i6bkPAXj9r84lsoFnhnNUD+/gpPfQjGt4WvtjZE5jK3FsSTeQ+pYjb
         hokBQ2RdxUAoEJpGfXrHMiDoSMgOgT3ynrDS4Iqf1LmqhqTMH9jchqMqGfXTrFycpjrT
         BTnAuM6aEao3eVJqZ7lf3w0Al4nYL12/uMoKkrjqLduK4PDivXMKnXbWE3sSozHuNeK6
         IyHQ==
X-Forwarded-Encrypted: i=1; AHgh+RoLK61AvYAJNqIrB+kqDvfzu9lWL6muoFXOd8Xr5NVwYdE0VpnbFC4yo60VIPzxMCQgE5X/iTlW+rGQUs+fDy64@lists.infradead.org
X-Gm-Message-State: AOJu0YzioGTd0U7c6V3rbDOXdpalK7IWDzVPzvMr4B4oK5BLlUGl/ZPL
	7vClqU0t0RzfDq0E6jk30+pEhsLAvUgB6ET53cL4JowP0Fnpf5VcdPajFPytzoJqgBTA
X-Gm-Gg: AR+sD12OUB1MJXnnJqkimM+K/i8f3+l1emsy/a70+wjVWzwOaFDXY+ehFeX/gExKYod
	0PmPeLE3m6Hqh/ucn+B3Kj9uwOvqbT37WZAZjMK/0bpG9oQGZ43ZfVWHpXJlyo0ifyB775gm2dz
	TirXoN2gHGeDLtwY4M0G4bGH3oPAV+5PEE2tJlifkUp//7haMsDIdd0jXWkryOZEJ8hWYYEcdxl
	Siungwi+lM8lDdmX3jC5ZX0P0j7s3H3fcLTqWAb/YONqv9Mi9k0xIExCivU0R8HXPlRH5+Ct82h
	s4Q8OzkRy8+wvdKdRpHVBWXF6g3O8dfYVhJxN6+oIUMAXn7nCK5qzp/GEhTGWoE5j0pYxII3XFn
	pcUT+zAsL3fTPlZ9HGdGVxFM/gzaOdvkDzKKtp4DhYpFLs43G/WYm7TR94kQVjK4o5m0jWHMiUh
	zf7biDn3cUBHLYXKJqN7/kHJ+3Zq9lmY/MMe6KbVo5vXbyFq+M1KB3n/dkCppRpw4=
X-Received: by 2002:a05:6000:388:b0:47f:8cd3:4bed with SMTP id ffacd0b85a97d-47ff8694ef6mr16251068f8f.5.1786088470034;
        Fri, 07 Aug 2026 00:41:10 -0700 (PDT)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:2600:fba1:8d1e:1692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021f90f8sm2819904f8f.26.2026.08.07.00.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:41:09 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Peixoto?= <jpeixoto@osyx.tech>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: jose@osyx.tech,
	davidmcerdeira@osyx.tech,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux@armlinux.org.uk,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	rdunlap@infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH v3 6/6] MAINTAINERS: add Bao hypervisor entry
Date: Fri,  7 Aug 2026 08:39:33 +0100
Message-ID: <08c7768ee758e2b65ae50dc9b801355f378106b8.1786010512.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786010512.git.jpeixoto@osyx.tech>
References: <cover.1786010512.git.jpeixoto@osyx.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_004111_779634_B73192C4 
X-CRM114-Status: GOOD (  10.08  )
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

Add a MAINTAINERS entry covering the Bao hypervisor drivers, the
architecture headers, the in-kernel and UAPI headers, and the
device-tree bindings.

Signed-off-by: João Peixoto <jpeixoto@osyx.tech>
---
v3:
- Concise commit message (Krzysztof Kozlowski).

 MAINTAINERS | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 15011f5752a9..6a81a8da58f1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4519,6 +4519,19 @@ F:	drivers/video/backlight/
 F:	include/linux/backlight.h
 F:	include/linux/pwm_backlight.h
 
+BAO HYPERVISOR
+M:	José Martins <jose@osyx.tech>
+M:	David Cerdeira <davidmcerdeira@osyx.tech>
+M:	João Peixoto <jpeixoto@osyx.tech>
+S:	Maintained
+F:	Documentation/devicetree/bindings/bao/
+F:	arch/arm/include/asm/bao.h
+F:	arch/arm64/include/asm/bao.h
+F:	arch/riscv/include/asm/bao.h
+F:	drivers/virt/bao
+F:	include/linux/bao.h
+F:	include/uapi/linux/bao.h
+
 BARCO P50 GPIO DRIVER
 M:	Santosh Kumar Yadav <santoshkumar.yadav@barco.com>
 M:	Peter Korsgaard <peter.korsgaard@barco.com>
-- 
2.43.0


