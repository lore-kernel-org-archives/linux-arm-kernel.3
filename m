Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B170CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 10:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1KBFijFzV45dWtHgoFgNcYL0CcUPxjWnIK5BvPyBtAM=; b=ZdNll7mBEjKuU1sVJVSijR0Bvm
	Rx3pS751pgxOitJxMo1z0DMyOB7SE4fr9ETWy+i2qdHKto2Z1UtaFyS/n/DiWCtWteGRpwIMylXc3
	aruBRm6DYnJA7r6x/sz3wzqcQ+ABgSvD5wC0+X+CcWRDU72wvcXzfriIpOfc7JXGLh+9npTyNK0wS
	ddR6fzQs8dVUHISbcpTuvEkw6PXMyWGlNssrFtkTN5aaCAm/jYTYXdMYp+WZt7Pe5ypNG2P52mloW
	3gawi5548bm/sLkF4r9nlvORq7dlOtQOeF6oWruCwtNjgwKb+T6IDGuUXVANsRBtFn+0x3PGVpUkL
	csL+m9Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSu3I-0000000784l-2Isa;
	Fri, 29 May 2026 10:02:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSu3F-0000000784Q-2TEm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 10:02:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 766F51CDD;
	Fri, 29 May 2026 03:02:43 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E32C33F905;
	Fri, 29 May 2026 03:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780048968; bh=8NzTMW/hWjbha8zYCk1wgBEHOuGbAVVwo1YM+L2obVQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C15WxNMxey6LtXXGR48tdQmAu4y+mWPn/sZ0qC/wIlQIc9o2RFMzRGO3PfXDHxkbX
	 362slJzjzjM/8p2tfM7YgGQ5vtxh/4wKghT69rTwryhCbxZp8tPdruIfQ5yy/C4HlB
	 JsT/E36dm3QFv0omYl+DTDaeEBxwvEFYeFzvEEBQ=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: platform: defer connection counter increment until alloc succeeds
Date: Fri, 29 May 2026 11:02:14 +0100
Message-ID: <178004662059.671212.11665567241620048173.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511-fix-ref-count-issue-v1-1-99d647810d3c@oss.qualcomm.com>
References: <20260511-fix-ref-count-issue-v1-1-99d647810d3c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_030249_662743_B76BAD65 
X-CRM114-Status: UNSURE (   7.36  )
X-CRM114-Notice: Please train this message.
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


On Mon, 11 May 2026 12:19:18 +0800, Jie Gan wrote:
> coresight_add_out_conn() increments nr_outconns before calling
> devm_krealloc_array() and again before devm_kmalloc(). If either
> allocation fails, the counter is already bumped while the corresponding
> array entry is NULL or uninitialized garbage.
> 
> coresight_add_in_conn() has the same problem with nr_inconns and
> devm_krealloc_array().
> 
> [...]

Applied, thanks!

[1/1] coresight: platform: defer connection counter increment until alloc succeeds
      https://git.kernel.org/coresight/c/1563ae33dc4f

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

