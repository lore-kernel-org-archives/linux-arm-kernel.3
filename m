Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66242C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 06:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KkZ+g2okmdjsiGE+cW2VDuqUMboQrNyO9NzzlBbqJ+k=; b=kLGo9m6KAyMmYL3kgKjcR8b8mc
	heCg8jPIyePMZbv3RCvaVSTWfGuhuIMcO7tXwvTw9fmxNNJ6uy9ZTmqmFenZV/0o4OeWL61yaHy2z
	HrKDz6cvK0NvzoMFU89I0wwv4gpn9xfy9oDZtpx6svutKKvSxKzsmtqazNAZ2HwrMSaMKf7d3aO1Y
	QngOneUUeIhNgm5Kjc7jYHRIeDvp0TKXInKQV+eMax6KsNXAozN33VCkb6YOCwB8VmtaDAjKIL3ot
	sEvg0iS6DENBro6DCbOdUj4sYTXWYF8XvtFdAsvWx7YdYA9nzCucrImi7LFUP805BUfUnM2fXKwh0
	5U5LNIDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Skp-000000060ec-44T8;
	Mon, 07 Sep 2026 06:22:55 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Skn-000000060eA-2nGa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 06:22:54 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-852c481415fso3652602b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 23:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788762172; x=1789366972; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KkZ+g2okmdjsiGE+cW2VDuqUMboQrNyO9NzzlBbqJ+k=;
        b=D7jo4n7qTx8vcAKphzOl0nFsjPQvr6O0oTYha2vWLU+XWSj39suhr1jInGd+idimiR
         dU2EMWcNcyKlT3q/g52pDl0rmnbXePVKCTd3V66WWh16PmuivYcYNnqkzu1pmq0INUV8
         3k5JuIafuDNPhjMmGuY4hL0uH5iQaQgq2REROSkdQ9jEmYDGShGdKAT0b+DfQ6T/FJAR
         oS/A6kGy7L81g4TtIZqo3lSw/kSICw607r76mFVkuDSU5hEgBwgKHcOakjum5mjnT22d
         Q9gp1X+/ZJInyr8S7JXWfUlk0nHvWDDBIQxarACdaasSl1RXyP5BrJDV2GAuMRBx9pTK
         MzEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762172; x=1789366972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KkZ+g2okmdjsiGE+cW2VDuqUMboQrNyO9NzzlBbqJ+k=;
        b=g65SbbOCYHK+leHPB8iZ4Q1Fsqkwdk1yJ0v0dfsi14iNL/Az16alroxV/+cZkcp5pg
         DqFwwYDO5e3+ViTtiZAscDhqlseBIqcHDCa4JTQ2feCeV5Zlhh/ndx50Y0MPOh61ZOk8
         akYsTsK3w/JV7XK+59kXsUTTG8zaaoBfYZ92ZEEO1GX+qOfp+ws07HEUeK/23G2m/p5W
         wAiDy49Ig1yZMkkC7/JG3IHxJ2yV/Vj8B9LXjlBfVuE2DXRpTQ851WOLWWfbB1jUVupQ
         QEYsw4mJnf1bY68bgHm6k+rDNXFJ+imwAHgUns6vcZ4Wi+uqr7X2hm3+e9TdCCIpE/ah
         GyLg==
X-Forwarded-Encrypted: i=1; AKwUvBx1VGwwS78eAy+YVBC1jq0pmYXhoxWVqTagMVdcFhl5021+Ar1MX16ooJjJ1YnLTgfg6QyQUzak58O3DwQmNm2D@lists.infradead.org
X-Gm-Message-State: AFuF++kxpOh57o4cfDTKaKv22NpHxrMQLNxx44DT+o4Wjp1WDTmb4OM+
	t5RAY0L2cubbxktEpVUx21rHJoQknUcbGp7lo+9HKvwC2YTG74+DSO/r
X-Gm-Gg: AYBFou1l0D+RN+eWDWDaZm2/RUukbnwQ977gecfA/IMt56RB5KQv+oR3lPEgWJ/hMa4
	7nUcHlkWxdz6Xn+jAOfH3xBUx4+CoC0zbkivdPv72O+b6DMCh9MDC9D+fVR8QlT/mkLvjnXy+76
	10b5dlD0yQJHGB6u9BfVIHbqAju9CRgH5vfRQnKWCdxdlpJXsjdSXRfaFov4N1dIwcIGFEm1uQb
	uwsYRyxDUnmHd5hbt10MRVg+DHW8QjLLgyPVMnqydwVW3uUXmJwqY/grF3kF/pEGnEn80Rd2few
	3ijf6vAdObuw3uO98vz1cRA2J3IW95obFy2p6dqJHPSWV6wkd+tT/d7EI0wz4+n49zTHe002Q22
	AX2mNF0hVhGjg5VShm+eNhfhtag5vGOCJ9EHnIw1cHqiUHrJ4lMej2txszzrILV1iGEro0Uop5j
	OOYj3hyDup50B2t5E3g8BUNPGjbYin+BLoquXjFnK7xOEhvFL0fEYE8fVt8XFtv2MYbsKMezVwf
	z1l+vRSRtI8Lg==
X-Received: by 2002:a05:6a21:748e:b0:3d0:6c90:5a33 with SMTP id adf61e73a8af0-3da39cff973mr31868480637.4.1788762172590;
        Sun, 06 Sep 2026 23:22:52 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f44d7sm24323742eec.22.2026.09.06.23.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:22:52 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] soc: ti: fix typo "accomodate" in comment
Date: Mon,  7 Sep 2026 11:52:47 +0530
Message-ID: <20260907062247.9994-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_232253_707891_ABD72AF9 
X-CRM114-Status: GOOD (  12.39  )
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

Correct "accomodate" to "accommodate", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/soc/ti/knav_qmss_queue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
index 3e4041454f69..8aaf79495238 100644
--- a/drivers/soc/ti/knav_qmss_queue.c
+++ b/drivers/soc/ti/knav_qmss_queue.c
@@ -805,7 +805,7 @@ void *knav_pool_create(const char *name,
 	}
 
 	/* Region maintains a sorted (by region offset) list of pools
-	 * use the first free slot which is large enough to accomodate
+	 * use the first free slot which is large enough to accommodate
 	 * the request
 	 */
 	last_offset = 0;
-- 
2.48.1


