Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F5FC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 11:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bdlVCkRqpyT4stO0yYsnNwcVWyXxNhQoiEcxn+xkM94=; b=S+Osg1RFChjt98b1ocVzJ/lhEa
	DXdi4d+JZ4mb0p3OKQu9pmZakaIiR/QH9DlSHCUiPv4bqBsn9ghur1gmnV8r/m9aj/FuZsZFb+Kpy
	o2URmLkj7jPLA19M+hTFQDOxmte1WI3Tfwo/N2UbFWXEeicuUcusamwfkgNa+Dw+OrzoekcIA8VDK
	T65F88453LpJAEuD0prJQVyS/i7WmyDZhflpmfgGPQMs0j2gNV7p/MHbSqngKkmPKb/YsnxYqj8NK
	UFG69RYDZ4dvnap4y23FQF9ObvjHLOgE7t4Oy5G+8hXl1pt8jm3MmuYf29Zjsqz+yMqoFmjZphY5j
	w0CQ2mKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujz6K-00000000QSL-01iS;
	Thu, 07 Aug 2025 11:48:04 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujz1h-00000000Ps2-1pPe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 11:43:18 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2402bbb4bf3so10334535ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Aug 2025 04:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754566997; x=1755171797; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdlVCkRqpyT4stO0yYsnNwcVWyXxNhQoiEcxn+xkM94=;
        b=kWxPaG1EgtLbHxJNhDMOrvF53BhcrlHeIp/jphbv1Gh8K7L8OaLKZhsTfzPIBi9+va
         yXjG1cIGpOlBTkvTxsWOYM1+ypKQVvpZuhbCWOuYdX6w8qJeVsk04SANifj+ZZkYrtCd
         i9GLIS95NyDHIqE1YTxx1PIxM4avsOMI3JzhdFg4V5Dh+vpI9eFnO5mL4xzjNhOdMWFX
         L4nUdMxt1gWLtpyd/g66CEFm9TBRKG54O40r4H/vrIQBTa6bXLY0B1RW8unoX5KNzzFz
         vDL8asJv0S5KRDnazhX2ALd48TVkuR8yBDlEDwktIGgiKeJkITyMOkuLYQL0nfHMMHS6
         /dSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754566997; x=1755171797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bdlVCkRqpyT4stO0yYsnNwcVWyXxNhQoiEcxn+xkM94=;
        b=TbkHWJG+u90X/ns6wiSkfXE5TiCU8O/BPq+0nFrrfNxwd45uKtkmy9CaKZhq1SvAbM
         bQz/2+U4UpfrvY89+1JDjb2wC26GRtOB0tatUK9s1uSegSzxE7jB1pm25m+MuvFzV3V9
         h/9jx58CPdoH7rMFDys8l7o2jxmalkayxLnq63Gou4tC8kVmz2bM+lpX7N+HjdICaJit
         IObOCK9OyNHP1JJuDK5iT+2F0ftfJ/AAgmfKBOBbOIAfiuUOFAN9w6YeohuPcS/7wXuF
         u3Qgc5xqtWV4jsXim5HMaHh2tPWV6qNMEWQh9nOMnMfTA1Ed8NlctPbtc5n8oaJQeP2/
         YXKQ==
X-Gm-Message-State: AOJu0YzVughkXvJWLWJZg3TJvcE35fLauPKKdND+sEXT24MdPzXzaqUs
	6gabM7+ju56bW6cxPQ8WqPUt0lLKx9148V9CVCvdrNmdfajqNSDWXknP
X-Gm-Gg: ASbGncvs70GPu+GpHXvZhMJOkHrNu16zP4MxVIYZeOGs8oWs12QNf/0cHyFsFMyql0F
	/hfBmmrmtJqg+2wBg7R5xhlZX9tP3LZr/OtNxeqBNSaAPuqKlz558kPnV1l8N5rdmaHPiGIE8J0
	qAbEdAiZMYHSdRXt7FVNm/BS4v3qAZdFhVSZoQ7hsk+H8lKMz0QSEaaM9iVVsH/OYv1aJ5YUGUL
	/GtNdccpsOUaEjq2w4SbRa7xXtyqwSLbc6HIWIp7YWPh8+eo14RCI/UbUBRa8DeElwyAU1gqqrG
	56B8zngslBvph0NZSVQ4QOm6KIHxYcsAODgKzgutY8eao56WY28tD/bc4uKTv4D8vhVUvcE0ufq
	6+bkc4THsT2ueLpULdlWRTztrHYkvgxwM
X-Google-Smtp-Source: AGHT+IE2hsYekMhLXI33VtBrvQam/zjpy9H9MOsiwWs+FoHJi4dQMfSq1UkXnmhWZTzFkbdUBV8TIg==
X-Received: by 2002:a17:902:f687:b0:240:aa0:1584 with SMTP id d9443c01a7336-242a0b8bc9fmr89417695ad.38.1754566996623;
        Thu, 07 Aug 2025 04:43:16 -0700 (PDT)
Received: from server.. ([103.251.57.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f21c65sm185729405ad.73.2025.08.07.04.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 04:43:16 -0700 (PDT)
From: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
To: anshuman.khandual@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	shuah@kernel.org,
	broonie@kernel.org,
	yeoreum.yun@arm.com,
	Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
Subject: [PATCH v2] selftests: arm64: Fix -Waddress warning in tpidr2 test
Date: Thu,  7 Aug 2025 17:12:29 +0530
Message-ID: <20250807114247.5915-2-reddybalavignesh9979@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250807114247.5915-1-reddybalavignesh9979@gmail.com>
References: <005af416-66fa-4222-964d-e20bd2eccb7f@arm.com>
 <20250807114247.5915-1-reddybalavignesh9979@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_044317_470314_30A885F7 
X-CRM114-Status: GOOD (  10.28  )
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

Resolve compiler warning about always true condition in ksft_test_result
in tpidr2, passing actual function.

This silences -Waddress warning while maintaining test functionality.

Fixes compiler warning (similar for other functions):
warning: the address of 'write_read' will always evaluate as
'true' [-Waddress]

Fixes: 6d80cb73131d ("kselftest/arm64: Convert tpidr2 test to use kselftest.h")

Signed-off-by: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
---
 tools/testing/selftests/arm64/abi/tpidr2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/arm64/abi/tpidr2.c b/tools/testing/selftests/arm64/abi/tpidr2.c
index f58a9f89b952..4c89ab0f1010 100644
--- a/tools/testing/selftests/arm64/abi/tpidr2.c
+++ b/tools/testing/selftests/arm64/abi/tpidr2.c
@@ -227,10 +227,10 @@ int main(int argc, char **argv)
 	ret = open("/proc/sys/abi/sme_default_vector_length", O_RDONLY, 0);
 	if (ret >= 0) {
 		ksft_test_result(default_value(), "default_value\n");
-		ksft_test_result(write_read, "write_read\n");
-		ksft_test_result(write_sleep_read, "write_sleep_read\n");
-		ksft_test_result(write_fork_read, "write_fork_read\n");
-		ksft_test_result(write_clone_read, "write_clone_read\n");
+		ksft_test_result(write_read(), "write_read\n");
+		ksft_test_result(write_sleep_read(), "write_sleep_read\n");
+		ksft_test_result(write_fork_read(), "write_fork_read\n");
+		ksft_test_result(write_clone_read(), "write_clone_read\n");
 
 	} else {
 		ksft_print_msg("SME support not present\n");
-- 
2.43.0


