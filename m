Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94753606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 02:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GieCZmNw;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=RKdEsYOP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=euoB6b7GA+zEoXNxnu22fXqTompq3h3v8WFaWLasK6s=; b=GieCZmNwaPJfL/
	ptcPRJIGKrOXMD7MGMa8bUdFpgOKk6RS7eepJ1CfiFd9bKrr+SPW0TdEkQ8eSCOO40sQ+6HkFS68z
	+3Zge8Qpsw2rGbuJtiy//K//CimkXoPws8TPd0fRz3EsHJdkblm4Wz2O4CBlDodQ1e8BDWZ2/YF5g
	6YzbVx9XisCjXx1lnhzsQWMm4O5SQi+Y+id+tmR9slJskNZzjMyzs4Z5YS3a4bRmoMgNzuXoTPgbJ
	cbLovjrh2BnBx/bjvIcTExcZMCMbJzJOqhaiXuevpbnq+JlVSloaVpD9Hfzv03LzYsfrWIDziK3by
	uIwOesBl9PwvUJUkSHIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKRb0-0000000HLqK-2IhS;
	Sat, 24 Oct 2026 02:34:58 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKRaw-0000000HLpq-44mq;
	Sat, 24 Oct 2026 02:34:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=euoB6b7GA+zEoXNxnu22fXqTompq3h3v8WFaWLasK6s=;
	b=RKdEsYOP/3+7vzJE/xpxCMywdSQE4G8WBgP8IMotByAvbhgCYcA0PXqw0KztBz
	MrQSTVD8ni5wdSwe7j3lW12b/xdgoNpKltKoOaOaD/KkBSIiKYFYVYpdTfscBbmq
	lptyvtZ3UUB+nqG01+ikRRXaui5DWxdkIPhDF8JyHbvVQ=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDn77sZGdxqzpBmCA--.19908S2;
	Sat, 24 Oct 2026 10:34:02 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: atish.patra@linux.dev,
	anup@brainfault.org
Cc: will@kernel.org,
	mark.rutland@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	samuel.holland@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hppiscas@163.com
Subject: Re: [PATCH] perf/riscv: clear snapshot setup state when a CPU goes offline
Date: Sat, 24 Oct 2026 10:34:01 +0800
Message-ID: <caplitmus-rv.reply.20261024.pmu.b487faf5463642bb8eabd047819d6327@163.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <caplitmus-rv.75b0e9ee82984422ba17d833767912a8.d33@163.com>
References: <caplitmus-rv.75b0e9ee82984422ba17d833767912a8.d33@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDn77sZGdxqzpBmCA--.19908S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjTRN2-nUUUUU
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7Roe5mrcGRq0zgAA3A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_193455_393353_0C01416E 
X-CRM114-Status: UNSURE (   4.81  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Atish, Anup,

A brief follow-up on this patch.

I rechecked mainline at 17bb0e2f6c80. After a successful snapshot disable,
pmu_sbi_dying_cpu() still leaves snapshot_set_done set. When that CPU
comes back online, pmu_sbi_snapshot_setup() therefore skips registering
the shared memory again.

Could you please let me know if any changes are needed, or if this is
already queued?

Thanks,
Pengpeng


