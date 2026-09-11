Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6116CC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 08:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bjhH5Fnhw/BjVRr46A9maSwy2qrf+Pc0uw9RKK3CLk0=; b=jlKxLQE40FgrEp4UzOnG3S6eHB
	ia/i1w3LL6jjkG0uFhpCldlaEgVWPouWAl7UQsVHGH/1MjY2G9m9BEX6jRQZHNn6ngy8j8hIF3L+R
	vIs4NAHBRbvO6vfrrol2RicA76qeP0CBXHRqz4bUEpANhedUBjB68p9Hz1dOhq8CzBlozSr3fnFC2
	J+mU/VDuAvwzy0iNy7xewZAlvxVHYkAMybg0zIsJY9EY97kq05DQzZW7rrq1i4PIUAQmIWuVL2Lsv
	D8vmwUU2TZFX9UsLnTZBwDqBoyDGt7sfkThXuQYIzmpv5OUiVHCHkeHMpdFe9pvHkPJFwCsWKg4+G
	cXJJeDSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4waJ-0000000G7US-05dE;
	Fri, 11 Sep 2026 08:26:11 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4waF-0000000G7U3-3ovn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 08:26:09 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-ca12086c06eso684102a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 01:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789115166; x=1789719966; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bjhH5Fnhw/BjVRr46A9maSwy2qrf+Pc0uw9RKK3CLk0=;
        b=mqY59RljUVZSvfzhrZT/I8HCzVkwBk21Pd8tvq+IF/PbrDVF9vP/NSoqoWVQLAiTLW
         mgfi330UQV3EB26vGc4H5/TCEebc7ZugKj29qookCJQmbjVE8SebvDO2lm+2D4DeTNt1
         y2G29+jZ2e4pc7cSHKtEoFMl0IydpfbvXSRuVDCXAF8EbEJem6pjhlnMzOCM+WknwlWQ
         nhCDs1T7kDB/TsToyr4MYnYgW5q47ZPEImKV4VDkAvFadbDRJN0k4oUH0YfuhAFnpuya
         c8Yn5jojIZ88zWhKjovSHSQvn/PmLSP9Se4jMP8TqdZ2Vyjvks4IrmAM9mZw5pjhSZ2y
         qcrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789115166; x=1789719966;
        h=message-id:date:references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bjhH5Fnhw/BjVRr46A9maSwy2qrf+Pc0uw9RKK3CLk0=;
        b=hmBkr6Zue4KvCZcNXz3yCBHHAV39wkvlU/eRACZeiSGIY9b7Bvgq5Zx/YBstXpy4w9
         qaOZ/9bcjPuTZElExHO/QwdGAK7Ec4pS1+OQ3GRgo9AVVEjDYP6Zxjg1pT+meacJekFw
         eXpZL8kIzJWFRD1zsLfi4im0EvlvzE8RyQqjBNC8Nl8CRdcOjaII35nh4/g0Nm+aQQdn
         rxm43Kz3p0KKWrWmu06RbiZ50qIqL21nnakSaW+EsKsjDusHDTJgRCdKzDpTnu6hBA2H
         qhL47y2UARyiENLL3N1hARpESZWSyjDdpu1x8x7lCgCjQTOVE3xsqpwt1GwCv0cKUHf9
         1/2Q==
X-Forwarded-Encrypted: i=1; AKwUvByQKBqUyxNzuQe8O3mmxTfD4BbU773yf+n+tduWJymO1t8d/GIhdLmt8JF1ffAfB6ZQnmt84UAKm/1YMhcnTMYU@lists.infradead.org
X-Gm-Message-State: AFuF++l0CyL7DeZBjPzjqFkh1R8UasBEbrHfvoDE6qwafPcrCIelue2S
	3M+xorLi6nQgROSUdRl3XmFKbh7hM8JqlopFrlY2mLy3za9FWc1ph+Rr
X-Gm-Gg: AYBFou0E7ZNC2zflTWt6ZqWYl79eTRgFAKdH5XNphJymqU00lTn2DejMhTZtCC7A6ab
	e5hBk/iLBE+ZCcI/fyzTYRHqPcJd+19AetchZYy8scRKwBDEzSv/bgeJKtqHVrTKjgtt5uUA71n
	2SMZGuYo6zX74IvNCXJ/3CgBpVHjpgWsFlB1IavxWdU7v6Gzg08xubarYXWmASCqS5iuh9Xcrwh
	fGhqPoePOGggCcnB/z32A04B1uxXj8Av7Uw1rpN/nwbYsS1GAaEQCUd7kT5cEQ04Mb3WblVVaws
	vq3Vvnh3aWSFHwxMFWxZtvm/lAnGvD4na/3X+F6tmWrbNhUO/780LpiipwCreJTMESMi+PJ6Gu3
	3DuKjFkTKFuVqu1HJ44YnfPPfxz7JsHnhrxzheJTqDbbAhBRbAmc+jExNuGlQbIOmYbpyZWQ4Vn
	9Vm2s9du4w368tEE4lj0kI0q0F4m5dLVMesYRjuThJKrgUGzVMfkq4KhHH3lGd1JzCrOqecxMZi
	uH3qEG5t2loCivoEYyF6SRhQg==
X-Received: by 2002:a17:90b:1648:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-39d9bec50b9mr4918364a91.10.1789115166444;
        Fri, 11 Sep 2026 01:26:06 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33baf0ea9a1sm1308649eec.8.2026.09.11.01.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 01:26:05 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev
Subject: Re: [PATCH 3/3] arm64: kvm: fix repeated word 'is' in comment
In-Reply-To: <CA+EHjTwW64qwPPAY7GpGWnW7kTHgK+NOycPD+ztZLu8MxhKEgg@mail.gmail.com>
References: <20260904122445.31163-1-hemanth.selam@gmail.com>
 <20260904122445.31163-4-hemanth.selam@gmail.com>
 <CA+EHjTwW64qwPPAY7GpGWnW7kTHgK+NOycPD+ztZLu8MxhKEgg@mail.gmail.com>
Date: Fri, 11 Sep 2026 13:55:59 +0530
Message-ID: <178911515996.474202.18153234548688379981@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_012607_975163_CE104674 
X-CRM114-Status: GOOD (  13.27  )
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

On Fri, 4 Sept 2026 at 13:46, Fuad Tabba wrote:
> The typo here is that the first "is" should have been an "it", rather
> than being a duplicate.

You are right, and the patch as I sent it makes the sentence worse
rather than better.  Please drop 3/3; it should not be applied.

I should have read the sentence instead of the checkpatch warning, and
Andrew made the same point in this thread.  I have stopped treating that
warning as a list of things to fix.

The comment still reads "assumes that is is run from EL2".  If you would
like the correction, the line should be:

   * This code assumes that it is run from EL2, and that it is part of

and I will send it as a single patch, or leave it for whoever next
touches the file, whichever you prefer.

Thanks for catching it,
Hemanth


