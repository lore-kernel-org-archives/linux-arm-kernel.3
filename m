Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90A4CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LWmLd+rLGF8wp2MGoAWUFRqguzK3p2qoTL1+rkmSfkI=; b=XQK8FiC60STcaWsFFhR+wY18ZA
	3a+7ezgqPmTeuXlT6nr//vbyMXU1d2xpw6SZ10aWxht8mJ+g6H4/EbF0bW3bGa5/PnQ7QRpfitJds
	8DeCUsDmDp/xwpzqLu1wRGvZL4SCMKCxPvtB4JCW0JvNP35t/23/3I3fqlwrXDrhtOrnZ+vu3jJ+v
	8nOCXTHxsQuTZRvOqzzhUzKsaqyK5LVXerqxu7GtRDHgfNAM6++W+H+4RxYchA1+XcjwYGcA0MmIW
	6UiDoY0lFflD4+gq9fpLWYtTjmtflLjTAWmxQM+Cu9JzCFAHUVKSBjwdfrCn+c21sd7BxiE0pJg1G
	7SB6/5IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCevY-0000000BsFl-2hVT;
	Fri, 02 Oct 2026 15:12:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCevW-0000000BsF1-3LQc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 15:12:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790953918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LWmLd+rLGF8wp2MGoAWUFRqguzK3p2qoTL1+rkmSfkI=;
	b=VIj4M1lGrl4ak7hE9jiGTMhpPJ4vVUHRdhpZmjXhdiTFOlA8h5lnB+R3KR5oAwB4xX9WmD
	mxha+TYV40mHn2e+qqtSv6HToRZkLlIisSiwM8itJ8C3it+ZQjYu6THWcbsz05Bsmla+AQ
	41POWjiBgqZqXNhx4FDa5blWM2HDGM8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-Vxx4vT8xM4esArYg4E1JHQ-1; Fri, 02 Oct 2026 11:11:56 -0400
X-MC-Unique: Vxx4vT8xM4esArYg4E1JHQ-1
X-Mimecast-MFC-AGG-ID: Vxx4vT8xM4esArYg4E1JHQ_1790953916
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91785bd637bso453256d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 08:11:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790953916; x=1791558716;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LWmLd+rLGF8wp2MGoAWUFRqguzK3p2qoTL1+rkmSfkI=;
        b=ZVoOkPmtKqYv1rKPdqOB6WdV16wVTZCRHMh8mIFBV3xaOkv1OlWmRhk542yxuPwhct
         zJD4cfWy5+KfswMxEPjdVXZ596SSPbhBwCEwVbnyTooeSJjlh3WMocWObqLGOUdEyVco
         M9OUIUeWmIytwmpgkhXI9lV/wcBpXn/rrKbYSp2iT16EBJK9r09O0HJMEafLllbHmjz7
         92GhYj+BvCQyapSWi7iW5XZ/ep0j8Dv+88S5ifYGmGlFYWiFefQox7Oys8wPvoERdcNa
         H22OWSiMLt1FlWDsF8jsrwE6irEG6qDeQ/0pKUqZAD+gYvR4TfohJcmzuUz2b4uZvcUq
         grRg==
X-Forwarded-Encrypted: i=1; AKwUvBznWixdh3WkMGEJQeKueN73698mHESmTHHAq6mLnb5ZPiFuWN+YlU9RN3XT7wrcvsFQlnHQYNM5sk77qKkregoq@lists.infradead.org
X-Gm-Message-State: AFuF++nhpZpTGLl8xTC+BIArY8Tv6WWJxq2W30my3+0IUohugfASdky6
	wtbEvxLl5GJzH/9a0+lUgVpf4i57+Dpn5pXZrEVB4wpLCJGsohAHp/6A6dgULRSDNm5cwD3zUAx
	TfbzA3beZ3WpWer+E6sUjLSL2dvTY5Y3d5rIq4XoOlpfOMqkKG80e/YQNfkzcmhIxCzQ3oU+lgQ
	tq
X-Gm-Gg: AYBFou1zQCEKgv5n2mP43F5A+t0vWaYZvT3HaiLG3ElN7WCrHgzcraYjRnUQNUHuCmD
	jFv+4gxA1U23SRUqRGTK+YZ+dmD4qFnU3tOphDQ2IAgdKcpUbHOXAHvwfFtpprGEvc6BaeOx0zu
	CGm/0PT4Ep2ElV7vUBouWiPCPPC9nsxcQDnvhXxD3GajwYnMe/c/HqkWU2ZtAzBQnQxjr3bCvOf
	ndt6UyeBqs6gB1B8GBb29zp2LdfvQYI43PDgwnN/W9uBpMdkoxEJzyi3olZY4O56IYUsYXNDWnu
	JYHHYeeJet8UXC59dRtUFLjo74cBYpF7kaeeOomZcR4kmxX/nQVXF7ZbstJOVStDXaYwHvh9N/d
	CVWBFWmyraonEBGOSPKlmv6z/rS/P28snWEI=
X-Received: by 2002:a05:620a:26a6:b0:93c:5efa:39ae with SMTP id af79cd13be357-93ce7c1228emr548898785a.12.1790953915776;
        Fri, 02 Oct 2026 08:11:55 -0700 (PDT)
X-Received: by 2002:a05:620a:26a6:b0:93c:5efa:39ae with SMTP id af79cd13be357-93ce7c1228emr548889585a.12.1790953914967;
        Fri, 02 Oct 2026 08:11:54 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca1a433dsm240505285a.13.2026.10.02.08.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:11:53 -0700 (PDT)
Date: Fri, 2 Oct 2026 11:11:51 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: linux-clk@vger.kernel.org, Brian Masney <bmasney+clk@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, mturquette@baylibre.com
Subject: Re: [GIT PULL] clk: zte: zx297520v3 clock bindings and driver (v2)
Message-ID: <ar_Jt4eIPy1-uq1-@redhat.com>
References: <hUBEMGo3TGyVsIj5LaphmQ@gmail.com>
MIME-Version: 1.0
In-Reply-To: <hUBEMGo3TGyVsIj5LaphmQ@gmail.com>
User-Agent: Mutt/2.4.2 (2026-08-30)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jaIMrcr4Hc_hSFybwcnhg5qV65S8uEYPzyGWvE3DEtg_1790953916
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_081158_916895_FB3F6552 
X-CRM114-Status: GOOD (  19.69  )
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

Hi Stefan,

On Thu, Oct 01, 2026 at 08:39:27PM +0300, Stefan Dösinger wrote:
> Hi,
> 
> This pull request contains the device tree bindings and clock driver for
> ZTE zx297520v3 boards. It contains the next step in adding support for
> zx297520v3 boards: Documenting clock and reset manager hardware and
> adding drivers for its PLLs and clock tree. This is v2 of the pull
> request, based on v7.3-rc1 rather than clk-next.
> 
> The patches have been reviewed and carry appropriate R-B tags by
> Krzysztof Kozlowski (bindings) and Brian Masney (clk driver).
> 
> The PR does not contain the MFD, reset and device tree patches. They
> will be submitted to the MFD, reset and soc trees respectively. The
> clock driver compiles without them, but won't be instantiated without
> the MFD parent.
> 
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://gitlab.com/stefandoesinger/zx297520-kernel.git tags/v2-zx29-clk-for-7.4
> 
> for you to fetch changes up to 75e4151c9e157d84c8c6c365893ecf33d221bca5:
> 
>   clk: zte: Introduce a driver for zx297520v3 LSP clocks (2026-10-01 20:20:43 +0300)
> 
> ----------------------------------------------------------------
> clk: zte: Add clock drivers for zx297520v3 SoC
> 
> This tag contains the device tree bindings and clock driver for ZTE
> zx297520v3 boards. It contains the next step in adding support for
> zx297520v3 boards: Documenting clock and reset manager hardware and
> adding drivers for its PLLs and clock tree.
> 
> The PR does not contain the MFD, reset and device tree patches. They
> will be submitted to the MFD, reset and soc trees respectively. The
> clock driver compiles without them, but won't be instantiated without
> the MFD parent.
> 
> ----------------------------------------------------------------
> Stefan Dösinger (9):
>       dt-bindings: clk: zte: Add zx297520v3 top clock and reset controller
>       dt-bindings: clk: zte: Add zx297520v3 matrix clock and reset controller
>       dt-bindings: clk: zte: Add zx297520v3 LSP clock and reset controller
>       clk: zte: Add Clock registration infrastructure
>       clk: zte: Add regmap-based clocks
>       clk: zte: Add zx PLL support infrastructure
>       clk: zte: Introduce a driver for zx297520v3 top clocks
>       clk: zte: Introduce a driver for zx297520v3 matrix clocks
>       clk: zte: Introduce a driver for zx297520v3 LSP clocks

The commits in the pull have the changelog in the commit message. For
example:

https://gitlab.com/stefandoesinger/zx297520-kernel/-/commit/75e4151c9e157d84c8c6c365893ecf33d221bca5

I went to the last series and cherry picked the relevant commits.

Brian


