Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC0ACF3951
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 16:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tm65IZSOvcLW22I95NQ1DesGTVpSHNfrfkgnxYh1pRw=; b=NgHbwgMzINxRQrrO8hQz6xf7Hs
	LKBsGIENh1MmPRyfncnBcPcvodJmqRBQAARtTGdBFZzhSI9eGEZ6MQcrye2DoqQRolTSGSMn8kSd4
	E8lhW2HXIi+D6UpUMNbfBQAYR3wfEw/lE9pvT1tgO6H5Zl35YjABnzHxgzjxUpgchgz3puxqTEt4w
	F8rIVUDY1Y4a9e8FSKUK4FDuPteQjnCofL9EUCYtORwZXIGotw6iCXvCuaRCmsMkyKCfOF43ynbOP
	Nqnysmo4pEFOB+lQdiNrCepl080INshqlq7rBqg6TVr8htcLEpKlSX0sxKx1pI/Hby+OuzM7RInWE
	inpuCkZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLktH-00000003fBb-05sr;
	Wed, 19 Nov 2025 16:18:43 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkt2-00000003ewJ-3htj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 16:18:30 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-47790b080e4so30470595e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 08:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763569107; x=1764173907; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tm65IZSOvcLW22I95NQ1DesGTVpSHNfrfkgnxYh1pRw=;
        b=UpTgpjqN7hfJl8GMXj0IhdUrHRtFdLBshvpxpXo8m9v7rX/6osUK8pJhNyXthqTOvz
         KOTldCafARisndyD9mwfIve9ILEfGXjCEYy9BAVloGpIuQfIeHi/qNZYeuQBwskCGPmO
         EtSYP/r9S8grtHBg08BnPnBHnyhHL7dmbkLxMEiiDkOuSMoC9gZOZrGGyUhOly54yb/o
         0LDARdiDze37mApPTXkcqVC4CPFGnjvdcNPIy8wuoejnbkM3DCo8L11wTWF4XgGp0RIt
         IBVV2rSMNe2d+2AhcqMYaCnnLyIANPdqQy7q/Pz6f3PkVUBQpCAzie6iQIPm/b15yfPt
         30jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763569107; x=1764173907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tm65IZSOvcLW22I95NQ1DesGTVpSHNfrfkgnxYh1pRw=;
        b=awOwYXCa/UkC4FmjC+oCwZbZNPEO1I4Je3BXbSyDVj51XeoXZLba9o+x6KlETxeon0
         0oddpqD3h6gFt19IsuAfaHvC2r0DPNYHsYfNyLcaHzPNYi6esuwTHW7ZOt3trh84M3vL
         gL1e8rr4FMGRjpsJi+7e6IgXBRawz8mDd8TIcCgCZHY9uWr1LQxUnx459NQt6t7zURrm
         u/InL4nUKf+JqMBv9hFS6Ce/qymq6y0zSTrFU4nZ6QhRV7ZhauxB94YkvkRAIsexKpLJ
         q+hMUPdLA6CdjBgv/fAaNm5WgleDbNiKUxADNNgUkdGubdJrJyWYwZwFgmUCZL6cHlpp
         OrQA==
X-Forwarded-Encrypted: i=1; AJvYcCWiQ/6G6cFgIdtlrSMc6vvtoPNcaNKIQiM6oAiwZCTigOGHilXEyWscvJoCLztEIFPylZBFZZfnGyBehxBmmQzw@lists.infradead.org
X-Gm-Message-State: AOJu0YyjY9ZEUhh5kG5JFKB5YKluyTlhsT/hbkwaYVz2NETBMru28nXL
	fqTGth75Z6na7wwscgg0lxmkb+3QghViqHyqZy/BUsYHQHLOgtlXVrfeP3Dz7OWPLZc=
X-Gm-Gg: ASbGncvL3E84YbgqKs9DSjp84OjeyJLcqjdIlLlpbqzeKzU+vlZBAjUyJDfKA+IvpDF
	+D4lRJU05dZ0QcgJYd504JITs+JsMkdgo2MDdIr7bNkkxjpG2BcRZWsokqbmRdIGlKxxUYOJoGF
	qqlbbnIF1SwSwDm1yHphgsWOZoaN7fDMXQrMFJRAwoloual7cte/vHRgUQbTbBSYmRn5F8cAatE
	RMYxQTwGt+lHSorAPChaNUFaTNztjH5BAgbSBU3IoMCsrz7e8h539l9K3eYuhO2YBSnIqeCxVte
	JkssdIeSHpq4vw5JrxKImhFsy+w4EWlk7mgaDC5Vj/HUjnFQ3Z/Kf2PNhGiVJthiL2jWEmvMxAf
	cKdXTqubAYzkncJSQVQiTFopQip2QEfOE4DCDWkapyGb4QpuTO41y1RmbIoAqa/YayU6hGyEMzC
	YZPUEb0Q5TIQoQ8pvP/Io6
X-Google-Smtp-Source: AGHT+IFFA2/5WMyi43JL9wYl1E+HXHvpaVVjq0ooJOqK0iATycUimsaSxmDoPtbjIuyl7D1kIpWgmw==
X-Received: by 2002:a05:600c:8b8a:b0:477:952d:fc11 with SMTP id 5b1f17b1804b1-47795418dcbmr192758345e9.16.1763569106515;
        Wed, 19 Nov 2025 08:18:26 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b10142d3sm63205425e9.5.2025.11.19.08.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:18:26 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 19 Nov 2025 16:18:04 +0000
Subject: [PATCH v6 08/13] coresight: Interpret perf config with
 ATTR_CFG_GET_FLD()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-james-cs-syncfreq-v6-8-740d24a29e51@linaro.org>
References: <20251119-james-cs-syncfreq-v6-0-740d24a29e51@linaro.org>
In-Reply-To: <20251119-james-cs-syncfreq-v6-0-740d24a29e51@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_081828_983773_1904E1E4 
X-CRM114-Status: GOOD (  14.85  )
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

The "config:" string construction in format_attr_contextid_show() can be
removed because it either showed the existing context1 or context2
formats which have already been generated, so can be called themselves.

The other conversions are straightforward replacements.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index bf4b105e0f41..3c8a6f795094 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -77,10 +77,9 @@ static ssize_t format_attr_contextid_show(struct device *dev,
 					  struct device_attribute *attr,
 					  char *page)
 {
-	int pid_fmt = ETM_OPT_CTXTID;
-
-	pid_fmt = is_kernel_in_hyp_mode() ? ETM_OPT_CTXTID2 : ETM_OPT_CTXTID;
-	return sprintf(page, "config:%d\n", pid_fmt);
+	if (is_kernel_in_hyp_mode())
+		return contextid2_show(dev, attr, page);
+	return contextid1_show(dev, attr, page);
 }
 
 static struct device_attribute format_attr_contextid =
@@ -319,7 +318,7 @@ static bool sinks_compatible(struct coresight_device *a,
 static void *etm_setup_aux(struct perf_event *event, void **pages,
 			   int nr_pages, bool overwrite)
 {
-	u32 id, cfg_hash;
+	u32 sink_hash, cfg_hash;
 	int cpu = event->cpu;
 	cpumask_t *mask;
 	struct coresight_device *sink = NULL;
@@ -332,13 +331,12 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 	INIT_WORK(&event_data->work, free_event_data);
 
 	/* First get the selected sink from user space. */
-	if (event->attr.config2 & GENMASK_ULL(31, 0)) {
-		id = (u32)event->attr.config2;
-		sink = user_sink = coresight_get_sink_by_id(id);
-	}
+	sink_hash = ATTR_CFG_GET_FLD(&event->attr, sinkid);
+	if (sink_hash)
+		sink = user_sink = coresight_get_sink_by_id(sink_hash);
 
 	/* check if user wants a coresight configuration selected */
-	cfg_hash = (u32)((event->attr.config2 & GENMASK_ULL(63, 32)) >> 32);
+	cfg_hash = ATTR_CFG_GET_FLD(&event->attr, configid);
 	if (cfg_hash) {
 		if (cscfg_activate_config(cfg_hash))
 			goto err;

-- 
2.34.1


