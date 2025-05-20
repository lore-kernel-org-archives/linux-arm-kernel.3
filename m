Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E7EC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 15:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ROkNYDxKMINgg8BzSO/dME2n0HjgWgpRm7ilzpuIqA=; b=rQAhaAspNNdnPtpKBTDRdXwK4G
	AiAtT28HGnE8nBj0MM4gTZlt67iIFtg6YHrcYozf0V3v23+8LK2JbmkY/bDQjcns0Fqo7tld4vqZ7
	tyBOhkRrI1eFXXZPIO4Dx7P5DSGNS34z1JfhGeMsPHpnoER7rElrih9JJ97/Bw5QHUgvF0mvyOclc
	TQ6x4THpsCqcfpd0O1+Y4ECIIBCUWzX1ofdpcH046W8XmGLJx9yteQaX27e7UaUpT22RAGv+T4huK
	UxIkWbkmx7Q2y7wC389wdSx00QaUQF310LJsC/pN+TLoLoRjqMCBW69BZjyKEX3bSyMn0ITDJi39U
	Zi+xdk/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHOtn-0000000DLeE-2Lnh;
	Tue, 20 May 2025 15:28:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHOjr-0000000DJ7W-2Bhk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 15:18:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D3DA1516;
	Tue, 20 May 2025 08:18:29 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1D4F63F6A8;
	Tue, 20 May 2025 08:18:41 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>,
	Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>
Subject: Re: [PATCH v2] coresight: tmc: fix failure to disable/enable ETF after reading
Date: Tue, 20 May 2025 16:18:29 +0100
Message-ID: <174775429686.297706.16091978841139084085.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507063716.1945213-1-quic_jinlmao@quicinc.com>
References: <20250507063716.1945213-1-quic_jinlmao@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_081843_603217_B9EF52C1 
X-CRM114-Status: UNSURE (   6.86  )
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


On Tue, 06 May 2025 23:37:16 -0700, Mao Jinlong wrote:
> ETF may fail to re-enable after reading, and driver->reading will
> not be set to false, this will cause failure to enable/disable to ETF.
> This change set driver->reading to false even if re-enabling fail.
> 
> 

Applied, thanks!

[1/1] coresight: tmc: fix failure to disable/enable ETF after reading
      https://git.kernel.org/coresight/c/d23bc38e

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

