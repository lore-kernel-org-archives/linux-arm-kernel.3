Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F40AC8303A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 12:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nhr1wJzX5x14/nTupeiMBqLBJv2X3ymsgvaInizlCPo=; b=Io7XQnXe/1FrssCRSUf0CJpc2x
	dqXYC3ulPNR6n2uzycR3bQ0tBOTv6Vhp4unfeXHINFxjG0b+gJgW84LdEsRwWxOIVpTon1iv32BJV
	Uma3F+Xo+szJOBaSk3bz2rdqzgtby8B4jLPHCTAGgQgzO41aafog+Rn9S1xtP4OHZhou6StjluS+t
	pc0Ey0xr2jSxYBGmrpwJfQXFOEodzsLH3JiYEfRJpZssVTYKWSfINduI7J2p3Oyk24YzjFKa9kBU4
	NKF/Rq4v8c8Ll3+QaB92h3Fy9k1VhTQaFF/62QwyvbBMSrZAJiZrHmTtqgAcRW2lF25sedCv8+GOy
	2qvXmfKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWa9C-00000005K1b-1PX1;
	Tue, 01 Jul 2025 12:31:38 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZT1-00000004ukU-1ekz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 11:48:04 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-553dceb342aso2910860e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 04:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370482; x=1751975282; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhr1wJzX5x14/nTupeiMBqLBJv2X3ymsgvaInizlCPo=;
        b=gdD5Z6mS+dtOoQMRpUnqNVMJBmOblKoQX8r02ysYbVX/UxhMAfOVJMuuV7rwku7oEf
         IL1EXIU+TZu6VN2NbieUJmfLxqU1tgtDoBJqemXFuWvCeSOU++hsKBLWURTBIPbr4S9v
         RKLHS2mVWngMo+FsADnc/RRR2dee/Uml+ZF4Q9ZEJgc2WwpG5QIfr9z0+Uv9JnEtve8j
         7dylQXZHX4EuZmeBb3BoxXSNVY5nt4ThLyi0zCgk6yZj6jIbVI5C+d6lGro+gUbRdJkZ
         l1mLVPoF270bM4DnmXzOzVtVPUIsa+wRzrPq5MjwEtSfkUSOTxyISkFPhb3BKG505ny1
         kUjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370482; x=1751975282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nhr1wJzX5x14/nTupeiMBqLBJv2X3ymsgvaInizlCPo=;
        b=TSViQdx36ZZmUrhJLbOppCOW8gQMZtQYro5Lo3v+bW5J9XbrhWOw+NhDvXkweFOjz+
         5RGi4A3pHdRp1e2k0FJA5XlZl9Hcf+3VcbpginT7MjFxmoKTKQaajMcYfSJtHhlFIxvj
         SO2faRUBi73Q1iimJ64J9ptP0CzFyXDb5ks9cMFEds0WRaqPlGYu43muIkW+52srmo3e
         V/pluJyNTDPy4N84vtg8XXVqNpjtlaNx7EaVuciL6evbwgCNAg/uktm+Q6KBIPCiGC4+
         epp4VbjZkTWVqcGDXMq1k4+XvyJ4LEPQeLN09fNjrSXzyZJB2IzFsccWM6C0z0SlpyDT
         iCYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFJnYe/nrOFKZX2TijYYyIQBzPveSpBmpGQsDyQ2VVVp68ADXMpm2Bb/3xTrkk8mRpMwdOCg21NIvtDCzWMqog@lists.infradead.org
X-Gm-Message-State: AOJu0YyRrxydpkA/jZI/q2v26genms9lTjUCrEDcgk/C33XblRYbOJJD
	Ajyj/sUgsUlWFEnZDONkBUtwisDgpb4HLryZ4CIz81BQ48cYJ7fKDTWTn/0otkrd1Tg=
X-Gm-Gg: ASbGncvyzX0VQlUto3ic/KEiLQEFv5QxUPv7FGmrn3MuJWjTEN/SnUCrqZUpEjUe1dX
	qAhlxEwHpvgd9qEYMS3eA0q6QCfXMKuOm6Km6VElSEhUD6bd+/QX4fAC4A8st605Krbu8YwSG4T
	qXAYQUFOo/cqfNlokgiJ/jMbrelSJbVgPbCj5/0SAGet+eNLxWyvjwQJJ38X+9PluK73sdmfLBR
	Szw/ZNn4v7Xj01+AScUkmV8gQbxK1U7zPbh0g7E923zznIp28XUse2KL1CUzbIDKBzsxHwt3VXQ
	yB3QLsw30k+w0rU/8Fvilo4zvg3I2aW9CoAbE245Tjag4L6OJpyBNB2ZAzrCsu0AmDA/L8koAZF
	zS7xKj2qI3pZnc3bQktOcW7AurLiewE3z0PtV
X-Google-Smtp-Source: AGHT+IF/OcNrgYw3hgtvoO/MekAs2AHo39DQa2rN3+FnsXniz31yfEH69hiNRp80adgJjRiNtdFnTw==
X-Received: by 2002:a05:6512:224b:b0:553:2868:6355 with SMTP id 2adb3069b0e04-5550b8669b0mr5326369e87.18.1751370481798;
        Tue, 01 Jul 2025 04:48:01 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:48:01 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Michal Simek <michal.simek@amd.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 13/24] pmdomain: qcom: rpmhpd: Use of_genpd_sync_state()
Date: Tue,  1 Jul 2025 13:47:15 +0200
Message-ID: <20250701114733.636510-14-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701114733.636510-1-ulf.hansson@linaro.org>
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_044803_436756_FF728EE6 
X-CRM114-Status: GOOD (  12.60  )
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

To make sure genpd tries to power off unused PM domains, let's call
of_genpd_sync_state() from our own ->sync_state() callback.

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/qcom/rpmhpd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index 078323b85b56..d9ad6a94b3ab 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -1027,6 +1027,8 @@ static void rpmhpd_sync_state(struct device *dev)
 	unsigned int i;
 	int ret;
 
+	of_genpd_sync_state(dev->of_node);
+
 	mutex_lock(&rpmhpd_lock);
 	for (i = 0; i < desc->num_pds; i++) {
 		pd = rpmhpds[i];
-- 
2.43.0


