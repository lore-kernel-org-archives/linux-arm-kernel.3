Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B021062896
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 13:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5omYf3UBejq4qWG7tPFgWTcjtBLBdAAToujIJ2lCAvg=; b=VxMpsENm0eBQGOtBeNPoyMY2vX
	rim9z0k+EkAevZmlSuoU0+CGthqa5etQgrNCLAhEuUUjBt9Gf1vqVjguulX65M+jYLOY1DEIRmUNk
	VxeHGrmLtIGlaLbmVr7xrup3mXujtx7Y3XUBn3gvAlFYV5bSGGzLjgRfuad20stMHFHicALaEIbpJ
	hcQS8NscLlmxBamKc7ugJYF1iOi9Phn7DW/0dl7sK/zpKl+yR0Kz8jMfzz3LvHWl2iBG4IDyEpR0D
	SvGiVk0cL+lKbGdQwMJF9gG4/wWh+L9HSR9LCfUm6M3EgCbf+0YEKUiL+Cg2XHao2SVppfsbITLxy
	b1nmXeMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0JBl-0000000Bbo4-1UIT;
	Wed, 11 Mar 2026 13:01:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0JBh-0000000BbnZ-0gf5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 13:01:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773234078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5omYf3UBejq4qWG7tPFgWTcjtBLBdAAToujIJ2lCAvg=;
	b=V2ltN/R5DomoiTVJscPK02zhS8zVD1jO+xN+BF/5f7/6fWVEZZacZIgx2/RChHWiN3t8/Y
	otilyztiyKbUMd8OULoMwrhcl+1GglOu/mHhosW3VNuzlRH7fRNSGRiX8K3id9o4tg4x11
	ynr22KBPn7uE+liaDIi/YPmVqL6auu8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-157-509z79LXOYWdqxKJTdOe_w-1; Wed, 11 Mar 2026 09:01:16 -0400
X-MC-Unique: 509z79LXOYWdqxKJTdOe_w-1
X-Mimecast-MFC-AGG-ID: 509z79LXOYWdqxKJTdOe_w_1773234075
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b94062e85f9so677184866b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 06:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773234075; x=1773838875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5omYf3UBejq4qWG7tPFgWTcjtBLBdAAToujIJ2lCAvg=;
        b=OM4cgpoTa6b95k7WSi4zqevXFJIZfMa58B9QLAl2kpO1lKUNtfzvTEkjxdOVPAhP/h
         3nR+siCpf6D9UU3FEo9nk7pqErRdLNlKtg/Lb/2FauAs0v5xGDKVx2n2EFiN+z+HgenW
         ZfMgShyf8GmTqRMvAeUZWnFIwK0G37b5E1XZOco76xaEPAT0WzioxuwnOovz3f5uCatk
         mWspbW3HtrWRMMGWxptsxYnjGzn0N/77STvMydCbawkwcFVTTWlkfv99de8X7j7JBs33
         ecc4SPezDd7XBWJj2vJCC3i6JSJZMUA6h1rChnKR5fjjaAOThsFUr7ksLPMt9XT0jg83
         jnuw==
X-Forwarded-Encrypted: i=1; AJvYcCXDr/OOJvpYK/eEjnFWz0dfjobX4Xa6tYxtzo6L4Wqs9UlGVeFiFnu4ySkKquiDDf6v9Zx14h77wJNFxk1l0VXE@lists.infradead.org
X-Gm-Message-State: AOJu0YxS+NKKc+6R99cry+Q5kfmsW06HgglWuTcRlJxFDIY+oWOoGdVx
	5SgsiCElR3HtYxrRDxqldMW8JgayFCTIOLyRxqr195oShYIecN+pmWfcAsw0KfmOqxJghB5zOJT
	DoFHgib/uJ9u/GkJsdzZ4AZVnxVmkHBRs46cY6cMPsseLwxGxWJl641mAT2hmaaBj4LeuzTgD4b
	Qd7yE3y7h6L6AGXTa4aPBTTY4rdHe0Gd2/GXvRYTufjI/RiFhG7Mo=
X-Gm-Gg: ATEYQzz2CESg4IrkzeYVzNKxFdIJEraIO3HunUvQnnhsAZxtw7Ct7LZ4j/TeugNa56H
	UjWfgg/Nn1mMVOK8EuxRoUlkO3Htxya+UvSKiryvvVujFjpX8D0EDIbhfOzmeIr3nPKil/qIQon
	5BRhSVTa2U6bv3kuhxv+1vG8CNPhKZIdtry64i4o7lx9s4CyXNwVlyLCBsYQp/JMJdyd8zqSKkt
	fIsUw==
X-Received: by 2002:a17:906:7314:b0:b93:edc0:e2e8 with SMTP id a640c23a62f3a-b972e6069a2mr143084166b.48.1773234075141;
        Wed, 11 Mar 2026 06:01:15 -0700 (PDT)
X-Received: by 2002:a17:906:7314:b0:b93:edc0:e2e8 with SMTP id
 a640c23a62f3a-b972e6069a2mr143080266b.48.1773234074508; Wed, 11 Mar 2026
 06:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com> <c7d47b6d-caf7-426b-944e-7debb7d69045@linaro.org>
In-Reply-To: <c7d47b6d-caf7-426b-944e-7debb7d69045@linaro.org>
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 11 Mar 2026 09:01:02 -0400
X-Gm-Features: AaiRm52EdqmkwN8CGi7SEvZrCO9M1f6Y7hYTKKNfjOzM3D3aXhP9MAnWBZaRjqI
Message-ID: <CABx5tqKC_KocCp+_uJ-t7AhJNa9MZOG=5Dry4UoZXzUvSryiFQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] clk: add new flag CLK_ROUNDING_NOOP
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Andrea della Porta <andrea.porta@suse.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Bjorn Andersson <andersson@kernel.org>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Orson Zhai <orsonzhai@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	arm-scmi@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: URHUQo4_B6a75IC0R8zs4WBixsU__G25BannGK8eP6o_1773234075
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_060121_273625_BB078F7B 
X-CRM114-Status: GOOD (  11.05  )
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

On Wed, Mar 11, 2026 at 7:51=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
> On 3/9/26 4:38 PM, Brian Masney wrote:
> > Note this series depends on 3 previously-posted patches in this git pul=
l
> > to Stephen for v7.1.
> > https://lore.kernel.org/linux-clk/aZuK4-QJCXUeSxtL@redhat.com/
>
> There's no tags/clk-remove-deprecated-apis-v7.1 on
> https://github.com/masneyb/linux

It is here, unless I am missing something?

https://github.com/masneyb/linux/releases/tag/clk-remove-deprecated-apis-v7=
.1

Brian


