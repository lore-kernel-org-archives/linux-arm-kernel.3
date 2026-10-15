Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1EECC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 18:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=069VvH+IkOT+l2xfNHKK2EYAHo4Lvzgl6r1tYrLvg4U=; b=X+xa6kUadBMSXHTTUBu6MbKL48
	jlLoC8OCZL8yLb3kEepx3I8fJrFd628bu6J2xR13WDS4nZ5t0jjM0YdlfDTHABvAB5cPDONQY2Bsq
	GECzhWMw2e+VYCTKfPxgIgar/39HlCAQXvirBb7oSiY9yQbBylIwzzmpIELn+wrWcC7sMVj7Duen4
	cqeQOyeqMebWQwecqxSS5axLmm2vkGjiu6mCcyYGKY8Fw7aEbCeLGDYYzCrMDlZWQJ1zIO0wFMi+y
	Jk/4zMWJEDVjpdsxdpPpXMEMcg2/3Yvcw/8TpTEzJXTCC4jSF0HUCv3EjH0a08ouXxcEBVCHoxOFB
	UxemzQWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHPwD-000000016bl-3CwN;
	Thu, 15 Oct 2026 18:12:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHPw4-000000016a3-2lTr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 18:12:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C995A14BF;
	Thu, 15 Oct 2026 11:12:08 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D51103F871;
	Thu, 15 Oct 2026 11:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792087932; bh=s3cfgIWhdHIxDrJgWLCdvB1wawB3jHD/bU2OUWznot0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lbI7xIhBM0XvZcv2h3iQ43C5ZjXLqBq+ITxu53qEdtLPC6V1wnzVIh8Pq3uGYv37o
	 dCxy09k464L68Skd3910ki4OJd1eGTVGXO53MAlScf9oxs/sRjL+zNh9goRaVilTNy
	 b/lizPJHky2WhKjhZHG9LfB6BWIeROHlpDFB2Nnk=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Sasha Levin <sashal@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kselftest/arm64: signal: copy each test binary only once
Date: Thu, 15 Oct 2026 19:12:02 +0100
Message-ID: <179208792227.161414.10905688398757679860.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261014200140.1364282-1-sashal@kernel.org>
References: <20261014200140.1364282-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_111212_894600_B453A4DD 
X-CRM114-Status: UNSURE (   8.07  )
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

On Wed, 14 Oct 2026 16:01:40 -0400, Sasha Levin wrote:
> The signal tests are built in testcases/ and then copied to the output
> directory. The copy rule lists every generated program as a target and
> copies all of them in each recipe:
> 
>   $(TEST_GEN_PROGS): $(PROGS)
>           cp $(PROGS) $(OUTPUT)/
> 
> [...]

Applied to arm64 (for-next/kselftest), thanks!

[1/1] kselftest/arm64: signal: copy each test binary only once
      https://git.kernel.org/arm64/c/7b3b147c4104

