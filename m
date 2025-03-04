Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6ADBC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 00:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U6X6RdB4UjE6/nuAZYBU8R5Fe+11M30bcPZso+kk5zo=; b=O5/sLef+gS3BkjmC+aGQlV4BcW
	AGNwEe2KIawU+GPYyH7rHIOpesHJpueNB61LGaFEqXY6VH/yOgSFAV36qaW0SkT4Dq8K1OpCPaDNd
	pQBBBSHO+A4fOcSg+0uZr1vPA/XI1EFxPBNfRP1C/NGhcUGMxxEWxZQ5XhEDGJQ62h39zInK7oQlu
	7OL9motYaHtpI/mSEaNhH5YNRsztd8K2pZwLeonRuPp9gA9/5ZCCVh2yPx5JhaztzkVWJOikDsw0d
	WcDMDQO5fA43Yuyi4weFmx6zVbuf6/+i7lu76JaKizK30pt79NAlqiPl4P7Sqrp4VazhnNnLOGkBA
	J+S/JJ6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpGKF-00000002g8v-1Bw7;
	Tue, 04 Mar 2025 00:39:59 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpGIe-00000002fnt-3D3X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 00:38:21 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43bca0048c3so11505e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 16:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741048698; x=1741653498; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U6X6RdB4UjE6/nuAZYBU8R5Fe+11M30bcPZso+kk5zo=;
        b=cDadqx6+A+3lhdhV3BImcu5LAzM1OsYkHS+yHMp0C+WPMnqxoXvpzfITcOILtvsXCM
         7/Iq33DvvLuFWMH0T3PIad3cDjtnL4IOIo84iABa6LXwfvAp9VRs5f7IlmWp8GEc/l62
         hvjt68e9Hsr/wgU0C9yCpYlHjfDe7L1R7cgxJDUQm+UjP7mQG+PnmSGtjrYmWiuupJ7+
         rn7r4onRmGWBHLE/kT7284n+VeTWce6XMVTyHGtbKbOmm2vvZX6hx6pmmrRqgEDT+6KT
         M+yPBZNo2d2vexjZF3HL56iiZ2ELFMslZwrard9bW5NV6xDX7U0WcI9kRLwiqNGII0ep
         +rQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741048698; x=1741653498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6X6RdB4UjE6/nuAZYBU8R5Fe+11M30bcPZso+kk5zo=;
        b=Zb6O6/aPsGhXZRSRs1Tj3IzLMBiJbnu9x5MeydjYgTun6DDLYWle+tfejWvUc0nUAt
         aCcMZN26OKx0vufijDSLz6yfUQ7wPn3jMIsIQij/D/ytgKTLnyO3MbYpzcFhdB8sfJSM
         r0/nyu/M/7TGWGgtaN3evgxhpzzVjEzSMqknQDpjvQjd9mEQ/2gqbI/PkcKMa3yaa/3i
         Rz37an6BIPjEysZA2FEUd20PppFM4fzEzteLMIsrlUEI2t6CK5rUxaDtiXLks4EtEfxE
         Al/VsiGoYl41BsMNjLO2SC3ou11580dNa6oAK4pAdl510n2GcMS+6aWMETo50cqG9jub
         YUJg==
X-Forwarded-Encrypted: i=1; AJvYcCU8ztRREgD0XpY63p/Y+IVA46FOXhMSVLTV6zgcegT+VvS+MOtCzWscw505+VI4PxqDT1qHAuaNTJ1hhhnxR5L4@lists.infradead.org
X-Gm-Message-State: AOJu0YwqQtkxl6b1xe84j8G2LgYdXRMqR5BIvAS9SJn8GlrgMF6GjWJo
	ISqLed/teGwgieSUInxWAhrS3Sg3LEb5fsOvyyGQkOCaHmrO+IkL2M8NNcWtxUx6oVR1joDJd5h
	yHMuY
X-Gm-Gg: ASbGncuaL9W84dkuRpuqEiVoanodNboIsgfooh/2450kuwKtVoRfLWyH0/5mNX9sU3Q
	BDBV77J2fiCNjvdhT0jDwwVVCXxY1dGpSWWFDbbFN+D2CDWgbRKUpLXSg5U41mVxe4ZQAOziI/i
	hm8rsjzwooolgvjFwE5YvqDHz5NA3hFsTnbShb020XC55HD+f8A/P4R+PNC3QpX5PNDerDVYDr8
	dnpoQVOLTpfw5q2hK6UyN29DS5o+/HhOfuYO8Qh2aDQyIpU8dS22Riy1rltYm8s2dZfhBdoCdHE
	vT00f+OUoRclPCDy5alsvkPqfqkF5Qp8aUuh03jzepBkKu/64TLYkJfIXD3uQSv48fOv9Z7X4Sv
	ciallvy5a/t8I
X-Google-Smtp-Source: AGHT+IE9Y0VrehBJlDbDHPyoWXw+m1J69GUEuvY40Y+njXxv5FVs5PR5YGF4xAoIWOX1sa7YhrCg7Q==
X-Received: by 2002:a05:600c:4295:b0:43b:c396:7405 with SMTP id 5b1f17b1804b1-43bcbe292f1mr260995e9.7.1741048698270;
        Mon, 03 Mar 2025 16:38:18 -0800 (PST)
Received: from google.com (100.235.22.34.bc.googleusercontent.com. [34.22.235.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485dcc1sm15629062f8f.87.2025.03.03.16.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 16:38:17 -0800 (PST)
Date: Tue, 4 Mar 2025 00:38:15 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
	catalin.marinas@arm.com, joey.gouly@arm.com, oliver.upton@linux.dev,
	snehalreddy@google.com, suzuki.poulose@arm.com,
	vdonnefort@google.com, yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH v2 2/4] KVM: arm64: Move the ffa_to_linux definition to
 the ffa header
Message-ID: <Z8ZLdwmFzS-lnssj@google.com>
References: <20250227181750.3606372-1-sebastianene@google.com>
 <20250227181750.3606372-3-sebastianene@google.com>
 <20250227202557.d3fd6ylzbaho4pvx@bogus>
 <Z8DxZY-09R6lwEW3@google.com>
 <86wmdapei8.wl-maz@kernel.org>
 <20250303234426.GB30749@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303234426.GB30749@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_163820_800624_D38758BB 
X-CRM114-Status: GOOD (  21.74  )
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

On Mon, Mar 03, 2025 at 11:44:28PM +0000, Will Deacon wrote:
> On Fri, Feb 28, 2025 at 10:09:19AM +0000, Marc Zyngier wrote:
> > On Thu, 27 Feb 2025 23:12:37 +0000,
> > Sebastian Ene <sebastianene@google.com> wrote:
> > > 
> > > On Thu, Feb 27, 2025 at 08:25:57PM +0000, Sudeep Holla wrote:
> > > > On Thu, Feb 27, 2025 at 06:17:47PM +0000, Sebastian Ene wrote:
> > > > > Keep the ffa_to_linux error map in the header and move it away
> > > > > from the arm ffa driver to make it accessible for other components.
> > > > 
> > > > Do you plan to push/target these changes for v6.15 ? If not, I can take
> > > > this patch with other FF-A changes in my tree for v6.15. Otherwise, it
> > > > is must go along with other changes.
> > > > 
> > > 
> > > Yes, feel free to pick them with your changes and we can push them
> > > later.
> > 
> > So this series is not a 6.15 candidate?
> 
> I think this is 6.15 stuff once it's been reviewed. Sudeep's message is
> a little confusing as it refers to 6.15 twice (I guess he meant 6.14 the
> first time?).
> 

Right, I think it should be for 6.15 after it ticks the review boxes.

> Will

Thanks,
Seb

