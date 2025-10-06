Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D57DCCD188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 16:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ioPTwS2f0Ag/7Xgv7v9kcfqmqd+rCK/VtVviQkcgWcs=; b=AGLn0ZXBuavKtiLJxjm/iZdgmP
	b5IFA1RxiaBUpUb4GQBP6sQ99Zc8bIJu27VzOJq8tobqPo1lRECDrRE3UEVQ+RWUuncbUsYKLXode
	3mgmdCtj1f4+LbBcHNW4Xjz0k2MtweVxmE/d6s6VGxsPcoT6jeKjWEg+ikdnWRHxeZmNDWlviAgEl
	JX0wWgofStUDDiayyBRMDTHXyfgvyPQRdNgYt8o9imbZwdY6pWIPDeRJgRwUBYV7P7yyQvhzmOpUL
	POtmvXcJY+txKtYG/XSBvhP7A8ejppN7OYai3ir4ST+f5B/AXd70sF6v9TN3Gx2oV1f4gLCtwqFGM
	tIBlAjJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5oJJ-00000000Qbf-1zG9;
	Mon, 06 Oct 2025 16:43:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5oJF-00000000QW9-4A7e
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 06 Oct 2025 16:43:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ioPTwS2f0Ag/7Xgv7v9kcfqmqd+rCK/VtVviQkcgWcs=; b=G6lC838pyzc4DDfoTFr/vWjNhh
	QkbNqTFcxY/lYCwKDPGpd/5Ukz9e1XePfSf4ECZohZHXkisgoB8MyMli7WljflRRZBAIf4bKMG5BU
	XVhZ2uuGWxVX4AW0zeqI0KBwD1rnPfXbjO7YrM6etoTAR8Ko5Amz1RA3V9DqwVgiGa4AyyiRev45E
	lLcyaAQtrje2z4hwFL/Krz9KcthR6f8AVkwjZidsyb4Xr8CJWv9vEU81ApO9kg9/hXjpGddxwIE3o
	AZXWBThAF3xvYvUKXnv9ZuGfE3Dbx/Vtq0oFXK9WbvA2AwBdbH/UIHZxkrEmLY0cx7s0tne487f9D
	xmw6CLGw==;
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5oJC-0000000H3Br-1nBQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 16:43:36 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b4736e043f9so924384066b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 09:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759769013; x=1760373813; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ioPTwS2f0Ag/7Xgv7v9kcfqmqd+rCK/VtVviQkcgWcs=;
        b=ZCplEErroKSmYaXlThavhcXxzqdG7/rXJ6CucR7KAu+usIwbVzpVeOGoeBCmzry9GN
         48n+wUHsh2dVtMPzqv+2/9wv1vi/wNBU3f5B6sppvOwIie+n/YgcciTJEJW/M3oXM3OS
         ztQR1knVb0iv7h890r48AsG2LQY4n2BHXvhUuSCdTlpGtVGhEiIG0vcqDrAmvxbVardU
         7SYynUEm5d0ncps0P5QqapGosFTuKUDo2QHIlj8y7Tbo2mniHCrXRESS+f7JArvjVtQm
         5VBKr5aRXEYgns3ghxLzMAIf/yZL2xAFElt+Gb2BRbHDMYB7ZvTrsCZIyIIujTS7VUSr
         OLRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759769013; x=1760373813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ioPTwS2f0Ag/7Xgv7v9kcfqmqd+rCK/VtVviQkcgWcs=;
        b=UH8IHG40dBZdcvernU6j8ujT79uxLE5MbVLlZ5qJ+pWddLQPrUOq9+0rVZ6qw6YB3O
         0F0km3DcP0B7zNNL0LxPgcnU3w9haX0K+Mt2KXbd0YqGw63u7pmyVUKyTVrLkdGfGRza
         p0FzuoGrC7OBVMU90Zo+bod6s1Sa++u7y70bJEix8AzydBBywBiECleVuhh08q0yd9dV
         BvbWFMop167pZ4rSs8t/CuHwkN5tiTpjaoNEcn01Y5k6SfRsc7izLmZ5M4hgKIs0l4Un
         FGwMFqhAEm5t823UhjpMMxCGhGjD14qXO0KOSzXXtaVgl+Q/VB6qKujbJBqIZzpaDDPj
         0EqA==
X-Forwarded-Encrypted: i=1; AJvYcCVwG6l4VBP1Euc+W5BoYTZYY+d7/Ub6pFPwnSfR9S7tzkMAi4k54ApgFW7Yqzcid23PiEfA6VJTNyBPNYklLI/P@lists.infradead.org
X-Gm-Message-State: AOJu0YwUk1VpRpOVYy7OP37ZbinAGdvP6xLzeUMippqu9Rg/brqJDP5s
	ZKlllCIAN7u74D84UQBsFOIVPQnXGS/Iwct9JgbFp6jKxhdDKKlfABT6D9F52tvC43A=
X-Gm-Gg: ASbGncs1orE0+EiSHQXfFd7W/O3rhgsytZTKW0egg4/Ibu57/254dNtuQOVIh0iiLey
	W/kGehtXXalTCVC1twOsI8vpoI5C8M5D6xWdWrYCRM9gZOt6ymJ2HX7tbwcdV9Ep7ESeBWHbtAh
	KYzJY6gKPGq2UVXRa/4IVgNW3744Sp7bQnE65ucBweby8WMIuywRhwM524qJjrlYQ88rxNz7ggT
	jrJd9iSqsS5BcwXC6Bd1AHYcbhJJjcMopZXd5fYYJGxhkaAlz+Mw+n+NTFVf2P2snhsrvAgh5jk
	CHpEp6AcJNH4VL3ELrHKnOOgcWwy0N3Bc+hFxrTu2YwYvwnKn6eEr2ti0k4vrKpZYi11H5yxA24
	hvaVJOKAN2Npq5Wc9/gphGYeaJVoAFbmbwlpu1Q7JclBNGyHbEyHDmIAhDcjWE0pgxmDNMxThqp
	f3Y9N7zZebsQWbsbdV9HXnYZnMyfxllYnrECmJ1Smppk55SivVwn4=
X-Google-Smtp-Source: AGHT+IE5SECCGzL2stnGeMyacolLo8BRZWSL0FXQl2+Uco37ci1RopzDCJHNu/u5f/tWpHXHwAHqpw==
X-Received: by 2002:a17:907:d90:b0:b3c:3c8e:1896 with SMTP id a640c23a62f3a-b49c47ad11bmr1593290866b.42.1759769013168;
        Mon, 06 Oct 2025 09:43:33 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652aa01esm1193841866b.2.2025.10.06.09.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 09:43:32 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 06 Oct 2025 17:43:36 +0100
Subject: [PATCH 10/10] pmdomain: samsung: add support for google,gs101-pd
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251006-gs101-pd-v1-10-f0cb0c01ea7b@linaro.org>
References: <20251006-gs101-pd-v1-0-f0cb0c01ea7b@linaro.org>
In-Reply-To: <20251006-gs101-pd-v1-0-f0cb0c01ea7b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_174334_617568_510B1915 
X-CRM114-Status: GOOD (  10.14  )
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

Compared to other previous designs supported by this driver, the status
is just one bit. There is nothing unusual here.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 06e1b0eaca18205a549c8e8136ee15279eb3089d..9e62da2162884fbc1f4b3809cdd89181fb534095 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -81,8 +81,15 @@ static const struct exynos_pm_domain_config exynos5433_cfg = {
 	.need_early_sync_state	= true,
 };
 
+static const struct exynos_pm_domain_config gs101_cfg = {
+	.local_pwr_cfg		= BIT(0),
+};
+
 static const struct of_device_id exynos_pm_domain_of_match[] = {
 	{
+		.compatible = "google,gs101-pd",
+		.data = &gs101_cfg,
+	}, {
 		.compatible = "samsung,exynos4210-pd",
 		.data = &exynos4210_cfg,
 	}, {

-- 
2.51.0.618.g983fd99d29-goog


