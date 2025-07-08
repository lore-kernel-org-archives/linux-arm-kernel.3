Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30591C83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 19:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r8Vkve/w9Oe0s/ohm+NZA8l3pYPed3/xVGYIvo5AWNQ=; b=SrejnAS+PWFJlVeZKDskTWC7Tq
	Z6Le7KDtYKqqgTkmKPHlY54/23dPKjTd7gffCDJJ6DaKGrP9lg4ty/3OOYLT60IzJiiFWFbRNZy60
	cHOPtTKtplNflDdh8rlc8rb7xFlyQTw73BTAPHk5HJN0nAvF0zPXNktK9DUdcPy0kyKbqoIdP5KmO
	Qx7QKgQxUGZR7urJVrZLW1uZR6YLHIQioZhCOOLraYTSyWn99gBH66dwq8r8d2jnNQk8OFpWMfQEe
	6w3A6TRvDNwRhOKoPCI8ge1ofASqCahlUlpa/xUQw9x10Ni0hDpJBxadxdcDbWAsivWw/k5EaIFvz
	PsxzXHhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEAe-00000006NZr-1t05;
	Tue, 08 Jul 2025 19:40:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCer-00000006Bv0-1d6N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 18:03:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 96B60A54158;
	Tue,  8 Jul 2025 18:03:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69283C4CEED;
	Tue,  8 Jul 2025 18:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751997788;
	bh=rvW0IG94qSWM0dzaB2v2TlIVl8739p/t8x5WiK0pN+4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ADWhCdBIDTjH7BgOPCT/h7In3Ynen/LYTGXsFKnGichPtEJsrNg2rs4PHUZGVEyvW
	 19MMWkHvc3+ncRgc5DglO4o6v9SuqBnu61ueidxj/bEOaKp70wJ6CsByLETTcU6vGu
	 4eFKxQEZHEizmz8Vcq5dt6kbBA1/C5ktyPkxj+oBGLx8PpK8ou1vARzlJaEkmdULRU
	 ELoFmF+x1iLq1KinnDxiMQdxCZF25X0Y/72IF+s3JgEx8skckB8kw5lZO5fHe0WLes
	 QlN3DN9mMUWevLtNKzNY+dVybhyiNQoda/PpJ4f5tICDgnUCSzqKhW7b38etSFuV1s
	 ah6pf1/fI1IvA==
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	Leo Yan <leo.yan@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v3] perf: arm_spe: Relax period restriction
Date: Tue,  8 Jul 2025 19:02:58 +0100
Message-Id: <175199424407.415102.16311712812731761067.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250627163028.3503122-1-leo.yan@arm.com>
References: <20250627163028.3503122-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_110309_490903_B8CD51AA 
X-CRM114-Status: UNSURE (   9.61  )
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

On Fri, 27 Jun 2025 17:30:28 +0100, Leo Yan wrote:
> The minimum interval specified the PMSIDR_EL1.Interval field is a
> hardware recommendation. However, this value is set by hardware designer
> before the production. It is not actual hardware limitation but tools
> currently have no way to test shorter periods.
> 
> This change relaxes the limitation by allowing any non-zero periods,
> with simplifying code with clamp_t().
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/1] perf: arm_spe: Relax period restriction
      https://git.kernel.org/will/c/ba2ff3e1b640

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

