Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3329CC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 10:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BZQsFKP4jMyXxxqQrP5SytFPA0wlD3KzFUOMPf1X4dk=; b=RKjs/J65gnxArMMbDPU2QAsvcM
	vIj0tMPtJy7VhmXdCS9rf7nUD11wQB+6Lr7+sgulQZB3Ks/RjR3/NmVYB8R6OlSlDOAiQn6Pg+kYq
	Q5R+35J/pyuEcYIH53FFWIDOQO5CBLUPDY3go1k4L99T3ShxTkOP+I6pvM9o44+AYIBxjCrx7eUSV
	qOSc3LxZC7AfKVagJXxjqaUK+ith69zIE63nB7UOvc/4hIWrnXOl8GmNdBvi7+vXe1ip3044K0WE6
	ccs/W2qu+CCfjoTSnU7baL89S0FJRAwWuUM0U3P9BiaoPJayw/1w8Rs3oufccGQzPvVKSTf2LMSQ3
	zg+Gn0kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RIk-00000001hZA-1nrq;
	Fri, 04 Sep 2026 10:37:42 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RIh-00000001hYM-0KBA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 10:37:40 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-38e041ea211so668130a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 03:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788518258; x=1789123058; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BZQsFKP4jMyXxxqQrP5SytFPA0wlD3KzFUOMPf1X4dk=;
        b=dY0JjnAOPgMk73zbrk9csPAhsOQ33uBrpsI0Bh/A6Xfzj42kyw2wz8dd7jVZ67wNQW
         Eib3ULTgXPgP140M9mOfsh0G5DUQ5m6hxygbSl746uSkvwfIQtyvl99CdtxInpl+Qj6R
         LjcHnxdBPpvFnFTNWC5h8b0NvsD1DchVleTY8JZ6xgPRLFBoDNCSfYzkL8c97XgEdgiE
         8YuYNzoSECZlLejiCh+o8Pot8HqgSM3szuN5E6ApvoWReYMDJrfdxb56aCk1KZjyX4FE
         UyqxrazNqzP0uibAXNL4FieC339ALQId2zI1yiRFe4lLTUCnsPaBS0dA4wyC+rbunRsE
         ipkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788518258; x=1789123058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZQsFKP4jMyXxxqQrP5SytFPA0wlD3KzFUOMPf1X4dk=;
        b=TX0OnwPWu/RdgtDW/FsfCh1snP2pnLzgLUNifyvQ+jCka7VIns6l6bS0cs4QN4IjHi
         reRRykTAch8mg+yvigjsRbeMtBC8t+FJytRgRFA/ymUk8lrEZgC9luV1NbGfwAO3NNKT
         YQY8PuWiGaIGdQu8wxUP0G88FFuvSz0MPl9jlmzQZHbT3ng0sbBOL/YenKRGE3e08PDe
         cS5DWGg8DreCuEomWjUF3aMjfrP3J5QgMbbOD4Q4RsiDeYJK03QykPbcK43sFrAcD+O3
         oaTWQ01tH+2Luq3gNNV7tkiLD8Gs5laqTp+DDVlzwcfsyl5tmkirP1OHIkK6caOZuZH4
         kUvA==
X-Forwarded-Encrypted: i=1; AKwUvBzAYNNwhRt/M+ttZhSM3KBcK3HKLo4+Qra5enmdPUKQD0Jm/H+aUUGBaKv1TbGCSXCEgXFPARPU31yp69EXIe+G@lists.infradead.org
X-Gm-Message-State: AFuF++ljlBkhb+qu1OPra0V10mQMyCawgHjBIbDpjIGBLkWoBFfm/WeN
	yvQWHJH6xbt89o3XG+UEIXSArqpDbmg40j1T5NxisA5Oh844XFzIfHMJicRIK81/AME=
X-Gm-Gg: AYBFou08h2e9OJdXEgylTjTk/0rbXPUQRkWiZkihN0/XaWqZjjpxhzJaek3sT6wT67u
	VFQl910soe/uuxXTqlXJn0BVJaOmgABgaLneAPikeCxAkcP/UlnKEK/Zvg4WScXCr/uiZSd4i3V
	Z8zOwAXpfNuOP6lKIEl8AFKXCs+z/xepcWDGHdo/TG6Gta+HpKbPcFgMJTFCC6xScqUyZrsBj52
	RaWNXqzdLa5whm5XoLx6mI8Dk90wlqRrEvepe3J4GoxGEPjE4S2f8S+ghqJWRlLlJgTqEd0xnLf
	qowctlZ/ih+iJ3bvFeZ8ZrE27hRNUM4lUUneW7QAr2mnsmGCRifr7upcHRWdFhLU85/pVLvUo8n
	e482EpUnd5wStg6Mwr2SkhR5rTV4r+jaL3Kld8aKflWQjRgOlBSkL6bOwC4iVX84HWI6drwiU/K
	bO4N1LGbKhcZbHOGWS0ruc8QMwi7891f3EFl6bY4n9CyJNBBurvObB3xA1ng/MEeYKAhzSYXPTF
	pnNsKdNTNNWaRY=
X-Received: by 2002:a17:90b:17cd:b0:38f:aab1:5148 with SMTP id 98e67ed59e1d1-39b26272b4dmr6804930a91.13.1788518257765;
        Fri, 04 Sep 2026 03:37:37 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b9f68e4sm5981325eec.24.2026.09.04.03.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:37:37 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] firmware: arm_scmi: fix typo "upto" in comment
Date: Fri,  4 Sep 2026 16:07:31 +0530
Message-ID: <20260904103732.7320-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_033739_115377_23CE7E91 
X-CRM114-Status: GOOD (  12.20  )
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

Correct "upto" to "up to", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/firmware/arm_scmi/driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index ef29fd223287..fb45b8e6459d 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -477,7 +477,7 @@ void *scmi_notification_instance_data_get(const struct scmi_handle *handle)
  *  - exactly 'next_token' may be NOT available so pick xfer_id >= next_token
  *    using find_next_zero_bit() starting from candidate next_token bit
  *
- *  - all tokens ahead upto (MSG_TOKEN_ID_MASK - 1) are used in-flight but we
+ *  - all tokens ahead up to (MSG_TOKEN_ID_MASK - 1) are used in-flight but we
  *    are plenty of free tokens at start, so try a second pass using
  *    find_next_zero_bit() and starting from 0.
  *
-- 
2.48.1


