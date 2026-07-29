Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1DBC53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 15:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZhVGx2M8iOI7b0Qk6w6OOBniMXSCzyM1lZLJihM2lc=; b=eCXewQUDJLAjDdO0Wrx2TyLDVB
	QCoWStK5VNVufcOK5srhPghmyL1B+Hywz/tUx81Hfs3ObB+ktKEj5g2UHcBFX1kcSeEMnJIfU+N37
	hQX7geCNMrSEGHtxt1sWIsMzvcEAcIIZkQTH5lpCqpFc9ne+NCW8jesVTd7swFOrBk0fenRagFZ+B
	0CPcrXiNfvpsyrgicEPWudTYpXh29kZKTlebMgTJWAcXbNORucD3lwdABQK2HjrVXGYxoZW6Bjv3v
	dd27VRcyAnqrrRNeivcn7abp2Ln0EKSDYWcOIW2B9rXJHhdDzmxieMNsKMcKh/QjWb3MnxoUXbldi
	234eBLhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6AE-00000008OjV-3DOO;
	Wed, 29 Jul 2026 15:25:46 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6AC-00000008Oj3-2yO9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 15:25:45 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c96d7933910so127238a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 08:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785338743; x=1785943543; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XZhVGx2M8iOI7b0Qk6w6OOBniMXSCzyM1lZLJihM2lc=;
        b=TFX7KjDamPjasKH5dhwKcbBcUE27kXGmDnB65NqCAA3YTcczxnT1SjLOZIWuffpyBb
         Z9vaN20WJLNv8I9NCQ6Yva4MTJjs2B7JdrbwkWkwSDR58MFQ1I5psNrXIqFnOas8xde+
         bs8AsN5Y/M31kOYk6UyJQUV8rCDjJ3aFotXyhA/6RSqcvhZpL3QVNEBELpQCihoOOvAm
         sn/ofzKwBRFDFZiOVhaTN/Lmyn5Zf8hsyq3fPhbS+Jgy6N5bRlbpSBx8a+GrX3uvpSOg
         zhLf/N1CAVAeNJjWuI86e4xs90R/Iygr4n5cPdBdcrWp7kWPg0Ie+XEkKqOyRh7A+JYM
         dELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785338743; x=1785943543;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XZhVGx2M8iOI7b0Qk6w6OOBniMXSCzyM1lZLJihM2lc=;
        b=NrdwPS4n27ZxyhdYICjJLmyBL8Bf9J7ExcbIGqZ0blvYxJsBECHaXIwi1JUCWOX0TG
         nuZgQ8SBzO+01QJeDpMmvhCFJCUsu1odTt1ICIh+egncGZ6wA/8+uEbjKroBS6Qce1pK
         eL639FbfqXbtQDO46ysUjBMskLYB1vCXL0SED94Lo60+vgu9FYmPZIG1Dw+V7qmy0QvT
         58iKLgpSU5lpP6jVHYFs48SHeTvX+3Jo4MkaUsrkvnE8PfNf6P1y5WR5qRE5VTMFZLSM
         4JWECv7mOMi5KOEuSBKnqQk90eiOPkgkQIOgg7N7XsXh3qcl2abUh4OEmviPCevqrb+x
         jJIg==
X-Forwarded-Encrypted: i=1; AHgh+RpQDBCR7MN/S5F4Xvl91bX75CFdmBhMTXa4OKB4vG2AOk0xah6fdZuWLkEpM09KbNztVDd4qHkLsX86TCHkLgtt@lists.infradead.org
X-Gm-Message-State: AOJu0YyXUWRZr/Ni1/kUVTI2zyynHq6+yi5vpBEMoTfQbfxg6qhx3OKV
	t0xnNgzQvAjxV/1c5TZFcGhEFButqu5K9uSxoKd79twCV/fxrKuNwuer
X-Gm-Gg: AR+sD10ioieb+96m/OnG4XVYS+5GS1wNlq8yYZVQJjHAaDDMsKK0hXOzKBypa+yIAX+
	AsVt/mRYEfDC2FjJ9qoL/jgZayJjCXyScA8yoFfgWVh41Hc+HoJjONAVSP5DL/8a03i47M8QLBq
	ifzvcDAIlGxQH5Q1Dhh6yn0acjSNC1PJ0RQ6bl9jSvI+I1RYsUIKqXONL4N34UFIU7INpLxZGBo
	Kw1fKcE+NM62bZXVoRweQ0DC17GH6HpdGN4yA4iY5XXZP2e4IuSxCb9tC6/9Fi7/2x4jYd4Gkh/
	djfD4Gsvm9TlkQQoWNO17NoOjP9hFjXIfU+dGziYV53xJ/kDbJKs0LRrpQgRKzIFP1WdrV2+GqO
	h/DiYNOCW6BziuMhqA0BaQgLe1GWEwsEHMUya9MzVRACTnc0eGgf3BxJpa/U9ULyFQCg8SN3MKF
	BdVEUSXs8txWXkXAv5t5e6t+q+uXv7DHV1zBQHOuJ8oAqTOoWlj3i410Yyp+o8uAYtaG7/80IvM
	rbBGgya35JXxKv0xwMHOPjXHgUK4Sx2M/sC2to0G8jWm4ARxd+YDyv+PydEZTw=
X-Received: by 2002:a05:6a21:3212:b0:3c6:61b9:9162 with SMTP id adf61e73a8af0-3c8ba675ae0mr7418062637.3.1785338743236;
        Wed, 29 Jul 2026 08:25:43 -0700 (PDT)
Received: from debian.lan ([155.117.85.23])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0055133sm1619666b3a.18.2026.07.29.08.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:25:42 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: akpm@linux-foundation.org
Cc: xueyuan.chen21@gmail.com,
	linux-mm@kvack.org,
	david@kernel.org,
	ljs@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	luto@kernel.org,
	peterz@infradead.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	jannh@google.com,
	yang@os.amperecomputing.com,
	rppt@kernel.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org
Subject: Re: [PATCH v5 0/3] mm: make persistent huge zero folio read-only
Date: Wed, 29 Jul 2026 23:25:31 +0800
Message-ID: <20260729152531.1966932-1-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260727113530.5cd347581a66b3279490a604@linux-foundation.org>
References: <20260727113530.5cd347581a66b3279490a604@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_082544_749063_A5AF1D83 
X-CRM114-Status: GOOD (  12.12  )
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


On Mon, Jul 27, 2026 at 11:35:30AM -0700, Andrew Morton wrote:
>On Mon, 27 Jul 2026 22:34:23 +0800 Xueyuan Chen <xueyuan.chen21@gmail.com> wrote:
>
>> The persistent huge zero folio is shared globally and should stay zero
>> after initialization. As Jann Horn pointed out[1], kernel bugs have ended
>> up writing to pages that were meant to be read-only, including in
>> security-sensitive cases. Making the folio read-only in the direct map
>> turns such writes into faults instead of silent zero-page corruption.
>> 
>> This series adds set_direct_map_ro_noflush() so mm code can make a
>> direct-map range read-only, then uses it for the persistent huge zero
>> folio. The helper is direct-map specific, takes an address-based range as
>> discussed for set_direct_map* helpers[2], and leaves TLB invalidation to
>> the caller.
>
>Thanks.  AI review asked about a few things, some pre-existing.  Includes
>a possible pre-existing ARM barrier issue in arch/arm64/mm/pageattr.c
>	https://sashiko.dev/#/patchset/20260727143426.1077133-1-xueyuan.chen21@gmail.com
>

Hi Andrew,

Thanks. The highmem case is valid. A highmem folio has no permanent
direct-map mapping, so v6 will skip the permission update and TLB flush
in that case.

The huge_zero_pfn race is addressed by Lorenzo's mm-hotfixes series:

https://lore.kernel.org/r/20260728-fix-refcounted-huge-zero-v1-0-3f261f5447b4@kernel.org

I don't think the MTE report needs a change. Commit 1d0cb4c8864a
("arm64: mte: Ensure the cleared tags are visible before setting the
PTE") added the smp_wmb() specifically for this ordering.

I'll send v6 shortly.

Thanks
Xueyuan

