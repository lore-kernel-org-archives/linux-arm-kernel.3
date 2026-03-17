Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D09FB5EAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 14:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+cvkfko3JSBcZ3yQGwkpneUFUeWMGASvUnUssQJCU9k=; b=bWgsEJ5uo4Y/wyFy7Phh40QEc+
	2h5bpMLDqRrvlmguJdTqAQH6DbYY0clKJ3v6qXUFxuQywyJqv7kcvZiXYhS/rNyaGYRDToRvEFDbE
	Kr0C6pjbMuIgweR55E/L5BFPvPXV6F9VreQZ+eLW4dravfcAQ/32ocbuOdku0HC4iaXPyO44151KO
	zt774LLAcHjvqDe3YPXli/iIjY9R+h0I4CmR8D/1JfC4/Or/mV9bUKaQlbqOMe8IJHbKYTMSyNBwM
	ZxaBXspxTdPV+0JgNPjB09u1A2Qfzc9DoQSzD2VTkP/j5Jm1VqHwHG/OekIY4JFHpE2Xd5/7rTIgf
	cI+9ge4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Vb8-00000006dbV-2rVp;
	Tue, 17 Mar 2026 14:40:42 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Vb3-00000006dZ6-1qFN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 14:40:38 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b976536806cso754143566b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 07:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773758436; x=1774363236; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+cvkfko3JSBcZ3yQGwkpneUFUeWMGASvUnUssQJCU9k=;
        b=StzLaiGo9l950tROVvkOZY4jwNHEwT7qjBgTvmeJN7xOugEUozsYyn+JodOeHglkfm
         ZRYW+/dW3qiSXFyuT/MrGtD4KVyMsqmqffukV05aZNYINByhDbLR00zu3vJgfk+HevUp
         Y7RmalDikueTtUboA2iynrfhutvtXNSrkZsOYiflTzHSzT8EdgxWJoPfyia0DW2ctk9r
         ykujgDnUdvWnZU14DvLar/QZepdGGZrAFoQqXkZTKRr6tmHwl4YtFMnHVJFgPVNr5MDL
         jGuCu1MtgDhUsTWEcUt30XfabdWRaqwF5fG4PzHtx9I7L/olzxrihMe1eIJYnYXHBMTo
         jawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773758436; x=1774363236;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+cvkfko3JSBcZ3yQGwkpneUFUeWMGASvUnUssQJCU9k=;
        b=Cdh+una9/lnvL1RBQt81qmYSKfOmdqm9oI+upUHKqVKgtYernUsmMPUZ42Q37B+gcx
         GLkKCr4R6wjlgSxK0DPlPnNc8I7tCH3j8OSSktQgELmnmlWWT/gygnfHzpAjzhMTxMGO
         WW6UzPfxiWVKp4ODSZ1vQCGhOzoIdyVQEcf4wE9az5DJ609gRscsEC+eeXLWTMFKoZ5A
         59kvvc+yWZU6T+cpB+uBd4FMFUqyCwj4xtuMuvBo1/G5Lp52DVNjA4TxA4lbItyfu3xz
         Wft+nWkLM05a5/vXfQYg2pO0p0TlME4NLSUb/+BqbFuBOOPFtFJ8zN2xHyo+HEQXt8px
         oK5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWk7Gf2t6OLrPpD561ZvRgfGlRiGvO1S42LblrULyNJazLxTlHnZmWxm4vCuz2YdWmkDdNj8thdmippcNcMWGTK@lists.infradead.org
X-Gm-Message-State: AOJu0YyqruS8RwVlZBhKc6jGSO96KHux8onYHgRw9BNZ5LV6qJow69cm
	TwoQoNi/Xuxl8lKm2nYMmseZYFAkWVpvTJhCUNGGRDw+K9wbMvVD7h5d3ADOGE8sb6k=
X-Gm-Gg: ATEYQzyj/V/k1Zl6DyFS4UIQIEej7psIE/Cfcep7MhJAbzbtRoTt9eLZg71zKjOafgl
	gQ6Fcrcj6CSVPgjBE8Wji/x1oAXNTuYWCaS4QBuExkNEjsPFHZKfVW1fbht6e8l+FxTZAYDNLRe
	D95wSDVwntAPSADih3PgZtTh5qRXu5q4XBvxnQohpr2DzFoKJkkDtLwQPgmLrKx0POToqHfLI/S
	qa4du8J0iM/QmlUyG0mNkhWXbcsb3qQ3fA3X2kSTlqaXNXivl09FcHBMfmcSunceLUra83o9Wq1
	5+E0BfJWw9x4R1/aN6KB/wjzT7wC6kKYEhZPwngo4iff2ZmYmDy1feElJDS657uAStB8APQZpnt
	JscKeMsLr+C+KZ4vkGkMd5UUUYfI3XB09fIxigSuKzIDEkUJBb0Vje6VHbY0KZOmzF5z0MV/kaO
	9kDtotBzOPZXMxsQLJAKt08E3jP8c1
X-Received: by 2002:a17:906:7316:b0:b97:ca81:e89a with SMTP id a640c23a62f3a-b97ca81f487mr416217366b.0.1773758435746;
        Tue, 17 Mar 2026 07:40:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97b7ce8587sm401567966b.26.2026.03.17.07.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:40:35 -0700 (PDT)
Date: Tue, 17 Mar 2026 17:40:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH v4 3/7] pinctrl: Delete PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS
 support
Message-ID: <2142deabc8183595c582fa44dcca6b5bfafebaaf.1773757772.git.dan.carpenter@linaro.org>
References: <cover.1773757772.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1773757772.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_074037_481969_9F7333AF 
X-CRM114-Status: GOOD (  10.60  )
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

The argument for PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS is supposed to
be expressed in terms of ohms.  But the pinctrl-scmi driver was
implementing it the same as PIN_CONFIG_OUTPUT and writing either a
zero or one to the pin.

The SCMI protocol doesn't have an support configuration type so just
delete this code instead of replacing it.

Cc: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
 drivers/pinctrl/pinctrl-scmi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 5d347e6b2e4c..de8c113bc61d 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -254,9 +254,6 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	case PIN_CONFIG_OUTPUT_ENABLE:
 		*type = SCMI_PIN_OUTPUT_MODE;
 		break;
-	case PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS:
-		*type = SCMI_PIN_OUTPUT_VALUE;
-		break;
 	case PIN_CONFIG_POWER_SOURCE:
 		*type = SCMI_PIN_POWER_SOURCE;
 		break;
-- 
2.51.0


