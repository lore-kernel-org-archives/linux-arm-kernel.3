Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 217FFC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 18:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AthMoz/AgoYLHvPsWwEymdR4bUCvaR6JITk6QxJBrPs=; b=HsQfwXNLfbuHKqC0fUkyG7WizP
	y9a/jbpo3DqFI1y12DVXGAjGrFTKK1udrs5VIkCrwcJz5tytkDdgyaMx4vPXlYwkzCCU/75iljSLH
	AceWQRqq+YDO0oggLfJHd3ockQqWSROJGMDafe5GHJCz5EGe0oY2dWc2D8SmV5E+jC1aydWNYI2Yl
	PWfbPHFI0gs9GkNFH17HWW3dGjxj5sbrZoq62+hkj/Mew6iRA7QUHxsN6k/Q/WNsjMMTZuG1jNMeD
	Pqku3tHCfkhXawim7zFvJki6eUKFSQ4nxYnM7NEPIa/CkSHoDtmWX+7s4NZ9z3IAGecAYm+fwzqFT
	gsWbPm4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x176t-0000000AKAy-3FxJ;
	Mon, 31 Aug 2026 18:51:59 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x176r-0000000AKAb-24Dw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 18:51:59 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-cc147d86bebso276132a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 11:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788202316; x=1788807116; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AthMoz/AgoYLHvPsWwEymdR4bUCvaR6JITk6QxJBrPs=;
        b=lBMAI0qyVhdmCwwKm1UM0WAy7cBjw9glyhzBHwMEjRJql8IMVHXfGT8n6/VzXAYNt8
         wnEQxJ6pP724dGxiXv5H37InT1Ar/b7Tvj0i3FbE+H2SifyXVwTU2goQNGVR8WrcnO/I
         VLla5+ypVuEhpo10KtgFKI1uWvhRyykuNY4L/gAvhO8GwNxTwh3b7hlVoBClzJjEqCGs
         ETFZi7ZvyW3AMutsZt1PmEjM4xGevxMVnrDHTX6V8U/EyBwgx0edQU0UDrJOnUteF6/5
         yF1PogBg/6WQTAL2+6KMk8sY1jAroz50xRHLS9EwurgsrjK6+jtetIt7rjwPHKdU3D21
         B2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788202316; x=1788807116;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AthMoz/AgoYLHvPsWwEymdR4bUCvaR6JITk6QxJBrPs=;
        b=ITY6sXnl2NR+TqRabUOjTSRZHXIHcvtLc/AbuoLB5AFU1XBKvu5z/SLalzjx9lk3Pw
         x2Et7XHdrYAVB2S/Btyu4GzZLEvxVv13nXvdQMNoLKlHi06A2YPLI9BPEv+pFicge0R6
         b0EYT+NTN/dRsDlplcBXYCyF4Y4WlbbmEYV/+dBIWLXeWv3YaOOCY1RK3Jx2NceScsxb
         ipXKoF632F5OWWItkUHdeJQRmQbeonZwfk0u6rSglpssFz0fN75SEFbVdrxghW1law9R
         1jvfJmLbovLfU5xKQa53uyC9CzMNUty+9NcuOPonMXmvTck2PZulwVdE2RXlIKh5h22f
         foqg==
X-Forwarded-Encrypted: i=1; AHgh+RpECqQY5e/v5o/0r54sQf01OT/G8iLiBwO38Cy5BtcRh++uAXpjz1kzvVIYTE8WY+cSlGe5AyA7YXOHgbpdXIrd@lists.infradead.org
X-Gm-Message-State: AFuF++le2rSNz5hODrzzD1uHPc0Vz4qulQehLuoGCApY7SWIr0QLtV3H
	6/V8yrttCW1qffE0Nq1yekGFuTyCT0gDAawsGZuGZq49f5/4ZoHKjBpfTq7hJE0AiDY=
X-Gm-Gg: AR+sD1092fVuDxHUrQ8dAL4cLttReShCcgJ/mlWoJdmx2RFZbtMqCxNGF+plQLAx3IE
	M9De8RzBfeE1ekxKEjPYTH3OyFTvGyc0Z3RVR5XFyPeXv29cohlrBxvYMEC0L42SdTs7+vbGotE
	xDXEE4QtqCAEfgdGI7Cf5buTbhS8DVJvUkRB8Yt7an4tZt5kdZYJcNaTMVUKpU75INUrJ3O+wa9
	+CgjIaZ+D3IOFoI74+oGPFz3oE5k10numbw72seYg+ZrBGbE/jaovWy3L67l7KqdhagGQcAmuYn
	tRKhSBwdat9IIlo51xoUQ/WJyXxE8hGNrwRKgdg/kOqFQTUUVvzq++5ylfSn+mr0aDKOZJkBWNW
	1ARL7zY4Qeq34YGfVrF2oHkoT1SPm7RQm8pp3XSyP+ml1N8rAn29whFiBidzVhhUtnP9sBBrsRD
	cTe8ahGgwTXf3Bt/2eTx8kBM0JznAdAMJT3rnexHeYXZvRsU+4j7oYJaulRlkLiTGby6J+
X-Received: by 2002:a05:6a21:e38a:b0:3bf:9bd9:cf60 with SMTP id adf61e73a8af0-3d816bf48f7mr264453637.6.1788202316392;
        Mon, 31 Aug 2026 11:51:56 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-cc1f3312146sm4820179a12.8.2026.08.31.11.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:51:55 -0700 (PDT)
From: "Kevin Hilman (TI)" <khilman@baylibre.com>
Date: Mon, 31 Aug 2026 11:51:47 -0700
Subject: [PATCH] cpuidle: psci: Assign domain callbacks to all CPU idle
 states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-topic-lpm-psci-domain-callbacks-v1-1-4a47d95c9c79@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAELNlWoC/y2Nyw6CMBAAf4Xs2TU8ohB+xXAo20VXKS1tISaEf
 7eKx0kmMxsE9sIB2mwDz6sEsVOC4pQBPdR0ZxSdGMq8vOZNVWC0TghHZ9AFEtTWKJmQ1Dj2il4
 BVaOGnHSth+oCqeI8D/L+HW7dwWHpn0zxm/0bnuclreOhQa8CI1ljJLbZWp8r9FRAt+8f/+q1c
 K8AAAA=
X-Change-ID: 20260831-topic-lpm-psci-domain-callbacks-a8af0cd7df35
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: Scaria Kochidanadu <s-kochidanadu@ti.com>, linux-pm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3203; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=8hjCPq9667fX+V+iDArjQoIU/4NOdMM/TkYRxWB89Ro=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBqlc1LhSNw7ZHa5daoTtWUSucRYeVlg1NKgX/Lv
 +fkTVpOXDuJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCapXNSwAKCRBZNxia0/vG
 ZXHbEACEedr/5CrU2dyNFywhe4xoCG2oZWYaMNNVedr2DV2qBNM/y8IPPDSmDW9eVGPE9Qx+UK9
 yfiT6WMJiyPXx2YW7Wqz5XT0NaoZ3RxsVMi0+0BVi8lODZpxVU3424FFFsxw/tJ6myEF03kCz1k
 zBgyc0EYPtIGpTZX7o0bCxmjZ6MHYhiGq7CZhI/TNrbkpHHod0QmGAHjc1cNJEAMS+eZ5VF4emX
 eape3/S+wLti5Td16kcoUAfkGlCh8YIU0Ju+Bir4tPx/rskaCmfF7zQAnTEsg3DW4B45g03kMaY
 xyzoyPWOX3FSlPXa5iVRXYla0G2AC+N5mjZjGXA/xcsdHsO4nxNm/MZ9kXrLT/kWuHCpXSO6pQC
 2La6HyJ4v+17QgAkkhZ3wFDFxbPk1J41tO9J4dJJclKRxDd7XmNEIUcPoGyvvmd9cb/fY72MKns
 IWRBRpXW7OXMTbFICTJgM7GYMYQ/Kb9LNQkGR15owJLtvgYsJjgrB0tsNKXDqyOfAZX4YIywqoS
 /HvYzFELx5HvyWCBzj9w93lqkqLCFV3a4MAgJocVA6h8d8EGIk9YBC6+LNNSV1koxHHh8icFy65
 Vnmn01ok5luOs7YVOHAr8OXHp0ysDdJU5eCllOwQJ/k5WoZ5TKS7+WBrQXs1G8O3Ftao345mjbe
 ILgnjOOeaWUwD/Q==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_115157_541607_0359A253 
X-CRM114-Status: GOOD (  16.87  )
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

Previously, only the deepest CPU idle state had its enter and
enter_s2idle callbacks set to the domain-aware implementations. This
meant that if a QoS latency constraint excluded the deepest state during
s2idle, find_deepest_state() would find no state with enter_s2idle set
and skip the domain idle path entirely. Similarly, during normal runtime
idle, shallower CPU idle states could not trigger cluster-level domain
idle states.

Assign both enter_s2idle and enter (non-PREEMPT_RT) to all non-WFI CPU
idle states so that the domain-idle-state logic is triggered regardless
of which CPU idle state is selected. The genpd governor remains
responsible for honouring domain-level latency constraints independently.

The enter_s2idle path uses dev_pm_genpd_suspend() which is safe on
PREEMPT_RT. The enter path uses pm_runtime_put_sync_suspend() which may
sleep and is therefore still excluded on PREEMPT_RT.

Suggested-by: Scaria Kochidanadu <s-kochidanadu@ti.com>
Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
---
 drivers/cpuidle/cpuidle-psci.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
index dcf20ea5ef5e..db9aa57c51f5 100644
--- a/drivers/cpuidle/cpuidle-psci.c
+++ b/drivers/cpuidle/cpuidle-psci.c
@@ -250,6 +250,8 @@ static int psci_dt_cpu_init_topology(struct cpuidle_driver *drv,
 				     struct psci_cpuidle_data *data,
 				     unsigned int state_count, int cpu)
 {
+	int i;
+
 	/* Currently limit the hierarchical topology to be used in OSI mode. */
 	if (!psci_has_osi_support())
 		return 0;
@@ -261,14 +263,22 @@ static int psci_dt_cpu_init_topology(struct cpuidle_driver *drv,
 	psci_cpuidle_use_syscore = true;
 
 	/*
-	 * Using the deepest state for the CPU to trigger a potential selection
-	 * of a shared state for the domain, assumes the domain states are all
-	 * deeper states. On PREEMPT_RT the hierarchical topology is limited to
-	 * s2ram and s2idle.
+	 * Assign the domain-aware callbacks to all CPU idle states so that the
+	 * domain-idle-state logic is triggered regardless of which CPU idle
+	 * state is selected.
+	 *
+	 * For s2idle, enter_s2idle uses dev_pm_genpd_suspend() which is safe
+	 * on PREEMPT_RT. find_deepest_state() will pick the deepest state
+	 * whose exit latency fits within the active QoS constraint.
+	 *
+	 * For the normal idle path, enter uses pm_runtime_put_sync_suspend()
+	 * which may sleep and is therefore not used on PREEMPT_RT.
 	 */
-	drv->states[state_count - 1].enter_s2idle = psci_enter_s2idle_domain_idle_state;
-	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
-		drv->states[state_count - 1].enter = psci_enter_domain_idle_state;
+	for (i = 1; i < state_count; i++) {
+		drv->states[i].enter_s2idle = psci_enter_s2idle_domain_idle_state;
+		if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+			drv->states[i].enter = psci_enter_domain_idle_state;
+	}
 
 	return 0;
 }

---
base-commit: e5e04726cdd043e309677071ab1b65a4b18f422b
change-id: 20260831-topic-lpm-psci-domain-callbacks-a8af0cd7df35

Best regards,
--  
Kevin Hilman (TI) <khilman@baylibre.com>


