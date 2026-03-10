Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B062EFD2D70
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 12:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cabtoOO69urPXAXi1nwx09QASEtiR2iqFRPNp+1JRfM=; b=1qMiA9oYb1NnsrjOZF4l49VxY2
	hnhIyjsRFeWEGbgYXX4aMhwNUysHnRrNde8CH59z98+TeSys+ktdcSvHFsceYB6M9ujh13twfNQkK
	8JLkkYBvtKzvOMSY1FpVwKr9BUH4rgUHqcQRRMTDfiwQ5esZAdNcfdY4CYhdMEwYu8JOFNx4IXyMW
	SesqcppYBRXi73AGTjk7MX4+T5nwwxZgEAtaAfOVEijkJiTl+YZlZXAV5RHjIJ4LHfE3AEWogkucO
	WnYMHsSazVHCRVQSI/FfdIDyDKjWwhOWukqFFo/g/3V+bCRiBMxPPz3y4XaVqlBRf8dFW96Yq/H5c
	woXKp2Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzwXD-00000009WI2-3GrH;
	Tue, 10 Mar 2026 12:50:03 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzwX6-00000009W7z-2U4T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 12:49:57 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-48539bda3dcso20882335e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 05:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773146994; x=1773751794; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cabtoOO69urPXAXi1nwx09QASEtiR2iqFRPNp+1JRfM=;
        b=NL32K0kKBZ+in2HyU9c3pQQFtIYYiopgdarhjibRP/zC+dhEK5WVnooo7DUA5rdc45
         uU8PyluNW3sMqTPuPFAd+7Xw0sNqDbu+stuMIRMd94lAY543/09QzIBXHSq1MiPq9ikn
         5/mZU3f5c7Q7SZK1NwgWKAxISY0h3gHdW+0J0q4wIvLiI8rma0n7omUP9eLZRg24XATl
         TQFkEh/2/dnXhOabNhKI9fwlYbmhWlxvG5bZyCxBdbZQ8Q4UI/Q3CA6LBwDGC0e01gEM
         l1OtPSD2LO4iGy3d9Pw+CKGIIAdgDqMqkE6MMRBkV1tEhRTpfixvwh6iGKv1sUO3g1L8
         UvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773146994; x=1773751794;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cabtoOO69urPXAXi1nwx09QASEtiR2iqFRPNp+1JRfM=;
        b=KSHXpsWU4Z3Ri2q6GgvSS2gRUullUWPylUtdJtJdZtgHgG1ac9IH62V915+yH7ovAh
         goQGfY8JlqzdW0eT9RCx/ePCIXjyxgJwxBOZ5lvz3e+rgroYk6wsgTZYNyy7fWwRDSz2
         mkVf9jvCSP29QHYAup+9hIm4ngZVAvVSR3wVfNKW1sp71MhMrtdoX0yoQadt5xBaJ6Cm
         ng9Gceg/vto0QGQZqG8blSpwpS9ybJfUSsJ2mOEsij8JCT0U9PM1BgG8bdtldvQ9FgdK
         c5M7V+YJf02wYpDeg/0kpki0qL/7IkF1p7ISOPKl4Piz8se+IyNt7CAWmc+nmylmYYa1
         gZbA==
X-Forwarded-Encrypted: i=1; AJvYcCW+70V0PNfxxYfIDtPED2pxv8PL3i3jT6Zjm4ufrepjqrkdAc6FT6eOdfANDZEGX1+jPl1yX1gAxpEKpush0DP0@lists.infradead.org
X-Gm-Message-State: AOJu0YwIA3nk73NXiUdJKuVq2vL6hUTFj2wT2KoSbpnmEk1NZuNiZicI
	LEplXenK5enGHYFAFVuvePPpiR5IRlgnAsHXyeOAjc9j1l55XZOWppnERnjTinWQHfB3gGfJd2b
	a7Zj7TYqiYvzPATNC2F7+tnBFyEdLeQ==
X-Received: from wmbjq3.prod.google.com ([2002:a05:600c:55c3:b0:483:6e28:c16f])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:350e:b0:483:3380:ca11 with SMTP id 5b1f17b1804b1-48526978900mr254229025e9.33.1773146994098;
 Tue, 10 Mar 2026 05:49:54 -0700 (PDT)
Date: Tue, 10 Mar 2026 12:49:29 +0000
In-Reply-To: <20260310124933.830025-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260310124933.830025-1-sebastianene@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260310124933.830025-11-sebastianene@google.com>
Subject: [PATCH 10/14] KVM: arm64: Trap & emulate the ITS MAPC command
From: Sebastian Ene <sebastianene@google.com>
To: alexandru.elisei@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com
Cc: catalin.marinas@arm.com, dbrazdil@google.com, joey.gouly@arm.com, 
	kees@kernel.org, mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org, 
	perlarsen@google.com, qperret@google.com, rananta@google.com, 
	sebastianene@google.com, smostafa@google.com, suzuki.poulose@arm.com, 
	tabba@google.com, tglx@kernel.org, vdonnefort@google.com, bgrzesik@google.com, 
	will@kernel.org, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_054956_648487_01C8AA79 
X-CRM114-Status: GOOD (  11.52  )
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

Parse the MAPC command and verify if we need to do any
updates to the shadow if the collection table is
configured with an indirect layout.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/its_emulate.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/its_emulate.c b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
index 7049d307a236..4782a9a24caa 100644
--- a/arch/arm64/kvm/hyp/nvhe/its_emulate.c
+++ b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
@@ -198,6 +198,13 @@ static int process_its_vmapp(struct its_priv_state *its, struct its_cmd_block *c
 	return track_pfn(its, base_pfn, num_pages, remove);
 }
 
+static int process_its_mapc(struct its_priv_state *its, struct its_cmd_block *cmd)
+{
+	u32 icid = cmd->raw_cmd[2] & GENMASK(15, 0);
+
+	return check_table_update(its, icid, GITS_BASER_TYPE_COLLECTION);
+}
+
 static int parse_its_cmdq(struct its_priv_state *its, int offset, ssize_t len)
 {
 	struct its_cmd_block *cmd = its->cmd_hyp_base + offset;
@@ -215,6 +222,10 @@ static int parse_its_cmdq(struct its_priv_state *its, int offset, ssize_t len)
 		case GITS_CMD_VMAPP:
 			ret = process_its_vmapp(its, cmd);
 			break;
+
+		case GITS_CMD_MAPC:
+			ret = process_its_mapc(its, cmd);
+			break;
 		}
 
 		cmd++;
-- 
2.53.0.473.g4a7958ca14-goog


