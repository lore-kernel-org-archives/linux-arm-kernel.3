Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E39EC43327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 10:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7eQrlr1iqvdXSCnGA9eKw5Pz71hnIxvtQ5reJnEwINc=; b=RNWIp+reTZZWkKKjj8jy53SPKB
	U2E3MzsrHckVckpRCWnC2e1CkB/n56m011tJCLWtfRWsKQPI4eM28W1hoKA7OZqRUh5hloorVo5Lv
	UwPfreVpfBwUlp2KBevn/3fn2o655glNJc6MhVT9o06Co3Wbdbh0yyb0h/17fpvYL2etvHQY3mIiv
	I656NMqL+I1Z3s3dOAo0ORz3vWALBqWaG/USnIzmydlhIBS1zNclQhLk2s7b0o6W54cO91xSSrnVS
	p8cuj3HkFYgFpNsZ2vO4ekGcYRK0YfB3dTQCKHgrN6OxKCB2PswE8S0Ui9T6PPWEfFuyq/BG9O51t
	nwj/yEnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVcT-0000000GczU-1H6x;
	Tue, 30 Jun 2026 10:23:09 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVcR-0000000Gcxx-19Mn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 10:23:08 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-493b8d92a4eso33925e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 03:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782814984; x=1783419784; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7eQrlr1iqvdXSCnGA9eKw5Pz71hnIxvtQ5reJnEwINc=;
        b=HFdtjhBOv1Gr/XoHFfp5Uu57WSMJPuvITA/sWxQ5UytCicyhhJXPv3tw57ei4I7Zz9
         +PvNytn9V+nyor1Xbz/VOTUxEKyBf77vKqA1bLVz41LbOnT1SlYoClPm55vfEAnm42W8
         bJORbpqquw9nqd4EyJxt/mFZRHR00miDdZmLmhw/MPvqNCWTw9B6/0ONKsWJUBXbznCH
         AL9PDg5MKON3338c94HmgHQ3a5hj+aS817wAaGHgqezOZ42bcFeuGe2KbdarXVK+5TQT
         8iGcqvOnAhJcw3JMV6TOVgZnDa8WsKO9fmHHOObi309ZT6IPf0K3UWT22QnBApgBkdZx
         g5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782814984; x=1783419784;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7eQrlr1iqvdXSCnGA9eKw5Pz71hnIxvtQ5reJnEwINc=;
        b=kbvrc96qZe+S6QjZiWX1/ZQ/qndNm1WzGK+PKfNpg5t0OsmjtCfMYeKAi66Ak23Rkp
         qdAu7nd+gyUv1UrYgR3RFrFcmwF4QaSDJZ939/J9DJzMDwQgmMuL5OaODvktWy8Ty8E+
         HzwjDbx1c/FJGRGtqkrXZsYt0p2saxjDMXPvR8HrNbsw8PfDxpewmBo6Vzs16LNKPzyM
         VHYrpTZmXsvjxVAdBBpkc1WsVujyTbOXG4Ez7RuZojzYJoL5osolAUn2N8OfBU+8VYCT
         GcOKXMwEyuS1e4byLNXApG5a2Z68HmqCGANpblHpJtSsjC7udsNEmaB3FNt6LpE0tnMb
         EDGg==
X-Forwarded-Encrypted: i=1; AFNElJ9QK3IGZJG1Lm5BpLHp5ijAmhrvnG3HUPJYfIb/pzTzusgtvoyxDlcc7R4uNey80q54rbK0iHpxr9gwRR2UHWJL@lists.infradead.org
X-Gm-Message-State: AOJu0YzfHL9UrOUytp36j0l4K+q92hnN4UqR22vRrc1FlL9KK0DlToWq
	QJjX43XRYaGL+xJ8bH+uC3Nqk2l5X5dgMXlEvBn8f8MfU9i371CYG9+4+TbAa8o8Nw==
X-Gm-Gg: AfdE7cn/ZnGqX/H8FQWWz6oWGbQTk6m7I4WJaE0f+oaA1NT8DYPrwAn1VnoeBP0bSDQ
	ri4ctThhl4X8+mxaf3N4r1QeqFJdEdY3xXU1bjTuuP7hhOVOoLu/3cIU/zfrIt5f5iUViXTRcLd
	uNhwHaLeslmeQ/qKcpR1it0wqYZiRiyzvXZA74nlaxx/zKwcxp6YzdsGv5cFJPkODu+27edZ1j1
	zHF26BGp6hlm794CqCmvkjom/Hbo4Z5to/wuPfWAOYbOjiySTQ3mg6VczDmUoT+5ib8LZPY+E02
	Es1QgUq8wujghUSNOTEzQAlGlLX7zJmGlDIviq4PSXxUbl6g4CYgRzYcmi4kbW7N93HBWqXE8YD
	wZB/QoiMMMZpIZcbWh8sMNpYQ1yILWBNIoRIpXLZ4l6lfVLwy81Lv42u8tSxztqPRntuBuk8+Fb
	qZxL5KxQdiNZStf8PkdhfV313N7cZLpG/4AKZUbf2gQCB9r4C1oA1r8BvQ5v7Xyw==
X-Received: by 2002:a05:600c:4314:b0:493:b86f:c913 with SMTP id 5b1f17b1804b1-493bd77921amr14605e9.1.1782814984019;
        Tue, 30 Jun 2026 03:23:04 -0700 (PDT)
Received: from google.com (140.240.76.34.bc.googleusercontent.com. [34.76.240.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493b8cd8bccsm63196105e9.8.2026.06.30.03.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 03:23:03 -0700 (PDT)
Date: Tue, 30 Jun 2026 10:22:59 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: Vincent Donnefort <vdonnefort@google.com>, catalin.marinas@arm.com,
	oupton@kernel.org, sudeep.holla@kernel.org, will@kernel.org,
	jens.wiklander@linaro.org, joey.gouly@arm.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	maz@kernel.org, mrigendra.chaubey@gmail.com,
	op-tee@lists.trustedfirmware.org, perlarsen@google.com,
	seiden@linux.ibm.com, sumit.garg@kernel.org, suzuki.poulose@arm.com,
	yuzenghui@huawei.com
Subject: Re: [PATCH v7 6/7] KVM: arm64: Ensure FFA ranges are page aligned
Message-ID: <akOZAwBn0JkbyzX4@google.com>
References: <20260617145130.3729015-1-sebastianene@google.com>
 <20260617145130.3729015-7-sebastianene@google.com>
 <ajQmN-UQD3uJJddJ@google.com>
 <akORop8Z9Levu9Sr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akORop8Z9Levu9Sr@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_032307_327374_04316B7D 
X-CRM114-Status: GOOD (  17.87  )
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

> Hey Vincent,
> 
> > I failed to parse this 
> > 
> > But I see 
> > 
> > /* The base IPA of the constituent memory region, aligned to 4 kiB */ 
> > 
> > So it sounds fair to prevent oversharing when PAGE_SIZE > 4KiB
> > 
> 
> I think the problem is when you have a mismatch between FFA_PAGE_SIZE
> and the system PAGE_SIZE. We expect a fixed FFA_PAGE_SIZE of 4kb and
> this is enforced by :
> https://elixir.bootlin.com/linux/v7.1.2/source/arch/arm64/kvm/hyp/nvhe/ffa.c#L761
> 
> if FFA_PAGE_SIZE = 4kb and PAGE_SIZE = 16kb you can end up annotating more pages with FF-A then
> needed when the range->address is unaligned.
> 
> It took me a while to understand this so I guess it is better to rephrase the commit msg.

The problem here is that we only check alignment for size and not
the address.
And the code later (__pkvm_host_unshare_ffa()) uses pfn which
truncates the extra bits.
So, in case we have an unaligned address and an aligned the size, it
will round down the address while the actual size spans an extra page.

For example if base = 0xFFF and size = 0x1000. pKVM will share
(0-0x1000) while the actual range spans till 0x1FFF causing FFA
to access an extra page that was not shared by pKVM.

Thanks,
Mostafa



