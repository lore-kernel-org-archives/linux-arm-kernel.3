Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB2AC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 06:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e7JGVPkiEV50TUkm9gkR7fN/RD0dLhNLulKstVZuKxw=; b=gY++HtDVDmLTbWRI3p/iPtfhtp
	T7N6qy2u5U1MxnRIdPzP74xGx8u9xz7pG8RoQ+cU9e9GYZZw+yxJZnNVCL8RKTlECqhT9gFS6cDqz
	kqqIEMNC7waTK6VpRuFfTSd2stYW1cdXOoiuNCgJCD/CDiOBkAnK5qG6lEUkYxn1VqJQm8xz3fqR0
	r2RWjBr7I1N9Rest5VF9Q0+hZLQwhkPvN4ARK/dyKmAmr9UzUIV3+CCyLj+HQ9U4nO3cDPbjd+r7T
	9fP7F22Zpcl8/pmoJVYNm1hAHgO4b7cMGglODB5PEuNHfazQBG7YKEiukV1teEXKH1E9IRHAbFQMX
	O6vY7/nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiSDk-00000008RzG-0gkU;
	Sun, 03 Aug 2025 06:29:24 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPt4-000000088v7-3Ms6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:59:55 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3e3e926fdeaso12250565ab.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193594; x=1754798394; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7JGVPkiEV50TUkm9gkR7fN/RD0dLhNLulKstVZuKxw=;
        b=eK6J5MVhb4beU8urvnuauS6Rhtz8URYoZPTFBHxemOoddMUlV87wwKfb3ErhUhGTQC
         +vaUtfjU8G2pdbDo9eW59dAJHA5Z5VQb/0U8AJ14DzbMQpTnxGTCiFscPZNhzmjFvFBC
         6w63oMt1i/4OrWqPeHrqnMd0Aa7A6iHHliZCFf3cXq8TvCBzl06ikc6HYplo8jofg7JO
         dzfH6AczZTKzqsA4/SZ2KbjG/GqMYi4YJGuQbJ57hMRKVOr2ASM0oHBAZF9p2GnN/iBS
         H7/VLaWIbzit3sNJJFSGZXTQDH2RYjdGEmwMiZGh3F//VvA7BF7ivTJBcJMZiyS2DQY8
         5D4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193594; x=1754798394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e7JGVPkiEV50TUkm9gkR7fN/RD0dLhNLulKstVZuKxw=;
        b=Ld+MG/Jh6kwKoTSWbiuSLx4UAcP5VGRlYUv7VehWjWwfH4y7tpi6v+9Cwg1JI86frf
         0nnQUAp29s2Yps+6U3ejTh+9T/0KL/eJkl6clMeX66d3zbFwir5pUXchxMni0ehFQSEI
         uXXqNgKxwHF72YZ2l+dOBQ89gEPHjFU3Jzjfg/mViEVMcrmSCBg5JOYvrgaQkRyN6JwQ
         Dq+3AHAWBhd539y2wEuLRqBISEGqqdZOi3/LfjF18H0ZasHvEwPP+Ln20QyjpgVhaeya
         ByLZVH34dVvF0rF5eKwFbe6Eubu8gPgtZ4o1gzwbFkAKtoTRbueDb5iYILy5l2ntqjz5
         2qDg==
X-Forwarded-Encrypted: i=1; AJvYcCW4RPll8BkPJ/7CsaIvFL7zvRmSCUvnQbR2mf2gbKaHP+CCaMli5N74jI7DneAPk0VV8Bq6z5W8Uz9daO82mc7i@lists.infradead.org
X-Gm-Message-State: AOJu0YzEcZg1o73ajdT8EVhTBzczL0U0c6vIb2jjf1/Ix2YTzpwDI7un
	mbtknhd7PmiMEwzimVbJuurCKMwliLyIwiJU7mtwMm3xCTHnwC7oUA/ym+NPMJZfq/Q=
X-Gm-Gg: ASbGncsTnsWj85pnu54QPXGVKMto5Qirz+baO1M9yCvsV376kME0J/zy6kUsnk1PHGi
	vzozmcprLHgEgkRpebXrmL/I3CHQV/wHBccZl4tdJfUEg4mrEqPoBNJ9WmYRHqZdBqRcPNHJs+p
	Con34NGSxXosrQNro96uWU9mFm+i+bbv+ndmi0YFwrvU6VLF3oAUYmab41SWA57b2pF+auu5KLo
	RxkCLfxl49IvPelsxRQ5Gn2nzlk9qUv/WVl3lu9flqAKLCPW6Io5XcMWxm0UundKqwROTs/0EjE
	O8mQHWJO8pyvkqCmlHYWXNkRpJJz/U/V8LKrpVT8lenQkfRgFuV/CPCtTpNg6M3Eq2SlUSnnwQQ
	gBhj379I4oZdQlGYZW8F4ZTcwHj+XqwgGui6g5nGS2lCwhCNDMzaICNzWrSHbfeISXek4f0acND
	n+7w==
X-Google-Smtp-Source: AGHT+IER1czj1M603T/fh8PrgV2njv/OOVXJjWBlMXOa06xUmclYSmV1HU1IjXDssYCVHfDYAb/JPg==
X-Received: by 2002:a05:6e02:e46:b0:3e3:cc1b:2b5e with SMTP id e9e14a558f8ab-3e4161b0466mr69757435ab.15.1754193594065;
        Sat, 02 Aug 2025 20:59:54 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:53 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org,
	jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	ukaszb@chromium.org,
	louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	daniel.vetter@ffwll.ch,
	tvrtko.ursulin@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	seanpaul@chromium.org,
	robdclark@gmail.com,
	groeck@google.com,
	yanivt@google.com,
	bleung@google.com,
	quic_saipraka@quicinc.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	quic_psodagud@quicinc.com,
	maz@kernel.org,
	arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	mingo@redhat.com,
	jim.cromie@gmail.com
Subject: [PATCH v4 56/58] drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
Date: Sat,  2 Aug 2025 21:58:14 -0600
Message-ID: <20250803035816.603405-57-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205954_857216_01341B70 
X-CRM114-Status: GOOD (  11.44  )
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

Time for some thorough CI.

Also, the previous 18 patches could perhaps be replaced by a single
invocation of DYNDBG_CLASSMAP_USE, from a C-file linked into all drm
drivers & helpers.  I didn't find such a file, nor a drm-client
linkage item in the Makefile.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Kconfig.debug | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig.debug b/drivers/gpu/drm/Kconfig.debug
index fa6ee76f4d3c5..333df32c2e181 100644
--- a/drivers/gpu/drm/Kconfig.debug
+++ b/drivers/gpu/drm/Kconfig.debug
@@ -1,7 +1,6 @@
 config DRM_USE_DYNAMIC_DEBUG
 	bool "use dynamic debug to implement drm.debug"
 	default n
-	depends on BROKEN
 	depends on DRM
 	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
 	depends on JUMP_LABEL
-- 
2.50.1


