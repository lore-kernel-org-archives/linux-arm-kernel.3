Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7968CC8302D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 18:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TkbKDizxju3W+51KZwQ3Fxa7XNUAV9NHwEQ1ocZXOb4=; b=RJ+cBBNyWyqAIStAIpkJe5ZcGf
	2rFuYT6IlRXBf2dISVWGJI53whOV5Ii580NfKE+d4Vf+daf7qyo1pYHxeAGRC7aKhP4dH9zaqqmvQ
	o47X/6uRUG1a0Nk6IEpPS4EfbHZXcI7aWJ+WA8C+nKYp4YpOUcynjCTBCVNsLs6LdA0s3mtBPNFyz
	3hVRmjkl8JpGcWN94NBeVkSTJBA+T0BAk0tOrT/ndDYVZ9KFpowjIry5PWHZA7vdb8VjaCAAZied1
	bgtObK/YEMxh2Lcv3szhojbrMjKhk2tnGdMS5zu6pJhm17mMaq0n5GA1A2qfIs9OoGpYaI2G4UuT6
	CJWCgxrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJAf-00000003C10-1BHQ;
	Mon, 30 Jun 2025 18:24:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWIis-000000037vE-1acr;
	Mon, 30 Jun 2025 17:55:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TkbKDizxju3W+51KZwQ3Fxa7XNUAV9NHwEQ1ocZXOb4=; b=laTEv76SlQnqYqVzSadMamABsf
	b0ROIbHYv21v87SKh6Aw0HNUmchd1wUojZph3rxtfBVloSwegI8b7x5t+A5g7zJIFZcXTjTqu9muZ
	4bxx5nBBwx2dNSsbb0goeZlMZ7oXxJDo2VAsjzFOgZjHazk17D+d9iSlFcQUuWuVPiMbcrcWfKcGy
	uf/wu7lAMO2YlE+vl2I6gvwSa4uHSWysbY96E6pbo+WBBtZIMEov4VSh+h1ajPZqhm+PzCUU4q/iX
	gb5qVYX5dvnmUMUWngmc90eQhJU1yhKazaZ+z/ygae4qq1knDPwEMYQ1INBBP4w8JRbcib+Byf3aI
	xBshMS6g==;
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWIip-00000006qaQ-1mP9;
	Mon, 30 Jun 2025 17:55:17 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7d09f11657cso437871985a.0;
        Mon, 30 Jun 2025 10:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751306113; x=1751910913; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TkbKDizxju3W+51KZwQ3Fxa7XNUAV9NHwEQ1ocZXOb4=;
        b=QEG+0edjyoAohSzi0CKmxeqoXzqjG4rJo0+OS2KILLvj055CIbPqU1lZjg1yQfho2e
         NW/IKhwqV0YpL2LuxOBZDsVRXvqGI6pwVUMNnDt3SqbUYGyL2/F/KLSB8Ki9sMpcphud
         dmENxLVDbXCdjBX2kMG23S8ttHSjtidt3kBJfLaUAEmRsdwIlyLOD+jB7OYTzpkn551c
         MqBDfq6wx1B4Zrp5Y32dTnG0DGSlcHLSFCrEb52B+UMyCkG2kupa+P7umqXYwVm2FJbC
         pL5IPMJ//lgDosJlSQVAlSo3Eob5VEf8P5ZDnjhcoy2apRRU3TgSo901HLJOCZScJBzX
         FwQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751306113; x=1751910913;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TkbKDizxju3W+51KZwQ3Fxa7XNUAV9NHwEQ1ocZXOb4=;
        b=ospTQDvnjbiv4ZvxfosOA552ojvI6dlqkHNRC/nJogsTvUYmBF9rkR8Ozd6Of0O/kO
         Tj2vc8KDJxwnH7A3uvtS1BSw54XiVYcG79mCJPmIBxqbu3VjbYfnVdSqf4nQ0gyW41zm
         XUYCJqXCXsLPvshqx7ymwJdsBv72rLMCyn7M5/WdCmoJF9r2/bgvsb0NfaKGay+8Si2P
         A4tQWkF4VVK5vaL9Lif5TbdQLQeGrPwLnhNP3HicqSlqDTY79g+kktc4ZGT8DfIi5bHd
         fqobZ8F3oQK7WjvyEGsfsM9heBc5sickS14Gty67Igvqg11m/lemjkY9K/cI1j7BrUp9
         4yng==
X-Forwarded-Encrypted: i=1; AJvYcCW5RsV3WQWT8R/CPfiVVbEUt1QOwkgYtkgbkpqcvqqMBLxDcKMBIeOYjwqm8Y73glvjBHo7lY2fdkfp@lists.infradead.org, AJvYcCWPy+wsGf5BUSXtU48u+IKZKmI8zbHyy5bdMI4U0muUtaqk3P97nGRpJ5Bcx2xAnpIeo56Idhww61TaZa4NulCg@lists.infradead.org
X-Gm-Message-State: AOJu0Ywauy1aJhtICkGnTCEsKOLuZ4Xrof7Pai+AM5bVaq73qouyYomV
	/mtWNYcPNPy1gtUxn1EVyRNQwM0g4udWBVFFB7umFzYaTsOA0uGJpJ+p
X-Gm-Gg: ASbGncveliphs7DKozvFVLZjCdkViUKYOJj8e9jSz0mHJm4nDbTz8KJnJCdU2VRxAL3
	vd3qACgjCocDvCuXoFretu6C7xBEwibhPR1+xq+PAUHLI31qZAvL37uWQ2yra4tIeh1LrJMB7l7
	wsSas/9pR7SQME2HInPcdlT3v+Yz/LDIHLJPSg7JrkuvTTZNU8SJlO2scu/0QdHh2LO866ztGHQ
	NdieiB/6SJ7XWe0TWhIJ7jM5beWbGBRsOok0+eZDwjwvzrDI9CMiCc0sQXETnV0HzaggO+mALUL
	LBasaI7yMWEPNnTgZ5Ru9lDD0QUzTuhA3f0zAZOXo0hciRq+4A==
X-Google-Smtp-Source: AGHT+IEAoLv3ZFdFWjd7lAICC4bbFV6sU3+PxQlEK6DUAJNkCBCFRSmZ508WVU4rao0shvvKBCho+w==
X-Received: by 2002:a05:620a:1993:b0:7d4:4d55:98f9 with SMTP id af79cd13be357-7d44d55b1f9mr1237496485a.28.1751306112549;
        Mon, 30 Jun 2025 10:55:12 -0700 (PDT)
Received: from geday ([2804:7f2:800b:4851::dead:c001])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d443203279sm636637885a.54.2025.06.30.10.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 10:55:12 -0700 (PDT)
Date: Mon, 30 Jun 2025 14:55:05 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: linux-rockchip@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rick wertenbroek <rick.wertenbroek@gmail.com>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/4] phy: rockchip-pcie: Enable all four lanes if
 required
Message-ID: <aGLPeZn9ZSw3FurH@geday>
References: <cover.1751200382.git.geraldogabriel@gmail.com>
 <b203b067e369411b029039f96cfeae300874b4c7.1751200382.git.geraldogabriel@gmail.com>
 <2affed16-f3c4-47d3-9ca6-e4f48e875367@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2affed16-f3c4-47d3-9ca6-e4f48e875367@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_185515_613255_EC0AF3D8 
X-CRM114-Status: GOOD (  17.11  )
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

On Mon, Jun 30, 2025 at 02:48:25PM +0100, Robin Murphy wrote:
> On 29/06/2025 9:58 pm, Geraldo Nascimento wrote:
> > Current code enables only Lane 0 because pwr_cnt will be incremented on
> > first call to the function. Let's reorder the enablement code to enable
> > all 4 lanes through GRF.
> 
> As usual the TRM isn't very clear, but the way it describes the 
> GRF_SOC_CON_5_PCIE bits does suggest they're driving external input 
> signals of the phy block, so it seems reasonable that it could be OK to 
> update the register itself without worrying about releasing the phy from 
> reset first. In that case I'd agree this seems the cleanest fix, and if 
> it works empirically then I think I'm now sufficiently convinced too;
> 
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>

Hi Robin and Neil,

Thank you both for the positive reviews and the effort.

I must admit however that it looks like this patch was lifted verbatim
from Armbian and I'm missing the Signed-off-by from the original author.

As Robin may attest, I initially started by blindingly enabling all
lanes which, of course, is no good. I tried a suggestion by Robin which
did not work, and eventually settled on this Armbian solution, which at
least has got some battle-testing.

I already contacted Valmintas Paliksa, the original author of the patch,
and asked permission to use his Signed-off-by. I'm aware I could probably
use the Signed-off-by without strict permission, but it does not feel
right to me.

Thanks,
Geraldo Nascimento

