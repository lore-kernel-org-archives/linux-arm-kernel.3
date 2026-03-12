Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDC21067040
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 15:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I/dvLEb0C2jsyffhRQXnxhbz012D3R783nTzwCwYAxU=; b=RSk68jo8Ho9JrT1QXjhYiuqX6N
	KX6R7QKRe0iv09uDlcwmAlgitBLahoFqT9uU/G98cdmqaWUIFb+mLbGVzPZl5lTFm3E19BLpGyI7m
	5YOM5yGc0Reg47N2vZsgh4/0wljVZQtjItStl08qJYXoGL8iQ7XZvZ6UsA2bXCKvsgRjNRTZF/+0i
	xdGi4pBEnqFpExEuXCTIq4LQaSpOZ8zOH2rrapquPH2NB2i1/mEdsnURNl5sdkx41kq1SBUpDomVg
	4w4sb2LvngKnEEn3BSeheN/OYYM6C4tjhcjckuBAKRK8VIyQ4lp60yBkotwmo2FL8ff440Rp9zYUr
	r+2j9DGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hbv-0000000EJLD-2heW;
	Thu, 12 Mar 2026 15:06:03 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hbs-0000000EJK6-0usJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 15:06:01 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-7d1872504cbso1320400a34.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 08:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bitbyteword.org; s=google; t=1773327958; x=1773932758; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/dvLEb0C2jsyffhRQXnxhbz012D3R783nTzwCwYAxU=;
        b=WTiT9lH+Vgs/L/r1K2DgH9/yFcsYSK6nHYgSEVcc4/pbsPP3rNKgQvJHfvgJI8gG6S
         K5OYm1m2n4cF3ciGWAwulbuHAJ1z5A1EhobvTR7Dxk6bgrF8fIjwbrcJ5rMlTzuCisqw
         7Ea1rLLx5qKgL2LI56V86NIsGrU0sw94ZTaWX98/jLtily08c92xWx5FE98uNC6kpL7f
         8Gn7woDwe9vIlBy2kscxeHSD5vCVQAEoI+O2ZZX1jBIBNj0q1XEFPH+u6eewtn139bdH
         F5Qs1JBDz8r8ZTc00TEVwbOioAcCE8UJe7T2R79SNI9Ilmz6TUyNZsuHtilgPmqkz4J7
         ae6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773327958; x=1773932758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I/dvLEb0C2jsyffhRQXnxhbz012D3R783nTzwCwYAxU=;
        b=GbPvL40fG6f6k091/xmaqMxew66oW4fmWkT0bPenGJoU10rkXaLZQ+4vZpxYfKNqU6
         deGBIN3EjPuC5lClhDntT9dNIjPTikfV8/70Jqw1FqKEXx/TSJFzTwciamE1LfiYX4D8
         H/P1AfbOGyQExXpcn4U7CXu75aQFQ53cDtwAVrDAW5l16a0wsrAir5FP46Jq1CypKubv
         MQPQFfVqLwnJ4EFHiXqy6TvAppXD5VM8jjUEBfqK/26+25tFu7cQ2QSk50HsfpGZkQTW
         ZuaT1eIZyOZeryzmQD3mTxOVpx8c/QnUw4C6sjWrdDN5T7HdpsnFatAGzXyMxs3c06p2
         5aCA==
X-Forwarded-Encrypted: i=1; AJvYcCV6w/yv4kYeTcHnr9m3c0ctvABnLA9FBcGKF3tUoKLTZEcNeNZFCI3TaK0J2Wl26rJ743mDKTzadaNOmez16mvH@lists.infradead.org
X-Gm-Message-State: AOJu0YxeeTz8CqiNDubxFewEpknXc5p872H5bEhmxORpSdyaT5gAhCgL
	Ksonjg07jb0tyMwL0crrA9tX1KeSP0CN7ELbKlsb7qeBK/25hZGxrflMKn4oz54DUAw=
X-Gm-Gg: ATEYQzzs86qVZVaqVHb/pEa7+KcdV0r6QvJBwvdQA6kSLIoTnM0X3afZpjHsf8ryjC1
	3evJ5Bjy6uZkcYOO6c6USFj3ehfCY4xwfU0/V5ZAvnV+3aH39rThCdFrclKiYnvUrhTytMK16uk
	t4858rjrLqnG8d4M2uwKp/XZmlIoU4MNd8Lj7BtyPSyzu4+Ojo/qAhvAgsXQCY3fEj4zX4N3nNp
	Jhaly2dkarBdgAGCbvuq4G2NALV6YUeZ1t2RJMp8tvbCmw4cFDdtq72wm7EPj7hFBJBOaW/cVR2
	2h3ke38ZJ1Y9JP1OGURR/NqY1Pm0M7ecnvM3jMbiqWs3Jdk4i9Q4v29wcSaO3pK/sHARtBf4w7A
	p0GY14Za5sUUB2WPZ0N0Ef2cTqvbGMnoF0kJDpoC6/AyJ+1PBghobR0tOPR18i5JY4tkQxWHWlh
	tmau63Du1r1ST3Qz0b7htTP+QeQ+M7yYezsOic7JA616361t5DZ6ruLmXv5XQekQRW52Mj5vIUW
	jQB
X-Received: by 2002:a05:6830:7308:b0:7d5:96e7:bed with SMTP id 46e09a7af769-7d781c0977fmr32729a34.2.1773327958628;
        Thu, 12 Mar 2026 08:05:58 -0700 (PDT)
Received: from vinmini.lan (c-73-143-21-186.hsd1.vt.comcast.net. [73.143.21.186])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d76aedae57sm4321776a34.28.2026.03.12.08.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:05:58 -0700 (PDT)
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
Subject: [PATCH 09/15] fsi: Use trace_invoke_##name() at guarded tracepoint call sites
Date: Thu, 12 Mar 2026 11:05:04 -0400
Message-ID: <20260312150523.2054552-10-vineeth@bitbyteword.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312150523.2054552-1-vineeth@bitbyteword.org>
References: <20260312150523.2054552-1-vineeth@bitbyteword.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_080600_446802_EFA0D741 
X-CRM114-Status: GOOD (  12.13  )
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

Replace trace_foo() with the new trace_invoke_foo() at sites already
guarded by trace_foo_enabled(), avoiding a redundant
static_branch_unlikely() re-evaluation inside the tracepoint.
trace_invoke_foo() calls the tracepoint callbacks directly without
utilizing the static branch again.

Suggested-by: Steven Rostedt <rostedt@goodmis.org>
Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Vineeth Pillai (Google) <vineeth@bitbyteword.org>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/fsi/fsi-master-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index aa1380cdff338..07b88ef49cc47 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -229,7 +229,7 @@ static int check_errors(struct fsi_master_aspeed *aspeed, int err)
 		opb_readl(aspeed, ctrl_base + FSI_MSTAP0, &mstap0);
 		opb_readl(aspeed, ctrl_base + FSI_MESRB0, &mesrb0);
 
-		trace_fsi_master_aspeed_opb_error(
+		trace_invoke_fsi_master_aspeed_opb_error(
 				be32_to_cpu(mresp0),
 				be32_to_cpu(mstap0),
 				be32_to_cpu(mesrb0));
-- 
2.53.0


