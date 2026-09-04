Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DFDC79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 17:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+wUfpwy41SrHe1GUU+AUdrxg0gxDKL95hUVxvTh+KU=; b=LSVSTeGP914z8Xl63p+teLp8zD
	MRWNuMk5yeKCsFPfZlcYSEERfcJqGKm+z8GJKS7FLE95xCwTzEl/LggOZFBzCC7PQjbFGd2yF5zvh
	fq08iDITEJMfzDopKYcvwFG2ncScfHDkcjAnFUr2K6r0LQBMMWZwHJZJtvRiqv5QBku2bnBEAuB/b
	/86X8hllWOaMn8+GGuBQjh2jZUiuFWIMf8u67N3QO0F5FDZnuE3D2zREhhERmj4QfP2HEWXg1wSfI
	BBjB0Ln7LJSjpFMuu8XX/Rt7wAQyxsulqwIURLF4WpSBpKtKrljp7WwTZMCyENxe0DvIY6S0B3uCK
	UmW/E8Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XSe-00000002q0A-0hcD;
	Fri, 04 Sep 2026 17:12:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XSb-00000002pzi-2F58
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 17:12:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8D63152B;
	Fri,  4 Sep 2026 10:12:12 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B6B83F7D8;
	Fri,  4 Sep 2026 10:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788541936; bh=2GiCH+5kI3vcsZvzncgnRg2QnDpJ16kkZKLnsW7SyNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dqi3QirwqIFSzSWM29azV4XpRbautUGyrdE7FafaXx4nRtSo2zpVX9POUvWygQO49
	 XRPYXrZeDYK30N5N9OcAafaM3yFTiABJ9NMYHBPVa6RpwjLNUp8qFkjFzuevGcYVZn
	 zshZVX9SK40rnLnbDKDSpS+4+p57MuDohxyhjsU8=
Date: Fri, 4 Sep 2026 18:12:14 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] perf cs-etm: Free partially created queues
Message-ID: <20260904171214.GA8904@e132581.arm.com>
References: <20260821-james-cs-hw_id-output-failure-v1-0-9d532ddabcc3@linaro.org>
 <20260821-james-cs-hw_id-output-failure-v1-2-9d532ddabcc3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-james-cs-hw_id-output-failure-v1-2-9d532ddabcc3@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_101217_616674_188C6D27 
X-CRM114-Status: GOOD (  11.06  )
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

On Fri, Aug 21, 2026 at 10:50:30AM +0100, James Clark wrote:
> cs_etm__create_decoders() can fail half way through and the
> err_free_queues label won't free them. Call the full queue free function
> here instead. If no decoders were created it's a nop.

[...]

> @@ -3520,6 +3527,7 @@ static int cs_etm__create_queue_decoders(struct cs_etm_queue *etmq)
>  
>  out_free_decoder:
>  	cs_etm_decoder__free(etmq->decoder);
> +	etmq->decoder = NULL;

cs_etm__free_queue() also calls cs_etm_decoder__free() but does not
clear etmq->decoder. Should we do the same there, or drop this
unrelated change?

Otherwise, for the queues free fix:

Reviewed-by: Leo Yan <leo.yan@arm.com>

