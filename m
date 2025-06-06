Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FA2C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 09:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zY1UJXwwdXuV/sjsPfipNC1p4dsxIugLMJFfrvt+Ih0=; b=KpUCCYEPJi8oFZQdcasXTtOksC
	3eGGTTaxIvrb9O3MGEgB1zGd0uf+8g9c29VgIQIaqexeTzoQem0X9YoSoGtn1ZhtoBXpE680b4fkO
	82xMJsRR11bckg+s+XjU7IbUabfOIlLwy6xAS20qRfJw1hUTvxh5SaoW3p8HYa+aFY6JHovt8syT5
	BUB7eSxaO+Jm88xFo8ulFJxcoikeaBSOv2x2B74Ht5OLa3qhpFFQ2FiOeAdkfgcU+NDRdU6dZf9Gm
	GpS0Av/zTvOKYyoyM10+u2spEojYzQz9C7+MvBNv2XvQP1TE0wjR2HFBYQtuOqMM9dSX2hUqJAd6S
	K4Sd5EqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNT6F-0000000HUZ7-1CzK;
	Fri, 06 Jun 2025 09:10:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNT3c-0000000HUIE-42hh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 09:08:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749200890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zY1UJXwwdXuV/sjsPfipNC1p4dsxIugLMJFfrvt+Ih0=;
	b=e6XJqSIHD1siUHi5vyTM+HysXJkvF3BolSVY63rvVC4ENOCeUkqnaWcMcgbOp74X1w43tO
	qdZwzfYno96B2sCjaVrZHQZoSx6euXuEF+OQMBRk0wjwqBS5Ula65QbcMs9CXbenugWzK/
	ufPDwpKkoEhrcs9YSmI5xvDYp7eJKe4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-184-ysLb5-APObSWUlmR6RCSrQ-1; Fri, 06 Jun 2025 05:08:09 -0400
X-MC-Unique: ysLb5-APObSWUlmR6RCSrQ-1
X-Mimecast-MFC-AGG-ID: ysLb5-APObSWUlmR6RCSrQ_1749200888
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-451e24dfe1dso15132435e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Jun 2025 02:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749200888; x=1749805688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zY1UJXwwdXuV/sjsPfipNC1p4dsxIugLMJFfrvt+Ih0=;
        b=H4l9PFHrBOdUeYDYsXJnguJDvs12RkFNpfG9E47RL17Zu/96D1OSvbWkvlYoH18XfN
         Y8VHtK/F1xjTzh512wOntJwlLu+0RRGgFVf57rDl1nw70fcoLdeNMbo+BFHLWN9zOKoO
         y4NAB82pbXV5e+tm1mJ0SSCYP8cW6cGhrZL6EE29njYoQgaoyWQq4yk9wqnuROYmTNMB
         Hyzdy1qYVsIYqjNHfXcF4w3WKmW3tp5jATnMGZUfNo07FaUbUIK8l3ama5k579BI/smU
         67t2j2oc9KDYy3QYwf7oB9m7yc4ZA+wRWtCzMiHHjWRyEOmeqzbslC+LjHomRQjxRUyf
         HE4g==
X-Forwarded-Encrypted: i=1; AJvYcCUezxDMISwcBXYN53oHZFOx03vFsy0VAocsUBwOtQzm8rFUoOnPgzlYUYsO5MISXlAxlaEpVt6oTFgp2fBphXnF@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg4BR5YolxMR1QeMmyi9CvaUeaDdY+zvyNkz1AgV1MQGyZWFiy
	332TOi/WkfwsqKL/ekcr1FPTF4sOad1LPOiW8bg4x1t/ojTPHaDGvdZvBw6JthqOYzuVn9VCH33
	itanS+/s5nmrHEAbSotuLrLRhm4qS28PDZmFJIh5fq3c/NWrCGES0fqkTINqAAKb5A4mblQfIei
	sz
X-Gm-Gg: ASbGnctIli44Z86hRxnqjgRzf8+IDn6RNOnKuzcnQH2gYVBYYYtsNOrfc3mJlQXoW4X
	Ko5vUkvGRypipPL4jzWgWW2S+N79+/kXTy6qELeWTL3os7OvoI1VjjypJFXgPxzUsFsCJWuo0+6
	xjsRvbqk6umiweF6fPGDbJrw7l8C35enKCGvdSIOyLjvvSTk1d/1Pj1KgmIwyqZH8x+zrW6Di8k
	PLD7NQirzxc4AY4TNLuYZciVmqtmbN7moVHSU2RZRDr6NYPl8V9oVD1TLFlfPC6egqF4soB4iCy
	akOzspy0fhJ/ahSV+IkSOtb/FzNhbxKrqLfMbpiMbADSw/V+rAfqMDSVIf5UCbE8A5t2
X-Received: by 2002:a05:600c:b86:b0:450:cd25:e68f with SMTP id 5b1f17b1804b1-452014e9325mr24877545e9.27.1749200887751;
        Fri, 06 Jun 2025 02:08:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFgCfJhv5D4WKiJLVPtf7WFxx5mFScPGVIDDWdSB4TB7uCI+iacBtSoT4d2UV7tlwIeLe0gg==
X-Received: by 2002:a05:600c:b86:b0:450:cd25:e68f with SMTP id 5b1f17b1804b1-452014e9325mr24877175e9.27.1749200887316;
        Fri, 06 Jun 2025 02:08:07 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452137290b9sm17000835e9.34.2025.06.06.02.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 02:08:06 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Cc: Javier Martinez Canillas <javierm@redhat.com>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] pmdomain: arm: scmi_pm_domain: remove code clutter
Date: Fri,  6 Jun 2025 11:08:02 +0200
Message-ID: <20250606090802.597504-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yvk-QilnLEimbLKrkg6p66IR9BZAVgxvrp6zX7vxfcg_1749200888
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_020813_072834_BC5E7632 
X-CRM114-Status: GOOD (  12.00  )
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

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

There is no need to introduce the boolean power_on to select the constant
value for state. Simply pass the value for state as argument. Just remove
this code clutter.

No functional change.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 drivers/pmdomain/arm/scmi_pm_domain.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
index 2a213c218126..8fe1c0a501c9 100644
--- a/drivers/pmdomain/arm/scmi_pm_domain.c
+++ b/drivers/pmdomain/arm/scmi_pm_domain.c
@@ -22,27 +22,21 @@ struct scmi_pm_domain {
 
 #define to_scmi_pd(gpd) container_of(gpd, struct scmi_pm_domain, genpd)
 
-static int scmi_pd_power(struct generic_pm_domain *domain, bool power_on)
+static int scmi_pd_power(struct generic_pm_domain *domain, u32 state)
 {
-	u32 state;
 	struct scmi_pm_domain *pd = to_scmi_pd(domain);
 
-	if (power_on)
-		state = SCMI_POWER_STATE_GENERIC_ON;
-	else
-		state = SCMI_POWER_STATE_GENERIC_OFF;
-
 	return power_ops->state_set(pd->ph, pd->domain, state);
 }
 
 static int scmi_pd_power_on(struct generic_pm_domain *domain)
 {
-	return scmi_pd_power(domain, true);
+	return scmi_pd_power(domain, SCMI_POWER_STATE_GENERIC_ON);
 }
 
 static int scmi_pd_power_off(struct generic_pm_domain *domain)
 {
-	return scmi_pd_power(domain, false);
+	return scmi_pd_power(domain, SCMI_POWER_STATE_GENERIC_OFF);
 }
 
 static int scmi_pm_domain_probe(struct scmi_device *sdev)
-- 
2.49.0


