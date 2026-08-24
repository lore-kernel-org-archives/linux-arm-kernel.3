Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49216C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 15:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W56P5fyFkxTQYTvITDSYgEvGIOW/RQqOkycdQuJNc4A=; b=OGXaUmC8zc22+x6DO4xJVqbYeB
	E+MfTJlB4OT0OQkXQzRiT+fuofsayR/U7j9VgQNhruy/gKD7E4GG7MZep2bgqw1D2OTETb9uCYENf
	dKiesBA1l6yA8Z0YfM4vhfRZGEbE6nwX6M1d1OHIUj0ahTbzJjjIaqZflDkG2z2rIpRZceCfRKfvE
	NWEp8XVKee6VHgNRrDSMh6GSXGAn43Ue/RnlsAyFNlvP1iL/DSiYPc5cK7l9s3C7TlDqXh0nfHR/Z
	Om8AHDWjGuF+NINTsUd6t5MCUEX9K+Ru8cqS5XHl2ob0Qnzm33vfNOmu0Wfj96+P343NS0Sq9lmWx
	dZKNyXXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWSO-0000000Gtss-0n7H;
	Mon, 24 Aug 2026 15:19:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWSL-0000000GtsO-2mtp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 15:19:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787584764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W56P5fyFkxTQYTvITDSYgEvGIOW/RQqOkycdQuJNc4A=;
	b=EIVx3+/rlDVQHNI4OBcslJp9asyIc5IE5JPv2efzq9cGLOu+aIORrMA/Zbfp64F1ZBxNp+
	iOOJu6WoX2FN97ahEI2fZsRVXAQ38C0ZZbg8qIuM1z5LCOLm+oucBWZwrUBBeM/4BiS7Ah
	cpqzYr9mS9kaafspH7QeEGenBAH9dys=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-DgRcOvBMOVesOfuvyUvSew-1; Mon, 24 Aug 2026 11:19:23 -0400
X-MC-Unique: DgRcOvBMOVesOfuvyUvSew-1
X-Mimecast-MFC-AGG-ID: DgRcOvBMOVesOfuvyUvSew_1787584763
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0e702df8so48803261cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 08:19:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584763; x=1788189563;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W56P5fyFkxTQYTvITDSYgEvGIOW/RQqOkycdQuJNc4A=;
        b=lbg4//8Mw62NbKhGFseS2MCQphDFKCVnsX+L1RmVVKTbyb4ZecEb2njdrgttD08FB6
         U6iiglI8rItDJnznvhQJ/EIg3oADwb8QfiAFJg6OmfkNJJ7Q0S5pLRg56jqfIgOXqMHj
         NVGgEncUeX03P7LF5tUEudCdSYDpyY7+jxyfAX1mOIcUZRS1s3Lb5UMjaaL4QQ9OFpT2
         mxFfXTpp/MmVWyJytwcwwPi+hU92SjqsM1f125G2hBkFCYliT8oBc888LhcHt4dQ8Iuk
         4v1sKFzOT4j//ZBRIzmGzGa2eSE8TxyJurmg8K4u5lfFIeA6636+k/zhXcbffH8il3kl
         prZg==
X-Forwarded-Encrypted: i=1; AHgh+RrxppEdCj/NZDBF5TXnjq1v8VvU5qCl0f1JZQbXbqzC7R4l/YpebPeQFCff7oud3Bu5VGedM97lxIpe4kwUYO9I@lists.infradead.org
X-Gm-Message-State: AFuF++kLX7C740WrFCiKwlJqba7A97021+CcHNYhHBWO6bBfqH7e+qpC
	iyF1mF0nIhlJh8ZTJsAuAVWqckD+uI1rIWF/srXHkcd+db9iiwgRoCQQBG+PcAE0VHFiOVYq1gP
	AAici7iByomnfA7N/sQhxWt7aw3R7mgpTAcZarBeJiftivIsL6MFnOS272BC+c5vn0hK6Nhu3HH
	+G
X-Gm-Gg: AR+sD108+EaD7JfnocQ2cjT0vMTzUVCfNjPIHw0JIBPW5XpG/GiZv4hs5/d6kjimtHi
	pNrq1zniV35TUDiNdL/Lnk9SMy90KJdnO67ukQiXOFDBIpvRYDnkNDYpxOSAhm/QZrVAdKONoBu
	ZJLB3a8EtCN+B7CVKxjGq/+KqIe/blEVVGudXIkYuUiYbtZ+ZdolNPlMfCLKTm+DjfgpA34BfrT
	KRMGXcv33H8jQfR3NcUDnPPORBkYy1pxfgImhj7igzRz9lYn4jFZvUGYhikmDioHN6rIZtvQ9nU
	b6rDPcvYTVXiw+UxXyfvzxauQP48lOaW0sR/y4E01Whx/ri9JSe1yA52GrwZmJje/qjjeiTgXRJ
	XGbwOdKY2R7g2vOP6Ylv+m44ZUsDaQw088uI=
X-Received: by 2002:ac8:7f8d:0:b0:51c:257c:8164 with SMTP id d75a77b69052e-52df59fb802mr250057501cf.25.1787584762583;
        Mon, 24 Aug 2026 08:19:22 -0700 (PDT)
X-Received: by 2002:ac8:7f8d:0:b0:51c:257c:8164 with SMTP id d75a77b69052e-52df59fb802mr250056601cf.25.1787584762022;
        Mon, 24 Aug 2026 08:19:22 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52e09aca33esm48989201cf.21.2026.08.24.08.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:19:21 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:19:20 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] soc/tegra: pmc: Make sure clk_init_data is fully
 initialized
Message-ID: <aoxg-FCFslaM9Ep_@redhat.com>
References: <cover.1787239869.git.geert+renesas@glider.be>
 <70aca0e57b9900db051aade5a1af2e42c4d30ea5.1787239869.git.geert+renesas@glider.be>
MIME-Version: 1.0
In-Reply-To: <70aca0e57b9900db051aade5a1af2e42c4d30ea5.1787239869.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: H0aSXgbUrP7jr-nKGAsHhU9DBN2yNkg0PEz4PmG9jBw_1787584763
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_081925_781857_4F255E4B 
X-CRM114-Status: GOOD (  12.86  )
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

On Fri, Aug 21, 2026 at 10:52:25AM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>


