Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213EAC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 15:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fX4Svte8gqoaTLJ1gLDVO4a7qJdtBtTgEqouOAtsRZg=; b=Bx6eRDXOGT1cPkfXuNJzF6GPu2
	rR8GstoI5UCNnnEvDC4ROv9L4HzQ+n6R3NH8aext/m+fZPLh9L7u6t58PwRQIL2SNP5wC0Ly8zW/E
	ed3+XneIGBqS+vSjQfcb9UJEFhGXlucq+JNIZuwKxkPqN/jcVfkA41Cnl7aS7Tu/fAFkCkfOYQC1F
	kF8sITuOatMo9tPz0S5Frsbsrpa7nvpU5nZMvXUmuoTUvDg4KFvOIypyR60qtjEiS7iT5wSuy0bkh
	MV64e6+EMkk307+PxT0NoMkZXg9hR19fKcRRTpWI5jH/6m9xV9iQ7vTlMqNvaelTWzPupAnJjTeoW
	aPCoBZ2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexrY-00000007rOG-3Zew;
	Thu, 24 Jul 2025 15:28:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewRA-00000007etC-0hJk
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Jul 2025 13:56:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=fX4Svte8gqoaTLJ1gLDVO4a7qJdtBtTgEqouOAtsRZg=; b=OXdL1qL8Q8tV6s0Dw9whhW7znO
	YEgGaU/unbaZDSTNXvKm0i0E6EHLF2TV6M6fA3ayr/06n/bRuo5i45t1P5Dwb1DRQWeYMPZviqBMX
	fRM5XRM1iJIW31ft7M2w1rfqNmMOLg8QBSCGkZhyCOf520LWoDY0/M6x/xmNqcbRoATo6R7AdORuK
	OZyhftlqCxoymcEuedVsn52cPqp44yk8jcJYAuDefLaI6QPfXrllgrxWIpzuZvcXJBjHY8jmYZNsq
	gtxY/0dEkB8Vsy3ZKExW5rwj+Lql1QUBwPAexjwcWSOewUtNYXp19679NfGdKYf+/fLJDl47MttRs
	O6y7sibA==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewR6-0000000Bd4a-2EjS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 13:56:42 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4561ca74829so10972975e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 06:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365397; x=1753970197; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fX4Svte8gqoaTLJ1gLDVO4a7qJdtBtTgEqouOAtsRZg=;
        b=I+pTRLrCPffntBWiViKTaSdB1QbE7VV7fZbgGIJhNXcaKeuJ9vWxW6zwI4BQlo4SDS
         x7fnnx5D9a/bu+lPXA9eRjgg90yThTgAhMR9Igw115IXBBywb0lzL70EgKy1uis/WY6o
         LQKtp52/7UpN+6rJxiOVVcihOOdELZrpKu+85Dths8NvEin2nTsQurxCVwUeJXjwKQDz
         ExKy/PMkfXh8TnqfMgP5eQx9tG9dxNjKuBYSl7TgXoWnsgCPbIzV4N+t2GNHPp27+Gke
         /U2UI8IqU0Pxl8Y2FmjSpbY0cw0IC3TVWM1WRgBpnMW7UtUJ8WLrWTiA6j2xs3jjVRND
         6g3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365397; x=1753970197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fX4Svte8gqoaTLJ1gLDVO4a7qJdtBtTgEqouOAtsRZg=;
        b=e21yiRZOd7HA28WAk0q2s0bNokHo03+mA+PO62UJmTvzvtLy537vwIbKp29l6TwB7p
         oNkA+clUMAPz9B2sFqiINpNGVnbBny9/QJMD91tSnhwO9txfka932mUqubdczv57DI7g
         2YoOrUwhM//uN7EpEOAx+28GGvhbjbg+NxWZXvafGivdsuIYvsj+wSzEGxXjwULZT7gY
         WcD4Afomm1u2ua0UgtlofR/mTnPBg+eT6LZdw95rRwBMxNwFBQt9R+bsU200Uzhk/4Va
         fitINalc5c4+udv5uI+zFMf0nVAF+uIE2kXnLqU37xlCS2XPTC1ddgbJjabS4QRELASM
         Z4YA==
X-Gm-Message-State: AOJu0Yz3COHiuZEZDeKCXV9TrZnQXzZ7c4bRXjW6zDnRMOa3UVsrzZp6
	F8unEaCaQ6Fi5VFgS7vLNrbZiaACP4qC439ipfBHgXSFXngs3m38snd0zb5Jr64rQa8=
X-Gm-Gg: ASbGnctCHpJIV75R2kkapFAN1+tJQWCcmK33Z/9cZ7tmu1JtxhaOiKyn2VLce/OBnV1
	s4jURVwFAzWf3PalvYbJ8/nU0DRik2+k5UKGB0jSR/77+MPLp6bWSP2Zsfh/GwubBwA4uzTL7Ba
	xvhNs2mC/alklkNCf3MR04Y5aKzpEXBBjTJVEilYAfSSlnMBSIiPCMqS0ihta0Nm4QoFBr4eshj
	k75sQrTdwxTqR/R5t8oyQgW9IhWY/EQURMpOqAi8FHbweMVNijYIa6VxtRBrZBgWOzOlQA+WB3G
	Zh5gGkR40BCz6MVaM0K+mAH7Pm+ukyqKacQkN0anBkQgF+YOfRn1D++uf+sIovz+EnNyOKLefqE
	yuSueP8kenHxkyp/1c1YG4ZOkWmQoArh4HNA5V7gWoq7CzLBJ+Rwi9bY9zEfdImjuSwp4bCWcQp
	F9SxIyVvd0oU3Qw2fVGuUCoKg=
X-Google-Smtp-Source: AGHT+IEQVvnmK8e1EDhTYEG0c9433X/scuppejD17sDlP6XiymAvLgXWbUNkWttS4mn1l7PUSu9quQ==
X-Received: by 2002:a05:600c:6090:b0:456:18ca:68fd with SMTP id 5b1f17b1804b1-4587118251dmr22564675e9.10.1753365396747;
        Thu, 24 Jul 2025 06:56:36 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:36 -0700 (PDT)
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
Subject: [RFC][PATCH v2 16/29] mm/show_mem: Annotate static information into Kmemdump
Date: Thu, 24 Jul 2025 16:54:59 +0300
Message-ID: <20250724135512.518487-17-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724135512.518487-1-eugen.hristev@linaro.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_145640_789540_47B74BB0 
X-CRM114-Status: UNSURE (   8.98  )
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

Annotate vital static information into kmemdump:
 - _totalram_pages

Information on these variables is stored into dedicated kmemdump section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/show_mem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/show_mem.c b/mm/show_mem.c
index 41999e94a56d..93a5dc041ae1 100644
--- a/mm/show_mem.c
+++ b/mm/show_mem.c
@@ -14,12 +14,14 @@
 #include <linux/mmzone.h>
 #include <linux/swap.h>
 #include <linux/vmstat.h>
+#include <linux/kmemdump.h>
 
 #include "internal.h"
 #include "swap.h"
 
 atomic_long_t _totalram_pages __read_mostly;
 EXPORT_SYMBOL(_totalram_pages);
+KMEMDUMP_VAR_CORE(_totalram_pages, sizeof(_totalram_pages));
 unsigned long totalreserve_pages __read_mostly;
 unsigned long totalcma_pages __read_mostly;
 
-- 
2.43.0


