Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A960F4613B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 16:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mObnim+O/1qM5mBF9TW6/nMqNmbffOtpWCv4mCo57ds=; b=XrcinT9x6uZARCicvwurAGVZGB
	UfcB6LmQ4AqKwb/r6i3lZX8Iw4wtnuIFNRqWYQ+O1f99rKEmpQ94J4RSHO0ICIvfjnioZSBaVeuz0
	FUslJEpdUsBUXvCJ4J4LU9RBLRp+0hGDDBbzMxaQvwgFWh/wU+ZGBvoGLtkiIY2vs6FClV8shZKM3
	WiDyTobCzNWv7Xeq0hLCjFBXPQbXFSyfs8QfSvQj1uIye8x7bPrPldATgi3UeluY2w97hpuNWCCCo
	BRevIQz/fZZ4lew0icxYj4VnHP3QeqxGUuZa/6HSvY+WHi9MwZTwk+emFT6bHcuGz3clJdQawMm/v
	TVN0kx1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hiW-0000000H597-0dvd;
	Mon, 23 Mar 2026 16:01:24 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hiT-0000000H58i-2xSC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 16:01:22 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-679f6ee3fb0so1123284eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 09:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bitbyteword.org; s=google; t=1774281680; x=1774886480; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mObnim+O/1qM5mBF9TW6/nMqNmbffOtpWCv4mCo57ds=;
        b=Or3z8MEWL/wheFAEY2n+j/bXvHRD8daLvdKDO0SwvyaA4WcRU5odanzHmis+V7SG+6
         O8MR53U7BSwIANJeOQo3a8FKYk8VhNorwrCyR4K+kTYFTTHTD3bOw3MRHFUx72DXBu1p
         s4PMV2JUYxr6Yp4t4VFDa7Vl7UpsbBwtlEK1MDpVV76RDzYM3Uaz1qAmMsCaPncKFrak
         uqa15udqqeGanB5Sf8D9wGixcfd2EzHt2bq2c68+N++KdXwvcPQlAQ9kKpRtX7wkaOQK
         l2xu1aXLxjFp89JNX56eDrkHJpsM0/ujOOXd7Kxr8TnvPOLKYWFROwMUaZwk1aSOqIIU
         pqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774281680; x=1774886480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mObnim+O/1qM5mBF9TW6/nMqNmbffOtpWCv4mCo57ds=;
        b=Ucj451h5mpRB6wuvgnppVOdBBtNt2YCPAYStw6LHs6WkVH6owCTJVeHl35HcmWvHrm
         ylvZBFLv9r/NEn1fgWjn36KJGB4xhKKNLuAy7GwCD1hMQZjGSSRzI8af2ikNUagE1AgJ
         jbIOflAIQHq8K5sPUzivDKMFs/8tpJ0MoRsLjvVvm79qUcF43hP1yHN4EUTg2fDbzVnJ
         5kMHP+6TsH1BATA6xN9PQR3m1sC4kdcFfuFVnQXL8BBJ+3UZJo+K8zvHmH8qJcqrlfHc
         wYkxTTGAQSFZeyphvQAGNGnb4vdpxUPaAI7XvtwRueUIir9xuICYLhmbGJiayhrZv4wC
         SYww==
X-Forwarded-Encrypted: i=1; AJvYcCUP5LUlhRbaeA3vbLY6pYsdHoY4ubrNoag3pxDIekjlBZQpYLEspMrbq/ee4xCz9A/ehWvotoPVSy76Ek5QGM/0@lists.infradead.org
X-Gm-Message-State: AOJu0YyPWcuH/pdSZzbjQ2DWNL5nUXbZ5ZBVUMotAYdLCitA1v1Pvc+G
	QpyccTlhaSq4hrMyHo111RHYJecyUE21DH7Odwp+sppRDiv/VNNFbuv7DHRuxKVrMis=
X-Gm-Gg: ATEYQzySlk7qAZsRoREY5j3+uELC3KwVq3PIZXN3yEyid1jay/mNbKvrs/7GVW5+kG7
	9uq+DbVI1DPL4GL1tnpLn7c33d2skq4b6gOwpONb9Zya67HS/NBqBzC5rOQvuhUtGnyat18wT1+
	k6QN0mQ+TOk/oZ1zbMrjjzoXx0ZrLy5D8VXRPVJQMncbcgCM5orSEdMuJZ57VTwicDCiEPoFccz
	hj06OgqwkOeM6HLVBgwRhBiGCE2BU8vIkw3iDUCUWEXLhQ5Q1CJ2QtJl5N+psPb8mxXduBM9Hq2
	hZlwurpymjBGen2r2qYsm7iS6m0Jh2Fx+N4kc3BsznHuW+T92RzOJkNHW2KjEBDTtRUpLPbXWvh
	kDoisdV8MCWX0h4jKeIM0n5pvBsdx4dDK7jGPpFnkvMHBo3wHA4CGO/g0Sbea/e/hRluKirbj1p
	ydtKgmFxijcp4x+8Ic4b4ECcoXa+EV/ezMbroOMlGqJwDRVgDP1ROIqrV93eFXGbkW4A==
X-Received: by 2002:a05:6820:987:b0:67d:ee07:32df with SMTP id 006d021491bc7-67dee0735f2mr1955626eaf.23.1774281680005;
        Mon, 23 Mar 2026 09:01:20 -0700 (PDT)
Received: from vinmini.lan (c-73-143-21-186.hsd1.vt.comcast.net. [73.143.21.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc9088df1sm843364185a.25.2026.03.23.09.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 09:01:19 -0700 (PDT)
From: "Vineeth Pillai (Google)" <vineeth@bitbyteword.org>
To: 
Cc: "Vineeth Pillai (Google)" <vineeth@bitbyteword.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Eddie James <eajames@linux.ibm.com>,
	Ninad Palsule <ninad@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-fsi@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH v2 09/19] fsi: Use trace_call__##name() at guarded tracepoint call sites
Date: Mon, 23 Mar 2026 12:00:28 -0400
Message-ID: <20260323160052.17528-10-vineeth@bitbyteword.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323160052.17528-1-vineeth@bitbyteword.org>
References: <20260323160052.17528-1-vineeth@bitbyteword.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_090121_754021_CC8DC4C2 
X-CRM114-Status: GOOD (  12.26  )
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

Replace trace_foo() with the new trace_call__foo() at sites already
guarded by trace_foo_enabled(), avoiding a redundant
static_branch_unlikely() re-evaluation inside the tracepoint.
trace_call__foo() calls the tracepoint callbacks directly without
utilizing the static branch again.

Suggested-by: Steven Rostedt <rostedt@goodmis.org>
Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Vineeth Pillai (Google) <vineeth@bitbyteword.org>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/fsi/fsi-master-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index aa1380cdff338..8313c7d530eb7 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -229,7 +229,7 @@ static int check_errors(struct fsi_master_aspeed *aspeed, int err)
 		opb_readl(aspeed, ctrl_base + FSI_MSTAP0, &mstap0);
 		opb_readl(aspeed, ctrl_base + FSI_MESRB0, &mesrb0);
 
-		trace_fsi_master_aspeed_opb_error(
+		trace_call__fsi_master_aspeed_opb_error(
 				be32_to_cpu(mresp0),
 				be32_to_cpu(mstap0),
 				be32_to_cpu(mesrb0));
-- 
2.53.0


