Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB430C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 12:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M9iDb6dJHPByHFRUfHN+WUxFJ05ZfE06RQ96hiEBIf4=; b=rpqJnEemChPOO1sNd1Ay4lWMNf
	wIBnlqeFuhGaIJLyKSD5vWwgiYPPnkYkvXdX6oa32nenz+y179cmx+z9CWaKCbTfrbuuZeQnn4Die
	XG32uU9jEw7hqSbarq0zP9pLqWIPXgQqGT0yA8FL/mjr0sOniG2+e1Q9iqcYUnDNutql6wyBn76mf
	acVmJoT6cLJ+DY73CKunKH9fkGai1AxRD6aDXYhFD1kEeqMiX9zzWOoxIiYIgBv4Ns2IqNxgQYSzV
	bNKFFHghs4i2cp/B9kC13TbXiDrjmDHD5Zj0lL13rdBhGgWupLifI++cOPDQs4Gtq0O0eqdU1BK3a
	q8Csa/WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Cmc-000000077Nl-2WpT;
	Tue, 22 Apr 2025 12:31:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Brc-00000006x9s-0Hsa
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Apr 2025 11:32:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=M9iDb6dJHPByHFRUfHN+WUxFJ05ZfE06RQ96hiEBIf4=; b=QuwqsY/YcfdL10e/jf1marUWr/
	vTvshWCAKeB8D/JxjZ5cKur8VpupWxsFZDMy8TxXW9jT3mW9FXzka0+P0K5QD8pgXkzjR4G7ZwhzP
	YkZ/eRYOJLvFUOjkJEh0RIXopQshKYVRkW08PMxuG5lnzwYBIPxbGwDWCKGj8CTRrRHfQr3Bok26M
	Ve/keW/jBxhEdzQTsPphSbgeCMU7MK0q6d36nJ7kb+Bsi9Iw0zKuO1AoWCi9ODmBo9volYBDKlPCU
	ADva8fNHWUnNFaeHfEzQjKTuKdFAy6lqa0lIebvCDuCJqRdW9AqMoO2bNlsD7XlxozFZfrwPOkT1I
	gyi13baQ==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7BrZ-0000000BCLX-0YlK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 11:32:31 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso23846875e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 04:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321547; x=1745926347; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9iDb6dJHPByHFRUfHN+WUxFJ05ZfE06RQ96hiEBIf4=;
        b=efq7kwGZHW5JWF2V5HBjG7iEx8xLujsbblMJ8KViNPNrJBW+j9R52zOXhlIGT37vsD
         +nnrNucV+mTZWSVz4V46gkLP/eVrETEBm41LW5QhgruGFCD41NzXdMLUiRO6byPaVCYo
         XI6YCAS2D66smjeC/wHR7DmthIpkBT6eNGf0V5fwNgdKvHlMnDJUvueOHUnp6Dxy62J6
         BhD43vPpxZJPkUF8uz+E1K6TztMjVHXDzz6erkxassVjiiud5MuWpD2gI2C7k2NtdyeV
         Rx8PsGiRQzFaa21iHJwV4/MaNnkddjDMHU5eBXYLCwWtG4vAejj66CqwiMrTF0vYalBU
         my/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321547; x=1745926347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M9iDb6dJHPByHFRUfHN+WUxFJ05ZfE06RQ96hiEBIf4=;
        b=e19HdNwHZF9u+Ijr/zbXrMzFH4bYSlC98vWF/6c6dJfpLUhKvoJxBf06bKs8H6OBvX
         jm4nN3SF5NqtmbnCF7zHWeobyWauoJVDXzDO9Lgyiygmv8+oj5g/S1LU+VeOVtt3+pFx
         1G0IbsYw4Lp5jGBWBB9vFbCXwrFCo6VyOzcDxJUe8rIwoVwtEfH8U10dFQ6W3ViK0Deu
         ezDiAdLBY1AsxNIAwAMYudmlmSN46T+mr/T2h55UvKaOjPOJtht8JD1XatxXojrdXNML
         8OtAGy/YEVL5ZZnG7NB+wjkcYhrfdG7951d/8IlMe9LRYRenjTh4dqH8T8shv2Lg1ryu
         tAcA==
X-Forwarded-Encrypted: i=1; AJvYcCU5Deh81gc9vg9RhC9FBHCeRT20xlxTSYLGa9WjbDW5aoCU9S7+AvjvQIBWy8A864hjDX0f84PZdpas1DMTJWsd@lists.infradead.org
X-Gm-Message-State: AOJu0YwE4cTt+GMpmbVIWcGpZ1Vzf4gaHIXIRZAyk1zKOam2JhxnWsUi
	zh0WewshQxv/XC395hzOt2Nk65+G69pNKOYzOY7sA1qCpcoSSF3Wt7o5sy6pAlM=
X-Gm-Gg: ASbGncuFQ05Q8TJXp9ZE11eL9SKo9eIGfYTIuT5KwEh/mav/q9FogSDDEjwgvXXuMNB
	YEwmIXzsIIS0MbVwRpKkGgkqT5oR5bj95l9e/WomW+0Aj23aZ1wrv65Q+hWGE3Dpp48J/xrBO3Q
	HSRW/1F8t7eHoIIsk2qSA3mJ7Nrct1INufC4hYYYQ1UUHwN0wYjgw68tS0KIrZeqyG7PpsDvO1N
	YuisEhlxwr3RZQaLbKkqrxlhfdytApBSMGtA15xlRUBQW6orMf9Sha+9yfqj1jUxJYK6tkJe51w
	9Mi+Ux6q6BkA4dteBp/AtecpsV7Wiy7W0+UicoP2YctBC9k1N3HADPjJTZ5J8i4=
X-Google-Smtp-Source: AGHT+IEcklRua+TIOcJ9V56azXwxEY9ZBfbluuMXCoJPkRtrWwdtYmmWeeqPQxiQXCGvLRp7yg+S1g==
X-Received: by 2002:a05:6000:1846:b0:39c:11c0:eb98 with SMTP id ffacd0b85a97d-39efbae03admr11898357f8f.39.1745321546877;
        Tue, 22 Apr 2025 04:32:26 -0700 (PDT)
Received: from eugen-station.. ([2a02:2f0a:131e:0:1820:da87:73b1:d80c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49312fsm14907887f8f.70.2025.04.22.04.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:32:26 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	andersson@kernel.org
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	tglx@linutronix.de,
	mingo@redhat.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	pmladek@suse.com,
	peterz@infradead.org,
	mojha@qti.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	vincent.guittot@linaro.org,
	konradybcio@kernel.org,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	eugen.hristev@linaro.org
Subject: [RFC][PATCH 11/14] panic: add panic_kmemdump_register
Date: Tue, 22 Apr 2025 14:31:53 +0300
Message-ID: <20250422113156.575971-12-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422113156.575971-1-eugen.hristev@linaro.org>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_123229_427007_EEA85E98 
X-CRM114-Status: GOOD (  11.27  )
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

Add function to register panic info into kmemdump

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 include/linux/panic.h | 1 +
 kernel/panic.c        | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/include/linux/panic.h b/include/linux/panic.h
index 54d90b6c5f47..42a24bae218c 100644
--- a/include/linux/panic.h
+++ b/include/linux/panic.h
@@ -96,5 +96,6 @@ extern const char *print_tainted_verbose(void);
 extern void add_taint(unsigned flag, enum lockdep_ok);
 extern int test_taint(unsigned flag);
 extern unsigned long get_taint(void);
+extern void panic_kmemdump_register(void);
 
 #endif	/* _LINUX_PANIC_H */
diff --git a/kernel/panic.c b/kernel/panic.c
index d8635d5cecb2..a26c9581e70a 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -38,6 +38,7 @@
 #include <linux/seq_buf.h>
 #include <trace/events/error_report.h>
 #include <asm/sections.h>
+#include <linux/kmemdump.h>
 
 #define PANIC_TIMER_STEP 100
 #define PANIC_BLINK_SPD 18
@@ -589,6 +590,13 @@ unsigned long get_taint(void)
 	return tainted_mask;
 }
 
+void panic_kmemdump_register(void)
+{
+	kmemdump_register("taint", (void *)&tainted_mask, sizeof(tainted_mask));
+	kmemdump_register("taintflags", (void *)&taint_flags, sizeof(taint_flags));
+}
+EXPORT_SYMBOL_GPL(panic_kmemdump_register);
+
 /**
  * add_taint: add a taint flag if not already set.
  * @flag: one of the TAINT_* constants.
-- 
2.43.0


