Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB938D59D8E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 19:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=d3xY+Tt5F2lAixFNz0erCGqfYwIxB2/c8x9QCfBSFMk=; b=rdC3/hIIF999iG
	WgYdwScIlnK/anK4jsClw7fUcvoRP6IM8xuP3nN0R1LRkm/aY+4f/MeAlhWgziHwvH3wViLA0I5qT
	wOtZGP0lu0/OmNv5kmo211zRf0/mvPAvrUd0P8ngRyaSIw4C4rZvpJGKJJGpw4wFMC3vbC2++cvMK
	Ph+0TURLwB6l4LHpESbtsr7JPKpCapCj9cT9sFLHx/IgtN241UzQYkrSfqNj+7cJnPsYF8r+Ug5Un
	KEGWrwTbtgGbyUUj+NSvRyLaV3jw1oft4qyhxXAqCmxFFREGaf7kFWxP7ZHEf5Wzsugulcc8NLBrZ
	lRCGHiqw8uahWWoKXyRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU8iN-00000000zDn-3y7b;
	Fri, 12 Dec 2025 19:22:07 +0000
Received: from mail-oo1-xc4a.google.com ([2607:f8b0:4864:20::c4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU8iL-00000000zDS-0NJ3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 19:22:06 +0000
Received: by mail-oo1-xc4a.google.com with SMTP id 006d021491bc7-6574475208eso1181939eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 11:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765567323; x=1766172123; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d3xY+Tt5F2lAixFNz0erCGqfYwIxB2/c8x9QCfBSFMk=;
        b=3LSH2tjL7xbFukSagjDYeKrZ8VahVvIY71DVQkDL1xNkJsW806Q8vds48tMVuCRvOs
         muviqO+r6L2OZWu/DTVUJND/12rdeETCNkU5S+fSI0ZqtAY0NMxpF/wvyyqrB5u9EU/W
         Jv4Ru43vITBvFumVjR4GNWQxwrm6MnMRJlUHifmtfQj5X2rvHN8u3qdDD5cCzzZHqPq9
         IzmDTUI0GDbks8dos/PycAwn+hX7UN0LoDntqZdl4OvJS+xLA2WoQr+uSqWWPBmZAi2o
         LV/Tnvxs0npWzolP65c1RrPF5ILvbX2y87dRIR+nQi7kfsdVG1FlZzuWF25QW059UG8C
         kOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765567323; x=1766172123;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d3xY+Tt5F2lAixFNz0erCGqfYwIxB2/c8x9QCfBSFMk=;
        b=dzED4bkqytOKsqC4ne33ibNOL3V6NkJLgyI4yt2Umeu99bSO2/4g4QppOrwPJiYJJM
         /YAA9cxWcl1wYCzfU0PBBsP8b3xsg8a8HUaf67I4+vqHA874rnUzIw5mAqpzPbkOyGSy
         ikIdVz2fV5CroBf2+H6WlKFVUrcNFR1MeKRfqiBfc8EMQsyfomg7PL91H677ujiWEUwH
         ssOpbwk9fWVzXDAmPXoVeK7bCTK5ONztDl4P6WynSpw1xxM866og8h1D0tnKpstQ9ivS
         1SF0fz+qHqrfkWrykWIR5Nkk+dN7Ga1UPcUZP71tPXnxGDB/JyM91nsNVPh4gawGvko1
         6Mjw==
X-Forwarded-Encrypted: i=1; AJvYcCXBVJSWiAisdREaCqDKqhLNFqKSidu3Dhar6wWi+eCSJ+TfcucMnhJihvqyYf7WemF9h3kdxQxyuNucHDw6ppmX@lists.infradead.org
X-Gm-Message-State: AOJu0YyT0fcf8TcQCntgjQm2QxgRcQBDmtECr6z/CiL3YQeWKUyfTKuC
	ifw4CrRfv+0uWtQeW9mY7V05z9P6D6HO5dd/74hUrgOM+jzzBqHfTruwxiPPn0/tAmHbdmtD6Y1
	7UKwS7yM3H/G8ZHBzrt4WRW6t1Q==
X-Google-Smtp-Source: AGHT+IHUbVv4Jy2gEZEkXkuyNos7MiNpoCrDqCxYPzir5lZi9qw+P8UnFJM3AYzANnUq+aZp9M70/ycADG43mzjJoA==
X-Received: from ilbeb21.prod.google.com ([2002:a05:6e02:4615:b0:438:317f:a956])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:290e:b0:659:9a49:90d4 with SMTP id 006d021491bc7-65b4523a33dmr1491761eaf.83.1765567323163;
 Fri, 12 Dec 2025 11:22:03 -0800 (PST)
Date: Fri, 12 Dec 2025 19:22:02 +0000
In-Reply-To: <d3e946ec-787a-424a-9a7a-f04aeb490ba6@arm.com> (message from
 Suzuki K Poulose on Wed, 10 Dec 2025 10:54:10 +0000)
Mime-Version: 1.0
Message-ID: <gsnt7bur4iat.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v5 01/24] arm64: cpufeature: Add cpucap for HPMN0
From: Colton Lewis <coltonlewis@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com, 
	shuah@kernel.org, gankulkarni@os.amperecomputing.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_112205_133460_D67354EA 
X-CRM114-Status: UNSURE (   6.52  )
X-CRM114-Notice: Please train this message.
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

Suzuki K Poulose <suzuki.poulose@arm.com> writes:

> On 09/12/2025 20:50, Colton Lewis wrote:
>> Add a capability for FEAT_HPMN0, whether MDCR_EL2.HPMN can specify 0
>> counters reserved for the guest.

>> This required changing HPMN0 to an UnsignedEnum in tools/sysreg
>> because otherwise not all the appropriate macros are generated to add
>> it to arm64_cpu_capabilities_arm64_features.

>> Acked-by: Mark Rutland <mark.rutland@arm.com>
>> Signed-off-by: Colton Lewis <coltonlewis@google.com>

> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Thanks Suzuki!

