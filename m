Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01DDEED626
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 17:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GdJhl/jlHeKQ2aQUjcHV2m7mMJBcz7FbD9HXF0HWAxA=; b=HMdspuJFXwPK4ePC+9glOWEQNC
	uoLYGGhoT5ie/ylCR/jKf8240WFqn6UVthKqachzTTsA+xFVXK8H905VzQMmHyj4DEYZda4Zr61FN
	tXY06WVX8UHacXMzD0TfcsE0hLO4/P2E5upamQo2GLvHA3RNUrKrTIgLLXxshfosvvtHKdLfzxLm0
	Oj9fx2oGW9JQqbk/W+VCguW+10awmwdoOqBE9kkUDpWHXLHJOpDd2Ft0+iIq2pku2aWY51OQCGcBv
	O4XGt3GHQw9hAUW2BUt8RC9Ke4JLmXcf7k+tAl3ioQA2wsa4JaAV9mnSoaqk1lWgC4S66YNKQU0Tb
	c7jT4joQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbMgV-00000007OhI-0HUn;
	Thu, 01 Jan 2026 17:42:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbMgQ-00000007Ofk-38O6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 17:42:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 616CA442D5;
	Thu,  1 Jan 2026 17:41:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BBC8C116B1;
	Thu,  1 Jan 2026 17:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767289318;
	bh=EzgEO36WKTuxxmrk9QYRyVB5NuHgZRZWzoxw4v+H4uk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=coz2jbT+XkYJivihRAqqsZ9UIfxOnUF40vslhia+SF3yAMvBv6lgzA2brj/qQ6jur
	 0JHqk0k9BM1dCa3yuRPMM/yIo9EQLE5JomAZQ8siN0sXvJ1qQ6lspcX95hoQZ72+1g
	 MNxHd1ohGHA2+UOrVgfLIiKrq8KJ04SAVk0KyNIa1ASooQDskoNx6u/FJpvfF5UaUD
	 C9ZcupaJXEVJ/EIFj1ZBdSj0PBpdCm/R7VJowkBNaU0KS+67qSglNf3mGLiQRpIyA5
	 gF0csejz/USK96ucPHS+1Mp8NyP9MpO0cUvLcK5z32sWhip5UN9CIISR3rQlNPqd/e
	 4hXdb6k7TllHA==
From: Vinod Koul <vkoul@kernel.org>
To: ludovic.desroches@microchip.com, linux-arm-kernel@lists.infradead.org, 
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 daniel.machon@microchip.com, Robert Marko <robert.marko@sartura.hr>
Cc: luka.perkov@sartura.hr, Tony Han <tony.han@microchip.com>
In-Reply-To: <20251203121208.1269487-1-robert.marko@sartura.hr>
References: <20251203121208.1269487-1-robert.marko@sartura.hr>
Subject: Re: [PATCH RESEND] dmaengine: at_xdmac: get the number of DMA
 channels from device tree
Message-Id: <176728931580.239406.8826639306613360080.b4-ty@kernel.org>
Date: Thu, 01 Jan 2026 23:11:55 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_094158_807623_2D15C444 
X-CRM114-Status: UNSURE (   8.11  )
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


On Wed, 03 Dec 2025 13:11:43 +0100, Robert Marko wrote:
> In case of kernel runs in non-secure mode, the number of DMA channels can
> be got from device tree since the value read from GTYPE register is "0" as
> it's always secured.
> 
> As the number of channels can never be negative, update them to the type
> "unsigned".
> 
> [...]

Applied, thanks!

[1/1] dmaengine: at_xdmac: get the number of DMA channels from device tree
      commit: d3824968dbd9056844bbd5041020a3e28c748558

Best regards,
-- 
~Vinod



