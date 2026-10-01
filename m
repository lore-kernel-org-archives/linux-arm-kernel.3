Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B4D3CA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 13:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qPY8F3aZkZdZdkDBNIxoLwQnRsRRPFn4RgfhzHvta1I=; b=FBkAGc3nnZ5YFchL4PKPWsEvhs
	XN9OW2s0s+MatURI3aBuFrVoaqfX7hKUBb+i2J5Aym3BNVr92jHpxJXZanoM4d6FdB/amXy84A3Vi
	d89Awu4tfNsfe9VoDENcnwSBEcmkPY2bHnA3sKQbhNiiIQglr4a24ZiiG3XG1v+CoH1bjEbpVDjtM
	4lCXD68VtEsYU1kXZCKI6CjFqBJqVGQy5qCBZhqqoJiU7KoPu2FEHES0yF5CiPOVy1HyDRXyZvdV6
	Ctd9QhR5SuQxi4o1tqigz/5c3JdFO0hemRAWl49kq0MBPeYGW9KfJM/o2jcWr/EHYdv03XIHJpXR0
	N/4qzVAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGa3-00000009BWi-21cc;
	Thu, 01 Oct 2026 13:12:11 +0000
Received: from out-92.mta1.migadu.com ([95.215.58.92] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGa0-00000009BVU-0wyM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 13:12:09 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=qPY8F3aZkZdZdkDBNIxoLwQnRsRRPFn4RgfhzHvta1I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790860326; v=1; x=1791465126;
 b=ZznesNK77IZmbO/pzWvovN9++xfOpgkWdJRAWn0RAinmuCIBpSWOVKE2rmWlEtnWD2qX1U0e
 ixKHl2tGPp/iQQBvrNowt38ZGoW9PlezlrPYXz2WFuPm9CnidMdSLjo1Y8UJD1pp+9Pq7ee/fhj
 pspKQuwxTUsK8/yPKQBwNMUU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id f27debb46c0c5757;
	Thu, 01 Oct 2026 13:12:06 +0000
X-Mizu-Trace-ID: f27debb46c0c5757
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5ba4065fa07so7587e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 06:12:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByLZn4YqQrqyW3IEhySkhLpNVSj8l1ApnTWzaU6DH/v95iKsbBdt7jfRp+dr9AJXn5N6CDG0j/zGTmp3WvDKa0U@lists.infradead.org
X-Gm-Message-State: AFq9FYInZykxvck8dfZOZgX/XSIwg1kvDJ8vTZxaNyI7aWJM7VAVtsY8
	9gq2Q/P7g4K7jjzTeAhXprhKMRF2H2iVV/HZvnRwigNibhAXlih4Vj2e35m1hGFcMiEd7rhSHIO
	JnBLYz0bRvjSDX3sgw18R1gpZw/lYRyzG1zRpyXpC
X-Received: by 2002:a05:6512:6411:b0:5b8:f20b:350c with SMTP id
 2adb3069b0e04-5ba43805629mr146508e87.3.1790860321116; Thu, 01 Oct 2026
 06:12:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260914113338.159227-1-fuad.tabba@linux.dev> <20260914113338.159227-11-fuad.tabba@linux.dev>
 <arK1tHUEJsCQEKzn@google.com> <CA+EHjTx+foVF4CRU5D8bQv8bAqDphMN12UrV+_doUryn2ow6bg@mail.gmail.com>
 <arTfjgvZIhmXLrw1@willie-the-truck> <CA+EHjTxe0JE-tCX4YcEEafdnxjuZLj3EBucZfZF0HCP2PQAekg@mail.gmail.com>
 <arUUCFHamX1nOrB1@willie-the-truck> <CA+EHjTyWDvVc4B0mF8+N3QJ=gVPGEY-pxPGZWuTLK6Y=PZnF1w@mail.gmail.com>
 <ar5Y2Usv-t0FggVA@willie-the-truck>
In-Reply-To: <ar5Y2Usv-t0FggVA@willie-the-truck>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 1 Oct 2026 14:11:24 +0100
X-Gmail-Original-Message-ID: <CA+EHjTz9DYGa0nZKRFL9ADW6QteugRyepdvE0Q6qJRUsbR-MYA@mail.gmail.com>
X-Gm-Features: AclHuK91vl67_Aq7uOGWFfqQ3FxG97CsxRtiah5XT6CIp7Z_3LPr6IKz4T7UkZM
Message-ID: <CA+EHjTz9DYGa0nZKRFL9ADW6QteugRyepdvE0Q6qJRUsbR-MYA@mail.gmail.com>
Subject: Re: [PATCH v3 10/18] KVM: arm64: Handle PSCI calls for protected VMs
 at EL2
To: Will Deacon <will@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, maz@kernel.org, oupton@kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, catalin.marinas@arm.com, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, steven.price@arm.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_061208_648963_1DECF319 
X-CRM114-Status: GOOD (  11.18  )
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

Hi Will,

On Thu, 01 Oct 2026 13:58:01 +0100, Will Deacon <will@kernel.org> wrote:
[...]
> For the benefit of everybody else, we had a fire alarm in the office
> yesterday evening so Fuad and I sat outside a bar with a beer and a
> piece of paper and went through this together...

Memory ordering is hard work...

[...]
> If we address (2), then I think the sequence becomes a little easier to
> reason about. The OFF->ON_PENDING transition on the requestor looks
> like:
[...]
> which I think makes sense. WDYT? If you agree, I wonder if we can
> include a comment similar to the above in the code?

Agreed, and thanks for going through it with me (and for the beer!).
v4 already clears reset on the CPU_OFF path rather than on guest
entry, and I'll add your sequence as a comment above
pkvm_reset_vcpu().

Cheers,
/fuad

