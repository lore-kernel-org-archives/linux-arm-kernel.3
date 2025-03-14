Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8176EC35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 10:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JE+q5aCnF90doB2QrACuAQ2CKvBByABqrTNx0sOx31w=; b=jMpjZ4yml95Y25hRWrnQiHcrd1
	5RrouvLNy3Jp4Kph4gA8ewuOXnalq/Zc38IB/ZX4rfRRjj2nO2jVD+77lz2xj9XjK7V8FFm+vHl9M
	facOfv6An/PjZE9Eu9KHfqckIT/b5+9l6AYv5MSXaLhlQucd/pd2rQJzyB+Jh38tqgIjyHPfaBGe4
	Q69+Gp5QpZAJv0cnNC9Jzv47H4QKUYlJLVUKBcv09XY7cpjEzMJ2pW5qmUL7DuwpzA/mY/uQ6Ay6U
	ozvyTV57mouZIVWAOs5bKS6wzYxWBZdiQgP6qjdhD4qmbdW+nVfIwyxIbi8dzWaokGBneAmtmYCXt
	sw9lisiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt1yM-0000000Dmit-2stH;
	Fri, 14 Mar 2025 10:08:58 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt1r0-0000000Dl2a-0FPr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 10:01:23 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-30bf3f3539dso19089131fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 03:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741946480; x=1742551280; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JE+q5aCnF90doB2QrACuAQ2CKvBByABqrTNx0sOx31w=;
        b=FgrqF4fwbLz1EFstVAxaYxFNpHz9Zf+Y+0hXuh526zKnvPXro7ujhBW3zHnIoK4MrG
         a9qVFXNS9sj0K6sg/ki/AqiCpXHB17HuaV+4RSvFHwwqFOG58my+4MQwWVDcBYTSG+NR
         O1RaFnP+ffmqPTaMr5Aj+rllSOYh7hFrH7sF9ILnZutVgqCH7oKftKjEHtYWOg7RVzye
         86BG5QCuJvI5orN+2tz83SSiXwPiESG2bDZJxWW7VWUHR7o9+32kdY/1RWhIZ6/KTJ9C
         PGuMtP9fLP2kIZq88sZQUfi2VgJgj5VAeEzjdBwdC95r+RZJ3YiWkEV3q91jw85t8OP0
         Ah2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741946480; x=1742551280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JE+q5aCnF90doB2QrACuAQ2CKvBByABqrTNx0sOx31w=;
        b=P6QJxtEIQ87Fxn2eCM0IJZgfZ/pcNDo96blnInmcrPwzClNWSV+8oTxI3/T0ba5aeP
         GYFvGQ12u0nkF5BJlqmmKD831rEpLYGaz7zi+GZyNhPmEZIqZJSs3xxO2Sl8o0lBv2Dd
         Jk5XmP8q/GQiy1pXXe3rXf++hzwkV9muAmKW9/8xdTMJUC4AntddURsw5lJ2JgUxTeKL
         P0Eu3hsX/zl9k9LV60BwEnyRInqAGuxwyUC00Mx+IYjZgtKtvnPza45sZJN4YKH6EAIB
         nUN4Hu5K7T9EvOZidAPmPHUdCafS3x8GIat/Mwh+bkT/Lab8qiJMZnL83IJdpUhmGZ5L
         JvhA==
X-Forwarded-Encrypted: i=1; AJvYcCWN1G+9aUE5GX14WuZbIE8fyaMryY1oxUrUstX17KG1mMjtD409wPHbDFXZGiRbdfUPFnkqyh+i577V1Ri9hK8x@lists.infradead.org
X-Gm-Message-State: AOJu0YwmfzowbEt7GLjSEa2q+D8cCNc3YRneA+itovWBjfjNZ0MKJJu5
	Bl3JWrxur0eBPyNLrTnfb+Ng8FWMGalTAefd9FgYrsxC7U3dVuIwTw5RvaghidQ=
X-Gm-Gg: ASbGncsm12bwYqdL1Qmu88OQ/qNQgO/Tz8ucYlelWSE967ijtc4pFuNX6lLEFkTA0iw
	r0m5Tt4iCBh+O1IKsbdnAu2bCQUqMs2iCxdWYvU4gXDXQwJqJBDjkCYEP8/167s8rIFnEC+ndg9
	opijSbtkddTYhRDwp6hjdMdDhVpT84MoMtpGnY2VOGbWKocnt0thhZpyficx5Wp2bl51V3kjJgS
	mlWrgpgsy1SLYlmGMPecsE5R2Xtl/fOtfJPStJC0qqFxlPhjXSdMuvtgQNE91s482kWW5HEGGiE
	xjoaL7btRsPv9YwVMdzlfn3NL27S6XWUW5fslmLtTGc+Evk1igiFZhOb8QDX2vxrq0pcF1Y+P4c
	KeUSxngRNCBsBt/u9vWQUnTxnQKlg3g==
X-Google-Smtp-Source: AGHT+IGhYmFMbUeatQB/z6JS0kcTyMcIT1IzBAPuh4fApk2bCc0yDwcZPgTrJD62ufz1WRxkinRL3Q==
X-Received: by 2002:a05:651c:1501:b0:30b:c36c:ba96 with SMTP id 38308e7fff4ca-30c4aa7711fmr7127431fa.1.1741946480268;
        Fri, 14 Mar 2025 03:01:20 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0ea468sm5168221fa.41.2025.03.14.03.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 03:01:19 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-pm@vger.kernel.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] cpuidle: psci: Move the per CPU variable domain_state to a struct
Date: Fri, 14 Mar 2025 11:00:56 +0100
Message-ID: <20250314100103.1294715-3-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250314100103.1294715-1-ulf.hansson@linaro.org>
References: <20250314100103.1294715-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_030122_098021_85053072 
X-CRM114-Status: GOOD (  14.38  )
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

To prepare to extend the per CPU variable domain_state to include more
data, let's move it into a struct. A subsequent change will add the new
data. This change have no intended functional impact.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/cpuidle/cpuidle-psci.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
index dd8d776d6e39..1aff1ec555d5 100644
--- a/drivers/cpuidle/cpuidle-psci.c
+++ b/drivers/cpuidle/cpuidle-psci.c
@@ -36,19 +36,28 @@ struct psci_cpuidle_data {
 	struct device *dev;
 };
 
+struct psci_cpuidle_domain_state {
+	u32 state;
+};
+
 static DEFINE_PER_CPU_READ_MOSTLY(struct psci_cpuidle_data, psci_cpuidle_data);
-static DEFINE_PER_CPU(u32, domain_state);
+static DEFINE_PER_CPU(struct psci_cpuidle_domain_state, psci_domain_state);
 static bool psci_cpuidle_use_syscore;
 static bool psci_cpuidle_use_cpuhp;
 
 void psci_set_domain_state(u32 state)
 {
-	__this_cpu_write(domain_state, state);
+	__this_cpu_write(psci_domain_state.state, state);
 }
 
 static inline u32 psci_get_domain_state(void)
 {
-	return __this_cpu_read(domain_state);
+	return __this_cpu_read(psci_domain_state.state);
+}
+
+static inline void psci_clear_domain_state(void)
+{
+	__this_cpu_write(psci_domain_state.state, 0);
 }
 
 static __cpuidle int __psci_enter_domain_idle_state(struct cpuidle_device *dev,
@@ -87,7 +96,7 @@ static __cpuidle int __psci_enter_domain_idle_state(struct cpuidle_device *dev,
 	cpu_pm_exit();
 
 	/* Clear the domain state to start fresh when back from idle. */
-	psci_set_domain_state(0);
+	psci_clear_domain_state();
 	return ret;
 }
 
@@ -121,7 +130,7 @@ static int psci_idle_cpuhp_down(unsigned int cpu)
 	if (pd_dev) {
 		pm_runtime_put_sync(pd_dev);
 		/* Clear domain state to start fresh at next online. */
-		psci_set_domain_state(0);
+		psci_clear_domain_state();
 	}
 
 	return 0;
@@ -147,7 +156,7 @@ static void psci_idle_syscore_switch(bool suspend)
 
 			/* Clear domain state to re-start fresh. */
 			if (!cleared) {
-				psci_set_domain_state(0);
+				psci_clear_domain_state();
 				cleared = true;
 			}
 		}
-- 
2.43.0


