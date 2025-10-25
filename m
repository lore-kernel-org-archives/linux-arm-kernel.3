Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B0ACCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 16:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ehiUcUt6iLCen11Ncs28J2yHpJNhGkVkWPyWS3jNXxY=; b=pWHXqrNaxYYqPVR2oRVExaHkgl
	tPMwtCp5WbTOlJTv3Pzrp2A+Hi9U+cKAA3MO91b7IAFC1XNzOemvu+0ld0dta27H1k9//3DrYDgac
	rIe25Jn/uX+lvDUl1AG64R40E0CyBVhZA8sTog/+/RlW8t/bLHViZL1p1Yzn+WZdEtCaoDH09y5PS
	xowjml7DjPGYrKZNznDok8kKlca/76+bEl4BtU9BY6m5MidNkWDSINKow/S7wIdiLaDPl/1jzfM8J
	fvlbJWK6oVjUX5oxrUNg2da26NiibDRgCRnmbXj5sukDDwrJdbSr9DyXWS8KW0qTczwhcI8Db8OwB
	DdOMZZzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vChCo-0000000BWr8-2Qhd;
	Sat, 25 Oct 2025 16:33:26 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vChCl-0000000BWme-1gLC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 16:33:24 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-4e891a8980bso31441231cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Oct 2025 09:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761410002; x=1762014802; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehiUcUt6iLCen11Ncs28J2yHpJNhGkVkWPyWS3jNXxY=;
        b=cx0GCcabx7Ia71MB9fPa2EXBpT7ni1vKD+Ge7/lkEfF2LQ7e+2W11jrfvBlzr11q2G
         yfgkwaKeTRZS9jy1LRASp44GQTq78a997cYeOx9LFfTu3YW4KXXfo6Byyljt0AT66J2H
         DygwT7k65qc+NPZ1/IyBNjjAzYcAJ+kJEoSgXXMSLFSW9/DxIHQF9/sT6ajej4wuE9NV
         jujs4yFDqlmX0Jw8iuJsPIWlZMo1aPq5rl/dOtk5ZJHaPLLhOgukREbs0dyig/f492cV
         jLz+3L3XrOs226N0wCzgf0SWWOUEQkTGlWQqBbDCExLb0VNtXHudBjawJQm+uS1pMiNb
         t/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761410002; x=1762014802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ehiUcUt6iLCen11Ncs28J2yHpJNhGkVkWPyWS3jNXxY=;
        b=plACQuS64+4MDwqUVR4KKT3ceRMtQG4BoW8u0RfcrJXNNiqc1V1uYzzukuepx+Xp/T
         xq2NsVegS74/Z1+2LiOAWpseTOGb5uEs2lTaICeQyUsVvXidOPJKrlqchszTr5spptt1
         7N2uIpK8zlLD69DeqvNtCGc1MguBOoVbQSGZg4RgE+Zq3xxPxxJ6SCc4c03TcWY4mUon
         /26KD3/kCaGX+b18G7wxegSl2OfydBl6Jlj1DXUHcnEjrMlUIg0+odstheFNA98199Tn
         rryWfmID9q1I2me2VjdiOshp8vU0W3aDTxhz+UcJEWCW+9VZ85nwg7E529Bxe31SsYkg
         CbmQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9UI/Y6OwB9DUK3iJ6JJpxpbKVL9yC3C2qag3mB5T0VqjdIFdU29xcvs5WRkJ/FaGoeIWRBVPUWnUitDWtxklK@lists.infradead.org
X-Gm-Message-State: AOJu0YxfosiZ8XroSN/sshwxvS0wd8nJ3mvscAG05e2g5bwRhVoNsjAM
	irqyzgkAUihzh8ByrH5/yuKoON1yVmGOWbwDSQaEZYXbYIznFs1E2/bh
X-Gm-Gg: ASbGncvarvMs0PsSPFpSFxkvSqdpfusS7wxDzCNVcOs5XEBU4eX6rMjBATc+FFgUr+h
	kqP4eqJExwMC0RltnHDMFlTQa7RedA+6OrlsaGCvvucFmpO8UsF2V6d9jy8VAVAu90jg1WBcteD
	uuMIL21yvGMYYPl74V2f5BCFAt37K25YoM88DnRqJuks8cdWCRW5t7uhwLFvMbRGWLEgg+zXyLG
	LivKqxNMSCl5Q9TAhKWI9Iz4sZjCszWOjVf/VYY/DDtcgK/yeujTWZ0hWg38y6eMt+h3TpjMdtE
	AN8Ut3ag2bitI8j1A/9INaCN/auUuMhTWVH/DGcsAqphBxx/z7qIHoVfmqCRDyzP52vL+5ffEGq
	Gxlcw/KwF+H+46QBMYmWr7t0t3WLgCwh19AGxtC97Cj9tJLJ9M4yP+W82JkMR25NFbrnBqjgeCv
	sDFbx65CE=
X-Google-Smtp-Source: AGHT+IHHeWoXJKdNINlOiRKJ3a2nDIiOuVj8p9HhufLAzf+qZUQhC2Mssatfy2OZ9T8hXqauxRLp9w==
X-Received: by 2002:ac8:58c9:0:b0:4ec:ee54:b141 with SMTP id d75a77b69052e-4ecee54b1f4mr8454481cf.26.1761410002057;
        Sat, 25 Oct 2025 09:33:22 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f262716efsm171531585a.59.2025.10.25.09.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 09:33:21 -0700 (PDT)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Lee Jones <lee@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Subject: [PATCH 13/21] trace: don't use GENMASK()
Date: Sat, 25 Oct 2025 12:32:55 -0400
Message-ID: <20251025163305.306787-6-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025162858.305236-1-yury.norov@gmail.com>
References: <20251025162858.305236-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_093323_455391_71306BF0 
X-CRM114-Status: GOOD (  12.38  )
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

GENMASK(high, low) notation is confusing. FIRST_BITS() is more
appropriate.

Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 kernel/trace/fgraph.c      | 10 +++++-----
 kernel/trace/trace_probe.h |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/kernel/trace/fgraph.c b/kernel/trace/fgraph.c
index 484ad7a18463..4f21bd837055 100644
--- a/kernel/trace/fgraph.c
+++ b/kernel/trace/fgraph.c
@@ -106,10 +106,10 @@
  *     (RESERVED or BITMAP)
  */
 #define FGRAPH_FRAME_OFFSET_BITS	10
-#define FGRAPH_FRAME_OFFSET_MASK	GENMASK(FGRAPH_FRAME_OFFSET_BITS - 1, 0)
+#define FGRAPH_FRAME_OFFSET_MASK	FIRST_BITS(FGRAPH_FRAME_OFFSET_BITS)
 
 #define FGRAPH_TYPE_BITS	2
-#define FGRAPH_TYPE_MASK	GENMASK(FGRAPH_TYPE_BITS - 1, 0)
+#define FGRAPH_TYPE_MASK	FIRST_BITS(FGRAPH_TYPE_BITS)
 #define FGRAPH_TYPE_SHIFT	FGRAPH_FRAME_OFFSET_BITS
 
 enum {
@@ -123,7 +123,7 @@ enum {
  *   FGRAPH_INDEX (12-27) bits holding the gops index wanting return callback called
  */
 #define FGRAPH_INDEX_BITS	16
-#define FGRAPH_INDEX_MASK	GENMASK(FGRAPH_INDEX_BITS - 1, 0)
+#define FGRAPH_INDEX_MASK	FIRST_BITS(FGRAPH_INDEX_BITS)
 #define FGRAPH_INDEX_SHIFT	(FGRAPH_TYPE_SHIFT + FGRAPH_TYPE_BITS)
 
 /*
@@ -135,12 +135,12 @@ enum {
  *  data_size == 0 means 1 word, and 31 (=2^5 - 1) means 32 words.
  */
 #define FGRAPH_DATA_BITS	5
-#define FGRAPH_DATA_MASK	GENMASK(FGRAPH_DATA_BITS - 1, 0)
+#define FGRAPH_DATA_MASK	FIRST_BITS(FGRAPH_DATA_BITS)
 #define FGRAPH_DATA_SHIFT	(FGRAPH_TYPE_SHIFT + FGRAPH_TYPE_BITS)
 #define FGRAPH_MAX_DATA_SIZE (sizeof(long) * (1 << FGRAPH_DATA_BITS))
 
 #define FGRAPH_DATA_INDEX_BITS	4
-#define FGRAPH_DATA_INDEX_MASK	GENMASK(FGRAPH_DATA_INDEX_BITS - 1, 0)
+#define FGRAPH_DATA_INDEX_MASK	FIRST_BITS(FGRAPH_DATA_INDEX_BITS)
 #define FGRAPH_DATA_INDEX_SHIFT	(FGRAPH_DATA_SHIFT + FGRAPH_DATA_BITS)
 
 #define FGRAPH_MAX_INDEX	\
diff --git a/kernel/trace/trace_probe.h b/kernel/trace/trace_probe.h
index 08b5bda24da2..88de129dcde0 100644
--- a/kernel/trace/trace_probe.h
+++ b/kernel/trace/trace_probe.h
@@ -401,7 +401,7 @@ static inline int traceprobe_get_entry_data_size(struct trace_probe *tp)
 #define TPARG_FL_USER   BIT(4)
 #define TPARG_FL_FPROBE BIT(5)
 #define TPARG_FL_TPOINT BIT(6)
-#define TPARG_FL_LOC_MASK	GENMASK(4, 0)
+#define TPARG_FL_LOC_MASK	FIRST_BITS(5)
 
 static inline bool tparg_is_function_entry(unsigned int flags)
 {
-- 
2.43.0


