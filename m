Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BC5CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 18:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MAxwiRega5ZXE0P8h6zzE1LTnUakN0uQJQNBwuu1N2Y=; b=agX6GS7hlcrEO+eHaTiH5CvpHY
	K79wbrWhMjPeJrylUpGJcQyO0m4RILhA9o+UcmjZDt33XsIJKlYlDTAjpHwjI2BVIjgB62Pcgvhoh
	hJ66Mi2Ubv0lkNNEJwgrgHTRWaAOQU9DInouchXcqeNXA6GwvEWcSkKro+qypgVI0ejH3x0df62TX
	35aXJUe4ZX7f6alXUlZayLwovCm2xbuitMMeWxKKf9wI886KpJptqHmT8AV+aEfeVKIuCWMN9SuHi
	vsdJCpEjUAZGXJVB0DpjpEvDYN/3r2VhKjeaIcPijKmmGOz90cxJBbEvkrBSctZf7ANk+GAR/y41k
	w25ZZFfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCMyQ-0000000AJDg-3ksi;
	Fri, 24 Oct 2025 18:57:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCMyO-0000000AJDS-3dmp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 18:57:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4D4766127F;
	Fri, 24 Oct 2025 18:57:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91DE2C4CEFB;
	Fri, 24 Oct 2025 18:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761332232;
	bh=fDeOs13L/MBQnskCcsSM/GlRV8A/x86Rpha792DuFoU=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=mPfmkAtNytxn0TmbXYfsEQ4RfA6GyfXfNX8kc7TlVF2/Sm80gLZMmeBufd4/eU2Jr
	 idnysyD23rd9aBTq9n51eWOILqOSvHjXV5lOFcHUrtujz/LtqZyoLf5trlMTVrunVC
	 WZNVphvSPDG6CzUokgesoJrPNJqWf59HpFZGpgDBulRfuVj0h5D2bLwmMMCoJFJKXA
	 WVL5wCaxgjjiO2qw5tLkaF+Oi5tCu2yHT+/X2HDXPV7xZVV8booOmydG5mSrVKxwON
	 geXtsfCVhh0zwCkTwTFZv2uGeBh/1qbrkSykDK2RhKmfMN99BmpuAZ7wHJ0UFK1jOY
	 zpDeD+vqBMHfA==
From: Namhyung Kim <namhyung@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, Leo Yan <leo.yan@arm.com>
In-Reply-To: <20251022142849.1537706-1-leo.yan@arm.com>
References: <20251022142849.1537706-1-leo.yan@arm.com>
Subject: Re: [PATCH] perf cs-etm: Mute enumeration value warning
Message-Id: <176133223155.3710582.11738125288265656189.b4-ty@kernel.org>
Date: Fri, 24 Oct 2025 11:57:11 -0700
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

On Wed, 22 Oct 2025 15:28:49 +0100, Leo Yan wrote:
> When the OpenCSD library introduces a new enumeration value (for example,
> in the v1.7.1 release), the perf build fails with an error:
> 
>   util/cs-etm-decoder/cs-etm-decoder.c:600:10: error: enumeration value 'OCSD_GEN_TRC_ELEM_ITMTRACE' not explicitly handled in switch [-Werror, -Wswitch-enum]
>     600 |         switch (elem->elem_type) {
> 	|                 ^~~~~~~~~~~~~~~
>   1 error generated.
> 
> [...]
Applied to perf-tools-next, thanks!

Best regards,
Namhyung



