Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6897CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fYd82RFH6eK4wGWLoS9WCtFcsYKgozGDQMKLc16TQyQ=; b=vsMQLxeRhGt7ajVWjmfOnzJEEF
	toSzfhMDPCZ3vzYo3BMScfMfQOemRYGE/OxXkgI3Ww8R3iVfWOiGefZPafWljyWt/RnpVjqNinsG0
	o3RIFtuwF/NtEq+ghpckkSVE8PrnJL6FD1z3X4AmduEndG8ZVGt7vNqtT9cOjldg7lDVFKgdfp1m7
	pbxwslJf+FdlfG/qvYYWLtZWYgvcvWgajvyTYWm9CrRtIuy18JdXItpqKzAlknQz0wJt2sjqiORJQ
	S0pZBx7sfOPnwyNbiIMpakUBwr/ZjxenNy2Yi0qbdq7m4htH347DmfTnS8F/nDhH4xIEkfsdZ8aNu
	9ZIO7tkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1vy-00000008nsn-1mBd;
	Tue, 09 Sep 2025 17:15:10 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwGB-00000006d6p-2T9k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 11:11:40 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-55f7039aa1eso6041370e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 04:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757416298; x=1758021098; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYd82RFH6eK4wGWLoS9WCtFcsYKgozGDQMKLc16TQyQ=;
        b=UjnXDM51TE3MYbS6M6mhJpvg4S6mz62keg5ibFn9RrxxByss/PmJwYBiVEIxUXoMV2
         ysNcZYBqgFCegSnqvHn82t4XnXWVYckPylrLQ530T6oszIYBN0fzNEkUrx19PZcn+2cg
         NvVCkfCSTZbVmpCnm5hGKsNAheFKhBPbvCDEDBSpUPtiJlg28X/0eBzU1y8vAYIJTGm9
         oJhQQwHKUR1L+SJ6n3jxppMX1txFPr63s23+5+R6GMAZN5BjbHt+p4qxhaE/tD0jjUaA
         fbJbMP1VKLTXssmjXJopeRJIjhli4djcReVeWdDEAsmbgHLJi6gXwA7vFvnW7gqaAACs
         CvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757416298; x=1758021098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fYd82RFH6eK4wGWLoS9WCtFcsYKgozGDQMKLc16TQyQ=;
        b=v7TQGEKHnYSDhW5htA0nGnI3NxGUiCHT3N3Yef/8Uv/W0VzhDnT2P2XkO5JkXIfBgz
         72WFncFbezXDqI5Ycv/hn4am/FFP5CwsEcqUKOaeRt70nekz9X8pHpTkyJYlmGXKpb3J
         xd19DSzaLGE5aF89hKNnuCyByk4KWGJMlaTK9mD5R9RgwBzTjRL5Zslg7mYDh3oYHqWl
         gDdFR04q99E2xHzSUkBE/ewSVzTQEWjUfTpgZTsijuZra3nZ1v7MP5XsWcfPH9q99Bux
         4KQxUp7ReBoSuBTd5cQKcobTUfV/r4fBdY969+y4nq8B6KmZMwan9RFAqclsK3ceUZXK
         /mfg==
X-Forwarded-Encrypted: i=1; AJvYcCXHFKJeUn67Y1mzNUWIxgfhqGNf0rOpfGdPnR0/yKqRoTCaEwowVtydCtrdRJidQZfBXHtFy0enDxtP555W4QB/@lists.infradead.org
X-Gm-Message-State: AOJu0YwjUz51ZDOnt0IZfUYCV+pLyrynNqi7gvVnvZpuxMkYoGRIx56E
	RHocq5+Ir7F+WjFyQYcoPOvXUW19AyrOE6+6NPik02taDK9ZLLnSktrPFawBftV7DX8=
X-Gm-Gg: ASbGnctRdlSCsxeP7pj+B+Mv8WwdckUZ8eYJVyszLIn9FCMEF8Ynnsu2oUjH7Q7QObA
	hbebTaHRhWYTHtII42NbbXBgfqQBSyMxBy2hNGg1nKaZXKOCJo2iWFF7QAGm+y6d8QhN1Lbgw+2
	WJjUiSDrjRofU5iksJyh/pA5O8T58cRze8Rzt4RAm+UKuldNQ0fIypyPLm5v3nF6xD/GnD4ibzJ
	s/o9R8mM2UotMjNdODAL5Y4NDqaVcblTAK9MNhlWnkbXNNx/NR2AtGJXWylBNq9e50uRxwCEJoz
	Y65ryDCbPcsKp3yb35xu84IjWwj6gOFMI8Dy4Nql2I/yuiZIeu0BaI7ymbXpEPJNqXMk4ZLBjAG
	pvDoP3Y7E3C9oz9ntfrB+9Kxqc8cnJLY1VVj0DV7pYXjjwZ7KaxKsrllBo1957LPwPo+zER3VxN
	MpSeoDem8=
X-Google-Smtp-Source: AGHT+IEDEezqBzu6WD5cRb0Yhvc1WCJvGMbiCnMcquxNLiuAz9Ox4q5bWS49Ks338WKrFgMjtbd8NQ==
X-Received: by 2002:a05:6512:220c:b0:55f:6bae:50c5 with SMTP id 2adb3069b0e04-5625ffc80ebmr3407675e87.19.1757416297700;
        Tue, 09 Sep 2025 04:11:37 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-568190f8040sm445440e87.148.2025.09.09.04.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 04:11:37 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Saravana Kannan <saravanak@google.com>,
	linux-pm@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Diederik de Haas <didi.debian@cknow.org>,
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
Subject: [PATCH 3/5] pmdomain: renesas: rcar-sysc: Don't keep unused PM domains powered-on
Date: Tue,  9 Sep 2025 13:11:22 +0200
Message-ID: <20250909111130.132976-4-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250909111130.132976-1-ulf.hansson@linaro.org>
References: <20250909111130.132976-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_041139_627299_3742C928 
X-CRM114-Status: GOOD (  13.22  )
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

The recent changes to genpd makes a genpd OF provider that is powered-on at
initialization to stay powered-on, until the ->sync_state() callback is
invoked for it.

This may not happen at all, if we wait for a consumer device to be probed,
leading to wasting energy. There are ways to enforce the ->sync_state()
callback to be invoked, through sysfs or via the probe-defer-timeout, but
none of them in its current form are a good fit for rcar-sysc PM domains.

Let's therefore opt-out from this behaviour of genpd for now, by using the
GENPD_FLAG_NO_STAY_ON.

Link: https://lore.kernel.org/all/20250701114733.636510-1-ulf.hansson@linaro.org/
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Fixes: 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until sync_state")
Fixes: 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until late_initcall_sync")
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/renesas/rcar-sysc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pmdomain/renesas/rcar-sysc.c b/drivers/pmdomain/renesas/rcar-sysc.c
index 2d4161170c63..d8a8ffcde38d 100644
--- a/drivers/pmdomain/renesas/rcar-sysc.c
+++ b/drivers/pmdomain/renesas/rcar-sysc.c
@@ -241,6 +241,7 @@ static int __init rcar_sysc_pd_setup(struct rcar_sysc_pd *pd)
 		}
 	}
 
+	genpd->flags |= GENPD_FLAG_NO_STAY_ON;
 	genpd->power_off = rcar_sysc_pd_power_off;
 	genpd->power_on = rcar_sysc_pd_power_on;
 
-- 
2.43.0


