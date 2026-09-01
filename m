Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2718C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 08:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+NB8kXEuSYL9KHpcK9ADFRjV/ISbKtGYd98joTGYzk0=; b=WbQhYgAPcMAutTboE18AuL7W1Z
	EapAyugGjLTS7SxXeimAopWYhiJaFbNnCeOu9rrMNEeuNgXadCI0XcASjRImSdkcUNm6WAh656xEy
	BLLplGHSBsw++w2wStPr0f7fGTWWurIU693/jbWKkR8CZI7Tk97GUkWEi7yRJ+hajVG1RX3AMiifV
	uhbdbm5H2RMpZSd9mYhyKWgAxbZZNvB4UwlMFIxzg6zejZwF9Qlf2fP4wtOlttCJsiAn40Lcu0cUs
	XMAyxw8z/REa2SsN5xAEjgpuOXBSkPLvndbAjt1nMaQDXBWAM6njN3sVHa0HDvlzADG2TtSsLMb/U
	mSltQzTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1K4z-0000000BJlB-2uDn;
	Tue, 01 Sep 2026 08:42:53 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1K4x-0000000BJkN-2wRx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 08:42:52 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c2529b3139fso88736866b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 01:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788252170; x=1788856970; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+NB8kXEuSYL9KHpcK9ADFRjV/ISbKtGYd98joTGYzk0=;
        b=AfLVFRmXMk6uPBTIpxARjHZ7knx9DV7zHQOTD1e4PA2/D2jCo6umdVfeApnBe2jE2F
         J11F2ljz8c6OOVaTjagnGlA4kuCIFJXoYqBm4ovu7uHILW+hn94OVT81Way72zucmRZ5
         wo7uV74+MRjiOoUMVI4iaDK80oBWjDul7g5zkPOIRBPNdTDwlkYp57XdML0RKmtxJopu
         2Qgf8IjqMVQl67l13vRO6+mQEjcnpwN7d9scH15F26jLz9BnINiPb+zqs+aZUQXFfSHH
         Qh4OASURJ84y7TAF8U8/ndu1sYjbggP6vzhCcGza80Swenve8CoHZmLOQwsBdIWsFraz
         VxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788252170; x=1788856970;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+NB8kXEuSYL9KHpcK9ADFRjV/ISbKtGYd98joTGYzk0=;
        b=QlBp4q93GSFu/RhZ+H9bUdfJ7Bj5R4WIliDynTcQUq2/v0DGWlsCh4qp6sXhf39UYe
         jLYFX2gqNF0YspQeM5VHpdNewRMjRCEAPm8FsFESS8c48Si95KgsEMUK1Iu5kCVnmobM
         EHPQOpA/RoNwrrT3SnjmpEmfTf4z/NA+hL8HhkJ8THPxA0PEUaOWl1Wrk2ZlO4ibpDU8
         asXN6jjYdM31BaT51kvzYCXfRsUx6WbXmJ7y+o45b1B8b+WhbHNRHa6k12H9WWQNcRpj
         EA1NwVk/4Y8LE/bcl5XCKkWYmhQ76p/0+atBeqRkdoQ97Xs0U/qdc5Lh6cMT0K/T7ko3
         YgSg==
X-Forwarded-Encrypted: i=1; AHgh+RodSHRvTiz2sLPBZhtyFVn7vfDTjjOKAIiaKQRqjrhN76ZFylkE5qw/EmxZSIOFYZRV/+kQlLuNWAHh0YGTmOUN@lists.infradead.org
X-Gm-Message-State: AFuF++k/xfPFCAgJP+oevIFEivyTxXNLKO4NrBjEfZO2NmAwoQWHi7qr
	961ybdEu5mW+X2FSfh1cNnO6v/3aS4bAvNv5mjflYH2wLMM5kQ1uPWJ2
X-Gm-Gg: AR+sD13sEa8UEvKQR7NrVPOsi2oDuTtd9DcFNAARdymCVOwu/KJ2gJphlbmUuI0DuOc
	5lSQPpp8JdIFOEkm/lw5pQXqw6fYHKaFOXuN9vTPCrmB+3iY55ALTK+ZfSP1F7rvLBIYuhbgAVu
	Ez42aaEzCpRC4hKOYZDCxtowCfocuqMuMGpNLCfzeMHhetwvXvMg4tITUMKCWhTZJfNTT3Im+pt
	37svXTXDw+57sQW3FUDGigwhi3RrQ4MBI00sbNpq+24YDuythye4A62VbpbQOFsul10L2bcUC5h
	VDaed9r9OyxL01C/K940ANxpjpzTfHgBwS/nWoZM/+WeTg1I0U1qbzcFboav9bMEuxSKuTI8+g5
	PkDjoHKCYFHckDIrwUFOhJ03BahNpC+Gc9qhP3dNfbiRBQWVG96gRCIVwGNjDFujPGKUKCfAgL4
	Rc84tRPXF0yWPW/vJbZ8vSATLbL/y2kByTu654k8EekqpcJHEN6ZgpYVq2DFvWgNSIBK5/4J/e5
	DWnECTQY/bRzPXFp1rImv0=
X-Received: by 2002:a17:907:c491:b0:c20:53c7:488d with SMTP id a640c23a62f3a-c25572036b9mr1872224266b.14.1788252169492;
        Tue, 01 Sep 2026 01:42:49 -0700 (PDT)
Received: from [192.168.1.89] (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f23cf9fsm543163366b.53.2026.09.01.01.42.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 01:42:49 -0700 (PDT)
Message-ID: <7adfefaa-91c5-4bf4-ff98-5dfbba0eac96@outbound.gmail.com>
Date: Tue, 1 Sep 2026 10:42:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
From: Eli Billauer <eli.billauer@gmail.com>
Subject: Re: [PATCH 2/4] char: xillybus: replace __get_free_pages() with
 kmalloc()
To: Mike Rapoport <rppt@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Brad Warrum <bwarrum@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michal Simek <michal.simek@amd.com>, Ritu Agarwal <rituagar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org
References: <20260830-char-misc-v1-0-05e2ce44f291@kernel.org>
 <20260830-char-misc-v1-2-05e2ce44f291@kernel.org>
 <f6001085-9234-4025-ff34-6cc4a66c293a@outbound.gmail.com>
 <apVmYXlqsVr_p4Oc@kernel.org>
Content-Language: en-US
In-Reply-To: <apVmYXlqsVr_p4Oc@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_014251_749486_9727F95C 
X-CRM114-Status: GOOD (  11.01  )
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

On 31/08/2026 13:32, Mike Rapoport wrote:
> For large sizes kmalloc falls back to page allocator anyway.
> 
> And the doc is out of date unfortunately.

I think it would be a good idea to update the doc first, and by doing so 
officially change the API. After getting this change approved, it's 
indeed safe to rely on kmalloc() even for larger memory allocations.

Regards,
    Eli

