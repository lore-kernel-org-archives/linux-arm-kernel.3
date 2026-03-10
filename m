Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E874FD4F0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 17:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p8iusVWE+eT/wK4fSNbshSwr4s/COjgACwJNX5pbFzc=; b=RQYmGqoT3lF7QsZs9kH8g4UFY8
	8MwKkKiu9sxKqkm9YvUg3b6c7L72bxEZ/J2n1Qi/3XOEJ8VVJnEZlNYPuTVs23wi3ZMiFbgD/iYZf
	BEzxnINgrAyV8s+v1OCBBMNUhDSnv2rc204DXZVpIEw1fhwDREsUhnrqVVR19YjVvtrxZunXZ+VbS
	fc0gjoeCmw1oXsmAvjufRBfa2FWQ9cGkrsUL7B6JTnWBVgsEdqqAB3N7IHi1UueYWx+S88FHWovXa
	tFkHNxKJzAWa1hjouc9PL5WQpjNv/wUs0bLeYx/nq3Fu9BnphceK9S/1x4sxxYg6+b9jLntF2HyFV
	SmOQ46xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w015n-0000000A0KL-2oIh;
	Tue, 10 Mar 2026 17:42:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w015m-0000000A0K4-1Tty
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 17:42:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3532C60054;
	Tue, 10 Mar 2026 17:42:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C03BCC19423;
	Tue, 10 Mar 2026 17:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773164520;
	bh=flcvGrxGSQcM/HvyJsep1dEanimE9giUMZLN+nEKLMo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FHW+21dVhKhjrp0LgyqZeYTm+4ULKNWpsg1tBvzNt2BlsEpW/xSKLTOpXjaK/A4pE
	 /m2YPqMvB3TPQ6bGS11UCkwhIUVCGWflwi+IhDRAanhfDTGOlnHrBsOMoB8aTj9I3/
	 oXxpjqGrsmVPRsc6WAviJvpTt/vOLF0iRNcw6+RNfR434T3BXQC8J43+sSvwVP27u3
	 uR0hXYu0TH3ta69tr46t96bmjQWQ++Qd25x6bBTyTKzUo6YuNnM5mjIAAcLX66kSAc
	 S1s/wfzKPtv+MQJbldeo+Qw1RCrFpwj4Dzy1vhnWxA/59Oqy2ojd7THrJXHldTt2kG
	 wXyTEx1AO4I0w==
From: Namhyung Kim <namhyung@kernel.org>
To: irogers@google.com, james.clark@linaro.org, john.g.garry@oracle.com, 
 will@kernel.org, mike.leach@linaro.org, leo.yan@linux.dev, 
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
 adrian.hunter@intel.com, peterz@infradead.org, mingo@redhat.com, 
 acme@kernel.org, Besar Wicaksono <bwicaksono@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tmakin@nvidia.com, vsethi@nvidia.com, rwiley@nvidia.com, skelley@nvidia.com, 
 ywan@nvidia.com, treding@nvidia.com, jonathanh@nvidia.com, mochs@nvidia.com
In-Reply-To: <20260212233407.1432673-1-bwicaksono@nvidia.com>
References: <20260212233407.1432673-1-bwicaksono@nvidia.com>
Subject: Re: [PATCH v2] perf vendor events arm64: Add Tegra410 Olympus PMU
 events
Message-Id: <177316451973.3633010.4596572843813142614.b4-ty@kernel.org>
Date: Tue, 10 Mar 2026 10:41:59 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c04d2
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

On Thu, 12 Feb 2026 23:34:07 +0000, Besar Wicaksono wrote:
> Add JSON files for NVIDIA Tegra410 Olympus core PMU events.
> Also updated the common-and-microarch.json.
> 
> 
Applied to perf-tools-next, thanks!

Best regards,
Namhyung



