Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26268F99C7C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Apr 2026 11:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Content-Transfer-Encoding:Mime-Version:From:To:Cc:Subject:Message-Id:Date:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1PZzSDw81hRZRRqH1lyU5lL5gUPg/d7AkG9p+pNajqc=; b=UzEMH/YRqUCCUrmOz2utNzA/Np
	Cmh9c9YFoBoGnduFSr5sy3pujDZLHb3kBbsB5VaF32Ab3tDcFEfivG7gutqUClXXJox/DjUC+BbG9
	X+0AbuEIj6gp0h5+xnKLrmG1ZmKIr+AJ1GZeDUG0vP6yKMKIHsKzQMAHtUKms91vJGSDn84E+aJVB
	uErss09THvqe+VviqyCDnJsXZXTDGiXxw6GEeJ438zWm64McSKZCbHDltWC4da54rllYl0uVF2LSZ
	UVLl6tiiVQweCdTDfAoz7HXNiAArSBMY/0M+StRgK092VVn8s6xH+LdHZhw/wZAWrLwlZPJ9cAB+R
	2l1uVQsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wE3m7-00000004w8y-4B8A;
	Sat, 18 Apr 2026 11:23:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wE3m3-00000004w8G-3NpR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Apr 2026 11:23:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6814C41525;
	Sat, 18 Apr 2026 11:23:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9ACDC19424;
	Sat, 18 Apr 2026 11:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776511422;
	bh=1PZzSDw81hRZRRqH1lyU5lL5gUPg/d7AkG9p+pNajqc=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=nARu2TGlb3OxKTBxY0v4ryOPwRsmK7mP3BzIJySrVyYOQYMShM6XMYT2bu5XJYt6O
	 Nmli31ccJV9A7sQSZwx4Ma7ZV44fQeB7HWWKzTuL/5ttuyEc1IMnIphNwWMtHfmuuh
	 9htSL1O9kHOs2UFljq3pHfd9wzm1qrPSEukfR7GWjte0QiWfJAIBaVxAbQd9K7ur+Q
	 cjIHwCQcVWFcD3TEs38ALyF7wuXfXDaazc6CNy0bxBB/HXLLbpBt1bK0+Ahcy+tCzB
	 uooaHX+dAWdBhfLtBI6wOlv9n3R80BNEK7y33dkDscRpGA4DERBwH7T1OFADVngVCk
	 fgQs5l/IEZ7sQ==
Content-Type: text/plain; charset=UTF-8
Date: Sat, 18 Apr 2026 13:23:36 +0200
Message-Id: <DHW8QM1XH6ID.3F65U7700AJSM@kernel.org>
Subject: Re: [PATCH v2 0/9] driver core / pmdomain: Add support for fined
 grained sync_state
Cc: "Saravana Kannan" <saravanak@kernel.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <linux-pm@vger.kernel.org>, "Sudeep Holla" <sudeep.holla@kernel.org>,
 "Cristian Marussi" <cristian.marussi@arm.com>, "Kevin Hilman"
 <khilman@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Abel Vesa" <abel.vesa@oss.qualcomm.com>, "Peng
 Fan" <peng.fan@oss.nxp.com>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Maulik Shah"
 <maulik.shah@oss.qualcomm.com>, "Konrad Dybcio" <konradybcio@kernel.org>,
 "Thierry Reding" <thierry.reding@gmail.com>, "Jonathan Hunter"
 <jonathanh@nvidia.com>, "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <driver-core@lists.linux.dev>
To: "Ulf Hansson" <ulf.hansson@linaro.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20260410104058.83748-1-ulf.hansson@linaro.org>
 <CAPDyKFrPz9gaBBp6xV1=KkoemEfapc0p3POZxuBTvDw7Vamxtg@mail.gmail.com>
In-Reply-To: <CAPDyKFrPz9gaBBp6xV1=KkoemEfapc0p3POZxuBTvDw7Vamxtg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260418_042343_926160_E5D671E7 
X-CRM114-Status: UNSURE (   4.83  )
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

On Fri Apr 17, 2026 at 1:27 PM CEST, Ulf Hansson wrote:
> + Danilo (for the driver core changes)

Thanks -- please also remember to Cc: driver-core@lists.linux.dev.

