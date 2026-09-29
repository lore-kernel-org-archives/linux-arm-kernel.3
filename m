Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12A5CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 19:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FEjCSLOm4aV8z8xpfdbNSkg2yURNT+nzhPX8Qum/V88=; b=uWU7R/DYMNab/HUGZ9zLFq6Fek
	gcR3+dniNlYZKniuCCGN2JcDLt4eZ41yjJdhKGaCag+mHo2aKzbxekg++BUapsAsHKB6QvYzwXGrC
	j3T3cCuzUA6TgJA7hTBcZy31uvCsr+0MDdzHWDeCYm7N1S0+nproUYoqUkrvumLJo1mjO6KSMCQaW
	JXc2ROQ2DfILbVpwaVu/g8aG+QF+UGHUIHSm1NjijYBB/ewooeC3dg3D0Cy1EjPAavXlLwJZxYzuM
	ah+bttZJzSV75vhcYOqxFRFmJ0Ot/TgYnyeo+Fs3JZ5nP+tR+J4vl6zWhwtZfqnkmM3kMOyp38iQT
	3sVigJdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdiM-00000004PEi-0mgQ;
	Tue, 29 Sep 2026 19:42:10 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdiE-00000004PAU-2lgD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 19:42:03 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so29488695e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 12:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=opnsrc.net; s=google; t=1790710921; x=1791315721; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FEjCSLOm4aV8z8xpfdbNSkg2yURNT+nzhPX8Qum/V88=;
        b=AzviD9YZfmIw+/czxbJDGagXnEWJEyrEelHukbpDqUuwxobcipu/YLPOtmhy2t8Ejx
         slMFGgvPTUgwDIT2CXOcAzvvxIA3bXh4WHmjeOGUCWil3UtQpnpnvrVVPgSXZZIs7tBh
         Vh3zq4+0+sIcQvuysp4jdu5MJXYEKz7pA0e6UoszqRB88o/+g3ejm33xnLZ9aZ0i5YKs
         kAkrRW141oKA0xwNXlAgTNMGNnpGA078MzKA3VlWy3iLH4WZBHSgaGcilbGVqQOA/JHv
         quMsNJ8mIi8je/tuoVeDuj13s6uRYMmeg8BBYZ6EExm7W+BFAxTgur/+DECl4tAjIoc9
         EDjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790710921; x=1791315721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FEjCSLOm4aV8z8xpfdbNSkg2yURNT+nzhPX8Qum/V88=;
        b=0bC89jkQ5Z2l9M9V1N9NCSjmwvfwUQgWMYRw44XwVd3dTe+rwArDz77wlcWUbJos7W
         4XWctzNnvKUs8NjpiaxOUVKZqZjnhEuQFtUd6MrH82A3R93pIGjNjq8y8I0LJgb+iW+0
         dSaGyRAi8LB3BzBp33wc9/Xeco75dywoi92jlTXAIxas0ojKmdA6J98Hz+apUa1aFdqm
         bYkNVXEoQUGkBrmkMYTtjP2P3lJ5IRUifGnFkAjvfj7nL6mwMUvs00wxrg79hFHNulQF
         H2pwp5oGLUPb5RNwfBE1KKXyd0KqtxswUkcn0nEkTMiMuPCrgWjUGczugt4pwVXxmeRY
         FjnQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2ujXjjyeAFHlDNYpnSzxOIY28sM/aOhnN7muf58UzRzvTnNtiAn4qs2u0mH+8yA25sTCPfAjEBz0RK9wdUFFq@lists.infradead.org
X-Gm-Message-State: AFuF++m28JVim+QdJPrCsMN3lM6F1AtqKy1Mquj/D+XGvJrPkF6ZKuoL
	gyVhXfuL24sLXERZvd0TSEL/Vp1QJdjhv0+1qQDgPB/zFgWf6ziV7CUSgy0ybFWtHtM=
X-Gm-Gg: AYBFou1z+mMuwZ3GJPgM9JGgvtY6cTsuFVDHIXTNWQe5vuveTYeE0S7460p1c+YBUuk
	wXwal1JOLdp4C9zyhwe4Kd+37McMe/J9D+JYcvU0rbKb1w26IHICxsoE4Tpq2Tjw7n/WDuAUbhL
	fZdDpbB3/YPRyFQzzuufoUlqW/Ttk2XFggF5B65vrQtrj196MfGa7XP/XRw8nHmtyzrElL9wiPy
	O5ekghN0No95QNMllPTx9pPRue2yFbugv1YHq7zXGUnUD+A7rVgX+U2Mxk9njZlolbyF9sR+Fd1
	VEe3Mrulw53aegKGmOATQDcXVwPgaYPrcmIz5LWz1ZXmgqxHz15S7DvwBnm0ij4SpYvDrgODrPf
	2EQAMqJAb75A9M11P9ZqplGGCz+kslw0+x5QddiD3jgxFLsOgJINiVL5cTOD8ow24oxYKqD3QKz
	HlliM38VQvZiERELtU7Ba+jiv0rZE43Sc+YpRJ4qGtgG/Wu32u+LzjsYlPIuUV0m8/m9GD7hM/6
	AOatQ2P1zSgwdmYH1K7M0wLPFMZYHG/Fxr5c5dL023OnaBU18B6DHTsyh/2vRn1+9cdkW8=
X-Received: by 2002:a05:600c:468f:b0:49c:fa20:cc02 with SMTP id 5b1f17b1804b1-4a01503dad9mr1948065e9.25.1790710921130;
        Tue, 29 Sep 2026 12:42:01 -0700 (PDT)
Received: from localhost.localdomain ([217.146.93.153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a014f77b62sm5238355e9.6.2026.09.29.12.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 12:42:00 -0700 (PDT)
From: salil.mehta@opnsrc.net
To: Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	James Morse <james.morse@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Gavin Shan <gshan@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	Salil Mehta <salil.mehta@opnsrc.net>
Subject: [RFC PATCH 1/2] cpu/hotplug: Skip disabled CPUs in cpuhp_smt_enable
Date: Tue, 29 Sep 2026 19:41:29 +0000
Message-Id: <4ca071f1678acd1d3b8ecc0266938f59b45f629a.1790692295.git.salil.mehta@opnsrc.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1790692295.git.salil.mehta@opnsrc.net>
References: <cover.1790692295.git.salil.mehta@opnsrc.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_124202_729949_775C2CDE 
X-CRM114-Status: GOOD (  15.18  )
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

From: Salil Mehta <salil.mehta@opnsrc.net>

The CPU enabled mask describes whether a present CPU may currently be
brought online. cpuhp_smt_enable() is an online operation, but currently
walks all present CPUs and only filters CPUs that are already online or
belong to offline NUMA nodes.

This can make it attempt _cpu_up() for a present CPU which firmware has
not enabled and which has not yet been registered as a CPU device.

Use the enabled mask for the policy decision it was introduced to
represent. This keeps present-but-disabled CPUs out of the SMT bring-up
path while still allowing registered offline SMT threads to be brought
back online.

Present and enabled are separate generic CPU states, so callers which
intend to bring CPUs online should not assume that every present CPU is
enabled.

Signed-off-by: Salil Mehta <salil.mehta@opnsrc.net>
---
 kernel/cpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index b3c8553d7bd6..988b7a1e8298 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -2706,8 +2706,9 @@ int cpuhp_smt_enable(void)
 	cpu_maps_update_begin();
 	cpu_smt_control = CPU_SMT_ENABLED;
 	for_each_present_cpu(cpu) {
-		/* Skip online CPUs and CPUs on offline nodes */
-		if (cpu_online(cpu) || !node_online(cpu_to_node(cpu)))
+		/* Skip online/disabled CPUs and CPUs on offline nodes */
+		if (cpu_online(cpu) || !cpu_enabled(cpu) ||
+		    !node_online(cpu_to_node(cpu)))
 			continue;
 		if (!cpu_smt_thread_allowed(cpu) || !topology_is_core_online(cpu))
 			continue;
-- 
2.34.1

