Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E36CCA5FE3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 23:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Yhq5TvFbCkOnmQ0HyRqBja4cyWrB7IIoElNmyWi5U0=; b=fZbUeP7EbMdPkxT9xaiWRYilEL
	X/VRL2FuDE9EwDK0naR+Ccm3JNIrt7IETo9tWHwV9jd+9jDrn6LImzA1I5QU75vyHSzza577/xlJd
	bkZknw1wO6Ng3ZLOtKG0vOuMshHh/AWucQOTyTp2VOBKFfk3ugPO/50w02nURIzmbApUsNbrFN5td
	/81UBIXnWIrvlvgWYS2TsbB+EbB1hOiNf0+t/GeHNbISZ4AvDmtmpxFSpv1PG4as42FVxrfZggWom
	TFXb7A7l91dnt2QicnXE6zKD0jKvHaLKdnkLc/ekoMprtF0bbiKp4RuUtJpA3Hds2+1PdOpSdUnqU
	0Y1dOOZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCmLd-0000000CfLN-2jJo;
	Fri, 02 Oct 2026 23:07:25 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCmLa-0000000CfK4-0xwk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 23:07:23 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-3510f00d974so134016eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 16:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790982441; x=1791587241; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Yhq5TvFbCkOnmQ0HyRqBja4cyWrB7IIoElNmyWi5U0=;
        b=UdFd4J11n1RzQA0NHZXC6sM37aLi0yKLhXIKAlQuuf2jCBPF5jE80hKrksF1GLjUg8
         Ew6MZ8b8Tst2oiFvo6QuDtdVYeSQQy1wTg48AAV40vnYDI7ezympvVTr8dHHptY2YYVe
         kQtuQ3KQz8Cw/bXTTVUlXIU41GUvAKUf7XnAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790982441; x=1791587241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Yhq5TvFbCkOnmQ0HyRqBja4cyWrB7IIoElNmyWi5U0=;
        b=DvbYJbBkzLBzn4JndagHZ5s/epmZNdGXycTZZ5PuXivOK1vTgNP4E4YbzkyxfMB3TC
         04o8DGS+nqeVYPRFc6TnkiwwceTG54zXLa+SOt5rrXKv5U6hf2i5Z3yfNi0If8fbsE0t
         x7naE51xqqhpWVao0i3rD1GZsrNlhhFR9AsLk9aCSk/0xBf+QOdePbo/cbpmhbQlkKbS
         Lg/uaLOijzrb1kVv0Uiwmsar5VE1OoF78e9pcsBF84D3fgu/wMdavDijgK+cz1jIVcmz
         3rfmzKPWxJTN60L1+fMqypJJamn662xW8dysZGPEYFNFS5IjQwGfG6+baxalYiAf5SE6
         fpbQ==
X-Forwarded-Encrypted: i=1; AKwUvByccGeRsU9FSB/USAbSzda4KBbzPpYmKljQx+tKCD112Rj699oH1i3f46FANtXWT+taG8Ix/LRp1t+u7NbEC1NM@lists.infradead.org
X-Gm-Message-State: AFq9FYIV+DD8lhjLHoRNll1O4PcMnd6psfK7VATYWyXV1uf7mSRulMUz
	xy7tp9FjtViZmp7xu17VyZyB7bVrxLCFz6jVDKThgcSfUFWdckpjQQZ2Zhm8xdMX9Q==
X-Gm-Gg: AYBFou3kQCA2Lnc+b+8MZM71XN6LRj22ZZyo5acJLbjQ30jKSize0AfMni0uSXjCdgN
	lHY/C/pfGd64fVletAeg+Qmlla8B6EmUg5FrSUmwsMNmL+8lqPOpq37bAGZ5LyT/3Jg3N0SOHGQ
	8g6BBwwjhVnH1VEVAr2TmII1tcl1zKkyeAg4spuLRxH/J8Zfxe9cyipMiKZ+TNwYvvxSdHBOmux
	y5uwytWQjLZrN6qx9yg2TT0scf7O0WAy6noUFZ9kT/gE3bo+UntGGIZZVwbwHqNIXtlQFNk7meV
	TDuFxKxSzu524JXQVkbuF9elWt8ctixebSK0yGE0Aquvd5xM6l6SXQmyqwRGBiknRUmk8ykNt/K
	hRET0udmy69MiF3lLI5WmSwIXWW516XoX2FOLHO0DPBShQSmjmRekldvqr/EAr7jaxp0O/E+o4a
	hXNwGO8/qna+EdJTwRXWdZBQB2wSZ5leVIkCHLxLhzXRRkT4UBtosprur42lsQnge9QGbpOSTjc
	ee2VXuE5cf6j9KE0wLoy0dt59PFilLkOEeGiA==
X-Received: by 2002:a05:7301:5f18:b0:33e:d4ae:e10e with SMTP id 5a478bee46e88-35111552a86mr1003826eec.40.1790982441123;
        Fri, 02 Oct 2026 16:07:21 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:b0dc:e72e:e96b:3323])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-351143b577bsm702253eec.15.2026.10.02.16.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 16:07:20 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-kernel@vger.kernel.org,
	Fabrice Gasnier <fabrice.gasnier@st.com>,
	linux-arm-kernel@lists.infradead.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 1/5] PM: runtime: Only queue an idle check for RPM-linked suppliers (part 2)
Date: Fri,  2 Oct 2026 16:03:05 -0700
Message-ID: <20261002160309.1.If69ddc515c2e9fd4338441e87688b9d690d2ef36@changeid>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20261002230714.507921-1-briannorris@chromium.org>
References: <20261002230714.507921-1-briannorris@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_160722_284176_F9110231 
X-CRM114-Status: GOOD (  10.96  )
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

Commit be5755f023e7 ("PM: runtime: Only queue an idle check for
RPM-linked suppliers") was incomplete. There are two other cases where
we perform idle checks on non-DL_FLAG_PM_RUNTIME suppliers -- in
pm_runtime_set_suspended(), and in cases were we failed to resume
suppliers.

Fixes: 5244f5e2d801 ("PM: runtime: Defer suspending suppliers")
Signed-off-by: Brian Norris <briannorris@chromium.org>
---
Noticed while touching this function in subsequent work.

 drivers/base/power/runtime.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index 655c0b8af095..e70726b499e7 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -343,6 +343,9 @@ static void __rpm_put_suppliers(struct device *dev, bool try_to_suspend)
 
 	list_for_each_entry_rcu(link, &dev->links.suppliers, c_node,
 				device_links_read_lock_held()) {
+		if (!device_link_test(link, DL_FLAG_PM_RUNTIME))
+			continue;
+
 		pm_runtime_release_supplier(link);
 		if (try_to_suspend)
 			pm_request_idle(link->supplier);
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


