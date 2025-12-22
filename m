Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C1BE6748D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 08:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dFfaj1jg7DkAQbZ2xQqGZ0nerYqYJ2u1eC/UX4LEwiY=; b=z/L00EvrSNjgMHe9JOvjdrUpPr
	DAeFHU/821mVN2c8vvrUqTvYw7wcnUgzNhJXAYJ56Qx9fsWzmij9XDEI9VMcoFCG0kjECZ11A4k2T
	x7mqNGpPfS8raewCcjUr3uHD84phzcB9IYOdMp7PBnNBhMA4NyKmQlzw18yWBOqoA1oajvyllEygi
	jd6aMU6j26vQeI/l7Jcc5B1LBys/iJjT8FTkPfTxj7XxzZf5TtA3956Yg9TYqI3P3XTxi5qr1O/uF
	B9rnvGlq5TgwmqnKurtMtSK2b9L35G0Z7Oj3zbgtb8eG3u6manVl3PSAabcGNX3n5rwGzoI04Af8c
	dOVvCgZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbB6-0000000DOn4-1FEM;
	Mon, 22 Dec 2025 08:22:04 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbB4-0000000DOlw-0bwY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 08:22:03 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7fc0c1d45a4so3369618b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 00:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766391721; x=1766996521; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dFfaj1jg7DkAQbZ2xQqGZ0nerYqYJ2u1eC/UX4LEwiY=;
        b=bjWp+yZtugmZHZEKSK7RdxEUvGI5bgASIkc776iG7MrzegDorFbba5QyFFAJP1PbTg
         2JY+JhYtg63vc3x4IByXdH1/xkc7VIDdzbS9Wk23EgWew8ZFBlsY1y8x715DT4Ba7591
         bwO0bSWQRL5lASnxNWI5vhz/dKgpidFaeL2Z97h+ELtA/o83x6d5JL6NqG4HzyI8AumE
         UmEl+GBMtp5eKb5a5YH1ucEKYU3f1tKU8+2S/W+nLhB0Pf/sfrDCgB9tmArkswmnt/yT
         tUNmYlheCEnwfBjdabV5WrxCmI27IdSi/Ltu/8j9SJD8gyhPfDjRsPtfJuCYcVTCJxVZ
         hcLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391721; x=1766996521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dFfaj1jg7DkAQbZ2xQqGZ0nerYqYJ2u1eC/UX4LEwiY=;
        b=Ma4UC7MXS0g/h7INNmDXca3EnIrXxDjBtzWcQxhVjuDO0BeFFFhdIiS0Qvk7gbmckh
         lWCIy1FGnY6VemHMZKLsWg4bBQ+udkN4RAaETofCIuEoh7JtGip06sk0HzECLAPfEBbU
         ZwjdpYTH8SjRr/2EACq0+ZM1Ve4Z9UUiy7tiUyAa6ZN3TcbgcfF6xTwizv23tMgg9Oyi
         izLZ/1aI3UYB+B+z5RG+8mZKg1haFdEuWjRwxJY9Q9wypXJ6TkQ9o2RDssf6WYAtRuyI
         2FCqJ4ww3vQNQ/YoPa5Ed0ll+t2CzUftDpR91KNR5pWKa/kapUSMJCRs6pJzMqAe0/OB
         qeZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWImi4ejs/65IM6J4RKuWG6ZRpp4/RdTVlXVArY510mcdGtk15f3+3SK2TgodBnB/H4yR9Wm7NXgfnT4A6ML4si@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9yOsup2Lheqty9vBBeJqTA12YI6sFs0nA9Z6eSO7FKWlniRhn
	SM6Obn1M7nemjwtpnMAGb928AumfmNkDfbpoKmgdYwr4Vd3jBkZ5w9BE
X-Gm-Gg: AY/fxX66bK//2ENMTfUjz1IgFl+CMGS++nWmlhPtBQsUsjc7wPemgC+gkUXJLfK9f1o
	5UvtDjB/Q66sWoHIvi2hN1d5HHukG24oAosOfQscDp9hFKXdrw20XDBxKOeQh+dvHaqWoC042jx
	Q6rQxaP9bghENolomoG0fNF5S2/Z4EjQI/inMygv6EOUhI3sKyCzpjNkeikUKR5ZDIbhs7z1yQg
	6L4qjpV0nqeye4Mutm9xmt8eopLWaKvLXkBLwasqPfrbSSciSDCiV7GZPzFxBaiePZ6rZxU+3oZ
	QKT0rfHyds73N4i1EjZzqF7jKlhb78F+E/3nSPpSjRfJ/C8VdJ+rYPAePDIIlKkd1FBK2nIqr8E
	7DmJX0aLedM+03JsQEwDVEjPeNDeZr44KhTkFybaRH21GeqJ/q26qgLdLZVqaCdPmEH0k35iA71
	tzGvUKQgSr
X-Google-Smtp-Source: AGHT+IG3eUuB5Tb1s+Zs70IjrZagHo/mf8fIHvmKfCB1AS8Rh4HCdjBPUwGbrg6oNBn8UN6DCsv0tQ==
X-Received: by 2002:a05:6a00:3e2a:b0:7ff:9657:d6c8 with SMTP id d2e1a72fcca58-7ff9657d93bmr10043630b3a.27.1766391721087;
        Mon, 22 Dec 2025 00:22:01 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:22:00 -0800 (PST)
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
	jim.cromie@gmail.com,
	linux-doc@vger.kernel.org
Subject: [PATCH v7 04/31] docs/dyndbg: explain flags parse 1st
Date: Mon, 22 Dec 2025 21:20:21 +1300
Message-ID: <20251222082049.1782440-5-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_002202_196416_4B589FE8 
X-CRM114-Status: GOOD (  10.48  )
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

When writing queries to >control, flags are parsed 1st, since they are
the only required field, and they require specific compositions.  So
if the flags draw an error (on those specifics), then keyword errors
aren't reported.  This can be mildly confusing/annoying, so explain it
instead.

cc: linux-doc@vger.kernel.org
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst         | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 4ac18c0a1d95..e76ccd987704 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -109,10 +109,19 @@ The match-spec's select *prdbgs* from the catalog, upon which to apply
 the flags-spec, all constraints are ANDed together.  An absent keyword
 is the same as keyword "*".
 
-
-A match specification is a keyword, which selects the attribute of
-the callsite to be compared, and a value to compare against.  Possible
-keywords are:::
+Note that since the match-spec can be empty, the flags are checked 1st,
+then the pairs of keyword and value.  Flag errs will hide keyword errs::
+
+  bash-5.2# ddcmd mod bar +foo
+  dyndbg: read 13 bytes from userspace
+  dyndbg: query 0: "mod bar +foo" mod:*
+  dyndbg: unknown flag 'o'
+  dyndbg: flags parse failed
+  dyndbg: processed 1 queries, with 0 matches, 1 errs
+
+So a match-spec is a keyword, which selects the attribute of the
+callsite to be compared, and a value to compare against.  Possible
+keywords are::
 
   match-spec ::= 'func' string |
 		 'file' string |
-- 
2.52.0


