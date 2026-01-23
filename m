Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5D3D6CFB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 01:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8jIXagkMxzEowZbGtgfSPfOl3cdbEam+H5UuhcUy8Cw=; b=BQOFyW86P4aaeW9yQalPTQ2gMP
	chA1NCgIVm1VqPl9PFAgS7fymj/Izc1mzZwPKeqxW0uZcSSjaaZU9Imn2ZOrc/cBLaG3eD4kpecyD
	1hIAH0n5xAJ/vnlSRTB2qZFI1dMqV8LlQRBJjeDD1y6S8Jr+yX2AHDbuonzsM1BRjXDSCBQVYAFs/
	b80GH3Pl9tKPWLFo2zsz7NiAlRXf77mv1KEWgPnr4Uvf3srmcJ/HlBxuj4K0QMRxlGrDnuQzxePSb
	dFCisuhPn928CiWza6RdnwFDcCkyr0ojCnnrx6wFSk3O6ZhRnIKrVyIbIbBqZjR10rf15oq4MHu3u
	84q+0Mew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj5ke-00000007x4o-25ic;
	Fri, 23 Jan 2026 01:14:16 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj5kY-00000007x31-2XAf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 01:14:12 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-34e730f5fefso1208960a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 17:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1769130849; x=1769735649; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8jIXagkMxzEowZbGtgfSPfOl3cdbEam+H5UuhcUy8Cw=;
        b=SV5Hty6lQRR8HSS2wGEiMvqqvc1BKl4N63lvfoGfxFkePq6/tlW3eZfozSJXMqAHwl
         MpYWe4XLq4CV/wHdf8p5vykhGdRDViH/xd6cC62evlA1XUlVwbioVOjsQy0BWjqJUwBB
         dz98/gUr2gIdARap5nKkThxLc7XTN+vomDK/7y4MwQ/z30ivZMK+bfTAsjrta3MVHhcW
         GZW4LqZ0xrV+Sjz1QhuLsnUNFvqHtbaEytOl9qAtu5JJNIGfhM3Ski0lBVrjgx03AVca
         R8/oS5ZAPYCLKLWPHk1FsA2ry+L5DLFnRCNtR+mz/m6ntOmkmxQKd0pn6J0xgp4gh4Uq
         fbLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769130849; x=1769735649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8jIXagkMxzEowZbGtgfSPfOl3cdbEam+H5UuhcUy8Cw=;
        b=kZ1KKQk2psjcdv+SoRQiiENRWePDO+bINFHzQ3aXdJTqLSQqxGkWsueu+wNzhOn/PM
         yzP3an/aGQJEWpr7Uxd/uHxPo5AeQo/FCT3qkmOi7vUiv4kEnxSApMdto+xpoceW/02P
         eUKKaTmJ6MdAeSaKBnQVVun5ReF8WX3LvQdSZa4fnx2ZjevzqouvM6YYkd0XH7lZhLSD
         OUfXiDqtHLteouo+z0s1Rk7cEytchsowmrHfUPQJCr0K5g2VDAYHR/3tsRFAotCpJmzV
         VZD+/oE+lBm16dR1sjmmaS/8Z/he6uD+d0ODuCWAznfJlqVtXbErQC6d/Vpi+9tEY4xA
         GjTw==
X-Forwarded-Encrypted: i=1; AJvYcCWoBpD/dqNZtvMevkUq5lYZiZXqcVYCHJUsJWs+ncIil5yMoZF7NRjLh4d5feNfR2N9HrjUJgt+5uuEA+DnkqsP@lists.infradead.org
X-Gm-Message-State: AOJu0YyTOP4AYRjYGQEEwtiG9sl1p1WouHubHtZNsfxL90Wf7dWjPAVw
	cca441mM4a6Y4cazpnDNEn1GodSLYdEvodg4gwx4YqZ7TsbDY4f4JacrXdBC4JATZFZaJM401oL
	BIy/InCA=
X-Gm-Gg: AZuq6aJL6e0TSkRPNY8aSMVlL08b+OJKCHMBTgURq8cTzWWqeLZaOB/TuRV2fopZR2S
	pM1Lt1oNgkp4w8S+sUeoIwt0aQHdD0Bn7igWIOGZLtMiX4/9qNQr8uTOiAa9Mx85KcV2k05ydRK
	T1j3uXdscTMbmf8N4Ty0S5g2fjV9De7U/yezW9HH7zgJeSAM3N2l28oBu4p+pYpLOsQlG3zHBWq
	QrZbZAe/NotjirxwJOTSEeNO5qh632yHeL5n7HsrzW7a1iH5pl17WvABlQEOtvbg4IFjmLM6QAY
	mdnzRxUhrnZIWLZHBUGxM7CwtZ3ySlzNcLEe+BNm1D7/f4YD6zPi1WU4m+m0mr21kLi1HllDtDn
	Ym6maGcv/3Esdw7P0X9rBcxVWIM35X99yfTytj2NQdTrVR+nXqha7LQo1uAGug+ifyXhJ5gWXI5
	EnRH2Rl3MY
X-Received: by 2002:a17:90b:3a90:b0:32d:a0f7:fa19 with SMTP id 98e67ed59e1d1-3536894c5e5mr1159857a91.17.1769130849520;
        Thu, 22 Jan 2026 17:14:09 -0800 (PST)
Received: from localhost ([71.212.200.220])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35335205a2fsm3478280a91.2.2026.01.22.17.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 17:14:08 -0800 (PST)
From: "Kevin Hilman (TI)" <khilman@baylibre.com>
Date: Thu, 22 Jan 2026 17:14:01 -0800
Subject: [PATCH RFC v5 2/2] pmdomain: arm_scmi: add support for domain
 hierarchies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-pmdomain-hierarchy-onecell-v5-2-76855ec856bd@baylibre.com>
References: <20260122-pmdomain-hierarchy-onecell-v5-0-76855ec856bd@baylibre.com>
In-Reply-To: <20260122-pmdomain-hierarchy-onecell-v5-0-76855ec856bd@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1346; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=He+aEhwIQiKMM6RZOhPxZk8LJB9l4Qy9dfY/jCduGYY=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBpcstetXh6fJOBD4eHHjr+saQFKxgmd6v0zRhkf
 ug0omaqIIqJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCaXLLXgAKCRBZNxia0/vG
 ZQIgD/4i6Uc4w60OsIRYYqeP8oLa2eb6CzQU8aLVsNoiDPuv5uZnYUTHquh3eLM04pOyjyL938g
 jEvUGJVhqeiMw8clJVY3pP85aE6pIqEHRh4MtNLdHFbzeMVmk7jLxOO37wW3lO6HjPj/fOKkVlj
 0hZ+eWyeo0DaLjAv20+LezZ47MUqkgRenx1FTRbkul4dY7+EvEunrgq0CW4xeSz1erh3GKCMjp3
 xhUoU0zK7IaVczg3aPfyJcNVWM2CYMxpogkEQrN9GY8tVpRRQ8k4GdjZ3y1FDHnIUCQ/XH1c4Hn
 Ep2a0POgfv0x+p444bxRdhFrasXjYcab98iS7YT90j4ONuBxfpBeQwoJRKmmpCAZodwhQMjTfsb
 NKLq/J6fZDebRb0SJvJFqq80Sa7lb6XMZpOa/jgC3vL49YUrfcv9HEUyyxyb1s+d+usdDq/F6oy
 4TeuublXmf/HOY/u/Rc9CgQoBGjNuE4vNZJrf7i+JN0snIoHtb3es1oe4QsQF0MwYQra7G4dbAA
 0pyJeB/CjLJ41MmMcQ/FlF7CYfFxLOCKv+4AUnzrBBdQj3A+xjQbMEkxeAMsOmFGA/S1AMLN1hQ
 w3BjZGZkqJ/HIcunTq8hG0EZiT2dbl6rSz9o0Hn6GIpNKMvsRCHHaNDewPA7Lwu3+Q0MDXbzeMq
 yGl7x/R9Wppf8Pg==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_171410_647952_3981F87B 
X-CRM114-Status: GOOD (  12.17  )
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

After primary SCMI pmdomain is created, use new of_genpd helper to
check if there are any child domain mappings defined by
power-domain-map, and create domain hierarchy.  Also remove any child
domain mappings when SCMI domain is removed.

Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
---
 drivers/pmdomain/arm/scmi_pm_domain.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
index b5e2ffd5ea64..a52387c45d88 100644
--- a/drivers/pmdomain/arm/scmi_pm_domain.c
+++ b/drivers/pmdomain/arm/scmi_pm_domain.c
@@ -114,8 +114,12 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
 
 	dev_set_drvdata(dev, scmi_pd_data);
 
+	/* check for (optional) subdomain mapping with power-domain-map */
+	of_genpd_add_subdomain_map(np, scmi_pd_data);
+
 	return 0;
 err_rm_genpds:
+	of_genpd_remove_subdomain_map(np, scmi_pd_data);
 	for (i = num_domains - 1; i >= 0; i--)
 		pm_genpd_remove(domains[i]);
 
@@ -132,6 +136,7 @@ static void scmi_pm_domain_remove(struct scmi_device *sdev)
 	of_genpd_del_provider(np);
 
 	scmi_pd_data = dev_get_drvdata(dev);
+	of_genpd_remove_subdomain_map(np, scmi_pd_data);
 	for (i = 0; i < scmi_pd_data->num_domains; i++) {
 		if (!scmi_pd_data->domains[i])
 			continue;

-- 
2.51.0


