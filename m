Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5834EA3F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 16:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YHT0vmy78y9KReYSnEE4OJtq/Mfmu5JzbTZuWNtVIIQ=; b=OrNeg1WZjjuVw30gjAwzaiO7sj
	oDHY7XvUyZdu/tTeO2wKVwemD8cfYvnMmTvXlhaSgISedgyvs4/IB4f5tfjkT+Q0aJm4yAqes1D10
	2jwQmn8GbF+9Q7CZDamnV6JYCLPSZEJQauxKXXfzoeLj7kuiGvJvPC8zcFbKZ1pB8ByePVE2A6Hbg
	vYYpC5QDtFx555QTcBX2YBUVV9wpMpFE+MNUsky/N+dqapF0xIt1oBG0lTlXor0/vTJ9VmM9OS+zv
	guTmjizp/CgHZE8nGoUmuSar5NEv0mu7QPG160CP3u666YXs2oTd/qQrRY1UeWKL5BI0/7b3AcTzJ
	WLRqX/0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpqML-0000000HCXB-20YJ;
	Tue, 10 Feb 2026 16:13:05 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpqMJ-0000000HCWN-1HGH;
	Tue, 10 Feb 2026 16:13:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770739979;
	bh=6/Y48z1fheZE3rm3n9V+OK49uWYPIzUMKUetKEbFzf4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MZ4YPhYxQqngBB/efBNc6lo8JOHegZZL8h0SQP2frwRiOmQjtjQhiL8jUuRUMwewd
	 Y4IlyUw4jyKyuYTZMcbH9jgonNijc5CbOD7VwNwOcKfRFS9oqVwLweV620qReufRiU
	 qp+7BNLDsdL8tkNhC0mrcMsKvwAlGKWIYAiN8hQSG91JyXZP07qZo3mklllPgyhgkO
	 UW+ArEj4GTywBvRwI4/Q2vyRyUUUlmxBNLj1CbvF1yl+mS0Z87c085CUy/x9sOjcbO
	 ylEdYTrIGvBbmtyiEelnazlJurLtYD+sPt761MNvdPJ+aKkW4EdyyNDw/+LxsYoamP
	 ZH6tCMJvYu7Zg==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:7872:ec71:6d40:b8ea])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 36E6817E0E90;
	Tue, 10 Feb 2026 17:12:59 +0100 (CET)
From: Laura Nao <laura.nao@collabora.com>
To: aford173@gmail.com
Cc: angelogioacchino.delregno@collabora.com,
	broonie@kernel.org,
	laura.nao@collabora.com,
	lgirdwood@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pm@vger.kernel.org,
	matthias.bgg@gmail.com,
	mturquette@baylibre.com,
	nfraprado@collabora.com,
	sboyd@kernel.org,
	ulf.hansson@linaro.org
Subject: Re: [PATCH 3/5] clk: mediatek: Fix MT8196 topckgen orphan clock
Date: Tue, 10 Feb 2026 17:12:44 +0100
Message-Id: <20260210161244.42828-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260210053708.17239-3-aford173@gmail.com>
References: <20260210053708.17239-3-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_081303_517590_8E3782D9 
X-CRM114-Status: GOOD (  14.84  )
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

On 2/10/26 06:37, Adam Ford wrote:
> There is a clock with its name spelled incorrecly, so when a child tries
> to associate itself to a parent, there isn't a parent.  Fixing the name
> restores the proper parent-child relations of this clocks and eliminates
> the orphaned clock.
>
> Fixes: 895ab0134d64 ("clk: mediatek: Add MT8196 topckgen clock support")
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
>  drivers/clk/mediatek/clk-mt8196-topckgen.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/mediatek/clk-mt8196-topckgen.c b/drivers/clk/mediatek/clk-mt8196-topckgen.c
> index 6ace11ef6b69..2482597b9b7a 100644
> --- a/drivers/clk/mediatek/clk-mt8196-topckgen.c
> +++ b/drivers/clk/mediatek/clk-mt8196-topckgen.c
> @@ -324,7 +324,7 @@ static const char * const emi_parents[] = {
>  	"mainpll_d5_d8",
>  	"mainpll_d5_d4",
>  	"mainpll_d4_d4",
> -	"emipll1_ck"
> +	"emipll"
>  };
>  
>  static const char * const ap2conn_host_parents[] = {

Reviewed-by: Laura Nao <laura.nao@collabora.com>


