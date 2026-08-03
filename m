Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D43A6C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VF0Hp4wXirEtYNRHmmEHQLkJjRzPvWFm3EoPuJFZJNc=; b=2XbOC0ib5n7/mCs8F+kVRI3XXU
	uoOafguRMlIemNClwfvWp27AvQ3PF4mOJex2RhUf08hFKrYrlvoX9KUPUmZtL4gJL9G5JkW+I132c
	lCzm+6KQxiie8w4aItAW5CQpyO/S09f59HZ7VP5cjHMQpZJGQBZhdv5y+WUPDROfmFU7gTVMBXtGD
	6aY5z/JP035XjL9ju8MlFq8XkgcOcVPa6R6+hyoA37DpUh2DeBgSgPTwlTbhZqXUsaNFmYZMARDd0
	wnFMuN18e6rTHBLOkdeeGeBuxl8fnOWJVd55T+qNhqM7i29IZhf3CXyojtFiSW4MCjlX4T+LSo7bM
	1g+cBIHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtvy-0000000HQNj-2105;
	Mon, 03 Aug 2026 14:46:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtvv-0000000HQMy-3Znk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:46:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785768387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VF0Hp4wXirEtYNRHmmEHQLkJjRzPvWFm3EoPuJFZJNc=;
	b=ip26US/zZsv9DGP2rxdXWhy1LlS+gGaWgm9n0tkDocKBU6LGCQKjEfqdOezcai3bvBhRv4
	D1s+Jizp0a9vhP0yGcQsH54PXGMNURr3/sLSs9caRAEsVwIJ8HuN2vQUeawltVyFIvfT4p
	aRxjUjDtNSDRfEKCPY6SregIGiAgnTM=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-170-WPUc08W_PqSv6sKPnnBGyw-1; Mon, 03 Aug 2026 10:46:25 -0400
X-MC-Unique: WPUc08W_PqSv6sKPnnBGyw-1
X-Mimecast-MFC-AGG-ID: WPUc08W_PqSv6sKPnnBGyw_1785768385
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81ec0eb032aso114649367b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 07:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785768385; x=1786373185;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VF0Hp4wXirEtYNRHmmEHQLkJjRzPvWFm3EoPuJFZJNc=;
        b=VBmPVoPvD8WQLgOAhSBsW0OikJ3eogajkNjtLwkxCyupCXh2WrnLPMA7iO7jCGdDjg
         zGKqoqGXu3+vsoQCUNb0G6dROk16leN9Ruk0y5v4GjHU0qVmFnGMd9WifGbW+Eaacw/w
         IOhHdywXbKaMaM8CGDjnha3lRcNSjKDt00338F4fg1VZb9oV/oYLXVqqR9IR/Eme6CRt
         ipV0+eXnYFF7sq8Y0GVqv7NKgbk6LMvnTCSEbxyh1LCr/ZJHqxMDiQtPZH9oFIXJ4nB3
         ZmdjDFWIjzJ/rvdweBAaDrjda5ne/lFTigfsPBqkteYO6oWnLRXCJVqL65Q4O2kGJc4F
         HXpQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq6O0O2fO4C/Gf/HfEiOPc1avmNiv6o6TD/G3l04TWB0FnyJyEhAzq40CbaZaTSSVARSsnViWFmAY7PdN83+4Dz@lists.infradead.org
X-Gm-Message-State: AOJu0YyUerHSt5W/a3R9TcovmDBL7OqlMJV+8bJyQFZMTWoqMrlMduiS
	lb+4KWULZ7FccYZwn3n1kkbcAi7LRW20dEdiL5PgTFyW227Xj3dYdMrFRMpJF/9chdiwPO06QPM
	2VG967JfG/VjEhsSnH8tEs5fXojC5U6cpu+3SOvF+vI+wDkFEJ7pcegJg+BgijQepGx5iJwp9Tk
	vt
X-Gm-Gg: AR+sD13JdxzSCIcadw9isYDCJfNGeGalXZIi4hSXBJ2oBF0PWARRtVq5uuPVeCzveT4
	qHlGe734ZZbLFERH0F5ChozVECWF7bH85tg4QAzSFHLC7Moe9utF+eyN97UF4edmPKnb4l21GkE
	yEoc3wPcYPw+crNm0dlFbJ7KtZOY0xZIATW8iFxj2VydOw9qhaNbylnB6axdqkxDjZvKCV+nOT5
	E3kJ+Ye6nwWb2m4GwrvQAVq2y7U2o9hZGDARQ+Uf6O1/OhjJz+yuZCqjaRne8o2oEBdIy+5tZCp
	3t/ettOJmyjEW4/5cOy9kn9h+HYDlhVcpo759dwQqf0/Q/+vGAGQehD91eF9rONiyA2pJXFqhW3
	FYXOhwUmY4p/QZ7tCTDFw7OF5wYE46lW8Fv8=
X-Received: by 2002:a05:690c:a9a:b0:80b:9114:3b7e with SMTP id 00721157ae682-81fd4a2d85amr133508277b3.12.1785768384892;
        Mon, 03 Aug 2026 07:46:24 -0700 (PDT)
X-Received: by 2002:a05:690c:a9a:b0:80b:9114:3b7e with SMTP id 00721157ae682-81fd4a2d85amr133507827b3.12.1785768384377;
        Mon, 03 Aug 2026 07:46:24 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf2e2bbsm55709907b3.9.2026.08.03.07.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:46:23 -0700 (PDT)
Date: Mon, 3 Aug 2026 10:46:21 -0400
From: Brian Masney <bmasney@redhat.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v5 15/25] clk: mediatek: pllfh: Add ops for PLLs using
 set/clr regs
Message-ID: <anCpvYJJf2FChBHE@redhat.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-15-ac4410697cc2@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-15-ac4410697cc2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: E_wzWHLeF7cWssjagX5TX4NAHa3hAvYUj5kKDCCZkHo_1785768385
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_074627_964321_9A8D3796 
X-CRM114-Status: GOOD (  11.76  )
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

On Sat, Aug 01, 2026 at 01:21:01PM +0200, Louis-Alexis Eyraud wrote:
> Add new set of PLL FHCTL clock operations, that uses the new prepare
> and unprepare methods, added in PLL for MT8189 SoC to support this
> logic.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


