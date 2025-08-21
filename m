Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714C5CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 03:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UOEidWIYFOcPQc5k2cWSdnWss7AqeJmy+kRLikq18m4=; b=OiwMWdzsQvgVPj24aQBVsCwll+
	sortgIh48I2IBr20oPEceQXKce5VYUZ9UEKN40//X78EJNVjqEfLAGeKRDtnjcAC8CPno8zwf/eYJ
	dT/oynIVyLABOVBF/dmR+2/IYWmQ/ZXYFHDYtnbSelq0lo3Z2SueeXgHpjojiwGPqiEdSjMZ/odwC
	hjzDAamE4Ui6dAxJLG8L6aCNYiQjrCU8gRowozD9vTTEHkrQaHaDyIw3UjC3xgH6vGpdzovT0piwL
	k7az96qwkhWdDeGjXStdEayGGL+1T6O7249Et5sfh1LpnLdo1n3iCW42lYXVYiW/zJwHy5UKy+mMv
	pE78Ofrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIWa-00000001OZh-0IWa;
	Fri, 22 Aug 2025 03:33:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upD77-00000000gvF-3gEK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 21:46:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755812788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UOEidWIYFOcPQc5k2cWSdnWss7AqeJmy+kRLikq18m4=;
	b=K8Ah7uDhCPqerNmb4nVEJWvyZZyKKUflA1cziygM+Ve249/l3ZGLl0TvvteiC9CWnLSe/x
	vE1yJrRTtG2RgqcEjgiY67nZ95glF0HthDVB77wIeXy0mDgUlFPkJQaIfIJmP/+YdAd/P5
	9H53nhE9FSWOgdCF7WLqqo1+UpkJw/c=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-uyQRpXnROpKwlMLlk7Dx_g-1; Thu, 21 Aug 2025 17:46:27 -0400
X-MC-Unique: uyQRpXnROpKwlMLlk7Dx_g-1
X-Mimecast-MFC-AGG-ID: uyQRpXnROpKwlMLlk7Dx_g_1755812786
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b2955f64b1so44705691cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 14:46:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755812786; x=1756417586;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UOEidWIYFOcPQc5k2cWSdnWss7AqeJmy+kRLikq18m4=;
        b=JyxW2dUVag5SZZxeakUjhKEuy7HIeaeY9Gp4ompkJoMEA/93cZxd0FjVoYviu5kFi2
         p6reyalg3g3vRf/D4qzkJetNSecfpP+3lZaKSIFzCQU0J4WzJX9qXiiGa66NG7eNJ3ot
         y2z4HPlf/Kg4NwINO5p2/K1CC6TZX3JHL9zx9a3LiuuPdwyG0CCBxXU74WRPK1En6IJD
         F+fuFV/KhtttC5lok5acMug8S8iMwYMPz9y6/bjWIzvsy5ykulzuMK/vhe0xN5qvmOFV
         xMSQ2YxVXyPMQnW8sh/lpGnsa97Ry/+LpGXuHJo3y7X4WjvImuaKlCfFD2J53Rp5jUH5
         adrg==
X-Forwarded-Encrypted: i=1; AJvYcCU0LuNisW+oU7XURjlGR0ogLAfABv7aWm4r0tdO3lWc0ZO6X081+a4zDRVLLcWZPgM4ZMApNRyzgeu5WUzoEnQL@lists.infradead.org
X-Gm-Message-State: AOJu0YzvRymjwz+z4G3eGe2cTmja9vf/58If7k7jLRQj/+vzUXLiMmUr
	9DVYUiQQ95oUjsZVdp0dcC9ZRvxY2EiI9pfq/QXWteJt/u7t3L2Tt66mC6U5pQLs/YhutV22QBm
	bfnB1c2wNCpFMAbzh0yka5MpXPRJQ21Bejr29U2ri224/dGafoJbct/dm/LDc998DGF6gqoFv7b
	AL
X-Gm-Gg: ASbGncuWdIjutUhuVvm+yaftL5BqbXUVTtqyTMXDKoMISezkxRRD4xWfedDXBPPVPC1
	g/V4Rne2ADH8Y8FeZNsrAKVbSF9UWGMPUUdJMJnYD3IJt5AVpIUzbJfeAlMTRm8KeBAWHxpiMw9
	n7J0s+ewo4lQAKSsjM/bH8ksKbVy3GqnWS9uOiDkNrbLMi79fyLB+HOXj9awpZ0fq5/y3iRzq2a
	8VUX1w+mHrw0tCmg596GiZ2MVNOign32SIiMZLf8roYpzXNhUEYRcYSDR47TAUzoW8KxxSDU8/y
	3hslAbe64qgmKOuGiJ0uR875oy5SGvScn5XDOYWYdsM4kVkRBtcBBS8IVmjWkk7IxDG2zAiy5Wv
	ihXCRHTzFasaPo1rY3fQ=
X-Received: by 2002:ac8:5812:0:b0:4b0:73db:f81b with SMTP id d75a77b69052e-4b2aaa1a378mr10332731cf.10.1755812786467;
        Thu, 21 Aug 2025 14:46:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGM/f6AWKsD/uiuSUkJzb9jNkg9oqjjxZOXqxlVkr171nvQa2lEbcNla+IOhlEltLwBQr891g==
X-Received: by 2002:ac8:5812:0:b0:4b0:73db:f81b with SMTP id d75a77b69052e-4b2aaa1a378mr10332491cf.10.1755812786097;
        Thu, 21 Aug 2025 14:46:26 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e87e020514sm1201852885a.17.2025.08.21.14.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 14:46:25 -0700 (PDT)
Date: Thu, 21 Aug 2025 17:46:19 -0400
From: Brian Masney <bmasney@redhat.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 02/21] clk: remove unneeded 'fast_io' parameter in
 regmap_config
Message-ID: <aKeTq1lJ549a2jnQ@x1>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
 <20250813161517.4746-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
In-Reply-To: <20250813161517.4746-3-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rlhcW_7fhosL7EVwUXafC-bMTUiHChBzRrBSmE1WeJs_1755812786
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_144629_981299_312975AD 
X-CRM114-Status: GOOD (  13.85  )
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

Hi Wolfram,

On Wed, Aug 13, 2025 at 06:14:48PM +0200, Wolfram Sang wrote:
> When using MMIO with regmap, fast_io is implied. No need to set it
> again.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> No dependencies, can be applied directly to the subsystem tree. Buildbot is
> happy, too.
> 
>  drivers/clk/actions/owl-common.c  | 1 -
>  drivers/clk/clk-axm5516.c         | 1 -
>  drivers/clk/nxp/clk-lpc32xx.c     | 1 -
>  drivers/clk/qcom/a53-pll.c        | 1 -
>  drivers/clk/qcom/a7-pll.c         | 1 -
>  drivers/clk/qcom/apss-ipq-pll.c   | 1 -
>  drivers/clk/qcom/clk-cbf-8996.c   | 1 -
>  drivers/clk/qcom/clk-cpu-8996.c   | 1 -
>  drivers/clk/qcom/hfpll.c          | 1 -
>  drivers/clk/qcom/ipq-cmn-pll.c    | 1 -
>  drivers/clk/thead/clk-th1520-ap.c | 1 -
>  11 files changed, 11 deletions(-)

These all look good to me.

Reviewed-by: Brian Masney <bmasney@redhat.com>

Should drivers/clk/sprd/common.c also be updated as well?

Brian


