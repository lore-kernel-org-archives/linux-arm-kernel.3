Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD707C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 15:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F6vaDGqz93WFfpGOQ4UOrak1EBQhkmEoatVxlVsxTPs=; b=G35TuFuuQ3RwH9VoVikAki5Uob
	as7ijGc/bSAjJ55rGNH5YFRTvsNId97amywVbHm5blFMFYQP/rDaNmUAUq0ZPrEJUcYbzj3Pgu2Rv
	r+7A3/OA/FLEW7Qx0sO6qHyj6Rm9CU+VdX67W5uzkIflvsTigcEO+tiouwge2DnpEokCYFfSsp8bc
	5epwyOlCLEgtVnBWLqnn2iHHeKeLJk6X91aR42xZ5WHFHeNmVX/8Wi7gkJBN1zCioiJggQjOKnsnd
	J+I+cFj9ZhCNCKXIffHYGHMsaXorQBkiKhK8UgCWyzWCTmXAMaZm9VwTtv4KlWGlNqxa5hPXF2c1o
	FtL90Trg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexrK-00000007r09-2SeL;
	Thu, 24 Jul 2025 15:27:50 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewQt-00000007ejG-0PBV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 13:56:28 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4563cfac19cso11040545e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 06:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365385; x=1753970185; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6vaDGqz93WFfpGOQ4UOrak1EBQhkmEoatVxlVsxTPs=;
        b=YQDi6wEYpZNHRdbCnsuEpRa3qR5bOfPc18hJ8uLTRC1LbXWuIqsnWJIq/bFtNE0Xr0
         LoY69KMyn5BsuENugzQEgsSGTpVOe5w4o43NghBOcICvjWZCUaYF7KKWj+EPMqqZybIW
         0Ei+r86Eg1bXNCwikP2aT4ij1/s3CZ76mSMufv8Hgknh+Tyf8SceGZZ2qRhjWwKB09o4
         nC3Wr/vD6YuWj3fS3wLFOYf2MCGxpL1FltEC9QfHHLj4kxts2cg4Y50iMagdBOUNDX0q
         i6cawW/EUA1LUTSRZoRoSkA5kGgREBMX32thGXxq8pfzcP1S7kof/K+CEIEWII/v/ow7
         Qy3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365385; x=1753970185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F6vaDGqz93WFfpGOQ4UOrak1EBQhkmEoatVxlVsxTPs=;
        b=WxKIu1UKVJi60gq6nVzOTDMgRBUkTrJWU4VbVKj5E7QP6EGKjSolrccTuFWsMd0nAi
         Ms4s8cQL4VvA0i4lgvoj3JdnOzIzvN7UzHOEqW3t1u1oeNZ/QhWgwEK8DleylpWtxNTY
         kejmotlqYKZick1oVrWhhxNzRAB+o4Ba0URn/lcaMfsutTGCjxKYJP0Na7qeUkm0I3Yk
         t3Y5r5AkVYdrVAzp3sJ4Xi9g70eiSQH6+8PYPyaDCHZwWFln64mUCXdhezS1xuje4Q0W
         +7bysXuVlc7iuEUrS6cztmRgTOCAvOXyxIiyR9c63vWSQ3l43KJygDpf/NExihwVosbv
         PPlQ==
X-Gm-Message-State: AOJu0YxmyZQmNob+yswp6ej6b4M+SJYkcwZTzFPyhR1lYY8eDc17aYGb
	0eXxz8cKDtdVZh2vcSur99qS1DwzXcsjyQKiytF/tLQL4E0bGiI4O+Z72QfzRSCHTnI=
X-Gm-Gg: ASbGncvnj0nRusGOIEKBiEiTFn/xICZFJPV9mt0DHG5KBCuGWDh+QX9awyj2cd26Lbj
	wB6Sws3pR+oZdYTQkIILHiHNFWxXcacOtlvifgOFy6Qnd7l3gqzS9uem73x3w3hnRf/fG95T9o1
	J0U8BGikftV1gahLl6cDUvf0cVNyRAHtT3/MoGW3tMH7uUz1Y1qal3sgY6bANGjc2/+iVaaBgGP
	Fv9ankRI7htwc+3Fb8G+hbz3LCfAQrAltF4wg0RlpIPzS4tG/xlJCmVnoQMJ0fNphJZnWDLz6JT
	7azHmsYuh/2IFY4tNaNH3t4K30d7g1uO9vKcGrRJ22eRsDckiJmN5oSus3V5pAzZVkVob/xPMCj
	pz1KAvsUn/NGzbrq16IlzLIpjyK2JUpfTRjBFN0VnXngCc2UqBdYzaMz0NzwEcOFcSs46RjATco
	nvNOHhGWqWQEtR
X-Google-Smtp-Source: AGHT+IHYnD8d7A8aBh+5tnrqY0LYzarTFZbBZJYJd44Ilh6yiLc/UVbK9j+FmYRR9VqOWZQpLWbc7Q==
X-Received: by 2002:a05:600c:500d:b0:441:a715:664a with SMTP id 5b1f17b1804b1-45868d3289cmr52540145e9.20.1753365385393;
        Thu, 24 Jul 2025 06:56:25 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:25 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	eugen.hristev@linaro.org,
	corbet@lwn.net,
	mojha@qti.qualcomm.com,
	rostedt@goodmis.org,
	jonechou@google.com,
	tudor.ambarus@linaro.org
Subject: [RFC][PATCH v2 04/29] Documentation: kmemdump: add section for coreimage ELF
Date: Thu, 24 Jul 2025 16:54:47 +0300
Message-ID: <20250724135512.518487-5-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724135512.518487-1-eugen.hristev@linaro.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_065627_131847_83F2AA6C 
X-CRM114-Status: UNSURE (   9.89  )
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

Add section describing the utility of coreimage ELF generation for
kmemdump.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 Documentation/debug/kmemdump.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/debug/kmemdump.rst b/Documentation/debug/kmemdump.rst
index 3301abcaed7e..9c2c23911242 100644
--- a/Documentation/debug/kmemdump.rst
+++ b/Documentation/debug/kmemdump.rst
@@ -17,6 +17,12 @@ kmemdump allows a backend to be connected, this backend interfaces a
 specific hardware that can debug or dump the memory registered into
 kmemdump.
 
+kmemdump can also prepare specific regions of the kernel that can be
+put together to form a minimal core image file. To achieve this, the first
+region is an ELF header with program headers for each region, and specific
+ELF NOTE section with vmcoreinfo. To enable this feature, use
+`CONFIG_KMEMDUMP_COREIMAGE`.
+
 kmemdump Internals
 =============
 
-- 
2.43.0


