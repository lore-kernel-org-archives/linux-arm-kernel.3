Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A3CDE6748D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 08:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U7ftMB0O2RO6V6KEGBmyXf/qaI8CtnkfkNTYnuarQaQ=; b=N/xZJyjzAWYbnNjCXPR5DaXsN/
	ihsbDTG+C/04qFswJyj3yPmsXvOlPO/y3C2wgSJa14sM6Rzu+jCdKpyfv/UUo6Yz7smn4jpRsq0I+
	DcZ7df7IFvJhfejqLdcy9x7EAmO9+7WqHYgBrrnDc2EmV2pN+jc/Me2zfJUpW/ADcGZtB+BNyDvpq
	0vQK1/JXEhaVsQ0xbYjNwwFZQi1b8pBOKDPONY/mz702k6polXK6LGvnQM+mKpnaT6N2kxgYVAvcz
	z8DebU23mT1JLjSHpmm8utnm5KdiyJWMILtOu9FjL8iWtJUgM3Le44iuXMjQ6kQzFzdt41cLNbt3Z
	+5hojCKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbBj-0000000DOvf-0YR9;
	Mon, 22 Dec 2025 08:22:43 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbBV-0000000DOrv-2nI5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 08:22:41 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso3689672b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 00:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766391748; x=1766996548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7ftMB0O2RO6V6KEGBmyXf/qaI8CtnkfkNTYnuarQaQ=;
        b=TUfF9/W8SJ+0000rxgoO5Gc/5vbc9mQlPZWtmKS5y7KJ/UGgEOkzFoM9aV554QkxiY
         SSbUn+xqdzM6EsdO3UZQtbbGveKrWlIo3V/n+DXVXMA03GC3hsX9WLY62OyLQi+zev3J
         nn9PFAiLmS3lENCKt3omutdrjmfmWxK9qqvpSSEalHk23D5uys/6hQGohi10+++ZUB5f
         X1oGQsHBeQjRLeIt3rovYBsITVFbIwWLZmS8CdoookEYfHj5DIQmymORU6qEbQ29imt6
         dsTb1QjS+IfD0SVkTlmM9KAlqCMnC999sEYRROc1RcqqrUZIDdSkWWU/1iIDcuCnUjwf
         a6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391748; x=1766996548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U7ftMB0O2RO6V6KEGBmyXf/qaI8CtnkfkNTYnuarQaQ=;
        b=WKLtd3coZS1V6LxMly8bJBpPgMIFSwfMKXo9yY8CYzKM0XdZvqAJJRTTPSWc76rsD/
         mN0n2UodM4SxiGZFKFjjhphnn1rrEZHb6tkYgxiPX4mdYqUES83o+jHjBNAiisrfb7Op
         OOSlI+YXlFGDXUpANa2FsYQUgyG/LZDvczCAzzeb8+ShMP9MQMB/Vr3zymXpqvLQcfmA
         +6Hp/Ob0uhswTW7sKC5rb+LyMBpNDqTitEqUlmEGufIkgQVlBc194TfrbTnbh5Xuq+zY
         eETdMp2U3wFH0six+NKOaZnPa1vU2VZUp+ouXJ1CQFF7Yu6KKF7LoSVVlqK+TNNP7LcJ
         DKEg==
X-Forwarded-Encrypted: i=1; AJvYcCUTSv5U0U5waLDh2CPj+dfomnTzZf4o+6IY4lQCmsOUK2nSzHllSnzompAMTDZNpgfRP4clAQV5pRrji0ZVQmHg@lists.infradead.org
X-Gm-Message-State: AOJu0YyOjOpb4LRYxxLQsTcPS3WhME5nETIg1oS9QJBzI9PQze+yrgAO
	WAwuXdtTjtbs00ZgI0iSZoM+W79iJFUFWMLj4E8d9jGs1yv9xAKRBghA
X-Gm-Gg: AY/fxX7LlgLPeEu8e2WtxhzlGZu4ovLJJbueQxbpXmvLfo3ypcHBARhu3jcbKU6nE2K
	Us2JX600j5r/SpCD59nKXPfXN0DG8jH+Cv3QHbDu3kwKVt3mdMa7aIxGIri9sLQR2r0EDaDFQNC
	3Eo3X8vJmNPWM1JhfHDAXAag2kHmezvZF1k5i8PgfijBvb062Z7QAB1s7bFKE5ceUexVhTb2/x8
	U03aA64lUHWiexTIwI5U6vb1e/4vsPlN+Y5If4IKIx+sfilAHkjUKuof7xABX+ZDGdFXtJ8GODV
	iyApUkqNRXr/Jc4HeN3zrfEDKFjqt36Ji834m9mDcJkzwyLEjLI+AdsnRuavxYl5wieJzNP2Uwa
	aF3dWdrZjL7EKQnhjbcBDtuURd/wAW8ppI2K9ElkCyURZx+1wkcJyx5LHcSRZczM4bFM9uDNMck
	AP+/D+alI+
X-Google-Smtp-Source: AGHT+IFIaB8eWc1HtVa50QiWjAkChZ0TUx+nROmHgF5xveLYAYPTgHVZsZQQy8Wrx7bUcj5BQhCb5g==
X-Received: by 2002:a05:6a00:a24e:b0:7ab:63fe:d7d5 with SMTP id d2e1a72fcca58-7ff648ed939mr9692669b3a.20.1766391748333;
        Mon, 22 Dec 2025 00:22:28 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:22:27 -0800 (PST)
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
Subject: [PATCH v7 06/31] dyndbg: reword "class unknown," to "class:_UNKNOWN_"
Date: Mon, 22 Dec 2025 21:20:23 +1300
Message-ID: <20251222082049.1782440-7-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_002233_027093_AA437A08 
X-CRM114-Status: GOOD (  11.62  )
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

When a dyndbg classname is unknown to a kernel module (as before
previous patch), the callsite is un-addressable via >control queries.

The control-file displays this condition as "class unknown,"
currently.  That spelling is sub-optimal/too-generic, so change it to
"class:_UNKNOWN_" to loudly announce the erroneous situation, and to
make it uniquely greppable.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index eb5146bcfaca..cb171088850c 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1165,7 +1165,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
-			seq_printf(m, " class unknown, _id:%d", dp->class_id);
+			seq_printf(m, " class:_UNKNOWN_ _id:%d", dp->class_id);
 	}
 	seq_putc(m, '\n');
 
-- 
2.52.0


