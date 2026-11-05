Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294E1606D809
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 09:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RG9/nOpP;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=pmNLQSFO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1NYk/R+AjvZfblsV7HCmGu0xMESmf/3Rl3LdxJTF5qY=; b=RG9/nOpPJCP7+X
	QtTWQLMkT/0wYFo7j7RMwznTbEiVfad9qQIp2a3OnfCmb5XNrQE0mBMIUtlzrf0wEy+TGXASjVcGS
	7NkkCigagMSdKu6rKviOLIW1KeshhQe1nmijj25lALtpf/nq5JaPARKG2Snkk+TJAlLqYk8uD5HS6
	Jd8G+EP4naVZvXTa72vjI4d42pHjFqRUVhS4UJfecBrEJB0xUKdRljIswYKrqS9F1is4Hr/TkILQ4
	0j306NyAMdx0v/f5oYYBS52SOZvmgntoxG9jXoZcgR4fh+v8szE+w8Sk34iVSTJiv3YV8sDWb1TSC
	Jk800lSy62o8n9T3TZfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtNV-00000008Ei4-2J99;
	Thu, 05 Nov 2026 09:03:25 +0000
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtNR-00000008EhU-2q9f;
	Thu, 05 Nov 2026 09:03:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793869399; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=1NYk/R+AjvZfblsV7HCmGu0xMESmf/3Rl3LdxJTF5qY=;
	b=pmNLQSFOpq/RuRuhP0vzWZQi+r2DSovBx8mbaVk24pezHXtwBKmp9/8XAPGE4gUt5nNM5gtVYmEo7HW6q/uzke4zADGtHy2IriKE+h6xZfOzrVwLbt12RwIY9O8luJNn4U7bqlbiLt4H19tTsSrH6vK432upsOL+i6+b125lCWM=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=23;SR=0;TI=SMTPD_---0XE8DYxW_1793869381;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XE8DYxW_1793869381 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 05 Nov 2026 17:03:17 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: acme@kernel.org
Cc: adrian.hunter@intel.com,
	alexander.shishkin@linux.intel.com,
	anup@brainfault.org,
	david.laight.linux@gmail.com,
	guoren@kernel.org,
	irogers@google.com,
	james.clark@linaro.org,
	john.g.garry@oracle.com,
	jolsa@kernel.org,
	leo.yan@linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	mark.rutland@arm.com,
	mike.leach@arm.com,
	mingo@redhat.com,
	namhyung@kernel.org,
	palmer@dabbelt.com,
	peterz@infradead.org,
	pjw@kernel.org,
	will@kernel.org
Subject: Re: [PATCH v3 0/2] perf riscv: Implement rdtsc()
Date: Thu,  5 Nov 2026 17:02:57 +0800
Message-ID: <20261105090300.2889-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009032715.2841-1-cp0613@linux.alibaba.com>
References: <20261009032715.2841-1-cp0613@linux.alibaba.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_010323_209118_DFB584F5 
X-CRM114-Status: UNSURE (   6.03  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -15.1 (---------------)
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
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 09, 2026 at 11:27:13AM +0800, Chen Pei wrote:
> [PATCH v3 0/2] perf riscv: Implement rdtsc()

Gentle ping on this series.

Is there anything else you need from me to get it queued for the next
perf-tools cycle? If you would rather see it resent on a newer base,
or want a change I have not thought of, say the word and I will do that.

Best regards,
Chen

