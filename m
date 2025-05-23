Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0105FC54F30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 14:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3dLO5FUnZLNVebsG8JkJQYms3itDlHs2qdSFPmZ+ETY=; b=QNz+txDGAsE54i7Ia4ghaAFh4I
	mUXg5CJ5DAQdgiiypgIKCmhLCIZHOW39896v7m7x2MB9vHPEi6KjQX9xSTwBb/iwjWpyayozDHxzH
	I+0GzufeWPc1ouGefm0xZQuHZda2b7WFOpC2Hf08bXCvUA4iaqjfzHrLzdVhTwB4iqYKO7vX/5ZLy
	ALfDSZI0Cs7FL+0UEoT7v1BVjMHrHte++U2DYlhncaDF+UdyP+jrGQJbP8Bfz7FmAECd3Hogj+Pzi
	nhW2WwIxdhmRF5gZbvSpBnMxEu78WPSUx5GeYyEOHMkwgifWLJo8Q4zibKM+Bkh5bArrUlZSmlrUY
	aBsAWfng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITbI-000000045jG-16Em;
	Fri, 23 May 2025 14:42:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISdx-00000003zLU-0c9v
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 May 2025 13:41:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=3dLO5FUnZLNVebsG8JkJQYms3itDlHs2qdSFPmZ+ETY=; b=rKDiGPUcsleSfExny4x4M/FeTj
	y1RVHR1hANbKzVbJW3/3MKZyhsu81StqZrWYxnyw55PAjaC8asZXubGypTnG31VT8mRCK5uoBhyd6
	7a05R8oQDud5dhM5scUWwCE+kvExh6phCIdPccVmK79kG20/VYxs0swH3uYYI2/Cj9jipTJGudipX
	NtgsiDVgE7KMqR8zfZygUM/9qelisL4j09HnMtaLACM2RwXgfbCxWXnwXEABR24FWtUjV2r+yfqIt
	cyxKS65SXNV7Jsttg6ye5t9gnjGScLenHtLU7MWdFJp5tIJIhQcsNfCU89uu1gZd4RMtY/UWNA7do
	N2QKTujA==;
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uISdu-00000001KlG-0heW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 13:41:00 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-54e816aeca6so12729800e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 06:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748007656; x=1748612456; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dLO5FUnZLNVebsG8JkJQYms3itDlHs2qdSFPmZ+ETY=;
        b=est/jehRB7F+Szusn1HkeeZErk6V3/xWsfyuA+z9nbiltn/neu2vdQhW+jaBa06pV3
         wFVtdiBCoAUnscZAposhKOByb7fSkhjmt9RtlK+Snhxw7Pc5ESjdQLGnvdzH00DCUZ8u
         q3cqHF2DEn+GGKqE3TpIUf2R7Bz0IhgeXRJAayI+URbwfIG3eZ40HLh96MOj3Bn4L3xG
         jnmZJ7PWsHfJcPRmSwyrF8ghCd6vFpzZ5EKKU6wb+X/NNBzqo5ga9PPnbFSq97G63rqb
         5ATSSHSTnwyTEV48/3whYtjaiIWvzSYOpRI9heKIYJwEq+Gr9v8Zo7rbTiGJoMK+0TZv
         m/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007656; x=1748612456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3dLO5FUnZLNVebsG8JkJQYms3itDlHs2qdSFPmZ+ETY=;
        b=nXoCv6eiUCNqNqD4Nc/QNZR/Ei8X4qI7CFCBow2RPMaXQegN9IpMpQYIEK0Y556tIu
         Y+YAXFNNA1Fx4PT39mFxwrFSDszXT9BMIWtxlNYZVzZOPrdskV/KDgy2l0d1WMPQTsKA
         srI/sUd17YbtBtonSlElqSnadzc6YaYp7AVx9NAj+qg+1ZAFndZ8RfjU7V6NfADPYz9b
         J1ZN0qymWaBDmdgMIvaqW0/VXQ1C69VUym4U41g0Ra8yE8KdF5JUbRbUtVo/7Ci6VIjb
         6xR2tlGuYatifmkUONZGsfLpSlwymD2eqtna6i9gvwLsXO+aC15daBhLhEVft36egpa9
         Hdug==
X-Forwarded-Encrypted: i=1; AJvYcCXyYu5S6XwZ6rcGPvMUXrnQ/2uBqHRhMle88UDf6Anw5xVh1q0n9OyQ9lQo6CiNFMFfzwDWRyeEDOPYNsgdVzv/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/W7mP6aRucL+wbXLWvWA0QbNUpT2+9Cn7u6l2tSNRe+ZM0gPJ
	J/SugzM51SiJSTzzsx2hTUosnrkKJI/PCQ9ZVcVkpv7QvB8CRN4EeZdVJbiX35to6Yg=
X-Gm-Gg: ASbGncv4Krrog1qkViqCXg6FTMLH/XV8gTCHzK6TIIbIeBCR56l0TKTuEFx+Px4Q0Ma
	CN4Pqgfi+2qZhdKXh5WXOJsV08aOugZX6ZkorBrSKAFL1ZhZo2upEhHn10Ls9xJ8WCGLHPZu/FC
	qDDavdhWG6rrvCSCLYYg3n3+WavHsCzNKk5GTR8gu9OqL0Veno0ChSChS2kTns8atHn92cLWmXt
	d16dXyBnJomOmL8kYFOTfWqj0Db0rd+n2fZ3ZtOZ60dypQE1E/an7+p+APGjBUEZWvkwMkskSU6
	AbjEpin0TINB8e0hoEnIZPNPWrrpDljcAzEJRoQbVWk/6IQn6GWVrBEryvSAHb1YMpKkzZsq96V
	4SUnQmonHMMXvC87yvFTUDbkTLw==
X-Google-Smtp-Source: AGHT+IFf5shMU44TNKwf2RFfAZvM/E6/6pPkbDTOgxsF8Wrk3SQBud7p3rswM2Pdzq/U1CzVLKmBdw==
X-Received: by 2002:a05:6512:31d2:b0:545:3dd:aa69 with SMTP id 2adb3069b0e04-550e7245310mr10207937e87.36.1748007655625;
        Fri, 23 May 2025 06:40:55 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc0d473bsm1950609e87.244.2025.05.23.06.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:40:54 -0700 (PDT)
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
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/21] pmdomain: qcom: rpmhpd: Use of_genpd_sync_state()
Date: Fri, 23 May 2025 15:40:07 +0200
Message-ID: <20250523134025.75130-11-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523134025.75130-1-ulf.hansson@linaro.org>
References: <20250523134025.75130-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_144058_479896_4D45003A 
X-CRM114-Status: GOOD (  12.02  )
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


