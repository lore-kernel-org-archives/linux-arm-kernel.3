Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2479ECCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 15:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rr6xJ3c+EJv9VO46QEF+ZoB4rWgfcJmzisR3J3XhXsY=; b=2/fpRryleN/CSCFAhUwtF2BdLL
	ayNuZo4JRmfiqZcm7YlRIFHuGu/yUf/Md4ao1vpkYS4wxi27bje8WKpzm1uSuU54FrMRwuzWZlxbm
	0Ty1ZZg178cD9S4C6TUY0n8se57gRhZQp9/IWVtI1/7UWKTcJKPNW129KaH8QdVlxY+gaX2ACe24h
	npOq2pyNf0yi65AyxHgpiAWzewQ94qPvjZ2au2IKJvgfMmeMm++X5TvVlVn0Q4H/xw38OPxnD5M/C
	9FYJs/gChL1fBn3cxFTne/Mzqnk3pxhIv6vRp/QaapXeWV03xQLqMpaUocQDjez9k3OJ2fDgtfqaK
	I/ABcCjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FIM-00000008s1w-0HN3;
	Fri, 10 Oct 2025 15:44:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FIK-00000008s01-3aRu
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Oct 2025 15:44:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rr6xJ3c+EJv9VO46QEF+ZoB4rWgfcJmzisR3J3XhXsY=; b=KGFwL57Hf3R2STdmuWZSItJ/12
	XfWGh7iET0zQk7tKS3UtwiY9hjq7jNHsrKOEYMSDRQzfMtsNqjbzmU1waWdQ+AJawgGpWfIdd0XNk
	zOUswGbGwqeZNDbZX2uqHyneApoT9lTieOuEC7lhb3KLKDev0j5RGg1WT12r1reyKVkcYt6L1pOwL
	rNa5ip/ceVCIlG5GL78SDKUZy7p4qikaKa6+oJco4Hh3n+RvdQ4iec0SP/FJlGoNwdyG7OtBOjkYo
	xYl37yRgDrgvpe6Ulk3/U+2yiIl4oykaOz5QhrsUUHqxvvFcbtAU/0JNN7GODFhLGGA3OdsxO1sZf
	0c6l2w1g==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FIG-00000002Ety-15An
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 15:44:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760111070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rr6xJ3c+EJv9VO46QEF+ZoB4rWgfcJmzisR3J3XhXsY=;
	b=Gq+R4PI+DNE8+HyhVSPiRtjekJmkdOQCNHMAuRG3WJNrCpPYBJspUzU/pVnI0zfjrxAOYu
	DZQuZA22swmySZ5M3sMuNtW4TyCK/2CNUVEzer5tu+gk2UlPObUGZB5ceipg0uYEMkN8W6
	rRzII0SaVlhaRSjAt/4122Isuj4KtyE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760111070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rr6xJ3c+EJv9VO46QEF+ZoB4rWgfcJmzisR3J3XhXsY=;
	b=Gq+R4PI+DNE8+HyhVSPiRtjekJmkdOQCNHMAuRG3WJNrCpPYBJspUzU/pVnI0zfjrxAOYu
	DZQuZA22swmySZ5M3sMuNtW4TyCK/2CNUVEzer5tu+gk2UlPObUGZB5ceipg0uYEMkN8W6
	rRzII0SaVlhaRSjAt/4122Isuj4KtyE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-347-meY_oTX3Ni6d3twePwCogw-1; Fri,
 10 Oct 2025 11:44:28 -0400
X-MC-Unique: meY_oTX3Ni6d3twePwCogw-1
X-Mimecast-MFC-AGG-ID: meY_oTX3Ni6d3twePwCogw_1760111064
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 313C31800357;
	Fri, 10 Oct 2025 15:44:24 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (unknown [10.45.224.29])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D9B8F1800576;
	Fri, 10 Oct 2025 15:44:08 +0000 (UTC)
From: Valentin Schneider <vschneid@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	rcu@vger.kernel.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mel Gorman <mgorman@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Han Shen <shenhan@google.com>,
	Rik van Riel <riel@surriel.com>,
	Jann Horn <jannh@google.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Clark Williams <williams@redhat.com>,
	Yair Podemsky <ypodemsk@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Daniel Wagner <dwagner@suse.de>,
	Petr Tesarik <ptesarik@suse.com>
Subject: [PATCH v6 14/29] perf/x86/amd: Mark perf_lopwr_cb static call as __ro_after_init
Date: Fri, 10 Oct 2025 17:38:24 +0200
Message-ID: <20251010153839.151763-15-vschneid@redhat.com>
In-Reply-To: <20251010153839.151763-1-vschneid@redhat.com>
References: <20251010153839.151763-1-vschneid@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_164432_480178_AF4E94DF 
X-CRM114-Status: GOOD (  14.80  )
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

Later commits will cause objtool to warn about static calls being used in
.noinstr sections in order to safely defer instruction patching IPIs
targeted at NOHZ_FULL CPUs.

perf_lopwr_cb is used in .noinstr code, but is only ever updated in __init
amd_brs_lopwr_init(), and can thus be marked as __ro_after_init.

Reported-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 arch/x86/events/amd/brs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/events/amd/brs.c b/arch/x86/events/amd/brs.c
index 06f35a6b58a5b..71d7ba774a063 100644
--- a/arch/x86/events/amd/brs.c
+++ b/arch/x86/events/amd/brs.c
@@ -423,7 +423,7 @@ void noinstr perf_amd_brs_lopwr_cb(bool lopwr_in)
 	}
 }
 
-DEFINE_STATIC_CALL_NULL(perf_lopwr_cb, perf_amd_brs_lopwr_cb);
+DEFINE_STATIC_CALL_NULL_RO(perf_lopwr_cb, perf_amd_brs_lopwr_cb);
 EXPORT_STATIC_CALL_TRAMP_GPL(perf_lopwr_cb);
 
 void __init amd_brs_lopwr_init(void)
-- 
2.51.0


