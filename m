Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A603FC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 11:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n5Ke9geU+rsMUIwLN3UNtP5BqG0ygGXZKdUvC55ONv0=; b=BJXLeBHHzLisA5f2/XU5bD0g0h
	NHaHVbRRs5i9whZboP7TdtRrS8laffgJwFefikPoAlmv8AxqTi6QGH9mHDgeLYEPuMR9CpsGZxLkd
	Zt0Atva7ehJj3yPEbL2bGTNaHecHLpXAu3IVYZCnDiYgcDkeCIWyH9SUhy9a5/9L6aXj9a/Y+ZxxR
	XGU0uHLup+H9vCuo8DFCqLFo4sAyvyYgmfEXjVqU5vshSTkejV414evbUn0NkH5wY9Vnh2/6PXYWk
	IDQikx1d72PxlVWprwoKmw51LTvqI/JmVOfPMWchNrqJDhU2kcggBmJ9C3zhs7muEqLzuJB0qZTqH
	gD937sMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2SR9-00000001vt4-2g81;
	Fri, 04 Sep 2026 11:50:27 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2SR6-00000001vro-2BZP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 11:50:26 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-395cf2535acso1001291a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 04:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788522623; x=1789127423; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n5Ke9geU+rsMUIwLN3UNtP5BqG0ygGXZKdUvC55ONv0=;
        b=ewtrHr3m9ZybgZx5my81GwyfdgEM5Zr6v8aseHosBPlElGTdQtSGHs1HfjpoNzabbp
         q2n/O3z5p3z7qRnEzCLo6eQ+w7JNzgeuQvcq0x3dVOek0f2kOmxA3IP5buqdGzF2mF4e
         0/01TeeGFXdfAjfg4cWI1a5RbJ19xb+EIhxYAFWb7A86228QIUOUSzNfT9rg07yIvziF
         GGTAo6hWgko5q0I6tZfm1nQVoRN3wPJ9z07lcolDi+XsyZl7sWqINeCbIZexUKW00tXs
         L+ovBg0WLF9o6HQDj78uTrEYiu04h6SDVMdLH6QmwUiyyrZcaKbZdixwYPdM9CX48QPp
         VQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788522623; x=1789127423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n5Ke9geU+rsMUIwLN3UNtP5BqG0ygGXZKdUvC55ONv0=;
        b=WdWtrqgow+emcvHwFIPMCbQI8oWoazxoIfh9OmI144Xa9Uu0V3gNU1SfeDSFAdauJe
         PKlx2dzOTjJ9YHIGS7cH9xlNb0ud++oQipb6SmQImRX76NrXir2pa5HuMV/hQVozsmTZ
         YVLVfpztBbc8iWnMh5rtKHk6CC3W5jG2nABb0TkUjZRwacPNOlPcxcMsnzs1eBvjysIp
         LmF6KKf0K3pMADMBR7VND4P6STfizRxGuTl/1Ge7q0HeV1tgjliwpmiA5zhIaiDobwpH
         qktfGmGK6VUeqZHe7c/dzoFlZoGbXE2NMhKigMaCaN6pH8/zHfDNRyARXVm7CCfO+Len
         xOuA==
X-Forwarded-Encrypted: i=1; AKwUvBwfhFcBDyGaySbqzzc1GjWAsGrhvo9uvmvIXxIPk4eJa14eLHErPp28Ilcb4k+G9ZGojRTcKQS3q14cVWmcChhs@lists.infradead.org
X-Gm-Message-State: AFuF++mLW0YgM9/gLN5vhtU5000m2jdzlvTPhXFmgT1qVV9ya+XWjhoJ
	r+E9ucc1z+N5hBGAF4ntygm3c1MImpWrRHQQyhzMK6nCTmiVTSq0o27T
X-Gm-Gg: AYBFou0ZjvcDzEKSvSarhuG/Bgt+V9M6RaOliaY23/qMh7iLb3wHMINSfunF5UlvN1E
	CNi0hDqxayr1WpDdtbq8YOLkDERctAgDiSBqPT1sVS7MMdMf++nlRjhgR6YNmUHkbU2whtV2qnO
	NOQJq6VRTaRA1xbpvW6Z6WxOWCtZXI4/V7Q8FYVgBFFlIMAmfH0xaxYDQZZHRXdKqacvp4cCD+O
	+5qa328uSytyFoz/AA5G0J3F0hRGfbP5q26HHcdNCuHLK3CW56k5Ab+dnsNm8IwgRxt2kU39dnH
	cbV4iSbBjBUn+ZbVKuYNl23+ptnCDi+LgtKVyDuDx7DuQXes2w9N2Z+x1bspEAQKBOF6V3tjYqy
	JyQxH1S3oWMWzhbBrTl6PpZ/rKDVR7EOYLkQQtwIpzqdzlGGv4ahS/YuTCopvzrqF8f5TlddXWo
	o4AHhT0eyaOm1fryckXJEnOUs0lOO0pagoKpsWhO0yHhb0V+n5t8skDhXTO00wGWQJe3haT9LCt
	F1j/F2x3riwmX4=
X-Received: by 2002:a17:90b:4c4e:b0:38e:a52e:a3c9 with SMTP id 98e67ed59e1d1-39b07fe9dd8mr14040898a91.8.1788522623220;
        Fri, 04 Sep 2026 04:50:23 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333c9db92b1sm5551640eec.9.2026.09.04.04.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:50:22 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] misc: fix typo "retrived" in comment
Date: Fri,  4 Sep 2026 17:20:17 +0530
Message-ID: <20260904115018.3397-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_045025_609037_B65F031D 
X-CRM114-Status: GOOD (  12.05  )
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

Correct "retrived" to "retrieved", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 include/uapi/misc/xilinx_sdfec.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/misc/xilinx_sdfec.h b/include/uapi/misc/xilinx_sdfec.h
index ee1a42ae6f46..d98d4c1c49f8 100644
--- a/include/uapi/misc/xilinx_sdfec.h
+++ b/include/uapi/misc/xilinx_sdfec.h
@@ -234,7 +234,7 @@ struct xsdfec_config {
 };
 
 /**
- * struct xsdfec_stats - Stats retrived by ioctl XSDFEC_GET_STATS. Used
+ * struct xsdfec_stats - Stats retrieved by ioctl XSDFEC_GET_STATS. Used
  *			 to buffer atomic_t variables from struct
  *			 xsdfec_dev. Counts are accumulated until
  *			 the user clears them.
-- 
2.48.1


