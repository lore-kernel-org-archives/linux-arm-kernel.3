Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33027C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WSuNi6jgd7WcC/uM9d2T2xs48Ig9Zxtluh/Uj+qej/g=; b=l+QJNz1Np8NGs5Qwxt53uqmigX
	kktLTrbtc3/RjkaRdO5pwTGWZyS1Z3V44kj6/0qH72LyTE0nf4DtRMBxWHTgUr3QIgiW3OrpoBmaD
	v4vZu7HPsoXMyuqaUr7ADULS/mPMHzOn5zzFTCqBUTsQuTJNIp91stEQ3ocH2b8mqVXXtKPWKOqf3
	bG4hYXqIZuVJBdpQzxeWMy4dyNHQOTCe4g/BRVt4lv5E6VG1gpKpQoCYOJzcku0UnjM1fgvZZNMAt
	J43fYM6tp1GslERQVnc/XVx58Ms/CkWghpkm2fiP7JFYEDJw0wiJMshfOmEDK5pCtSnJ1VLf61fdt
	J64SH7/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7zjm-0000000Enl4-0IJR;
	Thu, 24 Apr 2025 16:47:46 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7zfY-0000000EnBO-1KXn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 16:43:25 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-39c30d9085aso952484f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 09:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745513002; x=1746117802; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WSuNi6jgd7WcC/uM9d2T2xs48Ig9Zxtluh/Uj+qej/g=;
        b=GSmFUJMv0XEgF6SdWWkSbGya9EPpKrCWvle3k2EbwE7Y8fgVk9p0q10ICqA2m3VEO1
         rJOWdY9MClso4k/u5ZeTAtOOuSZv6ArWM19VzvuiB6TKFPQ8dmwF95WTuDA4J6/2Uq0O
         2xlUho8xemfCva7Z2AVyZKOHltUg7t5hk+ewwVL1zn1bkNPc/hyczEdfIRUIR7KxGqMf
         Ea8FXdLPDbzSa3RrAM36ICmvZbEfZEzYvlIO7QkqQdxPdsohkZnEmnUr7rc/de/uvnKQ
         636v0La8Vp1BkdIryMM4dlOZj7oycS+OA1dafYtjPDWBY45A81c2TkxIc8z5K1h5Vceb
         Cu5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513002; x=1746117802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSuNi6jgd7WcC/uM9d2T2xs48Ig9Zxtluh/Uj+qej/g=;
        b=AwWiQpZUcU93xbY5SYdon7M4RgFXtW45C2+px51uIpqUKtBaZdaVAbDMTC02iOGQP8
         oaHeYQA/ho3NDrKvZEo+TwNRWTlXt6IGaKbBV/rvd6SbIYAGCMkCzUO+NjrA0pZB/wmi
         5w2sqk8vZIvH+gC7j8p1rkHV5aOOvgHbdqL7wqDAvLuIn7Cv7XSFwUOCPgMHgGsA85AU
         K6eK5hY3eHyC9zpe4I5+2cwy4OVCZ6kMt9UcMUqhItwWZZLIZuOU/Amdc6Mcit1cJ1Op
         N7eXcahVODAOa3HPVs2mJOroPQe/RTDHvDPmgxotD6Ro7nR6m88AdDOMkQOcZ9FDnX0N
         srtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhHfTHOqQ79ba6IXHiwrtolcGbMPrAnJ//Mm0BGQoRIoJr5q9qBNRi8yEHEU75oPchmK73JMaNqHIumSPY8PxI@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1b/e5+XSfoSCS7PbWD5V4ipZZCDonjUBNALFmduuAsulVx6fG
	xxV4RD4y7mBzA4EmVAkTkaJfhbc5qsVR+k92dxEUp1KsoPQH//6XpYYlGtpXKLw=
X-Gm-Gg: ASbGncthgFZf0vZswnLWO2QYBwDRdlnc3S4R9IW2PQo0mG1ARCR1PLpyDQHAeZLNqjA
	nkzl0DqwVWgiu/uvBqg2m70M3z7lEnN1LqO8cGxLm6WV8WnY/TYuIxASf0tefof5Hvk4rL06ire
	nBbWsGFQW8TsCXLiMEEntuX5HkA6zDunMvl33p9uJK+5RLseqPFPiYpVeTooxGOqM8GAsSs18bB
	0RQ0FqUvwTS0DoZ5uO7N7M2tyKY0P6Scq6L3CblkwnMz4IWGqKyJE44OTa58KktcuKsbY9E6Z2w
	Y4ar19cxe/Z3UiyUoq9vTfceOGKVp1hYj1kztaeX+zNy/g==
X-Google-Smtp-Source: AGHT+IHYTqxFiUW0T1o5BtOdgRWCYlL7vEIbg3oFVcl1woXhmq4i0bj5/vY1/MFeshm4lNN8UbGb1g==
X-Received: by 2002:a05:6000:1a8b:b0:391:4095:49b7 with SMTP id ffacd0b85a97d-3a072ac3e07mr50047f8f.25.1745513002496;
        Thu, 24 Apr 2025 09:43:22 -0700 (PDT)
Received: from linaro.org ([2001:630:3c1:90:97e6:f326:b9e:1a85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4c30e2sm2611539f8f.48.2025.04.24.09.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 09:43:22 -0700 (PDT)
Date: Thu, 24 Apr 2025 17:43:19 +0100
From: Karim Manaouil <karim.manaouil@linaro.org>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, Alexander Graf <graf@amazon.com>,
	Alex Elder <elder@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
	Quentin Perret <qperret@google.com>, Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
	Will Deacon <will@kernel.org>,
	Haripranesh S <haripran@qti.qualcomm.com>,
	Carl van Schaik <cvanscha@qti.qualcomm.com>,
	Murali Nalajala <mnalajal@quicinc.com>,
	Sreenivasulu Chalamcharla <sreeniva@qti.qualcomm.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Stefan Schmidt <stefan.schmidt@linaro.org>
Subject: Re: [RFC PATCH 00/34] Running Qualcomm's Gunyah Guests via KVM in EL1
Message-ID: <20250424164319.p7a4qgmzn7jb7txz@linaro.org>
References: <20250424141341.841734-1-karim.manaouil@linaro.org>
 <aApaGnFPhsWBZoQ2@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aApaGnFPhsWBZoQ2@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_094324_360555_5B64EC98 
X-CRM114-Status: GOOD (  24.60  )
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

On Thu, Apr 24, 2025 at 08:34:50AM -0700, Oliver Upton wrote:
> On Thu, Apr 24, 2025 at 03:13:07PM +0100, Karim Manaouil wrote:
> > This series introduces the capability of running Gunyah guests via KVM on
> > Qualcomm SoCs shipped with Gunyah hypervisor [1] (e.g. RB3 Gen2).
> > 
> > The goal of this work is to port the existing Gunyah hypervisor support from a
> > standalone driver interface [2] to KVM, with the aim of leveraging as much of the
> > existing KVM infrastructure as possible to reduce duplication of effort around
> > memory management (e.g. guest_memfd), irqfd, and other core components.
> > 
> > In short, Gunyah is a Type-1 hypervisor, meaning that it runs independently of any
> > high-level OS kernel such as Linux and runs in a higher CPU privilege level than VMs.
> > Gunyah is shipped as firmware and guests typically talk with Gunyah via hypercalls.
> > KVM is designed to run as Type-2 hypervisor. This port allows KVM to run in EL1 and
> > serve as the interface for VM lifecycle management,while offloading virtualization
> > to Gunyah.
> 
> If you're keen on running your own hypervisor then I'm sorry, you get to
> deal with it soup to nuts. Other hypervisors (e.g. mshv) have their own
> kernel drivers for managing the host / UAPI parts of driving VMs.
> 
> The KVM arch interface is *internal* to KVM, not something to be
> (ab)used for cramming in a non-KVM hypervisor. KVM and other hypervisors
> can still share other bits of truly common infrastructure, like
> guest_memfd.
> 
> I understand the value in what you're trying to do, but if you want it
> to smell like KVM you may as well just let the user run it at EL2.

Hi Oliver,

Thanks for your reply! I very much expected this take and my discussion
with Qauclomm engineers also more or less had the same conclusion. There
was a previous effort to go into this direction, but it never got
implemented, so this was my (no bullshit) attempt at doing that!

I believe that Qcom are more interested in having their own driver,
instead (as Trilok pointed out in another thread). But this port could
still be interesting for those who wanted to see KVM in EL1.

On the positive side, you get all the userspace tools (Qemu, Crosvm,
kvmtool, cloud-hypervisor, firecracker) working with minimal effort.

Cheers
Karim

