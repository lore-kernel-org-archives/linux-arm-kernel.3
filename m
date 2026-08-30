Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F09C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 18:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Ptf7lkzRK2cEQa7tXSLbtyDvUDpbM17dkTmOc5wvcM=; b=E5PuJ0iblZC7OsWsW40bDIFX7o
	VZKurvZl2Nc+lcjEjMELhBSq1A5/Xiu6LNvLvTZiVMktUyRLvqG7G64YDW9vT3xFJH7/YE94lJFQk
	pGUoAHjq71nqJF6aLqvcMlqfwmCLqOWBh1ipPFS0gP9+VDX3k9IPWeO8Mxskbuc5WdjGFxtu/Kaoy
	nQ/WGPtBHTrfGM59/ak21361z1UDHKDcPcY8jY6xDgFTIGIgAQbqocceiF8WE9WkVKSxxWz4qw4ns
	hvQl6Yff6sSfLe/lvRpu0QnOWk65SS7SvhAAgc9ye6A0PWCxRe3+vlr8XXmveDQkLY7RKHZIq68Hs
	J5mLw6tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0kHK-00000007zj1-2XSE;
	Sun, 30 Aug 2026 18:29:14 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0kHI-00000007zig-28Qa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 18:29:13 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso26142365e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 11:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788114550; x=1788719350; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Ptf7lkzRK2cEQa7tXSLbtyDvUDpbM17dkTmOc5wvcM=;
        b=GvXtwDMfd4PWKwWRmYCcN91i0u/fuEbxrb09AaXlF2aYR0suK9IprdlzoyA0qZ63jv
         d4kMlKXafgdg54pCcMEHVCd2lUENB+NkSbFse0nsk+dlHHKmf8J1ZCh0sbbiNssF9rvE
         tapEIwy/f8joNTuDd/A6JOxMVbUhOB806eTIpQygaf/JIth1JB23Cuu+JyR+N40v6IFJ
         fj0bC75KwAdNC7ZZwxgYnikGDmMi5zLf1LlrgW/mxZrmfWsysQHrtQFs0Dryv+mUoeIx
         s9QhDKKH0AMwpCrGyT+/uef/6JhtfIjuglV0lP0HWlWazfkob0OR9lzrqmA7fP8dPl3I
         ebjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788114550; x=1788719350;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3Ptf7lkzRK2cEQa7tXSLbtyDvUDpbM17dkTmOc5wvcM=;
        b=ZzUY3RO+rDMAWBtAuHYU/Vf781Tv4uDWpV422pvlEE0LFMI/+Oawh06Sh4Cfvuwzeq
         KnvSHgs205Dhuplk4rkEJAYF34WjAzFlMYDVshfqrsOvPh5ZkJh7bMC+PCTDaOTkXJ9F
         wMJNK9tHG4nb4+nmTjqQz9XfjM2i9InPOq4+4jLqtrCLsa32zXiefTMM4Lhlkiesj72Q
         lNNk8pN2kJBVzx+W8oIkKNbEtLvpr8W1IePAtzLXruWz22eY7FzsUJ6WyUY7rHSffcep
         xU7IgvNsKqNqWVQhnBHpmt1sxabUzX/CV7MK+XBE2SXBVJ9PQbJARxFBinInllqWqEJY
         kqIA==
X-Forwarded-Encrypted: i=1; AHgh+RphQZ3+q0SVbREN/kBlaJG/CtjEwg2HJZ5P7eoOetl22BHS8s+nz9LFj76KZ/CPTCY36GbWp96TtU7lA1/wISuO@lists.infradead.org
X-Gm-Message-State: AFuF++kb6AYEjM2n+GIJmRR7f2ry445jEMR95Gzb3oq0ofByM4mExfTA
	Z2z4nil244F1ubACnzeGh70QkXFxSrPT6K24Ul6rN1a1s9pWkkGov2pT
X-Gm-Gg: AR+sD12uBOC0LQ8D9xCv4lnCmTYYJfOaRtJY5omSoJR71LE1hCkapY1EBC6mlHleJO0
	zjs7MjVJC6aH+VJRyFWIGO7frX5qQ4RNprbTTv9JHOql2A8XygnsmCiMm0eWlEt197FnVhGzTSU
	PhWuAu0qBYeQIDAl6TFleKp9+KiOIlMCEPoYpEs3MekavLZb59VRTP2tXPDGFWWytHt36ig1wbp
	5DUa6fVkJN2Eco7o+VTqzQpqZjfYbpKnogalrz9LqCdzYh5t+kg8oLE99qKDR8gJBKmmj+vHW9v
	eQYS2r0Mai9F7dXQB2Ov21HF23QH+7sDIvX+1ffM4Rr3qGXrUoE5tdu8u7gPV9dDXUFyrrIlKiD
	+A+k1eHrM1yYM6iAaiMurb5DvZOiyEeQm8EV/OiO0+WxYSKgOFNwiFsyUyF3x1u1jCBrg8DiCA0
	brT626D271kjHEpWPZ4nfZP2PxRVbPBSmKvX/GQHllBm+xpiN3Y6UhGiDpJh2kHIWqzuczoYpfm
	OctkhzozC6tRp6iuWnokr4Jdy6gMXH3KrQN6OUVPmix/V2QGhhwWZnJFJaQZA+C/HO1oa5/zsZu
	EKCT8R6lrcVRaypCm/YW/RyUkvW6DhFyHlivVwnYK0unvcKtkFG/T/nv6jLT8WSRftbynJ75u4i
	N1DvRctWUqBY=
X-Received: by 2002:a05:600c:4744:b0:499:8b13:3a98 with SMTP id 5b1f17b1804b1-49b91c2479amr317299235e9.4.1788114549893;
        Sun, 30 Aug 2026 11:29:09 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-adda-dc01-edc7-8a6f-c6f3-73e0.310.pool.telefonica.de. [2a02:3100:adda:dc01:edc7:8a6f:c6f3:73e0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b961939ddsm102089915e9.4.2026.08.30.11.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 11:29:09 -0700 (PDT)
Date: Sun, 30 Aug 2026 20:29:07 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Eric Auger <eric.auger@redhat.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 0/5] KVM: arm64: fix VGICv3 redistributor rollback
Message-ID: <apR2SFrwBa9tCS5y@gmail.com>
References: <20260822095346.53882-1-kmehltretter@gmail.com>
 <87zey4m2qy.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87zey4m2qy.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_112912_567730_DC432569 
X-CRM114-Status: GOOD (  14.53  )
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

On Sun, Aug 30, 2026 at 09:28:05AM +0100, Marc Zyngier wrote:
> I really don't understand why this is such a massive departure from
> v2, which was pretty close to what I wanted to see.
> 
> Honestly, you are making things harder for everyone by over-designing
> (or more probably under-filtering) things that should be *fixes*, and
> just that.
> 
> If you want to rework all of the vgic init/destroy, fine by me. Do
> that as a separate series. But for fixes that carry a Cc stable and
> require backporting to 6 year old kernels, that's not on.
> 
> The hack below is what I have against your v2 to make it acceptable.

Okay, thanks. I’ll adapt your suggestion and send a much more minimal v4.

Karl

