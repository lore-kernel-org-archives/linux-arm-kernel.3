Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE09BC5321C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 12:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OYfNO8HaF8EPi01gt07T8qMMcubFMIJKbbLH4YUzSjU=; b=ESp9JNAE3NRDik30Q1D0ke/UVD
	mWvGXArHQAAiDt77r5L1HPVpDXs8W9YqJFAI07Y+aNYSf+pMj85zDbYdeXyg41rnifDrdHERixEyu
	lR77usIobbgU7n3AgyAg0p27WKUZ2nQk5flWDq19mP2oZ/BBAzO4d8fRZPOS9riF8iZahFRqPA5yc
	OewvB9XPn0s8CWG1k8pyqmD8xfrZMFRa94LeVMP+fwE7uarQfuDSSjIVB64Ey1Sdvg/96iqHNJmzM
	2nCetMec0aWkWZ8GDcIgBON2lcgQ37PPjtEmPSrJM6bbn63zNu6tE9D4V0ivQPo46fqADpFij5Ucr
	JZjDXtog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKBH-00000002dq8-0CwU;
	Mon, 27 Jul 2026 12:11:39 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKAp-00000002dVM-2Hrp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 12:11:12 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-495437bb891so24548035e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 05:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1785154270; x=1785759070; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OYfNO8HaF8EPi01gt07T8qMMcubFMIJKbbLH4YUzSjU=;
        b=FVXWQ2ph0kYRGHMkE+thfb/roqP3z/CwfXpMbbqiJs1ghJGfYwW2TsZ/mEptAhNAKg
         +WiRnqJq8j6XAXGdncC/tbSqRf0kbB7d+wUZJ2joFQbWAblPT2elXplinv12TUxq0XJR
         XA5F2WE2HjXyHiV8cVx1GhcjT4A58pyiZAZSZIOb+UOEF7dRSMid+lLeNN8MnOLyITpo
         2ns+s1jhT/YNPTrkeO7aP+uSSj6qRcQqBA22OqW6N0rg3nLG5qoUocbdvCovgKJ+vEBC
         /bX5aVsXgKjMyiTy/vpJXyqfF6at2R8sFovtXvTVWDXPa+eHHu6dr2nyXOH5X4BL8ElX
         ksgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785154270; x=1785759070;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OYfNO8HaF8EPi01gt07T8qMMcubFMIJKbbLH4YUzSjU=;
        b=StgaZfaMwjt/borqS3IKvPbCw9XJuWTT1B+vUo/HnQ86ek8KL0iPWyGDiflaJzDeSy
         JhjEulFCR9Gufa6xEVk27QjZVet3eAgbGS1hpeF9K0Mh/axNwNcXb9liUhGUkh296oY/
         TFWppQnYjpC4Oyogio4uTq6QujldRafIGsqIlSr6wV5nii3XQQ5A3jb0hUf7hrdJc+BV
         WRHnZ4APAiOuRviVbvYCMb1fbjeWsduNDbefQra99FieDrkrUNlJamzmDWxzGwYW7N0V
         1Ph6LxrdbxeBpDygu1uGYqE7YFjzfW8x8HE5xsAShZ0+TJ0m4YQrp5fkICO7xdH9ykV+
         p2iw==
X-Forwarded-Encrypted: i=1; AHgh+Rraz+0l7kyCHV0qJVUNC/Wft58EZEs/K6zTwRIINWFGoYk5ubQP4BLZCMfj+d5a3nBQYKmWGS6JoDOYsHYsNBH7@lists.infradead.org
X-Gm-Message-State: AOJu0YwrFocYXmaSqN9JXjb3FCnk46k3dYrqYVJyq2kvwdiCnce7yc4c
	2A19gwIK+6GDaxO4Fzk69hAChkyywY7pPGyYHklWZONnBBqIA1Vlfuc4Dr55K5GhplA=
X-Gm-Gg: AR+sD132sDjwKWTBzBDlM+QxQuVEJl96DGOsJKMVvJPl2ZImdtTnmdnb18AjEzFRPPA
	RVai7kjP0wFiKKOvDUu52mB8tt1ES7QKuzQpMRfYtpXRuBzLSXzblBohUXg9PY4Q1+ssQFRheMx
	j9oozKhNRj8ETYBPHcb6TdIUVMyD/8VKpHyUH4CozfCOPeZQY/0M4XMhZkpqiJBDLfjlizo6ta2
	1ruBNI0MKRliWHuDExg9oxVQjxR33DwndUTzArrJMJAuF2i4JxvA8qeeRiYqjtZ+VGETfjj1sPB
	Z3ZZZI1v65E34Ou2NjNSfsNgOm5cUgH274rL2+3saB/Mj/qESuktfiw6tTUJm7oW9j8Vo8h/PIo
	91l/n/n4c59TaYr6AEvRhRiJwENWNnfSFJRdGsyWPVV57Nybj7LN8T+RCfSLqpqsFKJCHLUHmXg
	6Q70KRbIJqxDN9fGYS6SO1iazEcAktyg==
X-Received: by 2002:a05:600c:4444:b0:495:6b4c:fccc with SMTP id 5b1f17b1804b1-496b5c7182amr98814975e9.10.1785154269911;
        Mon, 27 Jul 2026 05:11:09 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:7aab:bc55:e039:4aac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f302f8sm211778055e9.12.2026.07.27.05.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:11:09 -0700 (PDT)
From: "Pawel Zalewski (The Capable Hub)" <pzalewski@thegoodpenguin.co.uk>
Date: Mon, 27 Jul 2026 13:10:47 +0100
Subject: [PATCH 9/9] ACPI: use a named initializer for acpi_device_id::id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-acpi-refactor-v1-9-ff900aa326ee@thegoodpenguin.co.uk>
References: <20260727-acpi-refactor-v1-0-ff900aa326ee@thegoodpenguin.co.uk>
In-Reply-To: <20260727-acpi-refactor-v1-0-ff900aa326ee@thegoodpenguin.co.uk>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Zhang Rui <rui.zhang@intel.com>, 
 Kai-Heng Feng <kaihengf@nvidia.com>, Tony Luck <tony.luck@intel.com>, 
 Borislav Petkov <bp@alien8.de>, Hanjun Guo <guohanjun@huawei.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Shuai Xue <xueshuai@linux.alibaba.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Dan Williams <djbw@kernel.org>, Vishal Verma <vishal.l.verma@intel.com>, 
 Dave Jiang <dave.jiang@intel.com>, 
 Alison Schofield <alison.schofield@intel.com>, 
 Ira Weiny <iweiny@kernel.org>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 nvdimm@lists.linux.dev, 
 "Pawel Zalewski (The Capable Hub)" <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785154252; l=858;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=e3kFwrE54qrR7j9hf08X7x7yaGkc04oEEErLkv2k6T8=;
 b=wsRNozjg+w8drnieAF7pPxdPTk2dePtttYSw8fmP3QMndGXJ0o823SOn3yUNPQaqnRoaKa8AK
 Jq83mLuCTQUCT2D3wimXdXs1iPMiRgklDO0pAf9DdxAeyLqrdnv2PyD
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_051111_606974_547CE708 
X-CRM114-Status: GOOD (  11.19  )
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

Use a named initializer for the acpi_device_id::id field for
readability and drop setting the list terminator fields
explicitly as well to be consistent with the rest of the kernel
code.

Signed-off-by: Pawel Zalewski (The Capable Hub) <pzalewski@thegoodpenguin.co.uk>
---
 include/linux/acpi.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 60ab50cb8930..b34b483d99f5 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -805,10 +805,10 @@ int acpi_mrrm_max_mem_region(void);
 #endif
 
 #define ACPI_CMOS_RTC_IDS	\
-	{ "PNP0B00", },		\
-	{ "PNP0B01", },		\
-	{ "PNP0B02", },		\
-	{ "", }
+	{ .id = "PNP0B00" },		\
+	{ .id = "PNP0B01" },		\
+	{ .id = "PNP0B02" },		\
+	{ }
 
 extern bool cmos_rtc_platform_device_present;
 

-- 
2.43.0


