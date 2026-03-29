Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D7EF3D5E9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 06:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q3f6eUM79ksch5To8yF3aZNTvb+jZ0PY04rz5fX+u7k=; b=rELp4GPBZ4VXm52Oa6VbQn8ysR
	jNDFsBGZEdRmal4beklZOf1oAG+pKgmPBJvGTtCoR5kNrBr3/5zGIFwrVG+aYXbjSKz5ixpgHFKEU
	UBjRNi+sTpm4R0dXQJg6zrhvxB/Sv8XQ4Alrmzz2224odchSFzfCCpbfheZVxvfG3uUBrRrr584wh
	wBRIfIsK7dSxKvLWhpu80BWJz9okB3E2rukNJerKxxcdb7P0S9PvNXeGzOUQVryILxJUOOArwXYF3
	eSXyEhMerqtSxu+yqbQXj8JSwEK7o/f1gg+FXmUOXHIZ6pjN/mJOVt/is8Sorluc1Xb+ByT1sX2fN
	cnNxKf1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6jY8-00000009dnI-1eKS;
	Sun, 29 Mar 2026 06:23:04 +0000
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6jXy-00000009dUD-0gld
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 06:22:55 +0000
Received: by mail-ua1-x92d.google.com with SMTP id a1e0cc1a2514c-951a4e8d1b5so997007241.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Mar 2026 23:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774765373; x=1775370173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q3f6eUM79ksch5To8yF3aZNTvb+jZ0PY04rz5fX+u7k=;
        b=nU2mXcdBX6FjK5LH3Ss0GFX5ozMGDIb3Lw1+1MEb0NbosKo/pANYCFBGQP8dva6F9H
         d8eHTmsyQHhGZMPjtSBe7lOh6Iei2f7dKe1ykCTc2aSxoycm+G8PR7TOOCUZ0RxG+6H7
         rJblFstNyatVotq7kzC2JlksGui/wMDrmhpFYWhfpHWEXoG+jLkTa444vjOg2rrsTRxj
         VztAk3ZkBWdNQM0Tv0UySaSmyKxhEWAMy8E+cEO1M4F2xAhIgJlr9LQzhvWcabTNuyfq
         6vQifCCocW4rbG/ejZFBeSUi5vt22nP7f0xbp/Hx1XPNrr+fHQYJBQIt1fzRNgsm/4/j
         zyPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774765373; x=1775370173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q3f6eUM79ksch5To8yF3aZNTvb+jZ0PY04rz5fX+u7k=;
        b=kRViwtf1Til57pKhyO23AsgjX7iD2hXD0i33paQ6iU4JU1z4Eqbp9F44bKV4bLZvJF
         WMJCArJGkReYZ2tzwMKA5uyHLuM5e8kFGNI88W5I/qok1h7R+T1KpNUNOmHmyyhWXTgC
         GPJLEDVtYO6jJ0veR+odvq4SyZLlul0921Ayjvaj/Pubk/wsk25/Fp4DUw8VGd7XSpQF
         TvKc93anh/v6wn1zXu/JfnrizEhmmzxJf8dUbT/lxUHJupHghB1FKGz6S6WHcKVbIouy
         bKGjaKsFJfKi2DXchl1S1NhpQzqTalcMp8Idsq859nyKGhL9AXaQZBKKu+T0/0GVfq5k
         SpKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLer37rIa4fGqRg3CjN6KoNvFN13f1fWz0SAvaaJsSqhtAbb/gO2GVW8LnlMWpsIvt+oT6HhG8BG/2Bju8rTcw@lists.infradead.org
X-Gm-Message-State: AOJu0YzckE/Muo10kt/7Lj/Z2YeJcgU5x6Fjy8DQquGM07PAlbeDXcUe
	APOxtaMOthJJ9ulTYn7N16hEvzc1fltWhATQ7SMWvRjLlriutqsNR1oJ
X-Gm-Gg: ATEYQzxR9mOEbwDW3PQC2AQ32NtulMEUJvKkl2yfZGX8Jfd0bRogZ9+YCl6mrXyGuLX
	mm/qnCLqSbJK+mkXL6zfmqZL29hzQ0XCskME3g2MpsUAM3peaXXHLuU0UrNB9MtkyR3oIlYYg98
	vCPsxYNTJrZm8+D9a+/RdjTW2sg+6z1qxV1DVINvB76UMPAYTLCO5y4oAOPjqLBy+d+HfIs89Ml
	90y6RWb4aFchuP4exId8btOt6caM0aTpM7vo7VrpULIS8Pio6gjM+pCWuMU7KxVioNsPpQOhhO8
	Awyd/GmAwkMvULdxqoHX12p+4/n1eS5YWlPkb81Vy2cqLkAYHkUIQ8gF59qV58OBTJJwTCi4DyG
	0Rv1bHQJm2XFnybsA3I2GbeDcQ6xU4xvjbt56UnXwOwN4nUEE6rJJtVfglwCp2sSKGp+T0CBmAx
	u52RQtOS2se7ZNxEjYqXmlDGpl
X-Received: by 2002:a05:6102:6a93:b0:5ff:f446:c010 with SMTP id ada2fe7eead31-604f90587f2mr2976603137.7.1774765372862;
        Sat, 28 Mar 2026 23:22:52 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac6:d6db:aa::11:19a])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60512d3a037sm4475072137.9.2026.03.28.23.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 23:22:52 -0700 (PDT)
From: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	=?UTF-8?q?Sebasti=C3=A1n=20Alba=20Vives?= <sebasjosue84@gmail.com>
Subject: [PATCH 3/4] staging: vc04_services: vchiq-mmal: prevent stack overflow in port_parameter_set()
Date: Sun, 29 Mar 2026 00:21:13 -0600
Message-ID: <20260329062229.493430-4-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260329062229.493430-1-sebasjosue84@gmail.com>
References: <20260329062229.493430-1-sebasjosue84@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_232254_211790_17F89A8D 
X-CRM114-Status: GOOD (  13.17  )
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

From: Sebastián Alba Vives <sebasjosue84@gmail.com>

port_parameter_set() copies value_size bytes from the caller-supplied
value buffer into the stack-allocated struct mmal_msg's
port_parameter_set.value field, which is u32[96] (384 bytes). There is
no bounds check on value_size before the memcpy.

While current in-tree callers pass small fixed-size structures, the
function is exported via EXPORT_SYMBOL_GPL and accessible to any GPL
kernel module. A caller passing value_size > 384 would overflow the
stack-allocated mmal_msg structure, potentially leading to stack
corruption and code execution.

Add a bounds check rejecting value_size larger than the value field.

Fixes: b18ee53ad297 ("staging: bcm2835: Break MMAL support out from camera")
Signed-off-by: Sebastián Alba Vives <sebasjosue84@gmail.com>
---
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index e18471930..11af71309 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -1361,6 +1361,14 @@ static int port_parameter_set(struct vchiq_mmal_instance *instance,
 	struct mmal_msg *rmsg;
 	struct vchiq_header *rmsg_handle;
 
+	if (value_size >
+	    sizeof(m.u.port_parameter_set.value)) {
+		pr_err("port_parameter_set: value_size %u exceeds max %zu\n",
+		       value_size,
+		       sizeof(m.u.port_parameter_set.value));
+		return -EINVAL;
+	}
+
 	m.h.type = MMAL_MSG_TYPE_PORT_PARAMETER_SET;
 
 	m.u.port_parameter_set.component_handle = port->component->handle;
-- 
2.43.0


