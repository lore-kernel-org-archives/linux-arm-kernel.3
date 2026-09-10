Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3EBEC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 02:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/bkqSDqoSS4X+8RqIhO4osWZcJjlcPnaK6w17Spzl4k=; b=WAMTNpBYE5Vi/APTdZdoUkEZuF
	f9FYVN9vv+2iIgOno/iuIt80ijsuQ8686R9E6aRiIPVU+u96OIV0eAKlYKmSgSApMXhezH2mcDqmK
	JDkbxwymV+Rk5rUyZDZyv9VnrLF3eI0i66bCzrv/FkZ+85hOSU9pXBo3T4uVYf9SnTgpfA7JN+2D1
	vlrIsnzJuDGpOj9PTH8GpMDvX8rE43ET6N4Fpb9N/vnsUuYXblMDw9At3+EtnHZvOc8xnz+xwwmrW
	RsFFtxxL79GEhxekX1dC7+QrAvQ/1WXX0GiGZqEeBjbDiBN5Z7+I1qEYyzQmP4QnvO23cNa+Ef+Va
	wp4plf/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4UwD-0000000DGYH-2xzD;
	Thu, 10 Sep 2026 02:54:57 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4UwB-0000000DGXp-47SV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 02:54:57 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso10150895e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 19:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789008894; x=1789613694; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/bkqSDqoSS4X+8RqIhO4osWZcJjlcPnaK6w17Spzl4k=;
        b=WfAoKtCxQDUvY2C866Tzu9yP0OvLLdWlfS7q47jmtJh1dSab7PbiJRaHstibXvjUGb
         X5FjVYvFkd8faHb/zGJFr9Rbmjvrq4j6/RuAvg1uVUxmk+xBJC1VWuYx+Ee4L6eteayA
         /0GRHB48ffFi9Wn717NXTlPEmz9pCr1mtEQn5fnm5B7VE039aHa687od7gIcfH+A/KH2
         V//u9x2BeZCsp/1Xi0s+7kBsxZEgmaauMgyrXVlFjriKzeAIqTU2aKa8Y+U6zIP5sO73
         spaZmfZ+32KRiooqC/MFvTiX686Q7mDpePX+WVdxEbZ96ZTNPs6xUAfivqRMYaydNmTi
         8+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789008894; x=1789613694;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/bkqSDqoSS4X+8RqIhO4osWZcJjlcPnaK6w17Spzl4k=;
        b=d88UFnZ8WKPsOHmoUQtbQG3uX3nRiPcnsf209TdJ58ylD5LIFt53hRZXDtMKdmGtzl
         4k+T8V/vAhV/3VsRre3e76gKlZVTZEUl5ya0vS25/d3LoV5moCSx6tBdSfokA5V/dDLn
         ercfQeAT9e7LNI0XJxj8YjB50payNv6BdE78VdMIAlw4AmUKbAPM85xbKqy2E8Lhbo75
         NoRzIc5jDPYNkGGFsGaJjRKL4QZolnDCQ+s9a8R5GlILLhCzj6qEs3KriMbMlAeD0It9
         npJQDiaHOiEUo+FLSAFgxbWODQqo01W53iv806to21UN2MQQFu7ernmGbsNMwLDA7qeo
         JybA==
X-Forwarded-Encrypted: i=1; AKwUvByY8Usdn5k0VGSmAJFL15Lscdqz3PxYd+hGYyY0VQtSgxeABPpo9N2Bu3cWg1DJxVKCUAysLofCLiT6+gVoLXOk@lists.infradead.org
X-Gm-Message-State: AFuF++lmr6Qlt1u2AzhR+pfMHket9Q1jtAMquFLmOXJqoy7uVQaF1Upi
	QqigdXg1UQuBe2dBIOrA/lZ/lA3QUTUedJy3P6zXtKqMZu7Wvx4mL0ng
X-Gm-Gg: AYBFou1nVeT7hffqgMkpGJ05wh8a9iz731GwD4ZLgVqkDSNHo31j+exN+E6VyLVnM+W
	jn4pU8Xy+tbBvw6aJaY0WugcwCzoe+r3D8DLuWl5gObdi475xlscNjzUOcK9WbXjZ5To2KDN9E2
	ge6C3VUambyyDZWZHi+4H/DlQJxEF1qWhF3WEIXPwZdgRsX5qbSx/03SPdKspDklqUdB2YpvxEZ
	ug/4aO/65dCQhZMvOYSyDSKoTxQAILNvBsgS1wVx2YTi7AmtDVzj/iiSH0M/Pa0O6qFw6yUKUJA
	UKOtvU2X9m3nEQGupdxQzXOsZB7mFzkb1XPfPzgPi1ndSnWM/v413veGb/aYpkF4bZLi2REVApu
	CKPrHZSO5IVPKyjTEBvdhdg063VU2W6JKOix27gtl0TiWGn0hxinFNp9/4mKb+fZ8/nV5b2I8Fn
	ekO7RKkyCEA4Vft+P0zSnMGiikbT1olc37jHUsm7gWifHORokBLdPgCSaJFdkeE4j1G53fu3ZpR
	XryQ66jNcEfFNADbVlp53IAFq5xAx4X9BWhrq8mcdFNnXogYuUWbED9Bgoh7+CHDkn9jlizq2tb
	Ax4Cqf7CwpWBqwniBq+cnAsouFfn6I4F9VDFrQna3yjkBOMI0XxIiKqLzF8rzejqKWD1HcxW
X-Received: by 2002:a05:600c:630a:b0:49c:f89b:f82 with SMTP id 5b1f17b1804b1-49d2592c540mr85347385e9.12.1789008893739;
        Wed, 09 Sep 2026 19:54:53 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b3d9-b901-0402-5aad-0ef4-88ac.310.pool.telefonica.de. [2a02:3100:b3d9:b901:402:5aad:ef4:88ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c46b64sm33036055e9.13.2026.09.09.19.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 19:54:53 -0700 (PDT)
Date: Thu, 10 Sep 2026 04:54:52 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Quentin Perret <qperret@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Fix kvm_get_vtcr() kernel-doc
Message-ID: <aqIbvOvIe89_RYHT@gmail.com>
References: <20260909063156.89636-1-kmehltretter@gmail.com>
 <CA+EHjTx3fmj_fkD_ybPANyTrEApMUyBscfP4JtP-F_MRL-L=2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTx3fmj_fkD_ybPANyTrEApMUyBscfP4JtP-F_MRL-L=2w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_195456_028990_594CB40E 
X-CRM114-Status: GOOD (  12.90  )
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

On Wed, Sep 09, 2026 at 08:36:40AM +0100, Fuad Tabba wrote:
> Hi Karl,
> While you're on that line, the description is also inaccurate, so you
> could fix both in one go and save a follow-up touching the same line:
> 
> > - * @phys_shfit:        Value to set in VTCR_EL2.T0SZ.
> > + * @phys_shift:        Value to set in VTCR_EL2.T0SZ.
> 
> kvm_get_vtcr() sets T0SZ to 64 - phys_shift, so phys_shift isn't the
> value written to the field, it's the IPA size in bits. Something like:
> 
>      * @phys_shift:    IPA size, in bits.
> 

Hi Fuad. 

well spotted. A typo seldom comes alone :)

I'll fix that.

Thanks,
Karl

