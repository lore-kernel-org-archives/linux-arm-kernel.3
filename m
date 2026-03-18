Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49B3103E168
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 12:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xTkxOfbbA7OEmglbTow6+h2Q9I2EMYnohn7EFiQXT9U=; b=07Ns+Hez+Khv9rjPt7nj7s1aZJ
	sIwszvQqUUGy3ArJ5BuLlX/99P78+zrs69vElZzW+lJeQEKPaCmUFDWfmllo0XNtsXwf1M4QgGUIa
	P3Kyzw8XBfT9aqnrzxUYnS2bopoZLIZAZoPZ/5MqTpUiKbrCundSAu+9e7HraZ7QHyXuSMfaolYEl
	HaAiwJ4nV9NdA+LycXJlclwxBcLoG1CYif3vPnjkZhCXYlfB2omqSTbhRBpwRBmtk3CxPwEovpxGb
	NmkKEbJK9VQfKnVQEjiCQ8Wi+/0njmNC+Jd8PAPnJmG9MdFVWDXhYCVCAE616QWcQucdmiP2ZjGpU
	1ilpZYPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2qRx-00000008Qy0-3ZbO;
	Wed, 18 Mar 2026 12:56:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2qRs-00000008QwL-1u6V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 12:56:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6BC3E409EE;
	Wed, 18 Mar 2026 12:56:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3EEBC19421;
	Wed, 18 Mar 2026 12:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773838590;
	bh=xTkxOfbbA7OEmglbTow6+h2Q9I2EMYnohn7EFiQXT9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NpykgjqM9ua2DOvj631FBbKsHbZPnIlNftfi/jv6r/upOXmrxdx/c6QEQ328u1GGk
	 bqtE9Hn6WiQ1nPtONUUb1aGtBUzQUnvxVzoUEGCrWNZNA4JdOfez973MUwEr0jb8Le
	 9wXxFrzH77xw96mVyueyFkYCMKcDQXzlC31Bmh39Km0wm/wngaRNIJ1g99Wjc2IRku
	 9JCZ5iBSSB0AwvPvYhe+4VuQbM0XfceqVQ1w5grZWN3efmjEugSCNyGZ41YP46M8gD
	 XrSXudtm0WeY2QwwcNWDeUAF17iXsH/8KH1OneZBvkAKkyHFW+1qbnS9+4xcCzE3PF
	 PSN0z0XRgeDKQ==
Date: Wed, 18 Mar 2026 09:56:26 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Mike Leach <mike.leach@arm.com>, linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
	linux-kernel@vger.kernel.org, leo.yan@linaro.org,
	peterz@infradead.org, mingo@redhat.com, will@kernel.org,
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
	jolsa@redhat.com, namhyung@kernel.org
Subject: Re: [PATCH 2/2] perf: tools: cs-etm: Enhance raw Coresight trace
 debug display
Message-ID: <abqg-uKHqobUTn3n@x1>
References: <20260313132129.2743468-1-mike.leach@arm.com>
 <20260313132129.2743468-3-mike.leach@arm.com>
 <20260313144518.GN4153946@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313144518.GN4153946@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_055632_551512_6F37AAD3 
X-CRM114-Status: UNSURE (   7.38  )
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

On Fri, Mar 13, 2026 at 02:45:18PM +0000, Leo Yan wrote:
> LGTM and I tested it:

> Tested-by: Leo Yan <leo.yan@arm.com>

I think this is perf-tools-next material, Namhyung, please pick this
one.

Acked-by: Arnaldo Carvalho de Melo <acme@redhat.com>

Ah, BTW, this one I picked up by perusing the https://sashiko.dev list
of reviewed patches that were CCed to linux-perf-users:

https://sashiko.dev/#/?list=org.kernel.vger.linux-perf-users

Thanks,

- Arnaldo

