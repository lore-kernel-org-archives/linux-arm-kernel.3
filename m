Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C3FE77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 19:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q91PmvibJrjArXljdo3eEl/cePC9h8EbSI/sERSQTH4=; b=vqPpq1KsImRfziXyjdU+1eKScl
	lRsZVwxuVpTtg1NJUFJsmkr1tyFBoj//x06GbzkCc0XeQ1tbP3hwXEq3le4SVQKUv2AbcxQ22Zu/z
	DLrGwH77uC85z2T8in1NvboxIiodszUVyvHCxmqI/YX9zUWcGR8VJXmK8Z2jZyHtRXG4utm6XiX3O
	QnvX0bVuNXxByyuA1WkRkecjoulQjyCzt2MhWQGZDnx87pNqucqLxM6or7+/gtZ8XbxEv9zmqKrKD
	lTpmNNRGA589o1WMKOkwYBs7OlM5OzSRtfMzB5mczrEZn2fEp42nDL3iAeAA1KJuHSyaMTmOvwdrT
	g+H5YrYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL67W-0000000CYFf-2YIq;
	Tue, 10 Dec 2024 19:42:10 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL65U-0000000CXiV-1Y1q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 19:40:05 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5d3ecae02beso4005588a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 11:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733859603; x=1734464403; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q91PmvibJrjArXljdo3eEl/cePC9h8EbSI/sERSQTH4=;
        b=fK8IX5XpgP3sJCCeW5dnUYkQ98HvjNrPLlNElSzHhovYrgCryxwr4bFfT64Kq++8/i
         9vTiDus1vElXl/0baOyMcyauqVvoz5VJw6d6qIFfwFroVaHZZYbK+lPnaBZ3QG2V6ie+
         84PCIxTe0hzAdR+2V6NwVBZ9DJ/AM89n5xQyc/iRUiYFlaVRon8JCYaZHt0kZ0L53Afy
         ao8KtF1uxpJ2Od/fAKVXjz1mTqzHE/DiBGEzl7DgfEKA4wpm2TVNPX00sQL8f862gaR1
         GDmOWglluUVooracY+x30AK/GXwcA7DeOoQDwo5Fjf24GONUlWph+AEAMQr3wtJwJipW
         3nJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733859603; x=1734464403;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q91PmvibJrjArXljdo3eEl/cePC9h8EbSI/sERSQTH4=;
        b=txHo6lXkPjg7FDVoRn8GrsI8wYM6cevTAlq41cvONRh5F6hSPA7r3t2Bz3AsjxuW1R
         SaaCc8vVS1joj20Xn9sPtcPwRFDZemQ1e6Ioj4n8ial/rpEtggCqEfHXQ00PTypWmxGG
         AKsVRTZZOxTr0ib/EfcFoPJBSa3RAvVaU4JwmwotJBQ4rWNaDq+U63/dvdt+PKGqnlg5
         0skA7ZTGHLlVDAz69x4iSk6qViQ1pBGibSyD0IEKvoTcPRnzuh110rATovqyInJzxSxT
         Zv39TiL7gWuylhVRjXej7TaLA1RUg3Cm/myxaUGw7vWnueiE7rAhZE9D0ZM3MIbBw0Uu
         8S7w==
X-Forwarded-Encrypted: i=1; AJvYcCUi3L3VDKSk2z/Rh3UIfgA8130kd3ZXuDKkb9TsDpkX4+hF8X7TfRodWyvl5EIsPeDO9OgqqKIe8EKOjb5GZg4I@lists.infradead.org
X-Gm-Message-State: AOJu0YxYWBalZlJTb1gBLF6ytGDji3ki3f+CtrFXAkOGAmRrZFmIP5Zb
	gS2ACLt2PYjp4BdFrthTPohON83CKTJ+k1v6sYdXeeSt+8K5dZUUvhF6uw1dzg==
X-Gm-Gg: ASbGncspTgTNCRgHNG5bWGMH2Tjt1BGVQ2gMjkfQtaSvQxaq6Fx8bS1q939simsWkwQ
	lNyhZQHwaLjhpeG2zM29Pt4Rx9sVQou9sc5Hczy/hbh0xIUsikg17J4P8A1nbtC3VAvkjJjryS2
	XMeM49ETD7PN80+DscRfME6G7OT3FZYeLQkouEhrSh16o0fuSmxQvHEXyDLw1O9VDgKq4AHeVQM
	zmPvI5L3sHqb5iaym+eB0kN02VAqszR0SgNUkEy9qloJps7zUwRZBZL0/fd5jf+pT8Io3jJQV95
	bIEQpL2m2t6V
X-Google-Smtp-Source: AGHT+IHWIDVdFqGs95DGfrfVEYVGD04C9okzNTbglc21NwXMz+6mFDbeHCJtOk1PZLW3D2Rl/6yrJw==
X-Received: by 2002:a05:6402:360b:b0:5d0:b925:a8a with SMTP id 4fb4d7f45d1cf-5d4330a2f6dmr35199a12.16.1733859602562;
        Tue, 10 Dec 2024 11:40:02 -0800 (PST)
Received: from google.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3e7936581sm4997727a12.56.2024.12.10.11.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 11:40:02 -0800 (PST)
Date: Tue, 10 Dec 2024 19:39:59 +0000
From: Quentin Perret <qperret@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 14/18] KVM: arm64: Introduce
 __pkvm_host_test_clear_young_guest()
Message-ID: <Z1iZD54EdpvbpW7I@google.com>
References: <20241203103735.2267589-1-qperret@google.com>
 <20241203103735.2267589-15-qperret@google.com>
 <CA+EHjTwV2mXOXMF7u+pVaSqvJ2c-iPGMxPBhrj7oZrm+oaAi3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTwV2mXOXMF7u+pVaSqvJ2c-iPGMxPBhrj7oZrm+oaAi3A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_114004_413362_18B53406 
X-CRM114-Status: GOOD (  12.67  )
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

On Tuesday 10 Dec 2024 at 15:11:53 (+0000), Fuad Tabba wrote:
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > index 8658b5932473..554ce31882e6 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > @@ -43,6 +43,7 @@ int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum k
> >  int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
> >  int __pkvm_host_relax_guest_perms(u64 gfn, enum kvm_pgtable_prot prot, struct pkvm_hyp_vcpu *vcpu);
> >  int __pkvm_host_wrprotect_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
> > +int __pkvm_host_test_clear_young_guest(u64 gfn, bool mkold, struct pkvm_hyp_vm *vm);
> 
> While I'm piling on the function names/parameters, some functions have
> _guest as a postfix at the end (e.g., this one), others have it in the
> middle (__pkvm_host_relax_guest_perms). I guess
> __pkvm_host_relax_guest_perms is the odd one out. Could you rename it?

Right, 'relax_guest_perms' felt more natural to me, but consistency
should take precedence, so I'll rename :-)

