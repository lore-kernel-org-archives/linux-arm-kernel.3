Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947D0FB5EAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 14:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QqAW8Lz8UGhU0wvIEqMX1J/fowDMs++jiY4h3lV2FoI=; b=M8gvcozsbd4Lauy4v/UeAlJrsO
	Wt4JU813eGgKFqJVRgBR4pE0PLPBmfxzKtB04NfPcmNWeuctmPqHpXW+VoGPdWVw4Rd9jAKhLT+Yz
	Wigk8E4os/qwCKzExfc8gXGbXsjvFKNnF7hMR88zeuZGUw7EyZDkX2WnaCZ7gz5fU6fMiObSsH3ci
	BfO55omQnAInDAcoEnjFYCd92qvdWGkYiS/QsfrrM2iHD75bASvoTJ38fh76SiwAnTAYqX4gAuLny
	QF1o1Dv5lt3fdfAgSsIDwmhRXienLWkXgMKRfYnU+vDkybAGOTWtIVYMqd3QoBwSmZImlPBUJ7zL7
	65cTGSwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VbD-00000006deD-0Rnu;
	Tue, 17 Mar 2026 14:40:47 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Vb9-00000006dbI-0sTj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 14:40:44 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b97ed4ad579so40485166b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 07:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773758441; x=1774363241; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QqAW8Lz8UGhU0wvIEqMX1J/fowDMs++jiY4h3lV2FoI=;
        b=kW/xzoJkIwJD9EKgp5XPDucva/pLbqg0m6iezFC0K79KNx0AvwXP45I8ofgSqbHMRA
         mZtbvesZvPlPP+oCazy8zJkGyW3WlpgWcLFaIikIRZfzJQ22Yc8vGyytXBB/8EJPW48n
         0zb66ecWsFNLmrkiyjk6TCl4e0gwKLxGeeP1ZpHTFYXjSXVGuuNTk+IctWsapruYqnnj
         m8dfYB8YIWuL5EK+6y2Yqfa1kWkrt7sZZf4JTceWilhGDjTsBSpqyA2ESGge5PCN9hik
         Bwjf20sSonLpIJqYeWdai/Ee6AIlSlZraf5i+HYLL1U0Fw/03oQwNAqV+mi5e6uXv9bw
         XzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773758441; x=1774363241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QqAW8Lz8UGhU0wvIEqMX1J/fowDMs++jiY4h3lV2FoI=;
        b=dKehO/uB8Nr7toi1E5ZoanXEeutjIs4tI+IXX63/2p9aaH27ndr6dfHl07KHVRzr4W
         eUgUhZoKGN2DNy+pMLSujSCzVzvfgioaNBz4yX1noVU7if9cQxncZ+GKIJWw+8LwHxJR
         dqwa//M2n4EM+gyqHYyjrFtTkDWWwS2DxtiPGJGSd3kz7q7jBi5Yc0aBvg5mjI2Zt9rl
         +0nFEcNmM2bUns/OA9VQ/nFqzGw5OwQ0zqzL6T+O5sgE1j32wgIMdpOSdAzFgrL9WGtJ
         WLGrrwlepqG5E2E9rROBGYLN82dLfCiuFTyp4mPmSEoOzDv/0yyWWbvXcoiW4fTw2j3N
         AoOA==
X-Forwarded-Encrypted: i=1; AJvYcCW5uyEcmnVm3/ht8YsfzyMK10rA/9ahCnag06C2gNGiDDL0RC52rof3VROSO4LnvRx4W+XA3oc3vqh//I3+Z8tQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzqnPMu0GInf5ivSGwxWy3PKO03azhztTijIBsOOvXMrozaC3KR
	rQt+WlLbb2QD7vtHA2QnANL9BupeF5Zsv14Fj97/4lzsqX/pAWUyj8o8rNmBo1WjYSM=
X-Gm-Gg: ATEYQzxNVhPgAzphr6Eub5vfWCLfHAK48vz4z3168FFD0TU2LOK/FxkuhJX6PAxqAq9
	zDGJtWnxiroBx0sMwROOaxphjypDRq5kV/4kuh+ouyt/qUEbcYmUw0NSnNPPuDD5Z5g+FpEG5aj
	VjMS4YihP+q9l6QEwheLGBsh2FnNyHGx91ZidmWpqEic1wNtg6Hh9R5AfLZdQVt9XpiorDDp4vE
	BR11Rc8mpjBAV18cW0qyldyBNAMz5KPCd/CzD85qac/ktgjjpn1Bq9yDeb9vzXW62QRMTqQxEJM
	nFIVDbt+Vp4f8Apj3YbcGBAk54HW+nxzlrJPBH0Kifw8dGnDEAb7xfk34BNJrGyegFjo8Pg/IK2
	h7ev4FyWQmCUX6y5/IdT2BPeIVC8MDJptR1D8TEusvH0fCSW8kIesxEBZTbk3apgCMlqPBYuOzz
	yODmfYw7QTAyuxa+noPNwFDgRMTl5U
X-Received: by 2002:a17:907:84d:b0:b97:7966:cb1d with SMTP id a640c23a62f3a-b977966d1b9mr848405066b.18.1773758441127;
        Tue, 17 Mar 2026 07:40:41 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cc220basm753466566b.28.2026.03.17.07.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:40:40 -0700 (PDT)
Date: Tue, 17 Mar 2026 17:40:38 +0300
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
Subject: [PATCH v4 4/7] pinctrl-scmi: ignore PIN_CONFIG_PERSIST_STATE
Message-ID: <10c43dfe5f72eedb259db533004acddd5579e168.1773757772.git.dan.carpenter@linaro.org>
References: <cover.1773757772.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1773757772.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_074043_283084_F9C3A1A7 
X-CRM114-Status: GOOD (  13.74  )
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

The PIN_CONFIG_PERSIST_STATE setting ensures that the pin state persists
across a sleep or controller reset.  The SCMI spec does not have an
equivalent command to this so just ignore it.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
 drivers/pinctrl/pinctrl-scmi.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index de8c113bc61d..f22be6b7b82a 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -361,7 +361,7 @@ static int pinctrl_scmi_pinconf_set(struct pinctrl_dev *pctldev,
 				    unsigned long *configs,
 				    unsigned int num_configs)
 {
-	int i, ret;
+	int i, cnt, ret;
 	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
 	enum scmi_pinctrl_conf_type config_type[SCMI_NUM_CONFIGS];
 	u32 config_value[SCMI_NUM_CONFIGS];
@@ -377,17 +377,21 @@ static int pinctrl_scmi_pinconf_set(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
+	cnt = 0;
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
-		ret = pinctrl_scmi_map_pinconf_type_set(param, &p_config_type[i]);
+		if (param == PIN_CONFIG_PERSIST_STATE)
+			continue;
+		ret = pinctrl_scmi_map_pinconf_type_set(param, &p_config_type[cnt]);
 		if (ret) {
 			dev_err(pmx->dev, "Error map pinconf_type %d\n", ret);
 			goto free_config;
 		}
-		p_config_value[i] = pinconf_to_config_argument(configs[i]);
+		p_config_value[cnt] = pinconf_to_config_argument(configs[i]);
+		cnt++;
 	}
 
-	ret = pinctrl_ops->settings_conf(pmx->ph, pin, PIN_TYPE, num_configs,
+	ret = pinctrl_ops->settings_conf(pmx->ph, pin, PIN_TYPE, cnt,
 					 p_config_type,  p_config_value);
 	if (ret)
 		dev_err(pmx->dev, "Error parsing config %d\n", ret);
-- 
2.51.0


